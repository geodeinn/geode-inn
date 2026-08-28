extends Node2D
## ============================================================
## The Mohs Vibration — Geode Inn Phase 1 Arcade Game
## Godot 4.x
## ============================================================
## A sound-based mineral identification game.
## You are in a dark cave. You cannot see — you hear and feel.
## Each stone plays its chord (density frequency + hardness frequency).
## Identify the stone by its vibration alone.

# ----- SIGNALS -----
signal stone_identified(stone_name: String, correct: bool)
signal score_changed(new_score: int)
signal master_achieved

# ----- EXPORTS -----
@export var stone_database_path: String = "res://data/vibration_index.json"
@export var base_song_freq: float = 42.0  # The 42Hz Song
@export var tone_duration: float = 2.5
@export var max_choices: int = 4

# ----- STATE -----
enum GameState { MENU, PLAYING, REVEAL, RESULTS }
enum GameMode { BLIND_CAVE, HARMONIC_PAIRS, COMPOSER, TUNING_FORK }

var current_state: GameState = GameState.MENU
var current_mode: GameMode = GameMode.BLIND_CAVE
var stone_data: Array = []
var current_stone: Dictionary = {}
var score: int = 0
var streak: int = 0
var master_count: int = 0
var round_number: int = 0

# ----- AUDIO -----
var audio_player: AudioStreamPlayer
var base_song_player: AudioStreamPlayer
var sample_rate: int = 44100

# ----- UI REFERENCES (set in scene) -----
@onready var stone_label: Label
@onready var info_label: Label
@onready var score_label: Label
@onready var streak_label: Label
@onready var play_button: Button
@onready var choice_container: VBoxContainer

# ============================================================
# LIFECYCLE
# ============================================================

func _ready() -> void:
	load_stone_data()
	setup_audio()
	start_round()

func _process(_delta: float) -> void:
	# The 42Hz Song is always present in the cave
	pass

# ============================================================
# DATA LOADING
# ============================================================

func load_stone_data() -> void:
	if not FileAccess.file_exists(stone_database_path):
		push_warning("Vibration index not found at " + stone_database_path)
		stone_data = get_fallback_data()
		return
	
	var file = FileAccess.open(stone_database_path, FileAccess.READ)
	var json_text = file.get_as_text()
	file.close()
	
	var json = JSON.new()
	var error = json.parse(json_text)
	if error == OK:
		stone_data = json.data
		print("Loaded " + str(stone_data.size()) + " stones")
	else:
		push_warning("Failed to parse vibration index: " + json.get_error_message())
		stone_data = get_fallback_data()

func get_fallback_data() -> Array:
	# Minimal fallback if no JSON file
	return [
		{"stone": "Diamond", "specific_gravity": 3.52, "mohs_hardness": 10, "frequency_hz": 153.0, "iem_driver": "dynamic_driver"},
		{"stone": "Clear Quartz", "specific_gravity": 2.65, "mohs_hardness": 7, "frequency_hz": 637.0, "iem_driver": "balanced_armature"},
		{"stone": "Gold", "specific_gravity": 19.30, "mohs_hardness": 2.5, "frequency_hz": 27.8, "iem_driver": "bone_conduction"},
		{"stone": "Amber", "specific_gravity": 1.08, "mohs_hardness": 2.5, "frequency_hz": 7520.0, "iem_driver": "electrostatic"},
	]

# ============================================================
# AUDIO
# ============================================================

func setup_audio() -> void:
	audio_player = AudioStreamPlayer.new()
	audio_player.stream = AudioStreamGenerator.new()
	audio_player.stream.mix_rate = sample_rate
	audio_player.stream.buffer_length = 3.0
	add_child(audio_player)
	
	base_song_player = AudioStreamPlayer.new()
	base_song_player.stream = AudioStreamGenerator.new()
	base_song_player.stream.mix_rate = sample_rate
	base_song_player.stream.buffer_length = 3.0
	add_child(base_song_player)

func play_stone_tone(freq: float, duration_ms: int = 2500) -> void:
	## Generate a WAV-like tone at the stone's frequency
	## With harmonics for warmth and an envelope for natural feel
	var num_samples: int = int(sample_rate * duration_ms / 1000.0)
	var fade_in: int = int(num_samples * 0.20)
	var fade_out: int = int(num_samples * 0.30)
	
	var stream = AudioStreamGenerator.new()
	stream.mix_rate = sample_rate
	stream.buffer_length = float(duration_ms) / 1000.0 + 0.1
	
	audio_player.stream = stream
	audio_player.play()
	
	# Fill the buffer
	var playback = audio_player.get_stream_playback()
	var frames = playback.get_frames_available()
	
	for i in range(min(frames, num_samples)):
		var t = float(i) / float(sample_rate)
		# Fundamental + harmonics
		var sample = sin(2.0 * PI * freq * t)
		sample += 0.15 * sin(2.0 * PI * freq * 2.0 * t)
		sample += 0.05 * sin(2.0 * PI * freq * 3.0 * t)
		
		# Envelope (smooth ease-in-out)
		var env: float = 1.0
		if i < fade_in:
			env = float(i) / float(fade_in)
			env = env * env * (3.0 - 2.0 * env)
		elif i > num_samples - fade_out:
			env = float(num_samples - i) / float(fade_out)
			env = env * env * (3.0 - 2.0 * env)
		
		sample *= 0.3 * env
		playback.push_frame(Vector2(sample, sample))
	
	# Haptic feedback (if on mobile device)
	if OS.has_feature("mobile"):
		var pulse_interval = max(40, int(60000.0 / max(freq, 1.0)))
		Input.vibrate_handheld(pulse_interval)

func play_42hz_song() -> void:
	## The 42Hz Song — always present underneath
	var stream = AudioStreamGenerator.new()
	stream.mix_rate = sample_rate
	stream.buffer_length = 5.0
	base_song_player.stream = stream
	base_song_player.play()
	
	var playback = base_song_player.get_stream_playback()
	var frames = playback.get_frames_available()
	
	for i in range(frames):
		var t = float(i) / float(sample_rate)
		var sample = sin(2.0 * PI * base_song_freq * t) * 0.04
		playback.push_frame(Vector2(sample, sample))

# ============================================================
# GAME LOGIC — BLIND CAVE MODE
# ============================================================

func start_round() -> void:
	current_state = GameState.PLAYING
	round_number += 1
	
	# Pick a random stone (Mohs >= 2.5 for meaningful play)
	var pool = stone_data.filter(func(s): return s.get("mohs_hardness", 0) >= 2.5)
	current_stone = pool[randi() % pool.size()]
	
	if stone_label:
		stone_label.text = "??? Unknown Stone ???"
	if info_label:
		info_label.text = ""
	
	# Generate choices
	generate_choices()

func generate_choices() -> void:
	var correct_name = current_stone.get("stone", "Unknown")
	var family = current_stone.get("mineralFamily", "Unknown")
	
	# Get decoys: 2 from same family + 1 different
	var same_family = stone_data.filter(func(s):
		return s.get("mineralFamily") == family and s.get("stone") != correct_name)
	var different = stone_data.filter(func(s):
		return s.get("mineralFamily") != family)
	
	same_family.shuffle()
	different.shuffle()
	
	var decoys: Array = []
	for i in range(min(2, same_family.size())):
		decoys.append(same_family[i])
	while decoys.size() < 3 and different.size() > decoys.size() - 2:
		deys.append(different[decoys.size() - 2])
	
	var choices = [current_stone] + decoys.slice(0, 3)
	choices.shuffle()
	
	# Build choice buttons (handled by scene)
	# This would populate the UI in the actual scene
	pass

func on_play_pressed() -> void:
	## Play the mystery stone's vibration
	var freq = current_stone.get("frequency_hz", 440.0)
	play_stone_tone(freq, int(tone_duration * 1000))

func on_choice_selected(selected_name: String) -> void:
	var correct_name = current_stone.get("stone", "Unknown")
	var is_correct = selected_name == correct_name
	
	if is_correct:
		score += 10 + streak * 2
		streak += 1
		master_count = min(10, master_count + 1)
		stone_identified.emit(correct_name, true)
		
		if master_count >= 10:
			master_achieved.emit()
	else:
		streak = 0
		stone_identified.emit(correct_name, false)
	
	score_changed.emit(score)
	
	# Reveal
	current_state = GameState.REVEAL
	if stone_label:
		stone_label.text = correct_name
	if info_label:
		var family = current_stone.get("mineralFamily", "?")
		var sg = current_stone.get("specific_gravity", 0)
		var mohs = current_stone.get("mohs_hardness", 0)
		var freq = current_stone.get("frequency_hz", 0)
		info_label.text = "%s family · SG %.2f · Mohs %.1f · %.1f Hz" % [family, sg, mohs, freq]

func next_round() -> void:
	start_round()

# ============================================================
# HARMONIC PAIRS MODE
# ============================================================

func check_harmonic_pair(freq_a: float, freq_b: float) -> Dictionary:
	var ratio = max(freq_a, freq_b) / min(freq_a, freq_b)
	var intervals = {
		"Octave": 2.0,
		"Perfect Fifth": 1.5,
		"Perfect Fourth": 1.333,
		"Major Third": 1.25,
		"Minor Third": 1.2,
	}
	
	var tolerance = 0.07
	for name in intervals:
		if abs(ratio - intervals[name]) < tolerance:
			return {"harmonic": true, "interval": name, "ratio": ratio}
	
	return {"harmonic": false, "ratio": ratio}

# ============================================================
# COMPOSER MODE
# ============================================================

func calculate_harmony(stones: Array) -> float:
	if stones.size() < 2:
		return 0.0
	
	var total: float = 0.0
	for i in range(stones.size() - 1):
		var f1 = stones[i].get("frequency_hz", 440.0)
		var f2 = stones[i + 1].get("frequency_hz", 440.0)
		var ratio = max(f1, f2) / min(f1, f2)
		
		var intervals = [2.0, 1.5, 1.333, 1.25, 1.2]
		var best_dist = 999.0
		for target in intervals:
			best_dist = min(best_dist, abs(ratio - target))
		
		total += max(0.0, 1.0 - best_dist * 3.0)
	
	return (total / float(stones.size() - 1)) * 100.0

func play_composition(stones: Array) -> void:
	var stone_duration_ms: int = 1500
	for i in range(stones.size()):
		var freq = stones[i].get("frequency_hz", 440.0)
		# Schedule each stone
		await get_tree().create_timer(float(i * stone_duration_ms) / 1000.0 - float(i * 300) / 1000.0).timeout
		play_stone_tone(freq, stone_duration_ms)
	
	# If harmony is high, play all together as a final chord
	if stones.size() > 1:
		var harmony = calculate_harmony(stones) / 100.0
		if harmony > 0.6:
			await get_tree().create_timer(0.5).timeout
			for stone in stones:
				var freq = stone.get("frequency_hz", 440.0)
				play_stone_tone(freq, 3000)

# ============================================================
# SCORING
# ============================================================

func get_iem_driver_info(freq: float) -> Dictionary:
	if freq < 80.0:
		return {
			"type": "bone_conduction",
			"name": "Bone Conduction",
			"sensation": "You feel this stone in your body before you hear it.",
			"inn_layer": "Catacombs — the deep knowing"
		}
	elif freq < 250.0:
		return {
			"type": "dynamic_driver",
			"name": "Dynamic Driver",
			"sensation": "A warm tone you both hear and feel.",
			"inn_layer": "Matter — the stones you hold"
		}
	elif freq < 2000.0:
		return {
			"type": "balanced_armature",
			"name": "Balanced Armature",
			"sensation": "A clear, precise tone — like a voice in a quiet room.",
			"inn_layer": "Characters — the presences you meet"
		}
	else:
		return {
			"type": "electrostatic",
			"name": "Electrostatic",
			"sensation": "A high, thin presence at the edge of perception.",
			"inn_layer": "Cosmology — the starlight you reach for"
		}

# ============================================================
# BASE44 API INTEGRATION
# ============================================================

## When a stone is correctly identified, sync to the Base44 backend
func sync_to_backend(stone_name: String, player_id: String) -> void:
	## This would POST to the Base44 API to update PlayerProgress
	## POST https://base44.app/api/apps/{APP_ID}/entities/PlayerProgress
	## { playerId, stonesCollected: [stone_name] }
	pass
