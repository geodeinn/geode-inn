class_name FinalRoomRules
extends RefCounted
## Entry to the Final Room, per the client's mechanic spec. The room is earned
## by accumulation, all seven conditions at once, and the player is never told
## the conditions exist. What the game tracks lives in profile["final_room"].


static func cfg() -> Dictionary:
	return GameData.world.get("final_room", {})


static func record(profile: Dictionary) -> Dictionary:
	if not profile.has("final_room"):
		profile["final_room"] = {
			"unlocked": false, "entered": false, "sat_down": false, "duration": 0,
			"presence_acknowledged": false, "revisits": 0, "drank_this_visit": false,
		}
	return profile["final_room"]


## The seven conditions, each true or false. For tests and tools only;
## nothing in the game ever shows this to the player.
static func conditions(profile: Dictionary) -> Dictionary:
	var flags: Dictionary = profile.get("flags", {})
	var c := cfg()
	var all_levels := true
	for level in c.get("levels", []):
		if not flags.has("visited_level:" + String(level)):
			all_levels = false
	var all_choices := true
	for choice in c.get("endgame_choices", []):
		if not flags.has("endgame_choice:" + String(choice)):
			all_choices = false
	var thread := true
	for point in c.get("silica_thread_points", []):
		if not flags.has("silica_thread:" + String(point)):
			thread = false
	return {
		"all_levels_visited": all_levels,
		"three_endgame_choices": all_choices,
		"philosophers_stone": flags.has("achievement:" + String(c.get("intention_achievement", "INTENTION"))),
		"egg_hatched": flags.has("egg_hatched"),
		"whisper_acknowledged": flags.has("whisper_acknowledged"),
		"stones_collected": profile.get("learned_stones", {}).size() >= int(c.get("min_stones", 100)),
		"silica_thread_traced": thread,
	}


static func earned(profile: Dictionary) -> bool:
	for v in conditions(profile).values():
		if not v:
			return false
	return true


## Called when the player comes in through the main entrance. Sets the
## unlock quietly the first time everything is met. Never broadcast.
static func check_on_entry(profile: Dictionary) -> bool:
	var r := record(profile)
	if not bool(r["unlocked"]) and earned(profile):
		r["unlocked"] = true
	return bool(r["unlocked"])


## Which page the book keeps. It turns, unseen, every few visits.
static func book_page(profile: Dictionary) -> int:
	return int(record(profile)["revisits"]) / int(cfg().get("book_turn_every_visits", 3))
