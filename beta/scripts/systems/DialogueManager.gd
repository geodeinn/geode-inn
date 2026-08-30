extends Node
## DialogueManager.gd (Autoload Singleton)
## Loads and manages all NPC dialogue from the beta/data/dialogue.json file.
## Each NPC has a unique hook word (verbal fingerprint) for instant identification.
## Voice profiles are descriptive cadences, never actor names.

# === Dialogue Data ===
var _dialogue_entries: Dictionary = {}  # dialogueId -> entry dict
var _npc_index: Dictionary = {}         # npcName -> Array of dialogueIds
var _zone_index: Dictionary = {}        # zone -> Array of dialogueIds
var _hook_words: Dictionary = {}         # npcName -> hook word string
var _is_loaded: bool = false

signal dialogue_loaded(entries_count: int)
signal dialogue_started(entry: Dictionary)
signal dialogue_ended(entry_id: String)
signal line_spoken(npc_name: String, line: String, voice_profile: String)

func _ready() -> void:
	load_dialogue()

## Load dialogue from the JSON file
func load_dialogue(path: String = "res://beta/data/dialogue.json") -> void:
	if not FileAccess.file_exists(path):
		push_error("DialogueManager: File not found: " + path)
		return
	
	var file := FileAccess.open(path, FileAccess.READ)
	if not file:
		push_error("DialogueManager: Could not open file: " + path)
		return
	
	var text := file.get_as_text()
	file.close()
	
	var json := JSON.new()
	var err := json.parse(text)
	if err != OK:
		push_error("DialogueManager: JSON parse error at line " + str(json.get_error_line()) + ": " + json.get_error_message())
		return
	
	var data = json.data
	if data is Array:
		_index_entries(data)
	elif data is Dictionary and data.has("entries"):
		_index_entries(data["entries"])
	
	_is_loaded = true
	dialogue_loaded.emit(_dialogue_entries.size())
	print("[DialogueManager] Loaded " + str(_dialogue_entries.size()) + " dialogue entries for " + str(_npc_index.size()) + " NPCs")

## Index all dialogue entries for fast lookup
func _index_entries(entries: Array) -> void:
	for entry in entries:
		if not entry is Dictionary:
			continue
		var entry_id: String = entry.get("dialogueId", "")
		if entry_id == "":
			continue
		
		_dialogue_entries[entry_id] = entry
		
		# Index by NPC name
		var npc_name: String = entry.get("npcName", "Unknown")
		if not _npc_index.has(npc_name):
			_npc_index[npc_name] = []
		_npc_index[npc_name].append(entry_id)
		
		# Index by zone
		var zone: String = entry.get("zone", "unknown")
		if not _zone_index.has(zone):
			_zone_index[zone] = []
		_zone_index[zone].append(entry_id)
		
		# Extract hook word (the verbal fingerprint)
		if entry.has("hookWord"):
			_hook_words[npc_name] = entry["hookWord"]
		elif entry.has("lines") and entry["lines"] is Array and entry["lines"].size() > 0:
			# Try to extract a hook word from the first line
			var first_line: String = entry["lines"][0]
			# The hook word is typically the first distinctive word
			var words := first_line.split(" ", false)
			if words.size() > 0:
				_hook_words[npc_name] = words[0]

## Get a specific dialogue entry by ID
func get_entry(entry_id: String) -> Dictionary:
	return _dialogue_entries.get(entry_id, {})

## Get all dialogue entries for a specific NPC
func get_npc_dialogue(npc_name: String) -> Array:
	var ids: Array = _npc_index.get(npc_name, [])
	var entries: Array = []
	for id in ids:
		entries.append(_dialogue_entries[id])
	return entries

## Get all dialogue entries for a specific zone
func get_zone_dialogue(zone: String) -> Array:
	var ids: Array = _zone_index.get(zone, [])
	var entries: Array = []
	for id in ids:
		entries.append(_dialogue_entries[id])
	return entries

## Get the hook word for an NPC
func get_hook_word(npc_name: String) -> String:
	return _hook_words.get(npc_name, "")

## Get all NPC names
func get_all_npcs() -> Array:
	return _npc_index.keys()

## Get dialogue entries filtered by priority (higher priority first)
func get_prioritized_dialogue(npc_name: String) -> Array:
	var entries := get_npc_dialogue(npc_name)
	entries.sort_custom(_compare_priority)
	return entries

func _compare_priority(a: Dictionary, b: Dictionary) -> bool:
	var pa: int = a.get("priority", 0)
	var pb: int = b.get("priority", 0)
	return pa > pb

## Start a dialogue sequence with an NPC
## Returns the first entry to display
func start_dialogue(npc_name: String, condition_tag: String = "") -> Dictionary:
	var entries := get_npc_dialogue(npc_name)
	if entries.is_empty():
		return {}
	
	# Filter by condition tag if provided
	if condition_tag != "":
		var filtered: Array = []
		for entry in entries:
			if entry.get("conditionTag", "") == condition_tag:
				filtered.append(entry)
		if not filtered.is_empty():
			entries = filtered
	
	# Sort by priority (highest first)
	entries.sort_custom(_compare_priority)
	
	var entry: Dictionary = entries[0]
	dialogue_started.emit(entry)
	return entry

## Get the next line in a dialogue entry
## Returns empty string if no more lines
func get_next_line(entry: Dictionary, current_index: int) -> String:
	var lines = entry.get("lines", [])
	if lines is Array and current_index < lines.size():
		var line: String = lines[current_index]
		var voice: String = entry.get("voiceProfile", "")
		var npc: String = entry.get("npcName", "")
		line_spoken.emit(npc, line, voice)
		return line
	return ""

## Get player responses for a dialogue entry
func get_responses(entry: Dictionary) -> Array:
	var responses = entry.get("responses", [])
	if responses is Array:
		return responses
	return []

## Check if a dialogue entry sets flags
func get_set_flags(entry: Dictionary) -> Dictionary:
	var flags = entry.get("setFlags", {})
	if flags is Dictionary:
		return flags
	return {}

## Check if a dialogue entry is a whisper layer (hidden awareness system)
func is_whisper_layer(entry: Dictionary) -> bool:
	return entry.get("isWhisperLayer", false)

## Check if a dialogue entry has a quest link
func get_quest_link(entry: Dictionary) -> String:
	return entry.get("questLink", "")

## Get the voice profile description for an NPC
func get_voice_profile(npc_name: String) -> String:
	var entries := get_npc_dialogue(npc_name)
	if entries.is_empty():
		return ""
	return entries[0].get("voiceProfile", "")

## Is dialogue data loaded?
func is_loaded() -> bool:
	return _is_loaded

## Get total entry count
func get_entry_count() -> int:
	return _dialogue_entries.size()

## Get total NPC count
func get_npc_count() -> int:
	return _npc_index.size()
