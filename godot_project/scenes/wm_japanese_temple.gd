## wm_japanese_temple.gd
## Serene Japanese Mountain Temple scene script for Geode Inn in cherry blossom season.
## Features soft dusk canvas modulate (#3A3A4A), diffused light (#E8D8E0), falling cherry blossom petals,
## paper lantern point lights (#F0C8A0), raked sand stone garden normal map shader,
## koi pond with water reflection shader, wind chime audio, and meditation rest buff Area2D.
extends Node2D

# Designer-tweakable parameters
@export var canvas_modulate_color: Color = Color("#3A3A4A") # Soft Japanese mountain dusk tint
@export var soft_diffused_light_color: Color = Color("#E8D8E0") # Diffused blossom light
@export var soft_diffused_light_energy: float = 0.6

@export var paper_lantern_color: Color = Color("#F0C8A0") # Warm rice paper lantern light
@export var paper_lantern_energy: float = 0.5
@export var lantern_positions: Array[Vector2] = [
	Vector2(320, 280),
	Vector2(480, 280),
	Vector2(800, 320),
	Vector2(960, 320)
]

@export var koi_pond_position: Vector2 = Vector2(880, 500)
@export var koi_pond_size: Vector2 = Vector2(300, 180)

@export var meditation_spot_position: Vector2 = Vector2(400, 480)
@export var rest_buff_duration: float = 300.0 # 5 minute calm/rest buff duration

# Signals
signal meditation_started(buff_duration: float)
signal wind_chime_sounded()

# Internal references
var _canvas_modulate: CanvasModulate
var _diffused_light: DirectionalLight2D
var _lantern_lights: Array[PointLight2D] = []
var _blossom_particles: CPUParticles2D
var _raked_sand_shader_mat: ShaderMaterial
var _koi_pond_rect: ColorRect
var _koi_pond_shader_mat: ShaderMaterial
var _meditation_area: Area2D
var _wind_chime_audio_player: AudioStreamPlayer


func _ready() -> void:
	_setup_atmosphere()
	_setup_diffused_lighting()
	_setup_paper_lanterns()
	_setup_cherry_blossom_particles()
	_setup_raked_sand_stone_garden()
	_setup_koi_pond_water_reflection()
	_setup_wind_chime_audio()
	_setup_meditation_rest_area()


func _setup_atmosphere() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	_canvas_modulate.color = canvas_modulate_color
	add_child(_canvas_modulate)


func _setup_diffused_lighting() -> void:
	_diffused_light = DirectionalLight2D.new()
	_diffused_light.name = "DiffusedBlossomSunlight"
	_diffused_light.color = soft_diffused_light_color
	_diffused_light.energy = soft_diffused_light_energy
	_diffused_light.rotation = deg_to_rad(50.0)
	add_child(_diffused_light)


func _setup_paper_lanterns() -> void:
	# Paper lantern glow lights using safe CatacombLighting crystal/lantern builder
	for i in range(lantern_positions.size()):
		var light := CatacombLighting.create_crystal_light(
			paper_lantern_color,
			paper_lantern_energy,
			lantern_positions[i],
			0.2 # 5s period pulse (Epilepsy safe)
		)
		light.name = "PaperLanternLight_%d" % i
		add_child(light)
		_lantern_lights.append(light)


func _setup_cherry_blossom_particles() -> void:
	# Falling pink cherry blossom petals (sakura) drifting gently
	_blossom_particles = CPUParticles2D.new()
	_blossom_particles.name = "FallingCherryBlossomPetals"
	_blossom_particles.amount = 60
	_blossom_particles.lifetime = 8.0
	_blossom_particles.preprocess = 4.0
	_blossom_particles.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	_blossom_particles.emission_rect_extents = Vector2(700, 20)
	_blossom_particles.position = Vector2(640, -10)
	_blossom_particles.direction = Vector2(0.6, 1.0)
	_blossom_particles.spread = 20.0
	_blossom_particles.gravity = Vector2(8.0, 12.0)
	_blossom_particles.initial_velocity_min = 15.0
	_blossom_particles.initial_velocity_max = 35.0
	_blossom_particles.angular_velocity_min = -60.0
	_blossom_particles.angular_velocity_max = 60.0
	_blossom_particles.scale_amount_min = 3.0
	_blossom_particles.scale_amount_max = 6.0
	_blossom_particles.color = Color(1.0, 0.78, 0.88, 0.85) # Soft sakura pink
	add_child(_blossom_particles)


func _setup_raked_sand_stone_garden() -> void:
	# Zen stone garden with raked sand ripple normal map shader
	var shader := Shader.new()
	shader.code = """
shader_type canvas_item;

uniform vec4 sand_tint : source_color = vec4(0.82, 0.80, 0.75, 1.0);

void fragment() {
	vec2 uv = UV;
	# Raked sand concentric ripples around stones
	float ripples = sin(uv.x * 62.8318) * 0.1;
	vec3 final_color = sand_tint.rgb + vec3(ripples);
	COLOR = vec4(final_color, 1.0);
}
"""
	_raked_sand_shader_mat = ShaderMaterial.new()
	_raked_sand_shader_mat.shader = shader


func _setup_koi_pond_water_reflection() -> void:
	# Koi pond with water reflection distortion shader from CatacombLighting
	_koi_pond_shader_mat = CatacombLighting.create_water_reflection()
	_koi_pond_shader_mat.set_shader_parameter("water_tint", Vector4(0.2, 0.35, 0.45, 0.5))
	
	_koi_pond_rect = ColorRect.new()
	_koi_pond_rect.name = "TempleKoiPond"
	_koi_pond_rect.position = koi_pond_position - (koi_pond_size / 2.0)
	_koi_pond_rect.size = koi_pond_size
	_koi_pond_rect.material = _koi_pond_shader_mat
	add_child(_koi_pond_rect)


func _setup_wind_chime_audio() -> void:
	# Synthesize gentle wind chime audio stream
	var sample_rate := 44100
	var duration := 1.5
	var num_samples := int(sample_rate * duration)
	var pcm_data := PackedByteArray()
	pcm_data.resize(num_samples * 2)
	
	for i in range(num_samples):
		var t := float(i) / float(sample_rate)
		# Pentatonic chime chime decay: 1046.5Hz (C6) + 1318.5Hz (E6)
		var env := exp(-3.0 * t)
		var chime_wave := (sin(TAU * 1046.5 * t) + sin(TAU * 1318.5 * t) * 0.7) * env * 0.3
		var sample_int := int(clampf(chime_wave, -1.0, 1.0) * 32767.0)
		pcm_data.encode_s16(i * 2, sample_int)
		
	var wav := AudioStreamWav.new()
	wav.format = AudioStreamWav.FORMAT_16_BITS
	wav.mix_rate = sample_rate
	wav.loop_mode = AudioStreamWav.LOOP_DISABLED
	wav.data = pcm_data
	
	_wind_chime_audio_player = AudioStreamPlayer.new()
	_wind_chime_audio_player.name = "WindChimeAudioPlayer"
	_wind_chime_audio_player.stream = wav
	_wind_chime_audio_player.volume_db = -10.0
	add_child(_wind_chime_audio_player)


func _setup_meditation_rest_area() -> void:
	# Meditation mat Area2D where sitting triggers a calm buff / rest mechanic
	_meditation_area = Area2D.new()
	_meditation_area.name = "TempleMeditationRestSpot"
	_meditation_area.position = meditation_spot_position
	
	var col := CollisionShape2D.new()
	var circle := CircleShape2D.new()
	circle.radius = 50.0
	col.shape = circle
	_meditation_area.add_child(col)
	
	_meditation_area.body_entered.connect(func(body: Node) -> void:
		print("[JapaneseTemple] Player %s sat at meditation spot -> Calm / rest buff activated (duration: %.0fs)" % [body.name, rest_buff_duration])
		if is_instance_valid(_wind_chime_audio_player):
			_wind_chime_audio_player.play()
			wind_chime_sounded.emit()
		meditation_started.emit(rest_buff_duration)
	)
	add_child(_meditation_area)
