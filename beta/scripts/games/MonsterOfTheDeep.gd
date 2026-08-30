extends Node2D
## MonsterOfTheDeep.gd — Loch Ness Simulation (Atlantis Zone)
##
## Tabletop Questline Narrative:
## "The Reader turns the page to the submerged abyssal realm. You ARE the Monster of the Loch—an ancient Atlantean
## sea leviathan slumbering beneath dark waters. Hear the slow, resonant 50 BPM deep cello and feel the 42Hz hum
## in your iridescent scales. Surface briefly to grant tourists a glimpse of myth, dive into twilight trenches to evade
## military sonar, and feed on rare deep-sea creatures to preserve your leviathan essence and claim the Freshwater Pearl."
##
## Artist Style: Luis Royo Gothic Anime
##   Dark romantic gothic anime, iridescent dragon scales, deep indigo underwater shadows,
##   ethereal glowing bioluminescence, dramatic atmospheric depth and biomechanical grace.
##
## Music Tempo: Deep cello at 50 BPM (somber, majestic, ancient oceanic depths).
## Frequency System: 42Hz leviathan infrasound acoustic roar, disrupting sonar pings and unlocking sunken Atlantean crystal gates.

# === Game Configuration ===
const MAX_DEPTH_M: float = 1200.0
const VIEWPORT_WIDTH: float = 800.0
const VIEWPORT_HEIGHT: float = 600.0

# === Game States ===
enum State { MENU, PLAYING, PAUSED, WIN, GAME_OVER }
var current_state: State = State.MENU

# === Depth Zones Definition ===
const DEPTH_ZONES := [
	{
		"index": 1,
		"name": "Sunlight Surface",
		"min_depth": 0.0,
		"max_depth": 50.0,
		"bg_color": Color(0.1, 0.35, 0.45),
		"creature_type": "silver_minnow",
		"creature_energy": 12.0,
		"creature_score": 20,
		"sonar_risk": 0.8
	},
	{
		"index": 2,
		"name": "Twilight Reef",
		"min_depth": 50.0,
		"max_depth": 200.0,
		"bg_color": Color(0.06, 0.2, 0.35),
		"creature_type": "atlantic_mackerel",
		"creature_energy": 20.0,
		"creature_score": 50,
		"sonar_risk": 0.5
	},
	{
		"index": 3,
		"name": "Midnight Abyss",
		"min_depth": 200.0,
		"max_depth": 500.0,
		"bg_color": Color(0.03, 0.1, 0.22),
		"creature_type": "glow_squid",
		"creature_energy": 30.0,
		"creature_score": 120,
		"sonar_risk": 0.3
	},
	{
		"index": 4,
		"name": "Hadal Trench",
		"min_depth": 500.0,
		"max_depth": 1000.0,
		"bg_color": Color(0.02, 0.05, 0.12),
		"creature_type": "coelacanth",
		"creature_energy": 45.0,
		"creature_score": 300,
		"sonar_risk": 0.15
	},
	{
		"index": 5,
		"name": "Atlantean Core",
		"min_depth": 1000.0,
		"max_depth": 1200.0,
		"bg_color": Color(0.05, 0.02, 0.1),
		"creature_type": "pearl_oyster",
		"creature_energy": 100.0,
		"creature_score": 1000,
		"sonar_risk": 0.0
	}
]

# === Signals for UI Updates ===
signal score_updated(new_score: int)
signal energy_changed(current_energy: float, max_energy: float)
signal depth_changed(depth_m: float, zone_index: int, zone_name: String)
signal sonar_alert_changed(alert_percent: float)
signal tourist_sighting(points: int)
signal pearl_harvested()
signal game_state_changed(new_state: int)
signal pulse_42hz_roar(position: Vector2)

# === Game State Variables ===
var score: int = 0
var current_depth_m: float = 25.0
var current_zone_index: int = 1

# Hunger / Energy Mechanic
var energy: float = 100.0
const MAX_ENERGY: float = 100.0
const ENERGY_DEPLETION_RATE: float = 3.5  # Energy loss per second

# Monster Physics
var monster_pos: Vector2 = Vector2(400.0, 100.0)
var monster_velocity: Vector2 = Vector2.ZERO
const SWIM_ACCEL: float = 400.0
const SWIM_DRAG: float = 0.92

# Sonar Alert System
var sonar_alert: float = 0.0  # 0.0 to 100.0
var sonar_pings: Array[Dictionary] = []
var ping_spawn_timer: float = 0.0

# Creatures & Pearls
var creatures: Array[Dictionary] = []
var creature_spawn_timer: float = 0.0
var pearl_spawned: bool = false
var pearl_collected: bool = false

# 42Hz Leviathan Infrasound
var roar_cooldown: float = 0.0
const ROAR_COOLDOWN_MAX: float = 5.0

# Target Win Condition
const TARGET_WIN_SCORE: int = 2500

# UI Elements
@onready var ui_layer: CanvasLayer = $UILayer if has_node("UILayer") else null

func _ready() -> void:
	print_verbose("[DM/Reader]: 'Deep cello tones reverberate at 50 BPM. The sea monster stirs in Atlantean waters.'")
	_reset_game()
	current_state = State.PLAYING
	game_state_changed.emit(current_state)

func _reset_game() -> void:
	score = 0
	energy = MAX_ENERGY
	current_depth_m = 25.0
	current_zone_index = 1
	sonar_alert = 0.0
	monster_pos = Vector2(400.0, 100.0)
	monster_velocity = Vector2.ZERO
	sonar_pings.clear()
	creatures.clear()
	pearl_spawned = false
	pearl_collected = false
	roar_cooldown = 0.0

func _process(delta: float) -> void:
	if current_state != State.PLAYING:
		return
	
	# Deplete Energy (Hunger Mechanic)
	energy -= ENERGY_DEPLETION_RATE * delta
	energy_changed.emit(energy, MAX_ENERGY)
	if energy <= 0.0:
		_game_over("Exhaustion! The sea leviathan collapsed into deep slumber.")
		return
	
	# Handle Monster Movement Controls
	_handle_movement(delta)
	
	# Calculate Depth & Update Zone
	current_depth_m = clamp((monster_pos.y / VIEWPORT_HEIGHT) * MAX_DEPTH_M, 0.0, MAX_DEPTH_M)
	_update_current_zone()
	depth_changed.emit(current_depth_m, current_zone_index, DEPTH_ZONES[current_zone_index - 1]["name"])
	
	# Surfacing & Tourist Sightings
	if current_depth_m < 50.0:
		_process_surface_sightings(delta)
	
	# Sonar Alert System
	_update_sonar_system(delta)
	
	# Cooldowns & Spawning
	if roar_cooldown > 0.0:
		roar_cooldown -= delta
	
	_update_creatures(delta)
	_check_creature_collisions()
	
	queue_redraw()

func _handle_movement(delta: float) -> void:
	var move_input := Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		move_input.x -= 1.0
	if Input.is_action_pressed("ui_right"):
		move_input.x += 1.0
	if Input.is_action_pressed("ui_up"):
		move_input.y -= 1.0
	if Input.is_action_pressed("ui_down"):
		move_input.y += 1.0
	
	if move_input != Vector2.ZERO:
		move_input = move_input.normalized()
		monster_velocity += move_input * SWIM_ACCEL * delta
	
	monster_velocity *= SWIM_DRAG
	monster_pos += monster_velocity * delta
	
	# Viewport bounds
	monster_pos.x = clamp(monster_pos.x, 40.0, VIEWPORT_WIDTH - 40.0)
	monster_pos.y = clamp(monster_pos.y, 10.0, VIEWPORT_HEIGHT - 30.0)
	
	# 42Hz Acoustic Roar Action
	if Input.is_action_just_pressed("ui_accept") and roar_cooldown <= 0.0:
		_trigger_42hz_roar()

func _trigger_42hz_roar() -> void:
	roar_cooldown = ROAR_COOLDOWN_MAX
	pulse_42hz_roar.emit(monster_pos)
	print("[DM/Reader]: 'The Leviathan emits a low 42Hz acoustic roar, shattering sonar waves!'")
	
	# Cancel all active sonar pings nearby
	var to_erase: Array = []
	for ping in sonar_pings:
		if ping["pos"].distance_to(monster_pos) < 250.0:
			to_erase.append(ping)
	for p in to_erase:
		sonar_pings.erase(p)
	
	# Stun nearby creatures
	for c in creatures:
		if c["pos"].distance_to(monster_pos) < 200.0:
			c["stunned"] = true

func _update_current_zone() -> void:
	for zone in DEPTH_ZONES:
		if current_depth_m >= zone["min_depth"] and current_depth_m <= zone["max_depth"]:
			current_zone_index = zone["index"]
			break

func _process_surface_sightings(delta: float) -> void:
	# Surfacing gives tourist score points!
	var sighting_pts: int = int(120.0 * delta)
	score += sighting_pts
	score_updated.emit(score)
	tourist_sighting.emit(sighting_pts)
	
	# Surfacing also increases sonar detection risk
	sonar_alert = clamp(sonar_alert + 15.0 * delta, 0.0, 100.0)
	sonar_alert_changed.emit(sonar_alert)

func _update_sonar_system(delta: float) -> void:
	ping_spawn_timer += delta
	var current_risk: float = DEPTH_ZONES[current_zone_index - 1]["sonar_risk"]
	
	# Spawn sonar pings from surface tourist/research vessels
	if ping_spawn_timer >= (3.0 / max(0.1, current_risk)):
		ping_spawn_timer = 0.0
		sonar_pings.append({
			"pos": Vector2(randf_range(100.0, VIEWPORT_WIDTH - 100.0), 10.0),
			"radius": 10.0,
			"max_radius": 500.0,
			"speed": 120.0
		})
	
	# Update active sonar pings
	var finished_pings: Array = []
	for ping in sonar_pings:
		ping["radius"] += ping["speed"] * delta
		
		# Collision with Monster
		var dist := ping["pos"].distance_to(monster_pos)
		if abs(dist - ping["radius"]) < 20.0:
			sonar_alert = clamp(sonar_alert + 12.0 * delta, 0.0, 100.0)
			sonar_alert_changed.emit(sonar_alert)
			if sonar_alert >= 100.0:
				_game_over("Discovered! Tourist fleet and navy sonar locked onto your location!")
				return
		
		if ping["radius"] >= ping["max_radius"]:
			finished_pings.append(ping)
	
	for p in finished_pings:
		sonar_pings.erase(p)
	
	# Sonar alert decays when deep underwater
	if current_depth_m > 200.0 and sonar_alert > 0.0:
		sonar_alert = clamp(sonar_alert - 8.0 * delta, 0.0, 100.0)
		sonar_alert_changed.emit(sonar_alert)

func _update_creatures(delta: float) -> void:
	creature_spawn_timer += delta
	if creature_spawn_timer >= 1.5:
		creature_spawn_timer = 0.0
		if creatures.size() < 12:
			_spawn_zone_creature()
	
	# Move creatures
	for c in creatures:
		if c.get("stunned", false):
			continue
		c["pos"] += c["dir"] * c["speed"] * delta
		if c["pos"].x < -40.0 or c["pos"].x > VIEWPORT_WIDTH + 40.0:
			c["dir"].x *= -1.0

func _spawn_zone_creature() -> void:
	var zone_info: Dictionary = DEPTH_ZONES[current_zone_index - 1]
	
	# Special Atlantean Pearl Oyster spawn in Zone 5
	if current_zone_index == 5 and not pearl_spawned:
		pearl_spawned = true
		creatures.append({
			"type": "pearl_oyster",
			"pos": Vector2(VIEWPORT_WIDTH / 2.0, VIEWPORT_HEIGHT - 60.0),
			"dir": Vector2.ZERO,
			"speed": 0.0,
			"energy": 100.0,
			"score": 1000,
			"is_pearl": true
		})
		print("[DM/Reader]: 'Deep in the Atlantean Core, the luminous Freshwater Pearl oyster shines!'")
		return
	
	var spawn_y: float = lerp(20.0, VIEWPORT_HEIGHT - 40.0, float(current_zone_index) / 5.0)
	var spawn_pos := Vector2(
		-20.0 if randf() < 0.5 else VIEWPORT_WIDTH + 20.0,
		spawn_y + randf_range(-40.0, 40.0)
	)
	var dir_x := 1.0 if spawn_pos.x < 0 else -1.0
	
	creatures.append({
		"type": zone_info["creature_type"],
		"pos": spawn_pos,
		"dir": Vector2(dir_x, randf_range(-0.2, 0.2)),
		"speed": randf_range(40.0, 90.0),
		"energy": zone_info["creature_energy"],
		"score": zone_info["creature_score"],
		"is_pearl": false
	})

func _check_creature_collisions() -> void:
	var eaten: Array = []
	for c in creatures:
		if monster_pos.distance_to(c["pos"]) < 32.0:
			eaten.append(c)
			energy = clamp(energy + c["energy"], 0.0, MAX_ENERGY)
			score += c["score"]
			score_updated.emit(score)
			energy_changed.emit(energy, MAX_ENERGY)
			
			if c.get("is_pearl", false):
				pearl_collected = true
				pearl_harvested.emit()
				print("[DM/Reader]: 'The Freshwater Pearl has been harvested from the abyssal oyster!'")
				_win()
				return
			
			print("[DM/Reader]: 'Feasted on %s (+%d pts)'" % [c["type"], c["score"]])
	
	for e in eaten:
		creatures.erase(e)
	
	# Alternative Win Condition: High Sightings Score
	if score >= TARGET_WIN_SCORE and not pearl_collected:
		_win()

func _win() -> void:
	current_state = State.WIN
	game_state_changed.emit(current_state)
	print("=== MONSTER OF THE DEEP COMPLETE ===")
	print("Freshwater Pearl earned!")
	
	# Notify GameManager
	if Engine.has_singleton("GameManager") or get_node_or_null("/root/GameManager"):
		var gm = get_node_or_null("/root/GameManager")
		if gm and gm.has_method("complete_game"):
			gm.complete_game("monster_of_the_deep", score)
	
	# Load FizgigLoader transition
	if Engine.has_singleton("FizgigLoader") or get_node_or_null("/root/FizgigLoader"):
		var fl = get_node_or_null("/root/FizgigLoader")
		if fl and fl.has_method("load_zone"):
			fl.load_zone("monster_of_the_deep")

func _game_over(reason: String) -> void:
	current_state = State.GAME_OVER
	game_state_changed.emit(current_state)
	print("[DM/Reader]: '%s'" % reason)

# === Rendering ===
func _draw() -> void:
	# Royo Gothic Anime Underwater Gradient Background
	var current_bg: Color = DEPTH_ZONES[current_zone_index - 1]["bg_color"]
	draw_rect(Rect2(0, 0, VIEWPORT_WIDTH, VIEWPORT_HEIGHT), current_bg, true)
	
	# Caustic surface light rays near top
	if current_depth_m < 150.0:
		for r in range(5):
			var ray_pos := PackedVector2Array([
				Vector2(100 + r * 140, 0),
				Vector2(160 + r * 140, 0),
				Vector2(220 + r * 140, 300),
				Vector2(120 + r * 140, 300)
			])
			draw_polygon(ray_pos, [Color(0.4, 0.8, 0.9, 0.12)])
	
	# Draw Sonar Pings (Expanding Rings)
	for ping in sonar_pings:
		draw_arc(ping["pos"], ping["radius"], 0.0, TAU, 32, Color(1.0, 0.2, 0.2, 0.6), 2.0)
	
	# Draw Creatures
	for c in creatures:
		if c.get("is_pearl", false):
			# Glowing Freshwater Pearl Oyster
			draw_circle(c["pos"], 16.0, Color(0.9, 0.9, 1.0))
			draw_circle(c["pos"], 8.0, Color(0.6, 0.9, 1.0))
		else:
			# Fish / Abyssal creature
			draw_circle(c["pos"], 8.0, Color(0.2, 0.8, 0.6))
	
	# Draw Monster (Royo Gothic Dragon Leviathan)
	var leviathan_col := Color(0.15, 0.25, 0.45)  # Dark gothic indigo
	if sonar_alert > 50.0:
		leviathan_col = Color(0.6, 0.2, 0.3)  # Crimson threat hue
	
	# Leviathan body & glowing 42Hz scales
	draw_circle(monster_pos, 22.0, leviathan_col)
	draw_circle(monster_pos + Vector2(12, 0), 14.0, leviathan_col.lightened(0.2))
	draw_circle(monster_pos - Vector2(14, 0), 16.0, leviathan_col.darkened(0.2))
	
	# Glowing Bioluminescent Eye
	draw_circle(monster_pos + Vector2(10, -4), 4.0, Color(0.3, 0.9, 1.0))
