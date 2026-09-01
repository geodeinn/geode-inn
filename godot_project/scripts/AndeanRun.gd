extends Node2D
## AndeanRun.gd — Temple Run-Style Endless Runner (Peru Zone)
##
## Tabletop Questline Narrative:
## "The Reader strikes the bronze gong. High in the mist-crowned Andes, upon the cloud causeways of Machu Picchu,
## the ancient Incan spirits challenge the traveler. Run along the high stone parapets as 42Hz wind-chimes echo
## through the canyon. Leap over cracked granite abysses, duck beneath ceremonial archways, and harness the sacred
## Condor Feather and Sun Disc to claim the rare Blue Opal of the Sun Temple."
##
## Artist Style: Guo Xi × Luis Royo
##   Misty ink-wash mountain vistas, cloud-wrapped precipices, ethereal distance gradients,
##   delicate brushwork linework combined with dark romantic obsidian stone textures and luminescent blue opal accents.
##
## Music Tempo: Andean pentatonic flute at 50 BPM (rhythmic, soaring, steady mountain cadence).
## Frequency System: 42Hz acoustic standing wave reverberates through the ancient stone aqueducts, stabilizing causeway tiles underfoot.

# === Game Configuration ===
const LANE_WIDTH: float = 120.0
const LANES: Array[float] = [-120.0, 0.0, 120.0]  # Left, Center, Right lanes relative to viewport center
const VIEWPORT_CENTER_X: float = 256.0
const PLAYER_Y: float = 480.0

# === Game States ===
enum State { MENU, PLAYING, PAUSED, WIN, GAME_OVER }
var current_state: State = State.MENU

# === Target Win Condition ===
const TARGET_DISTANCE_M: float = 1000.0  # 1000 meters to complete temple run and claim Blue Opal

# === Power-Up Types ===
enum PowerUpType { NONE, CONDOR_FEATHER, SUN_DISC }

# === Signals for UI Updates ===
signal score_updated(new_score: int)
signal distance_updated(distance_m: float)
signal speed_changed(current_speed: float)
signal powerup_activated(type_name: String, duration: float)
signal player_action(action_name: String)
signal game_state_changed(new_state: int)
signal pulse_42hz_echo(intensity: float)

# === Game State Variables ===
var score: int = 0
var distance_m: float = 0.0
var run_speed: float = 240.0  # Initial pixels per second
const BASE_SPEED: float = 240.0
const MAX_SPEED: float = 650.0

# Player State
var current_lane: int = 1  # 0: Left, 1: Center, 2: Right
var target_x: float = VIEWPORT_CENTER_X
var player_x: float = VIEWPORT_CENTER_X
var player_z_offset: float = 0.0

# Jump & Slide
var is_jumping: bool = false
var jump_velocity: float = 0.0
var jump_height: float = 0.0
const GRAVITY: float = 1200.0
const JUMP_IMPULSE: float = 480.0
var double_jump_available: bool = false

var is_sliding: bool = false
var slide_timer: float = 0.0
const SLIDE_DURATION: float = 0.75

# Power-Ups
var active_powerup: PowerUpType = PowerUpType.NONE
var powerup_timer: float = 0.0

# Procedural Segment Generation
var active_segments: Array[Dictionary] = []
var next_spawn_z: float = 0.0
const SEGMENT_LENGTH: float = 200.0
const VISIBLE_SEGMENTS: int = 8

# 42Hz Rhythm System
var 42hz_timer: float = 0.0
const RHYTHM_CYCLE: float = 1.2  # 50 BPM cycle

# UI Elements
@onready var ui_layer: CanvasLayer = $UILayer if has_node("UILayer") else null

func _ready() -> void:
	print_verbose("[DM/Reader]: 'The Andean flute notes rise like mist off the Incan causeway. 42Hz hums under your boots.'")
	_reset_game()
	current_state = State.PLAYING
	game_state_changed.emit(current_state)

func _reset_game() -> void:
	score = 0
	distance_m = 0.0
	run_speed = BASE_SPEED
	current_lane = 1
	player_x = VIEWPORT_CENTER_X + LANES[current_lane]
	target_x = player_x
	jump_height = 0.0
	is_jumping = false
	is_sliding = false
	active_powerup = PowerUpType.NONE
	powerup_timer = 0.0
	
	active_segments.clear()
	next_spawn_z = 0.0
	for i in range(VISIBLE_SEGMENTS):
		_spawn_segment()

func _process(delta: float) -> void:
	if current_state != State.PLAYING:
		return
	
	# Update 42Hz acoustic standing wave rhythm
	42hz_timer += delta
	if 42hz_timer >= RHYTHM_CYCLE:
		42hz_timer = 0.0
		pulse_42hz_echo.emit(run_speed / MAX_SPEED)
	
	# Update distance & speed
	var speed_growth: float = (distance_m / TARGET_DISTANCE_M) * (MAX_SPEED - BASE_SPEED)
	run_speed = clamp(BASE_SPEED + speed_growth, BASE_SPEED, MAX_SPEED)
	distance_m += (run_speed * delta) / 50.0  # Convert speed to meters
	
	distance_updated.emit(distance_m)
	speed_changed.emit(run_speed)
	
	# Check Win Condition
	if distance_m >= TARGET_DISTANCE_M:
		_win()
		return
	
	# Handle Player Lane Interpolation
	target_x = VIEWPORT_CENTER_X + LANES[current_lane]
	player_x = move_toward(player_x, target_x, 800.0 * delta)
	
	# Physics: Jump
	if is_jumping:
		jump_height += jump_velocity * delta
		jump_velocity -= GRAVITY * delta
		if jump_height <= 0.0:
			jump_height = 0.0
			is_jumping = false
			double_jump_available = false
	
	# Physics: Slide
	if is_sliding:
		slide_timer -= delta
		if slide_timer <= 0.0:
			is_sliding = false
	
	# Handle Power-Up Timer
	if active_powerup != PowerUpType.NONE:
		powerup_timer -= delta
		if powerup_timer <= 0.0:
			print("[DM/Reader]: 'The energy of the power-up fades into the mountain mist.'")
			active_powerup = PowerUpType.NONE
			powerup_activated.emit("None", 0.0)
	
	# Input Handling
	_handle_input()
	
	# Update Procedural Segments & Check Collisions
	_update_segments(delta)
	
	queue_redraw()

func _handle_input() -> void:
	# Lane Switch Left
	if Input.is_action_just_pressed("ui_left") and current_lane > 0:
		current_lane -= 1
		player_action.emit("lane_left")
	
	# Lane Switch Right
	if Input.is_action_just_pressed("ui_right") and current_lane < 2:
		current_lane += 1
		player_action.emit("lane_right")
	
	# Jump
	if Input.is_action_just_pressed("ui_up"):
		if not is_jumping:
			is_jumping = true
			jump_velocity = JUMP_IMPULSE
			jump_height = 1.0
			is_sliding = false
			player_action.emit("jump")
			if active_powerup == PowerUpType.CONDOR_FEATHER:
				double_jump_available = true
		elif double_jump_available:
			# Condor Feather Double Jump!
			jump_velocity = JUMP_IMPULSE * 1.1
			double_jump_available = false
			player_action.emit("double_jump")
			print("[DM/Reader]: 'The Condor Feather grants second wind above the clouds!'")
	
	# Slide
	if Input.is_action_just_pressed("ui_down"):
		if not is_sliding and not is_jumping:
			is_sliding = true
			slide_timer = SLIDE_DURATION
			player_action.emit("slide")

func _spawn_segment() -> void:
	var seg_type: String = "clear"
	var obstacle_lane: int = randi() % 3
	var obstacle_type: String = ""
	var powerup_spawn: PowerUpType = PowerUpType.NONE
	var shard_lane: int = randi() % 3
	
	if next_spawn_z > 400.0:  # Allow starting buffer
		var roll := randf()
		if roll < 0.35:
			obstacle_type = "low_hurdle"  # Must Jump
		elif roll < 0.65:
			obstacle_type = "high_arch"    # Must Slide
		elif roll < 0.85:
			obstacle_type = "pit_trap"     # Must Jump / Change Lane
		else:
			obstacle_type = "granite_pillar" # Must Change Lane
		
		# Powerup spawn chance
		if randf() < 0.15:
			powerup_spawn = PowerUpType.CONDOR_FEATHER if randf() < 0.5 else PowerUpType.SUN_DISC
	
	active_segments.append({
		"z": next_spawn_z,
		"obstacle_type": obstacle_type,
		"obstacle_lane": obstacle_lane,
		"shard_lane": shard_lane,
		"has_shard": (randf() < 0.7),
		"shard_collected": false,
		"powerup_type": powerup_spawn,
		"powerup_collected": false
	})
	
	next_spawn_z += SEGMENT_LENGTH

func _update_segments(delta: float) -> void:
	var move_dist := run_speed * delta
	var to_remove: Array = []
	
	for seg in active_segments:
		seg["z"] -= move_dist
		
		# Sun Disc magnet effect (auto-collect shards)
		if active_powerup == PowerUpType.SUN_DISC and seg["has_shard"] and not seg["shard_collected"]:
			if seg["z"] < 400.0 and seg["z"] > 0.0:
				seg["shard_collected"] = true
				score += 50
				score_updated.emit(score)
		
		# Collision Zone with Player (Z near player's Y level)
		if seg["z"] <= 80.0 and seg["z"] >= -20.0:
			_check_segment_collision(seg)
		
		if seg["z"] < -SEGMENT_LENGTH:
			to_remove.append(seg)
	
	for seg in to_remove:
		active_segments.erase(seg)
		_spawn_segment()

func _check_segment_collision(seg: Dictionary) -> void:
	# Shard Pickup
	if seg["has_shard"] and not seg["shard_collected"]:
		if seg["shard_lane"] == current_lane and jump_height < 80.0:
			seg["shard_collected"] = true
			score += 50
			score_updated.emit(score)
	
	# Power-up Pickup
	if seg["powerup_type"] != PowerUpType.NONE and not seg["powerup_collected"]:
		if seg["shard_lane"] == current_lane:
			seg["powerup_collected"] = true
			_activate_powerup(seg["powerup_type"])
	
	# Obstacle Collision
	if seg["obstacle_type"] != "" and seg["obstacle_lane"] == current_lane:
		# If Sun Disc active -> invincible!
		if active_powerup == PowerUpType.SUN_DISC:
			# Destroy obstacle with golden solar shockwave
			seg["obstacle_type"] = ""
			score += 100
			score_updated.emit(score)
			print("[DM/Reader]: 'The Sun Disc incinerates the Incan barrier!'")
			return
		
		var hit := false
		match seg["obstacle_type"]:
			"low_hurdle":
				if jump_height < 30.0:
					hit = true
			"high_arch":
				if not is_sliding:
					hit = true
			"pit_trap":
				if jump_height < 20.0:
					hit = true
			"granite_pillar":
				hit = true
		
		if hit:
			_player_crash(seg["obstacle_type"])

func _activate_powerup(p_type: PowerUpType) -> void:
	active_powerup = p_type
	powerup_timer = 8.0 if p_type == PowerUpType.CONDOR_FEATHER else 6.0
	
	var name_str := "Condor Feather" if p_type == PowerUpType.CONDOR_FEATHER else "Sun Disc"
	powerup_activated.emit(name_str, powerup_timer)
	print("[DM/Reader]: 'Acquired %s power-up!'" % name_str)

func _player_crash(obstacle_name: String) -> void:
	current_state = State.GAME_OVER
	game_state_changed.emit(current_state)
	print("[DM/Reader]: 'Stumbled on %s! Fallen into the misty Andean canyon.'" % obstacle_name)

func _win() -> void:
	current_state = State.WIN
	game_state_changed.emit(current_state)
	print("=== ANDEAN RUN COMPLETE ===")
	print("The sacred Blue Opal of the Sun Temple has been claimed!")
	
	# Notify GameManager
	if Engine.has_singleton("GameManager") or get_node_or_null("/root/GameManager"):
		var gm = get_node_or_null("/root/GameManager")
		if gm and gm.has_method("complete_game"):
			gm.complete_game("andean_run", score)
	
	# Load FizgigLoader transition
	if Engine.has_singleton("FizgigLoader") or get_node_or_null("/root/FizgigLoader"):
		var fl = get_node_or_null("/root/FizgigLoader")
		if fl and fl.has_method("load_zone"):
			fl.load_zone("andean_run")

# === Rendering ===
func _draw() -> void:
	# Guo Xi Ink-Wash Mountain Backdrop
	var bg_rect := Rect2(0, 0, 512, 600)
	draw_rect(bg_rect, Color(0.08, 0.1, 0.12), true)  # Deep misty blue-gray background
	
	# Distant misty mountains (Guo Xi brush style)
	var mist_color := Color(0.2, 0.25, 0.3, 0.5)
	for m in range(4):
		var points := PackedVector2Array([
			Vector2(0, 200 + m * 50),
			Vector2(120, 140 + m * 40),
			Vector2(256, 180 + m * 30),
			Vector2(380, 130 + m * 50),
			Vector2(512, 220 + m * 40),
			Vector2(512, 600),
			Vector2(0, 600)
		])
		draw_polygon(points, [mist_color])
	
	# Draw Incan Causeways & Segments
	for seg in active_segments:
		var z: float = seg["z"]
		if z < 0.0 or z > 600.0:
			continue
		
		# Perspective scaling (perspective projection)
		var scale_factor: float = clamp(1.0 - (z / 600.0), 0.15, 1.0)
		var screen_y: float = lerp(220.0, PLAYER_Y, scale_factor)
		var track_width: float = 360.0 * scale_factor
		
		# Causeway stone road tile
		var road_rect := Rect2(
			VIEWPORT_CENTER_X - track_width / 2.0,
			screen_y,
			track_width,
			16.0 * scale_factor
		)
		draw_rect(road_rect, Color(0.35, 0.32, 0.3), true)
		draw_rect(road_rect, Color(0.2, 0.18, 0.16), false, 1.0)
		
		# Draw Obstacle if present
		if seg["obstacle_type"] != "":
			var obs_lane: int = seg["obstacle_lane"]
			var obs_x: float = VIEWPORT_CENTER_X + LANES[obs_lane] * scale_factor
			var obs_pos := Vector2(obs_x, screen_y)
			
			match seg["obstacle_type"]:
				"low_hurdle":
					# Wood/Stone Hurdle
					draw_rect(Rect2(obs_pos.x - 20 * scale_factor, obs_pos.y - 25 * scale_factor, 40 * scale_factor, 20 * scale_factor), Color(0.7, 0.4, 0.2), true)
				"high_arch":
					# Overhead Sun Archway
					draw_rect(Rect2(obs_pos.x - 25 * scale_factor, obs_pos.y - 65 * scale_factor, 50 * scale_factor, 25 * scale_factor), Color(0.5, 0.45, 0.4), true)
				"pit_trap":
					# Pit Abyss (Black gap)
					draw_rect(Rect2(obs_pos.x - 25 * scale_factor, obs_pos.y, 50 * scale_factor, 15 * scale_factor), Color(0.02, 0.02, 0.02), true)
				"granite_pillar":
					# Incan Monolith
					draw_rect(Rect2(obs_pos.x - 18 * scale_factor, obs_pos.y - 50 * scale_factor, 36 * scale_factor, 50 * scale_factor), Color(0.3, 0.35, 0.4), true)
		
		# Draw Blue Opal Shards
		if seg["has_shard"] and not seg["shard_collected"]:
			var shard_x: float = VIEWPORT_CENTER_X + LANES[seg["shard_lane"]] * scale_factor
			var shard_pos := Vector2(shard_x, screen_y - 20 * scale_factor)
			draw_circle(shard_pos, 6.0 * scale_factor, Color(0.3, 0.7, 1.0))  # Luminescent Blue Opal
		
		# Draw Powerups
		if seg["powerup_type"] != PowerUpType.NONE and not seg["powerup_collected"]:
			var p_x: float = VIEWPORT_CENTER_X + LANES[seg["shard_lane"]] * scale_factor
			var p_pos := Vector2(p_x, screen_y - 30 * scale_factor)
			var p_col := Color(0.9, 0.9, 0.3) if seg["powerup_type"] == PowerUpType.CONDOR_FEATHER else Color(1.0, 0.6, 0.1)
			draw_circle(p_pos, 9.0 * scale_factor, p_col)
	
	# Draw Runner (Player)
	var player_draw_y: float = PLAYER_Y - jump_height
	var p_rect: Rect2
	if is_sliding:
		p_rect = Rect2(player_x - 16, player_draw_y + 10, 32, 16)
	else:
		p_rect = Rect2(player_x - 12, player_draw_y - 32, 24, 32)
	
	var player_col := Color(0.85, 0.3, 0.2)  # Andean Runner tunic
	if active_powerup == PowerUpType.SUN_DISC:
		player_col = Color(1.0, 0.85, 0.2)  # Glowing Sun Disc Invincibility
	
	draw_rect(p_rect, player_col, true)

# === NAVIGATION ===
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/Arcade.tscn")
