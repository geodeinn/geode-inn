extends Node2D
## TombTunnel.gd — Dig Dug-Style Excavation Game (Egypt Zone)
##
## Tabletop Questline Narrative:
## "The Reader unfolds the papyrus map. Beneath the sun-bleached sands of the Valley of the Kings,
## seven ancient strata seal the tomb of Pharaoh Semerkhet. The air smells of dry cedar and 42Hz resonance.
## Dig through limestone, sandstone, and granite. Evade the skittering scarab swarms and ancient mummy guards.
## Retrieve the sacred Lapis Lazuli to ignite the Egyptian alignment."
##
## Artist Style: Georgia O'Keeffe × Luis Royo
##   Sculptural organic bone and stone formations, vivid desert horizons, intense sunlit terracotta
##   and limestone gradients, dark gothic shadows with glowing lapis highlights.
##
## Music Tempo: Egyptian ney flute at 50 BPM (meditative, rhythmic subterranean exploration).
## Frequency System: 42Hz subterranean standing wave pulses through the stone layers, revealing hidden treasures.

# === Grid Configuration ===
const GRID_WIDTH: int = 16
const GRID_HEIGHT: int = 20
const CELL_SIZE: int = 32  # 512x640 playfield

# === Game States ===
enum State { MENU, PLAYING, PAUSED, WIN, GAME_OVER }
var current_state: State = State.MENU

# === Layer Strata Definitions (7 Depth Levels) ===
const STRATA_INFO := [
	{
		"level": 1,
		"name": "Shallow Limestone",
		"color": Color(0.92, 0.85, 0.72),  # Sun-bleached pale cream
		"durability": 1,
		"scarab_count": 2,
		"mummy_count": 1,
		"treasures_needed": 3
	},
	{
		"level": 2,
		"name": "Deep Limestone",
		"color": Color(0.85, 0.72, 0.55),  # Warm desert ochre
		"durability": 1,
		"scarab_count": 3,
		"mummy_count": 1,
		"treasures_needed": 4
	},
	{
		"level": 3,
		"name": "Upper Sandstone",
		"color": Color(0.78, 0.48, 0.32),  # O'Keeffe terracotta red
		"durability": 2,
		"scarab_count": 4,
		"mummy_count": 2,
		"treasures_needed": 4
	},
	{
		"level": 4,
		"name": "Lower Sandstone",
		"color": Color(0.65, 0.35, 0.22),  # Deep rust brown
		"durability": 2,
		"scarab_count": 5,
		"mummy_count": 2,
		"treasures_needed": 5
	},
	{
		"level": 5,
		"name": "Upper Granite",
		"color": Color(0.48, 0.36, 0.42),  # Rose granite gray
		"durability": 3,
		"scarab_count": 6,
		"mummy_count": 3,
		"treasures_needed": 5
	},
	{
		"level": 6,
		"name": "Deep Granite",
		"color": Color(0.32, 0.25, 0.32),  # Basalt purple-black
		"durability": 3,
		"scarab_count": 7,
		"mummy_count": 3,
		"treasures_needed": 6
	},
	{
		"level": 7,
		"name": "Pharaoh's Lapis Chamber",
		"color": Color(0.12, 0.16, 0.35),  # Deep obsidian lapis vault
		"durability": 4,
		"scarab_count": 8,
		"mummy_count": 4,
		"treasures_needed": 7
	}
]

# === Signals for UI Updates ===
signal score_updated(new_score: int)
signal level_changed(current_level: int, level_name: String)
signal health_changed(current_hp: int)
signal treasures_updated(found: int, needed: int)
signal game_state_changed(new_state: int)
signal pulse_42hz_triggered(position: Vector2)

# === Game Variables ===
var score: int = 0
var level: int = 1
var player_hp: int = 3
var current_stratum: Dictionary = {}
var grid: Array = []  # 2D array of tile dictionaries
var treasures_collected: int = 0
var total_treasures_this_level: int = 0

# Player
var player_grid_pos: Vector2i = Vector2i(8, 1)
var player_facing: Vector2i = Vector2i(0, 1)  # Default facing down
var move_cooldown: float = 0.0
const MOVE_DELAY: float = 0.12  # Seconds between step moves
var is_pumping: bool = false
var pump_timer: float = 0.0
var pump_target_enemy: Dictionary = {}

# Enemies & Objects
var enemies: Array[Dictionary] = []
var treasures: Array[Dictionary] = []
var 42hz_pulse_timer: float = 0.0
const PULSE_INTERVAL: float = 1.2  # 50 BPM wave cycle (~1.2 sec)

# UI Elements
@onready var ui_layer: CanvasLayer = $UILayer if has_node("UILayer") else null

func _ready() -> void:
	# Tabletop GM introduction
	print_verbose("[DM/Reader]: 'The sand gives way beneath your picks. 42Hz frequency vibrates in your boots.'")
	_start_level(1)
	current_state = State.PLAYING
	game_state_changed.emit(current_state)
	
	# Connect to GameManager signal if available
	if Engine.has_singleton("GameManager") or get_node_or_null("/root/GameManager"):
		var gm = get_node_or_null("/root/GameManager")
		if gm and gm.has_signal("game_completed"):
			gm.game_completed.connect(_on_game_completed_global)

func _start_level(lvl: int) -> void:
	level = lvl
	current_stratum = STRATA_INFO[clamp(level - 1, 0, STRATA_INFO.size() - 1)]
	treasures_collected = 0
	total_treasures_this_level = current_stratum["treasures_needed"]
	
	player_grid_pos = Vector2i(GRID_WIDTH / 2, 1)
	player_facing = Vector2i(0, 1)
	
	_generate_grid()
	_spawn_enemies()
	_spawn_treasures()
	
	level_changed.emit(level, current_stratum["name"])
	treasures_updated.emit(treasures_collected, total_treasures_this_level)
	health_changed.emit(player_hp)
	score_updated.emit(score)
	queue_redraw()

func _generate_grid() -> void:
	grid = []
	for y in range(GRID_HEIGHT):
		var row: Array = []
		for x in range(GRID_WIDTH):
			# Surface row is dug out
			var is_dug: bool = (y <= 1)
			# Pre-dug tunnels for mummies near middle
			if y > 3 and y < GRID_HEIGHT - 2 and (x == 4 or x == 11) and y % 3 != 0:
				is_dug = true
			
			row.append({
				"dug": is_dug,
				"durability": current_stratum["durability"],
				"max_durability": current_stratum["durability"],
				"has_treasure": false,
				"treasure_type": ""
			})
		grid.append(row)

func _spawn_enemies() -> void:
	enemies.clear()
	
	# Scarab swarms (diggers)
	var scarabs_to_spawn: int = current_stratum["scarab_count"]
	for i in range(scarabs_to_spawn):
		var rx: int = randi_range(1, GRID_WIDTH - 2)
		var ry: int = randi_range(4, GRID_HEIGHT - 2)
		enemies.append({
			"type": "scarab",
			"pos": Vector2i(rx, ry),
			"dir": Vector2i(1, 0),
			"move_timer": 0.0,
			"move_speed": 0.4 - (level * 0.03),  # Faster at deeper levels
			"inflation": 0,  # 0 to 3 before popping
			"stun_timer": 0.0
		})
	
	# Mummy guards (corridor patrol)
	var mummies_to_spawn: int = current_stratum["mummy_count"]
	for i in range(mummies_to_spawn):
		var mx: int = 4 if i % 2 == 0 else 11
		var my: int = randi_range(3, GRID_HEIGHT - 3)
		enemies.append({
			"type": "mummy",
			"pos": Vector2i(mx, my),
			"dir": Vector2i(0, 1 if randf() > 0.5 else -1),
			"move_timer": 0.0,
			"move_speed": 0.3 - (level * 0.025),
			"inflation": 0,
			"stun_timer": 0.0
		})

func _spawn_treasures() -> void:
	treasures.clear()
	var placed: int = 0
	var attempts: int = 0
	
	while placed < total_treasures_this_level and attempts < 200:
		attempts += 1
		var tx: int = randi_range(1, GRID_WIDTH - 2)
		var ty: int = randi_range(3, GRID_HEIGHT - 2)
		
		if not grid[ty][tx]["dug"] and not grid[ty][tx]["has_treasure"]:
			grid[ty][tx]["has_treasure"] = true
			var t_type: String = "canopic_jar"
			if level == 7 and placed == 0:
				t_type = "lapis_lazuli_relic"
			elif randf() < 0.3:
				t_type = "golden_ankh"
			elif randf() < 0.6:
				t_type = "scarab_amulet"
			
			grid[ty][tx]["treasure_type"] = t_type
			treasures.append({
				"pos": Vector2i(tx, ty),
				"type": t_type,
				"collected": false
			})
			placed += 1

func _process(delta: float) -> void:
	if current_state != State.PLAYING:
		return
	
	# 42Hz frequency rhythm (50 BPM ney flute pulsation)
	42hz_pulse_timer += delta
	if 42hz_pulse_timer >= PULSE_INTERVAL:
		42hz_pulse_timer = 0.0
		pulse_42hz_triggered.emit(Vector2(player_grid_pos) * CELL_SIZE)
	
	# Cooldowns
	if move_cooldown > 0.0:
		move_cooldown -= delta
	
	# Pump action
	if is_pumping:
		_process_pump(delta)
	else:
		_handle_player_input()
	
	_update_enemies(delta)
	_check_collisions()

func _handle_player_input() -> void:
	if move_cooldown > 0.0:
		return
	
	var dir := Vector2i.ZERO
	if Input.is_action_pressed("ui_left"):
		dir = Vector2i(-1, 0)
	elif Input.is_action_pressed("ui_right"):
		dir = Vector2i(1, 0)
	elif Input.is_action_pressed("ui_up"):
		dir = Vector2i(0, -1)
	elif Input.is_action_pressed("ui_down"):
		dir = Vector2i(0, 1)
	
	if dir != Vector2i.ZERO:
		player_facing = dir
		_attempt_move(dir)
		move_cooldown = MOVE_DELAY
	
	if Input.is_action_just_pressed("ui_accept"):  # Spacebar / Action key
		_start_pump()

func _attempt_move(dir: Vector2i) -> void:
	var target_pos := player_grid_pos + dir
	
	# Boundary check
	if target_pos.x < 0 or target_pos.x >= GRID_WIDTH or target_pos.y < 0 or target_pos.y >= GRID_HEIGHT:
		return
	
	var cell: Dictionary = grid[target_pos.y][target_pos.x]
	
	if cell["dug"]:
		player_grid_pos = target_pos
		_check_treasure_pickup(target_pos)
	else:
		# Digging sand layer
		cell["durability"] -= 1
		if cell["durability"] <= 0:
			cell["dug"] = true
			player_grid_pos = target_pos
			score += 10 * level
			score_updated.emit(score)
			_check_treasure_pickup(target_pos)
		queue_redraw()

func _check_treasure_pickup(pos: Vector2i) -> void:
	var cell: Dictionary = grid[pos.y][pos.x]
	if cell["has_treasure"]:
		cell["has_treasure"] = false
		treasures_collected += 1
		
		var bonus: int = 100
		if cell["treasure_type"] == "lapis_lazuli_relic":
			bonus = 1000
		elif cell["treasure_type"] == "golden_ankh":
			bonus = 300
		elif cell["treasure_type"] == "scarab_amulet":
			bonus = 200
		
		score += bonus * level
		score_updated.emit(score)
		treasures_updated.emit(treasures_collected, total_treasures_this_level)
		
		# Tabletop DM text
		print("[DM/Reader]: 'Extracted %s from the %s layer!'" % [cell["treasure_type"], current_stratum["name"]])
		
		if treasures_collected >= total_treasures_this_level:
			_advance_level()

func _start_pump() -> void:
	is_pumping = true
	pump_timer = 0.0
	pump_target_enemy = {}
	
	# Raycast 3 cells forward to find enemy
	for step in range(1, 4):
		var check_pos := player_grid_pos + (player_facing * step)
		for enemy in enemies:
			if enemy["pos"] == check_pos:
				pump_target_enemy = enemy
				break
		if not pump_target_enemy.is_empty():
			break

func _process_pump(delta: float) -> void:
	pump_timer += delta
	if pump_timer >= 0.2:
		pump_timer = 0.0
		if not pump_target_enemy.is_empty() and pump_target_enemy in enemies:
			pump_target_enemy["inflation"] += 1
			pump_target_enemy["stun_timer"] = 1.0
			
			if pump_target_enemy["inflation"] >= 3:
				# Enemy pops!
				score += 250 * level
				score_updated.emit(score)
				enemies.erase(pump_target_enemy)
				pump_target_enemy = {}
				is_pumping = false
		else:
			is_pumping = false
		queue_redraw()
	
	if not Input.is_action_pressed("ui_accept"):
		is_pumping = false

func _update_enemies(delta: float) -> void:
	for enemy in enemies:
		if enemy["stun_timer"] > 0.0:
			enemy["stun_timer"] -= delta
			continue
		
		# Inflation decays over time if not continuously pumped
		if enemy["inflation"] > 0 and randf() < 0.02:
			enemy["inflation"] -= 1
		
		enemy["move_timer"] += delta
		if enemy["move_timer"] >= enemy["move_speed"]:
			enemy["move_timer"] = 0.0
			_move_enemy(enemy)

func _move_enemy(enemy: Dictionary) -> void:
	if enemy["type"] == "scarab":
		# Scarabs dig through sand or follow tunnels toward player
		var dir_to_player := Vector2i(
			sign(player_grid_pos.x - enemy["pos"].x),
			sign(player_grid_pos.y - enemy["pos"].y)
		)
		
		# Prefer x or y
		var move_dir := Vector2i.ZERO
		if dir_to_player.x != 0 and (randf() < 0.6 or dir_to_player.y == 0):
			move_dir = Vector2i(dir_to_player.x, 0)
		elif dir_to_player.y != 0:
			move_dir = Vector2i(0, dir_to_player.y)
		
		var next_pos := enemy["pos"] + move_dir
		if next_pos.x >= 0 and next_pos.x < GRID_WIDTH and next_pos.y >= 2 and next_pos.y < GRID_HEIGHT:
			enemy["pos"] = next_pos
			# Scarabs dig sand if present
			if not grid[next_pos.y][next_pos.x]["dug"]:
				grid[next_pos.y][next_pos.x]["dug"] = true
				
	elif enemy["type"] == "mummy":
		# Mummies move along pre-dug corridors
		var next_pos := enemy["pos"] + enemy["dir"]
		if next_pos.y >= 1 and next_pos.y < GRID_HEIGHT and grid[next_pos.y][next_pos.x]["dug"]:
			enemy["pos"] = next_pos
		else:
			# Reverse direction
			enemy["dir"] *= -1

func _check_collisions() -> void:
	for enemy in enemies:
		if enemy["pos"] == player_grid_pos and enemy["inflation"] < 3:
			_player_hit()
			break

func _player_hit() -> void:
	player_hp -= 1
	health_changed.emit(player_hp)
	print("[DM/Reader]: 'An ancient guardian strikes! Lives remaining: %d'" % player_hp)
	
	if player_hp <= 0:
		_game_over()
	else:
		# Respawn player at top
		player_grid_pos = Vector2i(GRID_WIDTH / 2, 1)

func _advance_level() -> void:
	if level >= 7:
		_win()
	else:
		print("[DM/Reader]: 'Level %d complete. Descending deeper into %s...'" % [level, STRATA_INFO[level]["name"]])
		_start_level(level + 1)

func _win() -> void:
	current_state = State.WIN
	game_state_changed.emit(current_state)
	print("=== EGYPT TOMB TUNNEL COMPLETE ===")
	print("The sacred Lapis Lazuli relic has been unearthed!")
	
	# Award Lapis Lazuli via GameManager
	if Engine.has_singleton("GameManager") or get_node_or_null("/root/GameManager"):
		var gm = get_node_or_null("/root/GameManager")
		if gm and gm.has_method("complete_game"):
			gm.complete_game("tomb_tunnel", score)
	
	# Transition via FizgigLoader
	if Engine.has_singleton("FizgigLoader") or get_node_or_null("/root/FizgigLoader"):
		var fl = get_node_or_null("/root/FizgigLoader")
		if fl and fl.has_method("load_zone"):
			fl.load_zone("tomb_tunnel")

func _game_over() -> void:
	current_state = State.GAME_OVER
	game_state_changed.emit(current_state)
	print("[DM/Reader]: 'The sands collapse. The tomb remains sealed for now.'")

func _on_game_completed_global(game_id: String) -> void:
	if game_id == "tomb_tunnel":
		print("[DM/Reader]: 'Lapis Lazuli shines with subterranean 42Hz brilliance.'")

# === Rendering ===
func _draw() -> void:
	# Draw background fill
	var playfield_rect := Rect2(0, 0, GRID_WIDTH * CELL_SIZE, GRID_HEIGHT * CELL_SIZE)
	draw_rect(playfield_rect, Color(0.08, 0.06, 0.05), true)
	
	# Draw Sand Grid
	var layer_color: Color = current_stratum.get("color", Color(0.8, 0.7, 0.5))
	for y in range(GRID_HEIGHT):
		for x in range(GRID_WIDTH):
			var cell: Dictionary = grid[y][x]
			var cell_rect := Rect2(x * CELL_SIZE, y * CELL_SIZE, CELL_SIZE, CELL_SIZE)
			
			if not cell["dug"]:
				# Sand tile
				var dur_ratio := float(cell["durability"]) / float(cell["max_durability"])
				var tile_col := layer_color.darkened(1.0 - dur_ratio * 0.4)
				draw_rect(cell_rect, tile_col, true)
				draw_rect(cell_rect, tile_col.darkened(0.2), false, 1.0)
				
				# Treasure hint (42Hz aura glow)
				if cell["has_treasure"]:
					var pulse_alpha := (sin(42hz_pulse_timer * 6.0) + 1.0) * 0.25
					draw_rect(cell_rect, Color(0.2, 0.5, 1.0, pulse_alpha), true)
			else:
				# Dug tunnel (dark interior with O'Keeffe bone/stone border)
				draw_rect(cell_rect, Color(0.12, 0.1, 0.09), true)
	
	# Draw Treasures revealed in dug areas
	for y in range(GRID_HEIGHT):
		for x in range(GRID_WIDTH):
			var cell: Dictionary = grid[y][x]
			if cell["dug"] and cell["has_treasure"]:
				var center := Vector2(x * CELL_SIZE + CELL_SIZE/2, y * CELL_SIZE + CELL_SIZE/2)
				draw_circle(center, 8.0, Color(0.95, 0.8, 0.2))  # Gold item
	
	# Draw Enemies
	for enemy in enemies:
		var e_center := Vector2(enemy["pos"].x * CELL_SIZE + CELL_SIZE/2, enemy["pos"].y * CELL_SIZE + CELL_SIZE/2)
		var inflation_scale: float = 1.0 + (enemy["inflation"] * 0.4)
		
		if enemy["type"] == "scarab":
			# Scarab: Deep iridescent jewel bug (O'Keeffe vivid teal/emerald)
			var scarab_col := Color(0.1, 0.8, 0.7)
			if enemy["inflation"] > 0:
				scarab_col = scarab_col.lerp(Color(1.0, 0.3, 0.2), enemy["inflation"] / 3.0)
			draw_circle(e_center, 10.0 * inflation_scale, scarab_col)
		else:
			# Mummy: Ancient linen guard
			var mummy_col := Color(0.85, 0.8, 0.65)
			if enemy["inflation"] > 0:
				mummy_col = mummy_col.lerp(Color(1.0, 0.3, 0.2), enemy["inflation"] / 3.0)
			var m_rect := Rect2(
				e_center.x - 8.0 * inflation_scale,
				e_center.y - 12.0 * inflation_scale,
				16.0 * inflation_scale,
				24.0 * inflation_scale
			)
			draw_rect(m_rect, mummy_col, true)
	
	# Draw Player
	var p_center := Vector2(player_grid_pos.x * CELL_SIZE + CELL_SIZE/2, player_grid_pos.y * CELL_SIZE + CELL_SIZE/2)
	draw_circle(p_center, 12.0, Color(0.9, 0.3, 0.2))  # Archaeologist Explorer
	
	# Draw Pump / 42Hz Sonic Beam
	if is_pumping:
		var beam_start := p_center
		var beam_end := p_center + Vector2(player_facing) * (CELL_SIZE * 2.5)
		draw_line(beam_start, beam_end, Color(0.3, 0.8, 1.0, 0.9), 4.0)
		draw_circle(beam_end, 6.0, Color(0.5, 0.9, 1.0))

# === NAVIGATION ===
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/Arcade.tscn")
