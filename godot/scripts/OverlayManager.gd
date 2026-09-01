extends Node
## OverlayManager.gd — Geode Inn Shared Script
## Manages Steam overlay activation across all games.
## Supports keyboard (Shift+Tab) and controller (LB+RB / L1+R1) activation.
## Built once, used by all 61 arcade games + MMORPG.
## Part of the Geode Inn Arcade Production Pipeline.

signal overlay_opened()
signal overlay_closed()
signal overlay_toggled(is_open: bool)

@export var enabled: bool = true
@export var keyboard_combo: String = "shift+tab"
@export var controller_combo_time_window: float = 0.3  # seconds to press both bumpers

var overlay_active: bool = false
var steam_available: bool = false
var lb_pressed: bool = false
var rb_pressed: bool = false
var lb_timer: float = 0.0
var rb_timer: float = 0.0

# Steam integration via GodotSteam
var steam: Object = null

func _ready() -> void:
	# Check if Steam is available
	_check_steam_availability()
	
	# Map the keyboard overlay shortcut
	InputMap.add_action("geode_overlay")
	var key_event = InputEventKey.new()
	key_event.physical_keycode = KEY_TAB
	key_event.shift_pressed = true
	InputMap.action_add_event("geode_overlay", key_event)
	
	# Map controller bumper actions
	# These should already exist in most games' input maps
	# We add them if missing
	_ensure_controller_actions()

func _check_steam_availability() -> void:
	# Try to load Steam singleton
	if Engine.has_singleton("Steam"):
		steam = Engine.get_singleton("Steam")
		steam_available = true
		print("[OverlayManager] Steam detected — overlay integration active")
	else:
		steam_available = false
		print("[OverlayManager] Steam not detected — running in standalone mode")

func _ensure_controller_actions() -> void:
	# Ensure left_bumper and right_bumper actions exist
	if not InputMap.has_action("geode_lb"):
		InputMap.add_action("geode_lb")
		for i in range(8):
			var event = InputEventJoypadButton.new()
			event.device = i
			event.button_index = JOY_BUTTON_LEFT_SHOULDER
			InputMap.action_add_event("geode_lb", event)
	
	if not InputMap.has_action("geode_rb"):
		InputMap.add_action("geode_rb")
		for i in range(8):
			var event = InputEventJoypadButton.new()
			event.device = i
			event.button_index = JOY_BUTTON_RIGHT_SHOULDER
			InputMap.action_add_event("geode_rb", event)

func _process(delta: float) -> void:
	if not enabled:
		return
	
	# Track bumper press timing for simultaneous detection
	if Input.is_action_pressed("geode_lb"):
		if not lb_pressed:
			lb_pressed = true
			lb_timer = controller_combo_time_window
		else:
			lb_timer -= delta
	else:
		lb_pressed = false
	
	if Input.is_action_pressed("geode_rb"):
		if not rb_pressed:
			rb_pressed = true
			rb_timer = controller_combo_time_window
		else:
			rb_timer -= delta
	else:
		rb_pressed = false
	
	# Check for simultaneous bumper press (both within time window)
	if lb_pressed and rb_pressed and lb_timer > 0 and rb_timer > 0:
		_toggle_overlay()
		lb_pressed = false
		rb_pressed = false
		lb_timer = 0.0
		rb_timer = 0.0

func _input(event: InputEvent) -> void:
	if not enabled:
		return
	
	# Keyboard shortcut: Shift+Tab
	if event is InputEventKey:
		if event.physical_keycode == KEY_TAB and event.shift_pressed and event.pressed:
			_toggle_overlay()

func _toggle_overlay() -> void:
	if overlay_active:
		_close_overlay()
	else:
		_open_overlay()

func _open_overlay() -> void:
	overlay_active = true
	
	if steam_available and steam:
		# Tell Steam to open the overlay
		steam.activateGameOverlay("Home")
	
	# Pause game while overlay is open
	get_tree().paused = true
	
	overlay_opened.emit()
	overlay_toggled.emit(true)
	print("[OverlayManager] Steam overlay opened — game paused")

func _close_overlay() -> void:
	overlay_active = false
	
	# Steam handles closing the overlay on its own
	# We just unpause when we detect it's gone
	get_tree().paused = false
	
	overlay_closed.emit()
	overlay_toggled.emit(false)
	print("[OverlayManager] Steam overlay closed — game resumed")

# === PUBLIC API ===

func is_overlay_active() -> bool:
	return overlay_active

func is_steam_available() -> bool:
	return steam_available

func open_overlay(section: String = "Home") -> void:
	# Valid sections: Home, Friends, OfficialGameGroup, Players, Community, Achievements
	if steam_available and steam:
		steam.activateGameOverlay(section)
	_open_overlay()

func open_overlay_web_page(url: String) -> void:
	if steam_available and steam:
		steam.activateGameOverlayToWebPage(url)
	_open_overlay()

func open_overlay_store_page(app_id: int) -> void:
	if steam_available and steam:
		steam.activateGameOverlayToStore(app_id)
	_open_overlay()

func open_overlay_achievements() -> void:
	open_overlay("Achievements")

func set_enabled(state: bool) -> void:
	enabled = state
	if not state and overlay_active:
		_close_overlay()
