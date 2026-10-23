extends Node
## Quests from data/quests.json. Steps advance from dialogue actions or from
## game events. Event formats a step can wait for:
##   "visit:geode_corner"      exact event id
##   "tracks:3"                counter "tracks" reaches 3
## Counters add data.amount, or take data.total when an event sends a running total.
## Quest progress is stored in PlayerState.profile["quests"] so it saves with the player.

const NOT_STARTED := "not_started"
const ACTIVE := "active"
const DONE := "done"


func _ready() -> void:
	EventBus.game_event.connect(_on_game_event)


func _quests() -> Dictionary:
	return PlayerState.profile["quests"]


func _counters() -> Dictionary:
	return PlayerState.profile["counters"]


func state(quest_id: String) -> String:
	return String(_quests().get(quest_id, {}).get("state", NOT_STARTED))


func is_active(quest_id: String) -> bool:
	return state(quest_id) == ACTIVE


func is_done(quest_id: String) -> bool:
	return state(quest_id) == DONE


func step_index(quest_id: String) -> int:
	return int(_quests().get(quest_id, {}).get("step", 0))


func current_step(quest_id: String) -> Dictionary:
	var q: Dictionary = GameData.quests.get(quest_id, {})
	var steps: Array = q.get("steps", [])
	var i := step_index(quest_id)
	return steps[i] if is_active(quest_id) and i < steps.size() else {}


func is_on_step(quest_id: String, step_id: String) -> bool:
	return is_active(quest_id) and String(current_step(quest_id).get("id", "")) == step_id


func can_start(quest_id: String) -> bool:
	if state(quest_id) != NOT_STARTED or not GameData.quests.has(quest_id):
		return false
	for req in GameData.quests[quest_id].get("requires", []):
		if not is_done(req):
			return false
	return true


func start(quest_id: String) -> bool:
	if not can_start(quest_id):
		return false
	_quests()[quest_id] = { "state": ACTIVE, "step": 0 }
	EventBus.quest_started.emit(quest_id)
	EventBus.toast.emit("New quest: " + String(GameData.quests[quest_id]["name"]))
	_check_counters(quest_id)
	return true


## Completes the named step if it is the current one, then moves on.
func complete_step(quest_id: String, step_id: String) -> bool:
	if not is_on_step(quest_id, step_id):
		return false
	var steps: Array = GameData.quests[quest_id]["steps"]
	var entry: Dictionary = _quests()[quest_id]
	entry["step"] = int(entry["step"]) + 1
	EventBus.quest_step_completed.emit(quest_id, step_id)
	if int(entry["step"]) >= steps.size():
		_finish(quest_id)
	else:
		_check_counters(quest_id)
	return true


func active_quests() -> Array[String]:
	var out: Array[String] = []
	for id in _quests().keys():
		if is_active(id):
			out.append(String(id))
	return out


func counter(key: String) -> float:
	return float(_counters().get(key, 0))


func _finish(quest_id: String) -> void:
	var entry: Dictionary = _quests()[quest_id]
	entry["state"] = DONE
	var q: Dictionary = GameData.quests[quest_id]
	var reward: Dictionary = q.get("reward", {})
	for stone_id in reward.get("stones", []):
		PlayerState.learn_stone(stone_id)
	var mats: Dictionary = reward.get("materials", {})
	for m in mats.keys():
		PlayerState.add_material(m, int(mats[m]))
	if reward.has("unlock"):
		PlayerState.unlock(String(reward["unlock"]))
	for u in reward.get("unlocks", []):
		PlayerState.unlock(String(u))
	if reward.has("chronicle"):
		PlayerState.add_chronicle(String(reward["chronicle"]), "quest", { "quest": quest_id })
	var points := float(reward.get("song_points", 0.0)) + SongState.points_for("quest_complete")
	SongState.add_points(points, "quest:" + quest_id)
	if reward.has("achievement"):
		Services.unlock_achievement(String(reward["achievement"]))
	EventBus.quest_completed.emit(quest_id)
	EventBus.toast.emit("Quest complete: " + String(q["name"]))
	EventBus.emit_event("quest_done:" + quest_id)


func _on_game_event(id: String, data: Dictionary) -> void:
	if id.begins_with("chime:"):
		PlayerState.set_flag("rang:" + id.substr(6))
	if data.has("total"):
		_counters()[id] = float(data["total"])
	elif data.has("amount"):
		_counters()[id] = counter(id) + float(data["amount"])
	for quest_id in active_quests():
		var step := current_step(quest_id)
		var want := String(step.get("event", ""))
		if want.is_empty():
			continue
		if want == id or _counter_met(want):
			complete_step(quest_id, String(step["id"]))


## When a step becomes current, it may already be satisfied (the player built
## the lean-to before the quest asked, or harmonized earlier). Count that too,
## so a quest can never get stuck waiting for an event that already happened.
func _check_counters(quest_id: String) -> void:
	var step := current_step(quest_id)
	var want := String(step.get("event", ""))
	if not want.is_empty() and (_counter_met(want) or _already_true(want)):
		complete_step(quest_id, String(step["id"]))


func _already_true(want: String) -> bool:
	if want.begins_with("built:"):
		return PlayerState.has_built(want.substr(6))
	if want.begins_with("harmonized:"):
		var being: Dictionary = GameData.world.get("beings", {}).get(want.substr(11), {})
		return not being.is_empty() and PlayerState.has_companion(String(being["companion"]))
	if want.begins_with("chime:"):
		return PlayerState.profile["flags"].has("rang:" + want.substr(6))
	if want == "seed:grown":
		return PlayerState.flag("seed_grown") != null
	return false


func _counter_met(want: String) -> bool:
	var cut := want.rfind(":")
	if cut <= 0:
		return false
	var tail := want.substr(cut + 1)
	if not tail.is_valid_int():
		return false
	return counter(want.substr(0, cut)) >= float(int(tail))
