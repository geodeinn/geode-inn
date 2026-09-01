# Arcade.gd — The Arcade Zone
# Game selection screen — displays available games as cards
# Selecting a game loads its scene

extends Control

const GAMES := [
	{"name": "Standing Stones", "scene": "res://scenes/StandingStones.tscn", "desc": "Tetris × Stonehenge. Stack stones to build the circle.", "reward": "Preseli Blue Stone"},
	{"name": "Tomb Tunnel", "scene": "res://scenes/TombTunnel.tscn", "desc": "Dig Dug × Egypt. Excavate through 7 strata to find Lapis Lazuli.", "reward": "Lapis Lazuli"},
	{"name": "Andean Run", "scene": "res://scenes/AndeanRun.tscn", "desc": "Temple Run × Peru. Run the cloud causeways of Machu Picchu.", "reward": "Blue Opal"},
	{"name": "Monster of the Deep", "scene": "res://scenes/MonsterOfTheDeep.tscn", "desc": "You ARE the Loch Ness monster. Surface, dive, survive.", "reward": "Freshwater Pearl"},
	{"name": "Tumble Run", "scene": "res://scenes/TumbleRun.tscn", "desc": "Endless runner. Guide Tumble through the Inn's corridors.", "reward": "Random Stone"},
]

var _selected_index: int = 0
var _card_buttons: Array[Button] = []

func _ready() -> void:
	GameManager.current_zone = "Arcade"
	AudioManager.play_zone_music("res://assets/audio/arcade.ogg")
	_build_game_list()
	_update_selection()

func _build_game_list() -> void:
	var vbox: VBoxContainer = $VBoxContainer/ScrollContainer/GameList
	for i in GAMES.size():
		var game := GAMES[i]
		var btn := Button.new()
		btn.text = game.name + "\n  " + game.desc + "\n  Reward: " + game.reward
		btn.custom_minimum_size = Vector2(900, 80)
		btn.pressed.connect(_on_game_selected.bind(i))
		vbox.add_child(btn)
		_card_buttons.append(btn)

func _update_selection() -> void:
	for i in _card_buttons.size():
		var selected := i == _selected_index
		_card_buttons[i].add_theme_color_override("font_color", 
			Color(0.85, 0.72, 0.35) if selected else Color(0.6, 0.6, 0.6))

func _on_game_selected(index: int) -> void:
	_selected_index = index
	var game := GAMES[index]
	print("[Arcade] Starting: %s" % game.name)
	get_tree().change_scene_to_file(game.scene)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/MainHub.tscn")
