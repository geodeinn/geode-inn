# ZoneStub.gd — Placeholder for zones not yet built
# Displays zone name and returns to hub on ESC

extends Control

@export var zone_name: String = ""

func _ready() -> void:
	# Auto-detect zone name from scene file name if not set
	if zone_name == "":
		zone_name = get_tree().current_scene.scene_file_path.get_file().get_basename()
	GameManager.current_zone = zone_name
	print("[ZoneStub] Entered: %s" % zone_name)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/MainHub.tscn")
