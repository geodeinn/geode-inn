extends Node2D
## CommonRoomHub.gd
## The central hub of the Geode Inn. Player navigates by clicking exits.
## NPCs are present and interactive. The 42Hz hum plays softly.

# Exit destinations
const EXITS := {
	"garden": {"scene": "res://scenes/Garden.tscn", "label": "The Garden", "requires": ""},
	"meadery": {"scene": "res://scenes/Meadery.tscn", "label": "The Meadery", "requires": ""},
	"archive": {"scene": "res://scenes/Archive.tscn", "label": "The Archive", "requires": ""},
	"staircase_up": {"scene": "res://scenes/Cosmology.tscn", "label": "Up the Staircase", "requires": ""},
	"catacombs_down": {"scene": "res://scenes/Catacombs.tscn", "label": "Down to the Catacombs", "requires": "standing_stones"},
	"exterior": {"scene": "res://scenes/Exterior.tscn", "label": "Step Outside", "requires": ""},
	"world_map": {"scene": "res://scenes/WorldMap.tscn", "label": "The World Map", "requires": "standing_stones"},
}

# NPCs present in Common Room
const NPCS := [
	{"name": "Bethany", "position": Vector2(400, 600), "role": "Tavern Manager"},
	{"name": "Joe", "position": Vector2(800, 550), "role": "Fire and dragons"},
	{"name": "Beverley", "position": Vector2(1200, 400), "role": "Librarian"},
	{"name": "Brindle", "position": Vector2(600, 700), "role": "Brownie"},
	{"name": "Tumble", "position": Vector2(500, 500), "role": "The fizgig"},
	{"name": "The Reader", "position": Vector2(300, 300), "role": "Window seat. One line per visit."},
]

# Exit button positions (on the hub screen)
const EXIT_POSITIONS := {
	"garden": Vector2(1600, 900),
	"meadery": Vector2(1750, 500),
	"archive": Vector2(1500, 300),
	"staircase_up": Vector2(960, 100),
	"catacombs_down": Vector2(960, 1000),
	"exterior": Vector2(200, 900),
	"world_map": Vector2(960, 500),
}

signal exit_triggered(exit_name: String)
signal npc_clicked(npc_name: String)

func _ready() -> void:
	SaveManager.visit_zone("common_room")
	# Play 42Hz ambient hum
	# Display Common Room background art
	# Position NPC sprites at their locations
	# Create exit buttons at their positions
	_setup_exits()
	_setup_npcs()

func _setup_exits() -> void:
	for exit_key in EXITS:
		var exit := EXITS[exit_key]
		var pos := EXIT_POSITIONS.get(exit_key, Vector2(960, 540))
		
		# Check if unlocked
		var requires := exit.get("requires", "")
		if requires != "" and not SaveManager.get_flag("games_completed").has(requires):
			continue  # Don't show locked exits (or show them locked)
		
		# Create button
		var btn := Button.new()
		btn.text = exit.get("label", exit_key)
		btn.position = pos - Vector2(100, 20)
		btn.size = Vector2(200, 40)
		btn.pressed.connect(_on_exit_pressed.bind(exit_key))
		add_child(btn)

func _setup_npcs() -> void:
	for npc in NPCS:
		# Create clickable NPC sprite area
		var area := Area2D.new()
		area.position = npc.position
		area.name = npc.name
		
		var collision := CollisionShape2D.new()
		var rect := RectangleShape2D.new()
		rect.size = Vector2(120, 200)
		collision.shape = rect
		area.add_child(collision)
		
		area.input_event.connect(_on_npc_input.bind(npc.name))
		add_child(area)

func _on_exit_pressed(exit_key: String) -> void:
	var exit := EXITS.get(exit_key, {})
	if exit.is_empty():
		return
	
	FizgigLoader.load_zone(exit_key)
	exit_triggered.emit(exit_key)
	# Transition to scene
	# get_tree().change_scene_to_file(exit.scene)

func _on_npc_input(_viewport, event, _shape, npc_name: String) -> void:
	if event is InputEventMouseButton and event.pressed:
		npc_clicked.emit(npc_name)
		DialogueManager.start_dialogue(npc_name)

## The Reader's line changes each visit based on game progress
func get_reader_line() -> String:
	var visited := SaveManager.get_flag("visited_zones") as Array
	var games := SaveManager.get_flag("games_completed") as Array
	var whisper := SaveManager.get_flag("whisper_layer_aware") as bool
	
	if not whisper and games.size() == 0:
		return "They came in from the cold."
	elif not whisper:
		return "The stones were singing. Did you hear them?"
	elif SaveManager.get_flag("shadow_inn_entered"):
		return "The Shadow knows what the Light forgets."
	elif SaveManager.get_flag("hollow_men_completed"):
		return "Between the idea and the reality, something survived."
	elif SaveManager.get_flag("final_room_reached"):
		return "They sat by the fire. The builder was there. They were home."
	else:
		return "The pages turn themselves now."
