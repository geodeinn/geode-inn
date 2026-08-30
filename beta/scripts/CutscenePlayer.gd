extends Node
## CutscenePlayer.gd (Autoload Singleton)
## Plays pre-rendered animated cutscenes from prompt-coded animation pipeline.
## Cutscenes are video files (Theora .ogv or .webm) loaded from assets/cutscenes/.

signal cutscene_started(cutscene_id: String)
signal cutscene_finished(cutscene_id: String)
signal subtitle_shown(text: String)

var _video_player: VideoStreamPlayer
var _subtitle_label: RichTextLabel
var _is_playing: bool = false

# Cutscene registry — maps IDs to file paths and subtitle data
const CUTSCENES := {
	"entry_sequence": {
		"file": "res://assets/cutscenes/entry_sequence.ogv",
		"subtitles": [
			{"time": 0.0, "text": "The road was long."},
			{"time": 3.0, "text": "The door was open."},
			{"time": 6.0, "text": "They came in from the cold."},
			{"time": 9.0, "text": "— The Reader"},
		],
		"next": "common_room"
	},
	"world_map_intro": {
		"file": "res://assets/cutscenes/world_map_intro.ogv",
		"subtitles": [
			{"time": 0.0, "text": "The map was old. The pins were stone."},
			{"time": 4.0, "text": "Each one sang at a different frequency."},
			{"time": 8.0, "text": "Touch one. See where the song leads."},
		],
		"next": "world_map"
	},
	"cinema_1": {
		"file": "res://assets/cutscenes/cinema_1.ogv",
		"subtitles": [
			{"time": 0.0, "text": "The door wasn't here before."},
			{"time": 4.0, "text": "The screen flickered on."},
			{"time": 8.0, "text": "Someone was watching."},
			{"time": 12.0, "text": "The someone was you."},
		],
		"next": "cinema_2"
	},
	"cinema_5_mirror": {
		"file": "res://assets/cutscenes/cinema_5.ogv",
		"subtitles": [
			{"time": 0.0, "text": "The mirror showed the Inn."},
			{"time": 4.0, "text": "The Inn showed you."},
			{"time": 8.0, "text": "You were the same thing."},
			{"time": 12.0, "text": "Now you know."},
		],
		"next": "shadow_inn_entry"
	},
	"shadow_inn_entry": {
		"file": "res://assets/cutscenes/shadow_inn.ogv",
		"subtitles": [
			{"time": 0.0, "text": "The frequency dropped."},
			{"time": 3.0, "text": "84Hz. The inverse of growth."},
			{"time": 7.0, "text": "The brownies knew."},
			{"time": 11.0, "text": "Their innocence was ignorance. Not purity."},
		],
		"next": "hollow_men_entry"
	},
	"final_room": {
		"file": "res://assets/cutscenes/final_room.ogv",
		"subtitles": [
			{"time": 0.0, "text": "The room was behind the Inn."},
			{"time": 4.0, "text": "Empty. Fire. Chair. Cup. Book."},
			{"time": 10.0, "text": "They sat by the fire."},
			{"time": 14.0, "text": "The builder was there."},
			{"time": 18.0, "text": "They were home."},
			{"time": 22.0, "text": "— The Reader"},
		],
		"next": "credits"
	},
	"credits": {
		"file": "res://assets/cutscenes/credits.ogv",
		"subtitles": [
			{"time": 0.0, "text": "The Inn continues."},
		],
		"next": "main_menu"
	},
}

func play_cutscene(cutscene_id: String) -> void:
	var scene := CUTSCENES.get(cutscene_id, {})
	if scene.is_empty():
		push_error("CutscenePlayer: Unknown cutscene '" + cutscene_id + "'")
		return
	
	_is_playing = true
	cutscene_started.emit(cutscene_id)
	
	# In actual implementation:
	# 1. Create VideoStreamPlayer, load the file
	# 2. Play subtitles on timer
	# 3. Wait for video to finish (or player skip)
	# 4. Emit cutscene_finished with the 'next' target
	
	# Placeholder: mark cutscene as seen and emit finished
	SaveManager.set_dialogue_flag("seen_" + cutscene_id)
	_is_playing = false
	cutscene_finished.emit(cutscene_id)

func has_seen(cutscene_id: String) -> bool:
	return SaveManager.has_dialogue_flag("seen_" + cutscene_id)

func skip_cutscene() -> void:
	if _is_playing:
		_is_playing = false
