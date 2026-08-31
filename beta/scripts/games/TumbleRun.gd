extends Node2D
## TumbleRun.gd — Standalone Sellable Arcade Game ($4.99)
## The Inn's fizgig mascot stars in a rolling, bouncing, getting-stuck-in-everything adventure.
## Tumble is a 4-inch ball of fur — a living crystal note of the Song of Making.
## One of the only true innocents in the game.
##
## Mechanics: Roll/bounce through obstacle courses, get stuck, wiggle free.
## 3 DLC packs planned: Crystal Caverns, Shadow Inn, Cosmic Ascent
## Bundle includes base game + all DLC
##
## Visual style: Warm Inn aesthetic — amber, gold, cream, brown fur
## Music: 50 BPM low-dub, the 42Hz hum as Tumble's "voice"
## Tumble makes no words — just a single chime when happy, a soft thud when stuck

# === Game State ===
var current_world: int = 1
const MAX_WORLDS: int = 4  # Base game: 4 worlds. DLC adds more.
var current_level: int = 1
var levels_per_world: int = 5
var score: int = 0
var gems_collected: int = 0
var is_paused: bool = false
var tumble_stuck: bool = false
var stuck_timer: float = 0.0
var wiggling_free: float = 0.0

# === Tumble Physics ===
var tumble_pos: Vector2 = Vector2(200, 300)
var tumble_vel: Vector2 = Vector2.ZERO
var tumble_radius: float = 12.0  # 4 inches in game scale
var tumble_rotation: float = 0.0
var bounce_count: int = 0
var is_grounded: bool = false
var can_boost: bool = true
var boost_cooldown: float = 0.0

# === Level Data ===
var platforms: Array[Dictionary] = []
var obstacles: Array[Dictionary] = []  # things Tumble gets stuck in
var gems: Array[Vector2] = []
var goal_pos: Vector2 = Vector2.ZERO
var camera_offset: Vector2 = Vector2.ZERO

# === World Themes ===
const WORLD_THEMES := {
	1: {"name": "The Main Floor", "palette": {"bg": "#1a1410", "accent": "#c9a44c", "platform": "#5a4a3a"}, 
	    "desc": "Roll through the Inn's great hall. Brindle sweeps up behind you."},
	2: {"name": "The Garden", "palette": {"bg": "#1a2410", "accent": "#7ba84c", "platform": "#4a5a3a"},
    "desc": "Bounce through Van Gogh's garden. Rolling in pollen. Getting stuck in flower pots."},
	3: {"name": "The Staircase", "palette": {"bg": "#2a1a1a", "accent": "#d4a04c", "platform": "#6a4a3a"},
    "desc": "Tumble down the alchemical staircase. Each step is a different resonance. Getting stuck on beakers."},
	4: {"name": "The Archive", "palette": {"bg": "#1a1a2a", "accent": "#8a7ad4", "platform": "#4a4a5a"},
    "desc": "Roll between bookshelves. Getting stuck in book bindings. Beverley watches, unimpressed."}
}

# DLC Worlds (unlocked via purchase)
const DLC_WORLDS := {
	5: {"name": "Crystal Caverns (DLC)", "palette": {"bg": "#0a1a2a", "accent": "#4cd4d4", "platform": "#3a5a6a"},
     "desc": "Bounce through geode caves. Tumble's crystal nature resonates. Light plays through you."},
	6: {"name": "Shadow Inn (DLC)", "palette": {"bg": "#0a0a0a", "accent": "#4c1a1a", "platform": "#2a1a1a"},
     "desc": "The brownies' pot-lid shields. The 84Hz frequency. Tumble is confused — the hum is wrong here."},
	7: {"name": "Cosmic Ascent (DLC)", "palette": {"bg": "#0a0a1a", "accent": "#6c4cd4", "platform": "#3a2a5a"},
     "desc": "Roll up the too-short ladder to the stars. The brownies' work finally makes sense."}
}

signal world_started(world: int, name: String, desc: String)
signal level_started(world: int, level: int)
signal level_completed(world: int, level: int, gems: int, score: int)
signal game_completed(total_score: int)

func _on_game_complete(total_score: int) -> void:
	# Audio: Nine Songs chord
	if AudioManager:
		AudioManager.play_stinger("level_up")
		AudioManager.play_nine_songs_chord()
	
	# Steam + GameManager
	if SteamManager:
		SteamManager.unlock_achievement("first_game")
	if GameManager:
		GameManager.complete_game("tumble_run", total_score)
signal tumble_stuck_event(obstacle_name: String)

func _on_tumble_stuck(obstacle_name: String) -> void:
	# Audio: Tumble got stuck — play a wobble sound
	if AudioManager:
		AudioManager.play_stone_chime("clear_quartz", -12.0)

func _on_tumble_freed() -> void:
	# Audio: Tumble wiggled free
	if AudioManager:
		AudioManager.play_stone_chime("clear_quartz", -5.0)
signal tumble_freed()
signal gem_collected(count: int)

func _on_gem_collected(count: int) -> void:
	# Audio: gem collected chime
	if AudioManager:
		AudioManager.play_stone_chime("crystal_note", -3.0)

func _ready() -> void:
	# Audio: Living mode + main floor ambient
	if AudioManager:
		AudioManager.set_mode(AudioManager.AudioMode.LIVING)
		AudioManager.play_zone_ambient("main_floor")
	
	# Steam rich presence
	if SteamManager:
		SteamManager.set_rich_presence("Tumble Run", "Rolling")
	_start_world(1)

func _start_world(world: int) -> void:
	current_world = world
	current_level = 1
	
	var theme: Dictionary = WORLD_THEMES.get(world, DLC_WORLDS.get(world, {}))
	if theme.is_empty():
		push_error("TumbleRun: Invalid world " + str(world))
		return
	
	world_started.emit(world, theme.get("name", ""), theme.get("desc", ""))
	print("[TumbleRun] World " + str(world) + ": " + theme.get("name", ""))
	_start_level()

func _start_level() -> void:
	score = 0
	gems_collected = 0
	tumble_stuck = false
	stuck_timer = 0.0
	wiggling_free = 0.0
	platforms.clear()
	obstacles.clear()
	gems.clear()
	
	# Reset Tumble to start position
	tumble_pos = Vector2(100, 400)
	tumble_vel = Vector2.ZERO
	tumble_rotation = 0.0
	bounce_count = 0
	can_boost = true
	boost_cooldown = 0.0
	
	# Generate level layout
	_generate_level()
	
	level_started.emit(current_world, current_level)
	print("[TumbleRun] World " + str(current_world) + " Level " + str(current_level) + " started")

func _generate_level() -> void:
	# Generate a side-scrolling obstacle course
	# Platform layout: ground + floating platforms + obstacles + gems + goal
	
	# Ground platforms (with gaps)
	var x: float = 0
	while x < 2400:  # level width
		var width: float = randf_range(100, 300)
		var gap: float = randf_range(50, 150) * (1 + current_level * 0.1)  # bigger gaps in later levels
		platforms.append({"pos": Vector2(x, 500), "width": width, "height": 40})
		x += width + gap
	
	# Floating platforms
	var float_count: int = 5 + current_level
	for i in range(float_count):
		platforms.append({
			"pos": Vector2(randf_range(200, 2200), randf_range(200, 400)),
			"width": randf_range(60, 120),
			"height": 20
		})
	
	# Obstacles (things Tumble gets stuck in — this is the signature mechanic)
	var obstacle_types: Array[String] = [
		"flower_pot", "book_binding", "beaker", "crystal_crevice", 
		"cobweb", "mushroom_cluster", "knotwork_gap", "pipe_bowl"
	]
	var obstacle_count: int = 3 + current_level * 2
	for i in range(obstacle_count):
		var type: String = obstacle_types[randi() % obstacle_types.size()]
		obstacles.append({
			"pos": Vector2(randf_range(300, 2100), randf_range(200, 450)),
			"type": type,
			"radius": randf_range(15, 25),
			"stuck_time": randf_range(1.0, 3.0)  # how long Tumble stays stuck
		})
	
	# Gems (collectibles — crystal notes of the Song)
	var gem_count: int = 5 + current_level
	for i in range(gem_count):
		gems.append(Vector2(randf_range(200, 2200), randf_range(150, 450)))
	
	# Goal (the level exit — a warm doorway)
	goal_pos = Vector2(2300, 400)

func _physics_process(delta: float) -> void:
	if is_paused:
		return
	
	# Update boost cooldown
	if boost_cooldown > 0:
		boost_cooldown -= delta
		if boost_cooldown <= 0:
			can_boost = true
	
	if tumble_stuck:
		_handle_stuck(delta)
		return
	
	# Gravity
	tumble_vel.y += 600 * delta
	
	# Input — Tumble rolls (left/right) and bounces (jump)
	if Input.is_action_pressed("move_left"):
		tumble_vel.x = lerp(tumble_vel.x, -300.0, 0.1)
		tumble_rotation -= 5 * delta
	elif Input.is_action_pressed("move_right"):
		tumble_vel.x = lerp(tumble_vel.x, 300.0, 0.1)
		tumble_rotation += 5 * delta
	else:
		tumble_vel.x = lerp(tumble_vel.x, 0.0, 0.05)
	
	# Bounce (jump)
	if Input.is_action_just_pressed("action") and is_grounded:
		tumble_vel.y = -450
		bounce_count += 1
		is_grounded = false
	
	# Boost (limited use — a burst of speed)
	if Input.is_action_just_pressed("interact") and can_boost:
		tumble_vel.x *= 2.5
		tumble_vel.y *= 0.5
		can_boost = false
		boost_cooldown = 2.0
	
	# Apply velocity
	tumble_pos += tumble_vel * delta
	
	# Friction
	tumble_vel.x *= 0.98
	
	# Platform collision
	is_grounded = false
	for p in platforms:
		if _check_circle_rect_collision(tumble_pos, tumble_radius, p):
			# Landed on top
			if tumble_vel.y > 0:
				tumble_pos.y = p["pos"].y - tumble_radius
				tumble_vel.y = -tumble_vel.y * 0.6  # bouncy!
				if abs(tumble_vel.y) < 50:
					tumble_vel.y = 0
					is_grounded = true
			break
	
	# Obstacle collision — Tumble gets STUCK (signature mechanic)
	for ob in obstacles:
		var dist: float = tumble_pos.distance_to(ob["pos"])
		if dist < tumble_radius + ob["radius"]:
			# Tumble is stuck!
			tumble_stuck = true
			stuck_timer = 0.0
			wiggling_free = 0.0
			tumble_vel = Vector2.ZERO
			tumble_stuck_event.emit(ob["type"])
			print("[TumbleRun] Tumble got stuck in: " + ob["type"])
			break
	
	# Gem collection
	for i in range(gems.size() - 1, -1, -1):
		if tumble_pos.distance_to(gems[i]) < tumble_radius + 8:
			gems.remove_at(i)
			gems_collected += 1
			score += 50
			gem_collected.emit(gems_collected)
	
	# Fall off bottom = respawn at last safe position
	if tumble_pos.y > 600:
		tumble_pos = Vector2(max(tumble_pos.x - 100, 100), 300)
		tumble_vel = Vector2.ZERO
		score = max(score - 25, 0)
	
	# Reach goal = level complete
	if tumble_pos.distance_to(goal_pos) < 40:
		_complete_level()
	
	# Camera follows Tumble
	camera_offset.x = lerp(camera_offset.x, tumble_pos.x - 640, 0.1)
	camera_offset.x = max(camera_offset.x, 0)

func _handle_stuck(delta: float) -> void:
	stuck_timer += delta
	
	# Player wiggles free by pressing left/right rapidly
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		wiggling_free += delta * 2.0
	else:
		wiggling_free = max(wiggling_free - delta, 0)
	
	# After enough wiggling, Tumble pops free
	if wiggling_free > 1.0:
		tumble_stuck = false
		tumble_vel = Vector2(randf_range(-100, 100), -200)  # pop out with a bounce
		tumble_freed.emit()
		print("[TumbleRun] Tumble wiggled free!")
	
	# After stuck_time, auto-free (don't frustrate the player)
	if stuck_timer > 4.0:
		tumble_stuck = false
		tumble_vel = Vector2(0, -300)
		tumble_freed.emit()

func _complete_level() -> void:
	score += gems_collected * 100
	level_completed.emit(current_world, current_level, gems_collected, score)
	print("[TumbleRun] Level complete! Score: " + str(score) + " Gems: " + str(gems_collected))
	
	if current_level >= levels_per_world:
		# World complete
		if current_world >= MAX_WORLDS:
			# Base game complete — check for DLC
			_game_complete()
		else:
			is_paused = true
			await get_tree().create_timer(1.5).timeout
			_start_world(current_world + 1)
	else:
		is_paused = true
		await get_tree().create_timer(1.0).timeout
		current_level += 1
		_start_level()

func _game_complete() -> void:
	# Check if DLC worlds are unlocked
	var has_dlc: bool = false  # In production, check ownership via Steam DLC API
	var total_worlds: int = MAX_WORLDS + (3 if has_dlc else 0)
	
	if current_world < total_worlds and has_dlc:
		is_paused = true
		await get_tree().create_timer(2.0).timeout
		_start_world(current_world + 1)
	else:
		print("[TumbleRun] Game complete! Final score: " + str(score))
		game_completed.emit(score)
		
		# Return to menu
		is_paused = true
		await get_tree().create_timer(3.0).timeout
		get_tree().change_scene_to_file("res://beta/scenes/MainMenu.tscn")

func _check_circle_rect_collision(circle_pos: Vector2, circle_r: float, rect: Dictionary) -> bool:
	var rx: float = rect["pos"].x
	var ry: float = rect["pos"].y
	var rw: float = rect["width"]
	var rh: float = rect["height"]
	
	var closest_x: float = clamp(circle_pos.x, rx, rx + rw)
	var closest_y: float = clamp(circle_pos.y, ry - rh/2, ry + rh/2)
	
	var dist: float = Vector2(circle_pos.x, circle_pos.y).distance_to(Vector2(closest_x, closest_y))
	return dist < circle_r

func _draw() -> void:
	var theme: Dictionary = WORLD_THEMES.get(current_world, DLC_WORLDS.get(current_world, WORLD_THEMES[1]))
	var palette: Dictionary = theme.get("palette", {})
	
	# Background
	var bg_color := Color.from_string(palette.get("bg", "#1a1410"), Color(0.1, 0.08, 0.06))
	draw_rect(Rect2(0, 0, 1280, 720), bg_color, true)
	
	# Translate everything by camera offset
	var offset: float = -camera_offset.x
	
	# Platforms
	var plat_color := Color.from_string(palette.get("platform", "#5a4a3a"), Color(0.35, 0.29, 0.23))
	for p in platforms:
		var px: float = p["pos"].x + offset
		if px > -200 and px < 1480:  # only draw visible
			draw_rect(Rect2(px, p["pos"].y, p["width"], p["height"]), plat_color, true)
	
	# Obstacles
	for ob in obstacles:
		var ox: float = ob["pos"].x + offset
		if ox > -50 and ox < 1330:
			# Draw as a cluster (simplified)
			var ob_color := Color.from_string(palette.get("accent", "#c9a44c"), Color(0.79, 0.64, 0.3))
			draw_circle(Vector2(ox, ob["pos"].y), ob["radius"], ob_color.darkened(0.3))
	
	# Gems
	var gem_color := Color.from_string(palette.get("accent", "#c9a44c"), Color(0.79, 0.64, 0.3))
	for g in gems:
		var gx: float = g.x + offset
		if gx > -50 and gx < 1330:
			# Crystal note shape (diamond)
			var pts := PackedVector2Array([
				Vector2(gx, g.y - 6), Vector2(gx + 5, g.y), 
				Vector2(gx, g.y + 6), Vector2(gx - 5, g.y)
			])
			draw_colored_polygon(pts, gem_color)
	
	# Goal (warm doorway)
	var goal_x: float = goal_pos.x + offset
	if goal_x > -100 and goal_x < 1380:
		draw_rect(Rect2(goal_x - 15, goal_pos.y - 30, 30, 60), Color(0.9, 0.7, 0.3), true)
		draw_rect(Rect2(goal_x - 12, goal_pos.y - 27, 24, 54), Color(0.95, 0.85, 0.5), true)
	
	# Tumble (the fizgig — 4-inch ball of fur)
	var tx: float = tumble_pos.x + offset
	# Fur body (warm brown/amber)
	draw_circle(Vector2(tx, tumble_pos.y), tumble_radius, Color(0.45, 0.32, 0.20))
	# Fur texture (slightly lighter inner)
	draw_circle(Vector2(tx, tumble_pos.y), tumble_radius - 3, Color(0.55, 0.40, 0.28))
	# Crystal spark (the living note of the Song — tiny light inside)
	if not tumble_stuck:
		draw_circle(Vector2(tx, tumble_pos.y), 3, Color(1.0, 0.9, 0.6, 0.8))
	else:
		# When stuck: no spark, just fur — Tumble is confused
		draw_circle(Vector2(tx, tumble_pos.y), 2, Color(0.4, 0.3, 0.2))
	
	# Rotation indicator (a small mark on the fur showing Tumble is rolling)
	var rot_x: float = tx + cos(tumble_rotation) * tumble_radius * 0.6
	var rot_y: float = tumble_pos.y + sin(tumble_rotation) * tumble_radius * 0.6
	draw_circle(Vector2(rot_x, rot_y), 2, Color(0.35, 0.25, 0.15))
	
	# Stuck indicator
	if tumble_stuck:
		var font := get_theme_default_font()
		if font:
			draw_string(font, Vector2(tx - 30, tumble_pos.y - 25), "STUCK!", 
				HORIZONTAL_ALIGNMENT_CENTER, -1, 12, Color(0.8, 0.5, 0.3))
			draw_string(font, Vector2(tx - 60, tumble_pos.y + 30), "Wiggle to free!", 
				HORIZONTAL_ALIGNMENT_CENTER, -1, 10, Color(0.6, 0.5, 0.4))
	
	# HUD
	_draw_hud()

func _draw_hud() -> void:
	var font := get_theme_default_font()
	if not font:
		return
	
	var theme: Dictionary = WORLD_THEMES.get(current_world, DLC_WORLDS.get(current_world, WORLD_THEMES[1]))
	var accent := Color.from_string(theme.get("palette", {}).get("accent", "#c9a44c"), Color(0.79, 0.64, 0.3))
	
	# World/Level
	draw_string(font, Vector2(20, 30), theme.get("name", "World " + str(current_world)), 
		HORIZONTAL_ALIGNMENT_LEFT, -1, 16, accent)
	draw_string(font, Vector2(20, 50), "Level " + str(current_level) + " / " + str(levels_per_world), 
		HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color(0.9, 0.85, 0.75))
	
	# Score & Gems
	draw_string(font, Vector2(1260, 30), "Score: " + str(score), 
		HORIZONTAL_ALIGNMENT_RIGHT, -1, 16, accent)
	draw_string(font, Vector2(1260, 50), "Gems: " + str(gems_collected), 
		HORIZONTAL_ALIGNMENT_RIGHT, -1, 12, Color(0.9, 0.85, 0.75))
	
	# Boost indicator
	if can_boost:
		draw_string(font, Vector2(640, 30), "BOOST READY", 
			HORIZONTAL_ALIGNMENT_CENTER, -1, 10, accent)
	else:
		draw_string(font, Vector2(640, 30), "boost recharging...", 
			HORIZONTAL_ALIGNMENT_CENTER, -1, 10, Color(0.5, 0.45, 0.35))
