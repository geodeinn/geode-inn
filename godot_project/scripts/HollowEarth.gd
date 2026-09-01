# HollowEarth.gd — The Hollow Earth RPG Zone
# Champions of Norrath / Baldur's Gate style action RPG
# 9 districts, 3 factions, 25 quests
# Accessible only at 84Hz (Shadow frequency)
# The inversion of the Inn — the inside of the outside
# Source Stone is the ultimate reward — the original frequency

extends Node2D

# === SIGNALS ===
signal district_entered(district_name: String)
signal faction_rep_changed(faction: String, value: int)
signal quest_started(quest_id: String)
signal quest_turned_in(quest_id: String, reward: String)

# === DISTRICTS (9 total) ===
const DISTRICTS := {
	"the_shaft": {
		"name": "The Shaft",
		"desc": "Vertical entry from Catacombs. The first breath of the Hollow.",
		"bg": Color(0.03, 0.02, 0.04, 1),
		"accent": Color(0.35, 0.25, 0.45, 1),
		"npcs": ["Shaft Keeper"],
		"enemies": ["Hollow Wraith"],
		"quests": ["Descent"],
		"exits": {"down": "mirror_market"},
	},
	"mirror_market": {
		"name": "Mirror Market",
		"desc": "Underground bazaar. Everything has a price, including reflection.",
		"bg": Color(0.05, 0.04, 0.06, 1),
		"accent": Color(0.50, 0.40, 0.55, 1),
		"npcs": ["Mirror Merchant", "Information Broker", "Fence"],
		"enemies": [],
		"quests": ["The Reflected Price", "Lost Goods"],
		"exits": {"up": "the_shaft", "east": "bone_chess", "west": "dust_library"},
	},
	"bone_chess": {
		"name": "Bone Chess Room",
		"desc": "The Archivist's domain. Full-scale bone board. Pieces are living constructs.",
		"bg": Color(0.04, 0.03, 0.05, 1),
		"accent": Color(0.55, 0.50, 0.40, 1),
		"npcs": ["The Archivist"],
		"enemies": ["Bone Construct"],
		"quests": ["The Sacrifice Rule", "No Part Goes to Waste"],
		"exits": {"west": "mirror_market", "south": "whisper_mines"},
	},
	"dust_library": {
		"name": "Dust Library",
		"desc": "Archive of things the surface forgot. Books disintegrate when read.",
		"bg": Color(0.06, 0.04, 0.04, 1),
		"accent": Color(0.45, 0.35, 0.30, 1),
		"npcs": ["Dust Librarian"],
		"enemies": ["Paper Wraith"],
		"quests": ["The Disintegrating Truth"],
		"exits": {"east": "mirror_market", "south": "forge ruins"},
	},
	"whisper_mines": {
		"name": "Whisper Mines",
		"desc": "Where the Hollow Men dig. The walls whisper what they'll become.",
		"bg": Color(0.03, 0.03, 0.05, 1),
		"accent": Color(0.30, 0.30, 0.40, 1),
		"npcs": ["Mine Foreman"],
		"enemies": ["Hollow Miner", "Whisper Echo"],
		"quests": ["The Dig", "What the Walls Know"],
		"exits": {"north": "bone_chess", "east": "core_chamber"},
	},
	"forge_ruins": {
		"name": "Forge Ruins",
		"desc": "Where Source Stone was first shaped. The forge is cold but breathing.",
		"bg": Color(0.05, 0.03, 0.03, 1),
		"accent": Color(0.50, 0.30, 0.25, 1),
		"npcs": ["Forge Ghost"],
		"enemies": ["Forge Wraith", "Ember Construct"],
		"quests": ["The Cold Forge", "Source Fragment"],
		"exits": {"north": "dust_library", "east": "core_chamber"},
	},
	"core_chamber": {
		"name": "Core Chamber",
		"desc": "The heart of the Hollow. Source Stone resonates here.",
		"bg": Color(0.04, 0.04, 0.08, 1),
		"accent": Color(0.60, 0.55, 0.80, 1),
		"npcs": ["The Core"],
		"enemies": ["Core Guardian (Boss)"],
		"quests": ["The Source", "The Original Frequency"],
		"exits": {"west": "whisper_mines", "north": "forge_ruins", "south": "root_sanctuary"},
	},
	"root_sanctuary": {
		"name": "Root Sanctuary",
		"desc": "Where the Inn's roots touch the Hollow. Yggdrasil's deepest point.",
		"bg": Color(0.04, 0.06, 0.04, 1),
		"accent": Color(0.30, 0.50, 0.35, 1),
		"npcs": ["Root Tender"],
		"enemies": [],
		"quests": ["The Root and the Stone"],
		"exits": {"north": "core_chamber"},
	},
	"the_gap": {
		"name": "The Gap",
		"desc": "The space between frequencies. The Archive cannot observe here.",
		"bg": Color(0.02, 0.02, 0.02, 1),
		"accent": Color(0.40, 0.40, 0.40, 1),
		"npcs": [],
		"enemies": ["The Unobserved"],
		"quests": ["Ether Walk"],
		"exits": {},  # Only accessible via special conditions
	},
}

# === FACTIONS (3) ===
const FACTIONS := {
	"hollow_men": {
		"name": "The Hollow Men",
		"desc": "The miners and builders. They want to fill the Hollow with form.",
		"rep": 0,
	},
	"archivists": {
		"name": "The Archivists",
		"desc": "The record-keepers. They want to document what the surface forgot.",
		"rep": 0,
	},
	"forgers": {
		"name": "The Forgers",
		"desc": "The crafters. They want to re-ignite the forge and shape Source Stone.",
		"rep": 0,
	},
}

# === STATE ===
var current_district: String = "the_shaft"
var player: CharacterBody2D
var player_stats := {
	"health": 100,
	"max_health": 100,
	"attack": 15,
	"defense": 10,
	"level": 1,
	"xp": 0,
	"xp_next": 100,
}
var active_quests: Array[String] = []
var completed_quests: Array[String] = []
var nearby_npc: String = ""
var nearby_enemy: Node2D = null
var in_combat: bool = false

# === UI ===
var hud: CanvasLayer
var district_label: Label
var health_bar: ProgressBar
var level_label: Label
var quest_log_label: Label
var prompt_label: Label
var faction_label: Label

const PLAYER_SPEED := 130.0
const COMBAT_RANGE := 35.0

func _ready() -> void:
	# Must be at 84Hz to enter
	if GameManager.current_frequency != GameManager.Frequency.SHADOW:
		GameManager.set_frequency(GameManager.Frequency.SHADOW)
	
	_build_player()
	_setup_ui()
	_load_district("the_shaft")
	GameManager.current_zone = "Hollow Earth"
	AudioManager.play_zone_music("res://assets/audio/undercity.ogg")
	
	print("[HollowEarth] Ready — The Shaft loaded. 84Hz Shadow active.")

func _build_player() -> void:
	player = CharacterBody2D.new()
	player.name = "Player"
	
	var col := CollisionShape2D.new()
	var shape := CapsuleShape2D.new()
	shape.radius = 10.0
	shape.height = 24.0
	col.shape = shape
	player.add_child(col)
	
	var sprite := Sprite2D.new()
	sprite.texture = _make_texture(Color(0.45, 0.35, 0.55), 16)
	sprite.scale = Vector2(1.5, 2.0)
	player.add_child(sprite)
	
	add_child(player)
	player.position = Vector2(512, 300)

func _setup_ui() -> void:
	hud = CanvasLayer.new()
	hud.name = "HUD"
	add_child(hud)
	
	district_label = Label.new()
	district_label.position = Vector2(20, 16)
	district_label.add_theme_font_size_override("font_size", 18)
	district_label.add_theme_color_override("font_color", Color(0.55, 0.45, 0.65))
	hud.add_child(district_label)
	
	health_bar = ProgressBar.new()
	health_bar.position = Vector2(20, 44)
	health_bar.size = Vector2(160, 16)
	health_bar.max_value = player_stats.max_health
	health_bar.value = player_stats.health
	health_bar.show_percentage = false
	hud.add_child(health_bar)
	
	level_label = Label.new()
	level_label.position = Vector2(200, 44)
	level_label.text = "LV 1 | XP 0/100"
	level_label.add_theme_color_override("font_color", Color(0.50, 0.40, 0.60))
	hud.add_child(level_label)
	
	quest_log_label = Label.new()
	quest_log_label.position = Vector2(20, 64)
	quest_log_label.text = "Quests: 0 active"
	quest_log_label.add_theme_color_override("font_color", Color(0.45, 0.40, 0.55))
	hud.add_child(quest_log_label)
	
	faction_label = Label.new()
	faction_label.position = Vector2(820, 16)
	faction_label.text = "HM: 0 | AR: 0 | FG: 0"
	faction_label.add_theme_color_override("font_color", Color(0.50, 0.45, 0.60))
	hud.add_child(faction_label)
	
	prompt_label = Label.new()
	prompt_label.position = Vector2(384, 480)
	prompt_label.add_theme_font_size_override("font_size", 16)
	prompt_label.add_theme_color_override("font_color", Color(0.70, 0.60, 0.80))
	prompt_label.horizontal_alignment = Label.HORIZONTAL_ALIGNMENT_CENTER
	prompt_label.size = Vector2(256, 30)
	hud.add_child(prompt_label)

func _load_district(district_key: String) -> void:
	if not DISTRICTS.has(district_key):
		return
	
	current_district = district_key
	var data := DISTRICTS[district_key]
	
	# Build collision — map districts to collision zone types
	var collision_zone := "undercity"
	match district_key:
		"mirror_market": collision_zone = "market"
		"bone_chess": collision_zone = "catacombs"
		"dust_library": collision_zone = "archive"
		"forge_ruins": collision_zone = "undercity"
		"core_chamber": collision_zone = "cosmology"
	ZoneCollision.build_zone(collision_zone, self)
	
	# Update movement system
	if MovementSystem:
		MovementSystem.set_zone("undercity", player)
	
	# Clear existing entities
	for child in get_children():
		if child.is_in_group("he_entity"):
			child.queue_free()
	
	district_label.text = data.name
	district_entered.emit(data.name)
	GameManager.current_zone = data.name
	
	# Spawn NPCs
	var idx := 0
	for npc_name in data.get("npcs", []):
		var npc := _create_entity(npc_name, idx, "npc", Color(0.55, 0.45, 0.65))
		npc.add_to_group("he_entity")
		add_child(npc)
		idx += 1
	
	# Spawn enemies
	for enemy_name in data.get("enemies", []):
		var enemy := _create_entity(enemy_name, idx, "enemy", Color(0.50, 0.20, 0.30))
		enemy.add_to_group("he_entity")
		add_child(enemy)
		idx += 1
	
	# Position player at district entrance
	player.position = Vector2(512, 480)
	
	print("[HollowEarth] Loaded: %s" % data.name)

func _create_entity(name_str: String, index: int, type: String, color: Color) -> Area2D:
	var entity := Area2D.new()
	entity.name = name_str
	
	var angle := index * 1.3
	var radius := 100 + index * 25
	entity.position = Vector2(512 + cos(angle) * radius, 300 + sin(angle) * radius * 0.6)
	
	var sprite := Sprite2D.new()
	if type == "npc":
		sprite.texture = SpriteLoader.get_npc_sprite(name_str)
	else:
		sprite.texture = _make_texture(color, 12)
	sprite.scale = Vector2(1.5, 2.0)
	sprite.modulate = color
	entity.add_child(sprite)
	
	var label := Label.new()
	label.text = name_str
	label.position = Vector2(-30, -30)
	label.add_theme_font_size_override("font_size", 10)
	label.add_theme_color_override("font_color", color)
	entity.add_child(label)
	
	var col := CollisionShape2D.new()
	var shape := CircleShape2D.new()
	shape.radius = 16.0
	col.shape = shape
	entity.add_child(col)
	
	entity.set_meta("entity_name", name_str)
	entity.set_meta("entity_type", type)
	return entity

func _process(delta: float) -> void:
	# Movement
	var input_vec := Vector2.ZERO
	if Input.is_action_pressed("move_left"): input_vec.x -= 1
	if Input.is_action_pressed("move_right"): input_vec.x += 1
	if Input.is_action_pressed("move_up"): input_vec.y -= 1
	if Input.is_action_pressed("move_down"): input_vec.y += 1
	
	input_vec = input_vec.normalized()
	player.velocity = input_vec * PLAYER_SPEED
	player.move_and_slide()
	
	_check_proximity()
	_check_district_transitions()
	
	# Combat check
	if in_combat and is_instance_valid(nearby_enemy):
		_combat_update(delta)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if DialogueManager and DialogueManager.is_in_dialogue():
			DialogueManager.advance()
		elif nearby_npc != "":
			_interact_npc(nearby_npc)
	
	if event.is_action_pressed("jump") and nearby_enemy != null:
		_attack_enemy()
	
	if event.is_action_pressed("freq_toggle"):
		# Attempting to shift back to Living exits Hollow Earth
		prompt_label.text = "Shifting to 42Hz will exit the Hollow. Hold to confirm."
		prompt_label.visible = true
		await get_tree().create_timer(1.5).timeout
		prompt_label.visible = false

func _check_proximity() -> void:
	var found_npc := ""
	var found_enemy: Node2D = null
	
	for child in get_children():
		if child.is_in_group("he_entity") and child is Area2D:
			var dist := player.position.distance_to(child.position)
			var etype: String = child.get_meta("entity_type", "")
			if dist < 40.0 and etype == "npc":
				found_npc = child.get_meta("entity_name", "")
			elif dist < COMBAT_RANGE and etype == "enemy":
				found_enemy = child
	
	nearby_npc = found_npc
	nearby_enemy = found_enemy
	
	if found_npc != "":
		prompt_label.text = "Press E — " + found_npc
		prompt_label.visible = true
	elif found_enemy != null:
		prompt_label.text = "Press Space — Attack " + found_enemy.get_meta("entity_name", "")
		prompt_label.visible = true
		in_combat = true
	else:
		prompt_label.visible = false
		in_combat = false

func _interact_npc(npc_name: String) -> void:
	match npc_name:
		"Shaft Keeper":
			prompt_label.text = "Keeper: The Hollow inverts what the surface knows. Descend carefully."
		"Mirror Merchant":
			prompt_label.text = "Merchant: Everything reflects here. Even your coin has two faces."
		"The Archivist":
			prompt_label.text = "Archivist: No part goes to waste. The pieces remember their shape."
			_offer_quest("sacrifice_rule", "The Sacrifice Rule", "archivists", "Onyx")
		"Forge Ghost":
			prompt_label.text = "Ghost: The forge breathes still. Bring me Source Fragment and I will shape it."
			_offer_quest("cold_forge", "The Cold Forge", "forgers", "Tourmaline")
		"The Core":
			prompt_label.text = "The Core: You seek the Source. It is not given. It is remembered."
			_offer_quest("the_source", "The Source", "hollow_men", "Source Stone")
		_:
			prompt_label.text = "%s speaks in echoes." % npc_name
	
	prompt_label.visible = true
	await get_tree().create_timer(2.5).timeout
	prompt_label.visible = false

func _offer_quest(quest_id: String, quest_name: String, faction: String, reward: String) -> void:
	if quest_id in completed_quests or quest_id in active_quests:
		return
	
	active_quests.append(quest_id)
	quest_log_label.text = "Quests: %d active" % active_quests.size()
	quest_started.emit(quest_id)
	prompt_label.text = "Quest: %s — Reward: %s" % [quest_name, reward]
	
	# Award faction rep for accepting
	FACTIONS[faction].rep += 5
	_update_faction_label()

func _attack_enemy() -> void:
	if not is_instance_valid(nearby_enemy):
		return
	
	var enemy_name: String = nearby_enemy.get_meta("entity_name", "")
	var damage := player_stats.attack
	
	# Simple damage + despawn
	prompt_label.text = "Hit %s for %d!" % [enemy_name, damage]
	prompt_label.visible = true
	
	# Gain XP
	_gain_xp(25)
	
	# Despawn enemy after "defeat"
	nearby_enemy.queue_free()
	nearby_enemy = null
	in_combat = false
	
	await get_tree().create_timer(1.0).timeout
	prompt_label.visible = false

func _combat_update(delta: float) -> void:
	# Enemy slowly approaches player
	var direction := (player.position - nearby_enemy.position).normalized()
	nearby_enemy.position += direction * 40.0 * delta

func _gain_xp(amount: int) -> void:
	player_stats.xp += amount
	while player_stats.xp >= player_stats.xp_next:
		player_stats.xp -= player_stats.xp_next
		player_stats.level += 1
		player_stats.xp_next = int(player_stats.xp_next * 1.5)
		player_stats.max_health += 10
		player_stats.health = player_stats.max_health
		player_stats.attack += 3
		player_stats.defense += 2
		health_bar.max_value = player_stats.max_health
		health_bar.value = player_stats.health
		print("[HollowEarth] Level up! Now level %d" % player_stats.level)
	
	level_label.text = "LV %d | XP %d/%d" % [player_stats.level, player_stats.xp, player_stats.xp_next]

func _check_district_transitions() -> void:
	var pos := player.position
	var data := DISTRICTS[current_district]
	var exits: Dictionary = data.get("exits", {})
	var target := ""
	
	if pos.y < 60 and exits.has("up"): target = exits.up
	if pos.y > 520 and exits.has("down"): target = exits.down
	if pos.x < 60 and exits.has("west"): target = exits.west
	if pos.x > 960 and exits.has("east"): target = exits.east
	
	if target != "":
		_load_district(target)

func _update_faction_label() -> void:
	faction_label.text = "HM: %d | AR: %d | FG: %d" % [
		FACTIONS.hollow_men.rep,
		FACTIONS.archivists.rep,
		FACTIONS.forgers.rep,
	]

func _make_texture(color: Color, size: int) -> ImageTexture:
	var img := Image.create(size, size, false, Image.FORMAT_RGBA8)
	img.fill(color)
	return ImageTexture.create_from_image(img)
