# AudioManager.gd — Geode Inn Audio Engine (Autoload)
# IEM-based Acoustic Architecture (Empire Ears design philosophy)
# The Inn IS a transducer — zones map to driver types
# Dynamic Drivers = stones/matter, Balanced Armature = characters/voices
# Electrostatic = cosmology, Bone Conduction = catacombs/42Hz Song
# System constants: 42Hz Song, 84Hz Shadow Inn, 111Hz gargoyle watchers
# 50 BPM canopy sway, 7.83Hz Schumann calibration
#
# AUDIO LIBRARY:
# - 6 Soulstice Melodies (original compositions)
# - 4 Low-Dub ambient tracks (transformed PD classical)
# - 3 Campfire layers (drone + crackle + harmony)
# - 160 Stone vibrations (unique tones per stone, Mohs → frequency)
# - 12 Stone chords (harmonic sets for major stones)
# - 3 PD classical sources (reference only)

extends Node

# === SIGNALS ===
signal zone_music_changed(zone_name: String)
signal frequency_layer_changed(layer: String)

# === AUDIO BUSES ===
const BUS_MASTER := "Master"
const BUS_MUSIC := "Music"
const BUS_SFX := "SFX"
const BUS_AMBIENT := "Ambient"
const BUS_STONES := "Stones"
const BUS_VOICE := "Voice"

# === ZONE → TRACK MAPPING ===
# Maps each zone to its primary music track and ambient layer
const ZONE_TRACKS: Dictionary = {
	"hub": {
		"primary": "res://assets/audio/music/Soulstice_Signature.wav",
		"ambient": "res://assets/audio/inn_bach_cello_lowlub.mp3",
		"frequency": 42,
		"tempo": 50
	},
	"cosmology": {
		"primary": "res://assets/audio/music/Earth_&_Sky.wav",
		"ambient": "",
		"frequency": 0,
		"tempo": 65
	},
	"main_floor_day": {
		"primary": "res://assets/audio/music/Royal_Fire.wav",
		"ambient": "res://assets/audio/inn_bach_cello_lowlub.mp3",
		"frequency": 42,
		"tempo": 88
	},
	"main_floor_evening": {
		"primary": "res://assets/audio/music/Royal_Fire.wav",
		"ambient": "res://assets/audio/inn_satie_gnossienne_lowdub_archive.mp3",
		"frequency": 42,
		"tempo": 75
	},
	"campgrounds": {
		"primary": "res://assets/audio/music/Forest_Depths.wav",
		"ambient": "res://assets/audio/inn_campfire_baritone_resonance.mp3",
		"frequency": 42,
		"tempo": 50
	},
	"catacombs": {
		"primary": "",
		"ambient": "res://assets/audio/inn_vivaldi_winter_lowdub_catacombs.mp3",
		"frequency": 42,
		"tempo": 70
	},
	"archive": {
		"primary": "",
		"ambient": "res://assets/audio/inn_satie_gnossienne_lowdub_archive.mp3",
		"frequency": 42,
		"tempo": 55
	},
	"market": {
		"primary": "res://assets/audio/music/Royal_Fire.wav",
		"ambient": "",
		"frequency": 42,
		"tempo": 108
	},
	"water_zones": {
		"primary": "res://assets/audio/music/Ocean's_Edge.wav",
		"ambient": "",
		"frequency": 42,
		"tempo": 80
	},
	"gorgons_garden": {
		"primary": "res://assets/audio/music/Midnight_Garden.wav",
		"ambient": "",
		"frequency": 84,
		"tempo": 70
	},
	"undercity": {
		"primary": "res://assets/audio/music/Midnight_Garden.wav",
		"ambient": "",
		"frequency": 84,
		"tempo": 78
	},
	"shadow_inn": {
		"primary": "res://assets/audio/music/Midnight_Garden.wav",
		"ambient": "",
		"frequency": 84,
		"tempo": 75
	},
	"fae_seelie": {
		"primary": "res://assets/audio/music/Earth_&_Sky.wav",
		"ambient": "",
		"frequency": 42,
		"tempo": 100
	},
	"fae_unseelie": {
		"primary": "res://assets/audio/music/Midnight_Garden.wav",
		"ambient": "",
		"frequency": 84,
		"tempo": 78
	},
	"world_map": {
		"primary": "res://assets/audio/music/Soulstice_Signature.wav",
		"ambient": "",
		"frequency": 42,
		"tempo": 90
	},
	"staircase": {
		"primary": "",
		"ambient": "",
		"frequency": 42,
		"tempo": 80
	}
}

# === GAME → TRACK MAPPING ===
const GAME_TRACKS: Dictionary = {
	"Standing Stones": "res://assets/audio/music/Soulstice_Signature.wav",
	"Tomb Tunnel": "res://assets/audio/inn_vivaldi_winter_lowdub_catacombs.mp3",
	"Andean Run": "res://assets/audio/music/Forest_Depths.wav",
	"Monster of the Deep": "res://assets/audio/music/Ocean's_Edge.wav",
	"Tumble Run": "res://assets/audio/music/Soulstice_Signature.wav"
}

# === CAMPFIRE LAYERS ===
const CAMPFIRE_DRONE := "res://assets/audio/campfire/campfire_baritone_drone.wav"
const CAMPFIRE_CRACKLE := "res://assets/audio/campfire/campfire_crackle.wav"
const CAMPFIRE_HARMONY := "res://assets/audio/campfire/campfire_harmony_layer.wav"

# === FREQUENCY CONSTANTS ===
const FREQ_LIVING := 42    # The Song of Making
const FREQ_SHADOW := 84    # Shadow Inn inverse
const FREQ_GARGOYLE := 111 # Gargoyle Watchers
const FREQ_SCHUMANN := 7.83
const BPM_CANOPY := 50     # The Inn's resting pulse

# === AUDIO STREAMS ===
var _current_music: AudioStreamPlayer = null
var _ambient_player: AudioStreamPlayer = null
var _campfire_drone_player: AudioStreamPlayer = null
var _campfire_crackle_player: AudioStreamPlayer = null
var _campfire_harmony_player: AudioStreamPlayer = null
var _sfx_players: Array[AudioStreamPlayer] = []
const MAX_SFX_PLAYERS := 8

# === STATE ===
var _current_zone_music: String = ""
var _current_zone: String = ""
var _frequency_hz: int = FREQ_LIVING
var _is_muted: bool = false
var _master_volume: float = 1.0
var _music_volume: float = 0.7
var _sfx_volume: float = 0.8
var _campfire_active: bool = false

func _ready() -> void:
	_setup_buses()
	_preload_sfx_pool()

func _setup_buses() -> void:
	if AudioServer.get_bus_count() == 1:
		AudioServer.add_bus()
		AudioServer.add_bus()
		AudioServer.add_bus()
		AudioServer.add_bus()
		AudioServer.add_bus()
		
		AudioServer.set_bus_name(1, BUS_MUSIC)
		AudioServer.set_bus_name(2, BUS_SFX)
		AudioServer.set_bus_name(3, BUS_AMBIENT)
		AudioServer.set_bus_name(4, BUS_STONES)
		AudioServer.set_bus_name(5, BUS_VOICE)
		
		AudioServer.set_bus_send(1, BUS_MASTER)
		AudioServer.set_bus_send(2, BUS_MASTER)
		AudioServer.set_bus_send(3, BUS_MASTER)
		AudioServer.set_bus_send(4, BUS_MASTER)
		AudioServer.set_bus_send(5, BUS_MASTER)

func _preload_sfx_pool() -> void:
	for i in MAX_SFX_PLAYERS:
		var player := AudioStreamPlayer.new()
		player.bus = BUS_SFX
		add_child(player)
		_sfx_players.append(player)

# === ZONE MUSIC ===
func play_zone_music(zone_name: String) -> void:
	_current_zone = zone_name
	
	# Handle frequency shift zones
	var zone_data: Dictionary = ZONE_TRACKS.get(zone_name, {})
	if zone_data.is_empty():
		push_warning("AudioManager: No track mapping for zone: " + zone_name)
		return
	
	# Set frequency for this zone
	var zone_freq: int = zone_data.get("frequency", FREQ_LIVING)
	if zone_freq != _frequency_hz:
		set_frequency(zone_freq)
	
	# Play primary track
	var primary_path: String = zone_data.get("primary", "")
	if primary_path != "":
		_play_music(primary_path)
	
	# Play ambient layer
	var ambient_path: String = zone_data.get("ambient", "")
	if ambient_path != "":
		_play_ambient(ambient_path)
	else:
		_stop_ambient()
	
	zone_music_changed.emit(zone_name)

func play_game_music(game_name: String) -> void:
	var track_path: String = GAME_TRACKS.get(game_name, "")
	if track_path != "":
		_play_music(track_path)
		_stop_ambient()

func _play_music(music_path: String) -> void:
	if music_path == _current_zone_music:
		return
	
	if _current_music and _current_music.playing:
		_fade_out(_current_music, 0.5)
	
	if not ResourceLoader.exists(music_path):
		push_warning("AudioManager: Music not found: " + music_path)
		return
	
	var stream := load(music_path)
	if stream == null:
		return
	
	_current_music = AudioStreamPlayer.new()
	_current_music.stream = stream
	_current_music.bus = BUS_MUSIC
	_current_music.volume_db = linear_to_db(0.0)
	add_child(_current_music)
	_current_music.play()
	_current_zone_music = music_path
	_fade_in(_current_music, 1.0)

func _play_ambient(ambient_path: String) -> void:
	if _ambient_player and _ambient_player.playing:
		_fade_out(_ambient_player, 0.5)
	
	if not ResourceLoader.exists(ambient_path):
		return
	
	var stream := load(ambient_path)
	if stream == null:
		return
	
	_ambient_player = AudioStreamPlayer.new()
	_ambient_player.stream = stream
	_ambient_player.bus = BUS_AMBIENT
	_ambient_player.volume_db = linear_to_db(0.4)
	add_child(_ambient_player)
	_ambient_player.play()
	_fade_in(_ambient_player, 1.5)

func _stop_ambient() -> void:
	if _ambient_player:
		_fade_out(_ambient_player, 0.5)

func stop_music() -> void:
	if _current_music:
		_fade_out(_current_music, 0.5)
		_current_zone_music = ""
	_stop_ambient()

# === CAMPFIRE SYSTEM ===
func start_campfire() -> void:
	if _campfire_active:
		return
	_campfire_active = true
	
	# Layer 1: Drone (base)
	_campfire_drone_player = _create_loop_player(CAMPFIRE_DRONE, BUS_AMBIENT, 0.6)
	
	# Layer 2: Crackle (fire sound)
	_campfire_crackle_player = _create_loop_player(CAMPFIRE_CRACKLE, BUS_SFX, 0.4)
	
	# Layer 3: Harmony (sung tones — fade in slowly)
	_campfire_harmony_player = _create_loop_player(CAMPFIRE_HARMONY, BUS_VOICE, 0.0)
	_fade_in(_campfire_harmony_player, 8.0)

func stop_campfire() -> void:
	_campfire_active = false
	if _campfire_drone_player:
		_fade_out(_campfire_drone_player, 1.0)
	if _campfire_crackle_player:
		_fade_out(_campfire_crackle_player, 1.0)
	if _campfire_harmony_player:
		_fade_out(_campfire_harmony_player, 2.0)

func _create_loop_player(path: String, bus: String, vol: float) -> AudioStreamPlayer:
	if not ResourceLoader.exists(path):
		return null
	var stream := load(path)
	if stream is AudioStreamWAV:
		stream.loop = true
	var player := AudioStreamPlayer.new()
	player.stream = stream
	player.bus = bus
	player.volume_db = linear_to_db(vol)
	add_child(player)
	player.play()
	return player

# === SFX ===
func play_sfx(sfx_path: String, pitch: float = 1.0) -> void:
	if not ResourceLoader.exists(sfx_path):
		return
	var stream := load(sfx_path)
	if stream == null:
		return
	var player := _get_available_sfx_player()
	player.stream = stream
	player.pitch_scale = pitch
	player.play()

func play_stone_vibration(stone_name: String) -> void:
	var path := "res://assets/audio/stone_vibrations/" + stone_name.replace(" ", "_").replace("'", "") + ".wav"
	if ResourceLoader.exists(path):
		var player := _get_available_sfx_player()
		player.bus = BUS_STONES
		player.stream = load(path)
		player.play()
	else:
		push_warning("AudioManager: No vibration for stone: " + stone_name)

func play_stone_chord(stone_name: String) -> void:
	var path := "res://assets/audio/stone_chords/" + stone_name.replace(" ", "_").replace("'", "") + ".wav"
	if ResourceLoader.exists(path):
		var player := _get_available_sfx_player()
		player.bus = BUS_STONES
		player.stream = load(path)
		player.play()

# === FREQUENCY SYSTEM ===
func set_frequency(hz: int) -> void:
	_frequency_hz = hz
	frequency_layer_changed.emit("living" if hz == FREQ_LIVING else "shadow" if hz == FREQ_SHADOW else "neutral")
	
	# Play a brief frequency tone to signal the shift
	play_frequency_tone(hz, 1.5)

func get_frequency() -> int:
	return _frequency_hz

func toggle_frequency() -> void:
	if _frequency_hz == FREQ_LIVING:
		set_frequency(FREQ_SHADOW)
	else:
		set_frequency(FREQ_LIVING)

func play_frequency_tone(hz: int, duration: float = 2.0) -> void:
	var sample_rate := 44100
	var num_samples := int(sample_rate * duration)
	
	var stream := AudioStreamWAV.new()
	stream.format = AudioStreamWAV.FORMAT_16
	stream.mix_rate = sample_rate
	stream.stereo = false
	
	var data := PackedByteArray()
	data.resize(num_samples * 2)
	
	for i in num_samples:
		var t := float(i) / float(sample_rate)
		var sample := sin(t * hz * TAU) * 0.3
		var envelope := 1.0
		if i < sample_rate * 0.1:
			envelope = float(i) / (sample_rate * 0.1)
		elif i > num_samples - sample_rate * 0.1:
			envelope = float(num_samples - i) / (sample_rate * 0.1)
		var sample_int := int(sample * envelope * 32767)
		data.encode_s16(i * 2, sample_int)
	
	stream.data = data
	
	var player := AudioStreamPlayer.new()
	player.stream = stream
	player.bus = BUS_AMBIENT
	add_child(player)
	player.play()
	get_tree().create_timer(duration + 0.1).timeout.connect(player.queue_free)

# === VOLUME CONTROL ===
func set_master_volume(value: float) -> void:
	_master_volume = clamp(value, 0.0, 1.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(BUS_MASTER), linear_to_db(_master_volume))

func set_music_volume(value: float) -> void:
	_music_volume = clamp(value, 0.0, 1.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(BUS_MUSIC), linear_to_db(_music_volume))

func set_sfx_volume(value: float) -> void:
	_sfx_volume = clamp(value, 0.0, 1.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(BUS_SFX), linear_to_db(_sfx_volume))

func toggle_mute() -> void:
	_is_muted = not _is_muted
	AudioServer.set_bus_mute(AudioServer.get_bus_index(BUS_MASTER), _is_muted)

# === HELPERS ===
func _get_available_sfx_player() -> AudioStreamPlayer:
	for player in _sfx_players:
		if not player.playing:
			return player
	return _sfx_players[0]

func _fade_out(player: AudioStreamPlayer, duration: float) -> void:
	var tween := create_tween()
	tween.tween_property(player, "volume_db", -40.0, duration)
	tween.tween_callback(player.queue_free)

func _fade_in(player: AudioStreamPlayer, duration: float) -> void:
	var start_vol := player.volume_db
	player.volume_db = -40.0
	var tween := create_tween()
	tween.tween_property(player, "volume_db", start_vol, duration)
