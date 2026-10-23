extends Node
## Moves the player between zones with a short fade, and remembers where to
## spawn and which faire to build.

const ZONES := {
	"main_menu": "res://scenes/main_menu.tscn",
	"main_floor": "res://scenes/zones/main_floor.tscn",
	"campgrounds": "res://scenes/zones/campgrounds.tscn",
	"faire": "res://scenes/zones/faire.tscn",
	"final_room": "res://scenes/zones/final_room.tscn",
}

## Room names used by the audio engine's room_drivers / room_bpm.
const ROOM_NAMES := {
	"main_floor": "Main Floor",
	"campgrounds": "Campgrounds",
	"faire": "Faire",
	"final_room": "Main Floor",
	"main_menu": "Common Room",
}

var current_zone := "main_menu"
var spawn_point := ""
var faire_config: Dictionary = {}
## A line for the voice of the Inn to say once the next zone is up (the return visit).
var pending_voice := ""
var _fade: ColorRect
var _layer: CanvasLayer


func _ready() -> void:
	_layer = CanvasLayer.new()
	_layer.layer = 100
	add_child(_layer)
	_fade = ColorRect.new()
	_fade.color = Color(0.03, 0.02, 0.015, 0.0)
	_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_fade.set_anchors_preset(Control.PRESET_FULL_RECT)
	_layer.add_child(_fade)


## Release check: walks through every zone in the exported build, then quits.
## Run:  GeodeInn.exe -- --smoke-test
func run_smoke_test() -> void:
	# Never take keyboard focus from whoever is using the machine.
	get_window().unfocusable = true
	get_window().mouse_passthrough = true
	PlayerState.slot = "smoke"
	PlayerState.new_profile("Smoke")
	for zone in ["main_floor", "campgrounds", "faire", "final_room", "main_floor"]:
		goto(zone)
		await get_tree().create_timer(2.5).timeout
		var scene := get_tree().current_scene
		var ok := scene != null and scene.get("player") != null
		# The art made it into the build: dressed people and the kits' props, not stand-in shapes.
		var people := scene.find_children("*", "CharacterModel", true, false).size() if scene else 0
		var props := 0
		if scene:
			for n in scene.find_children("*", "Node3D", true, false):
				if not String(n.scene_file_path).is_empty() and String(n.scene_file_path).begins_with("res://assets/"):
					props += 1
		ok = ok and people >= 1 and (props >= 5 or zone == "final_room")
		print("[smoke] %s %s (%d people, %d models)" % [zone, "OK" if ok else "FAILED", people, props])
		if not ok:
			get_tree().quit(1)
			return
	print("[smoke] data files loaded: %d errors" % GameData.load_errors.size())
	print("[smoke] stones %d, quests %d, materials %d, tiers %d" % [GameData.stones.size(), GameData.quests.size(), GameData.materials.size(), GameData.tiers.size()])
	get_tree().quit(0 if GameData.load_errors.is_empty() else 1)


func goto(zone: String, spawn := "", faire: Dictionary = {}) -> void:
	if not ZONES.has(zone):
		push_error("unknown zone " + zone)
		return
	spawn_point = spawn
	if not faire.is_empty():
		faire_config = faire
	var tween := create_tween()
	tween.tween_property(_fade, "color:a", 1.0, 0.35)
	await tween.finished
	current_zone = zone
	AudioDirector.set_room(String(ROOM_NAMES.get(zone, "Main Floor")))
	AudioDirector.set_hum(false)
	get_tree().change_scene_to_file(ZONES[zone])
	await get_tree().process_frame
	await get_tree().process_frame
	var back := create_tween()
	back.tween_property(_fade, "color:a", 0.0, 0.45)
	if zone != "main_menu":
		PlayerState.save_profile()
