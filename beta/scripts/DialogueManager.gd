extends Node
## DialogueManager.gd (Autoload Singleton)
## Loads and manages all NPC dialogue from exported JSON.
## Handles dialogue trees, condition flags, and voice profile display.

signal dialogue_started(npc_name: String)
signal dialogue_line_shown(speaker: String, line: String, voice_profile: String)
signal dialogue_responses_shown(responses: Array)
signal dialogue_ended()
signal flag_set(flag: String)

var dialogue_data: Dictionary = {}  # dialogueId -> entry
var npc_index: Dictionary = {}      # npcName -> [dialogueIds]

func _ready() -> void:
	load_dialogue_from_json()

func load_dialogue_from_json() -> void:
	var file := FileAccess.open("res://data/dialogue.json", FileAccess.READ)
	if file:
		var content := file.get_as_text()
		file.close()
		var json := JSON.new()
		if json.parse(content) == OK:
			var entries: Array = json.data
			for entry in entries:
				var dId := entry.get("dialogueId", "")
				dialogue_data[dId] = entry
				var npc := entry.get("npcName", "")
				if not npc_index.has(npc):
					npc_index[npc] = []
				npc_index[npc].append(dId)

func get_dialogue(dialogue_id: String) -> Dictionary:
	return dialogue_data.get(dialogue_id, {})

func get_npc_dialogue(npc_name: String) -> Array:
	var ids := npc_index.get(npc_name, [])
	var result := []
	for id in ids:
		result.append(dialogue_data[id])
	return result

func get_available_dialogue(npc_name: String) -> Dictionary:
	## Returns the first dialogue entry for an NPC whose conditions are met
	var entries := get_npc_dialogue(npc_name)
	for entry in entries:
		var condition := entry.get("conditionTag", "")
		if _check_condition(condition):
			return entry
	# Fall back to first entry
	if entries.size() > 0:
		return entries[0]
	return {}

func _check_condition(tag: String) -> bool:
	match tag:
		"first_visit":
			return not SaveManager.has_dialogue_flag("met_" + _current_npc.to_lower().replace(" ", "_"))
		"whisper_layer":
			return SaveManager.get_flag("whisper_layer_aware")
		"shadow_inn":
			return SaveManager.get_flag("shadow_inn_entered")
		"hollow_men":
			return SaveManager.get_flag("hollow_men_completed")
		"final_room":
			return SaveManager.get_flag("final_room_reached")
		"":
			return true  # No condition = always available
		_:
			return SaveManager.has_dialogue_flag(tag)

var _current_npc := ""

func start_dialogue(npc_name: String) -> void:
	_current_npc = npc_name
	var entry := get_available_dialogue(npc_name)
	if entry.is_empty():
		dialogue_ended.emit()
		return
	
	dialogue_started.emit(npc_name)
	_play_entry(entry)

func _play_entry(entry: Dictionary) -> void:
	var lines: Array = entry.get("lines", [])
	var voice := entry.get("voiceProfile", "")
	var responses: Array = entry.get("responses", [])
	var flags: Array = entry.get("setFlags", [])
	
	# Set flags
	for flag in flags:
		SaveManager.set_dialogue_flag(flag)
		flag_set.emit(flag)
	
	# Show lines sequentially
	for line in lines:
		dialogue_line_shown.emit(_current_npc, line, voice)
		# In actual game: wait for player input to advance
	
	# Show responses if any
	if responses.size() > 0:
		dialogue_responses_shown.emit(responses)
	else:
		dialogue_ended.emit()

func select_response(index: int, responses: Array) -> void:
	# Handle response selection — could trigger nested dialogue or actions
	if index < responses.size():
		var chosen := responses[index]
		# For beta: just end dialogue on any response
		dialogue_ended.emit()

## Export current dialogue to JSON for the game client
func export_to_json() -> String:
	var entries := []
	for key in dialogue_data:
		entries.append(dialogue_data[key])
	return JSON.stringify(entries, "\t")
