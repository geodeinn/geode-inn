class_name Transformation
extends Node2D

## Script for the 'Transformation Chamber' in Geode Inn.
## The alchemical chamber where matter changes state.
## EPILEPSY WARNING: Rune pulse emission uses a gentle sine wave (0.5 + 0.3 * sin(TIME * 0.4)),
## with a 15.7-second period (safely >= 2.5s) to guarantee epilepsy safety.
## Features CanvasModulate #151812, cool sage-green lighting (#ABC9C3 energy 0.6),
## floating spore particles (GPUParticles2D), and an interactive ritual circle Area2D.

signal transformation_ritual_begun(element_source: String, element_result: String)

@export_group("Canvas Atmosphere")
## Deep sage laboratory canvas tint (#151812)
@export var canvas_tint: Color = Color("151812")

@export_group("Cool Sage Lighting & Epilepsy Safety")
## Cool sage-green lighting color (#ABC9C3)
@export var sage_light_color: Color = Color("abc9c3")
@export var sage_light_energy: float = 0.6
@export var ritual_circle_pos: Vector2 = Vector2(960, 540)

## Angular frequency for rune sine pulse (0.4 rad/s = 15.71s period, safely >= 2.5s)
@export var rune_pulse_frequency: float = 0.4

@export_group("Spore Particles")
## Number of floating sage spore particles
@export var spore_particle_count: int = 35

# Nodes
var _canvas_modulate: CanvasModulate
var _sage_light: PointLight2D
var _rune_circle_rect: ColorRect
var _spore_particles: GPUParticles2D
var _ritual_area: Area2D
var _transformation_ui: CanvasLayer


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("transformation")

	# 2. CanvasModulate setup (#151812)
	_setup_canvas_modulate()

	# 3. Transformation chamber environment floor
	_setup_chamber_floor()

	# 4. Cool sage-green light (#ABC9C3 energy 0.6)
	_setup_sage_lighting()

	# 5. Rune pulse shader with epilepsy-safe sine wave emission
	_setup_rune_pulse_shader()

	# 6. Floating spore particles emitter (GPUParticles2D)
	_setup_spore_particles()

	# 7. Interactive Ritual Circle Area2D
	_setup_ritual_circle_interactable()

	# 8. Setup UI overlay for transformation rituals
	_setup_transformation_ui()


func _process(delta: float) -> void:
	# Epilepsy safety: Gentle sine wave pulse for sage light (period = 15.71s >= 2.5s)
	if _sage_light != null:
		var time_sec: float = Time.get_ticks_msec() * 0.001
		var wave: float = sin(time_sec * rune_pulse_frequency) * 0.08
		_sage_light.energy = sage_light_energy + wave


func _setup_canvas_modulate() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "TransformationCanvasModulate"
	_canvas_modulate.color = canvas_tint
	add_child(_canvas_modulate)


func _setup_chamber_floor() -> void:
	var floor_bg := ColorRect.new()
	floor_bg.name = "TransformationChamberFloor"
	floor_bg.size = Vector2(1920, 1080)
	floor_bg.color = Color("10130d")
	add_child(floor_bg)


func _create_radial_light_texture(radius: int = 240) -> GradientTexture2D:
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


func _setup_sage_lighting() -> void:
	if get_node_or_null("/root/CatacombLighting"):
		_sage_light = CatacombLighting.create_torch_light(sage_light_color, sage_light_energy, ritual_circle_pos)
	else:
		_sage_light = PointLight2D.new()
		_sage_light.name = "CoolSageLight"
		_sage_light.color = sage_light_color
		_sage_light.energy = sage_light_energy
		_sage_light.position = ritual_circle_pos
		_sage_light.texture = _create_radial_light_texture(280)
		_sage_light.texture_scale = 1.6
		add_child(_sage_light)


func _setup_rune_pulse_shader() -> void:
	_rune_circle_rect = ColorRect.new()
	_rune_circle_rect.name = "RitualRuneCircle"
	_rune_circle_rect.size = Vector2(400, 400)
	_rune_circle_rect.position = ritual_circle_pos - Vector2(200, 200)

	# Rune pulse shader: emission = 0.5 + 0.3 * sin(TIME * 0.4)
	var shader := Shader.new()
	shader.code = """
	shader_type canvas_item;

	uniform vec4 sage_color : source_color = vec4(0.67, 0.79, 0.76, 1.0);

	void fragment() {
		vec2 uv = UV - vec2(0.5);
		float dist = length(uv);

		// Concentric ritual circle rings
		float ring1 = smoothstep(0.01, 0.0, abs(dist - 0.4));
		float ring2 = smoothstep(0.008, 0.0, abs(dist - 0.28));
		float inner_core = smoothstep(0.1, 0.0, dist);

		// Runic spokes
		float angle = atan(uv.y, uv.x);
		float spoke = step(0.96, cos(angle * 8.0));

		float circle_mask = clamp(ring1 + ring2 + inner_core + spoke * step(dist, 0.4), 0.0, 1.0);

		// EPILEPSY-SAFE SINE EMISSION PULSE (Period = 15.71s >= 2.5s)
		float emission = 0.5 + 0.3 * sin(TIME * 0.4);
		emission = clamp(emission, 0.0, 1.0);

		COLOR = sage_color * circle_mask * emission;
	}
	"""

	var mat := ShaderMaterial.new()
	mat.shader = shader
	_rune_circle_rect.material = mat
	add_child(_rune_circle_rect)


func _setup_spore_particles() -> void:
	_spore_particles = GPUParticles2D.new()
	_spore_particles.name = "SageSporeParticles"
	_spore_particles.position = ritual_circle_pos
	_spore_particles.amount = spore_particle_count
	_spore_particles.lifetime = 6.0
	_spore_particles.preprocess = 3.0

	var mat := ParticleProcessMaterial.new()
	mat.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_CIRCLE
	mat.emission_sphere_radius = 180.0
	mat.direction = Vector3(0, -1, 0)
	mat.spread = 45.0
	mat.initial_velocity_min = 10.0
	mat.initial_velocity_max = 25.0
	mat.gravity = Vector3(0, -3.0, 0)
	mat.scale_min = 1.5
	mat.scale_max = 3.5

	var grad := Gradient.new()
	grad.set_color(0, Color(sage_light_color.r, sage_light_color.g, sage_light_color.b, 0.0))
	grad.set_color(1, Color(sage_light_color.r, sage_light_color.g, sage_light_color.b, 0.0))
	grad.add_point(0.25, Color(sage_light_color.r, sage_light_color.g, sage_light_color.b, 0.75))
	grad.add_point(0.75, Color(sage_light_color.r, sage_light_color.g, sage_light_color.b, 0.25))

	var grad_tex := GradientTexture1D.new()
	grad_tex.gradient = grad
	mat.color_ramp = grad_tex

	_spore_particles.process_material = mat
	add_child(_spore_particles)


func _setup_ritual_circle_interactable() -> void:
	_ritual_area = Area2D.new()
	_ritual_area.name = "RitualCircleArea"
	_ritual_area.position = ritual_circle_pos

	var col := CollisionShape2D.new()
	var circle := CircleShape2D.new()
	circle.radius = 160.0
	col.shape = circle
	_ritual_area.add_child(col)

	_ritual_area.input_event.connect(func(_vp: Node, event: InputEvent, _idx: int):
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			_show_transformation_dialog("Alchemical Transmutation Circle", "State of matter changes: Lead transmutes into Philosopher's Gold under gentle sage resonance.")
			transformation_ritual_begun.emit("Coarse Lead", "Philosopher's Gold")
	)
	add_child(_ritual_area)


func _setup_transformation_ui() -> void:
	_transformation_ui = CanvasLayer.new()
	_transformation_ui.name = "TransformationUILayer"
	_transformation_ui.visible = false
	add_child(_transformation_ui)

	var panel := PanelContainer.new()
	panel.name = "TransformationPanel"
	panel.anchor_left = 0.25
	panel.anchor_top = 0.72
	panel.anchor_right = 0.75
	panel.anchor_bottom = 0.92
	_transformation_ui.add_child(panel)

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
	title_lbl.add_theme_color_override("font_color", sage_light_color)
	vbox.add_child(title_lbl)

	var desc_lbl := Label.new()
	desc_lbl.name = "Desc"
	desc_lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
	vbox.add_child(desc_lbl)


func _show_transformation_dialog(title: String, desc: String) -> void:
	var title_lbl: Label = _transformation_ui.get_node("TransformationPanel/Margin/VBox/Title")
	var desc_lbl: Label = _transformation_ui.get_node("TransformationPanel/Margin/VBox/Desc")

	title_lbl.text = title
	desc_lbl.text = desc
	_transformation_ui.visible = true

	var tween := create_tween()
	tween.tween_interval(5.0)
	tween.tween_callback(func(): _transformation_ui.visible = false)
