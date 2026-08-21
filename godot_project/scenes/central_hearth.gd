class_name CentralHearth
extends Node2D

## Script for the 'Central Hearth' scene in Geode Inn.
## Serves as the warm social heart of the Inn.
## EPILEPSY WARNING: Fire light energy uses a smooth sine wave (1.5 + 0.2 * sin(TIME * 0.5)),
## strictly avoiding random flickering or high-frequency stroboscopic effects.
## Features CanvasModulate #18120C, soft rising ember particles, a heat distortion shader,
## and cozy hearthside seating Area2D triggers.

signal hearth_rested(patron_seat_id: String)
signal hearth_talk_started(topic: String)

@export_group("Canvas Atmosphere")
## Deep atmospheric canvas tint (#18120C)
@export var canvas_tint: Color = Color("18120c")

@export_group("Fire Lighting & Epilepsy Safety")
## Fire point light color (#FBE9C3)
@export var fire_light_color: Color = Color("fbe9c3")
## Base energy level for fire light
@export var base_fire_energy: float = 1.5
## Amplitude of gentle sine oscillation
@export var fire_pulse_amplitude: float = 0.2
## Sine wave angular frequency (0.5 rad/s = 12.57s period, safely >= 2.5s)
@export var fire_pulse_frequency: float = 0.5
## Fire light center position
@export var hearth_center_pos: Vector2 = Vector2(960, 540)

@export_group("Ember Particles")
## Number of rising ember particles
@export var ember_particle_count: int = 35

# Nodes
var _canvas_modulate: CanvasModulate
var _fire_light: PointLight2D
var _ember_particles: GPUParticles2D
var _heat_distortion_rect: ColorRect
var _seating_container: Node2D
var _hearth_ui: CanvasLayer

# Seating Area Positions around the central hearth
var _seating_spots: Array[Dictionary] = [
	{
		"seat_id": "seat_north_bench",
		"name": "Carved Oak Bench",
		"pos": Vector2(960, 380),
		"topic": "Warm Tales of Old Travel"
	},
	{
		"seat_id": "seat_east_armchair",
		"name": "Leather Armchair",
		"pos": Vector2(1180, 540),
		"topic": "Alchemical Whispers"
	},
	{
		"seat_id": "seat_south_hearthrug",
		"name": "Woven Hearth Rug",
		"pos": Vector2(960, 700),
		"topic": "Quiet Contemplation"
	},
	{
		"seat_id": "seat_west_stool",
		"name": "Timber Stool",
		"pos": Vector2(740, 540),
		"topic": "Innkeeper's Lore"
	}
]


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("central_hearth")

	# 2. CanvasModulate setup (#18120C)
	_setup_canvas_modulate()

	# 3. Construct Central Hearth stone fireplace visuals
	_setup_hearth_structure()

	# 4. Setup Epilepsy-Safe Fire PointLight2D (#FBE9C3)
	_setup_fire_lighting()

	# 5. Build heat distortion shader overlay
	_setup_heat_distortion_shader()

	# 6. Instantiate rising ember particles (GPUParticles2D)
	_setup_rising_embers()

	# 7. Create seating Area2D interactables around the hearth
	_setup_hearth_seating()

	# 8. Setup UI overlay for resting and hearthside conversation
	_setup_hearth_ui()


func _process(_delta: float) -> void:
	# EPILEPSY SAFETY GUARANTEE: Smooth sine wave oscillation with period = 12.57 seconds (>= 2.5s).
	# Formula: energy = 1.5 + 0.2 * sin(TIME * 0.5)
	if _fire_light != null:
		var time_sec: float = Time.get_ticks_msec() * 0.001
		_fire_light.energy = base_fire_energy + fire_pulse_amplitude * sin(time_sec * fire_pulse_frequency)


func _setup_canvas_modulate() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "HearthCanvasModulate"
	_canvas_modulate.color = canvas_tint
	add_child(_canvas_modulate)


func _create_radial_light_texture(radius: int = 256) -> GradientTexture2D:
	var grad := Gradient.new()
	grad.set_color(0, Color(1, 1, 1, 1))
	grad.set_color(1, Color(1, 1, 1, 0))
	var tex := GradientTexture2D.new()
	tex.gradient = grad
	tex.fill = GradientTexture2D.FILL_RADIAL
	tex.fill_from = Vector2(0.5, 0.5)
	tex.fill_to = Vector2(1.0, 0.5)
	tex.width = radius * 2
	tex.height = radius * 2
	return tex


func _setup_hearth_structure() -> void:
	var hearth_bg := ColorRect.new()
	hearth_bg.name = "HearthRoomFloor"
	hearth_bg.size = Vector2(1920, 1080)
	hearth_bg.color = Color("120d08")
	add_child(hearth_bg)

	# Central Stone Pit
	var pit := ColorRect.new()
	pit.name = "StoneFirePit"
	pit.size = Vector2(180, 180)
	pit.position = hearth_center_pos - Vector2(90, 90)
	pit.color = Color("2b1d14")
	add_child(pit)


func _setup_fire_lighting() -> void:
	if get_node_or_null("/root/CatacombLighting"):
		_fire_light = CatacombLighting.create_torch_light(fire_light_color, base_fire_energy, hearth_center_pos)
	else:
		_fire_light = PointLight2D.new()
		_fire_light.name = "CentralFireLight"
		_fire_light.color = fire_light_color
		_fire_light.energy = base_fire_energy
		_fire_light.position = hearth_center_pos
		_fire_light.texture = _create_radial_light_texture(320)
		_fire_light.texture_scale = 1.8
		add_child(_fire_light)


func _setup_heat_distortion_shader() -> void:
	var back_buffer := BackBufferCopy.new()
	back_buffer.name = "HeatBackBuffer"
	back_buffer.copy_mode = BackBufferCopy.COPY_MODE_RECT
	back_buffer.rect = Rect2(hearth_center_pos.x - 120, hearth_center_pos.y - 200, 240, 240)
	add_child(back_buffer)

	_heat_distortion_rect = ColorRect.new()
	_heat_distortion_rect.name = "HeatDistortionOverlay"
	_heat_distortion_rect.size = Vector2(240, 240)
	_heat_distortion_rect.position = hearth_center_pos - Vector2(120, 200)

	var shader := Shader.new()
	shader.code = """
	shader_type canvas_item;

	uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;
	uniform float distortion_strength : hint_range(0.0, 0.05) = 0.012;
	uniform float distortion_speed : hint_range(0.1, 3.0) = 0.8;

	void fragment() {
		vec2 uv = SCREEN_UV;
		float wave_x = sin(uv.y * 30.0 + TIME * distortion_speed) * distortion_strength;
		float wave_y = cos(uv.x * 30.0 + TIME * distortion_speed) * distortion_strength;
		vec2 offset = vec2(wave_x, wave_y);

		// Fade out distortion near edges
		float mask = smoothstep(0.5, 0.0, length(UV - vec2(0.5)));
		COLOR = texture(screen_texture, uv + offset * mask);
	}
	"""

	var mat := ShaderMaterial.new()
	mat.shader = shader
	_heat_distortion_rect.material = mat
	add_child(_heat_distortion_rect)


func _setup_rising_embers() -> void:
	_ember_particles = GPUParticles2D.new()
	_ember_particles.name = "RisingEmberParticles"
	_ember_particles.position = hearth_center_pos
	_ember_particles.amount = ember_particle_count
	_ember_particles.lifetime = 4.0
	_ember_particles.preprocess = 2.0

	var mat := ParticleProcessMaterial.new()
	mat.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_CIRCLE
	mat.emission_sphere_radius = 45.0
	mat.direction = Vector3(0, -1, 0)
	mat.spread = 20.0
	mat.initial_velocity_min = 20.0
	mat.initial_velocity_max = 45.0
	mat.gravity = Vector3(0, -5.0, 0) # Rising upward slowly
	mat.scale_min = 1.5
	mat.scale_max = 3.5

	var grad := Gradient.new()
	grad.set_color(0, Color(fire_light_color.r, fire_light_color.g, fire_light_color.b, 1.0))
	grad.set_color(1, Color(fire_light_color.r * 0.5, 0.1, 0.0, 0.0))
	grad.add_point(0.4, Color(1.0, 0.5, 0.1, 0.8))

	var grad_tex := GradientTexture1D.new()
	grad_tex.gradient = grad
	mat.color_ramp = grad_tex

	_ember_particles.process_material = mat
	add_child(_ember_particles)


func _setup_hearth_seating() -> void:
	_seating_container = Node2D.new()
	_seating_container.name = "HearthSeatingSpots"
	add_child(_seating_container)

	for spot in _seating_spots:
		var pos: Vector2 = spot["pos"]

		# Visual stool/bench placeholder
		var seat_visual := ColorRect.new()
		seat_visual.name = "Visual_" + spot["seat_id"]
		seat_visual.size = Vector2(80, 50)
		seat_visual.position = pos - Vector2(40, 25)
		seat_visual.color = Color("382417")
		_seating_container.add_child(seat_visual)

		# Area2D for Sit & Rest interaction
		var area := Area2D.new()
		area.name = spot["seat_id"]
		area.position = pos

		var col := CollisionShape2D.new()
		var shape := CircleShape2D.new()
		shape.radius = 55.0
		col.shape = shape
		area.add_child(col)

		area.input_event.connect(_on_seat_input_event.bind(spot))
		_seating_container.add_child(area)


func _on_seat_input_event(_vp: Node, event: InputEvent, _idx: int, spot: Dictionary) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_show_hearth_dialog(spot["name"], "You take a seat by the warm hearth. " + spot["topic"] + " fills the air.")
		hearth_rested.emit(spot["seat_id"])
		hearth_talk_started.emit(spot["topic"])


func _setup_hearth_ui() -> void:
	_hearth_ui = CanvasLayer.new()
	_hearth_ui.name = "HearthUILayer"
	_hearth_ui.visible = false
	add_child(_hearth_ui)

	var panel := PanelContainer.new()
	panel.name = "HearthPanel"
	panel.anchor_left = 0.25
	panel.anchor_top = 0.75
	panel.anchor_right = 0.75
	panel.anchor_bottom = 0.92
	_hearth_ui.add_child(panel)

	var margin := MarginContainer.new()
	margin.name = "Margin"
	margin.add_theme_constant_override("margin_left", 20)
	margin.add_theme_constant_override("margin_top", 15)
	margin.add_theme_constant_override("margin_right", 20)
	margin.add_theme_constant_override("margin_bottom", 15)
	panel.add_child(margin)

	var vbox := VBoxContainer.new()
	vbox.name = "VBox"
	margin.add_child(vbox)

	var title_lbl := Label.new()
	title_lbl.name = "Title"
	title_lbl.add_theme_color_override("font_color", fire_light_color)
	vbox.add_child(title_lbl)

	var desc_lbl := Label.new()
	desc_lbl.name = "Desc"
	desc_lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
	vbox.add_child(desc_lbl)


func _show_hearth_dialog(title: String, desc: String) -> void:
	var title_lbl: Label = _hearth_ui.get_node("HearthPanel/Margin/VBox/Title")
	var desc_lbl: Label = _hearth_ui.get_node("HearthPanel/Margin/VBox/Desc")

	title_lbl.text = title
	desc_lbl.text = desc
	_hearth_ui.visible = true

	var tween := create_tween()
	tween.tween_interval(4.5)
	tween.tween_callback(func(): _hearth_ui.visible = false)
