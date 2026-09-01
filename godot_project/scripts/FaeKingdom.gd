# FaeKingdom.gd — The Fae Kingdom MMO Zone
# WoW/EverQuest-style isometric exploration
# 6 sub-zones: The Threshold, The Summerlands (Seelie), The Hollow (Unseelie),
#   The Between (shifting borderlands), The Crystal Gardens (neutral), The Stone Circle Chamber
# Faction reputation: Seelie vs Unseelie
# Access via stone circle portals (Standing Stones game completion required)
# Quests reward rare stones: Labradorite, Fluorite, Rainbow Moonstone, Preseli Blue Stone

extends Node2D

# === SIGNALS ===
signal reputation_changed(court: String, value: int)
signal quest_accepted(quest_id: String)
signal quest_completed(quest_id: String)
signal subzone_entered(subzone_name: String)

# === SUB-ZONES ===
const SUB_ZONES := {
	"threshold": {
		"name": "The Threshold",
		"description": "The entry point. Stone circle portal hums behind you.",
		"bg_color": Color(0.06, 0.08, 0.06, 1),
		"accent": Color(0.40, 0.60, 0.35, 1),
		"npcs": ["Threshold Guardian"],
		"quests": ["First Steps"],
		"size": Vector2i(32, 24),
		"court": "neutral",
	},
	"summerlands": {
		"name": "The Summerlands",
		"description": "Seelie Court territory. Golden light, riddle-quests, green warmth.",
		"bg_color": Color(0.08, 0.10, 0.04, 1),
		"accent": Color(0.80, 0.70, 0.30, 1),
		"npcs": ["Seelie King", "Seelie Knight", "Summer Sage", "Fae Merchant"],
		"quests": ["The Riddle of Three Stones", "Light's Echo", "The Summer Pact"],
		"size": Vector2i(40, 32),
		"court": "seelie",
	},
	"hollow": {
		"name": "The Hollow",
		"description": "Unseelie Court territory. Dark, combat-focused, shadow and ice.",
		"bg_color": Color(0.03, 0.03, 0.06, 1),
		"accent": Color(0.35, 0.20, 0.50, 1),
		"npcs": ["Malachi", "Unseelie Knight", "Shadow Weaver", "Hollow Sentinel"],
		"quests": ["The Cold Path", "Shadow's Price", "The Unseelie Oath"],
		"size": Vector2i(40, 32),
		"court": "unseelie",
	},
	"between": {
		"name": "The Between",
		"description": "Shifting borderlands. The map changes between visits.",
		"bg_color": Color(0.05, 0.05, 0.08, 1),
		"accent": Color(0.50, 0.45, 0.55, 1),
		"npcs": ["The Wanderer", "Border Wisp"],
		"quests": ["The Shifting Path", "Neither Here Nor There"],
		"size": Vector2i(36, 36),
		"court": "neutral",
	},
	"crystal_gardens": {
		"name": "The Crystal Gardens",
		"description": "Neutral ground. Mineral formations grow as art. Griffin boss lair.",
		"bg_color": Color(0.04, 0.06, 0.08, 1),
		"accent": Color(0.30, 0.70, 0.80, 1),
		"npcs": ["Crystal Keeper", "Griffin (Boss)"],
		"quests": ["The Griffin's Challenge", "Crystal Harvest"],
		"size": Vector2i(32, 32),
		"court": "neutral",
	},
	"stone_circle": {
		"name": "The Stone Circle Chamber",
		"description": "The deepest point. The Inn's lowest frequency resonates here.",
		"bg_color": Color(0.02, 0.02, 0.03, 1),
		"accent": Color(0.60, 0.55, 0.40, 1),
		"npcs": ["The Deep Voice"],
		"quests": ["The Deepest Tone"],
		"size": Vector2i(16, 16),
		"court": "neutral",
	},
}

# === FACTION REPUTATION ===
var seelie_rep: int = 0
var unseelie_rep: int = 0
const REP_MAX := 100
const REP_HOSTILE := -50
const REP_NEUTRAL := 0
const REP_FRIENDLY := 50
const REP_EXALTED := 100

# === STATE ===
var current_subzone: String = "threshold"
var player: CharacterBody2D
var quest_log: Dictionary = {}  # quest_id -> {status, giver, court, reward}
var active_quests: Array[String] = []
var completed_quests: Array[String] = []

# === COMBAT (simple — Fae Kingdom has optional combat) ===
var in_combat: bool = false
var combat_target: Node2D = null

# === UI ===
var hud: CanvasLayer
var subzone_label: Label
var rep_display: Label
var quest_tracker: Label
var prompt_label: Label
var player_health: ProgressBar
var nearby_npc: String = ""

const PLAYER_SPEED := 140.0

func _ready() -> void:
	# Check access — requires Standing Stones completion
	if not GameManager.games_completed.has("Standing Stones"):
		print("[FaeKingdom] Access denied — complete Standing Stones first")
		get_tree().change_scene_to_file("res://scenes/MainHub.tscn")
		return
	
	_build_world()
	_setup_ui()
	_load_subzone("threshold")
	GameManager.current_zone = "Fae Kingdom"
	AudioManager.play_zone_music("res://assets/audio/fae_seelie.ogg")
	
	print("[FaeKingdom] Ready — Threshold loaded. Seelie: %d, Unseelie: %d" % [seelie_rep, unseelie_rep])

func _build_world() -> void:
	# Player
	player = CharacterBody2D.new()
	player.name = "Player"
	
	var col := CollisionShape2D.new()
	var shape := CapsuleShape2D.new()
	shape.radius = 10.0
	shape.height = 24.0
	col.shape = shape
	player.add_child(col)
	
	var sprite := Sprite2D.new()
	sprite.texture = _make_texture(Color(0.78, 0.66, 0.30), 16)
	sprite.scale = Vector2(1.5, 2.0)
	player.add_child(sprite)
	
	add_child(player)
	player.position = Vector2(512, 300)

func _setup_ui() -> void:
	hud = CanvasLayer.new()
	hud.name = "HUD"
	add_child(hud)
	
	subzone_label = Label.new()
	subzone_label.position = Vector2(20, 16)
	subzone_label.add_theme_font_size_override("font_size", 18)
	subzone_label.add_theme_color_override("font_color", Color(0.80, 0.70, 0.40))
	hud.add_child(subzone_label)
	
	rep_display = Label.new()
	rep_display.position = Vector2(20, 44)
	rep_display.add_theme_color_override("font_color", Color(0.60, 0.50, 0.25))
	rep_display.text = "Seelie: 0 | Unseelie: 0"
	hud.add_child(rep_display)
	
	quest_tracker = Label.new()
	quest_tracker.position = Vector2(20, 64)
	quest_tracker.add_theme_color_override("font_color", Color(0.55, 0.50, 0.30))
	quest_tracker.text = "Active Quests: 0"
	hud.add_child(quest_tracker)
	
	prompt_label = Label.new()
	prompt_label.position = Vector2(384, 480)
	prompt_label.add_theme_font_size_override("font_size", 16)
	prompt_label.add_theme_color_override("font_color", Color(0.90, 0.80, 0.45))
	prompt_label.horizontal_alignment = Label.HORIZONTAL_ALIGNMENT_CENTER
	prompt_label.size = Vector2(256, 30)
	hud.add_child(prompt_label)
	
	player_health = ProgressBar.new()
	player_health.position = Vector2(820, 540)
	player_health.size = Vector2(160, 16)
	player_health.max_value = 100
	player_health.value = 100
	hud.add_child(player_health)

func _load_subzone(subzone_key: String) -> void:
	if not SUB_ZONES.has(subzone_key):
		return
	
	current_subzone = subzone_key
	var data := SUB_ZONES[subzone_key]
	
	# Build collision for subzone (map subzone keys to collision zone names)
	var collision_zone := "fae_kingdom"
	match subzone_key:
		"summerlands": collision_zone = "fae_kingdom"
		"hollow": collision_zone = "undercity"
		"crystal_gardens": collision_zone = "catacombs"
	ZoneCollision.build_zone(collision_zone, self)
	
	# Update movement system
	if MovementSystem:
		MovementSystem.set_zone("fae_kingdom", player)
	
	subzone_label.text = data.name
	subzone_entered.emit(data.name)
	GameManager.current_zone = data.name
	
	# Clear and spawn NPCs
	for child in get_children():
		if child.is_in_group("fae_npc"):
			child.queue_free()
	
	var npc_index := 0
	for npc_name in data.get("npcs", []):
		var npc := _create_npc(npc_name, npc_index, data.court)
		npc.add_to_group("fae_npc")
		add_child(npc)
		npc_index += 1
	
	# Position player at entrance
	player.position = Vector2(512, 480)
	
	# Update music per court
	match data.court:
		"seelie": AudioManager.play_zone_music("res://assets/audio/fae_seelie.ogg")
		"unseelie": AudioManager.play_zone_music("res://assets/audio/fae_unseelie.ogg")
		_: AudioManager.play_zone_music("res://assets/audio/fae_neutral.ogg")
	
	print("[FaeKingdom] Loaded: %s (court: %s)" % [data.name, data.court])

func _create_npc(npc_name: String, index: int, court: String) -> Area2D:
	var npc := Area2D.new()
	npc.name = npc_name
	
	var angle := index * (PI * 2.0 / 5.0)
	npc.position = Vector2(512 + cos(angle) * 150, 300 + sin(angle) * 80)
	
	var color := Color(0.6, 0.5, 0.3)
	match court:
		"seelie": color = Color(0.80, 0.70, 0.30)
		"unseelie": color = Color(0.35, 0.20, 0.50)
	
	var sprite := Sprite2D.new()
	sprite.texture = SpriteLoader.get_npc_sprite(npc_name)
	sprite.scale = Vector2(1.5, 2.0)
	sprite.modulate = color  # Tint by court
	npc.add_child(sprite)
	
	var label := Label.new()
	label.text = npc_name
	label.position = Vector2(-30, -30)
	label.add_theme_font_size_override("font_size", 11)
	label.add_theme_color_override("font_color", color)
	npc.add_child(label)
	
	var col := CollisionShape2D.new()
	var shape := CircleShape2D.new()
	shape.radius = 18.0
	col.shape = shape
	npc.add_child(col)
	
	npc.set_meta("npc_name", npc_name)
	npc.set_meta("court", court)
	return npc

func _process(delta: float) -> void:
	if in_combat:
		_process_combat(delta)
		return
	
	# Movement
	var input_vec := Vector2.ZERO
	if Input.is_action_pressed("move_left"): input_vec.x -= 1
	if Input.is_action_pressed("move_right"): input_vec.x += 1
	if Input.is_action_pressed("move_up"): input_vec.y -= 1
	if Input.is_action_pressed("move_down"): input_vec.y += 1
	
	input_vec = input_vec.normalized()
	player.velocity = input_vec * PLAYER_SPEED
	player.move_and_slide()
	
	_check_npc_proximity()
	_check_subzone_transitions()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if DialogueManager and DialogueManager.is_in_dialogue():
			DialogueManager.advance()
		elif nearby_npc != "":
			_interact_with_npc(nearby_npc)
	
	if event.is_action_pressed("freq_toggle"):
		GameManager.toggle_frequency()
	
	if event.is_action_pressed("inn_map"):
		_show_fae_map()

func _check_npc_proximity() -> void:
	var found := ""
	for child in get_children():
		if child.is_in_group("fae_npc") and child is Area2D:
			if player.position.distance_to(child.position) < 40.0:
				found = child.get_meta("npc_name", "")
				break
	
	if found != nearby_npc:
		nearby_npc = found
		if found != "":
			prompt_label.text = "Press E — " + found
			prompt_label.visible = true
		else:
			prompt_label.visible = false

func _interact_with_npc(npc_name: String) -> void:
	# Find the NPC data
	var npc_node := null
	for child in get_children():
		if child.is_in_group("fae_npc") and child.get_meta("npc_name", "") == npc_name:
			npc_node = child
			break
	
	if not npc_node:
		return
	
	var court: String = npc_node.get_meta("court", "neutral")
	
	# Special NPC interactions
	match npc_name:
		"Threshold Guardian":
			prompt_label.text = "Guardian: Welcome to the Fae Kingdom. Choose your path."
			prompt_label.visible = true
			await get_tree().create_timer(2.0).timeout
			prompt_label.visible = false
		
		"Seelie King":
			if seelie_rep >= REP_NEUTRAL:
				_offer_quest("light_echo", "Light's Echo", "seelie", "Fluorite")
			else:
				prompt_label.text = "Seelie King: You are not yet trusted."
				prompt_label.visible = true
				await get_tree().create_timer(1.5).timeout
				prompt_label.visible = false
		
		"Malachi":
			if unseilie_rep >= REP_NEUTRAL:
				_offer_quest("cold_path", "The Cold Path", "unseelie", "Rainbow Moonstone")
			else:
				prompt_label.text = "Malachi: Prove yourself in shadow first."
				prompt_label.visible = true
				await get_tree().create_timer(1.5).timeout
				prompt_label.visible = false
		
		"Griffin (Boss)":
			_start_combat(npc_node)
		
		_:
			prompt_label.text = "%s: The Fae Kingdom remembers." % npc_name
			prompt_label.visible = true
			await get_tree().create_timer(1.5).timeout
			prompt_label.visible = false

func _offer_quest(quest_id: String, quest_name: String, court: String, reward: String) -> void:
	if quest_id in completed_quests:
		prompt_label.text = "Quest already completed."
		prompt_label.visible = true
		await get_tree().create_timer(1.0).timeout
		prompt_label.visible = false
		return
	
	if quest_id in active_quests:
		prompt_label.text = "%s already in progress." % quest_name
		prompt_label.visible = true
		await get_tree().create_timer(1.0).timeout
		prompt_label.visible = false
		return
	
	# Accept quest
	active_quests.append(quest_id)
	quest_log[quest_id] = {
		"name": quest_name,
		"court": court,
		"reward": reward,
		"status": "active",
	}
	quest_tracker.text = "Active Quests: %d" % active_quests.size()
	quest_accepted.emit(quest_id)
	
	prompt_label.text = "Quest accepted: %s (Reward: %s)" % [quest_name, reward]
	prompt_label.visible = true
	await get_tree().create_timer(2.5).timeout
	prompt_label.visible = false

func _start_combat(target: Node2D) -> void:
	in_combat = true
	combat_target = target
	prompt_label.text = "Combat! Press E to strike, Q to defend."
	prompt_label.visible = true

func _process_combat(delta: float) -> void:
	# Simple combat — approach and strike
	if not is_instance_valid(combat_target):
		in_combat = false
		prompt_label.visible = false
		return
	
	# Player can still move toward target
	var input_vec := Vector2.ZERO
	if Input.is_action_pressed("move_left"): input_vec.x -= 1
	if Input.is_action_pressed("move_right"): input_vec.x += 1
	if Input.is_action_pressed("move_up"): input_vec.y -= 1
	if Input.is_action_pressed("move_down"): input_vec.y += 1
	input_vec = input_vec.normalized()
	player.velocity = input_vec * PLAYER_SPEED * 0.7
	player.move_and_slide()

func _check_subzone_transitions() -> void:
	# Sub-zone transitions based on screen position
	var pos := player.position
	var target := ""
	
	if current_subzone == "threshold":
		if pos.x > 900: target = "summerlands"
		if pos.x < 100: target = "hollow"
		if pos.y < 80: target = "stone_circle"
		if pos.y > 500: target = "crystal_gardens"
	elif current_subzone == "summerlands":
		if pos.x < 100: target = "threshold"
		if pos.y > 500: target = "between"
	elif current_subzone == "hollow":
		if pos.x > 900: target = "threshold"
		if pos.y > 500: target = "between"
	elif current_subzone == "between":
		if pos.y < 80: target = "summerlands"
		if pos.y > 500: target = "hollow"
		if pos.x < 100: target = "crystal_gardens"
	elif current_subzone == "crystal_gardens":
		if pos.x > 900: target = "between"
		if pos.y < 80: target = "threshold"
	elif current_subzone == "stone_circle":
		if pos.y > 500: target = "threshold"
	
	if target != "":
		_load_subzone(target)

func _show_fae_map() -> void:
	prompt_label.text = "[Fae Kingdom Map — Threshold at center, Summerlands east, Hollow west]"
	prompt_label.visible = true
	await get_tree().create_timer(3.0).timeout
	prompt_label.visible = false

func _make_texture(color: Color, size: int) -> ImageTexture:
	var img := Image.create(size, size, false, Image.FORMAT_RGBA8)
	img.fill(color)
	return ImageTexture.create_from_image(img)

func _adjust_reputation(court: String, amount: int) -> void:
	match court:
		"seelie":
			seelie_rep = clamp(seelie_rep + amount, REP_HOSTILE, REP_MAX)
			# Opposing court loses half
			unseilie_rep = clamp(unseilie_rep - amount / 2, REP_HOSTILE, REP_MAX)
		"unseelie":
			unseilie_rep = clamp(unseilie_rep + amount, REP_HOSTILE, REP_MAX)
			seelie_rep = clamp(seelie_rep - amount / 2, REP_HOSTILE, REP_MAX)
	
	rep_display.text = "Seelie: %d | Unseelie: %d" % [seelie_rep, unseilie_rep]
	reputation_changed.emit(court, amount)
	print("[FaeKingdom] Reputation: Seelie %d, Unseelie %d" % [seelie_rep, unseilie_rep])
