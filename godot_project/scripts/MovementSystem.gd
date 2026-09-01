# MovementSystem.gd — Geode Inn Movement & Animation Controller
# 207 total animated elements across all zones
# Tier 1 (beta): ~50 elements — hearth fire, key NPCs, ambient critters
# Manages: NPC wander AI, critter ambient loops, environmental particle effects
# Frequency-aware: elements shift behavior between Living (42Hz) and Shadow (84Hz)

extends Node2D

# === ELEMENT TYPES ===
enum ElementType { NPC, CRITTER, ENVIRONMENT, HAZARD }

# === MOVEMENT BEHAVIORS ===
enum Behavior {
	IDLE,          # Stationary, occasional idle animation
	WANDER,        # Random walk within radius, pause, resume
	PATROL,        # Fixed path between waypoints
	BOB,           # Vertical bobbing (floating elements)
	ORBIT,         # Circle around a center point
	PULSE,         # Scale pulsing (glowing elements)
	DRIFT,         # Slow directional drift (smoke, mist)
	FLICKER,       # Random opacity changes (fire, candlelight)
	SCATTER,       # Startled movement on player approach
	SYNC,          # Synchronized group movement (fish, birds)
}

# === TIER 1 ELEMENTS (~50 for beta) ===
const TIER1_ELEMENTS := [
	# --- HEARTH (Main Floor center) ---
	{"name": "hearth_fire", "type": ElementType.ENVIRONMENT, "behavior": Behavior.FLICKER, "zone": "main_floor", "pos": Vector2(512, 300), "freq": "both"},
	{"name": "hearth_smoke", "type": ElementType.ENVIRONMENT, "behavior": Behavior.DRIFT, "zone": "main_floor", "pos": Vector2(512, 250), "freq": "both"},
	{"name": "hearth_embers", "type": ElementType.ENVIRONMENT, "behavior": Behavior.SCATTER, "zone": "main_floor", "pos": Vector2(512, 320), "freq": "both"},
	
	# --- MAIN FLOOR NPCs ---
	{"name": "beverley", "type": ElementType.NPC, "behavior": Behavior.PATROL, "zone": "main_floor", "pos": Vector2(300, 200), "waypoints": [Vector2(300, 200), Vector2(700, 200), Vector2(700, 350), Vector2(300, 350)], "speed": 40, "freq": "living"},
	{"name": "briar", "type": ElementType.NPC, "behavior": Behavior.WANDER, "zone": "main_floor", "pos": Vector2(800, 350), "wander_radius": 80, "speed": 30, "freq": "living"},
	{"name": "mim", "type": ElementType.NPC, "behavior": Behavior.IDLE, "zone": "main_floor", "pos": Vector2(250, 420), "freq": "living"},
	{"name": "lark", "type": ElementType.NPC, "behavior": Behavior.WANDER, "zone": "main_floor", "pos": Vector2(600, 450), "wander_radius": 60, "speed": 50, "freq": "living"},
	
	# --- MAIN FLOOR CRITTERS ---
	{"name": "ember_mouse_1", "type": ElementType.CRITTER, "behavior": Behavior.SCATTER, "zone": "main_floor", "pos": Vector2(450, 380), "speed": 80, "freq": "living"},
	{"name": "ember_mouse_2", "type": ElementType.CRITTER, "behavior": Behavior.SCATTER, "zone": "main_floor", "pos": Vector2(580, 350), "speed": 80, "freq": "living"},
	{"name": "mead_bee_1", "type": ElementType.CRITTER, "behavior": Behavior.ORBIT, "zone": "main_floor", "pos": Vector2(800, 200), "orbit_center": Vector2(800, 200), "orbit_radius": 30, "speed": 60, "freq": "living"},
	{"name": "mead_bee_2", "type": ElementType.CRITTER, "behavior": Behavior.ORBIT, "zone": "main_floor", "pos": Vector2(820, 180), "orbit_center": Vector2(800, 200), "orbit_radius": 40, "speed": 70, "freq": "living"},
	{"name": "moss_pig_1", "type": ElementType.CRITTER, "behavior": Behavior.WANDER, "zone": "main_floor", "pos": Vector2(350, 480), "wander_radius": 50, "speed": 20, "freq": "living"},
	
	# --- CAMPING GROUNDS ---
	{"name": "campfire_glow", "type": ElementType.ENVIRONMENT, "behavior": Behavior.FLICKER, "zone": "campgrounds", "pos": Vector2(512, 300), "freq": "both"},
	{"name": "firefly_1", "type": ElementType.CRITTER, "behavior": Behavior.WANDER, "zone": "campgrounds", "pos": Vector2(400, 250), "wander_radius": 100, "speed": 30, "freq": "living"},
	{"name": "firefly_2", "type": ElementType.CRITTER, "behavior": Behavior.WANDER, "zone": "campgrounds", "pos": Vector2(600, 200), "wander_radius": 120, "speed": 25, "freq": "living"},
	{"name": "firefly_3", "type": ElementType.CRITTER, "behavior": Behavior.WANDER, "zone": "campgrounds", "pos": Vector2(550, 350), "wander_radius": 80, "speed": 35, "freq": "living"},
	{"name": "owl_1", "type": ElementType.CRITTER, "behavior": Behavior.BOB, "zone": "campgrounds", "pos": Vector2(200, 150), "speed": 10, "freq": "both"},
	
	# --- COSMOLOGY ---
	{"name": "star_twinkle_1", "type": ElementType.ENVIRONMENT, "behavior": Behavior.PULSE, "zone": "cosmology", "pos": Vector2(300, 100), "freq": "both"},
	{"name": "star_twinkle_2", "type": ElementType.ENVIRONMENT, "behavior": Behavior.PULSE, "zone": "cosmology", "pos": Vector2(700, 150), "freq": "both"},
	{"name": "star_twinkle_3", "type": ElementType.ENVIRONMENT, "behavior": Behavior.PULSE, "zone": "cosmology", "pos": Vector2(500, 80), "freq": "both"},
	{"name": "comet_1", "type": ElementType.ENVIRONMENT, "behavior": Behavior.DRIFT, "zone": "cosmology", "pos": Vector2(100, 200), "speed": 20, "freq": "both"},
	{"name": "navigator_npc", "type": ElementType.NPC, "behavior": Behavior.IDLE, "zone": "cosmology", "pos": Vector2(512, 400), "freq": "living"},
	{"name": "belladonna_npc", "type": ElementType.NPC, "behavior": Behavior.WANDER, "zone": "cosmology", "pos": Vector2(400, 300), "wander_radius": 70, "speed": 25, "freq": "both"},
	
	# --- CATACOMBS ---
	{"name": "dust_mote_1", "type": ElementType.ENVIRONMENT, "behavior": Behavior.DRIFT, "zone": "catacombs", "pos": Vector2(300, 200), "speed": 8, "freq": "both"},
	{"name": "dust_mote_2", "type": ElementType.ENVIRONMENT, "behavior": Behavior.DRIFT, "zone": "catacombs", "pos": Vector2(600, 300), "speed": 10, "freq": "both"},
	{"name": "dust_mote_3", "type": ElementType.ENVIRONMENT, "behavior": Behavior.DRIFT, "zone": "catacombs", "pos": Vector2(450, 150), "speed": 6, "freq": "both"},
	{"name": "charon_npc", "type": ElementType.NPC, "behavior": Behavior.IDLE, "zone": "catacombs", "pos": Vector2(200, 300), "freq": "both"},
	{"name": "crone_npc", "type": ElementType.NPC, "behavior": Behavior.WANDER, "zone": "catacombs", "pos": Vector2(700, 350), "wander_radius": 90, "speed": 15, "freq": "both"},
	{"name": "bone_rat_1", "type": ElementType.CRITTER, "behavior": Behavior.SCATTER, "zone": "catacombs", "pos": Vector2(400, 400), "speed": 60, "freq": "both"},
	
	# --- STAIRCASE ---
	{"name": "alchemy_glow_1", "type": ElementType.ENVIRONMENT, "behavior": Behavior.PULSE, "zone": "staircase", "pos": Vector2(200, 300), "freq": "both"},
	{"name": "alchemy_glow_2", "type": ElementType.ENVIRONMENT, "behavior": Behavior.PULSE, "zone": "staircase", "pos": Vector2(300, 200), "freq": "both"},
	{"name": "alchemist_npc", "type": ElementType.NPC, "behavior": Behavior.PATROL, "zone": "staircase", "pos": Vector2(256, 100), "waypoints": [Vector2(256, 100), Vector2(256, 600)], "speed": 20, "freq": "both"},
	
	# --- UNDERCITY (Shadow 84Hz only) ---
	{"name": "shadow_wisp_1", "type": ElementType.ENVIRONMENT, "behavior": Behavior.WANDER, "zone": "undercity", "pos": Vector2(300, 200), "wander_radius": 100, "speed": 15, "freq": "shadow"},
	{"name": "shadow_wisp_2", "type": ElementType.ENVIRONMENT, "behavior": Behavior.WANDER, "zone": "undercity", "pos": Vector2(700, 300), "wander_radius": 120, "speed": 12, "freq": "shadow"},
	{"name": "archivist_npc", "type": ElementType.NPC, "behavior": Behavior.IDLE, "zone": "undercity", "pos": Vector2(512, 400), "freq": "shadow"},
	{"name": "hollow_man_1", "type": ElementType.NPC, "behavior": Behavior.PATROL, "zone": "undercity", "pos": Vector2(200, 300), "waypoints": [Vector2(200, 300), Vector2(800, 300)], "speed": 35, "freq": "shadow"},
	{"name": "hollow_man_2", "type": ElementType.NPC, "behavior": Behavior.PATROL, "zone": "undercity", "pos": Vector2(800, 400), "waypoints": [Vector2(800, 400), Vector2(200, 400)], "speed": 30, "freq": "shadow"},
	
	# --- FAE KINGDOM ---
	{"name": "fae_glow_1", "type": ElementType.ENVIRONMENT, "behavior": Behavior.PULSE, "zone": "fae_kingdom", "pos": Vector2(400, 200), "freq": "living"},
	{"name": "fae_glow_2", "type": ElementType.ENVIRONMENT, "behavior": Behavior.PULSE, "zone": "fae_kingdom", "pos": Vector2(600, 300), "freq": "living"},
	{"name": "pixie_1", "type": ElementType.CRITTER, "behavior": Behavior.ORBIT, "zone": "fae_kingdom", "pos": Vector2(500, 250), "orbit_center": Vector2(500, 250), "orbit_radius": 50, "speed": 80, "freq": "living"},
	{"name": "pixie_2", "type": ElementType.CRITTER, "behavior": Behavior.ORBIT, "zone": "fae_kingdom", "pos": Vector2(520, 270), "orbit_center": Vector2(500, 250), "orbit_radius": 60, "speed": 90, "freq": "living"},
	{"name": "seelie_king_npc", "type": ElementType.NPC, "behavior": Behavior.IDLE, "zone": "fae_kingdom", "pos": Vector2(512, 300), "freq": "living"},
	{"name": "malachi_npc", "type": ElementType.NPC, "behavior": Behavior.IDLE, "zone": "fae_kingdom", "pos": Vector2(200, 400), "freq": "shadow"},
	{"name": "morrigan_npc", "type": ElementType.NPC, "behavior": Behavior.WANDER, "zone": "fae_kingdom", "pos": Vector2(700, 200), "wander_radius": 80, "speed": 40, "freq": "both"},
	
	# --- ARCHIVE ---
	{"name": "page_flutter_1", "type": ElementType.ENVIRONMENT, "behavior": Behavior.DRIFT, "zone": "archive", "pos": Vector2(300, 200), "speed": 5, "freq": "both"},
	{"name": "page_flutter_2", "type": ElementType.ENVIRONMENT, "behavior": Behavior.DRIFT, "zone": "archive", "pos": Vector2(600, 150), "speed": 7, "freq": "both"},
	{"name": "quire_npc", "type": ElementType.NPC, "behavior": Behavior.IDLE, "zone": "archive", "pos": Vector2(700, 300), "freq": "both"},
	{"name": "book_worm_1", "type": ElementType.CRITTER, "behavior": Behavior.WANDER, "zone": "archive", "pos": Vector2(400, 350), "wander_radius": 40, "speed": 10, "freq": "both"},
	
	# --- MARKET ---
	{"name": "market_glow", "type": ElementType.ENVIRONMENT, "behavior": Behavior.FLICKER, "zone": "market", "pos": Vector2(512, 300), "freq": "living"},
	{"name": "merchant_npc_1", "type": ElementType.NPC, "behavior": Behavior.IDLE, "zone": "market", "pos": Vector2(300, 300), "freq": "living"},
	{"name": "merchant_npc_2", "type": ElementType.NPC, "behavior": Behavior.IDLE, "zone": "market", "pos": Vector2(700, 300), "freq": "living"},
	{"name": "market_cat_1", "type": ElementType.CRITTER, "behavior": Behavior.WANDER, "zone": "market", "pos": Vector2(500, 400), "wander_radius": 100, "speed": 25, "freq": "living"},
]

# === ACTIVE ELEMENTS ===
var _elements: Array = []
var _player_ref: Node2D = null
var _current_zone: String = ""
var _current_freq: int = 0  # GameManager.Frequency

func _ready() -> void:
	GameManager.frequency_changed.connect(_on_frequency_changed)
	print("[MovementSystem] Ready — %d Tier 1 elements defined" % TIER1_ELEMENTS.size())

func set_zone(zone_key: String, player: Node2D) -> void:
	_current_zone = zone_key
	_player_ref = player
	_spawn_zone_elements()

func _spawn_zone_elements() -> void:
	# Clear existing
	for child in get_children():
		child.queue_free()
	_elements.clear()
	
	# Spawn elements for current zone and frequency
	for elem_data in TIER1_ELEMENTS:
		if elem_data.zone != _current_zone:
			continue
		
		var freq: String = elem_data.get("freq", "both")
		if freq == "living" and _current_freq == GameManager.Frequency.SHADOW:
			continue
		if freq == "shadow" and _current_freq == GameManager.Frequency.LIVING:
			continue
		
		var node := _create_element_node(elem_data)
		if node:
			add_child(node)
			_elements.append({"node": node, "data": elem_data, "state": _init_state(elem_data)})

func _create_element_node(data: Dictionary) -> Node2D:
	var node := Node2D.new()
	node.name = data.name
	node.position = data.pos
	
	# Visual placeholder — colored circle based on type
	var sprite := Sprite2D.new()
	var color := Color(0.6, 0.5, 0.3)
	match data.type:
		ElementType.NPC: color = Color(0.70, 0.60, 0.35)
		ElementType.CRITTER: color = Color(0.50, 0.45, 0.30)
		ElementType.ENVIRONMENT: color = Color(0.40, 0.35, 0.20, 0.6)
		ElementType.HAZARD: color = Color(0.60, 0.20, 0.20)
	
	var size := 8
	match data.type:
		ElementType.NPC: size = 12
		ElementType.CRITTER: size = 6
		ElementType.ENVIRONMENT: size = 4
	
	var img := Image.create(size, size, false, Image.FORMAT_RGBA8)
	img.fill(color)
	sprite.texture = ImageTexture.create_from_image(img)
	node.add_child(sprite)
	
	return node

func _init_state(data: Dictionary) -> Dictionary:
	var state := {
		"timer": 0.0,
		"pause_duration": randf_range(1.0, 3.0),
		"is_paused": false,
		"target_pos": data.pos,
		"angle": 0.0,
		"flicker_alpha": 1.0,
	}
	
	match data.behavior:
		Behavior.WANDER:
			state.target_pos = _random_wander_target(data.pos, data.get("wander_radius", 80))
		Behavior.PATROL:
			state.waypoint_index = 0
		Behavior.ORBIT:
			state.angle = randf() * TAU
	
	return state

func _process(delta: float) -> void:
	for elem in _elements:
		var node: Node2D = elem.node
		var data: Dictionary = elem.data
		var state: Dictionary = elem.state
		
		if not is_instance_valid(node):
			continue
		
		match data.behavior:
			Behavior.IDLE:
				_idle_behavior(node, delta, state)
			Behavior.WANDER:
				_wander_behavior(node, delta, data, state)
			Behavior.PATROL:
				_patrol_behavior(node, delta, data, state)
			Behavior.BOB:
				_bob_behavior(node, delta, data, state)
			Behavior.ORBIT:
				_orbit_behavior(node, delta, data, state)
			Behavior.PULSE:
				_pulse_behavior(node, delta, state)
			Behavior.DRIFT:
				_drift_behavior(node, delta, data, state)
			Behavior.FLICKER:
				_flicker_behavior(node, delta, state)
			Behavior.SCATTER:
				_scatter_behavior(node, delta, data, state)

func _idle_behavior(node: Node2D, delta: float, state: Dictionary) -> void:
	# Subtle scale breathing
	state.timer += delta
	var scale_factor := 1.0 + sin(state.timer * 2.0) * 0.05
	node.scale = Vector2(scale_factor, scale_factor)

func _wander_behavior(node: Node2D, delta: float, data: Dictionary, state: Dictionary) -> void:
	if state.is_paused:
		state.timer += delta
		if state.timer >= state.pause_duration:
			state.is_paused = false
			state.timer = 0.0
			state.target_pos = _random_wander_target(data.pos, data.get("wander_radius", 80))
		return
	
	var speed: float = data.get("speed", 30.0)
	var dir := (state.target_pos - node.position)
	if dir.length() < 5.0:
		state.is_paused = true
		state.pause_duration = randf_range(1.0, 4.0)
		state.timer = 0.0
	else:
		node.position += dir.normalized() * speed * delta

func _patrol_behavior(node: Node2D, delta: float, data: Dictionary, state: Dictionary) -> void:
	var waypoints: Array = data.get("waypoints", [data.pos])
	if waypoints.is_empty():
		return
	
	var idx: int = state.get("waypoint_index", 0)
	var target: Vector2 = waypoints[idx]
	var speed: float = data.get("speed", 30.0)
	var dir := target - node.position
	
	if dir.length() < 5.0:
		idx = (idx + 1) % waypoints.size()
		state.waypoint_index = idx
		target = waypoints[idx]
		dir = target - node.position
	
	node.position += dir.normalized() * speed * delta

func _bob_behavior(node: Node2D, delta: float, data: Dictionary, state: Dictionary) -> void:
	state.timer += delta
	var amplitude: float = data.get("amplitude", 5.0)
	var speed: float = data.get("speed", 10.0)
	node.position.y = data.pos.y + sin(state.timer * speed) * amplitude

func _orbit_behavior(node: Node2D, delta: float, data: Dictionary, state: Dictionary) -> void:
	state.angle += delta * data.get("speed", 60.0) * 0.02
	var center: Vector2 = data.get("orbit_center", data.pos)
	var radius: float = data.get("orbit_radius", 40.0)
	node.position = center + Vector2(cos(state.angle) * radius, sin(state.angle) * radius)

func _pulse_behavior(node: Node2D, delta: float, state: Dictionary) -> void:
	state.timer += delta
	var scale_factor := 0.8 + sin(state.timer * 2.0) * 0.3
	node.scale = Vector2(scale_factor, scale_factor)
	
	# Oplicity pulse
	if node.get_child_count() > 0:
		var sprite := node.get_child(0) as Sprite2D
		if sprite:
			sprite.modulate.a = 0.4 + sin(state.timer * 2.0) * 0.3

func _drift_behavior(node: Node2D, delta: float, data: Dictionary, state: Dictionary) -> void:
	var speed: float = data.get("speed", 8.0)
	node.position.x += speed * delta
	node.position.y += sin(state.timer) * 3.0 * delta
	state.timer += delta
	
	# Wrap around screen
	if node.position.x > 1040:
		node.position.x = -20

func _flicker_behavior(node: Node2D, delta: float, state: Dictionary) -> void:
	state.timer += delta
	if node.get_child_count() > 0:
		var sprite := node.get_child(0) as Sprite2D
		if sprite:
			# Random flicker
			var noise := sin(state.timer * 15.0) * 0.3 + sin(state.timer * 7.0) * 0.2
			sprite.modulate.a = 0.6 + noise + randf() * 0.1
			# Scale flicker
			var s := 0.9 + noise * 0.2
			sprite.scale = Vector2(s, s)

func _scatter_behavior(node: Node2D, delta: float, data: Dictionary, state: Dictionary) -> void:
	# Scatter away from player when close
	if _player_ref and is_instance_valid(_player_ref):
		var dist := node.position.distance_to(_player_ref.position)
		if dist < 60.0:
			var flee_dir := (node.position - _player_ref.position).normalized()
			node.position += flee_dir * data.get("speed", 80.0) * delta
		else:
			# Return to home position slowly
			var home_dir := (data.pos - node.position)
			if home_dir.length() > 3.0:
				node.position += home_dir.normalized() * 20.0 * delta

func _random_wander_target(center: Vector2, radius: float) -> Vector2:
	var angle := randf() * TAU
	var r := randf() * radius
	return center + Vector2(cos(angle) * r, sin(angle) * r)

func _on_frequency_changed(new_freq: int) -> void:
	_current_freq = new_freq
	_spawn_zone_elements()
	print("[MovementSystem] Frequency shifted — respawned elements for %s" % ("Shadow" if new_freq == GameManager.Frequency.SHADOW else "Living"))
