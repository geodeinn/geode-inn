# GameOver.gd — Game Over screen for all arcade games
# Shows final score, stones collected, and furthest zone reached

extends Control

var final_score: int = 0
var stones_count: int = 0
var furthest_zone: String = "Main Floor"

func _ready() -> void:
	# Pull data from GameManager if available
	if get_node_or_null("/root/GameManager"):
		var gm = get_node("/root/GameManager")
		final_score = gm.total_score
		stones_count = gm.get_stone_count()
		furthest_zone = gm.current_zone
	
	$VBoxContainer/ScoreLabel.text = "Score: " + str(final_score)
	$VBoxContainer/StonesLabel.text = "Stones Collected: " + str(stones_count)
	$VBoxContainer/ZoneLabel.text = "Furthest Zone: " + furthest_zone
	
	$VBoxContainer/RetryButton.pressed.connect(_on_retry)
	$VBoxContainer/MenuButton.pressed.connect(_on_menu)

func _on_retry() -> void:
	get_tree().change_scene_to_file("res://scenes/TumbleRun.tscn")

func _on_menu() -> void:
	get_tree().change_scene_to_file("res://scenes/MainHub.tscn")
