extends Node2D
## Sandfall.gd — Egypt Zone Signature Game
## Artist: Georgia O'Keeffe (sinking sand, desert bone, simplification)
## Mechanic: Descending platformer — 7 levels, descent = simplification
## Each level strips away one complexity until only bone remains.
## Reward: Desert Rose Selenite (the stone that forms in sand)
## Tempo: 50 BPM, low-dub classical with Egyptian ney flute

# === Game State ===
var current_level: int = 1
const MAX_LEVELS: int = 7
var score: int = 0
var player_alive: bool = true
var sinking_speed: float = 50.0  # pixels per second, increases per level
var sand_level: float = 0.0      # how high the sand has risen
var is_paused: bool = false

# === Player State ===
var player_pos: Vector2 = Vector2(640, 200)
var player_vel: Vector2 = Vector2.ZERO
var player_on_platform: bool = false
var player_facing: int = 1  # 1 = right, -1 = left
var double_jump_available: bool = true

# === Level Data ===
# Each level strips away one mechanic (descent = simplification):
# L1: Full controls (move, jump, double-jump, dash, grab)
# L2: No double-jump
# L3: No dash
# L4: Platforms crumble faster
# L5: Sand rises faster
# L6: No platforms — only sand walls to wall-jump
# L7: Only bone — falling, no control, the final descent
const LEVEL_STRIPPED_MECHANICS := {
	1: "All abilities available. The sand is patient.",
	2: "Double-jump stripped. The air thins.",
	3: "Dash stripped. Movement is deliberate now.",
	4: "Platforms crumble in half the time. Nothing holds.",
	5: "Sand rises twice as fast. The surface is a memory.",
	6: "No platforms. Only walls. The sand IS the floor.",
	7: "Bone. Falling. No control. The final descent into the geode."
}

# === Platforms ===
var platforms: Array[Dictionary] = []
var crumbling_platforms: Array[int] = []  # indices of platforms that are crumbling

# === Sand Particles (visual) ===
var sand_particles: Array[Dictionary] = []

# === Bone Collectibles ===
var bones_collected: int = 0
var bones_in_level: int = 0
var bone_positions: Array[Vector2] = []

# === O'Keeffe Color Palette ===
# Desert sky, bone white, sand ochre, canyon red, shadow purple
const COLOR_SKY_TOP := Color(0.85, 0.72, 0.55)     # pale desert sky
const COLOR_SKY_BOTTOM := Color(0.92, 0.78, 0.60)  # warm horizon
const COLOR_SAND := Color(0.76, 0.60, 0.40)         # ochre sand
const COLOR_SAND_DARK := Color(0.55, 0.40, 0.25)     # deep sand shadow
const COLOR_BONE := Color(0.95, 0.92, 0.85)         # bone white
const COLOR_PLATFORM := Color(0.65, 0.45, 0.30)     # canyon rock
const COLOR_PLATFORM_CRUMBLE := Color(0.50, 0.35, 0.20)
const COLOR_SHADOW := Color(0.25, 0.15, 0.20)       # O'Keeffe purple shadow
const COLOR_GEODE := Color(0.60, 0.35, 0.65)        # amethyst (the reward at the bottom)

signal level_started(level: int, description: String)
signal level_completed(level: int, bones: int)
signal game_completed(score: int, reward_stone: String)
signal player_died(cause: String)
signal bone_collected(count: int, total: int)

func _ready() -> void:
	_connect_systems()
	_start_level(1)

func _connect_systems() -> void:
	var gm = get_node_or_null("/root/GameManager")
	if gm and gm.has_signal("game_completed"):
		gm.game_completed.connect(_on_game_completed)

func _start_level(level: int) -> void:
	current_level = level
	score = 0
	bones_collected = 0
	sand_level = 0.0
	player_alive = true
	is_paused = false
	platforms.clear()
	crumbling_platforms.clear()
	bone_positions.clear()
	sand_particles.clear()
	
	# Sinking speed increases with depth
	sinking_speed = 50.0 + (level - 1) * 15.0
	
	# Generate level layout
	_generate_level(level)
	
	# Reset player to top
	player_pos = Vector2(640, 100)
	player_vel = Vector2.ZERO
	player_on_platform = false
	double_jump_available = level <= 1  # stripped after L1
	
	var desc: String = LEVEL_STRIPPED_MECHANICS.get(level, "The descent continues.")
	level_started.emit(level, desc)
	
	print("[Sandfall] Level " + str(level) + " started: " + desc)

func _generate_level(level: int) -> void:
	# Each level has fewer platforms and more sand
	var platform_count: int = max(3, 12 - level * 1.5)
	bones_in_level = level + 2  # more bones deeper down
	
	# Generate platforms at descending heights
	var y: float = 200.0
	for i in range(platform_count):
		var x: float = randf_range(100, 1180)
		var width: float = randf_range(80, 200) - (level * 10)  # narrower as you go deeper
		width = max(width, 40)
		
		var crumble_time: float = 3.0
		if level >= 4:
			crumble_time = 1.5  # crumble faster from L4+
		
		platforms.append({
			"pos": Vector2(x, y),
			"width": width,
			"height": 20,
			"crumble_time": crumble_time,
			"is_crumbling": false,
			"crumble_timer": 0.0
		})
		y += randf_range(80, 120)
	
	# Level 6+: remove platforms, use walls instead
	if level >= 6:
		platforms.clear()
	
	# Place bones at descending positions
	for i in range(bones_in_level):
		var bx: float = randf_range(100, 1180)
		var by: float = 200.0 + i * randf_range(80, 100)
		bone_positions.append(Vector2(bx, by))

func _physics_process(delta: float) -> void:
	if is_paused or not player_alive:
		return
	
	# Apply gravity
	player_vel.y += 400 * delta  # gravity, lighter than standard for floaty desert feel
	
	# Handle input based on level (mechanics get stripped)
	var can_move: bool = current_level <= 6
	var can_jump: bool = current_level <= 5
	var can_dash: bool = current_level <= 2
	
	if can_move:
		if Input.is_action_pressed("move_left"):
			player_vel.x = -250
			player_facing = -1
		elif Input.is_action_pressed("move_right"):
			player_vel.x = 250
			player_facing = 1
		else:
			player_vel.x = player_vel.x * 0.85  # friction
	
	# Jump
	if can_jump and Input.is_action_just_pressed("action") and player_on_platform:
		player_vel.y = -350
		player_on_platform = false
	
	# Double jump (only L1)
	if double_jump_available and Input.is_action_just_pressed("action") and not player_on_platform and player_vel.y > -50:
		player_vel.y = -300
		double_jump_available = false
	
	# Dash (L1-2 only)
	if can_dash and Input.is_action_just_pressed("interact"):
		player_vel.x = player_facing * 500
		player_vel.y *= 0.3  # slight float during dash
	
	# Apply velocity
	player_pos += player_vel * delta
	
	# Clamp to screen
	player_pos.x = clamp(player_pos.x, 20, 1260)
	
	# Sand rises (the core mechanic — the sand is always coming up)
	sand_level += sinking_speed * delta
	
	# Check sand collision (player caught by sand)
	if player_pos.y > 600 - sand_level * 0.3:
		if current_level == 7:
			# Level 7: the sand catches you = level complete (you've descended)
			_complete_level()
		else:
			_player_died("swallowed by sand")
		return
	
	# Platform collision (L1-5)
	player_on_platform = false
	if current_level <= 5:
		for i in range(platforms.size()):
			var p = platforms[i]
			if player_vel.y > 0:  # falling
				if _check_platform_landing(player_pos, p):
					player_pos.y = p["pos"].y - 10
					player_vel.y = 0
					player_on_platform = true
					double_jump_available = current_level <= 1
					
					# Start crumbling if standing on it
					if not p["is_crumbling"]:
						p["is_crumbling"] = true
					
					# Advance crumble timer
					if p["is_crumbling"]:
						p["crumble_timer"] += delta
						if p["crumble_timer"] >= p["crumble_time"]:
							# Platform crumbles away
							platforms.remove_at(i)
							break
	
	# Level 6: Wall-jumping
	if current_level == 6:
		# Check wall collisions (left and right walls are sand walls)
		if player_pos.x <= 50 and Input.is_action_just_pressed("action"):
			player_vel.x = 300
			player_vel.y = -250
		elif player_pos.x >= 1230 and Input.is_action_just_pressed("action"):
			player_vel.x = -300
			player_vel.y = -250
	
	# Level 7: No control, just falling
	if current_level == 7:
		player_vel.x = 0  # no horizontal control
		# Player falls through the bone-white void toward the geode
		if player_pos.y > 500:
			_complete_level()
	
	# Collect bones
	for i in range(bone_positions.size() - 1, -1, -1):
		if player_pos.distance_to(bone_positions[i]) < 30:
			bone_positions.remove_at(i)
			bones_collected += 1
			score += 100
			bone_collected.emit(bones_collected, bones_in_level)
	
	# Generate sand particles for visual effect
	if randf() < 0.3:
		sand_particles.append({
			"pos": Vector2(randf_range(0, 1280), 600 - sand_level * 0.3),
			"vel": Vector2(randf_range(-20, 20), -randf_range(10, 30)),
			"life": 1.0
		})
	
	# Update sand particles
	for i in range(sand_particles.size() - 1, -1, -1):
		var sp = sand_particles[i]
		sp["pos"] += sp["vel"] * delta
		sp["life"] -= delta
		if sp["life"] <= 0:
			sand_particles.remove_at(i)
	
	# Check if player reached the bottom of the level (non-L7)
	if current_level < 7 and player_pos.y > 580:
		_complete_level()

func _check_platform_landing(pos: Vector2, platform: Dictionary) -> bool:
	var px = platform["pos"].x
	var py = platform["pos"].y
	var pw = platform["width"]
	return pos.x > px - pw/2 and pos.x < px + pw/2 and \
		   pos.y > py - 15 and pos.y < py + 5

func _complete_level() -> void:
	level_completed.emit(current_level, bones_collected)
	score += bones_collected * 200
	print("[Sandfall] Level " + str(current_level) + " complete. Score: " + str(score))
	
	if current_level >= MAX_LEVELS:
		_game_complete()
	else:
		# Brief pause between levels
		is_paused = true
		await get_tree().create_timer(1.5).timeout
		_start_level(current_level + 1)

func _player_died(cause: String) -> void:
	player_alive = false
	player_died.emit(cause)
	print("[Sandfall] Player died: " + cause)
	
	# Respawn after brief delay
	await get_tree().create_timer(2.0).timeout
	_start_level(current_level)  # restart current level

func _game_complete() -> void:
	print("[Sandfall] Game complete! Final score: " + str(score))
	print("[Sandfall] Reward: Desert Rose Selenite — the stone that blooms in sand")
	
	var gm = get_node_or_null("/root/GameManager")
	if gm and gm.has_method("complete_game"):
		gm.complete_game("sandfall", score)
	
	game_completed.emit(score, "Desert Rose Selenite")
	
	# Load FizgigLoader transition back to hub
	var fl = get_node_or_null("/root/FizgigLoader")
	if fl and fl.has_method("load_zone"):
		fl.load_zone("main_floor")

func _on_game_completed(game_id: String) -> void:
	# GameManager signal — game was fully completed
	if game_id == "sandfall":
		print("[Sandfall] Completion registered with GameManager")

func _draw() -> void:
	# Sky gradient (O'Keeffe desert palette)
	var sky_rect := Rect2(0, 0, 1280, 720)
	draw_rect(sky_rect, COLOR_SKY_BOTTOM, true)
	
	# Simple gradient via overlapping rects
	for i in range(20):
		var alpha: float = float(i) / 20.0
		var c := COLOR_SKY_TOP.lerp(COLOR_SKY_BOTTOM, alpha)
		draw_rect(Rect2(0, i * 36, 1280, 36), c, true)
	
	# Sand at the bottom (rising)
	var sand_height: float = sand_level * 0.3
	if sand_height > 0:
		var sand_rect := Rect2(0, 720 - sand_height, 1280, sand_height)
		draw_rect(sand_rect, COLOR_SAND, true)
		# Sand shadow line
		draw_line(Vector2(0, 720 - sand_height), Vector2(1280, 720 - sand_height), COLOR_SAND_DARK, 3)
	
	# Platforms (canyon rock, O'Keeffe palette)
	for p in platforms:
		var color := COLOR_PLATFORM
		if p["is_crumbling"]:
			var t: float = p["crumble_timer"] / p["crumble_time"]
			color = COLOR_PLATFORM.lerp(COLOR_PLATFORM_CRUMBLE, t)
		var rect := Rect2(p["pos"].x - p["width"]/2, p["pos"].y, p["width"], p["height"])
		draw_rect(rect, color, true)
		# O'Keeffe shadow under each platform
		draw_rect(Rect2(rect.position.x, rect.position.y + rect.size.y, rect.size.x, 4), COLOR_SHADOW, true)
	
	# Level 6: Draw sand walls
	if current_level == 6:
		draw_rect(Rect2(0, 0, 40, 720), COLOR_SAND_DARK, true)
		draw_rect(Rect2(1240, 0, 40, 720), COLOR_SAND_DARK, true)
	
	# Level 7: Draw geode at the bottom
	if current_level == 7:
		var geode_center := Vector2(640, 650)
		draw_circle(geode_center, 80, COLOR_GEODE)
		draw_circle(geode_center, 60, COLOR_GEODE.lightened(0.2))
		draw_circle(geode_center, 40, COLOR_GEODE.lightened(0.4))
	
	# Bones (collectibles)
	for bp in bone_positions:
		# Simple bone shape (cross)
		draw_rect(Rect2(bp.x - 8, bp.y - 2, 16, 4), COLOR_BONE, true)
		draw_rect(Rect2(bp.x - 2, bp.y - 8, 4, 16), COLOR_BONE, true)
	
	# Sand particles
	for sp in sand_particles:
		var alpha: float = sp["life"]
		draw_circle(sp["pos"], 2, Color(COLOR_SAND.r, COLOR_SAND.g, COLOR_SAND.b, alpha))
	
	# Player (simple O'Keeffe figure — a warm brown silhouette)
	if player_alive:
		# Body
		draw_rect(Rect2(player_pos.x - 8, player_pos.y - 12, 16, 24), Color(0.45, 0.30, 0.20), true)
		# Head
		draw_circle(Vector2(player_pos.x, player_pos.y - 16), 6, Color(0.55, 0.38, 0.28))
		# Facing indicator
		var eye_x: float = player_pos.x + player_facing * 3
		draw_circle(Vector2(eye_x, player_pos.y - 17), 1.5, COLOR_BONE)
	
	# HUD text
	_draw_hud()

func _draw_hud() -> void:
	var font := get_theme_default_font()
	if font:
		# Level indicator
		var level_text := "Level " + str(current_level) + " / " + str(MAX_LEVELS)
		draw_string(font, Vector2(20, 30), level_text, HORIZONTAL_ALIGNMENT_LEFT, -1, 16, COLOR_BONE)
		
		# Level description
		var desc: String = LEVEL_STRIPPED_MECHANICS.get(current_level, "")
		draw_string(font, Vector2(20, 50), desc, HORIZONTAL_ALIGNMENT_LEFT, -1, 12, COLOR_SHADOW.lightened(0.5))
		
		# Score
		draw_string(font, Vector2(1180, 30), "Score: " + str(score), HORIZONTAL_ALIGNMENT_RIGHT, -1, 16, COLOR_BONE)
		
		# Bones
		var bone_text := "Bones: " + str(bones_collected) + " / " + str(bones_in_level)
		draw_string(font, Vector2(1180, 50), bone_text, HORIZONTAL_ALIGNMENT_RIGHT, -1, 12, COLOR_BONE)
		
		# Sand warning
		if sand_level > 400:
			draw_string(font, Vector2(640, 30), "THE SAND RISES", HORIZONTAL_ALIGNMENT_CENTER, -1, 14, Color(0.8, 0.4, 0.3))
