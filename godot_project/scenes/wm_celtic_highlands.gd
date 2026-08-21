## wm_celtic_highlands.gd
## Misty Celtic Highland landscape scene script for Geode Inn.
## Features dark green canvas modulate (#3A4A3E), overcast sky light (#8A9A82), drifting mist,
## gentle rain particles, Celtic knotwork stone normal map shader, wandering sheep NPCs,
## and connection to Stonehenge portal & festival quests.
extends Node2D

# Designer-tweakable parameters
@export var canvas_modulate_color: Color = Color("#3A4A3E") # Misty highland green darkness
@export var overcast_sky_color: Color = Color("#8A9A82") # Soft pale olive-grey overcast light
@export var overcast_sky_energy: float = 0.6

@export var standing_stone_positions: Array[Vector2] = [
	Vector2(320, 300),
	Vector2(480, 240),
	Vector2(820, 320),
	Vector2(960, 260)
]

@export var sheep_count: int = 5
@export var target_stonehenge_scene: String = "res://scenes/wm_stonehenge.tscn"

# Signals
signal stonehenge_portal_triggered()
signal sheep_interacted(sheep_id: int)

# Internal references
var _canvas_modulate: CanvasModulate
var _overcast_light: DirectionalLight2D
var _rain_particles: CPUParticles2D
var _mist_particles: CPUParticles2D
var _celtic_knot_shader_mat: ShaderMaterial
var _sheep_nodes: Array[Node2D] = []


func _ready() -> void:
	_setup_atmosphere()
	_setup_overcast_light()
	_setup_celtic_knot_shader()
	_setup_standing_stones()
	_setup_weather_systems()
	_setup_wandering_sheep_npcs()


func _setup_atmosphere() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	_canvas_modulate.color = canvas_modulate_color
	add_child(_canvas_modulate)


func _setup_overcast_light() -> void:
	_overcast_light = DirectionalLight2D.new()
	_overcast_light.name = "HighlandOvercastLight"
	_overcast_light.color = overcast_sky_color
	_overcast_light.energy = overcast_sky_energy
	_overcast_light.rotation = deg_to_rad(45.0)
	add_child(_overcast_light)


func _setup_celtic_knot_shader() -> void:
	# Shader simulating embossed Celtic knotwork texture patterns on ancient stone surfaces
	var shader := Shader.new()
	shader.code = """
shader_type canvas_item;

uniform vec4 stone_tint : source_color = vec4(0.7, 0.72, 0.68, 1.0);

void fragment() {
	vec4 base = texture(TEXTURE, UV);
	// Celtic knot procedural sine carving
	float knot = sin(UV.x * 31.4159) * cos(UV.y * 31.4159);
	float carving = smoothstep(0.1, 0.3, abs(knot));
	vec3 final = mix(base.rgb * stone_tint.rgb, base.rgb * 0.4, carving * 0.3);
	COLOR = vec4(final, base.a);
}
"""
	_celtic_knot_shader_mat = ShaderMaterial.new()
	_celtic_knot_shader_mat.shader = shader


func _setup_standing_stones() -> void:
	for i in range(standing_stone_positions.size()):
		var stone_pos := standing_stone_positions[i]
		var stone_sprite := Sprite2D.new()
		stone_sprite.name = "HighlandStandingStone_%d" % i
		stone_sprite.position = stone_pos
		stone_sprite.material = _celtic_knot_shader_mat
		add_child(stone_sprite)


func _setup_weather_systems() -> void:
	# Gentle Scottish/Irish highland rain particle system
	_rain_particles = CPUParticles2D.new()
	_rain_particles.name = "HighlandGentleRain"
	_rain_particles.amount = 120
	_rain_particles.lifetime = 2.5
	_rain_particles.preprocess = 2.0
	_rain_particles.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	_rain_particles.emission_rect_extents = Vector2(700, 20)
	_rain_particles.position = Vector2(640, -10)
	_rain_particles.direction = Vector2(-0.2, 1.0)
	_rain_particles.gravity = Vector2(-10.0, 180.0)
	_rain_particles.initial_velocity_min = 120.0
	_rain_particles.initial_velocity_max = 180.0
	_rain_particles.scale_amount_min = 1.0
	_rain_particles.scale_amount_max = 2.5
	_rain_particles.color = Color(0.8, 0.88, 0.95, 0.4)
	add_child(_rain_particles)
	
	# Drifting highland mist using CatacombLighting particles
	_mist_particles = CatacombLighting.create_mist_particles()
	_mist_particles.position = Vector2(640, 450)
	add_child(_mist_particles)


func _setup_wandering_sheep_npcs() -> void:
	# Spawn simple wandering sheep NPCs in the highland pastures
	for i in range(sheep_count):
		var sheep := Node2D.new()
		sheep.name = "HighlandSheep_%d" % i
		sheep.position = Vector2(200 + (i * 180) + randf_range(-30, 30), 400 + randf_range(-40, 40))
		
		var area := Area2D.new()
		area.name = "SheepInteractArea"
		var col := CollisionShape2D.new()
		var circle := CircleShape2D.new()
		circle.radius = 20.0
		col.shape = circle
		area.add_child(col)
		
		var sheep_id := i
		area.body_entered.connect(func(body: Node) -> void:
			print("[CelticHighlands] Sheep %d greeted by %s (Baa!)" % [sheep_id, body.name])
			sheep_interacted.emit(sheep_id)
		)
		sheep.add_child(area)
		
		add_child(sheep)
		_sheep_nodes.append(sheep)
