extends Node
## Player settings, saved to user://settings.cfg. Also sets up the input map
## in code so keyboard and gamepad bindings live in one readable place.

const PATH := "user://settings.cfg"

## Pulse Line and frequency-system modalities (walk-through 1.5).
var pulse_audio := true
var pulse_haptic := true
var pulse_visual := true
var minimal_mode := false
var silent_mode := false

var master_volume := 0.9
var music_volume := 0.7
var voices_volume := 0.8
var effects_volume := 0.9
var text_speed := 1.0          # multiplier on each character's reveal speed
var mouse_sensitivity := 0.25
var fullscreen := false
## "auto" picks lighter graphics on computers without a graphics card;
## "high" or "low" when the player chooses.
var graphics_quality := "auto"
var player_name := ""
var server_address := "127.0.0.1"


func _ready() -> void:
	_setup_input()
	load_settings()
	apply()


func load_settings() -> void:
	var cfg := ConfigFile.new()
	if cfg.load(PATH) != OK:
		return
	pulse_audio = cfg.get_value("pulse", "audio", pulse_audio)
	pulse_haptic = cfg.get_value("pulse", "haptic", pulse_haptic)
	pulse_visual = cfg.get_value("pulse", "visual", pulse_visual)
	minimal_mode = cfg.get_value("pulse", "minimal", minimal_mode)
	silent_mode = cfg.get_value("pulse", "silent", silent_mode)
	master_volume = cfg.get_value("audio", "master", master_volume)
	music_volume = cfg.get_value("audio", "music", music_volume)
	voices_volume = cfg.get_value("audio", "voices", voices_volume)
	effects_volume = cfg.get_value("audio", "effects", effects_volume)
	text_speed = cfg.get_value("game", "text_speed", text_speed)
	mouse_sensitivity = cfg.get_value("game", "mouse_sensitivity", mouse_sensitivity)
	fullscreen = cfg.get_value("video", "fullscreen", fullscreen)
	graphics_quality = cfg.get_value("video", "quality", graphics_quality)
	player_name = cfg.get_value("online", "player_name", player_name)
	server_address = cfg.get_value("online", "server_address", server_address)


func save_settings() -> void:
	var cfg := ConfigFile.new()
	cfg.set_value("pulse", "audio", pulse_audio)
	cfg.set_value("pulse", "haptic", pulse_haptic)
	cfg.set_value("pulse", "visual", pulse_visual)
	cfg.set_value("pulse", "minimal", minimal_mode)
	cfg.set_value("pulse", "silent", silent_mode)
	cfg.set_value("audio", "master", master_volume)
	cfg.set_value("audio", "music", music_volume)
	cfg.set_value("audio", "voices", voices_volume)
	cfg.set_value("audio", "effects", effects_volume)
	cfg.set_value("game", "text_speed", text_speed)
	cfg.set_value("game", "mouse_sensitivity", mouse_sensitivity)
	cfg.set_value("video", "fullscreen", fullscreen)
	cfg.set_value("video", "quality", graphics_quality)
	cfg.set_value("online", "player_name", player_name)
	cfg.set_value("online", "server_address", server_address)
	cfg.save(PATH)


## Silent Mode turns sound and haptics off and keeps only the visual line,
## so the whole frequency system works by sight alone.
func set_silent_mode(on: bool) -> void:
	silent_mode = on
	if on:
		pulse_audio = false
		pulse_haptic = false
		pulse_visual = true
	apply()


func effective_pulse_audio() -> bool:
	return pulse_audio and not silent_mode


func effective_pulse_haptic() -> bool:
	return pulse_haptic and not silent_mode


func effective_pulse_visual() -> bool:
	return pulse_visual or silent_mode


## Lighter graphics: fewer plants, no sun shadows, the 3D drawn at 75% and
## scaled up. For computers that draw in software (no graphics card).
func low_detail() -> bool:
	if graphics_quality == "auto":
		var adapter := RenderingServer.get_video_adapter_name().to_lower()
		return "basic render" in adapter or "llvmpipe" in adapter or "swiftshader" in adapter or "software" in adapter
	return graphics_quality == "low"


func apply() -> void:
	if not is_inside_tree():
		return
	if DisplayServer.get_name() != "headless":
		var mode := DisplayServer.WINDOW_MODE_FULLSCREEN if fullscreen else DisplayServer.WINDOW_MODE_WINDOWED
		if DisplayServer.window_get_mode() != mode:
			DisplayServer.window_set_mode(mode)
		get_tree().root.scaling_3d_scale = 0.75 if low_detail() else 1.0
		get_tree().root.mesh_lod_threshold = 8.0 if low_detail() else 1.0
	EventBus.settings_changed.emit()


func _setup_input() -> void:
	_bind("move_forward", [KEY_W, KEY_UP], [], [[JOY_AXIS_LEFT_Y, -1.0]])
	_bind("move_back", [KEY_S, KEY_DOWN], [], [[JOY_AXIS_LEFT_Y, 1.0]])
	_bind("move_left", [KEY_A, KEY_LEFT], [], [[JOY_AXIS_LEFT_X, -1.0]])
	_bind("move_right", [KEY_D, KEY_RIGHT], [], [[JOY_AXIS_LEFT_X, 1.0]])
	_bind("look_left", [], [], [[JOY_AXIS_RIGHT_X, -1.0]])
	_bind("look_right", [], [], [[JOY_AXIS_RIGHT_X, 1.0]])
	_bind("interact", [KEY_E, KEY_ENTER], [JOY_BUTTON_A], [])
	_bind("sit", [KEY_C], [JOY_BUTTON_Y], [])
	_bind("tap", [KEY_SPACE], [JOY_BUTTON_X], [])
	_bind("journal", [KEY_J], [JOY_BUTTON_BACK], [])
	_bind("cave", [KEY_G], [JOY_BUTTON_LEFT_SHOULDER], [])
	_bind("chat", [KEY_T], [JOY_BUTTON_RIGHT_SHOULDER], [])
	_bind("menu", [KEY_ESCAPE], [JOY_BUTTON_START], [])
	_bind("ui_close", [KEY_ESCAPE], [JOY_BUTTON_B], [])


func _bind(action: String, keys: Array, buttons: Array, axes: Array) -> void:
	if not InputMap.has_action(action):
		InputMap.add_action(action, 0.2)
	for k in keys:
		var ev := InputEventKey.new()
		ev.physical_keycode = k
		InputMap.action_add_event(action, ev)
	for b in buttons:
		var jb := InputEventJoypadButton.new()
		jb.button_index = b
		InputMap.action_add_event(action, jb)
	for a in axes:
		var ja := InputEventJoypadMotion.new()
		ja.axis = a[0]
		ja.axis_value = a[1]
		InputMap.action_add_event(action, ja)
