class_name LookPanel
extends GamePanel
## The character creator: body, outfit, cloth colour, skin, hair and beard,
## with the person turning slowly beside the choices. Used from "New story"
## and from the pause menu. Emits the chosen look; whoever opened it saves it.

signal look_chosen(look: Dictionary)

var look: Dictionary = {}
var _preview_root: Node3D
var _holder: Node3D
var _person: CharacterModel
var _viewport: SubViewport


func _init() -> void:
	super._init("Your look", Vector2(860, 560))


## Opens on a look (the current one, or one picked from the name).
func edit(start: Dictionary) -> void:
	look = CharacterModel.sanitize_look(start)
	open()


func refresh() -> void:
	clear_body()
	look = CharacterModel.sanitize_look(look)
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 16)
	body.add_child(row)
	row.add_child(_build_preview())
	var col := VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_theme_constant_override("separation", 6)
	row.add_child(col)
	col.add_child(_choice_row("Body", ["Woman", "Man"], 0 if look["body"] == "female" else 1, func(i: int) -> void:
		look["body"] = "female" if i == 0 else "male"
		_changed()))
	col.add_child(_choice_row("Clothes", ["Peasant", "Ranger"], 0 if look["outfit"] == "peasant" else 1, func(i: int) -> void:
		look["outfit"] = "peasant" if i == 0 else "ranger"
		look["cloth_variant"] = ""
		_changed()))
	var outfit := String(look["outfit"])
	var variants: Array = CharacterModel.CLOTH_VARIANTS[outfit]
	col.add_child(_swatch_row("Colour", CharacterModel.CLOTH_SWATCH[outfit], variants.find(look["cloth_variant"]), func(i: int) -> void:
		look["cloth_variant"] = variants[i]
		_changed()))
	col.add_child(_swatch_row("Skin", _skin_swatches(), CharacterModel.SKIN_TINTS.find(look["skin"]), func(i: int) -> void:
		look["skin"] = CharacterModel.SKIN_TINTS[i]
		_changed()))
	col.add_child(_choice_row("Hair", ["None", "Short", "Parted", "Long", "Buns"], CharacterModel.HAIR_STYLES.find(look["hair"]), func(i: int) -> void:
		look["hair"] = CharacterModel.HAIR_STYLES[i]
		_changed()))
	col.add_child(_swatch_row("Hair colour", CharacterModel.HAIR_COLORS, CharacterModel.HAIR_COLORS.find(look["hair_color"]), func(i: int) -> void:
		look["hair_color"] = CharacterModel.HAIR_COLORS[i]
		_changed()))
	if look["outfit"] == "ranger":
		col.add_child(_check("Hood up", bool(look["hood"]), func(v: bool) -> void:
			look["hood"] = v
			_changed()))
	if look["body"] == "male":
		col.add_child(_check("Beard", bool(look["beard"]), func(v: bool) -> void:
			look["beard"] = v
			_changed()))
	col.add_child(HSeparator.new())
	var buttons := HBoxContainer.new()
	col.add_child(buttons)
	buttons.add_child(UITheme.button("Surprise me", func() -> void:
		look = CharacterModel.sanitize_look(CharacterModel.PLAYER_LOOKS[randi() % CharacterModel.PLAYER_LOOKS.size()])
		_changed()))
	buttons.add_child(UITheme.button("This is me", func() -> void:
		look_chosen.emit(look.duplicate())
		close()))


func _changed() -> void:
	look = CharacterModel.sanitize_look(look)
	refresh()


# ---------------------------------------------------------------- the preview

func _build_preview() -> Control:
	var frame := SubViewportContainer.new()
	frame.custom_minimum_size = Vector2(300, 440)
	frame.stretch = true
	_viewport = SubViewport.new()
	_viewport.own_world_3d = true
	_viewport.transparent_bg = false
	_viewport.audio_listener_enable_3d = false
	frame.add_child(_viewport)
	_preview_root = Node3D.new()
	_viewport.add_child(_preview_root)
	var env := WorldEnvironment.new()
	env.environment = Environment.new()
	env.environment.background_mode = Environment.BG_COLOR
	env.environment.background_color = Color(0.1, 0.07, 0.05)
	env.environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.environment.ambient_light_color = Color(0.75, 0.62, 0.5)
	env.environment.ambient_light_energy = 0.6
	env.environment.tonemap_mode = Environment.TONE_MAPPER_FILMIC
	_preview_root.add_child(env)
	var key := DirectionalLight3D.new()
	key.rotation = Vector3(-0.5, 0.6, 0)
	key.light_color = Color(1.0, 0.86, 0.68)
	key.light_energy = 1.2
	_preview_root.add_child(key)
	var rim := DirectionalLight3D.new()
	rim.rotation = Vector3(-0.3, PI + 0.4, 0)
	rim.light_color = Color(0.6, 0.7, 1.0)
	rim.light_energy = 0.5
	_preview_root.add_child(rim)
	var floor_disc := Builder.cylinder(_preview_root, 0.6, 0.04, Vector3(0, -0.02, 0), Color(0.24, 0.17, 0.11), false)
	floor_disc.name = "Floor"
	var cam := Camera3D.new()
	cam.fov = 32.0
	_preview_root.add_child(cam)
	cam.transform = Transform3D(Basis(), Vector3(0, 1.05, 4.2)).looking_at(Vector3(0, 0.95, 0))
	cam.current = true
	_holder = Node3D.new()
	_holder.rotation.y = PI + 0.5   # facing the camera, turned a little
	_preview_root.add_child(_holder)
	if CharacterModel.available():
		_person = CharacterModel.make(_holder, look, "Preview")
	return frame


func _process(delta: float) -> void:
	if visible and _holder != null and is_instance_valid(_holder):
		_holder.rotation.y += delta * 0.35


# ---------------------------------------------------------------- controls

func _label(text_value: String) -> Label:
	var l := UITheme.cell(text_value, 15, UITheme.MUTED)
	l.custom_minimum_size = Vector2(110, 0)
	return l


func _choice_row(text_value: String, options: Array, selected: int, on_pick: Callable) -> Control:
	var row := HBoxContainer.new()
	row.add_child(_label(text_value))
	for i in options.size():
		var b := UITheme.button(String(options[i]), func() -> void: on_pick.call(i))
		b.toggle_mode = true
		b.button_pressed = i == selected
		row.add_child(b)
	return row


func _swatch_row(text_value: String, colors: Array, selected: int, on_pick: Callable) -> Control:
	var row := HBoxContainer.new()
	row.add_child(_label(text_value))
	for i in colors.size():
		var b := Button.new()
		b.custom_minimum_size = Vector2(30, 30)
		b.tooltip_text = text_value
		var c := Color.html(String(colors[i]))
		for state in ["normal", "hover", "pressed", "focus"]:
			var sb := StyleBoxFlat.new()
			sb.bg_color = c
			sb.set_corner_radius_all(5)
			sb.set_border_width_all(3 if i == selected else (2 if state == "hover" else 0))
			sb.border_color = UITheme.AMBER_BRIGHT if i == selected else UITheme.AMBER
			b.add_theme_stylebox_override(state, sb)
		b.pressed.connect(func() -> void: on_pick.call(i))
		b.pressed.connect(AudioDirector.ui_tick)
		row.add_child(b)
	return row


func _check(text_value: String, value: bool, on_toggle: Callable) -> Control:
	var c := CheckBox.new()
	c.text = text_value
	c.button_pressed = value
	c.toggled.connect(func(v: bool) -> void: on_toggle.call(v))
	return c


## The skin tints over the kit's own skin colour, as they'll actually look.
func _skin_swatches() -> Array:
	var base := Color(0.86, 0.64, 0.5)
	var out := []
	for hex in CharacterModel.SKIN_TINTS:
		var t := Color.html(String(hex))
		out.append(Color(base.r * t.r, base.g * t.g, base.b * t.b).to_html(false))
	return out
