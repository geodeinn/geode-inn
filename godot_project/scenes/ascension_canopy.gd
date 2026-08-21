class_name AscensionCanopy
extends Node2D

## Script for the 'Ascension Canopy' scene in Geode Inn.
## Features a winding wooden staircase spiraling around a massive tree trunk ascending upward,
## CanvasModulate #1A1612, warm wooden sconce lights (#F6F1E7 energy 0.7), sky canopy light (#6D9EC7 energy 0.5),
## god rays light shaft shader through foliage gaps, upward drifting spore particles, and smooth Tween-based camera panning.

signal ascension_step_reached(step_index: int, height_ratio: float)
signal canopy_summit_reached

@export_group("Canvas Atmosphere")
## Deep wood canopy canvas tint (#1A1612)
@export var canvas_tint: Color = Color("1a1612")

@export_group("Lighting Colors")
## Staircase sconce warm light color (#F6F1E7)
@export var sconce_color: Color = Color("f6f1e7")
@export var sconce_energy: float = 0.7

## Upper canopy sky light color (#6D9EC7)
@export var canopy_sky_color: Color = Color("6d9ec7")
@export var canopy_sky_energy: float = 0.5
@export var canopy_sky_pos: Vector2 = Vector2(960, -800)

@export_group("Ascension Camera Controls")
## Speed of camera smooth pan tween in seconds per section
@export_range(1.0, 10.0) var pan_duration: float = 3.5

# Nodes
var _canvas_modulate: CanvasModulate
var _camera: Camera2D
var _sconce_lights: Array[PointLight2D] = []
var _sky_light: PointLight2D
var _spore_particles: GPUParticles2D
var _god_rays_rect: ColorRect
var _staircase_steps: Array[Node2D] = []
var _current_step_index: int = 0
var _camera_tween: Tween

# Staircase spiral waypoints climbing up tree trunk
var _step_positions: Array[Vector2] = [
	Vector2(960, 900),
	Vector2(700, 650),
	Vector2(500, 400),
	Vector2(650, 150),
	Vector2(960, -100),
	Vector2(1260, -350),
	Vector2(1100, -600),
	Vector2(960, -850)
]


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("ascension_canopy")

	# 2. CanvasModulate setup (#1A1612)
	_setup_canvas_modulate()

	# 3. Setup Camera2D for vertical ascension tracking
	_setup_camera()

	# 4. Construct tree trunk & staircase visual structure
	_setup_tree_and_staircase()

	# 5. Upper canopy sky light (#6D9EC7, energy 0.5) & sconce lights (#F6F1E7, energy 0.7)
	_setup_canopy_lights()

	# 6. Build God Rays volumetric light shaft shader through canopy gaps
	_setup_god_rays_shader()

	# 7. Emit upward drifting spore particles (GPUParticles2D)
	_setup_spore_particles()

	# 8. Setup climb interaction triggers along the winding staircase
	_setup_staircase_triggers()


func _process(delta: float) -> void:
	# Epilepsy safety: Gentle sine wave pulse for sconce lights (period ~ 12.5s >= 2.5s)
	var pulse: float = sin(Time.get_ticks_msec() * 0.0005) * 0.05
	for sconce in _sconce_lights:
		sconce.energy = sconce_energy + pulse


func _setup_canvas_modulate() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanopyCanvasModulate"
	_canvas_modulate.color = canvas_tint
	add_child(_canvas_modulate)


func _setup_camera() -> void:
	_camera = Camera2D.new()
	_camera.name = "AscensionCamera"
	_camera.position = _step_positions[0]
	_camera.make_current()
	add_child(_camera)


func _create_radial_light_texture(radius: int = 192) -> GradientTexture2D:
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


func _setup_tree_and_staircase() -> void:
	var world := Node2D.new()
	world.name = "TreeAndStaircaseWorld"
	add_child(world)

	# Massive central tree trunk representation
	var trunk := ColorRect.new()
	trunk.name = "MassiveTreeTrunk"
	trunk.size = Vector2(360, 2200)
	trunk.position = Vector2(780, -1100)
	trunk.color = Color("140f0c")
	world.add_child(trunk)

	# Wooden staircase steps
	for i in range(_step_positions.size()):
		var step_pos: Vector2 = _step_positions[i]
		var step := ColorRect.new()
		step.name = "WoodenStep_" + str(i)
		step.size = Vector2(140, 24)
		step.position = step_pos - Vector2(70, 12)
		step.color = Color("3d2c1e")
		world.add_child(step)


func _setup_canopy_lights() -> void:
	var lights_node := Node2D.new()
	lights_node.name = "CanopyLightingContainer"
	add_child(lights_node)

	# 1. Upper Canopy Sky Light (#6D9EC7 energy 0.5)
	_sky_light = PointLight2D.new()
	_sky_light.name = "UpperCanopySkyLight"
	_sky_light.color = canopy_sky_color
	_sky_light.energy = canopy_sky_energy
	_sky_light.position = canopy_sky_pos
	_sky_light.texture = _create_radial_light_texture(512)
	_sky_light.texture_scale = 2.5
	lights_node.add_child(_sky_light)

	# 2. Staircase sconce lights (#F6F1E7 energy 0.7)
	for i in range(0, _step_positions.size(), 2):
		var pos: Vector2 = _step_positions[i] + Vector2(0, -40)
		var sconce := PointLight2D.new()
		sconce.name = "SconceLight_" + str(i)
		sconce.color = sconce_color
		sconce.energy = sconce_energy
		sconce.position = pos
		sconce.texture = _create_radial_light_texture(180)
		sconce.texture_scale = 1.2
		lights_node.add_child(sconce)
		_sconce_lights.append(sconce)


func _setup_god_rays_shader() -> void:
	# Screen overlay for volumetric god rays shining down from canopy gaps
	_god_rays_rect = ColorRect.new()
	_god_rays_rect.name = "CanopyGodRaysOverlay"
	_god_rays_rect.size = Vector2(2400, 2400)
	_god_rays_rect.position = Vector2(-240, -1200)

	var shader := Shader.new()
	shader.code = """
	shader_type canvas_item;

	uniform vec4 ray_color : source_color = vec4(0.42, 0.62, 0.78, 0.25);
	uniform float angle : hint_range(-1.0, 1.0) = -0.3;
	uniform float ray_speed : hint_range(0.01, 1.0) = 0.1;

	float ray_noise(vec2 st) {
		return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453);
	}

	void fragment() {
		vec2 uv = UV;
		// Rotate & tilt for slanted god ray beam shafts
		vec2 ray_uv = vec2(uv.x + uv.y * angle, uv.y);
		float ray = sin(ray_uv.x * 25.0 + TIME * ray_speed) * 0.5 + 0.5;
		ray += sin(ray_uv.x * 50.0 - TIME * ray_speed * 0.5) * 0.25;
		ray *= (1.0 - uv.y); // Fade out near bottom of tree

		COLOR = ray_color * ray * 0.4;
	}
	"""

	var mat := ShaderMaterial.new()
	mat.shader = shader
	_god_rays_rect.material = mat
	add_child(_god_rays_rect)


func _setup_spore_particles() -> void:
	_spore_particles = GPUParticles2D.new()
	_spore_particles.name = "UpwardSporeParticles"
	_spore_particles.position = Vector2(960, 1000)
	_spore_particles.amount = 45
	_spore_particles.lifetime = 10.0
	_spore_particles.preprocess = 5.0

	var mat := ParticleProcessMaterial.new()
	mat.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
	mat.emission_box_extents = Vector3(800, 100, 1)
	mat.direction = Vector3(0, -1, 0)
	mat.spread = 25.0
	mat.initial_velocity_min = 25.0
	mat.initial_velocity_max = 50.0
	mat.gravity = Vector3(0, -8.0, 0) # Ascending upward
	mat.scale_min = 1.5
	mat.scale_max = 3.5

	var grad := Gradient.new()
	grad.set_color(0, Color(canopy_sky_color.r, canopy_sky_color.g, canopy_sky_color.b, 0.0))
	grad.set_color(1, Color(canopy_sky_color.r, canopy_sky_color.g, canopy_sky_color.b, 0.0))
	grad.add_point(0.2, Color(canopy_sky_color.r, canopy_sky_color.g, canopy_sky_color.b, 0.7))
	grad.add_point(0.8, Color(sconce_color.r, sconce_color.g, sconce_color.b, 0.4))

	var grad_tex := GradientTexture1D.new()
	grad_tex.gradient = grad
	mat.color_ramp = grad_tex

	_spore_particles.process_material = mat
	add_child(_spore_particles)


func _setup_staircase_triggers() -> void:
	var triggers := Node2D.new()
	triggers.name = "StaircaseClimbTriggers"
	add_child(triggers)

	for i in range(_step_positions.size()):
		var pos: Vector2 = _step_positions[i]
		var area := Area2D.new()
		area.name = "StepTrigger_" + str(i)
		area.position = pos

		var col := CollisionShape2D.new()
		var circle := CircleShape2D.new()
		circle.radius = 50.0
		col.shape = circle
		area.add_child(col)

		var step_idx: int = i
		area.input_event.connect(func(_vp: Node, event: InputEvent, _idx: int):
			if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
				climb_to_step(step_idx)
		)
		triggers.add_child(area)


## Smoothly moves the camera upward to a target step along the staircase using Tween
func climb_to_step(step_index: int) -> void:
	if step_index < 0 or step_index >= _step_positions.size():
		return

	_current_step_index = step_index
	var target_pos: Vector2 = _step_positions[step_index]

	if _camera_tween != null and _camera_tween.is_running():
		_camera_tween.kill()

	_camera_tween = create_tween()
	_camera_tween.set_trans(Tween.TRANS_QUAD)
	_camera_tween.set_ease(Tween.EASE_OUT)
	_camera_tween.tween_property(_camera, "position", target_pos, pan_duration)

	var height_ratio: float = float(step_index) / float(_step_positions.size() - 1)
	ascension_step_reached.emit(step_index, height_ratio)

	if step_index == _step_positions.size() - 1:
		canopy_summit_reached.emit()
