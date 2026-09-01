# StandingStones.gd — Tetris × Stonehenge
# Stack falling stones to build the ancient circle
# Complete rows to clear and score. Build the full circle to win Preseli Blue Stone.
# Controls: Left/Right to move, Up to rotate, Down to drop, Space to hard drop

extends Node2D

# === SIGNALS ===
signal score_changed(new_score: int)
signal level_changed(new_level: int)
signal stone_won(stone_name: String)

# === GRID CONFIG ===
const GRID_WIDTH := 10
const GRID_HEIGHT := 20
const CELL_SIZE := 28
const GRID_OFFSET_X := 362.0  # Center grid in 1024px viewport
const GRID_OFFSET_Y := 8.0

# === GAME STATES ===
enum State { MENU, PLAYING, PAUSED, WIN, GAME_OVER }
var current_state: State = State.MENU

# === TETROMINO SHAPES (stone-themed) ===
const SHAPES := [
	# I-piece (Selenite wand)
	{"cells": [Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0)], "color": Color(0.7, 0.8, 0.9), "stone": "Selenite"},
	# O-piece (Sunstone)
	{"cells": [Vector2i(0,0), Vector2i(1,0), Vector2i(0,1), Vector2i(1,1)], "color": Color(0.9, 0.7, 0.3), "stone": "Sunstone"},
	# T-piece (Amethyst)
	{"cells": [Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(1,1)], "color": Color(0.6, 0.4, 0.8), "stone": "Amethyst"},
	# S-piece (Malachite)
	{"cells": [Vector2i(1,0), Vector2i(2,0), Vector2i(0,1), Vector2i(1,1)], "color": Color(0.3, 0.7, 0.3), "stone": "Malachite"},
	# Z-piece (Garnet)
	{"cells": [Vector2i(0,0), Vector2i(1,0), Vector2i(1,1), Vector2i(2,1)], "color": Color(0.7, 0.2, 0.2), "stone": "Garnet"},
	# L-piece (Citrine)
	{"cells": [Vector2i(0,0), Vector2i(0,1), Vector2i(0,2), Vector2i(1,2)], "color": Color(0.9, 0.8, 0.2), "stone": "Citrine"},
	# J-piece (Lapis Lazuli)
	{"cells": [Vector2i(1,0), Vector2i(1,1), Vector2i(1,2), Vector2i(0,2)], "color": Color(0.2, 0.3, 0.8), "stone": "Lapis Lazuli"},
]

# === STATE ===
var grid: Array = []  # 2D array of Color or null
var current_piece: Dictionary = {}
var current_x: int = 0
var current_y: int = 0
var current_rotation: int = 0
var score: int = 0
var level: int = 1
var lines_cleared: int = 0
var drop_timer: float = 0.0
var drop_interval: float = 1.0
const WIN_LINES := 30  # Clear 30 lines to build the circle and win

# === NODES ===
@onready var score_label: Label = $HUD/ScoreLabel
@onready var lives_label: Label = $HUD/LivesLabel

func _ready() -> void:
	GameManager.current_zone = "Arcade"
	_init_grid()
	_start_game()

func _init_grid() -> void:
	grid.clear()
	for y in GRID_HEIGHT:
		var row: Array = []
		for x in GRID_WIDTH:
			row.append(null)
		grid.append(row)

func _start_game() -> void:
	_init_grid()
	score = 0
	level = 1
	lines_cleared = 0
	drop_interval = 1.0
	current_state = State.PLAYING
	_spawn_piece()

func _spawn_piece() -> void:
	var shape_idx := randi() % SHAPES.size()
	current_piece = SHAPES[shape_idx].duplicate()
	current_x = GRID_WIDTH / 2 - 2
	current_y = 0
	current_rotation = 0
	
	if not _can_place(current_piece.cells, current_x, current_y):
		current_state = State.GAME_OVER
		_on_game_over()

func _can_place(cells: Array, x: int, y: int) -> bool:
	for cell in cells:
		var gx := x + cell.x
		var gy := y + cell.y
		if gx < 0 or gx >= GRID_WIDTH:
			return false
		if gy < 0 or gy >= GRID_HEIGHT:
			return false
		if gy >= 0 and grid[gy][gx] != null:
			return false
	return true

func _lock_piece() -> void:
	for cell in current_piece.cells:
		var gx := current_x + cell.x
		var gy := current_y + cell.y
		if gy >= 0 and gy < GRID_HEIGHT and gx >= 0 and gx < GRID_WIDTH:
			grid[gy][gx] = current_piece.color
	
	_check_lines()
	_spawn_piece()

func _check_lines() -> void:
	var cleared := 0
	var y := GRID_HEIGHT - 1
	while y >= 0:
		var full := true
		for x in GRID_WIDTH:
			if grid[y][x] == null:
				full = false
				break
		if full:
			grid.pop_at(y)
			var new_row: Array = []
			for x in GRID_WIDTH:
				new_row.append(null)
			grid.insert(0, new_row)
			cleared += 1
		else:
			y -= 1
	
	if cleared > 0:
		lines_cleared += cleared
		score += cleared * 100 * level
		level = 1 + lines_cleared / 10
		drop_interval = max(0.1, 1.0 - (level - 1) * 0.1)
		score_label.text = "Score: " + str(score)
		
		if lines_cleared >= WIN_LINES:
			_on_win()

func _rotate_piece() -> void:
	var rotated_cells: Array = []
	for cell in current_piece.cells:
		# Rotate 90 degrees clockwise: (x, y) -> (-y, x) then normalize
		rotated_cells.append(Vector2i(-cell.y, cell.x))
	
	# Normalize to positive coordinates
	var min_x := 999
	var min_y := 999
	for cell in rotated_cells:
		min_x = min(min_x, cell.x)
		min_y = min(min_y, cell.y)
	for i in rotated_cells.size():
		rotated_cells[i] = Vector2i(rotated_cells[i].x - min_x, rotated_cells[i].y - min_y)
	
	if _can_place(rotated_cells, current_x, current_y):
		current_piece.cells = rotated_cells

func _move_piece(dx: int, dy: int) -> bool:
	if _can_place(current_piece.cells, current_x + dx, current_y + dy):
		current_x += dx
		current_y += dy
		return true
	return false

func _hard_drop() -> void:
	while _move_piece(0, 1):
		pass
	_lock_piece()

func _process(delta: float) -> void:
	if current_state != State.PLAYING:
		return
	
	drop_timer += delta
	if drop_timer >= drop_interval:
		drop_timer = 0.0
		if not _move_piece(0, 1):
			_lock_piece()

func _input(event: InputEvent) -> void:
	if current_state != State.PLAYING:
		if event.is_action_pressed("ui_cancel"):
			get_tree().change_scene_to_file("res://scenes/Arcade.tscn")
		return
	
	if event.is_action_pressed("move_left"):
		_move_piece(-1, 0)
	elif event.is_action_pressed("move_right"):
		_move_piece(1, 0)
	elif event.is_action_pressed("move_up"):
		_rotate_piece()
	elif event.is_action_pressed("move_down"):
		if _move_piece(0, 1):
			score += 1
			score_label.text = "Score: " + str(score)
	elif event.is_action_pressed("jump"):
		_hard_drop()
	elif event.is_action_pressed("ui_cancel"):
		current_state = State.PAUSED

func _on_win() -> void:
	current_state = State.WIN
	GameManager.collect_stone("Preseli Blue Stone")
	GameManager.record_game_result("Standing Stones", score)
	SteamManager.unlock_achievement("standing_stones_complete")
	print("[StandingStones] WIN! Preseli Blue Stone collected. Score: %d" % score)
	
	# Return to arcade after a moment
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://scenes/Arcade.tscn")

func _on_game_over() -> void:
	GameManager.record_game_result("Standing Stones", score)
	print("[StandingStones] Game Over. Score: %d" % score)
	
	# Return to arcade
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://scenes/Arcade.tscn")

func _draw() -> void:
	# Draw grid background
	draw_rect(Rect2(GRID_OFFSET_X, GRID_OFFSET_Y, GRID_WIDTH * CELL_SIZE, GRID_HEIGHT * CELL_SIZE),
		Color(0.03, 0.02, 0.04, 1), true)
	
	# Draw grid lines
	for x in GRID_WIDTH + 1:
		var px := GRID_OFFSET_X + x * CELL_SIZE
		draw_line(Vector2(px, GRID_OFFSET_Y), Vector2(px, GRID_OFFSET_Y + GRID_HEIGHT * CELL_SIZE),
			Color(0.1, 0.08, 0.12, 0.5), 1)
	for y in GRID_HEIGHT + 1:
		var py := GRID_OFFSET_Y + y * CELL_SIZE
		draw_line(Vector2(GRID_OFFSET_X, py), Vector2(GRID_OFFSET_X + GRID_WIDTH * CELL_SIZE, py),
			Color(0.1, 0.08, 0.12, 0.5), 1)
	
	# Draw locked stones
	for y in GRID_HEIGHT:
		for x in GRID_WIDTH:
			if grid[y][x] != null:
				var rect := Rect2(GRID_OFFSET_X + x * CELL_SIZE + 1, GRID_OFFSET_Y + y * CELL_SIZE + 1,
					CELL_SIZE - 2, CELL_SIZE - 2)
				draw_rect(rect, grid[y][x], true)
				draw_rect(rect, Color(1, 1, 1, 0.2), false, 1)
	
	# Draw current piece
	if current_state == State.PLAYING and current_piece.size() > 0:
		for cell in current_piece.cells:
			var gx := current_x + cell.x
			var gy := current_y + cell.y
			if gy >= 0:
				var rect := Rect2(GRID_OFFSET_X + gx * CELL_SIZE + 1, GRID_OFFSET_Y + gy * CELL_SIZE + 1,
					CELL_SIZE - 2, CELL_SIZE - 2)
				draw_rect(rect, current_piece.color, true)
				draw_rect(rect, Color(1, 1, 1, 0.3), false, 1)
	
	# Draw progress
	if current_state == State.PLAYING:
		var progress_text := "Lines: %d/%d  Level: %d" % [lines_cleared, WIN_LINES, level]
		draw_string(create_theme(), Vector2(660, 40), progress_text, HORIZONTAL_ALIGNMENT_LEFT, -1, 14, Color(0.85, 0.72, 0.35))
