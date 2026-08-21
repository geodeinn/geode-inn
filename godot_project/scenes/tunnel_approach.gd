class_name TunnelApproach
extends Node2D

## Script for the entry corridor ('The Tunnel Approach').
## Features a vanishing-point perspective down an arched stone tunnel,
## constant warm amber lanterns for epilepsy safety, teal-tinted ambient darkness,
## hazy mist particles, wet floor screen-space reflections, and non-assertive camera drift.

@export_group("Atmosphere & Lighting")
## Base color for warm amber lanterns (#F5B041)
@export var lantern_color: Color = Color("f5b041")
## Light radius in pixels for each lantern
@export var lantern_radius: float = 200.0
## Base light energy level for lanterns (constant, epilepsy-safe)
@export var lantern_energy: float = 0.8
## Ambient light color tinting the tunnel (#1A2A2A)
@export var ambient_color: Color = Color("1a2a2a")
## Number of lantern pairs along the corridor length
@export var lantern_pair_count: int = 6

@export_group("Camera & Perspective")
## Auto-drift speed along the corridor (pixels per second)
@export var camera_drift_speed: float = 20.0
## Vanishing point coordinate on screen
@export var vanishing_point: Vector2 = Vector2(960, 360)
## Max camera forward travel distance before subtle sway reset
@export var max_drift_distance: float = 800.0

@export_group("Wet Floor & Shader")
## Alpha opacity of floor wetness reflection
@export_range(0.0, 1.0) var reflection_opacity: float = 0.45
## Intensity of floor water distortion waves
@export_range(0.0, 0.05) var wave_distortion: float = 0.015

# Internal references
var _camera: Camera2D
var _canvas_modulate: CanvasModulate
var _mist_particles: CPUParticles2D
var _lantern_nodes: Array[Node2D] = []
var _drift_distance: float = 0.0


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("tunnel_approach")
	
	# 2. Setup CanvasModulate for teal-tinted darkness
	_setup_ambient_lighting()
	
	# 3. Setup perspective lanterns along arched corridor
	_spawn_perspective_lanterns()
	
	# 4. Instantiate soft hazy mist
	_setup_mist()
	
	# 5. Build wet floor reflection shader system
	_setup_wet_floor_reflection()
	
	# 6. Initialize drifting camera
	_setup_camera()


func _process(delta: float) -> void:
	_update_camera_drift(delta)


## Configures the teal darkness ambient CanvasModulate
func _setup_ambient_lighting() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "TealCanvasModulate"
	_canvas_modulate.color = ambient_color
	add_child(_canvas_modulate)


## Spawns paired lanterns retreating toward the vanishing point
func _spawn_perspective_lanterns() -> void:
	var lanterns_container := Node2D.new()
	lanterns_container.name = "LanternsContainer"
	add_child(lanterns_container)

	var screen_width := 1920.0
	var floor_y := 800.0

	for i in range(lantern_pair_count):
		# Depth factor t ranging from 0.0 (front) to 0.85 (deep in tunnel)
		var t := float(i) / float(lantern_pair_count)
		var scale_factor := lerp(1.0, 0.25, t)
		var y_pos := lerp(floor_y - 200.0, vanishing_point.y, t)
		
		var x_offset := lerp(screen_width * 0.38, 50.0, t)
		var left_pos := Vector2(vanishing_point.x - x_offset, y_pos)
		var right_pos := Vector2(vanishing_point.x + x_offset, y_pos)

		var energy_scaled := lantern_energy * scale_factor

		# Left lantern
		var left_light: Node2D = _create_lantern_light(lantern_color, energy_scaled, left_pos)
		left_light.scale = Vector2.ONE * scale_factor
		lanterns_container.add_child(left_light)
		_lantern_nodes.append(left_light)

		# Right lantern
		var right_light: Node2D = _create_lantern_light(lantern_color, energy_scaled, right_pos)
		right_light.scale = Vector2.ONE * scale_factor
		lanterns_container.add_child(right_light)
		_lantern_nodes.append(right_light)


## Helper to delegate lantern light creation to CatacombLighting autoload with local fallback
func _create_lantern_light(col: Color, nrg: float, pos: Vector2) -> Node2D:
	if get_node_or_null("/root/CatacombLighting"):
		return CatacombLighting.create_torch_light(col, nrg, pos)
	
	# Fallback if standalone
	var light := PointLight2D.new()
	light.position = pos
	light.color = col
	light.energy = nrg
	light.texture_scale = lantern_radius / 100.0
	# Constant light - strictly no flicker for epilepsy safety
	light.enabled = true
	return light


## Initializes CPU mist particles with slow upward drift and low alpha
func _setup_mist() -> void:
	if get_node_or_null("/root/CatacombLighting"):
		_mist_particles = CatacombLighting.create_mist_particles()
		add_child(_mist_particles)
		return

	# Fallback creation
	_mist_particles = CPUParticles2D.new()
	_mist_particles.name = "MistParticles"
	_mist_particles.amount = 45
	_mist_particles.lifetime = 6.0
	_mist_particles.preprocess = 3.0
	_mist_particles.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	_mist_particles.emission_rect_extents = Vector2(960, 200)
	_mist_particles.position = Vector2(960, 700)
	_mist_particles.direction = Vector2(0, -1)
	_mist_particles.spread = 20.0
	_mist_particles.gravity = Vector2(0, -5)
	_mist_particles.initial_velocity_min = 10.0
	_mist_particles.initial_velocity_max = 25.0
	_mist_particles.color = Color(0.4, 0.6, 0.6, 0.15)
	add_child(_mist_particles)


## Constructs back_buffer_copy + mirror reflection shader for wet stone floor
func _setup_wet_floor_reflection() -> void:
	if get_node_or_null("/root/CatacombLighting"):
		var ref_node: Node2D = CatacombLighting.create_water_reflection()
		ref_node.position = Vector2(0, 540)
		add_child(ref_node)
		return

	var back_buffer := BackBufferCopy.new()
	back_buffer.name = "FloorBackBuffer"
	back_buffer.copy_mode = BackBufferCopy.COPY_MODE_RECT
	back_buffer.rect = Rect2(0, 500, 1920, 580)
	add_child(back_buffer)

	var floor_rect := ColorRect.new()
	floor_rect.name = "WetFloorReflection"
	floor_rect.position = Vector2(0, 540)
	floor_rect.size = Vector2(1920, 540)

	var shader := Shader.new()
	shader.code = """
	shader_type canvas_item;

	uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;
	uniform float reflection_alpha : hint_range(0.0, 1.0) = 0.45;
	uniform float distortion_strength : hint_range(0.0, 0.05) = 0.015;

	void fragment() {
		vec2 uvs = SCREEN_UV;
		uvs.y = 1.0 - uvs.y; // Mirror vertically
		uvs.x += sin(uvs.y * 25.0 + TIME * 1.2) * distortion_strength;
		
		vec4 reflected = texture(screen_texture, uvs);
		vec4 wet_tint = vec4(0.08, 0.14, 0.15, 1.0);
		COLOR = mix(wet_tint, reflected, reflection_alpha);
	}
	"""

	var mat := ShaderMaterial.new()
	mat.shader = shader
	mat.set_shader_parameter("reflection_alpha", reflection_opacity)
	mat.set_shader_parameter("distortion_strength", wave_distortion)
	floor_rect.material = mat

	add_child(floor_rect)


## Sets up a Camera2D for non-assertive forward motion
func _setup_camera() -> void:
	_camera = Camera2D.new()
	_camera.name = "DriftingCamera"
	_camera.position = Vector2(960, 540)
	add_child(_camera)
	_camera.make_current()


## Smooth camera forward movement
func _update_camera_drift(delta: float) -> void:
	if _camera == null:
		return

	_drift_distance += camera_drift_speed * delta
	_camera.position.y = 540.0 - (sin(_drift_distance * 0.002) * 40.0)
	_camera.position.x = 960.0 + (cos(_drift_distance * 0.001) * 15.0)

	# Gentle scale shift to simulate depth push
	var depth_factor := 1.0 + (fmod(_drift_distance, max_drift_distance) / max_drift_distance) * 0.08
	_camera.zoom = Vector2(depth_factor, depth_factor)
