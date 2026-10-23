class_name SettingsPanel
extends GamePanel
## Accessibility first: each of the frequency system's three modalities can be
## turned off on its own, plus Minimal Mode and Silent Mode (walk-through 1.5).


func _init() -> void:
	super._init("Settings", Vector2(640, 560))


func refresh() -> void:
	clear_body()
	body.add_child(UITheme.title("The Pulse", 20))
	_toggle("Sound (heartbeat you can hear)", Settings.pulse_audio, func(v: bool) -> void: Settings.pulse_audio = v)
	_toggle("Rumble (heartbeat you can feel, gamepad)", Settings.pulse_haptic, func(v: bool) -> void: Settings.pulse_haptic = v)
	_toggle("Pulse Line (heartbeat you can see)", Settings.pulse_visual, func(v: bool) -> void: Settings.pulse_visual = v)
	_toggle("Minimal Mode (just a soft spike)", Settings.minimal_mode, func(v: bool) -> void: Settings.minimal_mode = v)
	_toggle("Silent Mode (everything by sight alone)", Settings.silent_mode, func(v: bool) -> void:
		Settings.set_silent_mode(v)
		refresh())
	body.add_child(HSeparator.new())
	body.add_child(UITheme.title("Sound", 20))
	_slider("Master", Settings.master_volume, func(v: float) -> void: Settings.master_volume = v)
	_slider("Music and the Song", Settings.music_volume, func(v: float) -> void: Settings.music_volume = v)
	_slider("Voices", Settings.voices_volume, func(v: float) -> void: Settings.voices_volume = v)
	_slider("Stones and effects", Settings.effects_volume, func(v: float) -> void: Settings.effects_volume = v)
	body.add_child(HSeparator.new())
	body.add_child(UITheme.title("Game", 20))
	_slider("Text speed", Settings.text_speed / 2.0, func(v: float) -> void: Settings.text_speed = maxf(v * 2.0, 0.2))
	_slider("Mouse look", Settings.mouse_sensitivity, func(v: float) -> void: Settings.mouse_sensitivity = maxf(v, 0.05))
	_toggle("Fullscreen", Settings.fullscreen, func(v: bool) -> void: Settings.fullscreen = v)


func _toggle(label_text: String, value: bool, setter: Callable) -> void:
	var c := CheckBox.new()
	c.text = label_text
	c.button_pressed = value
	c.toggled.connect(func(v: bool) -> void:
		setter.call(v)
		Settings.apply()
		Settings.save_settings())
	body.add_child(c)


func _slider(label_text: String, value: float, setter: Callable) -> void:
	var row := HBoxContainer.new()
	body.add_child(row)
	var l := UITheme.text(label_text, 16)
	l.custom_minimum_size = Vector2(220, 0)
	row.add_child(l)
	var s := HSlider.new()
	s.min_value = 0.0
	s.max_value = 1.0
	s.step = 0.01
	s.value = value
	s.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	s.value_changed.connect(func(v: float) -> void:
		setter.call(v)
		Settings.apply()
		Settings.save_settings())
	row.add_child(s)
