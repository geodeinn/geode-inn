extends Control
## CutsceneController.gd
## Plays pre-rendered cutscene video with timed subtitles.
## Attached to Cutscene.tscn. Receives cutscene ID from CutscenePlayer autoload.

signal cutscene_finished(next_scene: String)

var _cutscene_id: String = ""
var _subtitles: Array = []
var _subtitle_index: int = 0
var _elapsed: float = 0.0
var _video_player: VideoStreamPlayer
var _subtitle_label: RichTextLabel
var _fade_rect: ColorRect

func _ready() -> void:
	_video_player = $VideoPlayer
	_subtitle_label = $SubtitleLabel
	_fade_rect = $FadeRect
	
	$SkipButton.pressed.connect(_skip)

func play(cutscene_id: String) -> void:
	_cutscene_id = cutscene_id
	var scene_data := CutscenePlayer.CUTSCENES.get(cutscene_id, {})
	if scene_data.is_empty():
		push_error("CutsceneController: Unknown cutscene '" + cutscene_id + "'")
		return
	
	_subtitles = scene_data.get("subtitles", [])
	_subtitle_index = 0
	_elapsed = 0.0
	
	# Load and play video
	var file_path := scene_data.get("file", "")
	if file_path != "" and ResourceLoader.exists(file_path):
		var stream := load(file_path) as VideoStream
		if stream:
			_video_player.stream = stream
			_video_player.play()
	
	# Fade in
	_fade_rect.color = Color(0, 0, 0, 1)
	var tween := create_tween()
	tween.tween_property(_fade_rect, "color", Color(0, 0, 0, 0), 1.0)

func _process(delta: float) -> void:
	if _cutscene_id == "":
		return
	
	_elapsed += delta
	
	# Update subtitles based on timing
	while _subtitle_index < _subtitles.size():
		var sub := _subtitles[_subtitle_index]
		if _elapsed >= sub.get("time", 0.0):
			_subtitle_label.text = sub.get("text", "")
			_subtitle_index += 1
		else:
			break
	
	# Check if video finished (or no video — use subtitle timing)
	if not _video_player.is_playing() and _subtitle_index >= _subtitles.size():
		_finish()

func _finish() -> void:
	var scene_data := CutscenePlayer.CUTSCENES.get(_cutscene_id, {})
	var next := scene_data.get("next", "")
	
	# Fade out
	var tween := create_tween()
	tween.tween_property(_fade_rect, "color", Color(0, 0, 0, 1), 1.0)
	tween.tween_callback(func():
		SaveManager.set_dialogue_flag("seen_" + _cutscene_id)
		cutscene_finished.emit(next)
		_cutscene_id = ""
	)

func _skip() -> void:
	_finish()
