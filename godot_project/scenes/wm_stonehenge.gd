## wm_stonehenge.gd
## Stonehenge on Salisbury Plain scene script for Geode Inn.
## Features English overcast canvas modulate (#3A3A3A), option for Golden Hour lighting (#D4A856),
## weathered sarsen stones normal map shader, interactable stone circle triggering
## Standing Stones Tetris puzzle to open Fae Kingdom portal, ground mist, and circling birds.
extends Node2D

# Designer-tweakable parameters
@export var canvas_modulate_color: Color = Color("#3A3A3A") # English overcast slate
@export var enable_golden_hour: bool = false
@export var golden_hour_color: Color = Color("#D4A856") # Solstice sunset golden glow
@export var golden_hour_energy: float = 0.8

@export var stone_circle_center: Vector2 = Vector2(640, 360)
@export var tetris_puzzle_completed: bool = false
@export var target_fae_portal_scene: String = "res://scenes/fae_crossing_threshold.tscn"

# Signals
signal tetris_puzzle_triggered()
signal fae_portal_unlocked()

# Internal references
var _canvas_modulate: CanvasModulate
var _golden_hour_light: DirectionalLight2D
var _sarsen_normal_shader_mat: ShaderMaterial
var _stone_circle_area: Area2D
var _ground_mist: CPUParticles2D
var _circling_birds: CPUParticles2D


func _ready() -> void:
	_setup_atmosphere()
	_setup_lighting()
	_setup_sarsen_stone_normal_shader()
	_setup_stone_circle_megaliths()
	_setup_ground_level_mist()
	_setup_circling_birds_particles()
	_setup_tetris_portal_interactable()


func _setup_atmosphere() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	_canvas_modulate.color = canvas_modulate_color
	add_child(_canvas_modulate)


func _setup_lighting() -> void:
	if enable_golden_hour:
		_golden_hour_light = DirectionalLight2D.new()
		_golden_hour_light.name = "GoldenHourSolsticeSun"
		_golden_hour_light.color = golden_hour_color
		_golden_hour_light.energy = golden_hour_energy
		_golden_hour_light.rotation = deg_to_rad(20.0)
		add_child(_golden_hour_light)


func _setup_sarsen_stone_normal_shader() -> void:
	# Weathered stone surface normal map shader for Salisbury Plain sarsen megaliths
	var shader := Shader.new()
	shader.code = """
shader_type canvas_item;

uniform vec4 stone_color : source_color = vec4(0.60, 0.62, 0.64, 1.0);
uniform float weathering : hint_range(0.0, 1.0) = 0.5;

void fragment() {
	vec4 base = texture(TEXTURE, UV);
	// Weathered lichen and pitting pattern
	float noise = sin(UV.x * 50.0) * cos(UV.y * 50.0);
	vec3 final_color = mix(base.rgb * stone_color.rgb, base.rgb * 0.4, noise * weathering * 0.25);
	COLOR = vec4(final_color, base.a);
}
"""
	_sarsen_normal_shader_mat = ShaderMaterial.new()
	_sarsen_normal_shader_mat.shader = shader


func _setup_stone_circle_megaliths() -> void:
	# Megalithic outer sarsen ring & inner trilithons
	var megalith_container := Node2D.new()
	megalith_container.name = "SarsenStoneCircle"
	add_child(megalith_container)


func _setup_ground_level_mist() -> void:
	# Low ground mist lingering over Salisbury Plain
	_ground_mist = CatacombLighting.create_mist_particles()
	_ground_mist.position = Vector2(640, 520)
	add_child(_ground_mist)


func _setup_circling_birds_particles() -> void:
	# Overhead flock of ravens / jackdaws circling above Stonehenge
	_circling_birds = CPUParticles2D.new()
	_circling_birds.name = "CirclingOverheadBirds"
	_circling_birds.amount = 12
	_circling_birds.lifetime = 6.0
	_circling_birds.preprocess = 3.0
	_circling_birds.emission_shape = CPUParticles2D.EMISSION_SHAPE_CIRCLE
	_circling_birds.emission_sphere_radius = 250.0
	_circling_birds.position = Vector2(640, 120)
	_circling_birds.direction = Vector2(1.0, 0.2)
	_circling_birds.spread = 180.0
	_circling_birds.gravity = Vector2(0, 0)
	_circling_birds.initial_velocity_min = 25.0
	_circling_birds.initial_velocity_max = 55.0
	_circling_birds.scale_amount_min = 2.0
	_circling_birds.scale_amount_max = 4.0
	_circling_birds.color = Color(0.15, 0.15, 0.18, 0.8)
	add_child(_circling_birds)


func _setup_tetris_portal_interactable() -> void:
	# Stone circle interaction area to complete Standing Stones Tetris puzzle
	_stone_circle_area = Area2D.new()
	_stone_circle_area.name = "StonehengeTetrisPuzzleArea"
	_stone_circle_area.position = stone_circle_center
	
	var col := CollisionShape2D.new()
	var circle := CircleShape2D.new()
	circle.radius = 120.0
	col.shape = circle
	_stone_circle_area.add_child(col)
	
	_stone_circle_area.body_entered.connect(_on_stone_circle_entered)
	add_child(_stone_circle_area)


func _on_stone_circle_entered(body: Node) -> void:
	if not tetris_puzzle_completed:
		print("[Stonehenge] Standing Stones Tetris mini-game triggered by %s" % body.name)
		tetris_puzzle_triggered.emit()
	else:
		print("[Stonehenge] Tetris puzzle already completed -> Opening Fae Kingdom Portal!")
		fae_portal_unlocked.emit()
		if target_fae_portal_scene != "" and ResourceLoader.exists(target_fae_portal_scene):
			get_tree().change_scene_to_file(target_fae_portal_scene)


## Called when the player successfully solves the Standing Stones Tetris mini-game
func complete_tetris_puzzle() -> void:
	tetris_puzzle_completed = true
	print("[Stonehenge] Standing Stones Tetris puzzle SOLVED! Fae Kingdom portal energized.")
	fae_portal_unlocked.emit()
