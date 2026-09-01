# GameManager.gd — Geode Inn Core Game Manager (Autoload)
# Handles player progress, stone collection, zone unlocking, frequency state
# Save system: JSON to user://geode_inn_save.json (Steam Cloud synced)
# Controller: Unified Control Spec — Switch 2 + Keyboard/Mouse + Touch

extends Node

# === SIGNALS ===
signal stone_collected(stone_name: String)
signal zone_unlocked(zone_name: String)
signal frequency_changed(new_frequency: int)
signal score_changed(new_score: int)
signal lives_changed(lives_remaining: int)
signal input_method_changed(method: String)

# === FREQUENCY STATES ===
enum Frequency { LIVING, SHADOW, IN_BETWEEN }
var current_frequency: Frequency = Frequency.LIVING

# === INPUT METHODS ===
enum InputMethod { KEYBOARD_MOUSE, SWITCH2, TOUCH }
var current_input_method: InputMethod = InputMethod.KEYBOARD_MOUSE

# === CONSTANTS ===
const SAVE_PATH := "user://geode_inn_save.json"
const FREQUENCY_LIVING_HZ := 42
const FREQUENCY_SHADOW_HZ := 84
const STARTING_LIVES := 3

# === PLAYER STATE ===
var player_name: String = "Traveler"
var player_id: String = ""
var total_score: int = 0
var lives: int = STARTING_LIVES
var stones_collected: Dictionary = {}
var games_completed: Dictionary = {}
var areas_unlocked: Array[String] = ["Main Floor"]
var fae_reputation: int = 0
var water_monsters_played: Array[String] = []
var current_zone: String = "Main Floor"

# === CONTROLLER MAPPING (Unified Control Spec) ===
# Switch 2 Controller → Godot Action Names
const SWITCH2_MAP := {
	"move_left": "ui_left",
	"move_right": "ui_right",
	"move_up": "ui_up",
	"move_down": "ui_down",
	"primary_action": "jump",         # A button — jump/confirm/select
	"cancel": "ui_cancel",            # B button — cancel/back/dash
	"secondary_action": "interact",   # X button — interact/grab/special
	"tertiary_action": "special",     # Y button — context-specific
	"cycle_prev": "prev_item",        # L shoulder — previous item
	"cycle_next": "next_item",        # R shoulder — next item
	"aim_charge": "aim",              # ZL trigger — aim/charge
	"fire_release": "fire",           # ZR trigger — fire/use item
	"pause": "ui_accept",             # + button — pause menu
	"inn_map": "inn_map",             # - button — zone overview
	"sprint": "sprint",               # Left stick click
}

# Keyboard + Mouse → Godot Action Names (WoW-style for major zones)
const KEYBOARD_MAP := {
	"forward": "ui_up",               # W
	"back": "ui_down",                # S
	"strafe_left": "ui_left",         # A
	"strafe_right": "ui_right",       # D
	"sprint": "sprint",               # Shift
	"jump": "jump",                   # Space
	"crouch": "crouch",               # Ctrl
	"interact": "interact",           # F
	"hotbar_1": "hotbar_1",           # 1
	"hotbar_2": "hotbar_2",           # 2
	"hotbar_3": "hotbar_3",           # 3
	"hotbar_4": "hotbar_4",           # 4
	"hotbar_5": "hotbar_5",           # 5
	"hotbar_6": "hotbar_6",           # 6
	"quickcast_1": "quickcast_q",     # Q
	"quickcast_2": "quickcast_e",     # E
	"frequency_toggle": "freq_toggle", # T — Living ↔ Shadow
	"inventory": "inventory",         # Tab
	"world_map": "world_map",         # M
	"journal": "journal",             # I
	"crafting": "crafting",           # C
	"chat": "chat",                   # Enter
}

# Zelda-Style World (LttP layout on Switch 2)
const ZELDA_MAP := {
	"sword": "ui_cancel",             # B — primary attack (hold for spin)
	"action": "jump",                 # A — talk/lift/read/open/grab
	"item_1": "interact",             # X — use assigned item
	"item_2": "special",              # Y — use assigned item / dash
	"item_ring_left": "prev_item",    # L — scroll item ring left
	"item_ring_right": "next_item",   # R — scroll item ring right
	"frequency_toggle": "fire",       # ZR — FREQUENCY TOGGLE (tap=instant, hold=Ether)
	"shield": "aim",                  # ZL — shield/block
	"sprint": "sprint",               # Left stick click
	"inventory_select": "ui_accept",  # + — inventory/item select
	"inn_map": "inn_map",             # - — Inn map with frequency overlay
}

# Per-game-type control overrides (Switch 2)
const GAME_TYPE_CONTROLS := {
	"block_stacking": {  # Standing Stones (Tetris)
		"move": ["ui_left", "ui_right"],
		"soft_drop": "ui_down",
		"rotate_cw": "jump",           # A
		"rotate_ccw": "ui_cancel",     # B
		"hard_drop": "interact",       # X
		"hold_piece": "special",       # Y
	},
	"endless_runner": {  # Andean Run, Tumble Run
		"steer": ["ui_left", "ui_right"],
		"jump": "jump",                # A (double-tap = double jump)
		"slide": "ui_cancel",          # B
		"dash_attack": "interact",     # X
		"use_powerup": "special",      # Y
		"aim": "aim",                  # ZL
		"fire": "fire",                # ZR
		"prev_powerup": "prev_item",   # L
		"next_powerup": "next_item",   # R
	},
	"digging": {  # Tomb Tunnel (Dig Dug)
		"move_dig": ["ui_left", "ui_right", "ui_up", "ui_down"],
		"dig": "jump",                 # A
		"bomb": "ui_cancel",           # B
		"place_support": "interact",   # X
		"use_item": "special",         # Y
		"cycle_items": ["prev_item", "next_item"],
	},
	"reverse_monster": {  # Monster of the Deep
		"move": ["ui_left", "ui_right", "ui_up", "ui_down"],
		"attack_breach": "jump",       # A
		"dive_submerge": "ui_cancel",  # B
		"roar_intimidate": "interact", # X
		"special_ability": "special",  # Y
		"cycle_abilities": ["prev_item", "next_item"],
		"charge_attack": "aim",        # ZL
		"trigger_event": "fire",      # ZR
	},
}

# === ZONE MAP ===
const ZONE_MAP := {
	"Main Floor": {
		"corridors": ["Arcade", "Market", "Archive", "Common Room", "Composer", "Campgrounds"],
		"frequency": Frequency.LIVING,
		"audio_zone": "main_floor_day",
		"bg": "res://assets/zones/main_floor.png",
		"unlocked_by_default": true
	},
	"Arcade": {
		"corridors": ["Main Floor"],
		"frequency": Frequency.LIVING,
		"audio_zone": "hub",
		"bg": "res://assets/zones/arcade.png",
		"unlocked_by_default": true,
		"games": ["Standing Stones", "Tomb Tunnel", "Andean Run", "Monster of the Deep", "Tumble Run"]
	},
	"Market": {
		"corridors": ["Main Floor"],
		"frequency": Frequency.LIVING,
		"audio_zone": "market",
		"bg": "res://assets/zones/market.png",
		"unlocked_by_default": true
	},
	"Archive": {
		"corridors": ["Main Floor"],
		"frequency": Frequency.LIVING,
		"audio_zone": "archive",
		"bg": "res://assets/zones/archive.png",
		"unlocked_by_default": true
	},
	"Common Room": {
		"corridors": ["Main Floor"],
		"frequency": Frequency.LIVING,
		"audio_zone": "main_floor_evening",
		"bg": "res://assets/zones/common_room.png",
		"unlocked_by_default": true
	},
	"Composer": {
		"corridors": ["Main Floor"],
		"frequency": Frequency.LIVING,
		"audio_zone": "archive",
		"bg": "res://assets/zones/composer.png",
		"unlocked_by_default": true
	},
	"Campgrounds": {
		"corridors": ["Main Floor"],
		"frequency": Frequency.LIVING,
		"audio_zone": "campgrounds",
		"bg": "res://assets/zones/campgrounds.png",
		"unlocked_by_default": true
	},
	"Staircase": {
		"corridors": ["Main Floor", "Catacombs"],
		"frequency": Frequency.LIVING,
		"audio_zone": "staircase",
		"bg": "res://assets/zones/staircase.png",
		"unlocked_by_default": true
	},
	"Catacombs": {
		"corridors": ["Staircase", "Fae Kingdom", "Undercity"],
		"frequency": Frequency.LIVING,
		"audio_zone": "catacombs",
		"bg": "res://assets/zones/catacombs.png",
		"unlocked_by_default": true
	},
	"Undercity": {
		"corridors": ["Catacombs"],
		"frequency": Frequency.SHADOW,
		"audio_zone": "undercity",
		"bg": "res://assets/zones/undercity.png",
		"unlocked_by_default": false
	},
	"Fae Kingdom": {
		"corridors": ["Catacombs"],
		"frequency": Frequency.LIVING,
		"audio_zone": "fae_seelie",
		"bg": "res://assets/zones/fae_kingdom.png",
		"unlocked_by_default": false
	},
	"ZeldaWorld": {
		"corridors": ["Main Floor"],
		"frequency": Frequency.LIVING,
		"audio_zone": "zelda_world",
		"bg": "res://assets/zones/zelda_world.png",
		"unlocked_by_default": true
	},
	"HollowEarth": {
		"corridors": ["Catacombs"],
		"frequency": Frequency.SHADOW,
		"audio_zone": "hollow_earth",
		"bg": "res://assets/zones/hollow_earth.png",
		"unlocked_by_default": false
	},
	"Cosmology": {
		"corridors": ["Main Floor"],
		"frequency": Frequency.LIVING,
		"audio_zone": "cosmology",
		"bg": "res://assets/zones/cosmology.png",
		"unlocked_by_default": true
	},
	"Gorgon's Garden": {
		"corridors": ["Catacombs"],
		"frequency": Frequency.SHADOW,
		"audio_zone": "gorgons_garden",
		"bg": "res://assets/zones/gorgons_garden.png",
		"unlocked_by_default": false
	}
}

func _ready() -> void:
	_detect_input_method()
	load_save()

# === INPUT METHOD DETECTION ===
func _detect_input_method() -> void:
	var joy_connected := Input.get_connected_joypads()
	if joy_connected.size() > 0:
		# Check if it's a Switch controller
		var joy_name := Input.get_joy_name(joy_connected[0])
		if "Switch" in joy_name or "Pro" in joy_name or "Joycon" in joy_name.to_lower():
			current_input_method = InputMethod.SWITCH2
		else:
			current_input_method = InputMethod.SWITCH2  # Default gamepad to Switch2 mapping
	else:
		current_input_method = InputMethod.KEYBOARD_MOUSE
	
	input_method_changed.emit(_input_method_name())
	print("[GameManager] Input method: %s" % _input_method_name())

func _input_method_name() -> String:
	match current_input_method:
		InputMethod.KEYBOARD_MOUSE: return "Keyboard + Mouse"
		InputMethod.SWITCH2: return "Switch 2 Controller"
		InputMethod.TOUCH: return "Touch"
		_: return "Unknown"

func get_input_method() -> InputMethod:
	return current_input_method

# === FREQUENCY SYSTEM ===
func toggle_frequency() -> void:
	if current_frequency == Frequency.LIVING:
		current_frequency = Frequency.SHADOW
	elif current_frequency == Frequency.SHADOW:
		current_frequency = Frequency.LIVING
	frequency_changed.emit(current_frequency)
	AudioManager.toggle_frequency()
	print("[GameManager] Frequency shifted to: %d" % current_frequency)

func set_frequency(freq: Frequency) -> void:
	if current_frequency != freq:
		current_frequency = freq
		frequency_changed.emit(freq)
		var hz := FREQUENCY_LIVING_HZ if freq == Frequency.LIVING else FREQUENCY_SHADOW_HZ
		AudioManager.set_frequency(hz)

# === ZONE MANAGEMENT ===
func can_travel_to(zone_name: String) -> bool:
	if not ZONE_MAP.has(zone_name):
		return false
	if ZONE_MAP[zone_name].get("unlocked_by_default", false):
		return true
	return zone_name in areas_unlocked

func travel_to(zone_name: String) -> void:
	if not can_travel_to(zone_name):
		push_warning("Cannot travel to locked zone: " + zone_name)
		return
	current_zone = zone_name
	var zone_data := ZONE_MAP[zone_name]
	
	# Play zone-specific audio via AudioManager
	var audio_zone: String = zone_data.get("audio_zone", "hub")
	AudioManager.play_zone_music(audio_zone)
	
	# Set frequency for this zone
	var zone_freq: int = zone_data.get("frequency", Frequency.LIVING)
	set_frequency(zone_freq)
	
	print("[GameManager] Traveled to: %s (audio: %s)" % [zone_name, audio_zone])

func unlock_zone(zone_name: String) -> void:
	if zone_name not in areas_unlocked:
		areas_unlocked.append(zone_name)
		zone_unlocked.emit(zone_name)
		save_game()
		print("[GameManager] Zone unlocked: %s" % zone_name)

# === STONE COLLECTION ===
func collect_stone(stone_name: String) -> void:
	if stones_collected.has(stone_name):
		stones_collected[stone_name] += 1
	else:
		stones_collected[stone_name] = 1
	stone_collected.emit(stone_name)
	# Play the stone's unique vibration tone
	AudioManager.play_stone_vibration(stone_name)
	save_game()

func get_stone_count() -> int:
	return stones_collected.size()

# === SCORE ===
func add_score(points: int) -> void:
	total_score += points
	score_changed.emit(total_score)

func record_game_result(game_name: String, score: int) -> void:
	if not games_completed.has(game_name) or games_completed[game_name] < score:
		games_completed[game_name] = score
	save_game()

# === GAME LAUNCH ===
func launch_game(game_name: String) -> void:
	# Play the game's specific music track
	AudioManager.play_game_music(game_name)
	print("[GameManager] Launching game: %s" % game_name)

# === SAVE SYSTEM ===
func save_game() -> void:
	var save_data := {
		"player_name": player_name,
		"player_id": player_id,
		"total_score": total_score,
		"stones_collected": stones_collected,
		"games_completed": games_completed,
		"areas_unlocked": areas_unlocked,
		"fae_reputation": fae_reputation,
		"water_monsters_played": water_monsters_played,
		"current_zone": current_zone
	}
	
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		push_error("GameManager: Failed to open save file for writing")
		return
	
	file.store_string(JSON.stringify(save_data, "\t"))
	file.close()
	print("[GameManager] Save written to %s" % SAVE_PATH)

func load_save() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		print("[GameManager] No save file found — starting fresh")
		return
	
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		push_error("GameManager: Failed to open save file for reading")
		return
	
	var json := JSON.new()
	var err := json.parse(file.get_as_text())
	file.close()
	
	if err != OK:
		push_error("GameManager: Save file corrupted — starting fresh")
		return
	
	var data: Dictionary = json.data
	player_name = data.get("player_name", "Traveler")
	player_id = data.get("player_id", "")
	total_score = data.get("total_score", 0)
	stones_collected = data.get("stones_collected", {})
	games_completed = data.get("games_completed", {})
	areas_unlocked = data.get("areas_unlocked", ["Main Floor"])
	fae_reputation = data.get("fae_reputation", 0)
	water_monsters_played = data.get("water_monsters_played", [])
	current_zone = data.get("current_zone", "Main Floor")
	print("[GameManager] Save loaded — %d stones, %d zones unlocked" % [stones_collected.size(), areas_unlocked.size()])

func reset_save() -> void:
	stones_collected.clear()
	games_completed.clear()
	areas_unlocked = ["Main Floor"]
	total_score = 0
	fae_reputation = 0
	water_monsters_played.clear()
	current_zone = "Main Floor"
	save_game()
	print("[GameManager] Save reset")
