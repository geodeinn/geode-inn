extends Control

var final_score: int = 0
var stones_count: int = 0
var furthest_zone: String = "Main Floor"

func _ready() -> void:
	$VBoxContainer/ScoreLabel.text = "Score: " + str(final_score)
	$VBoxContainer/StonesLabel.text = "Stones Collected: " + str(stones_count)
	$VBoxContainer/ZoneLabel.text = "Furthest Zone: " + furthest_zone
	
	$VBoxContainer/RetryButton.pressed.connect(_on_retry)
	$VBoxContainer/MenuButton.pressed.connect(_on_menu)

func _on_retry() -> void:
	get_tree().change_scene_to_file("res://scenes/TumbleRun.tscn")

func _on_menu() -> void:
	get_tree().change_scene_to_file("res://scenes/MainHub.tscn")
