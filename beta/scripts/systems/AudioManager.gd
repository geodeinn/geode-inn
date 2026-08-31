###
# Geode Inn — Audio Manager
# The IEM-based Acoustic Architecture for Godot
# 
# This is the central audio system. It loads and plays all generated audio assets,
# manages zone transitions, handles tri-mode audio shifting (Living/Shadow/In-Between),
# and routes haptic patterns to the controller.
#
# Audio buses (configured in project.godot):
#   Master → Song (42Hz drone) → Zone (ambient beds) → Stones (chimes)
#         → Voice (dialogue) → Music (classical dub) → SFX (stingers/UI)
#         → Shadow (84Hz, muted by default, unmuted in Shadow Inn)
#
# System constants from the master audio doc.
###

extends Node
signal zone_changed(zone_name: String)
signal mode_changed(mode: AudioMode)

enum AudioMode { LIVING, SHADOW, IN_BETWEEN }

# === System Constants (from master audio doc) ===
const SONG_FREQUENCY_HZ: float = 42.0
const INVERSE_FREQUENCY_HZ: float = 84.0
const RESONANCE_FREQUENCY_HZ: float = 111.0
const SCHUMANN_RESONANCE_HZ: float = 7.83
const CANOPY_SWAY_BPM: float = 50.0
const CANOPY_SWAY_PERIOD: float = 60.0 / CANOPY_SWAY_BPM  # 1.2s per sway

# Solfeggio frequencies (Nine Muses)
const SOLFEGGIO: Dictionary = {
	"calliope": 42.0,    # Epic
	"clio": 72.0,       # Chronicle
	"euterpe": 50.0,    # Melody
	"thalia": 84.0,     # Comedy (shares Shadow Inn frequency)
	"melpomene": 396.0,  # Elegy
	"terpsichore": 528.0, # Dance / DNA repair
	"erato": 639.0,     # Love Song
	"polyhymnia": 741.0,  # Hymn
	"urania": 852.0,    # Star Song
}

# === Audio Bus Names ===
const BUS_MASTER = "Master"
const BUS_SONG = "Song"
const BUS_ZONE = "Zone"
const BUS_STONES = "Stones"
const BUS_VOICE = "Voice"
const BUS_MUSIC = "Music"
const BUS_SFX = "SFX"
const BUS_SHADOW = "Shadow"

# === Asset Paths ===
const AUDIO_ROOT = "res://beta/assets/audio/"
const STONE_CHIMES_DIR = "res://beta/assets/audio/stone_chimes/"
const SYSTEM_TONES_DIR = "res://beta/assets/audio/system_tones/"
const ZONE_AMBIENT_DIR = "res://beta/assets/audio/zone_ambient/"
const GAME_AUDIO_DIR = "res://beta/assets/audio/game_audio/"
const MUSIC_ROOM_DIR = "res://beta/assets/audio/music_room/"
const CLASSICAL_DUB_DIR = "res://beta/assets/audio/classical_dub/"

# === State ===
var current_mode: AudioMode = AudioMode.LIVING
var current_zone: String = ""
var song_player: AudioStreamPlayer
var zone_player: AudioStreamPlayer
var music_player: AudioStreamPlayer
var shadow_player: AudioStreamPlayer
var stone_players: Array[AudioStreamPlayer] = []
var sfx_players: Array[AudioStreamPlayer] = []
var stone_chime_cache: Dictionary = {}
var zone_ambient_cache: Dictionary = {}
var system_tone_cache: Dictionary = {}

# Haptic patterns (ms on, ms off)
const HAPTIC_LIVING = {"on": 200, "off": 400}      # Deep slow rumble
const HAPTIC_SHADOW = {"on": 30, "off": 50}        # Cold sharp pulse
const HAPTIC_IN_BETWEEN = {"on": 50, "off": 100}   # Medium pulse
const HAPTIC_GARGOYLE = {"on": 800, "off": 1200}   # Single long pulse
const HAPTIC_CANOPY = {"on": 600, "off": 600}      # Sway rhythm
const HAPTIC_ELECTROSTATIC = {"on": 10, "off": 10} # Very fast subtle
const HAPTIC_BONE = {"on": 500, "off": 200}        # Continuous low

# === Initialization ===

func _ready() -> void:
	_create_players()
	_load_system_tones()
	_load_zone_ambients()
	_start_song_drone()
	
	# Connect to GameManager signals if available
	if GameManager:
		GameManager.zone_entered.connect(_on_zone_entered)
	
	print("[AudioManager] Initialized — IEM Acoustic Architecture active")

func _create_players() -> void:
	# Song drone player (the 42Hz hum — always playing in Living mode)
	song_player = AudioStreamPlayer.new()
	song_player.name = "SongPlayer"
	song_player.bus = BUS_SONG
	add_child(song_player)
	
	# Zone ambient player (one zone at a time, crossfades)
	zone_player = AudioStreamPlayer.new()
	zone_player.name = "ZonePlayer"
	zone_player.bus = BUS_ZONE
	add_child(zone_player)
	
	# Classical music player (for Music Room, In-Between, special moments)
	music_player = AudioStreamPlayer.new()
	music_player.name = "MusicPlayer"
	music_player.bus = BUS_MUSIC
	add_child(music_player)
	
	# Shadow Inn drone player (84Hz, separate bus, muted by default)
	shadow_player = AudioStreamPlayer.new()
	shadow_player.name = "ShadowPlayer"
	shadow_player.bus = BUS_SHADOW
	add_child(shadow_player)
	
	# Pool of SFX players for stingers and UI sounds
	for i in range(8):
		var p = AudioStreamPlayer.new()
		p.name = "SFXPlayer_" + str(i)
		p.bus = BUS_SFX
		add_child(p)
		sfx_players.append(p)
	
	# Pool of stone chime players (polyphonic — multiple stones at once)
	for i in range(6):
		var p = AudioStreamPlayer.new()
		p.name = "StonePlayer_" + str(i)
		p.bus = BUS_STONES
		add_child(p)
		stone_players.append(p)

# === System Tones ===

func _load_system_tones() -> void:
	var tones = [
		"song_of_making_42hz",
		"shadow_inn_84hz",
		"gargoyle_watcher_111hz",
		"schumann_calibration_7.83hz",
		"canopy_sway_50bpm",
		"solfeggio_calliope_42hz",
		"solfeggio_clio_72hz",
		"solfeggio_euterpe_50hz",
		"solfeggio_thalia_84hz",
		"solfeggio_melpomene_396hz",
		"solfeggio_terpsichore_528hz",
		"solfeggio_erato_639hz",
		"solfeggio_polyhymnia_741hz",
		"solfeggio_urania_852hz",
	]
	for tone_name in tones:
		var path = SYSTEM_TONES_DIR + tone_name + ".wav"
		if ResourceLoader.has_cached(path) or FileAccess.file_exists(path):
			var stream = load(path)
			if stream:
				system_tone_cache[tone_name] = stream
	
	print("[AudioManager] Loaded %d system tones" % system_tone_cache.size())

func _start_song_drone() -> void:
	if system_tone_cache.has("song_of_making_42hz"):
		song_player.stream = system_tone_cache["song_of_making_42hz"]
		song_player.volume_db = -6.0  # Felt, not heard
		song_player.play()

# === Zone Ambients ===

func _load_zone_ambients() -> void:
	var zones = [
		"main_floor", "cosmology", "staircase", "catacombs",
		"modern_legends", "artisan_market", "fae_threshold",
		"seelie_court", "unseelie_court", "crystal_gardens",
		"stone_circle_chamber", "geode_cave_empty",
		"tidal_caves", "bayou", "garden", "meadery",
		"undercity", "bone_room", "cave_city", "poison_garden"
	]
	for zone_name in zones:
		var path = ZONE_AMBIENT_DIR + zone_name + ".wav"
		if ResourceLoader.has_cached(path) or FileAccess.file_exists(path):
			var stream = load(path)
			if stream:
				zone_ambient_cache[zone_name] = stream
	
	print("[AudioManager] Loaded %d zone ambients" % zone_ambient_cache.size())

func _on_zone_entered(zone_name: String) -> void:
	play_zone_ambient(zone_name)

func play_zone_ambient(zone_name: String) -> void:
	if current_zone == zone_name:
		return
	
	current_zone = zone_name
	zone_changed.emit(zone_name)
	
	if zone_ambient_cache.has(zone_name):
		# Crossfade: fade out current, fade in new
		var tween = create_tween()
		tween.tween_property(zone_player, "volume_db", -40.0, 0.5)
		tween.tween_callback(func():
			zone_player.stream = zone_ambient_cache[zone_name]
			zone_player.play()
		)
		tween.tween_property(zone_player, "volume_db", -6.0, 1.0)
	else:
		print("[AudioManager] No ambient found for zone: %s" % zone_name)

# === Stone Chimes ===

func play_stone_chime(stone_name: String, volume_db: float = -8.0) -> void:
	# Load on demand and cache
	if not stone_chime_cache.has(stone_name):
		var path = STONE_CHIMES_DIR + stone_name + ".wav"
		if FileAccess.file_exists(path):
			stone_chime_cache[stone_name] = load(path)
		else:
			print("[AudioManager] Stone chime not found: %s" % stone_name)
			return
	
	# Find an available stone player
	for player in stone_players:
		if not player.playing:
			player.stream = stone_chime_cache[stone_name]
			player.volume_db = volume_db
			player.play()
			return
	
	# All players busy — use the first one (oldest sound gets cut)
	stone_players[0].stream = stone_chime_cache[stone_name]
	stone_players[0].volume_db = volume_db
	stone_players[0].play()

func play_geode_cave_state(state: String) -> void:
	# state: "empty", "partial", "full"
	var path = MUSIC_ROOM_DIR + "geode_cave_" + state + ".wav"
	if FileAccess.file_exists(path):
		music_player.stream = load(path)
		music_player.bus = BUS_MUSIC
		music_player.volume_db = -6.0
		music_player.play()

# === Classical Dub Music ===

func play_classical_track(track_name: String) -> void:
	var path = CLASSICAL_DUB_DIR + track_name + ".wav"
	if FileAccess.file_exists(path):
		music_player.stream = load(path)
		music_player.bus = BUS_MUSIC
		music_player.volume_db = -5.0
		music_player.play()
	else:
		print("[AudioManager] Classical track not found: %s" % track_name)

func stop_classical_music() -> void:
	var tween = create_tween()
	tween.tween_property(music_player, "volume_db", -40.0, 1.5)
	tween.tween_callback(music_player.stop)

# === Game Stingers ===

func play_stinger(stinger_name: String) -> void:
	var path = GAME_AUDIO_DIR + stinger_name + ".wav"
	if not ResourceLoader.has_cached(path) and not FileAccess.file_exists(path):
		print("[AudioManager] Stinger not found: %s" % stinger_name)
		return
	
	var stream = load(path)
	for player in sfx_players:
		if not player.playing:
			player.stream = stream
			player.bus = BUS_SFX
			player.volume_db = -3.0
			player.play()
			return
	
	sfx_players[0].stream = stream
	sfx_players[0].play()

# === Tri-Mode Audio Shifting ===

func set_mode(mode: AudioMode) -> void:
	if current_mode == mode:
		return
	
	current_mode = mode
	mode_changed.emit(mode)
	
	match mode:
		AudioMode.LIVING:
			_enter_living_mode()
		AudioMode.SHADOW:
			_enter_shadow_mode()
		AudioMode.IN_BETWEEN:
			_enter_in_between_mode()

func _enter_living_mode() -> void:
	# Unmute Song bus, mute Shadow bus
	AudioServer.set_bus_mute(AudioServer.get_bus_index(BUS_SONG), false)
	AudioServer.set_bus_mute(AudioServer.get_bus_index(BUS_SHADOW), true)
	
	# Warm up zone bus
	var tween = create_tween()
	tween.tween_property(zone_player, "volume_db", -6.0, 2.0)
	
	# Resume song drone
	if not song_player.playing and system_tone_cache.has("song_of_making_42hz"):
		song_player.play()
	
	_trigger_haptic(HAPTIC_LIVING)
	print("[AudioManager] Mode → LIVING (42Hz)")

func _enter_shadow_mode() -> void:
	# Mute Song bus, unmute Shadow bus
	AudioServer.set_bus_mute(AudioServer.get_bus_index(BUS_SONG), true)
	AudioServer.set_bus_mute(AudioServer.get_bus_index(BUS_SHADOW), false)
	
	# Play Shadow Inn drone
	if system_tone_cache.has("shadow_inn_84hz"):
		shadow_player.stream = system_tone_cache["shadow_inn_84hz"]
		shadow_player.volume_db = -8.0
		shadow_player.play()
	
	# Darken zone bus
	var tween = create_tween()
	tween.tween_property(zone_player, "volume_db", -12.0, 1.5)
	
	_trigger_haptic(HAPTIC_SHADOW)
	print("[AudioManager] Mode → SHADOW (84Hz)")

func _enter_in_between_mode() -> void:
	# Both buses at reduced volume — liminal state
	AudioServer.set_bus_mute(AudioServer.get_bus_index(BUS_SONG), false)
	AudioServer.set_bus_mute(AudioServer.get_bus_index(BUS_SHADOW), false)
	
	# Lower both to create the theta-wave beating effect
	var tween = create_tween()
	tween.parallel().tween_property(song_player, "volume_db", -12.0, 3.0)
	tween.parallel().tween_property(shadow_player, "volume_db", -15.0, 3.0)
	tween.parallel().tween_property(zone_player, "volume_db", -15.0, 3.0)
	
	_trigger_haptic(HAPTIC_IN_BETWEEN)
	print("[AudioManager] Mode → IN-BETWEEN (63Hz)")

# === Gargoyle Proximity ===

func play_gargoyle_proximity() -> void:
	if system_tone_cache.has("gargoyle_watcher_111hz"):
		# Play on SFX bus as a one-shot
		for player in sfx_players:
			if not player.playing:
				player.stream = system_tone_cache["gargoyle_watcher_111hz"]
				player.bus = BUS_SFX
				player.volume_db = -6.0
				player.play()
				break
	
	_trigger_haptic(HAPTIC_GARGOYLE)

# === Nine Songs Chord ===

func play_nine_songs_chord() -> void:
	var path = MUSIC_ROOM_DIR + "nine_songs_chord.wav"
	if FileAccess.file_exists(path):
		music_player.stream = load(path)
		music_player.bus = BUS_MUSIC
		music_player.volume_db = -3.0
		music_player.play()

# === Music Room (Fortepiano) ===

func play_fortepiano_note(note_index: int) -> void:
	# note_index 0-12 maps to fortepiano_00 through fortepiano_12
	var path = MUSIC_ROOM_DIR + "fortepiano_%02d" % note_index + ".wav"
	# The frequency is embedded in the filename (220Hz-440Hz)
	if FileAccess.file_exists(path):
		for player in stone_players:
			if not player.playing:
				player.stream = load(path)
				player.bus = BUS_STONES
				player.volume_db = -5.0
				player.play()
				return

# === UI Sounds ===

func play_ui_sound(sound_name: String) -> void:
	# Placeholder — UI sounds need to be generated
	# For now, use stone chimes as UI feedback
	match sound_name:
		"button_click":
			play_stone_chime("clear_quartz", -12.0)
		"menu_open":
			play_stone_chime("amethyst", -10.0)
		"menu_close":
			play_stone_chime("obsidian", -12.0) if stone_chime_cache.has("obsidian") else play_stone_chime("black_onyx", -12.0)
		"notification":
			play_stone_chime("citrine", -8.0)
		"achievement":
			# Play a chord — three stones in sequence
			play_stone_chime("clear_quartz", -6.0)
			await get_tree().create_timer(0.15).timeout
			play_stone_chime("amethyst", -6.0)
			await get_tree().create_timer(0.15).timeout
			play_stone_chime("diamond", -6.0)
		"portal":
			# Ascending chime
			play_stone_chime("labradorite", -5.0)
		"error":
			# Dissonant — use a low stone
			play_stone_chime("basalt", -8.0)

# === Solfeggio Tones ===

func play_solfeggio(muse_name: String) -> void:
	var key = "solfeggio_" + muse_name
	if system_tone_cache.has(key):
		for player in sfx_players:
			if not player.playing:
				player.stream = system_tone_cache[key]
				player.bus = BUS_SFX
				player.volume_db = -5.0
				player.play()
				return

# === Haptic Feedback ===

func _trigger_haptic(pattern: Dictionary) -> void:
	# Steam API haptic integration (placeholder — requires GodotSteam)
	# On mobile: Input.vibrate_device()
	# On Steam: Steam.get_haptic_feedback()
	# For now, log the pattern
	var on_ms = pattern.get("on", 200)
	var off_ms = pattern.get("off", 400)
	
	# Basic mobile vibration (if available)
	if OS.has_feature("mobile"):
		Input.vibrate_device(on_ms)
	
	# TODO: Steam controller haptics when GodotSteam is integrated
	# Steam.trigger_haptic_pulse(0, on_ms * 1000)  # microseconds

# === Volume Control ===

func set_bus_volume(bus_name: String, volume_db: float) -> void:
	var bus_idx = AudioServer.get_bus_index(bus_name)
	if bus_idx >= 0:
		AudioServer.set_bus_volume_db(bus_idx, volume_db)

func get_bus_volume(bus_name: String) -> float:
	var bus_idx = AudioServer.get_bus_index(bus_name)
	if bus_idx >= 0:
		return AudioServer.get_bus_volume_db(bus_idx)
	return 0.0

func mute_bus(bus_name: String, muted: bool) -> void:
	var bus_idx = AudioServer.get_bus_index(bus_name)
	if bus_idx >= 0:
		AudioServer.set_bus_mute(bus_idx, muted)

# === Save/Load Audio Settings ===

func save_settings() -> Dictionary:
	return {
		"master_volume": get_bus_volume(BUS_MASTER),
		"song_volume": get_bus_volume(BUS_SONG),
		"zone_volume": get_bus_volume(BUS_ZONE),
		"stones_volume": get_bus_volume(BUS_STONES),
		"voice_volume": get_bus_volume(BUS_VOICE),
		"music_volume": get_bus_volume(BUS_MUSIC),
		"sfx_volume": get_bus_volume(BUS_SFX),
		"current_mode": current_mode,
	}

func load_settings(settings: Dictionary) -> void:
	set_bus_volume(BUS_MASTER, settings.get("master_volume", 0.0))
	set_bus_volume(BUS_SONG, settings.get("song_volume", -3.0))
	set_bus_volume(BUS_ZONE, settings.get("zone_volume", -6.0))
	set_bus_volume(BUS_STONES, settings.get("stones_volume", -8.0))
	set_bus_volume(BUS_VOICE, settings.get("voice_volume", -4.0))
	set_bus_volume(BUS_MUSIC, settings.get("music_volume", -5.0))
	set_bus_volume(BUS_SFX, settings.get("sfx_volume", -10.0))
	
	var mode = settings.get("current_mode", AudioMode.LIVING)
	set_mode(mode)
