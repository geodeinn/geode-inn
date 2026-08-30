extends Node
## SaveManager.gd (Autoload Singleton)
## Offline-first save system. All game state stored as local JSON.
## Syncs to Base44 API when online (optional).

const SAVE_DIR := "user://saves/"
const SAVE_FILE := "geode_inn_beta_save.json"
const SETTINGS_FILE := "geode_inn_settings.json"

signal game_saved()
signal game_loaded(save_data: Dictionary)

var current_save: Dictionary = {}

func _ready() -> void:
	_ensure_save_dir()
	current_save = _default_save()

func _ensure_save_dir() -> void:
	DirAccess.make_dir_recursive_absolute(SAVE_DIR)

func _default_save() -> Dictionary:
	return {
		"version": 1,
		"player_name": "Traveler",
		"player_id": "",
		"created_date": Time.get_datetime_string_from_system(false, true),
		"last_played": Time.get_datetime_string_from_system(false, true),
		
		# Progress flags
		"current_act": 1,
		"current_zone": "common_room",
		"visited_zones": [],
		"games_completed": [],
		"areas_unlocked": ["main_floor"],
		
		# Inventory
		"stones_collected": [],
		"charms_collected": [],
		"items_collected": [],
		
		# Narrative state
		"dialogue_flags": {},
		"whisper_layer_aware": false,
		"cinema_seen": [],
		"shadow_inn_entered": false,
		"hollow_men_completed": false,
		"endgame_choice": "",  # "stay", "leave", "hide", or ""
		"final_room_reached": false,
		
		# Fae reputation
		"fae_reputation": {
			"seelie": 0,
			"unseelie": 0
		},
		
		# Stats
		"total_score": 0,
		"play_time_seconds": 0,
		"deaths": 0,
		
		# Settings
		"music_volume": 0.7,
		"sfx_volume": 0.8,
		"text_speed": 1.0,
		"subtitles_enabled": true,
	}

func save_game() -> void:
	current_save["last_played"] = Time.get_datetime_string_from_system(false, true)
	var file := FileAccess.open(SAVE_DIR + SAVE_FILE, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(current_save, "\t"))
		file.close()
		game_saved.emit()
	else:
		push_error("SaveManager: Failed to write save file")

func load_game() -> bool:
	var file := FileAccess.open(SAVE_DIR + SAVE_FILE, FileAccess.READ)
	if file:
		var content := file.get_as_text()
		file.close()
		var json := JSON.new()
		if json.parse(content) == OK:
			current_save = json.data
			# Merge any missing keys from default (forward compatibility)
			var defaults := _default_save()
			for key in defaults:
				if not current_save.has(key):
					current_save[key] = defaults[key]
			game_loaded.emit(current_save)
			return true
	return false

func new_game(player_name: String = "Traveler") -> void:
	current_save = _default_save()
	current_save["player_name"] = player_name
	current_save["player_id"] = "local_" + str(Time.get_ticks_msec())
	save_game()

func has_save() -> bool:
	return FileAccess.file_exists(SAVE_DIR + SAVE_FILE)

# === Quick accessors ===
func get_flag(flag_name: String) -> Variant:
	return current_save.get(flag_name)

func set_flag(flag_name: String, value: Variant) -> void:
	current_save[flag_name] = value

func has_dialogue_flag(flag: String) -> bool:
	return current_save["dialogue_flags"].has(flag)

func set_dialogue_flag(flag: String, value: Variant = true) -> void:
	current_save["dialogue_flags"][flag] = value

func add_stone(stone_name: String) -> void:
	if not stone_name in current_save["stones_collected"]:
		current_save["stones_collected"].append(stone_name)
		save_game()

func complete_game(game_id: String) -> void:
	if not game_id in current_save["games_completed"]:
		current_save["games_completed"].append(game_id)
		save_game()

func unlock_area(area: String) -> void:
	if not area in current_save["areas_unlocked"]:
		current_save["areas_unlocked"].append(area)
		save_game()

func visit_zone(zone: String) -> void:
	if not zone in current_save["visited_zones"]:
		current_save["visited_zones"].append(zone)
		save_game()

func set_endgame_choice(choice: String) -> void:
	current_save["endgame_choice"] = choice
	save_game()

func get_progress_percent() -> float:
	var total_games := 13.0
	var completed := float(current_save["games_completed"].size())
	var zones_visited := float(current_save["visited_zones"].size())
	var total_zones := 37.0
	var narrative_done := 0.0
	if current_save["final_room_reached"]: narrative_done = 1.0
	return (completed / total_games * 40.0 + zones_visited / total_zones * 30.0 + narrative_done * 30.0)
