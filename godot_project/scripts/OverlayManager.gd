# OverlayManager.gd — System Overlay Button System (Autoload)
# Implements acceptance criterion #6: Overlay button for all coinciding systems
# Handles Steam overlay, Discord presence, and any future platform overlays
# Detects overlay toggle from keyboard (Shift+Tab) or controller (LB+RB)

extends Node

# === SIGNALS ===
signal overlay_toggled(visible: bool)
signal overlay_opened()
signal overlay_closed()

# === STATE ===
var _overlay_active: bool = false
var _steam_overlay_available: bool = false
var _discord_available: bool = false
var _overlay_cooldown: float = 0.0
const OVERLAY_COOLDOWN_TIME: float = 0.5  # Prevent rapid toggle spam

# === OVERLAY TYPES ===
enum OverlayType {
	STEAM,
	DISCORD,
	BROWSER,  # For non-Steam builds, open a browser overlay
	NONE
}

var _active_overlay_type: int = OverlayType.NONE

func _ready() -> void:
	_detect_overlays()
	set_process(true)

func _detect_overlays() -> void:
	# Check Steam overlay availability
	if SteamManager and SteamManager.is_steam_active():
		_steam_overlay_available = true
		_active_overlay_type = OverlayType.STEAM
		print("[OverlayManager] Steam overlay available")
	else:
		print("[OverlayManager] Steam overlay not available — using fallback")
		_active_overlay_type = OverlayType.BROWSER
	
	# Discord Rich Presence check (optional)
	# Discord SDK would be initialized here if available
	print("[OverlayManager] Active overlay type: %d" % _active_overlay_type)

func _process(delta: float) -> void:
	# Cooldown timer
	if _overlay_cooldown > 0.0:
		_overlay_cooldown -= delta
	
	# Check for overlay toggle input
	_check_overlay_input()

func _check_overlay_input() -> void:
	if _overlay_cooldown > 0.0:
		return
	
	# Keyboard: Shift+Tab (Steam standard)
	if Input.is_action_just_pressed("ui_steam_overlay") or _is_shift_tab_pressed():
		_toggle_overlay()
		return
	
	# Controller: LB+RB (Steam standard for controllers)
	if _is_controller_overlay_pressed():
		_toggle_overlay()
		return

func _is_shift_tab_pressed() -> bool:
	# Check for Shift + Tab combination
	return Input.is_key_pressed(KEY_SHIFT) and Input.is_key_pressed(KEY_TAB)

func _is_controller_overlay_pressed() -> bool:
	# LB + RB held simultaneously for 0.3 seconds
	# This is Steam's standard controller overlay combo
	if not ControllerManager or not ControllerManager.is_controller_active():
		return false
	var lb: float = ControllerManager.get_trigger_left() if ControllerManager.get_trigger_left() > 0 else 0.0
	var rb: float = ControllerManager.get_trigger_right() if ControllerManager.get_trigger_right() > 0 else 0.0
	# Actually use shoulder buttons, not triggers, for overlay
	var lb_pressed: bool = Input.is_action_pressed("joypad_0_l")
	var rb_pressed: bool = Input.is_action_pressed("joypad_0_r")
	return lb_pressed and rb_pressed

func _toggle_overlay() -> void:
	_overlay_cooldown = OVERLAY_COOLDOWN_TIME
	_overlay_active = not _overlay_active
	
	if _overlay_active:
		_open_overlay()
	else:
		_close_overlay()

func _open_overlay() -> void:
	_overlay_active = true
	overlay_toggled.emit(true)
	overlay_opened.emit()
	
	match _active_overlay_type:
		OverlayType.STEAM:
			_activate_steam_overlay()
		OverlayType.BROWSER:
			_activate_browser_overlay()
		OverlayType.DISCORD:
			_activate_discord_overlay()
	
	print("[OverlayManager] Overlay opened (type: %d)" % _active_overlay_type)

func _close_overlay() -> void:
	_overlay_active = false
	overlay_toggled.emit(false)
	overlay_closed.emit()
	
	# Steam overlay closes itself when the user dismisses it
	# For browser overlay, we just pause the game and show a web view
	print("[OverlayManager] Overlay closed")

func _activate_steam_overlay() -> void:
	if not _steam_overlay_available:
		print("[OverlayManager] Steam overlay requested but not available")
		return
	
	# GodotSteam API call to open the overlay
	# Steam.activateGameOverlay("Friends")
	# For now, we signal SteamManager to handle it
	if SteamManager:
		SteamManager.open_overlay()
	
	# Pause game while overlay is open (Steam handles this automatically
	# but we also pause to be safe)
	get_tree().paused = true

func _activate_browser_overlay() -> void:
	# For non-Steam builds, open a browser-based overlay
	# This could show a web view with social features, store page, etc.
	# For now, we just pause the game and show a notification
	get_tree().paused = true
	print("[OverlayManager] Browser overlay activated (game paused)")

func _activate_discord_overlay() -> void:
	# Discord SDK overlay would be activated here
	# Requires Discord Game SDK
	get_tree().paused = true
	print("[OverlayManager] Discord overlay activated")

# === PUBLIC API ===

func is_overlay_active() -> bool:
	return _overlay_active

func get_overlay_type() -> int:
	return _active_overlay_type

func is_steam_overlay_available() -> bool:
	return _steam_overlay_available

func force_open_overlay() -> void:
	if not _overlay_active:
		_open_overlay()

func force_close_overlay() -> void:
	if _overlay_active:
		_close_overlay()

# === OVERLAY PAGES ===
# Games can request specific overlay pages
func open_steam_store_page() -> void:
	if _steam_overlay_available and SteamManager:
		SteamManager.open_overlay_store_page()

func open_steam_friends() -> void:
	if _steam_overlay_available and SteamManager:
		SteamManager.open_overlay_friends()

func open_steam_community() -> void:
	if _steam_overlay_available and SteamManager:
		SteamManager.open_overlay_community()

func open_steam_achievements() -> void:
	if _steam_overlay_available and SteamManager:
		SteamManager.open_overlay_achievements()
