## fae_crystal_gardens.gd
## Neutral Crystal Garden zone scene script for Geode Inn.
## Features glowing crystal formations (#80C8E0), prismatic refraction shader, interactive chime particles,
## central Griffin boss arena, and Griffin NPC full-presence spawn logic based on dual-court reputation.
extends Node2D

# Designer-tweakable parameters
@export var canvas_modulate_color: Color = Color("#2A3540") # Cool neutral crystalline darkness
@export var crystal_glow_color: Color = Color("#80C8E0") # Internal crystal light cyan
@export var crystal_glow_energy: float = 1.0

@export var griffin_spawn_center: Vector2 = Vector2(640, 360)
@export var griffin_required_seelie_rep: float = 0.5
@export var griffin_required_unseelie_rep: float = 0.5

@export var current_seelie_rep: float = 0.6
@export var current_unseelie_rep: float = 0.6

# Signals
signal griffin_appeared()
signal crystal_chime_triggered(crystal_id: int, note_hz: float)

# Internal references
var _canvas_modulate: CanvasModulate
var _crystal_lights: Array[PointLight2D] = []
var _crystal_areas: Array[Area2D] = []
var _prismatic_shader_mat: ShaderMaterial
var _griffin_npc: Node2D
var _chime_particles: CPUParticles2D

# Frequencies for musical chimes (Solfeggio frequencies)
const CRYSTAL_TONES: Array[float] = [528.0, 639.0, 741.0, 852.0, 963.0]


func _ready() -> void:
	_setup_atmosphere()
	_setup_prismatic_refraction_shader()
	_setup_crystal_formations()
	_setup_chime_particle_system()
	_setup_griffin_arena()
	_check_griffin_presence()


func _setup_atmosphere() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	_canvas_modulate.color = canvas_modulate_color
	add_child(_canvas_modulate)


func _setup_prismatic_refraction_shader() -> void:
	# Custom shader simulating rainbow prismatic refractions inside crystal clusters
	var shader := Shader.new()
	shader.code = """
shader_type canvas_item;

uniform float refract_speed : hint_range(0.1, 2.0) = 0.4;

void fragment() {
	vec4 base = texture(TEXTURE, UV);
	// Rainbow hue shift across UV driven by time
	float hue = fract(UV.x + UV.y + TIME * refract_speed * 0.1);
	vec3 rainbow = 0.5 + 0.5 * cos(6.28318 * (hue + vec3(0.0, 0.33, 0.67)));
	
	COLOR = vec4(mix(base.rgb, rainbow, 0.35 * base.a), base.a);
}
"""
	_prismatic_shader_mat = ShaderMaterial.new()
	_prismatic_shader_mat.shader = shader


func _setup_crystal_formations() -> void:
	var crystal_positions := [
		Vector2(250, 250),
		Vector2(1030, 250),
		Vector2(200, 520),
		Vector2(1080, 520),
		Vector2(640, 160)
	]
	
	for i in range(crystal_positions.size()):
		var pos := crystal_positions[i]
		
		# Internal crystal glow light (using safe CatacombLighting crystal builder)
		var light := CatacombLighting.create_crystal_light(
			crystal_glow_color,
			crystal_glow_energy,
			pos,
			0.2 # 5s period pulse (Epilepsy safe)
		)
		light.name = "CrystalGlow_%d" % i
		add_child(light)
		_crystal_lights.append(light)
		
		# Proximity trigger Area2D for player walking near to play crystal chime tone
		var area := Area2D.new()
		area.name = "CrystalChimeArea_%d" % i
		area.position = pos
		
		var col := CollisionShape2D.new()
		var circle := CircleShape2D.new()
		circle.radius = 75.0
		col.shape = circle
		area.add_child(col)
		
		var crystal_idx := i
		area.body_entered.connect(func(body: Node) -> void: _on_crystal_approached(crystal_idx, body))
		add_child(area)
		_crystal_areas.append(area)


func _setup_chime_particle_system() -> void:
	# Sparkle chime particles released when player passes near a crystal
	_chime_particles = CPUParticles2D.new()
	_chime_particles.name = "CrystalChimeSparkles"
	_chime_particles.emitting = false
	_chime_particles.one_shot = true
	_chime_particles.amount = 25
	_chime_particles.lifetime = 1.5
	_chime_particles.spread = 180.0
	_chime_particles.gravity = Vector2(0, -10.0)
	_chime_particles.initial_velocity_min = 20.0
	_chime_particles.initial_velocity_max = 50.0
	_chime_particles.scale_amount_min = 2.0
	_chime_particles.scale_amount_max = 5.0
	_chime_particles.color = Color(0.80, 0.95, 1.0, 0.9)
	add_child(_chime_particles)


func _setup_griffin_arena() -> void:
	# Central arena platform node for the Griffin boss / neutral lord
	var arena_marker := Marker2D.new()
	arena_marker.name = "GriffinBossArenaCenter"
	arena_marker.position = griffin_spawn_center
	add_child(arena_marker)


func _check_griffin_presence() -> void:
	# Griffin appears when player holds sufficient reputation from both Seelie and Unseelie court
	var has_seelie := current_seelie_rep >= griffin_required_seelie_rep
	var has_unseelie := current_unseelie_rep >= griffin_required_unseelie_rep
	
	if has_seelie and has_unseelie:
		_spawn_griffin_npc()
	else:
		print("[CrystalGardens] Griffin requires dual court respect (Seelie >= %.1f, Unseelie >= %.1f). Griffin absent." % [griffin_required_seelie_rep, griffin_required_unseelie_rep])


func _spawn_griffin_npc() -> void:
	if _griffin_npc != null:
		return
		
	_griffin_npc = Node2D.new()
	_griffin_npc.name = "GriffinLordNPC"
	_griffin_npc.position = griffin_spawn_center
	add_child(_griffin_npc)
	
	griffin_appeared.emit()
	print("[CrystalGardens] Griffin Lord appeared in central arena! Dual court reputation threshold satisfied.")


func _on_crystal_approached(crystal_idx: int, body: Node) -> void:
	var note_hz := CRYSTAL_TONES[crystal_idx % CRYSTAL_TONES.size()]
	if is_instance_valid(_chime_particles):
		_chime_particles.position = _crystal_areas[crystal_idx].position
		_chime_particles.restart()
		_chime_particles.emitting = true
		
	crystal_chime_triggered.emit(crystal_idx, note_hz)
	print("[CrystalGardens] Crystal %d approached by %s -> Chime tone: %.1f Hz" % [crystal_idx, body.name, note_hz])
