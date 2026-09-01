extends Node
## ControllerManager.gd — Geode Inn Shared Script
## Detects and manages Bluetooth/USB controllers across all game types.
## Supports: Xbox, PlayStation, Switch Pro, generic Bluetooth controllers.
## Built once, used by all 61 arcade games + MMORPG.
## Part of the Geode Inn Arcade Production Pipeline.

signal controller_connected(device_id: int, device_name: String)
signal controller_disconnected(device_id: int)
signal controller_prompt_shown()
signal controller_prompt_dismissed()

@export var show_pairing_prompt: bool = true
@export var prompt_timeout_seconds: float = 30.0

var connected_controllers: Dictionary = {}  # device_id -> {name, type, guid}
var keyboard_active: bool = true
var prompt_active: bool = false
var prompt_timer: float = 0.0

# Controller type detection patterns
const XBOX_PATTERNS = ["Xbox", "XInput", "Microsoft", "Xbox Wireless", "Xbox One", "Xbox Series"]
const PS_PATTERNS = ["Sony", "DualSense", "DualShock", "PlayStation", "PS4", "PS5"]
const SWITCH_PATTERNS = ["Switch", "Pro Controller", "Joy-Con", "Nintendo"]
const STEAM_DECK_PATTERNS = ["Steam", "Steam Deck", "Valve"]

enum ControllerType {
	KEYBOARD,
	XBOX,
	PLAYSTATION,
	SWITCH,
	STEAM_DECK,
	GENERIC_BLUETOOTH,
	GENERIC_USB,
	UNKNOWN
}

func _ready() -> void:
	Input.joy_connection_changed.connect(_on_joy_connection_changed)
	_detect_initial_controllers()

func _detect_initial_controllers() -> void:
	# Godot lists connected joypads at startup
	for i in range(Input.get_connected_joypads().size()):
		var joy_info = Input.get_joy_info(i)
		var name = joy_info.get("name", "Unknown Controller") if joy_info else "Unknown Controller"
		_register_controller(i, name)

func _on_joy_connection_changed(device_id: int, connected: bool) -> void:
	if connected:
		var joy_info = Input.get_joy_info(device_id)
		var name = joy_info.get("name", "Unknown Controller") if joy_info else "Unknown Controller"
		_register_controller(device_id, name)
		controller_connected.emit(device_id, name)
		
		# If this is the first controller and we had keyboard-only, 
		# trigger Valkyrie Shift awareness (deeper layer games)
		if connected_controllers.size() == 1:
			_first_controller_shift()
		
		# Dismiss pairing prompt if active
		if prompt_active:
			_dismiss_pairing_prompt()
	else:
		var controller = connected_controllers.get(device_id)
		var name = controller.get("name", "Controller") if controller else "Controller"
		connected_controllers.erase(device_id)
		controller_disconnected.emit(device_id)
		
		# If no controllers left, show keyboard mode
		if connected_controllers.is_empty():
			keyboard_active = true

func _register_controller(device_id: int, name: String) -> void:
	var ctype = _detect_controller_type(name)
	connected_controllers[device_id] = {
		"name": name,
		"type": ctype,
		"guid": Input.get_joy_info(device_id).get("guid", "") if Input.get_joy_info(device_id) else "",
		"connected_at": Time.get_unix_time_from_system()
	}
	keyboard_active = false

func _detect_controller_type(name: String) -> ControllerType:
	var name_lower = name.to_lower()
	
	for pattern in STEAM_DECK_PATTERNS:
		if pattern.to_lower() in name_lower:
			return ControllerType.STEAM_DECK
	
	for pattern in XBOX_PATTERNS:
		if pattern.to_lower() in name_lower:
			return ControllerType.XBOX
	
	for pattern in PS_PATTERNS:
		if pattern.to_lower() in name_lower:
			return ControllerType.PLAYSTATION
	
	for pattern in SWITCH_PATTERNS:
		if pattern.to_lower() in name_lower:
			return ControllerType.SWITCH
	
	# Generic detection
	if "bluetooth" in name_lower or "bt" in name_lower:
		return ControllerType.GENERIC_BLUETOOTH
	if "usb" in name_lower or "wireless" in name_lower:
		return ControllerType.GENERIC_USB
	
	return ControllerType.UNKNOWN

func _first_controller_shift() -> void:
	# The Valkyrie Shift — when a controller connects, deeper game layers unlock
	# This is the narrative event, not a menu prompt
	# Individual games can listen for this and trigger their own shift scenes
	pass  # Games override this or connect to controller_connected signal

# === PUBLIC API ===

func has_controller() -> bool:
	return not connected_controllers.is_empty()

func get_primary_controller_type() -> ControllerType:
	if connected_controllers.is_empty():
		return ControllerType.KEYBOARD
	var first = connected_controllers.values()[0]
	return first.get("type", ControllerType.UNKNOWN)

func get_primary_controller_name() -> String:
	if connected_controllers.is_empty():
		return "Keyboard/Mouse"
	var first = connected_controllers.values()[0]
	return first.get("name", "Unknown")

func get_controller_count() -> int:
	return connected_controllers.size()

func is_steam_deck() -> bool:
	for c in connected_controllers.values():
		if c.get("type") == ControllerType.STEAM_DECK:
			return true
	return false

func is_playstation() -> bool:
	for c in connected_controllers.values():
		if c.get("type") == ControllerType.PLAYSTATION:
			return true
	return false

func is_xbox() -> bool:
	for c in connected_controllers.values():
		if c.get("type") == ControllerType.XBOX:
			return true
	return false

func is_switch() -> bool:
	for c in connected_controllers.values():
		if c.get("type") == ControllerType.SWITCH:
			return true
	return false

func is_valkyrie_unlocked() -> bool:
	# Valkyrie Shift: controller = 84Hz key = deep layer access
	# Steam Deck bypasses (already has controller)
	return has_controller()

# === INPUT MAPPING ===
# Games call this to get a unified action map regardless of controller type

func get_action_button_name(action: String, controller_type: ControllerType = -1) -> String:
	# Returns the button name for UI prompts (e.g., "A" on Xbox, "X" on PS, "B" on Switch)
	var ct = controller_type if controller_type >= 0 else get_primary_controller_type()
	
	match action:
		"confirm":
			match ct:
				ControllerType.XBOX: return "A"
				ControllerType.PLAYSTATION: return "X (Cross)"
				ControllerType.SWITCH: return "B"
				ControllerType.STEAM_DECK: return "A"
				_: return "Enter"
		"cancel":
			match ct:
				ControllerType.XBOX: return "B"
				ControllerType.PLAYSTATION: return "O (Circle)"
				ControllerType.SWITCH: return "A"
				ControllerType.STEAM_DECK: return "B"
				_: return "Esc"
		"pause":
			match ct:
				ControllerType.XBOX: return "Menu"
				ControllerType.PLAYSTATION: return "Options"
				ControllerType.SWITCH: return "+"
				ControllerType.STEAM_DECK: return "Menu"
				_: return "Esc"
		"primary_action":
			match ct:
				ControllerType.XBOX: return "RT"
				ControllerType.PLAYSTATION: return "R2"
				ControllerType.SWITCH: return "ZR"
				ControllerType.STEAM_DECK: return "R2"
				_: return "Space"
		"secondary_action":
			match ct:
				ControllerType.XBOX: return "LT"
				ControllerType.PLAYSTATION: return "L2"
				ControllerType.SWITCH: return "ZL"
				ControllerType.STEAM_DECK: return "L2"
				_: return "Shift"
		"overlay":
			match ct:
				ControllerType.XBOX: return "LB + RB"
				ControllerType.PLAYSTATION: return "L1 + R1"
				ControllerType.SWITCH: return "L + R"
				ControllerType.STEAM_DECK: return "L1 + R1"
				_: return "Shift+Tab"
	_: return "?"

# === PAIRING PROMPT ===

func show_controller_pairing_prompt() -> void:
	if not show_pairing_prompt:
		return
	if has_controller():
		return
	
	prompt_active = true
	prompt_timer = prompt_timeout_seconds
	controller_prompt_shown.emit()

func _dismiss_pairing_prompt() -> void:
	prompt_active = false
	controller_prompt_dismissed.emit()

func _process(delta: float) -> void:
	if prompt_active:
		prompt_timer -= delta
		if prompt_timer <= 0:
			_dismiss_pairing_prompt()
		# Check if a controller was connected
		if has_controller():
			_dismiss_pairing_prompt()

# === RUMBLE ===

func rumble(device_id: int, weak: float, strong: float, duration: float) -> void:
	# Godot 4 rumble API
	if not connected_controllers.has(device_id):
		return
	Input.start_joy_vibration(device_id, weak, strong, duration)

func rumble_all(weak: float, strong: float, duration: float) -> void:
	for id in connected_controllers.keys():
		Input.start_joy_vibration(id, weak, strong, duration)
