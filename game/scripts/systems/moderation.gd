class_name Moderation
extends RefCounted
## The Common Room's rules, the same as the client's live backend
## (docs/library/functions/geodeInnCommonRoom.ts). No admin, no reports, no
## mutes, no records. The architecture is the defense:
##   - the threshold: a new traveler warms by the fire 45 s before speaking
##     (120 s while the room is heightened)
##   - the frog cooldown: nobody can frog anyone in their first 2 minutes
##   - 3 different travelers frogging the same person transforms them; a frog's
##     name becomes a frog name and every line comes out as a ribbit, until they leave
##   - 3 transformations and the swamp claims them: removed, and the room is
##     heightened for 5 minutes
## Nothing here is written to disk. When a traveler leaves, they are gone.

var cfg: Dictionary = {}
var travelers: Dictionary = {}      # peer -> record (see join)
var heightened_until := 0.0
var _flood: Dictionary = {}         # peer -> Array[unix], server safety only
var _rng := RandomNumberGenerator.new()


func _init(config: Dictionary = {}) -> void:
	cfg = config if not config.is_empty() else GameData.world.get("moderation", {})
	_rng.randomize()


func _f(key: String, fallback: float) -> float:
	return float(cfg.get(key, fallback))


func is_heightened(now: float) -> bool:
	return now < heightened_until


func threshold_s(now: float) -> float:
	return _f("speak_threshold_heightened_s", 120) if is_heightened(now) else _f("speak_threshold_s", 45)


## A traveler sits down. Blank names become a random stone name; a name already
## by the fire gets a letter added, like the site does.
func join(peer: int, requested: String, now: float) -> Dictionary:
	var name_wanted := requested.strip_edges().substr(0, 30)
	if name_wanted.is_empty():
		name_wanted = random_stone_name()
	var taken := {}
	for p in travelers.keys():
		if int(p) != peer:
			taken[display_name(int(p))] = true
	var final_name := name_wanted
	while taken.has(final_name):
		final_name = "%s-%s" % [name_wanted, char(65 + _rng.randi_range(0, 25))]
	var rec := {
		"name": final_name, "joined": now,
		"can_speak_at": now + threshold_s(now), "can_frog_at": now + _f("frog_cooldown_s", 120),
		"is_frog": false, "frog_name": "", "frog_count": 0, "frogged_by": [],
	}
	travelers[peer] = rec
	return rec


func leave(peer: int) -> void:
	travelers.erase(peer)
	_flood.erase(peer)


func has(peer: int) -> bool:
	return travelers.has(peer)


func display_name(peer: int) -> String:
	var rec: Dictionary = travelers.get(peer, {})
	if rec.is_empty():
		return ""
	return String(rec["frog_name"]) if bool(rec["is_frog"]) else String(rec["name"])


func is_frog(peer: int) -> bool:
	return bool(travelers.get(peer, {}).get("is_frog", false))


func speak_wait(peer: int, now: float) -> float:
	return maxf(0.0, float(travelers.get(peer, {}).get("can_speak_at", 0.0)) - now)


func frog_wait(peer: int, now: float) -> float:
	return maxf(0.0, float(travelers.get(peer, {}).get("can_frog_at", 0.0)) - now)


## A line said by the fire. Returns { ok, text, error }.
func say(peer: int, text: String, now: float) -> Dictionary:
	if not travelers.has(peer):
		return { "ok": false, "text": "", "error": "You are not in the Common Room." }
	var wait := speak_wait(peer, now)
	if wait > 0.0:
		return { "ok": false, "text": "", "error": "You're still warming by the fire... %ds" % int(ceil(wait)) }
	var clean := text.strip_edges().replace("\n", " ").substr(0, int(_f("chat_max_len", 500)))
	if clean.is_empty():
		return { "ok": false, "text": "", "error": "Nothing to say." }
	var times: Array = _flood.get(peer, [])
	times = times.filter(func(t: float) -> bool: return now - t < 10.0)
	if times.size() >= int(_f("flood_per_10s", 8)):
		_flood[peer] = times
		return { "ok": false, "text": "", "error": "Slow down a little. The fire's still listening." }
	times.append(now)
	_flood[peer] = times
	if is_frog(peer):
		clean = random_ribbit()
	return { "ok": true, "text": clean, "error": "" }


## One traveler frogs another. Returns { ok, error, votes, transformed, frog_name, claimed }.
func frog(voter: int, target: int, now: float) -> Dictionary:
	var out := { "ok": false, "error": "", "votes": 0, "transformed": false, "frog_name": "", "claimed": false, "old_name": "" }
	if not travelers.has(voter):
		out["error"] = "You are not in the Common Room."
		return out
	if frog_wait(voter, now) > 0.0:
		out["error"] = "You haven't been by the fire long enough. The community doesn't know you yet."
		return out
	if voter == target:
		out["error"] = "You cannot frog yourself."
		return out
	if not travelers.has(target):
		out["error"] = "That traveler is no longer here."
		return out
	var rec: Dictionary = travelers[target]
	var by: Array = rec["frogged_by"]
	if voter in by:
		out["error"] = "You have already frogged this traveler."
		return out
	by.append(voter)
	out["ok"] = true
	out["votes"] = by.size()
	if by.size() >= int(_f("frog_votes_needed", 3)):
		out["old_name"] = String(rec["name"])
		rec["frog_count"] = int(rec["frog_count"]) + 1
		rec["is_frog"] = true
		rec["frog_name"] = random_frog_name()
		rec["frogged_by"] = []
		out["transformed"] = true
		out["frog_name"] = rec["frog_name"]
		if int(rec["frog_count"]) >= int(_f("frog_transformations_to_remove", 3)):
			out["claimed"] = true
			leave(target)
			heightened_until = now + _f("heightened_s", 300)
	return out


func random_stone_name() -> String:
	var names: Array = cfg.get("stone_names", ["Quartz"])
	return "%s-%s" % [names[_rng.randi_range(0, names.size() - 1)], char(65 + _rng.randi_range(0, 25))]


func random_frog_name() -> String:
	var names: Array = cfg.get("frog_names", ["Tadpole"])
	return "%s-%d" % [names[_rng.randi_range(0, names.size() - 1)], _rng.randi_range(1, 99)]


func random_ribbit() -> String:
	var r: Array = cfg.get("ribbits", ["ribbit"])
	return String(r[_rng.randi_range(0, r.size() - 1)])


func random_fire_line() -> String:
	var lines: Array = cfg.get("fire_ambient", [])
	return "" if lines.is_empty() else String(lines[_rng.randi_range(0, lines.size() - 1)])
