## fae_summerlands.gd
## Seelie Court summer forest glade scene script for Geode Inn.
## Features warm eternal summer ambiance, directional sunlight (#D6CB98), glade center light (#CABF88),
## foliage sway shader, dappled light caustics shader, and falling golden leaf particle system.
extends Node2D

# Designer-tweakable parameters
@export var canvas_modulate_color: Color = Color("#4A4633") # Warm golden forest shadow tint
@export var sun_light_color: Color = Color("#D6CB98") # Sunlight through leaves
@export var sun_light_energy: float = 1.4
@export var sun_light_rotation_degrees: float = 65.0

@export var glade_center_position: Vector2 = Vector2(640, 360)
@export var glade_light_color: Color = Color("#CABF88")
@export var glade_light_energy: float = 2.0

@export var sway_intensity: float = 8.0
@export var golden_leaf_count: int = 40

# Internal node references
var _canvas_modulate: CanvasModulate
var _directional_sun: DirectionalLight2D
var _glade_point_light: PointLight2D
var _leaf_particles: CPUParticles2D
var _foliage_shader_mat: ShaderMaterial
var _caustics_shader_mat: ShaderMaterial
var _caustics_rect: ColorRect


func _ready() -> void:
	_setup_atmosphere()
	_setup_directional_sunlight()
	_setup_glade_center_light()
	_setup_foliage_sway_shader()
	_setup_caustics_shader()
	_setup_golden_leaf_particles()


func _setup_atmosphere() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	_canvas_modulate.color = canvas_modulate_color
	add_child(_canvas_modulate)


func _setup_directional_sunlight() -> void:
	# Directional sun shining into the forest glade at 65 degrees
	_directional_sun = DirectionalLight2D.new()
	_directional_sun.name = "SeelieSunlight"
	_directional_sun.color = sun_light_color
	_directional_sun.energy = sun_light_energy
	_directional_sun.rotation_edit_mode = DirectionalLight2D.ROTATION_EDIT_MODE_FULL
	_directional_sun.rotation = deg_to_rad(sun_light_rotation_degrees)
	add_child(_directional_sun)


func _setup_glade_center_light() -> void:
	# Concentrated warm light beam in the center of the Seelie court glade
	_glade_point_light = PointLight2D.new()
	_glade_point_light.name = "GladeCenterLight"
	_glade_point_light.color = glade_light_color
	_glade_point_light.energy = glade_light_energy
	_glade_point_light.position = glade_center_position
	_glade_point_light.texture_scale = 3.5
	add_child(_glade_point_light)


func _setup_foliage_sway_shader() -> void:
	# Custom 2D CanvasItem shader for gentle wind sway on tree canopy & bushes
	var shader := Shader.new()
	shader.code = """
shader_type canvas_item;

uniform float sway_intensity : hint_range(0.0, 30.0) = 8.0;

void vertex() {
	// Sway shader: VERTEX.x += sin(TIME * 2.0 + VERTEX.y) * sway_intensity
	VERTEX.x += sin(TIME * 2.0 + VERTEX.y) * sway_intensity;
}

void fragment() {
	COLOR = texture(TEXTURE, UV);
}
"""
	_foliage_shader_mat = ShaderMaterial.new()
	_foliage_shader_mat.shader = shader
	_foliage_shader_mat.set_shader_parameter("sway_intensity", sway_intensity)


func _setup_caustics_shader() -> void:
	# Dappled sunlight caustics filtering through high canopy leaves
	var shader := Shader.new()
	shader.code = """
shader_type canvas_item;

uniform vec4 caustics_tint : source_color = vec4(0.95, 0.90, 0.70, 0.25);
uniform float scale : hint_range(1.0, 20.0) = 8.0;

void fragment() {
	vec2 uv = UV * scale;
	float c1 = sin(uv.x + TIME * 0.8) * cos(uv.y + TIME * 0.6);
	float c2 = sin(uv.x * 1.5 - TIME * 0.5) * cos(uv.y * 1.3 + TIME * 0.7);
	float pattern = clamp((c1 + c2) * 0.5 + 0.5, 0.0, 1.0);
	COLOR = vec4(caustics_tint.rgb, pattern * caustics_tint.a);
}
"""
	_caustics_shader_mat = ShaderMaterial.new()
	_caustics_shader_mat.shader = shader
	
	_caustics_rect = ColorRect.new()
	_caustics_rect.name = "DappledCausticsOverlay"
	_caustics_rect.size = Vector2(1280, 720)
	_caustics_rect.material = _caustics_shader_mat
	add_child(_caustics_rect)


func _setup_golden_leaf_particles() -> void:
	# Gently drifting golden leaves in the eternal summer glade
	_leaf_particles = CPUParticles2D.new()
	_leaf_particles.name = "FallingGoldenLeaves"
	_leaf_particles.amount = golden_leaf_count
	_leaf_particles.lifetime = 10.0
	_leaf_particles.preprocess = 5.0
	_leaf_particles.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	_leaf_particles.emission_rect_extents = Vector2(700, 50)
	_leaf_particles.position = Vector2(640, -20)
	_leaf_particles.direction = Vector2(0.5, 1.0)
	_leaf_particles.spread = 25.0
	_leaf_particles.gravity = Vector2(10.0, 15.0)
	_leaf_particles.initial_velocity_min = 15.0
	_leaf_particles.initial_velocity_max = 35.0
	_leaf_particles.angular_velocity_min = -45.0
	_leaf_particles.angular_velocity_max = 45.0
	_leaf_particles.scale_amount_min = 4.0
	_leaf_particles.scale_amount_max = 8.0
	_leaf_particles.color = Color(0.95, 0.82, 0.40, 0.85)
	add_child(_leaf_particles)
