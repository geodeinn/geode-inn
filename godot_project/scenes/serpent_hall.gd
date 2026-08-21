class_name SerpentHall
extends Node2D

## Script for the grand corridor / boss approach ('The Serpent Hall').
## Features a symmetrical perspective hall lined with massive pillars bearing serpent/dragon relief carvings (with NormalMap support),
## warm iron torches on pillars (#FFB347, energy 0.7), cyan-blue underwater illumination (#00CED1, energy 0.4),
## flooded floor with animated wave reflection shader, dense horizontal fog drift, and a 10-second ambient loop feel.

@export_group("Torch Lighting")
## Warm iron torch light color on pillars (#FFB347)
@export var torch_color: Color = Color("ffb347")
@export var torch_energy: float = 0.7
@export var torch_radius: float = 220.0

@export_group("Water & Floor Reflections")
## Cyan-blue ambient water glow color (#00CED1)
@export var water_glow_color: Color = Color("00ced1")
@export var water_glow_energy: float = 0.4
## Wave speed for flooded floor reflection shader
@export_range(0.1, 3.0) var wave_speed: float = 0.8
## Wave amplitude for reflection distortion
@export_range(0.001, 0.05) var wave_amplitude: float = 0.008

@export_group("Hall Layout")
@export var pillar_pair_count: int = 5
@export var hall_vanishing_point: Vector2 = Vector2(960, 320)
## Ambient loop duration in seconds
@export var loop_duration: float = 10.0

# Internal nodes
var _water_canvas_modulate: CanvasModulate
var _fog_particles: CPUParticles2D
var _ambient_timer: float = 0.0
var _pillar_sprites: Array[Sprite2D] = []


func _ready() -> void:
	# 1. Apply zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("serpent_hall")

	# 2. Setup cyan-blue glowing underwater ambient overlay
	_setup_water_ambient_overlay()

	# 3. Spawn symmetrical pillars with serpent/dragon normal maps and warm iron torches
	_spawn_serpent_pillars_and_torches()

	# 4. Construct flooded floor reflection shader with animated waves
	_setup_flooded_floor_reflection()

	# 5. Spawn dense horizontal drifting fog over water surface
	_setup_horizontal_fog()


func _process(delta: float) -> void:
	# 10-second grand ambient loop ticker
	_ambient_timer += delta
	if _ambient_timer >= loop_duration:
		_ambient_timer -= loop_duration
		_on_ambient_loop_completed()

	_update_ambient_loop_visuals(_ambient_timer / loop_duration)


## Sets up cyan-blue bottom glowing CanvasModulate overlay (#00CED1, energy 0.4)
func _setup_water_ambient_overlay() -> void:
	_water_canvas_modulate = CanvasModulate.new()
	_water_canvas_modulate.name = "WaterCyanCanvasModulate"
	# Modulate combines darkness with cyan tint
	_water_canvas_modulate.color = water_glow_color.darkened(0.6)
	add_child(_water_canvas_modulate)


## Spawns symmetrical pillar pairs with normal mapping for relief carvings and iron torches
func _spawn_serpent_pillars_and_torches() -> void:
	var pillars_node := Node2D.new()
	pillars_node.name = "PillarsAndTorches"
	add_child(pillars_node)

	var screen_w := 1920.0
	var floor_y := 850.0

	for i in range(pillar_pair_count):
		var t := float(i) / float(pillar_pair_count)
		var scale_fac := lerp(1.1, 0.25, t)
		var y_pos := lerp(floor_y - 250.0, hall_vanishing_point.y + 40.0, t)

		var x_offset := lerp(screen_w * 0.42, 60.0, t)
		var left_pos := Vector2(hall_vanishing_point.x - x_offset, y_pos)
		var right_pos := Vector2(hall_vanishing_point.x + x_offset, y_pos)

		# Create Left Pillar
		var left_pillar := _create_serpent_pillar("LeftPillar_%d" % i, left_pos, scale_fac, false)
		pillars_node.add_child(left_pillar)

		# Create Right Pillar (flipped horizontally for symmetry)
		var right_pillar := _create_serpent_pillar("RightPillar_%d" % i, right_pos, scale_fac, true)
		pillars_node.add_child(right_pillar)

		# Warm iron torches attached to pillars
		var torch_y := y_pos - 80.0 * scale_fac
		var left_torch_pos := Vector2(left_pos.x + 25.0 * scale_fac, torch_y)
		var right_torch_pos := Vector2(right_pos.x - 25.0 * scale_fac, torch_y)

		var torch_energy_scaled := torch_energy * scale_fac

		var left_torch := _create_torch_light(left_torch_pos, torch_energy_scaled)
		var right_torch := _create_torch_light(right_torch_pos, torch_energy_scaled)

		pillars_node.add_child(left_torch)
		pillars_node.add_child(right_torch)


## Helper to construct a pillar sprite with normal mapping for relief carving depth
func _create_serpent_pillar(p_name: String, pos: Vector2, scale_fac: float, flip_h: bool) -> Sprite2D:
	var sprite := Sprite2D.new()
	sprite.name = p_name
	sprite.position = pos
	sprite.scale = Vector2.ONE * scale_fac
	sprite.flip_h = flip_h

	# Normal map setup for relief carving illumination
	var canvas_item_material := CanvasItemMaterial.new()
	canvas_item_material.light_mode = CanvasItemMaterial.LIGHT_MODE_NORMAL
	sprite.material = canvas_item_material

	_pillar_sprites.append(sprite)
	return sprite


## Torch instantiation helper
func _create_torch_light(pos: Vector2, nrg: float) -> Node2D:
	if get_node_or_null("/root/CatacombLighting"):
		return CatacombLighting.create_torch_light(torch_color, nrg, pos)

	var pl := PointLight2D.new()
	pl.color = torch_color
	pl.energy = nrg
	pl.position = pos
	pl.texture_scale = torch_radius / 100.0
	pl.enabled = true
	return pl


## Flooded floor reflection shader with animated waves
func _setup_flooded_floor_reflection() -> void:
	if get_node_or_null("/root/CatacombLighting"):
		var ref_node: Node2D = CatacombLighting.create_water_reflection()
		ref_node.position = Vector2(0, 520)
		add_child(ref_node)
		return

	var back_buffer := BackBufferCopy.new()
	back_buffer.name = "WaterBackBuffer"
	back_buffer.copy_mode = BackBufferCopy.COPY_MODE_RECT
	back_buffer.rect = Rect2(0, 500, 1920, 580)
	add_child(back_buffer)

	var water_rect := ColorRect.new()
	water_rect.name = "FloodedFloorReflection"
	water_rect.position = Vector2(0, 520)
	water_rect.size = Vector2(1920, 560)

	var shader := Shader.new()
	shader.code = """
	shader_type canvas_item;

	uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;
	uniform float wave_speed : hint_range(0.1, 3.0) = 0.8;
	uniform float wave_amplitude : hint_range(0.001, 0.05) = 0.008;
	uniform vec4 cyan_water_tint : source_color = vec4(0.0, 0.45, 0.5, 0.55);

	void fragment() {
		vec2 uv = SCREEN_UV;
		uv.y = 1.0 - uv.y; // Mirror vertical
		uv.x += sin(uv.y * 30.0 + TIME * wave_speed) * wave_amplitude;
		uv.y += cos(uv.x * 20.0 + TIME * wave_speed * 1.3) * wave_amplitude * 0.5;

		vec4 reflected = texture(screen_texture, uv);
		COLOR = mix(reflected, cyan_water_tint, cyan_water_tint.a);
	}
	"""

	var mat := ShaderMaterial.new()
	mat.shader = shader
	mat.set_shader_parameter("wave_speed", wave_speed)
	mat.set_shader_parameter("wave_amplitude", wave_amplitude)
	mat.set_shader_parameter("cyan_water_tint", Color(0.0, 0.45, 0.5, 0.55))
	water_rect.material = mat

	add_child(water_rect)


## Dense fog over water surface with horizontal drift
func _setup_horizontal_fog() -> void:
	_fog_particles = CPUParticles2D.new()
	_fog_particles.name = "DenseHorizontalFog"
	_fog_particles.amount = 60
	_fog_particles.lifetime = 8.0
	_fog_particles.preprocess = 4.0
	_fog_particles.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	_fog_particles.emission_rect_extents = Vector2(960, 100)
	_fog_particles.position = Vector2(960, 680)
	_fog_particles.direction = Vector2(1, 0) # Horizontal drift right
	_fog_particles.spread = 10.0
	_fog_particles.gravity = Vector2(0, -2)
	_fog_particles.initial_velocity_min = 15.0
	_fog_particles.initial_velocity_max = 35.0
	_fog_particles.color = Color(0.0, 0.8, 0.82, 0.22) # Dense cyan-teal fog tint
	add_child(_fog_particles)


## Seamless 10-second ambient loop updates
func _update_ambient_loop_visuals(progress: float) -> void:
	# Subtle 10-second ambient pulse on water glow (sine wave over 10s)
	var pulse := sin(progress * TAU) * 0.05
	if _water_canvas_modulate != null:
		_water_canvas_modulate.color = water_glow_color.darkened(0.6 + pulse)


func _on_ambient_loop_completed() -> void:
	# Trigger ambient audio or visual event every 10-second loop
	pass
