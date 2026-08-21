## wm_egyptian_desert.gd
## Sun-baked Egyptian Desert landscape scene script for Geode Inn.
## Features warm desert canvas modulate (#4A3A28), hot sun DirectionalLight2D (#F5D49A),
## drifting sand particles, heat haze horizon shader, distant pyramid parallax background,
## interactable sandstone ruins (archaeology puzzles), and connection to Egyptian Vault catacomb.
extends Node2D

# Designer-tweakable parameters
@export var canvas_modulate_color: Color = Color("#4A3A28") # Warm sandstone desert shadow
@export var hot_sun_color: Color = Color("#F5D49A") # Blazing desert sunlight
@export var hot_sun_energy: float = 1.8

@export var sand_drift_speed: float = 40.0
@export var heat_haze_intensity: float = 0.008

@export var target_vault_scene: String = "res://scenes/egyptian_vault.tscn"

# Signals
signal archaeology_puzzle_triggered(ruin_id: String)
signal vault_entrance_accessed()

# Internal references
var _canvas_modulate: CanvasModulate
var _desert_sun: DirectionalLight2D
var _sand_particles: CPUParticles2D
var _heat_haze_rect: ColorRect
var _heat_haze_shader_mat: ShaderMaterial
var _parallax_bg: ParallaxBackground
var _ruins_areas: Array[Area2D] = []


func _ready() -> void:
	_setup_atmosphere()
	_setup_hot_sunlight()
	_setup_pyramid_parallax_background()
	_setup_heat_haze_shader()
	_setup_sand_drift_particles()
	_setup_sandstone_ruins_puzzles()


func _setup_atmosphere() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	_canvas_modulate.color = canvas_modulate_color
	add_child(_canvas_modulate)


func _setup_hot_sunlight() -> void:
	_desert_sun = DirectionalLight2D.new()
	_desert_sun.name = "EgyptianDesertSun"
	_desert_sun.color = hot_sun_color
	_desert_sun.energy = hot_sun_energy
	_desert_sun.rotation = deg_to_rad(30.0)
	add_child(_desert_sun)


func _setup_pyramid_parallax_background() -> void:
	# Parallax layers for distant desert dunes and monumental Giza pyramid silhouettes
	_parallax_bg = ParallaxBackground.new()
	_parallax_bg.name = "DesertPyramidParallax"
	
	var pyramid_layer := ParallaxLayer.new()
	pyramid_layer.name = "PyramidSilhouettesLayer"
	pyramid_layer.motion_scale = Vector2(0.2, 0.2)
	_parallax_bg.add_child(pyramid_layer)
	
	add_child(_parallax_bg)


func _setup_heat_haze_shader() -> void:
	# Horizon heat shimmer distortion shader simulating rising desert air
	var shader := Shader.new()
	shader.code = """
shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float haze_intensity : hint_range(0.001, 0.03) = 0.008;

void fragment() {
	vec2 uv = SCREEN_UV;
	// Heat haze horizontal wobble near the desert horizon
	float haze = sin(uv.y * 40.0 + TIME * 4.0) * haze_intensity;
	uv.x += haze * (1.0 - uv.y); # Stronger shimmer near top/horizon
	
	COLOR = texture(SCREEN_TEXTURE, uv);
}
"""
	_heat_haze_shader_mat = ShaderMaterial.new()
	_heat_haze_shader_mat.shader = shader
	_heat_haze_shader_mat.set_shader_parameter("haze_intensity", heat_haze_intensity)
	
	_heat_haze_rect = ColorRect.new()
	_heat_haze_rect.name = "HorizonHeatHazeOverlay"
	_heat_haze_rect.position = Vector2(0, 100)
	_heat_haze_rect.size = Vector2(1280, 250)
	_heat_haze_rect.material = _heat_haze_shader_mat
	add_child(_heat_haze_rect)


func _setup_sand_drift_particles() -> void:
	# Drifting sand particle system blowing across dunes
	_sand_particles = CPUParticles2D.new()
	_sand_particles.name = "DriftingDesertSand"
	_sand_particles.amount = 80
	_sand_particles.lifetime = 6.0
	_sand_particles.preprocess = 3.0
	_sand_particles.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	_sand_particles.emission_rect_extents = Vector2(20, 360)
	_sand_particles.position = Vector2(-20, 360)
	_sand_particles.direction = Vector2(1.0, 0.1) # Wind blowing left-to-right
	_sand_particles.gravity = Vector2(5.0, 2.0)
	_sand_particles.initial_velocity_min = sand_drift_speed
	_sand_particles.initial_velocity_max = sand_drift_speed * 1.5
	_sand_particles.scale_amount_min = 2.0
	_sand_particles.scale_amount_max = 4.5
	_sand_particles.color = Color(0.92, 0.78, 0.55, 0.6)
	add_child(_sand_particles)


func _setup_sandstone_ruins_puzzles() -> void:
	# Archaeology puzzle trigger areas around ancient sandstone temple ruins
	var ruins_positions := [
		Vector2(400, 420),
		Vector2(750, 380),
		Vector2(950, 460)
	]
	
	for i in range(ruins_positions.size()):
		var pos := ruins_positions[i]
		var area := Area2D.new()
		var ruin_id := "SandstoneRuin_%d" % i
		area.name = ruin_id
		area.position = pos
		
		var col := CollisionShape2D.new()
		var circle := CircleShape2D.new()
		circle.radius = 50.0
		col.shape = circle
		area.add_child(col)
		
		area.body_entered.connect(func(body: Node) -> void:
			print("[EgyptianDesert] Archaeology puzzle area %s entered by %s" % [ruin_id, body.name])
			archaeology_puzzle_triggered.emit(ruin_id)
		)
		
		add_child(area)
		_ruins_areas.append(area)
