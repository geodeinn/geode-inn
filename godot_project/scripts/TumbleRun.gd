# TumbleRun.gd — Geode Inn Arcade Game
# 2D skill game: guide Tumble (the baby dragon) through the Inn's corridors
# collecting stones while avoiding hazards. Inspired by classic endless runners.
# Target: Steam ($4.99), Godot 4.x, cross-platform
# Uses shared autoloads: AudioManager, ControllerManager, OverlayManager, FrequencyShift, SteamManager

extends Node2D

# === SIGNALS ===
signal stone_collected(stone_name: String)
signal hazard_hit(damage: int)
signal level_complete(zone_name: String)
signal score_changed(new_score: int)
signal lives_changed(lives_remaining: int)

# === CONSTANTS ===
const BASE_SPEED := 250.0
const MAX_SPEED := 600.0
const SPEED_INCREMENT := 5.0
const GRAVITY := 900.0
const JUMP_FORCE := -450.0
const DOUBLE_JUMP_FORCE := -380.0
const GROUND_Y := 500.0
const CEILING_Y := 100.0
const PLAYER_X := 200.0
const STONE_SPAWN_MIN := 0.8
const STONE_SPAWN_MAX := 2.0
const HAZARD_SPAWN_MIN := 1.5
const HAZARD_SPAWN_MAX := 3.5

# === ZONES (ordered by difficulty) ===
const ZONES := [
	{"name": "Main Floor", "bg": "res://assets/zones/main_floor.png", "music": "res://audio/main_floor.ogg", "speed_mult": 1.0, "hazard_freq": 1.0},
	{"name": "The Archive", "bg": "res://assets/zones/archive.png", "music": "res://audio/archive.ogg", "speed_mult": 1.15, "hazard_freq": 1.2},
	{"name": "The Staircase", "bg": "res://assets/zones/staircase.png", "music": "res://audio/staircase.ogg", "speed_mult": 1.3, "hazard_freq": 1.4},
	{"name": "The Catacombs", "bg": "res://assets/zones/catacombs.png", "music": "res://audio/catacombs.ogg", "speed_mult": 1.5, "hazard_freq": 1.6},
	{"name": "Fae Kingdom", "bg": "res://assets/zones/fae_kingdom.png", "music": "res://audio/fae_kingdom.ogg", "speed_mult": 1.7, "hazard_freq": 1.8},
	{"name": "Gorgon's Garden", "bg": "res://assets/zones/gorgons_garden.png", "music": "res://audio/gorgons_garden.ogg", "speed_mult": 2.0, "hazard_freq": 2.0}
]

# === STONE POOL (rarity tiers) ===
const STONE_POOL_COMMON := ["Amethyst", "Quartz", "Agate", "Jasper", "Tiger's Eye"]
const STONE_POOL_UNCOMMON := ["Labradorite", "Moonstone", "Sodalite", "Bloodstone", "Fluorite"]
const STONE_POOL_RARE := ["Tanzanite", "Alexandrite", "Sugilite", "Larimar", "Black Tourmaline"]
const STONE_POOL_LEGENDARY := ["Preseli Blue Stone", "River Diamond", "Dreamtime Opal", "Starlight Crystal"]

# === STATE ===
var score: int = 0
var lives: int = 3
var current_zone: int = 0
var current_speed: float = BASE_SPEED
var stones_collected: Dictionary = {}
var distance: float = 0.0
var zone_distance: float = 0.0
const ZONE_LENGTH: float = 5000.0

# Player state
var player_y: float = GROUND_Y
var player_velocity: float = 0.0
var can_double_jump: bool = true
var is_grounded: bool = true
var invulnerable: float = 0.0

# Spawning
var stone_timer: float = 0.0
var hazard_timer: float = 0.0
var next_stone_time: float = 1.0
var next_hazard_time: float = 2.0

# Active objects
var active_stones: Array = []
var active_hazards: Array = []
var active_particles: Array = []

# Nodes
@onready var player_sprite: Sprite2D
@onready var background: Sprite2D
@onready var parallax_bg: ParallaxBackground
@onready var score_label: Label
@onready var lives_label: Label
@onready var zone_label: Label

# === LIFECYCLE ===

func _ready() -> void:
	randomize()
	_load_zone(0)
	_spawn_player()
	score_changed.emit(score)
	lives_changed.emit(lives)

func _process(delta: float) -> void:
	_update_player(delta)
	_process_input()
	_update_spawning(delta)
	_update_objects(delta)
	_update_zone_progress(delta)
	_update_invulnerability(delta)

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_grounded:
		player_velocity += GRAVITY * delta
		player_y += player_velocity * delta
		
		# Ground collision
		if player_y >= GROUND_Y:
			player_y = GROUND_Y
			player_velocity = 0.0
			is_grounded = true
			can_double_jump = true
		
		# Ceiling collision
		if player_y <= CEILING_Y:
			player_y = CEILING_Y
			player_velocity = 0.0

# === PLAYER ===

func _update_player(delta: float) -> void:
	if player_sprite:
		player_sprite.position.y = player_y
	
	# Gradually increase speed
	current_speed = min(current_speed + SPEED_INCREMENT * delta, MAX_SPEED)
	distance += current_speed * delta

func _spawn_player() -> void:
	player_sprite = Sprite2D.new()
	player_sprite.texture = preload("res://assets/sprites/tumble.png")
	player_sprite.position = Vector2(PLAYER_X, GROUND_Y)
	player_sprite.scale = Vector2(0.5, 0.5)
	add_child(player_sprite)

func jump() -> void:
	if is_grounded:
		player_velocity = JUMP_FORCE
		is_grounded = false
		if AudioManager: AudioManager.play_sfx("res://assets/audio/sfx/jump.wav")
		else: _play_sfx("jump")
	elif can_double_jump:
		player_velocity = DOUBLE_JUMP_FORCE
		can_double_jump = false
		if AudioManager: AudioManager.play_sfx("res://assets/audio/sfx/double_jump.wav")
		else: _play_sfx("double_jump")
		_spawn_jump_particles()

func duck() -> void:
	# Quick dive for hazards above
	if is_grounded:
		player_velocity = 200.0
		is_grounded = false

# === SPAWNING ===

func _update_spawning(delta: float) -> void:
	var zone = ZONES[current_zone]
	
	stone_timer += delta
	if stone_timer >= next_stone_time:
		stone_timer = 0.0
		next_stone_time = randf_range(STONE_SPAWN_MIN, STONE_SPAWN_MAX)
		_spawn_stone()
	
	hazard_timer += delta
	if hazard_timer >= next_hazard_time:
		hazard_timer = 0.0
		next_hazard_time = randf_range(HAZARD_SPAWN_MIN, HAZARD_SPAWN_MAX) / zone.hazard_freq
		_spawn_hazard()

func _spawn_stone() -> void:
	var stone_node = Sprite2D.new()
	var stone_name = _pick_stone()
	stone_node.texture = _get_stone_texture(stone_name)
	stone_node.position = Vector2(get_viewport().get_visible_rect().size.x + 50, randf_range(CEILING_Y + 50, GROUND_Y - 50))
	stone_node.scale = Vector2(0.3, 0.3)
	stone_node.set_meta("stone_name", stone_name)
	stone_node.set_meta("type", "stone")
	active_stones.append(stone_node)
	add_child(stone_node)

func _spawn_hazard() -> void:
	var zone = ZONES[current_zone]
	var hazard_node = Area2D.new()
	
	# Zone-specific hazards
	var hazard_type = _pick_hazard_for_zone(current_zone)
	hazard_node.set_meta("type", "hazard")
	hazard_node.set_meta("hazard_type", hazard_type)
	
	# Position: ground, ceiling, or mid-air
	var pos_y: float
	match randi() % 3:
		0: pos_y = GROUND_Y - 30  # ground hazard
		1: pos_y = CEILING_Y + 30  # ceiling hazard
		2: pos_y = randf_range(CEILING_Y + 80, GROUND_Y - 80)  # mid-air
	
	hazard_node.position = Vector2(get_viewport().get_visible_rect().size.x + 50, pos_y)
	
	# Collision shape
	var col_shape = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	shape.size = Vector2(40, 40)
	col_shape.shape = shape
	hazard_node.add_child(col_shape)
	
	# Visual
	var hazard_sprite = Sprite2D.new()
	hazard_sprite.texture = _get_hazard_texture(hazard_type)
	hazard_sprite.scale = Vector2(0.4, 0.4)
	hazard_node.add_child(hazard_sprite)
	
	active_hazards.append(hazard_node)
	add_child(hazard_node)

# === OBJECT UPDATES ===

func _update_objects(delta: float) -> void:
	var move_amount = current_speed * delta
	
	# Move stones
	for i in range(active_stones.size() - 1, -1, -1):
		var stone = active_stones[i]
		stone.position.x -= move_amount
		
		# Check collection
		if abs(stone.position.x - PLAYER_X) < 40 and abs(stone.position.y - player_y) < 40:
			var stone_name = stone.get_meta("stone_name")
			_collect_stone(stone_name)
			stone.queue_free()
			active_stones.remove_at(i)
			continue
		
		# Off screen
		if stone.position.x < -100:
			stone.queue_free()
			active_stones.remove_at(i)
	
	# Move hazards
	for i in range(active_hazards.size() - 1, -1, -1):
		var hazard = active_hazards[i]
		hazard.position.x -= move_amount
		
		# Check collision
		if invulnerable <= 0 and abs(hazard.position.x - PLAYER_X) < 35 and abs(hazard.position.y - player_y) < 35:
			var hazard_type = hazard.get_meta("hazard_type")
			_take_damage(hazard_type)
			hazard.queue_free()
			active_hazards.remove_at(i)
			continue
		
		# Off screen
		if hazard.position.x < -100:
			hazard.queue_free()
			active_hazards.remove_at(i)
	
	# Update particles
	for i in range(active_particles.size() - 1, -1, -1):
		var particle = active_particles[i]
		particle.position.x -= move_amount * 0.5
		particle.modulate.a -= delta * 2.0
		if particle.modulate.a <= 0:
			particle.queue_free()
			active_particles.remove_at(i)

# === ZONE PROGRESSION ===

func _update_zone_progress(delta: float) -> void:
	zone_distance += current_speed * delta
	
	if zone_distance >= ZONE_LENGTH:
		_complete_zone()
		_next_zone()

func _load_zone(zone_index: int) -> void:
	current_zone = zone_index
	zone_distance = 0.0
	var zone = ZONES[zone_index]
	# Apply frequency state difficulty multiplier
	var freq_mult = 1.0
	if FrequencyShift:
		freq_mult = FrequencyShift.get_difficulty_multiplier()
	current_speed = BASE_SPEED * zone.speed_mult * freq_mult
	
	# Play zone transition SFX
	_play_sfx("zone_transition")
	
	if zone_label:
		zone_label.text = zone.name
	
	if background:
		background.texture = load(zone.bg)
	
	_play_music(zone.music)
	level_complete.emit(zone.name)

func _complete_zone() -> void:
	# Award zone completion bonus
	score += 500
	score_changed.emit(score)
	
	# Spawn bonus stones
	for i in range(3):
		_spawn_stone()

func _next_zone() -> void:
	if current_zone < ZONES.size() - 1:
		_load_zone(current_zone + 1)
		# Zone-based achievements
		if current_zone >= 3 and SteamManager:
			SteamManager.unlock_achievement("tumble_zone_diver")
		if current_zone >= 1 and SteamManager:
			SteamManager.unlock_achievement("tumble_first_steps")
	else:
		# All zones complete — loop with increased difficulty
		current_speed = BASE_SPEED * 2.5
		_load_zone(0)
		if SteamManager:
			SteamManager.unlock_achievement("tumble_gorgon_slayer")
			if FrequencyShift and FrequencyShift.is_shadow():
				SteamManager.unlock_achievement("tumble_shadow_walker")
			if lives == 3:
				SteamManager.unlock_achievement("tumble_perfect")

# === COLLECTION & DAMAGE ===

func _collect_stone(stone_name: String) -> void:
	var points = _get_stone_points(stone_name)
	# Apply Shadow mode rarity bonus to score
	if FrequencyShift and FrequencyShift.is_shadow():
		points = int(points * 1.15)
	score += points
	score_changed.emit(score)
	
	if not stones_collected.has(stone_name):
		stones_collected[stone_name] = 0
	stones_collected[stone_name] += 1
	
	stone_collected.emit(stone_name)
	
	# Play rarity-appropriate SFX
	if stone_name in STONE_POOL_LEGENDARY:
		_play_sfx("collect_legendary")
		if SteamManager: SteamManager.unlock_achievement("tumble_legendary")
	elif stone_name in STONE_POOL_RARE:
		_play_sfx("collect_rare")
	elif stone_name in STONE_POOL_UNCOMMON:
		_play_sfx("collect_uncommon")
	else:
		_play_sfx("collect_common")
	
	# Play stone tone trigger (Mohs to frequency, -12dB below SFX)
	if AudioManager:
		AudioManager.play_stone_tone(stone_name)
	
	# Controller rumble on rare/legendary
	if ControllerManager:
		if stone_name in STONE_POOL_LEGENDARY:
			ControllerManager.rumble(0.8, 1.0, 0.5)
		elif stone_name in STONE_POOL_RARE:
			ControllerManager.rumble(0.4, 0.6, 0.3)
	
	_spawn_collect_particles(points)
	
	# Check stone collector achievement
	var total_stones = 0
	for count in stones_collected.values():
		total_stones += count
	if total_stones >= 50 and SteamManager:
		SteamManager.unlock_achievement("tumble_collector")

func _take_damage(hazard_type: String) -> void:
	lives -= 1
	lives_changed.emit(lives)
	hazard_hit.emit(1)
	invulnerable = 2.0
	
	_play_sfx("hit")
	_screen_shake()
	if ControllerManager:
		ControllerManager.rumble(1.0, 0.8, 0.4)
	
	if lives <= 0:
		_game_over()

func _update_invulnerability(delta: float) -> void:
	if invulnerable > 0:
		invulnerable -= delta
		# Flicker player sprite
		if player_sprite:
			player_sprite.visible = fmod(invulnerable, 0.2) < 0.1

# === HELPERS ===

func _pick_stone() -> String:
	var roll = randf()
	if roll < 0.05:
		return STONE_POOL_LEGENDARY[randi() % STONE_POOL_LEGENDARY.size()]
	elif roll < 0.20:
		return STONE_POOL_RARE[randi() % STONE_POOL_RARE.size()]
	elif roll < 0.50:
		return STONE_POOL_UNCOMMON[randi() % STONE_POOL_UNCOMMON.size()]
	else:
		return STONE_POOL_COMMON[randi() % STONE_POOL_COMMON.size()]

func _get_stone_points(stone_name: String) -> int:
	if stone_name in STONE_POOL_LEGENDARY:
		return 500
	elif stone_name in STONE_POOL_RARE:
		return 200
	elif stone_name in STONE_POOL_UNCOMMON:
		return 100
	else:
		return 50

func _pick_hazard_for_zone(zone: int) -> String:
	match zone:
		0: return ["candle_flame", "book_avalanche", "crystal_shard"].pick_random()
		1: return ["falling_tome", "ink_spill", "paper_cut"].pick_random()
		2: return ["gargoyle_eye", "alchemy_vapor", "shifting_step"].pick_random()
		3: return ["bone_pile", "petrify_ray", "undead_hand"].pick_random()
		4: return ["fae_thorn", "glamour_trap", "wild_magic"].pick_random()
		5: return ["petrify_wave", "stone_shard", "medusa_gaze"].pick_random()
		_: return "generic_hazard"

func _get_stone_texture(stone_name: String) -> Texture2D:
	# Load from Base44 CDN or local assets
	var path = "res://assets/stones/" + stone_name.to_lower().replace(" ", "_") + ".png"
	if ResourceLoader.exists(path):
		return load(path)
	return preload("res://assets/sprites/placeholder_stone.png")

func _get_hazard_texture(hazard_type: String) -> Texture2D:
	var path = "res://assets/hazards/" + hazard_type + ".png"
	if ResourceLoader.exists(path):
		return load(path)
	return preload("res://assets/sprites/placeholder_hazard.png")

func _spawn_collect_particles(points: int) -> void:
	var particle = CPUParticles2D.new()
	particle.position = Vector2(PLAYER_X, player_y)
	particle.amount = 10 if points <= 100 else 20
	particle.gravity = Vector2(0, -200)
	particle.initial_velocity_min = 50.0
	particle.initial_velocity_max = 150.0
	particle.lifetime = 0.5
	particle.one_shot = true
	particle.emitting = true
	add_child(particle)
	active_particles.append(particle)

func _spawn_jump_particles() -> void:
	var particle = CPUParticles2D.new()
	particle.position = Vector2(PLAYER_X, GROUND_Y)
	particle.amount = 5
	particle.gravity = Vector2(0, 300)
	particle.initial_velocity_min = 30.0
	particle.initial_velocity_max = 80.0
	particle.lifetime = 0.3
	particle.one_shot = true
	particle.emitting = true
	add_child(particle)
	active_particles.append(particle)

func _screen_shake() -> void:
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(randf_range(-8, 8), randf_range(-8, 8)), 0.05)
	tween.tween_property(self, "position", Vector2.ZERO, 0.05)

func _play_sfx(sound_name: String) -> void:
	# Route through AudioManager autoload for bus routing, pooling, and frequency modulation
	var sfx_path = "res://assets/audio/sfx/" + sound_name + ".wav"
	if AudioManager and ResourceLoader.exists(sfx_path):
		AudioManager.play_sfx(sfx_path)
	elif AudioManager:
		# Fallback: try old path
		var old_path = "res://audio/sfx/" + sound_name + ".wav"
		if ResourceLoader.exists(old_path):
			AudioManager.play_sfx(old_path)
	else:
		# Last resort: direct playback
		var path = "res://audio/sfx/" + sound_name + ".wav"
		if ResourceLoader.exists(path):
			var stream = load(path)
			var player = AudioStreamPlayer.new()
			player.stream = stream
			add_child(player)
			player.play()
			await player.finished
			player.queue_free()

func _play_music(music_path: String) -> void:
	# Route through AudioManager for crossfade, DSP profile, and frequency layer
	if AudioManager:
		AudioManager.play_zone_music(ZONES[current_zone].name.to_lower())
	# Also apply frequency shift for this zone
	if FrequencyShift:
		var zone_name = ZONES[current_zone].name.to_lower()
		match zone_name:
			"gorgon's garden":
				FrequencyShift.shift_to_shadow()
			_:
				FrequencyShift.shift_to_living()
	# Rumble controller on zone change
	if ControllerManager:
		ControllerManager.rumble(0.3, 0.5, 0.3)

# === GAME STATE ===

func _game_over() -> void:
	_play_sfx("game_over")
	if SteamManager and score >= 10000:
		SteamManager.unlock_achievement("tumble_speed_demon")
	_save_score()
	get_tree().change_scene_to_file("res://scenes/GameOver.tscn")

func _save_score() -> void:
	# Submit to Leaderboard entity via Base44 API
	var collected_array = []
	for stone_name in stones_collected.keys():
		collected_array.append({"name": stone_name, "count": stones_collected[stone_name]})
	
	# APIManager.gd handles the actual HTTP request
	# APIManager.submit_score("tumble_run", score, collected_array, current_zone)
	print("Score saved: ", score, " | Zone: ", ZONES[current_zone].name, " | Stones: ", stones_collected.size())

# === INPUT ===

func _input(event: InputEvent) -> void:
	# Touch input (mobile)
	if event is InputEventScreenTouch:
		if event.pressed:
			jump()
	# Keyboard input
	elif event is InputEventKey:
		if event.pressed:
			match event.keycode:
				KEY_SPACE, KEY_UP, KEY_W:
					jump()
				KEY_DOWN, KEY_S:
					duck()
				KEY_ESCAPE:
					_toggle_pause()
	# Joypad button input (Bluetooth controllers)
	elif event is InputEventJoypadButton:
		if event.pressed:
			match event.button_index:
				0, 1:  # A/X/Cross — jump
					jump()
				13, 15:  # D-pad down — duck
					duck()
				6, 4:  # Start/Options/Select — pause
					_toggle_pause()

func _process_input() -> void:
	# Called from _process for continuous controller input
	if ControllerManager and ControllerManager.is_controller_active():
		# Check jump via controller action
		if ControllerManager.get_action_just_pressed("action"):
			jump()
		# Check duck via controller
		if ControllerManager.get_action_pressed("cancel") or ControllerManager.get_action_pressed("down"):
			duck()
		# Check pause via start button
		if ControllerManager.get_action_just_pressed("start"):
			_toggle_pause()
		# Overlay toggle is handled by OverlayManager automatically

func _toggle_pause() -> void:
	get_tree().paused = !get_tree().paused
	if get_tree().paused:
		# Show pause indicator
		pass
	else:
		pass

func _on_controller_connected(device_id: int, controller_type: String) -> void:
	print("[TumbleRun] Controller connected: %s" % controller_type)
	if ControllerManager:
		ControllerManager.rumble(0.3, 0.3, 0.2)  # Brief rumble to confirm

# === PUBLIC API (for external calls) ===

func get_score() -> int:
	return score

func get_stones_collected() -> Dictionary:
	return stones_collected

func get_current_zone_name() -> String:
	return ZONES[current_zone].name

func get_distance() -> float:
	return distance
