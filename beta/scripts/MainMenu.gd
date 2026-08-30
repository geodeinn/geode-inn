extends Control
## MainMenu.gd
## Entry point for the Geode Inn beta. New game or continue.

func _ready() -> void:
	$VBox/Continue.disabled = not SaveManager.has_save()
	$VBox/NewGame.pressed.connect(_on_new_game)
	$VBox/Continue.pressed.connect(_on_continue)
	$VBox/Settings.pressed.connect(_on_settings)
	$VBox/Quit.pressed.connect(_on_quit)

func _on_new_game() -> void:
	SaveManager.new_game("Traveler")
	# Play entry cutscene, then go to Common Room
	CutscenePlayer.play_cutscene("entry_sequence")
	get_tree().change_scene_to_file("res://scenes/CommonRoom.tscn")

func _on_continue() -> void:
	if SaveManager.load_game():
		get_tree().change_scene_to_file("res://scenes/CommonRoom.tscn")

func _on_settings() -> void:
	# Settings panel — music volume, sfx volume, text speed, subtitles
	pass

func _on_quit() -> void:
	get_tree().quit()
