###
# Geode Inn — Sandfall
# An O'Keeffe-inspired sinking-sand platformer set in Egypt.
# 7 levels of descent. Each level simplifies — fewer platforms, fewer colors,
# fewer distractions. The descent IS the gameplay.
#
# Mechanic: The player sinks slowly through sand unless standing on solid ground.
# Platforms crumble after a few seconds of contact. The deeper you go,
# the faster the sand pulls. The goal is to reach the bottom of each level
# where a geode waits.
#
# Reward: Desert Rose Selenite (the stone that blooms in sand)
# Unlocks: Bone Room access
#
# Visual: Georgia O'Keeffe palette — desert bones, sky, sand, flowers
#         Simplifying as you descend: Level 1 is full O'Keeffe color,
#         Level 7 is near-monochrome bone-white.
###

extends Node2D
signal level_completed(level: int)
signal game_completed(score: int)
signal player_sank()

# === Game States ===
enum State { MENU, PLAYING, SINKING, DEAD, LEVEL_COMPLETE, GAME_COMPLETE }
var current_state: State = State.MENU

# === Level Configuration ===
const TOTAL_LEVELS: int = 7
const LEVEL_NAMES := [
	"The Bone Garden",      # L1 — Full color, many platforms
	"The Painted Desert",   # L2 — Warm tones, fewer platforms
	"The White Mesa",       # L3 — Pale, sparse
	"The Dry Riverbed",     # L4 — Brown, cracked
	"The Sand Cathedral",   # L5 — Near-white, towering
	"The Bone Room",        # L6 — Almost monochrome
	"The Geode"             # L7 — Pure white → crystal reveal
]

# === Physics Constants ===
const GRAVITY: float = 800.0
const SAND_SINK_RATE_BASE: float = 20.0  # Pixels per second in sand
const SAND_SINK_RATE_MAX: float = 60.0   # At level 7
const PLATFORM_CRUMBLE_TIME: float = 3.0  # Seconds before platform breaks
const PLAYER_SPEED: float = 250.0
const JUMP_FORCE: float = -450.0
const MAX_FALL_SPEED: float = 400.0

# === Player State ===
var player_pos: Vector2 = Vector2.ZERO
var player_vel: Vector2 = Vector2.ZERO
var player_on_ground: bool = false
var player_in_sand: bool = true
var current_level: int = 0
var score: int = 0
var lives: int = 3
var level_time: float = 0.0
var geodes_collected: int = 0

# === Level State ===
var platforms: Array[Dictionary] = []  # {pos, size, crumble_timer, alive}
var geode_pos: Vector2 = Vector2.ZERO
var sand_level: float = 0.0  # How high the sand rises
var sand_rise_rate: float = 0.0  # Pixels per second

# === O'Keeffe Color Palettes (one per level, simplifying) ===
const LEVEL_PALETTES := [
	# L1: Full O'Keeffe — rich desert
	{"sky": Color(0.95, 0.75, 0.5), "sand": Color(0.85, 0.65, 0.35), "platform": Color(0.55, 0.35, 0.25), "accent": Color(0.9, 0.3, 0.4)},
	# L2: Painted Desert — warm
	{"sky": Color(0.92, 0.7, 0.4), "sand": Color(0.8, 0.55, 0.25), "platform": Color(0.5, 0.3, 0.2), "accent": Color(0.85, 0.35, 0.3)},
	# L3: White Mesa — pale
	{"sky": Color(0.93, 0.88, 0.82), "sand": Color(0.82, 0.78, 0.72), "platform": Color(0.55, 0.52, 0.48), "accent": Color(0.7, 0.6, 0.5)},
	# L4: Dry Riverbed — brown
	{"sky": Color(0.85, 0.78, 0.68), "sand": Color(0.65, 0.55, 0.4), "platform": Color(0.4, 0.32, 0.22), "accent": Color(0.5, 0.4, 0.3)},
	# L5: Sand Cathedral — near-white
	{"sky": Color(0.95, 0.93, 0.9), "sand": Color(0.88, 0.86, 0.82), "platform": Color(0.5, 0.48, 0.45), "accent": Color(0.6, 0.58, 0.55)},
	# L6: Bone Room — monochrome
	{"sky": Color(0.92, 0.91, 0.89), "sand": Color(0.85, 0.84, 0.82), "platform": Color(0.45, 0.45, 0.43), "accent": Color(0.5, 0.5, 0.5)},
	# L7: The Geode — white → crystal
	{"sky": Color(0.98, 0.98, 0.98), "sand": Color(0.95, 0.95, 0.95), "platform": Color(0.4, 0.4, 0.4), "accent": Color(0.3, 0.8, 0.9)},
]

# === Initialization ===

func start_game() -> void:
	current_level = 0
	score = 0
	lives = 3
	geodes_collected = 0
	_load_level(0)
	
	if AudioManager:
		AudioManager.play_zone_ambient("egypt")
		AudioManager.set_mode(AudioManager.AudioMode.LIVING)
	
	current_state = State.PLAYING
	print("[Sandfall] Game started — Level 1: The Bone Garden")

func _load_level(level: int) -> void:
	current_level = level
	platforms.clear()
	level_time = 0.0
	
	# Difficulty scales with level
	var sink_rate = SAND_SINK_RATE_BASE + (float(level) / float(TOTAL_LEVELS - 1)) * (SAND_SINK_RATE_MAX - SAND_SINK_RATE_BASE)
	sand_rise_rate = sink_rate
	
	# Platform count decreases with level (simplification)
	var platform_count = int(12 - level * 1.2)  # L1=11, L7=4
	var screen_width = 1280
	var screen_height = 720
	var ground_level = screen_height - 50
	
	# Generate platforms
	for i in range(platform_count):
		var px = 100 + (screen_width - 200) * (float(i) / max(platform_count - 1, 1)) + randf_range(-50, 50)
		var py = 100 + (ground_level - 100) * (1.0 - float(i) / max(platform_count, 1))
		platforms.append({
			"pos": Vector2(px, py),
			"size": Vector2(100 - level * 5, 20),  # Smaller platforms at deeper levels
			"crumble_timer": 0.0,
			"alive": true,
		})
	
	# Geode at the bottom
	geode_pos = Vector2(screen_width / 2.0, ground_level - 30)
	
	# Player starts at top
	player_pos = Vector2(screen_width / 2.0, 50)
	player_vel = Vector2.ZERO
	player_in_sand = true
	
	print("[Sandfall] Level %d loaded: %s (%d platforms, sink rate: %.1f)" % [
		level + 1, LEVEL_NAMES[level], platform_count, sink_rate
	])

# === Main Loop ===

func _physics_process(delta: float) -> void:
	if current_state != State.PLAYING:
		return
	
	level_time += delta
	
	# Player movement
	_handle_input(delta)
	
	# Apply gravity / sand sinking
	if player_in_sand:
		# Sand: slow downward pull + horizontal resistance
		player_vel.y = min(player_vel.y + sand_rise_rate * delta, MAX_FALL_SPEED * 0.3)
		player_vel.x *= 0.92  # Sand resistance
	else:
		# Air: full gravity
		player_vel.y = min(player_vel.y + GRAVITY * delta, MAX_FALL_SPEED)
	
	# Apply velocity
	player_pos += player_vel * delta
	
	# Platform collision + crumble
	player_on_ground = false
	for platform in platforms:
		if not platform.alive:
			continue
		
		# Check landing on platform
		if _check_platform_collision(platform):
			player_pos.y = platform.pos.y - 15
			player_vel.y = 0
			player_on_ground = true
			player_in_sand = false
			
			# Start crumble timer
			platform.crumble_timer += delta
			if platform.crumble_timer >= PLATFORM_CRUMBLE_TIME:
				platform.alive = false
				# Audio: crumbling
				if AudioManager:
					AudioManager.play_stone_chime("basalt", -10.0)
	
	# Check if in sand (below ground level or no platform)
	if not player_on_ground and player_pos.y > 100:
		player_in_sand = true
	
	# Check geode collection
	if player_pos.distance_to(geode_pos) < 40:
		_collect_geode()
	
	# Check death (fell off bottom)
	if player_pos.y > 720 + 100:
		_player_died()
	
	# Check level boundaries
	player_pos.x = clamp(player_pos.x, 20, 1260)

func _handle_input(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# Horizontal movement (slower in sand)
	var speed = PLAYER_SPEED * (0.5 if player_in_sand else 1.0)
	player_vel.x = direction.x * speed
	
	# Jump (only on ground, not in sand)
	if Input.is_action_just_pressed("action") and player_on_ground and not player_in_sand:
		player_vel.y = JUMP_FORCE
		if AudioManager:
			AudioManager.play_stone_chime("desert_rose_selenite", -8.0)

func _check_platform_collision(platform: Dictionary) -> bool:
	var p_pos = platform.pos
	var p_size = platform.size
	return (player_pos.x > p_pos.x - p_size.x / 2 and
			player_pos.x < p_pos.x + p_size.x / 2 and
			player_pos.y > p_pos.y - 20 and
			player_pos.y < p_pos.y + 5)

func _collect_geode() -> void:
	geodes_collected += 1
	score += (TOTAL_LEVELS - current_level) * 100  # Deeper = more points
	
	# Audio: geode chime (ascending)
	if AudioManager:
		AudioManager.play_stone_chime("selenite", -5.0)
		await get_tree().create_timer(0.2).timeout
		AudioManager.play_stone_chime("desert_rose_selenite", -3.0)
	
	# Steam
	if SteamManager:
		SteamManager.unlock_achievement("first_stone")
	
	if current_level < TOTAL_LEVELS - 1:
		level_completed.emit(current_level)
		current_state = State.LEVEL_COMPLETE
		
		# Load next level after brief pause
		await get_tree().create_timer(1.5).timeout
		_load_level(current_level + 1)
		current_state = State.PLAYING
	else:
		# Game complete!
		current_state = State.GAME_COMPLETE
		game_completed.emit(score)
		
		if AudioManager:
			AudioManager.play_stinger("level_up")
			await get_tree().create_timer(0.5).timeout
			AudioManager.play_nine_songs_chord()
		
		if GameManager:
			GameManager.complete_game("sandfall", score)
		
		print("[Sandfall] Game complete! Score: %d, Geodes: %d" % [score, geodes_collected])

func _player_died() -> void:
	lives -= 1
	player_sank.emit()
	
	if AudioManager:
		AudioManager.play_stinger("monster_encounter")
	
	if lives <= 0:
		current_state = State.DEAD
		print("[Sandfall] Game over — no lives remaining")
	else:
		# Respawn at top of current level
		player_pos = Vector2(640, 50)
		player_vel = Vector2.ZERO
		player_in_sand = true
		print("[Sandfall] Player sank — %d lives remaining" % lives)

# === Getters ===
func get_current_palette() -> Dictionary:
	return LEVEL_PALETTES[current_level]

func get_level_name() -> String:
	return LEVEL_NAMES[current_level]

func get_progress() -> Dictionary:
	return {
		"level": current_level + 1,
		"level_name": get_level_name(),
		"total_levels": TOTAL_LEVELS,
		"score": score,
		"lives": lives,
		"geodes": geodes_collected,
		"sink_rate": sand_rise_rate,
		"palette": get_current_palette(),
	}
