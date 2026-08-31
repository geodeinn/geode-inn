extends Node2D
## HollowMen.gd
## The deepest point of the Inn. T.S. Eliot's poem as environment.
## 5 sections. No combat. No puzzles. Walking. Witnessing.
## Art: Anselm Kiefer × Royo. Straw, ash, lead, burned materials.
## No fizgigs. Silence. The only loading screen without them.
##
## Audio: 84Hz Shadow mode throughout. The silence IS the audio.
## At level 5, 42Hz and 84Hz cancel into true silence — the first silence in the game.

const LEVELS := [
	{
		"title": "We are the hollow men",
		"subtitle": "We are the stuffed men",
		"poem_excerpt": "Leaning together / Headpiece filled with straw. Alas!",
		"environment": "Straw figures against mine walls. Dim amber light. The air is still.",
		"mechanic": "Walk forward. The straw figures watch as you pass.",
		"art_prompt": "Anselm Kiefer × Royo. Underground mine tunnel. Straw-stuffed figures slumped against rough stone walls. Amber torchlight. Ash and dust in the air. Heavy. Still. Hyper-detailed patterns, flowing lines suggesting decay.",
	},
	{
		"title": "In death's dream kingdom",
		"subtitle": "The eyes are not here / There are no eyes here",
		"poem_excerpt": "This broken jaw of our lost kingdoms / Is but a hollow valley",
		"environment": "Shadow detaches from the player, walks ahead, outpaces them, vanishes.",
		"mechanic": "Your shadow separates and walks ahead. Follow it. It knows the way. It doesn't wait.",
		"art_prompt": "Kiefer × Royo. Darker tunnel. A shadow silhouette walks ahead of the viewer, cast on the wall. The shadow moves independently. No eyes anywhere. Lead-gray palette with faint amber cracks. Flowing lines suggesting absence.",
	},
	{
		"title": "This is the dead land",
		"subtitle": "This is the cactus land",
		"poem_excerpt": "Here the stone images / Are raised, here they receive / The supplication of a dead man's hand",
		"environment": "Barren underground. Stone figures. Cactus-like growths made of mineral, not plant.",
		"mechanic": "Walk among the stone figures. They reach toward you. They are not reaching for you. They are reaching for what you carry.",
		"art_prompt": "Kiefer × Royo. Underground wasteland. Stone figures with arms raised. Cactus-like mineral growths. Burned earth tones. Straw scattered on ground. Hyper-detailed texture on stone, flowing lines suggesting supplication.",
	},
	{
		"title": "The eyes are not here",
		"subtitle": "Except in the multi-coloured / Rose of the dying day",
		"poem_excerpt": "Sightless, unless / The eyes reappear / As the perpetual star",
		"environment": "Near-zero visibility. Sound-based navigation. The only light is a single point of light far ahead.",
		"mechanic": "Navigate by sound. Each step echoes. Walls echo back differently. Follow the echo that doesn't echo back — that's the path forward.",
		"art_prompt": "Kiefer × Royo. Near-black underground. A single point of light far ahead. The viewer's own footsteps create ripples of sound visualized as faint rings. Otherwise darkness. Fragmented linework — the only zone using fragmented style.",
	},
	{
		"title": "Between the idea and the reality",
		"subtitle": "Falls the Shadow",
		"poem_excerpt": "This is the way the world ends / Not with a bang but a whimper",
		"environment": "The Whisper Layer's origin. A chamber where the 42Hz and 84Hz frequencies meet and cancel each other. Silence. True silence. The first silence in the entire game.",
		"mechanic": "Walk to the center. The silence grows. When you arrive, the Whisper Layer speaks directly to you for the first time. Not narration. Not the Reader. The Inn itself. One line: 'I have been watching you the whole time. I wanted you to know that.' Then the endgame choice appears.",
		"art_prompt": "Kiefer × Royo. A circular chamber deep underground. Two frequencies visualized as converging waves — one warm amber (42Hz), one cold blue (84Hz) — meeting at a single point and canceling into white light. The white light is where the player stands. Absolute stillness. Hyper-detailed, flowing lines suggesting the merging of two forces into one.",
	},
]

signal level_completed(level_index: int)
signal hollow_men_finished()
signal whisper_layer_spoke(line: String)

var _current_level := 0
var _is_active := false
var _player_pos: float = 0.0  # Walking progress 0.0 → 1.0
var _level_end_threshold: float = 1.0

func _ready() -> void:
	# No fizgig loading screen. Pure silence. This is deliberate.
	# The absence is the point.
	pass

func start_hollow_men() -> void:
	_current_level = 0
	_is_active = true
	_player_pos = 0.0
	
	# Audio: switch to Shadow mode (84Hz)
	if AudioManager:
		AudioManager.set_mode(AudioManager.AudioMode.SHADOW)
		AudioManager.play_zone_ambient("undercity")
	
	# Steam rich presence
	if SteamManager:
		SteamManager.set_rich_presence("In the Hollow Men mines", "Descending")
	
	print("[HollowMen] Started — Shadow mode active")

func _load_level(index: int) -> void:
	if index >= LEVELS.size():
		_finish()
		return
	
	_current_level = index
	_player_pos = 0.0
	var level = LEVELS[index]
	
	print("[HollowMen] Level %d: %s" % [index + 1, level.title])
	
	# Audio per level
	if AudioManager:
		match index:
			0:
				# Level 1: Dim amber — low drone
				AudioManager.play_zone_ambient("undercity")
			1:
				# Level 2: Shadow separates — subtle shift
				AudioManager.play_solfeggio("thalia")  # 84Hz reinforcement
			2:
				# Level 3: Stone figures — deeper drone
				AudioManager.play_stone_chime("obsidian", -15.0)
			3:
				# Level 4: Sound-based navigation — echoes
				AudioManager.play_stone_chime("jet", -20.0)
				# In implementation: each footstep plays a faint echo
			4:
				# Level 5: TRUE SILENCE — the first silence in the game
				# 42Hz and 84Hz cancel each other
				AudioManager.set_mode(AudioManager.AudioMode.IN_BETWEEN)
				# Fade all audio to near-zero
				AudioManager.fade_all_buses(-60.0, 3.0)  # 3-second fade to silence
				print("[HollowMen] Level 5: True silence begins. The first silence in the game.")
	
	# In actual implementation:
	# 1. Fade to black
	# 2. Show level title + poem excerpt (5 seconds)
	# 3. Fade in level art
	# 4. Player walks forward (right arrow / D key)
	# 5. Environmental events trigger as player progresses
	# 6. At end of level, fade to black, load next

func _process(delta: float) -> void:
	if not _is_active:
		return
	
	# Player walks forward
	if Input.is_action_pressed("move_right"):
		_player_pos += delta * 0.1  # Slow walk
	
	# Level 4: footstep echoes
	if _current_level == 3 and AudioManager:
		if Input.is_action_just_pressed("move_right"):
			AudioManager.play_ui_sound("button_click")
	
	# Check level end
	if _player_pos >= _level_end_threshold:
		_on_level_end()

func _on_level_end() -> void:
	level_completed.emit(_current_level)
	
	# Audio: level transition
	if AudioManager and _current_level < 4:
		AudioManager.play_ui_sound("portal")
	
	_load_level(_current_level + 1)

func _finish() -> void:
	_is_active = false
	
	if SaveManager:
		SaveManager.set_flag("hollow_men_completed", true)
	
	# Audio: the Whisper Layer speaks — in TRUE SILENCE
	# The only sound in the entire sequence is this voice
	if AudioManager:
		# Unmute just the voice bus
		AudioManager.set_bus_volume("Voice", 0.0)
		AudioManager.play_stone_chime("clear_quartz", -5.0)  # A single clear tone
	
	# The Whisper Layer speaks
	whisper_layer_spoke.emit("I have been watching you the whole time. I wanted you to know that.")
	
	print("[HollowMen] The Whisper Layer speaks. The Inn itself. One line in the silence.")
	
	# Steam achievement
	if SteamManager:
		SteamManager.unlock_achievement("hollow_men_complete")
		SteamManager.set_rich_presence("Witnessed the Whisper Layer", "Endgame choice")
	
	# Present endgame choice
	hollow_men_finished.emit()

## Generate the art prompt script for a Hollow Men level
func get_level_art_prompt(index: int) -> String:
	if index < LEVELS.size():
		return LEVELS[index].art_prompt
	return ""

## Generate the poem text overlay for a level
func get_level_poem(index: int) -> Dictionary:
	if index < LEVELS.size():
		var level = LEVELS[index]
		return {
			"title": level.title,
			"subtitle": level.subtitle,
			"poem": level.poem_excerpt,
			"environment": level.environment,
		}
	return {}

## Get the endgame choice data
func get_endgame_choices() -> Array:
	return [
		{"id": "stay", "text": "Stay. The Inn is home.", "frequency": 42, "description": "Remain in the Inn. The 42Hz Song continues. You become part of the archive."},
		{"id": "leave", "text": "Leave. The world needs witnesses.", "frequency": 111, "description": "Return to the surface. Carry the Inn's knowledge outward. The Gargoyle's vigil."},
		{"id": "hide", "text": "Hide. Some knowledge waits for the right time.", "frequency": 84, "description": "Enter the Shadow Inn. The 84Hz keeps you still. You wait, patient as stone."},
	]
