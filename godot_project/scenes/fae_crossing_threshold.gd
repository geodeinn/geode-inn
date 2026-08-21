## fae_crossing_threshold.gd
## Natural arch gateway threshold transitioning from the Geode Inn catacombs to the Fae Kingdom.
## Features natural archway geometry, god rays, floor glow with epilepsy-safe sine modulation,
## pollen dust motes, runic portal stone with emission pulse shader, and scene transition trigger.
extends Node2D

# Designer-tweakable parameters
@export var canvas_modulate_color: Color = Color("#3B3326") # Warm earthy threshold darkness
@export var god_ray_color: Color = Color("#73826A") # Natural mossy green god rays
@export var god_ray_energy: float = 1.8
@export var floor_glow_color: Color = Color("#9CAE96") # Pale sage floor luminescence
@export var floor_glow_base_energy: float = 1.2
@export var floor_glow_pulse_amplitude: float = 0.15
@export var floor_glow_pulse_speed: float = 1.5 # Period T = 2*PI/1.5 = ~4.19s (Safe for epilepsy)

@export var portal_stone_position: Vector2 = Vector2(640, 360)
@export var target_scene_path: String = "res://scenes/fae_summerlands.tscn"

# Signals
signal threshold_crossed(target_scene: String)

# Internal nodes
var _canvas_modulate: CanvasModulate
var _god_ray_light: PointLight2D
var _floor_glow_light: PointLight2D
var _pollen_particles: CPUParticles2D
var _runic_stone_sprite: Sprite2D
var _runic_shader_mat: ShaderMaterial
var _transition_area: Area2D
var _time_passed: float = 0.0


func _ready() -> void:
	_setup_canvas_modulate()
	_setup_god_rays()
	_setup_floor_glow()
	_setup_pollen_motes()
	_setup_runic_portal_stone()
	_setup_transition_trigger()


func _process(delta: float) -> void:
	_time_passed += delta
	_update_floor_glow()


func _setup_canvas_modulate() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	_canvas_modulate.color = canvas_modulate_color
	add_child(_canvas_modulate)


func _setup_god_rays() -> void:
	# Directional god ray illumination streaming down through the natural archway
	_god_ray_light = PointLight2D.new()
	_god_ray_light.name = "GodRayLight"
	_god_ray_light.color = god_ray_color
	_god_ray_light.energy = god_ray_energy
	_god_ray_light.position = portal_stone_position + Vector2(0, -150)
	_god_ray_light.texture_scale = 3.0
	add_child(_god_ray_light)


func _setup_floor_glow() -> void:
	# Threshold floor glow light using CatacombLighting helper with steady base
	_floor_glow_light = PointLight2D.new()
	_floor_glow_light.name = "ThresholdFloorGlow"
	_floor_glow_light.color = floor_glow_color
	_floor_glow_light.energy = floor_glow_base_energy
	_floor_glow_light.position = portal_stone_position + Vector2(0, 100)
	_floor_glow_light.texture_scale = 2.5
	add_child(_floor_glow_light)


func _update_floor_glow() -> void:
	# Gentle sine modulation: 1.2 + 0.15 * sin(TIME * 1.5)
	if is_instance_valid(_floor_glow_light):
		_floor_glow_light.energy = floor_glow_base_energy + floor_glow_pulse_amplitude * sin(_time_passed * floor_glow_pulse_speed)


func _setup_pollen_motes() -> void:
	# Drifting golden pollen and dust motes passing through the threshold
	_pollen_particles = CPUParticles2D.new()
	_pollen_particles.name = "PollenDustMotes"
	_pollen_particles.amount = 50
	_pollen_particles.lifetime = 6.0
	_pollen_particles.preprocess = 3.0
	_pollen_particles.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	_pollen_particles.emission_rect_extents = Vector2(400, 250)
	_pollen_particles.position = portal_stone_position
	_pollen_particles.direction = Vector2(0.2, -0.8)
	_pollen_particles.spread = 30.0
	_pollen_particles.gravity = Vector2(0, -3.0)
	_pollen_particles.initial_velocity_min = 8.0
	_pollen_particles.initial_velocity_max = 22.0
	_pollen_particles.scale_amount_min = 2.0
	_pollen_particles.scale_amount_max = 5.0
	_pollen_particles.color = Color(0.95, 0.9, 0.65, 0.4)
	add_child(_pollen_particles)


func _setup_runic_portal_stone() -> void:
	# Portal arch stone with glowing runes driven by an emission pulse shader
	var shader := Shader.new()
	shader.code = """
shader_type canvas_item;

uniform vec4 rune_color : source_color = vec4(0.61, 0.68, 0.59, 1.0); // #9CAE96
uniform float pulse_speed : hint_range(0.1, 2.0) = 0.5;

void fragment() {
	vec4 col = texture(TEXTURE, UV);
	// Slow, non-strobing sine pulse for safe rune emission
	float pulse = 0.7 + 0.3 * sin(TIME * pulse_speed * 6.28318);
	vec3 emissive = col.rgb + (rune_color.rgb * pulse * col.a * 0.5);
	COLOR = vec4(emissive, col.a);
}
"""
	_runic_shader_mat = ShaderMaterial.new()
	_runic_shader_mat.shader = shader
	
	_runic_stone_sprite = Sprite2D.new()
	_runic_stone_sprite.name = "RunicPortalStone"
	_runic_stone_sprite.position = portal_stone_position
	_runic_stone_sprite.material = _runic_shader_mat
	add_child(_runic_stone_sprite)


func _setup_transition_trigger() -> void:
	# Area2D trigger zone spanning the natural arch threshold
	_transition_area = Area2D.new()
	_transition_area.name = "FaeThresholdTrigger"
	_transition_area.position = portal_stone_position
	
	var collision := CollisionShape2D.new()
	var box := RectangleShape2D.new()
	box.size = Vector2(160, 240)
	collision.shape = box
	_transition_area.add_child(collision)
	
	_transition_area.body_entered.connect(_on_body_entered)
	add_child(_transition_area)


func _on_body_entered(body: Node) -> void:
	print("[FaeCrossingThreshold] Entity %s crossed threshold into Fae Kingdom." % body.name)
	threshold_crossed.emit(target_scene_path)
	if target_scene_path != "" and ResourceLoader.exists(target_scene_path):
		get_tree().change_scene_to_file(target_scene_path)
