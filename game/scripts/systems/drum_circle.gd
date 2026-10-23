class_name DrumCircle
extends RefCounted
## The drum circle (the client's spec, Sep 11 2026). Nobody announces one:
##   1. the spark: anyone taps any surface. No prompt, no UI. The game listens.
##   2. the pull: when a second tapper joins (a player or Pluck), the circle ignites.
##   3. no wrong beat, no score, and taps are never snapped to a grid. The circle
##      only measures the hands' own tempo and reflects it back.
##   4. rhythm is the handshake: play a pattern twice and it's yours; when someone
##      plays your pattern back to you, you both get a quiet recognition.
##   5. long circles drift toward the 50 BPM heartbeat. Never forced: the players'
##      own tempo always outranks the pull.
## Circles live wherever the taps are. Taps within circle_radius of an active
## circle join it; anywhere else starts a new spark.

var cfg: Dictionary = {}
var circles: Array = []


func _init(config: Dictionary = {}) -> void:
	cfg = config if not config.is_empty() else GameData.world.get("drum_circle", {})


func _f(key: String, fallback: float) -> float:
	return float(cfg.get(key, fallback))


## A tap. Returns { circle, ignited_now, recognized: [[owner, player], ...] }.
func tap(who: String, pos: Vector3, surface: String, t: float) -> Dictionary:
	var c := _circle_for(pos, t)
	c["taps"].append({ "who": who, "t": t, "surface": surface })
	c["last"] = t
	var cutoff := t - 30.0
	c["taps"] = c["taps"].filter(func(x: Dictionary) -> bool: return float(x["t"]) >= cutoff)
	var out := { "circle": c, "ignited_now": false, "recognized": [] }
	if not bool(c["ignited"]) and tappers_within(c, t, _f("ignite_window_s", 4.0)).size() >= 2:
		c["ignited"] = true
		c["ignited_at"] = t
		out["ignited_now"] = true
	_learn_pattern(c, who)
	out["recognized"] = _check_take_up(c, who)
	return out


func _circle_for(pos: Vector3, t: float) -> Dictionary:
	var radius := _f("circle_radius", 7.0)
	var best: Dictionary = {}
	var best_d := INF
	for c in circles:
		var d: float = (c["center"] as Vector3).distance_to(pos)
		if d <= radius and t - float(c["last"]) <= _f("circle_timeout_s", 8.0) and d < best_d:
			best = c
			best_d = d
	if best.is_empty():
		best = { "center": pos, "taps": [], "ignited": false, "ignited_at": 0.0, "started": t, "last": t, "patterns": {}, "met": {} }
		circles.append(best)
	return best


## Ends circles nobody has tapped for a while. Returns the ones that ended.
func tick(t: float) -> Array:
	var ended := circles.filter(func(c: Dictionary) -> bool: return t - float(c["last"]) > _f("circle_timeout_s", 8.0))
	circles = circles.filter(func(c: Dictionary) -> bool: return t - float(c["last"]) <= _f("circle_timeout_s", 8.0))
	return ended


func tappers_within(c: Dictionary, t: float, window: float) -> Array[String]:
	var seen := {}
	for x in c["taps"]:
		if t - float(x["t"]) <= window:
			seen[String(x["who"])] = true
	var out: Array[String] = []
	for k in seen.keys():
		out.append(String(k))
	return out


func _times_of(c: Dictionary, who: String) -> Array[float]:
	var out: Array[float] = []
	for x in c["taps"]:
		if String(x["who"]) == who:
			out.append(float(x["t"]))
	return out


## One tapper's own tempo from the gaps between their taps (median, so a
## pause or a flourish doesn't throw it). 0 when there isn't enough to tell.
func tempo_of(c: Dictionary, who: String) -> float:
	var times := _times_of(c, who)
	if times.size() < 3:
		return 0.0
	var gaps: Array[float] = []
	for i in range(maxi(1, times.size() - 8), times.size()):
		var g := times[i] - times[i - 1]
		if g > 0.12 and g < 3.0:
			gaps.append(g)
	if gaps.is_empty():
		return 0.0
	gaps.sort()
	return 60.0 / gaps[gaps.size() / 2]


## The circle's own groove: the median of everyone's tempo. Never quantized.
func measured_bpm(c: Dictionary) -> float:
	var tempos: Array[float] = []
	for who in tappers_within(c, float(c["last"]), 12.0):
		var b := tempo_of(c, who)
		if b > 0.0:
			tempos.append(b)
	if tempos.is_empty():
		return 0.0
	tempos.sort()
	return tempos[tempos.size() / 2]


## What the tempo ring shows: the circle's groove, eased a little toward the
## heartbeat the longer the circle lasts. At most drift_max of the way, so a
## circle at 137 BPM stays a circle at 137 BPM if that's what the hands want.
func reflected_bpm(c: Dictionary, t: float) -> float:
	var m := measured_bpm(c)
	if m <= 0.0:
		return 0.0
	var age := t - float(c["started"])
	var k := clampf(age / _f("drift_full_s", 600.0), 0.0, 1.0) * _f("drift_max", 0.25)
	return lerpf(m, _f("heartbeat_bpm", 50.0), k)


# ---------------------------------------------------------------- rhythm is the handshake

## A pattern is the shape of a few taps: the gaps between them, as fractions of
## the whole, so the same rhythm at a different speed still matches.
static func shape(times: Array) -> Array[float]:
	var gaps: Array[float] = []
	var total := 0.0
	for i in range(1, times.size()):
		var g := float(times[i]) - float(times[i - 1])
		gaps.append(g)
		total += g
	if total <= 0.0:
		return []
	for i in gaps.size():
		gaps[i] /= total
	return gaps


static func shapes_match(a: Array[float], b: Array[float], tolerance: float) -> bool:
	if a.is_empty() or a.size() != b.size():
		return false
	for i in a.size():
		if absf(a[i] - b[i]) > tolerance:
			return false
	return true


## Tap a pattern twice alone and the ring marks it as yours.
func _learn_pattern(c: Dictionary, who: String) -> void:
	var n := int(_f("pattern_taps", 5))
	var times := _times_of(c, who)
	if times.size() < n * 2:
		return
	var a := shape(times.slice(times.size() - n * 2, times.size() - n))
	var b := shape(times.slice(times.size() - n, times.size()))
	if shapes_match(a, b, _f("pattern_tolerance", 0.18)):
		var patterns: Dictionary = c["patterns"]
		if not patterns.has(who):
			patterns[who] = b


## Someone plays your pattern back: the recognition, once per pair per circle.
func _check_take_up(c: Dictionary, who: String) -> Array:
	var out := []
	var n := int(_f("pattern_taps", 5))
	var times := _times_of(c, who)
	if times.size() < n:
		return out
	var mine := shape(times.slice(times.size() - n, times.size()))
	var patterns: Dictionary = c["patterns"]
	for owner in patterns.keys():
		if String(owner) == who:
			continue
		var key := "%s>%s" % [owner, who]
		if c["met"].has(key):
			continue
		var theirs: Array[float] = []
		theirs.assign(patterns[owner])
		if shapes_match(mine, theirs, _f("pattern_tolerance", 0.18)):
			c["met"][key] = true
			out.append([String(owner), who])
	return out
