## fae_hollow.gd
## Unseelie Court underground cavern scene script for Geode Inn.
## Features bioluminescent mushroom lights pulsing over 3s (#6C8EB9), pool caustic glow (#506C8B),
## rising bioluminescent spore particles (#99C0EC), water reflection distortion shader, and reverent atmosphere.
extends Node2D

# Designer-tweakable parameters
@export var canvas_modulate_color: Color = Color("#121B26") # Cool dark Unseelie cavern tint
@export var mushroom_light_color: Color = Color("#6C8EB9") # Soft bioluminescent blue-grey
@export var mushroom_base_energy: float = 1.2
@export var mushroom_pulse_min: float = 0.9
@export var mushroom_pulse_max: float = 1.3
@export var mushroom_pulse_period: float = 3.0 # 3.0 seconds period (Epilepsy safe)

@export var pool_caustic_color: Color = Color("#506C8B")
@export var pool_caustic_energy: float = 0.8
@export var pool_position: Vector2 = Vector2(640, 500)
@export var pool_size: Vector2 = Vector2(400, 200)

@export var spore_particle_color: Color = Color("#99C0EC")

# Internal references
var _canvas_modulate: CanvasModulate
var _mushroom_lights: Array[PointLight2D] = []
var _pool_light: PointLight2D
var _spore_particles: CPUParticles2D
var _water_rect: ColorRect
var _water_shader_mat: ShaderMaterial
var _mushroom_shader_mat: ShaderMaterial
var _time_passed: float = 0.0


func _ready() -> void:
	_setup_atmosphere()
	_setup_bioluminescent_mushrooms()
	_setup_pool_caustics()
	_setup_water_reflection_shader()
	_setup_spore_particles()


func _process(delta: float) -> void:
	_time_passed += delta
	_update_mushroom_pulsing()


func _setup_atmosphere() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	_canvas_modulate.color = canvas_modulate_color
	add_child(_canvas_modulate)


func _setup_bioluminescent_mushrooms() -> void:
	# Bioluminescent mushroom shader for glowing caps
	var shader := Shader.new()
	shader.code = """
shader_type canvas_item;

uniform vec4 bio_color : source_color = vec4(0.42, 0.56, 0.73, 1.0); // #6C8EB9
uniform float pulse_speed : hint_range(0.1, 2.0) = 0.333; // 1/3s = 3 second period

void fragment() {
	vec4 base = texture(TEXTURE, UV);
	// Slow sine pulse over 3s
	float pulse = 0.5 + 0.5 * sin(TIME * pulse_speed * 6.28318);
	vec3 glow = mix(base.rgb, bio_color.rgb * 1.3, pulse * base.a);
	COLOR = vec4(glow, base.a);
}
"""
	_mushroom_shader_mat = ShaderMaterial.new()
	_mushroom_shader_mat.shader = shader
	
	# Spawn mushroom lights across the cavern
	var cluster_positions := [
		Vector2(300, 420),
		Vector2(450, 380),
		Vector2(780, 440),
		Vector2(950, 390),
		Vector2(600, 280)
	]
	
	for i in range(cluster_positions.size()):
		var light := PointLight2D.new()
		light.name = "BioMushroomLight_%d" % i
		light.color = mushroom_light_color
		light.energy = mushroom_base_energy
		light.position = cluster_positions[i]
		light.texture_scale = 2.0
		add_child(light)
		_mushroom_lights.append(light)


func _update_mushroom_pulsing() -> void:
	# Gentle epilepsy-safe pulse oscillating between 0.9 and 1.3 over 3s
	var phase := _time_passed * (TAU / mushroom_pulse_period)
	var t := (sin(phase) + 1.0) * 0.5 # 0.0 to 1.0
	var current_energy := lerp(mushroom_pulse_min, mushroom_pulse_max, t)
	
	for light in _mushroom_lights:
		if is_instance_valid(light):
			light.energy = current_energy


func _setup_pool_caustics() -> void:
	# Underground water pool glow
	_pool_light = PointLight2D.new()
	_pool_light.name = "PoolCausticGlow"
	_pool_light.color = pool_caustic_color
	_pool_light.energy = pool_caustic_energy
	_pool_light.position = pool_position
	_pool_light.texture_scale = 3.8
	add_child(_pool_light)


func _setup_water_reflection_shader() -> void:
	# Water reflection distortion shader for subterranean pool surface
	_water_shader_mat = CatacombLighting.create_water_reflection()
	_water_shader_mat.set_shader_parameter("water_tint", Vector4(0.31, 0.42, 0.55, 0.4))
	_water_shader_mat.set_shader_parameter("wave_speed", 0.4)
	_water_shader_mat.set_shader_parameter("wave_frequency", 8.0)
	
	_water_rect = ColorRect.new()
	_water_rect.name = "SubterraneanWaterPool"
	_water_rect.position = pool_position - (pool_size / 2.0)
	_water_rect.size = pool_size
	_water_rect.material = _water_shader_mat
	add_child(_water_rect)


func _setup_spore_particles() -> void:
	# Rising bioluminescent spore particles (#99C0EC) floating reverently upward
	_spore_particles = CPUParticles2D.new()
	_spore_particles.name = "BioluminescentSpores"
	_spore_particles.amount = 45
	_spore_particles.lifetime = 8.0
	_spore_particles.preprocess = 4.0
	_spore_particles.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	_spore_particles.emission_rect_extents = Vector2(500, 150)
	_spore_particles.position = Vector2(640, 550)
	_spore_particles.direction = Vector2(0, -1)
	_spore_particles.spread = 20.0
	_spore_particles.gravity = Vector2(0, -4.0)
	_spore_particles.initial_velocity_min = 6.0
	_spore_particles.initial_velocity_max = 18.0
	_spore_particles.scale_amount_min = 3.0
	_spore_particles.scale_amount_max = 7.0
	_spore_particles.color = spore_particle_color
	add_child(_spore_particles)
