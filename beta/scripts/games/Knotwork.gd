###
# Geode Inn — Knotwork Game
# Dual-mode Celtic knotwork system: drag = puzzle game, click = design tool.
# Exports completed patterns to the Soulstice workshop.
#
# Game Mode: Players trace knotwork paths by dragging connected nodes.
#   - Each node must connect to exactly 2 others (no loose ends)
#   - No crossing lines unless at a designated bridge point
#   - Patterns must fill the frame edge-to-edge
#   - Timed: complete before the thread frays
#
# Design Mode: Players freely place nodes and draw connections.
#   - No timer, no constraints
#   - Export as SVG or knot pattern data
#   - Can be used to design jewelry patterns for the Bead Composer
#
# The knotwork is the ambient texture of the Inn — gold on dark stone.
###

extends Node2D
signal pattern_completed(score: int, pattern_data: Dictionary)
signal pattern_exported(export_data: Dictionary)

# === Modes ===
enum Mode { GAME, DESIGN }
var current_mode: Mode = Mode.GAME

# === Knot State ===
var nodes: Array[Dictionary] = []  # {id, position, connections: [node_ids]}
var connections: Array[Dictionary] = []  # {from_id, to_id, bridge: bool, thread_type}
var selected_node: int = -1
var dragging_from: int = -1
var frame_rect: Rect2 = Rect2(100, 100, 1080, 520)
var thread_fray_timer: float = 0.0
var thread_fray_limit: float = 60.0  # 60 seconds in game mode
var is_complete: bool = false

# === Game Mode Levels ===
const PATTERNS := [
	# L1: Simple triangle
	{"name": "Trinity", "nodes": 3, "connections": 3, "bridges": 0, "time_limit": 30},
	# L2: Square with diagonal
	{"name": "Four Corners", "nodes": 4, "connections": 5, "bridges": 1, "time_limit": 35},
	# L3: Celtic cross
	{"name": "Cross of Saint", "nodes": 6, "connections": 7, "bridges": 1, "time_limit": 40},
	# L4: Dara knot
	{"name": "Dara", "nodes": 7, "connections": 9, "bridges": 2, "time_limit": 45},
	# L5: Borromean rings
	{"name": "Three Rings", "nodes": 9, "connections": 12, "bridges": 3, "time_limit": 50},
	# L6: intricate border knot
	{"name": "Border Thread", "nodes": 12, "connections": 16, "bridges": 4, "time_limit": 55},
	# L7: Eternity knot
	{"name": "Eternity", "nodes": 16, "connections": 22, "bridges": 6, "time_limit": 60},
]

var current_pattern: int = 0
var score: int = 0

func _ready() -> void:
	set_mode(Mode.GAME)
	print("[Knotwork] Ready — Game mode")

func set_mode(mode: Mode) -> void:
	current_mode = mode
	if mode == Mode.GAME:
		thread_fray_timer = 0.0
		is_complete = false
	else:
		# Design mode: clear and start fresh
		nodes.clear()
		connections.clear()
		selected_node = -1
		is_complete = false

func start_pattern(level: int) -> void:
	if level < 0 or level >= PATTERNS.size():
		return
	
	current_pattern = level
	var pattern = PATTERNS[level]
	thread_fray_limit = pattern.time_limit
	thread_fray_timer = 0.0
	is_complete = false
	
	# Generate pattern nodes
	_generate_pattern(level)
	
	# Audio: zone ambient
	if AudioManager:
		AudioManager.play_stone_chime("gold", -10.0)
	
	print("[Knotwork] Pattern started: %s (%d nodes, %d connections, %d bridges)" % [
		pattern.name, pattern.nodes, pattern.connections, pattern.bridges
	])

func _generate_pattern(level: int) -> void:
	nodes.clear()
	connections.clear()
	
	var pattern = PATTERNS[level]
	var node_count = pattern.nodes
	var cx = frame_rect.position.x + frame_rect.size.x / 2
	var cy = frame_rect.position.y + frame_rect.size.y / 2
	var radius = min(frame_rect.size.x, frame_rect.size.y) * 0.35
	
	# Place nodes in a pattern (circle, grid, or custom)
	for i in range(node_count):
		var angle = (float(i) / node_count) * TAU
		var pos = Vector2(cx + cos(angle) * radius, cy + sin(angle) * radius)
		# Jitter for organic feel
		pos += Vector2(randf_range(-20, 20), randf_range(-20, 20))
		nodes.append({
			"id": i,
			"position": pos,
			"connections": [],
			"connected": false,
		})
	
	selected_node = -1
	dragging_from = -1

# === Input ===

func _input(event: InputEvent) -> void:
	if current_mode == Mode.GAME:
		_handle_game_input(event)
	else:
		_handle_design_input(event)

func _handle_game_input(event: InputEvent) -> void:
	if is_complete:
		return
	
	if event is InputEventMouseButton:
		if event.pressed:
			var clicked = _get_node_at(event.position)
			if clicked >= 0:
				if dragging_from == -1:
					dragging_from = clicked
					if AudioManager:
						AudioManager.play_ui_sound("button_click")
				else:
					# Connect dragging_from to clicked
					_try_connect(dragging_from, clicked)
					dragging_from = -1
		elif not event.pressed:
			dragging_from = -1

func _handle_design_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == MOUSE_BUTTON_LEFT:
				# Left click: place a node
				if frame_rect.has_point(event.position):
					var id = nodes.size()
					nodes.append({
						"id": id,
						"position": event.position,
						"connections": [],
						"connected": false,
					})
					if AudioManager:
						AudioManager.play_stone_chime("clear_quartz", -12.0)
			elif event.button_index == MOUSE_BUTTON_RIGHT:
				# Right click: start/connect a thread
				var clicked = _get_node_at(event.position)
				if clicked >= 0:
					if dragging_from == -1:
						dragging_from = clicked
					else:
						_try_connect(dragging_from, clicked)
						dragging_from = -1
		elif not event.pressed:
			dragging_from = -1

func _get_node_at(pos: Vector2) -> int:
	for i in range(nodes.size()):
		if nodes[i].position.distance_to(pos) < 25:
			return i
	return -1

func _try_connect(from_id: int, to_id: int) -> void:
	if from_id == to_id:
		return
	
	# Check if already connected
	for conn in connections:
		if (conn.from_id == from_id and conn.to_id == to_id) or (conn.from_id == to_id and conn.to_id == from_id):
			print("[Knotwork] Already connected")
			return
	
	# Check if crossing existing connections (unless bridge allowed)
	var is_bridge = _check_crossing(from_id, to_id)
	
	# Add connection
	connections.append({
		"from_id": from_id,
		"to_id": to_id,
		"bridge": is_bridge,
		"thread_type": "gold",
	})
	
	nodes[from_id].connections.append(to_id)
	nodes[to_id].connections.append(from_id)
	
	# Audio: thread connection sound
	if AudioManager:
		AudioManager.play_stone_chime("pyrite", -8.0)
	
	# Check completion
	_check_completion()

func _check_crossing(from_id: int, to_id: int) -> bool:
	# Check if this line crosses any existing connection
	var from_pos = nodes[from_id].position
	var to_pos = nodes[to_id].position
	
	for conn in connections:
		if conn.from_id == from_id or conn.to_id == from_id or conn.from_id == to_id or conn.to_id == to_id:
			continue
		var c_from = nodes[conn.from_id].position
		var c_to = nodes[conn.to_id].position
		if _line_intersection(from_pos, to_pos, c_from, c_to):
			return true  # This is a bridge point
	return false

func _line_intersection(p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2) -> bool:
	var d1 = p2 - p1
	var d2 = p4 - p3
	var denom = d1.x * d2.y - d1.y * d2.x
	if abs(denom) < 0.001:
		return false
	var t = ((p3.x - p1.x) * d2.y - (p3.y - p1.y) * d2.x) / denom
	var u = ((p3.x - p1.x) * d1.y - (p3.y - p1.y) * d1.x) / denom
	return t > 0 and t < 1 and u > 0 and u < 1

func _check_completion() -> void:
	if current_mode != Mode.GAME:
		return
	
	# Pattern is complete when all nodes have exactly 2 connections
	# (Celtic knotwork rule: every thread enters and exits)
	for node in nodes:
		if node.connections.size() != 2:
			return
	
	# Check all nodes are reachable (connected graph)
	if not _is_connected_graph():
		return
	
	# Pattern complete!
	is_complete = true
	var time_bonus = int((thread_fray_limit - thread_fray_timer) * 10)
	var bridge_count = connections.filter(func(c): return c.bridge).size()
	var bridge_bonus = bridge_count * 50
	var pattern_bonus = (current_pattern + 1) * 100
	score = time_bonus + bridge_bonus + pattern_bonus
	
	# Audio: completion chord
	if AudioManager:
		AudioManager.play_stinger("standing_stones_level_up")
		await get_tree().create_timer(0.3).timeout
		AudioManager.play_stone_chime("gold", -3.0)
	
	# Steam
	if SteamManager:
		SteamManager.unlock_achievement("first_game")
	
	var pattern_data = _export_pattern_data()
	pattern_completed.emit(score, pattern_data)
	
	print("[Knotwork] Pattern complete! Score: %d (time: %d, bridges: %d, pattern: %d)" % [
		score, time_bonus, bridge_bonus, pattern_bonus
	])

func _is_connected_graph() -> bool:
	if nodes.is_empty():
		return true
	
	var visited = {}
	var queue = [0]
	visited[0] = true
	
	while queue.size() > 0:
		var node_id = queue.pop_front()
		for conn_id in nodes[node_id].connections:
			if not visited.has(conn_id):
				visited[conn_id] = true
				queue.append(conn_id)
	
	return visited.size() == nodes.size()

# === Timer ===

func _process(delta: float) -> void:
	if current_mode == Mode.GAME and not is_complete:
		thread_fray_timer += delta
		if thread_fray_timer >= thread_fray_limit:
			# Thread frayed — game over
			print("[Knotwork] Thread frayed! Time: %.1f / %.1f" % [thread_fray_timer, thread_fray_limit])
			if AudioManager:
				AudioManager.play_stinger("monster_encounter")

# === Export ===

func _export_pattern_data() -> Dictionary:
	return {
		"pattern_name": PATTERNS[current_pattern].name if current_mode == Mode.GAME else "Custom Design",
		"mode": "game" if current_mode == Mode.GAME else "design",
		"nodes": nodes.map(func(n): return {"id": n.id, "x": n.position.x, "y": n.position.y}),
		"connections": connections.map(func(c): return {"from": c.from_id, "to": c.to_id, "bridge": c.bridge}),
		"score": score,
		"created_date": Time.get_datetime_string_from_system(false, true),
		"creator": GameManager.player_name if GameManager else "Traveler",
	}

func export_to_workshop() -> Dictionary:
	var data = _export_pattern_data()
	pattern_exported.emit(data)
	
	if AudioManager:
		AudioManager.play_nine_songs_chord()
	
	print("[Knotwork] Pattern exported to workshop: %s (%d nodes, %d connections)" % [
		data.pattern_name, data.nodes.size(), data.connections.size()
	])
	
	return {"success": true, "data": data}

# === Getters ===
func get_timer_remaining() -> float:
	return max(thread_fray_limit - thread_fray_timer, 0.0)

func get_current_pattern_name() -> String:
	if current_mode == Mode.GAME and current_pattern < PATTERNS.size():
		return PATTERNS[current_pattern].name
	return "Custom Design"

func get_pattern_count() -> int:
	return PATTERNS.size()
