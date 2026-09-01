# ZeldaWorld.gd — The Geode Inn Open World
# LttP-style top-down exploration with Living (42Hz) / Shadow (84Hz) frequency shifting
# 6 major zones connected via corridors and stairs
# Frequency toggle on ZR (T key on keyboard) — swaps world state in real-time
# Stones collected persist via GameManager. NPC dialogue via DialogueManager.
#
# Architecture: TileMap-based world with collision, NPC instances, stone pickups,
# and frequency-dependent layer visibility (Living layer visible at 42Hz, Shadow at 84Hz)

extends Node2D

# === SIGNALS ===
signal stone_found(stone_name: String)
signal npc_approached(npc_name: String)
signal zone_entered(zone_name: String)

# === ZONE DEFINITIONS ===
# Each zone is a screen-sized tilemap chunk with its own palette and NPC set
const ZONES := {
	"main_floor": {
		"name": "The Main Floor",
		"size": Vector2i(32, 20),
		"bg_color": Color(0.08, 0.06, 0.04, 1),
		"accent": Color(0.78, 0.66, 0.30, 1),  # Antiqued gold
		"npcs": ["Beverley", "Briar Nightbloom", "Mim", "Lark"],
		"stones": ["Amethyst", "Clear Quartz", "Rose Quartz"],
		"corridors": {"north": "cosmology", "south": "staircase", "east": "archive", "west": "campgrounds"},
		"music": "main_floor",
	},
	"cosmology": {
		"name": "Cosmology",
		"size": Vector2i(32, 20),
		"bg_color": Color(0.02, 0.02, 0.08, 1),
		"accent": Color(0.30, 0.40, 0.78, 1),  # Deep blue/silver
		"npcs": ["The Captain", "The Navigator", "Belladonna"],
		"stones": ["Moldavite", "Labradorite", "Moonstone"],
		"corridors": {"south": "main_floor"},
		"music": "cosmology",
	},
	"staircase": {
		"name": "The Alchemical Staircase",
		"size": Vector2i(16, 40),  # Tall — vertical descent
		"bg_color": Color(0.06, 0.05, 0.08, 1),
		"accent": Color(0.50, 0.35, 0.60, 1),  # Alchemical purple
		"npcs": ["The Alchemist"],
		"stones": ["Philosopher Stone", "Cinnabar"],
		"corridors": {"north": "main_floor", "south": "catacombs"},
		"music": "staircase",
	},
	"catacombs": {
		"name": "The Catacombs",
		"size": Vector2i(40, 40),  # Large maze-like
		"bg_color": Color(0.04, 0.03, 0.03, 1),
		"accent": Color(0.45, 0.30, 0.25, 1),  # Bone/earth
		"npcs": ["Charon", "The Crone", "Asterion"],
		"stones": ["Lapis Lazuli", "Obsidian", "Hematite"],
		"corridors": {"north": "staircase", "east": "fae_kingdom", "west": "undercity"},
		"music": "catacombs",
	},
	"fae_kingdom": {
		"name": "The Fae Kingdom",
		"size": Vector2i(48, 40),  # Largest zone
		"bg_color": Color(0.04, 0.08, 0.04, 1),
		"accent": Color(0.30, 0.78, 0.40, 1),  # Fae green/gold
		"npcs": ["Seelie King", "Malachi", "The Morrigan", "Fae NPCs"],
		"stones": ["Labradorite", "Fluorite", "Rainbow Moonstone", "Preseli Blue Stone"],
		"corridors": {"west": "catacombs"},
		"music": "fae_seelie",
	},
	"undercity": {
		"name": "The Undercity",
		"size": Vector2i(40, 40),
		"bg_color": Color(0.03, 0.02, 0.04, 1),
		"accent": Color(0.35, 0.20, 0.45, 1),  # Shadow purple
		"npcs": ["The Archivist", "Hollow Men"],
		"stones": ["Shadow Quartz", "Onyx", "Tourmaline"],
		"corridors": {"east": "catacombs"},
		"music": "undercity",
		"shadow_only": true,  # Only accessible at 84Hz
	},
}

# === PLAYER ===
const PLAYER_SPEED := 160.0
const PLAYER_DASH_SPEED := 320.0
const DASH_DURATION := 0.2
const DASH_COOLDOWN := 0.8

var player: CharacterBody2D
var player_sprite: Sprite2D
var can_move: bool = true
var dash_timer: float = 0.0
var dash_cooldown: float = 0.0
var is_dashing: bool = false

# === WORLD STATE ===
var current_zone_key: String = "main_floor"
var current_zone_data: Dictionary
var transition_active: bool = false
var transition_target: String = ""

# === FREQUENCY RENDERING ===
# Living layer: visible at 42Hz — warm, alive, NPCs present
# Shadow layer: visible at 84Hz — colder, different NPCs, different stones
var living_layer: TileMapLayer
var shadow_layer: TileMapLayer
var npc_container: Node2D
var stone_container: Node2D
var frequency_overlay: ColorRect

# === DIALOGUE ===
var nearby_npc: String = ""
var dialogue_active: bool = false

# === UI ===
var hud: CanvasLayer
var zone_label: Label
var freq_label: Label
var stone_counter: Label
var prompt_label: Label
var health_bar: ProgressBar

# === HEALTH ===
var max_health: int = 6  # 3 hearts, 2 pieces each (LttP style)
var current_health: int = 6

func _ready() -> void:
	_build_world()
	_setup_ui()
	_load_zone("main_floor")
	GameManager.current_zone = "The Main Floor"
	AudioManager.play_zone_music("res://assets/audio/main_floor.ogg")
	GameManager.frequency_changed.connect(_on_frequency_changed)
	
	print("[ZeldaWorld] Ready — Main Floor loaded, 42Hz Living")

func _build_world() -> void:
	# Build zone collision and background via ZoneCollision
	ZoneCollision.build_zone("main_floor", self)
	
	# Create tile layer for visual frequency overlay
	living_layer = TileMapLayer.new()
	living_layer.name = "LivingLayer"
	add_child(living_layer)
	
	shadow_layer = TileMapLayer.new()
	shadow_layer.name = "ShadowLayer"
	shadow_layer.visible = false
	add_child(shadow_layer)
	
	# NPC container
	npc_container = Node2D.new()
	npc_container.name = "NPCs"
	add_child(npc_container)
	
	# Stone container
	stone_container = Node2D.new()
	stone_container.name = "Stones"
	add_child(stone_container)
	
	# Frequency overlay (full screen tint)
	frequency_overlay = ColorRect.new()
	frequency_overlay.color = Color(0, 0, 0, 0)
	frequency_overlay.size = Vector2(1024, 576)
	frequency_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(frequency_overlay)
	
	# Create player
	player = CharacterBody2D.new()
	player.name = "Player"
	
	var col := CollisionShape2D.new()
	var shape := CapsuleShape2D.new()
	shape.radius = 10.0
	shape.height = 24.0
	col.shape = shape
	player.add_child(col)
	
	player_sprite = Sprite2D.new()
	player_sprite.texture = create_placeholder_texture(Color(0.78, 0.66, 0.30), 16)
	player_sprite.scale = Vector2(1.5, 2.0)
	player.add_child(player_sprite)
	
	add_child(player)
	player.position = Vector2(512, 300)

func _setup_ui() -> void:
	hud = CanvasLayer.new()
	hud.name = "HUD"
	add_child(hud)
	
	zone_label = Label.new()
	zone_label.text = "The Main Floor"
	zone_label.position = Vector2(20, 16)
	zone_label.add_theme_font_size_override("font_size", 20)
	zone_label.add_theme_color_override("font_color", Color(0.85, 0.72, 0.35))
	hud.add_child(zone_label)
	
	freq_label = Label.new()
	freq_label.text = "42Hz — Living"
	freq_label.position = Vector2(20, 44)
	freq_label.add_theme_font_size_override("font_size", 14)
	freq_label.add_theme_color_override("font_color", Color(0.60, 0.50, 0.25))
	hud.add_child(freq_label)
	
	stone_counter = Label.new()
	stone_counter.text = "Stones: 0"
	stone_counter.position = Vector2(920, 16)
	stone_counter.add_theme_color_override("font_color", Color(0.85, 0.72, 0.35))
	hud.add_child(stone_counter)
	
	prompt_label = Label.new()
	prompt_label.text = ""
	prompt_label.position = Vector2(384, 480)
	prompt_label.add_theme_font_size_override("font_size", 16)
	prompt_label.add_theme_color_override("font_color", Color(0.90, 0.80, 0.45))
	prompt_label.horizontal_alignment = Label.HORIZONTAL_ALIGNMENT_CENTER
	prompt_label.size = Vector2(256, 30)
	hud.add_child(prompt_label)
	
	# Health bar (LttP style hearts)
	health_bar = ProgressBar.new()
	health_bar.position = Vector2(20, 540)
	health_bar.size = Vector2(120, 16)
	health_bar.max_value = max_health
	health_bar.value = current_health
	health_bar.show_percentage = false
	hud.add_child(health_bar)

func _load_zone(zone_key: String) -> void:
	if not ZONES.has(zone_key):
		print("[ZeldaWorld] Zone not found: %s" % zone_key)
		return
	
	current_zone_key = zone_key
	current_zone_data = ZONES[zone_key]
	
	# Rebuild collision for new zone
	ZoneCollision.build_zone(zone_key, self)
	
	# Update movement system for new zone
	if MovementSystem:
		MovementSystem.set_zone(zone_key, player)
	
	# Clear existing NPCs and stones
	for child in npc_container.get_children():
		child.queue_free()
	for child in stone_container.get_children():
		child.queue_free()
	
	# Update zone label
	zone_label.text = current_zone_data.name
	GameManager.current_zone = current_zone_data.name
	zone_entered.emit(current_zone_data.name)
	
	# Spawn NPCs
	var npc_index := 0
	for npc_name in current_zone_data.get("npcs", []):
		var npc := _create_npc(npc_name, npc_index)
		npc_container.add_child(npc)
		npc_index += 1
	
	# Spawn stones
	var stone_index := 0
	for stone_name in current_zone_data.get("stones", []):
		var stone := _create_stone(stone_name, stone_index)
		stone_container.add_child(stone)
		stone_index += 1
	
	# Place player at zone entrance
	match current_zone_key:
		"main_floor": player.position = Vector2(512, 300)
		"cosmology": player.position = Vector2(512, 480)
		"staircase": player.position = Vector2(256, 100)
		"catacombs": player.position = Vector2(256, 100)
		"fae_kingdom": player.position = Vector2(100, 300)
		"undercity": player.position = Vector2(900, 300)
	
	# Play zone music
	AudioManager.play_zone_music("res://assets/audio/%s.ogg" % current_zone_data.music)
	
	# Check shadow-only zone
	if current_zone_data.get("shadow_only", false) and GameManager.current_frequency != GameManager.Frequency.SHADOW:
		GameManager.set_frequency(GameManager.Frequency.SHADOW)
	
	print("[ZeldaWorld] Loaded zone: %s" % current_zone_data.name)

func _create_npc(npc_name: String, index: int) -> Node2D:
	var npc := Area2D.new()
	npc.name = npc_name
	
	# Position in a spread pattern
	var angle := (index * 1.2)
	var radius := 100.0 + (index * 20.0)
	npc.position = Vector2(512 + cos(angle) * radius, 300 + sin(angle) * radius * 0.6)
	
	# Visual
	var sprite := Sprite2D.new()
	sprite.texture = SpriteLoader.get_npc_sprite(npc_name)
	sprite.scale = Vector2(1.5, 2.0)
	npc.add_child(sprite)
	
	# Label
	var label := Label.new()
	label.text = npc_name
	label.position = Vector2(-30, -30)
	label.add_theme_font_size_override("font_size", 11)
	label.add_theme_color_override("font_color", Color(0.75, 0.65, 0.35))
	npc.add_child(label)
	
	# Collision
	var col := CollisionShape2D.new()
	var shape := CircleShape2D.new()
	shape.radius = 16.0
	col.shape = shape
	npc.add_child(col)
	
	npc.set_meta("npc_name", npc_name)
	return npc

func _create_stone(stone_name: String, index: int) -> Area2D:
	var stone := Area2D.new()
	stone.name = stone_name
	
	# Random position in zone
	var rng := RandomNumberGenerator.new()
	rng.seed = stone_name.hash() + index
	stone.position = Vector2(
		rng.randf_range(80, 944),
		rng.randf_range(80, 496)
	)
	
	# Visual — glowing gem
	var sprite := Sprite2D.new()
	sprite.texture = create_placeholder_texture(Color(0.78, 0.66, 0.30, 0.8), 8)
	sprite.scale = Vector2(1.0, 1.0)
	stone.add_child(sprite)
	
	# Pulsing animation
	var tween := sprite.create_tween()
	tween.set_loops()
	tween.tween_property(sprite, "scale", Vector2(1.3, 1.3), 0.8)
	tween.tween_property(sprite, "scale", Vector2(1.0, 1.0), 0.8)
	
	# Collision
	var col := CollisionShape2D.new()
	var shape := CircleShape2D.new()
	shape.radius = 12.0
	col.shape = shape
	stone.add_child(col)
	
	stone.set_meta("stone_name", stone_name)
	stone.set_meta("collected", false)
	return stone

func _process(delta: float) -> void:
	if transition_active or not can_move:
		return
	
	# Handle dash timers
	if dash_cooldown > 0:
		dash_cooldown -= delta
	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0:
			is_dashing = false
	
	# Player movement (LttP style — 4 directional)
	var input_vec := Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		input_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		input_vec.x += 1
	if Input.is_action_pressed("move_up"):
		input_vec.y -= 1
	if Input.is_action_pressed("move_down"):
		input_vec.y += 1
	
	input_vec = input_vec.normalized()
	
	var speed := PLAYER_SPEED
	if is_dashing:
		speed = PLAYER_DASH_SPEED
	elif Input.is_action_pressed("sprint"):
		speed = PLAYER_SPEED * 1.5
	
	# Collision-aware movement
	var target_pos := player.position + input_vec * speed * delta
	if ZoneCollision and not ZoneCollision.is_walkable(target_pos):
		# Try sliding along one axis
		if ZoneCollision.is_walkable(player.position + Vector2(input_vec.x * speed * delta, 0)):
			player.velocity = Vector2(input_vec.x * speed, 0)
		elif ZoneCollision.is_walkable(player.position + Vector2(0, input_vec.y * speed * delta)):
			player.velocity = Vector2(0, input_vec.y * speed)
		else:
			player.velocity = Vector2.ZERO
	else:
		player.velocity = input_vec * speed
	player.move_and_slide()
	
	# Update player facing
	if input_vec != Vector2.ZERO:
		# Flip sprite based on horizontal direction
		player_sprite.flip_h = input_vec.x < 0
	
	# Check NPC proximity
	_check_npc_proximity()
	
	# Check stone pickups
	_check_stone_pickups()
	
	# Check zone transitions
	_check_zone_transitions()

func _input(event: InputEvent) -> void:
	if transition_active:
		return
	
	# Interact with NPC (A button / E key)
	if event.is_action_pressed("interact"):
		if DialogueManager and DialogueManager.is_in_dialogue():
			DialogueManager.advance()
		elif nearby_npc != "":
			_start_dialogue(nearby_npc)
	
	# Dash (Y button / Q key)
	if event.is_action_pressed("special") and dash_cooldown <= 0:
		is_dashing = true
		dash_timer = DASH_DURATION
		dash_cooldown = DASH_COOLDOWN
	
	# Frequency toggle (ZR / T key)
	if event.is_action_pressed("freq_toggle"):
		GameManager.toggle_frequency()
	
	# Health test (debug — F2)
	if event is InputEventKey and event.keycode == KEY_F2:
		current_health = max(1, current_health - 1)
		health_bar.value = current_health
		if current_health <= 0:
			_on_player_defeated()
	
	# Pause
	if event.is_action_pressed("pause"):
		_pause_menu()

func _check_npc_proximity() -> void:
	var found_npc := ""
	for npc in npc_container.get_children():
		if npc is Area2D:
			var dist := player.position.distance_to(npc.position)
			if dist < 40.0:
				found_npc = npc.get_meta("npc_name", "")
				break
	
	if found_npc != nearby_npc:
		nearby_npc = found_npc
		if found_npc != "":
			prompt_label.text = "Press E to talk to " + found_npc
			prompt_label.visible = true
		else:
			prompt_label.visible = false

func _check_stone_pickups() -> void:
	for stone in stone_container.get_children():
		if stone is Area2D and not stone.get_meta("collected", false):
			if player.position.distance_to(stone.position) < 20.0:
				var stone_name: String = stone.get_meta("stone_name", "Unknown")
				stone.set_meta("collected", true)
				stone.visible = false
				GameManager.collect_stone(stone_name)
				stone_counter.text = "Stones: %d" % GameManager.stones_collected.size()
				stone_found.emit(stone_name)
				
				# Floating pickup text
				_show_pickup_text(stone_name, stone.position)

func _check_zone_transitions() -> void:
	# Check screen edges for zone transitions
	var screen_margin := 40.0
	var pos := player.position
	
	var transition_dir := ""
	if pos.y < screen_margin:
		transition_dir = "north"
	elif pos.y > 576 - screen_margin:
		transition_dir = "south"
	elif pos.x < screen_margin:
		transition_dir = "west"
	elif pos.x > 1024 - screen_margin:
		transition_dir = "east"
	
	if transition_dir != "" and current_zone_data.get("corridors", {}).has(transition_dir):
		var target_zone: String = current_zone_data.corridors[transition_dir]
		#if target_zone == "undercity" and GameManager.current_frequency != GameManager.Frequency.SHADOW:
		#	prompt_label.text = "The Undercity resonates at 84Hz. Shift frequency to enter."
		#	prompt_label.visible = true
		#	return
		_do_transition(target_zone)

func _do_transition(target_zone_key: String) -> void:
	transition_active = true
	can_move = false
	prompt_label.visible = false
	
	# Fade out
	var tween := create_tween()
	frequency_overlay.color = Color(0, 0, 0, 0)
	tween.tween_property(frequency_overlay, "color:a", 1.0, 0.4)
	await tween.finished
	
	_load_zone(target_zone_key)
	
	# Fade in
	var tween2 := create_tween()
	tween2.tween_property(frequency_overlay, "color:a", 0.0, 0.4)
	await tween2.finished
	
	transition_active = false
	can_move = true

func _start_dialogue(npc_name: String) -> void:
	dialogue_active = true
	can_move = false
	
	# Start real dialogue via DialogueManager — loads branching trees
	if DialogueManager and not DialogueManager.is_in_dialogue():
		DialogueManager.start_dialogue(npc_name, current_zone_key)
		DialogueManager.dialogue_finished.connect(_on_dialogue_finished, CONNECT_ONE_SHOT)
	
	# Hide the proximity prompt while dialogue is active
	prompt_label.visible = false

func _on_dialogue_finished(_npc_name: String) -> void:
	dialogue_active = false
	can_move = true

func _on_frequency_changed(new_freq: int) -> void:
	_update_frequency_label()
	
	# Visual transition
	var tween := create_tween()
	
	if new_freq == GameManager.Frequency.SHADOW:
		# Shadow Inn — cooler, darker palette
		tween.tween_property(frequency_overlay, "color", Color(0.15, 0.1, 0.2, 0.3), 0.5)
		living_layer.visible = false
		shadow_layer.visible = true
		# Shift NPC sprites
		_shift_npc_states(true)
	else:
		# Living — warm
		tween.tween_property(frequency_overlay, "color", Color(0, 0, 0, 0), 0.5)
		living_layer.visible = true
		shadow_layer.visible = false
		_shift_npc_states(false)
	
	print("[ZeldaWorld] Frequency shifted: %s" % ("Shadow 84Hz" if new_freq == GameManager.Frequency.SHADOW else "Living 42Hz"))

func _shift_npc_states(to_shadow: bool) -> void:
	for npc in npc_container.get_children():
		if npc is Area2D:
			var sprite := npc.get_child(0) as Sprite2D
			if sprite:
				if to_shadow:
					sprite.modulate = Color(0.5, 0.4, 0.6, 1.0)
				else:
					sprite.modulate = Color(1.0, 1.0, 1.0, 1.0)

func _update_frequency_label() -> void:
	match GameManager.current_frequency:
		GameManager.Frequency.LIVING:
			freq_label.text = "42Hz — Living"
		GameManager.Frequency.SHADOW:
			freq_label.text = "84Hz — Shadow"
		GameManager.Frequency.IN_BETWEEN:
			freq_label.text = "In-Between"

func _show_pickup_text(text: String, pos: Vector2) -> void:
	var label := Label.new()
	label.text = "+ " + text
	label.position = pos + Vector2(-40, -30)
	label.add_theme_color_override("font_color", Color(0.9, 0.8, 0.4))
	label.add_theme_font_size_override("font_size", 14)
	hud.add_child(label)
	
	var tween := label.create_tween()
	tween.tween_property(label, "position:y", label.position.y - 40, 1.0)
	tween.parallel().tween_property(label, "color:a", 0.0, 1.0)
	await tween.finished
	label.queue_free()

func _on_player_defeated() -> void:
	can_move = false
	prompt_label.text = "The Inn finds you..."
	prompt_label.visible = true
	await get_tree().create_timer(2.0).timeout
	
	# Respawn at main floor with partial health
	current_health = 3
	health_bar.value = current_health
	_load_zone("main_floor")
	can_move = true

func _pause_menu() -> void:
	print("[ZeldaWorld] Pause menu — not yet implemented")
	# In full build: show pause overlay with save, settings, zone map

# === HELPER: Create placeholder texture ===
func create_placeholder_texture(color: Color, size: int) -> ImageTexture:
	var img := Image.create(size, size, false, Image.FORMAT_RGBA8)
	img.fill(color)
	return ImageTexture.create_from_image(img)

# === SAVE INTEGRATION ===
func save_state() -> Dictionary:
	return {
		"current_zone": current_zone_key,
		"player_pos": {"x": player.position.x, "y": player.position.y},
		"health": current_health,
		"frequency": GameManager.current_frequency,
	}
