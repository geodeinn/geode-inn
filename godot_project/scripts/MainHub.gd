# MainHub.gd — The Geode Inn Hub World
# Structure inspired by Ironforge: central forge (hearth) with named corridors to districts
# The Great Forge = the hearth fire at center of the Main Floor
# Corridors branch outward to: Arcade, Market, Archive, Common Room, Composer, Campgrounds
# Staircase descends to Catacombs -> Undercity, Fae Kingdom, Gorgon's Garden
# Cosmology ascends upward
# Player navigates with arrow keys/WASD, interacts with E, toggles frequency with ZR/Tab

extends Node2D

# === SIGNALS ===
signal zone_selected(zone_name: String)
signal game_selected(game_name: String)

# === NODES ===
@onready var bg_sprite: Sprite2D = $Background
@onready var player: CharacterBody2D = $Player
@onready var corridor_container: Node2D = $Corridors
@onready var hud: CanvasLayer = $HUD
@onready var zone_label: Label = $HUD/ZoneLabel
@onready var prompt_label: Label = $HUD/PromptLabel
@onready var frequency_label: Label = $HUD/FrequencyLabel

# === CORRIDOR DATA (Ironforge-style: visible doors/portals to named districts) ===
# Each corridor is a visible archway/door on the hub screen
const CORRIDOR_LAYOUT := [
	# name, position (x,y), target_scene, icon_type
	{"name": "Arcade", "pos": Vector2(140, 400), "scene": "res://scenes/Arcade.tscn", "icon": "gamepad"},
	{"name": "Market", "pos": Vector2(884, 400), "scene": "res://scenes/Market.tscn", "icon": "shop"},
	{"name": "Archive", "pos": Vector2(140, 150), "scene": "res://scenes/Archive.tscn", "icon": "book"},
	{"name": "Common Room", "pos": Vector2(884, 150), "scene": "res://scenes/CommonRoom.tscn", "icon": "fire"},
	{"name": "Composer", "pos": Vector2(512, 480), "scene": "res://scenes/Composer.tscn", "icon": "bead"},
	{"name": "Campgrounds", "pos": Vector2(512, 80), "scene": "res://scenes/Campgrounds.tscn", "icon": "tent"},
	{"name": "Staircase", "pos": Vector2(350, 300), "scene": "res://scenes/Staircase.tscn", "icon": "stairs"},
	{"name": "Cosmology", "pos": Vector2(674, 300), "scene": "res://scenes/Cosmology.tscn", "icon": "stars"},
	{"name": "Open World", "pos": Vector2(280, 480), "scene": "res://scenes/ZeldaWorld.tscn", "icon": "sword"},
	{"name": "Fae Kingdom", "pos": Vector2(744, 280), "scene": "res://scenes/FaeKingdom.tscn", "icon": "fae"},
]

# === STATE ===
var _nearby_corridor: String = ""
var _corridor_nodes: Dictionary = {}  # name -> Area2D
var _can_move: bool = true
const PLAYER_SPEED := 200.0
const INTERACT_RANGE := 60.0

func _ready() -> void:
	GameManager.current_zone = "Main Floor"
	_setup_corridors()
	_update_frequency_label()
	AudioManager.play_zone_music("res://assets/audio/main_floor.ogg")
	
	# Connect signals
	GameManager.frequency_changed.connect(_on_frequency_changed)
	
func _setup_corridors() -> void:
	for corridor in CORRIDOR_LAYOUT:
		var area := Area2D.new()
		area.name = corridor.name
		area.position = corridor.pos
		
		# Visual: archway sprite (placeholder colored rect for now)
		var visual := ColorRect.new()
		visual.color = Color(0.3, 0.25, 0.15, 0.8)  # Warm stone/gold
		visual.size = Vector2(80, 100)
		visual.position = Vector2(-40, -50)
		area.add_child(visual)
		
		# Label
		var label := Label.new()
		label.text = corridor.name
		label.position = Vector2(-40, -70)
		label.add_theme_color_override("font_color", Color(0.85, 0.72, 0.35))
		area.add_child(label)
		
		# Collision
		var col := CollisionShape2D.new()
		var shape := RectangleShape2D.new()
		shape.size = Vector2(80, 100)
		col.shape = shape
		area.add_child(col)
		
		corridor_container.add_child(area)
		_corridor_nodes[corridor.name] = area

func _process(_delta: float) -> void:
	if not _can_move:
		return
	
	# Player movement
	var input_vec := Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		input_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		input_vec.x += 1
	if Input.is_action_pressed("move_up"):
		input_vec.y -= 1
	if Input.is_action_pressed("move_down"):
		input_vec.y += 1
	
	input_vec = input_vec.normalized()
	player.velocity = input_vec * PLAYER_SPEED
	player.move_and_slide()
	
	# Check nearby corridors
	_check_nearby_corridors()

func _check_nearby_corridors() -> void:
	var found_corridor := ""
	for corridor in CORRIDOR_LAYOUT:
		var area: Area2D = _corridor_nodes[corridor.name]
		var dist := player.global_position.distance_to(area.global_position)
		if dist < INTERACT_RANGE:
			found_corridor = corridor.name
			break
	
	if found_corridor != _nearby_corridor:
		_nearby_corridor = found_corridor
		if found_corridor != "":
			prompt_label.text = "Press E to enter " + found_corridor
			prompt_label.visible = true
		else:
			prompt_label.visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and _nearby_corridor != "":
		_enter_corridor(_nearby_corridor)
	
	if event.is_action_pressed("frequency_toggle"):
		GameManager.toggle_frequency()

func _enter_corridor(corridor_name: String) -> void:
	for corridor in CORRIDOR_LAYOUT:
		if corridor.name == corridor_name:
			print("[MainHub] Entering: %s" % corridor_name)
			zone_selected.emit(corridor_name)
			get_tree().change_scene_to_file(corridor.scene)
			return

func _on_frequency_changed(new_freq: int) -> void:
	_update_frequency_label()
	# In full build: swap background, shift NPC states, change ambient color
	if new_freq == GameManager.Frequency.SHADOW:
		# Shadow Inn: darker palette, different NPC positions
		bg_sprite.modulate = Color(0.5, 0.45, 0.55, 1.0)
	else:
		bg_sprite.modulate = Color(1.0, 1.0, 1.0, 1.0)

func _update_frequency_label() -> void:
	match GameManager.current_frequency:
		GameManager.Frequency.LIVING:
			frequency_label.text = "42Hz — Living"
		GameManager.Frequency.SHADOW:
			frequency_label.text = "84Hz — Shadow"
		GameManager.Frequency.IN_BETWEEN:
			frequency_label.text = "In-Between"
