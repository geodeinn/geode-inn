## fae_stone_circle.gd
## Deepest point of Fae Kingdom — ancient stone circle chamber scene script for Geode Inn.
## Features dark atmospheric modulation (#1A1A1A), standing stones with faint internal glow (#4A6878),
## 64Hz ambient hum audio (Listener gargoyle frequency), central stone altar interactable rewarding
## rare stones (Labradorite, Fluorite, Rainbow Moonstone, Preseli Blue Stone), and slow floating dust particles.
extends Node2D

# Designer-tweakable parameters
@export var canvas_modulate_color: Color = Color("#1A1A1A") # Deep dark chamber tone
@export var stone_glow_color: Color = Color("#4A6878") # Faint internal slate cyan glow
@export var stone_glow_energy: float = 0.5

@export var hum_frequency_hz: float = 64.0 # Listener gargoyle deep resonance frequency
@export var hum_volume_db: float = -12.0

@export var altar_position: Vector2 = Vector2(640, 380)

# Signals
signal altar_interacted(reward_stone: String)
signal stone_rewards_exhausted()

# Internal variables
var _canvas_modulate: CanvasModulate
var _stone_lights: Array[PointLight2D] = []
var _altar_area: Area2D
var _dust_particles: CPUParticles2D
var _hum_audio_player: AudioStreamPlayer

# Rare stone reward pool
@export var rare_stone_rewards: Array[String] = [
	"Labradorite",
	"Fluorite",
	"Rainbow Moonstone",
	"Preseli Blue Stone"
]
var _reward_index: int = 0


func _ready() -> void:
	_setup_atmosphere()
	_setup_standing_stones_circle()
	_setup_central_altar()
	_setup_dust_particles()
	_setup_64hz_ambient_hum()


func _setup_atmosphere() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	_canvas_modulate.color = canvas_modulate_color
	add_child(_canvas_modulate)


func _setup_standing_stones_circle() -> void:
	# Circle of ancient Megalithic Standing Stones with faint internal glow
	var stone_count := 8
	var circle_radius := 260.0
	
	for i in range(stone_count):
		var angle := (float(i) / float(stone_count)) * TAU
		var pos := altar_position + Vector2(cos(angle), sin(angle) * 0.5) * circle_radius
		
		var light := CatacombLighting.create_crystal_light(
			stone_glow_color,
			stone_glow_energy,
			pos,
			0.15 # 6.67 second ultra-slow pulse (Epilepsy safe)
		)
		light.name = "StandingStoneGlow_%d" % i
		add_child(light)
		_stone_lights.append(light)


func _setup_central_altar() -> void:
	# Central stone altar interactable node
	_altar_area = Area2D.new()
	_altar_area.name = "AncientStoneAltarArea"
	_altar_area.position = altar_position
	
	var col := CollisionShape2D.new()
	var circle := CircleShape2D.new()
	circle.radius = 60.0
	col.shape = circle
	_altar_area.add_child(col)
	
	_altar_area.body_entered.connect(_on_altar_body_entered)
	add_child(_altar_area)


func _setup_dust_particles() -> void:
	# Quiet, floating ambient dust particles in the sacred stone circle
	_dust_particles = CPUParticles2D.new()
	_dust_particles.name = "SacredStoneCircleDust"
	_dust_particles.amount = 30
	_dust_particles.lifetime = 12.0
	_dust_particles.preprocess = 6.0
	_dust_particles.emission_shape = CPUParticles2D.EMISSION_SHAPE_CIRCLE
	_dust_particles.emission_sphere_radius = 300.0
	_dust_particles.position = altar_position
	_dust_particles.direction = Vector2(0, -1)
	_dust_particles.spread = 180.0
	_dust_particles.gravity = Vector2(0, 0)
	_dust_particles.initial_velocity_min = 2.0
	_dust_particles.initial_velocity_max = 8.0
	_dust_particles.scale_amount_min = 1.5
	_dust_particles.scale_amount_max = 3.5
	_dust_particles.color = Color(0.7, 0.7, 0.7, 0.2)
	add_child(_dust_particles)


func _setup_64hz_ambient_hum() -> void:
	# Synthesize continuous 64Hz ambient sine wave audio (Listener gargoyle resonant tone)
	var sample_rate := 44100
	var duration := 2.0
	var num_samples := int(sample_rate * duration)
	var pcm_data := PackedByteArray()
	pcm_data.resize(num_samples * 2)
	
	for i in range(num_samples):
		var t := float(i) / float(sample_rate)
		# Pure 64Hz sine wave with subtle sub-harmonic for deep warmth
		var wave := sin(TAU * hum_frequency_hz * t) * 0.7 + sin(TAU * (hum_frequency_hz * 0.5) * t) * 0.2
		var sample_int := int(clampf(wave, -1.0, 1.0) * 32767.0)
		pcm_data.encode_s16(i * 2, sample_int)
		
	var wav := AudioStreamWav.new()
	wav.format = AudioStreamWav.FORMAT_16_BITS
	wav.mix_rate = sample_rate
	wav.loop_mode = AudioStreamWav.LOOP_FORWARD
	wav.loop_begin = 0
	wav.loop_end = num_samples
	wav.data = pcm_data
	
	_hum_audio_player = AudioStreamPlayer.new()
	_hum_audio_player.name = "Listener64HzHumAudioPlayer"
	_hum_audio_player.stream = wav
	_hum_audio_player.volume_db = hum_volume_db
	add_child(_hum_audio_player)
	_hum_audio_player.play()


func _on_altar_body_entered(body: Node) -> void:
	interact_with_altar(body.name)


## Public interaction function called when player activates the altar
func interact_with_altar(interactor_name: String = "Player") -> void:
	if _reward_index < rare_stone_rewards.size():
		var reward := rare_stone_rewards[_reward_index]
		_reward_index += 1
		print("[StoneCircle] Altar activated by %s -> Rewarded rare stone: %s" % [interactor_name, reward])
		altar_interacted.emit(reward)
	else:
		print("[StoneCircle] Altar offerings exhausted. The ancient stones rest quietly.")
		stone_rewards_exhausted.emit()
