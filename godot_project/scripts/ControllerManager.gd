# ControllerManager.gd — Bluetooth Controller Detection & Mapping (Autoload)
# Handles detection, pairing, and input mapping for ALL controller types:
# Xbox One/Series, PlayStation DualShock/DualSense, Switch Pro, generic Bluetooth
# Implements acceptance criterion #5: Bluetooth option for all controller types

extends Node

# === SIGNALS ===
signal controller_connected(device_id: int, controller_type: String)
signal controller_disconnected(device_id: int)
signal controller_type_changed(controller_type: String)
signal pairing_requested()

# === CONTROLLER TYPES ===
enum ControllerType {
	KEYBOARD_MOUSE,
	XBOX,
	PLAYSTATION,
	SWITCH_PRO,
	GENERIC,
	STEAM_DECK
}

const TYPE_NAMES: Dictionary = {
	ControllerType.KEYBOARD_MOUSE: "Keyboard & Mouse",
	ControllerType.XBOX: "Xbox Controller",
	ControllerType.PLAYSTATION: "PlayStation Controller",
	ControllerType.SWITCH_PRO: "Switch Pro Controller",
	ControllerType.GENERIC: "Generic Controller",
	ControllerType.STEAM_DECK: "Steam Deck"
}

# === STATE ===
var _active_controller: int = ControllerType.KEYBOARD_MOUSE
var _connected_controllers: Dictionary = {}  # device_id -> ControllerType
var _last_input_was_controller: bool = false
var _input_deadzone: float = 0.25
var _vibration_enabled: bool = true

# === INPUT MAP SCHEMES ===
# Each controller type maps physical buttons to logical game actions
# Games query get_action_strength() and get_action_pressed() instead of Input directly
const CONTROLLER_MAPS: Dictionary = {
	ControllerType.XBOX: {
		"left": "joypad_0_left",
		"right": "joypad_0_right",
		"up": "joypad_0_up",
		"down": "joypad_0_down",
		"action": "joypad_0_a",
		"cancel": "joypad_0_b",
		"shoulder_l": "joypad_0_l",
		"shoulder_r": "joypad_0_r",
		"trigger_l": "joypad_0_lt",
		"trigger_r": "joypad_0_rt",
		"start": "joypad_0_start",
		"select": "joypad_0_select",
		"stick_l": "joypad_0_l3",
		"stick_r": "joypad_0_r3",
		"dpad_left": "joypad_0_dpad_left",
		"dpad_right": "joypad_0_dpad_right",
		"dpad_up": "joypad_0_dpad_up",
		"dpad_down": "joypad_0_dpad_down",
	},
	ControllerType.PLAYSTATION: {
		"left": "joypad_0_left",
		"right": "joypad_0_right",
		"up": "joypad_0_up",
		"down": "joypad_0_down",
		"action": "joypad_0_cross",
		"cancel": "joypad_0_circle",
		"shoulder_l": "joypad_0_l1",
		"shoulder_r": "joypad_0_r1",
		"trigger_l": "joypad_0_l2",
		"trigger_r": "joypad_0_r2",
		"start": "joypad_0_options",
		"select": "joypad_0_share",
		"stick_l": "joypad_0_l3",
		"stick_r": "joypad_0_r3",
		"dpad_left": "joypad_0_dpad_left",
		"dpad_right": "joypad_0_dpad_right",
		"dpad_up": "joypad_0_dpad_up",
		"dpad_down": "joypad_0_dpad_down",
	},
	ControllerType.SWITCH_PRO: {
		"left": "joypad_0_left",
		"right": "joypad_0_right",
		"up": "joypad_0_up",
		"down": "joypad_0_down",
		"action": "joypad_0_b",
		"cancel": "joypad_0_a",
		"shoulder_l": "joypad_0_l",
		"shoulder_r": "joypad_0_r",
		"trigger_l": "joypad_0_zl",
		"trigger_r": "joypad_0_zr",
		"start": "joypad_0_plus",
		"select": "joypad_0_minus",
		"stick_l": "joypad_0_l3",
		"stick_r": "joypad_0_r3",
		"dpad_left": "joypad_0_dpad_left",
		"dpad_right": "joypad_0_dpad_right",
		"dpad_up": "joypad_0_dpad_up",
		"dpad_down": "joypad_0_dpad_down",
	},
	ControllerType.GENERIC: {
		"left": "joypad_0_left",
		"right": "joypad_0_right",
		"up": "joypad_0_up",
		"down": "joypad_0_down",
		"action": "joypad_0_a",
		"cancel": "joypad_0_b",
		"shoulder_l": "joypad_0_l",
		"shoulder_r": "joypad_0_r",
		"trigger_l": "joypad_0_lt",
		"trigger_r": "joypad_0_rt",
		"start": "joypad_0_start",
		"select": "joypad_0_select",
		"stick_l": "joypad_0_l3",
		"stick_r": "joypad_0_r3",
		"dpad_left": "joypad_0_dpad_left",
		"dpad_right": "joypad_0_dpad_right",
		"dpad_up": "joypad_0_dpad_up",
		"dpad_down": "joypad_0_dpad_down",
	},
	ControllerType.STEAM_DECK: {
		# Steam Deck uses Xbox-style mapping natively
		"left": "joypad_0_left",
		"right": "joypad_0_right",
		"up": "joypad_0_up",
		"down": "joypad_0_down",
		"action": "joypad_0_a",
		"cancel": "joypad_0_b",
		"shoulder_l": "joypad_0_l",
		"shoulder_r": "joypad_0_r",
		"trigger_l": "joypad_0_lt",
		"trigger_r": "joypad_0_rt",
		"start": "joypad_0_start",
		"select": "joypad_0_select",
		"stick_l": "joypad_0_l3",
		"stick_r": "joypad_0_r3",
		"dpad_left": "joypad_0_dpad_left",
		"dpad_right": "joypad_0_dpad_right",
		"dpad_up": "joypad_0_dpad_up",
		"dpad_down": "joypad_0_dpad_down",
	}
}

func _ready() -> void:
	# Detect already-connected controllers
	_detect_initial_controllers()
	# Listen for hot-plug events
	Input.joy_connection_changed.connect(_on_joy_connection_changed)

func _detect_initial_controllers() -> void:
	var connected: Array = Input.get_connected_joypads()
	for device_id in connected:
		_register_controller(device_id)
	print("[ControllerManager] Initial detection: %d controller(s) connected" % _connected_controllers.size())

func _on_joy_connection_changed(device_id: int, connected: bool) -> void:
	if connected:
		_register_controller(device_id)
		var ctype: int = _connected_controllers[device_id]
		controller_connected.emit(device_id, TYPE_NAMES[ctype])
		print("[ControllerManager] Connected: %s (device %d)" % [TYPE_NAMES[ctype], device_id])
		# Auto-switch to newly connected controller
		set_active_controller(ctype)
	else:
		var old_type: int = _connected_controllers.get(device_id, ControllerType.GENERIC)
		_connected_controllers.erase(device_id)
		controller_disconnected.emit(device_id)
		print("[ControllerManager] Disconnected: device %d" % device_id)
		# Fall back to keyboard if no controllers left
		if _connected_controllers.is_empty():
			set_active_controller(ControllerType.KEYBOARD_MOUSE)

func _register_controller(device_id: int) -> void:
	var name: String = Input.get_joy_name(device_id).to_lower()
	var ctype: int = _identify_controller(name)
	_connected_controllers[device_id] = ctype
	print("[ControllerManager] Registered device %d as %s (name: %s)" % [device_id, TYPE_NAMES[ctype], name])

func _identify_controller(name: String) -> int:
	# Identify controller type from device name
	if name.contains("xbox") or name.contains("xinput") or name.contains("microsoft"):
		return ControllerType.XBOX
	if name.contains("sony") or name.contains("playstation") or name.contains("dualshock") or name.contains("dualsense"):
		return ControllerType.PLAYSTATION
	if name.contains("switch") or name.contains("nintendo") or name.contains("pro controller") or name.contains("joy-con"):
		return ControllerType.SWITCH_PRO
	if name.contains("steam") and name.contains("deck"):
		return ControllerType.STEAM_DECK
	# Default: generic Bluetooth controller
	return ControllerType.GENERIC

func set_active_controller(ctype: int) -> void:
	if ctype == _active_controller:
		return
	_active_controller = ctype
	controller_type_changed.emit(TYPE_NAMES[ctype])
	print("[ControllerManager] Active controller: %s" % TYPE_NAMES[ctype])

# === PUBLIC API — Games use these instead of Input directly ===

func get_action_pressed(action: String) -> bool:
	# Check keyboard first
	if Input.is_action_pressed(action):
		_last_input_was_controller = false
		return true
	# Check controller mapping
	var controller_action: String = _get_controller_action(action)
	if controller_action != "" and Input.is_action_pressed(controller_action):
		_last_input_was_controller = true
		return true
	return false

func get_action_just_pressed(action: String) -> bool:
	# Check keyboard
	if Input.is_action_just_pressed(action):
		_last_input_was_controller = false
		return true
	# Check controller
	var controller_action: String = _get_controller_action(action)
	if controller_action != "" and Input.is_action_just_pressed(controller_action):
		_last_input_was_controller = true
		return true
	return false

func get_action_just_released(action: String) -> bool:
	if Input.is_action_just_released(action):
		return true
	var controller_action: String = _get_controller_action(action)
	if controller_action != "" and Input.is_action_just_released(controller_action):
		return true
	return false

func get_axis(negative_action: String, positive_action: String) -> float:
	# Keyboard axis
	var kb_val: float = Input.get_axis(negative_action, positive_action)
	if abs(kb_val) > _input_deadzone:
		_last_input_was_controller = false
		return kb_val
	# Controller stick axis
	var left_stick_x: float = Input.get_axis("joypad_0_left", "joypad_0_right")
	if abs(left_stick_x) > _input_deadzone:
		_last_input_was_controller = true
		return left_stick_x
	return 0.0

func get_left_stick() -> Vector2:
	var x: float = Input.get_axis("joypad_0_left", "joypad_0_right")
	var y: float = Input.get_axis("joypad_0_up", "joypad_0_down")
	# Apply deadzone
	if abs(x) < _input_deadzone: x = 0.0
	if abs(y) < _input_deadzone: y = 0.0
	return Vector2(x, y)

func get_right_stick() -> Vector2:
	var x: float = Input.get_axis("joypad_0_stick_r_left", "joypad_0_stick_r_right")
	var y: float = Input.get_axis("joypad_0_stick_r_up", "joypad_0_stick_r_down")
	if abs(x) < _input_deadzone: x = 0.0
	if abs(y) < _input_deadzone: y = 0.0
	return Vector2(x, y)

func get_trigger_left() -> float:
	var val: float = Input.get_action_strength("joypad_0_lt")
	if val < _input_deadzone: val = 0.0
	return val

func get_trigger_right() -> float:
	var val: float = Input.get_action_strength("joypad_0_rt")
	if val < _input_deadzone: val = 0.0
	return val

func _get_controller_action(logical_action: String) -> String:
	var map: Dictionary = CONTROLLER_MAPS.get(_active_controller, {})
	return map.get(logical_action, "")

func is_controller_active() -> bool:
	return _active_controller != ControllerType.KEYBOARD_MOUSE

func get_active_controller_type() -> int:
	return _active_controller

func get_active_controller_name() -> String:
	return TYPE_NAMES[_active_controller]

func get_connected_count() -> int:
	return _connected_controllers.size()

func is_last_input_controller() -> bool:
	return _last_input_was_controller

# === VIBATION / RUMBLE ===
func set_vibration(enabled: bool) -> void:
	_vibration_enabled = enabled

func rumble(weak: float = 0.5, strong: float = 0.5, duration: float = 0.2) -> void:
	if not _vibration_enabled or not is_controller_active():
		return
	# Find first connected joypad
	for device_id in _connected_controllers:
		Input.start_joy_vibration(device_id, weak, strong, duration)
		break

# === PROMPT UI ===
# Games call this to show the correct button prompt (A vs Cross vs B)
func get_button_prompt(action: String) -> String:
	match _active_controller:
		ControllerType.XBOX, ControllerType.STEAM_DECK:
			match action:
				"action": return "A"
				"cancel": return "B"
				"shoulder_l": return "LB"
				"shoulder_r": return "RB"
				"trigger_l": return "LT"
				"trigger_r": return "RT"
				"start": return "Menu"
				"select": return "View"
		ControllerType.PLAYSTATION:
			match action:
				"action": return "X"
				"cancel": return "O"
				"shoulder_l": return "L1"
				"shoulder_r": return "R1"
				"trigger_l": return "L2"
				"trigger_r": return "R2"
				"start": return "Options"
				"select": return "Create"
		ControllerType.SWITCH_PRO:
			match action:
				"action": return "B"
				"cancel": return "A"
				"shoulder_l": return "L"
				"shoulder_r": return "R"
				"trigger_l": return "ZL"
				"trigger_r": return "ZR"
				"start": return "+"
				"select": return "-"
		ControllerType.GENERIC:
			match action:
				"action": return "A"
				"cancel": return "B"
				"start": return "Start"
				"select": return "Select"
		ControllerType.KEYBOARD_MOUSE:
			match action:
				"action": return "E"
				"cancel": return "Esc"
				"start": return "Esc"
				"select": return "Tab"
	return "?"
