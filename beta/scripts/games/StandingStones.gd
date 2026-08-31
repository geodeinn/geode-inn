extends Node2D
## StandingStones.gd — The Stonehenge Tetris Game
## 
## Clear rows of stone blocks to rebuild Stonehenge.
## When the player completes the monument (clears enough rows),
## the Fae Kingdom portal ignites and they earn Preseli Blue Stone.
##
## Controls:
##   Left/Right arrows — Move block
##   Up arrow — Rotate
##   Down arrow — Soft drop
##   Space — Hard drop
##
## This is the portal game — completing it unlocks the Fae Kingdom.

# === Grid Configuration ===
const GRID_WIDTH: int = 10
const GRID_HEIGHT: int = 20
const CELL_SIZE: int = 32  # Pixel size of each grid cell

# === Game States ===
enum State { MENU, PLAYING, PAUSED, WIN, GAME_OVER }
var current_state: State = State.MENU

# === Tetromino Definitions ===
# Each tetromino is a set of 4 rotations, each rotation is an array of Vector2i positions
const TETROMINOES := {
	"I": {
		"color": Color(0.4, 0.9, 1.0),  # Pale blue — Preseli bluestone
		"rotations": [
			[Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(3,1)],
			[Vector2i(2,0), Vector2i(2,1), Vector2i(2,2), Vector2i(2,3)],
			[Vector2i(0,2), Vector2i(1,2), Vector2i(2,2), Vector2i(3,2)],
			[Vector2i(1,0), Vector2i(1,1), Vector2i(1,2), Vector2i(1,3)]
		]
	},
	"O": {
		"color": Color(0.95, 0.85, 0.3),  # Gold — Stonehenge sandstone
		"rotations": [
			[Vector2i(1,0), Vector2i(2,0), Vector2i(1,1), Vector2i(2,1)],
			[Vector2i(1,0), Vector2i(2,0), Vector2i(1,1), Vector2i(2,1)],
			[Vector2i(1,0), Vector2i(2,0), Vector2i(1,1), Vector2i(2,1)],
			[Vector2i(1,0), Vector2i(2,0), Vector2i(1,1), Vector2i(2,1)]
		]
	},
	"T": {
		"color": Color(0.6, 0.4, 0.8),  # Amethyst purple
		"rotations": [
			[Vector2i(1,0), Vector2i(0,1), Vector2i(1,1), Vector2i(2,1)],
			[Vector2i(1,0), Vector2i(1,1), Vector2i(2,1), Vector2i(1,2)],
			[Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(1,2)],
			[Vector2i(1,0), Vector2i(0,1), Vector2i(1,1), Vector2i(1,2)]
		]
	},
	"S": {
		"color": Color(0.3, 0.8, 0.4),  # Moss green
		"rotations": [
			[Vector2i(1,0), Vector2i(2,0), Vector2i(0,1), Vector2i(1,1)],
			[Vector2i(1,0), Vector2i(1,1), Vector2i(2,1), Vector2i(2,2)],
			[Vector2i(1,1), Vector2i(2,1), Vector2i(0,2), Vector2i(1,2)],
			[Vector2i(0,0), Vector2i(0,1), Vector2i(1,1), Vector2i(1,2)]
		]
	},
	"Z": {
		"color": Color(0.8, 0.3, 0.3),  # Red jasper
		"rotations": [
			[Vector2i(0,0), Vector2i(1,0), Vector2i(1,1), Vector2i(2,1)],
			[Vector2i(2,0), Vector2i(1,1), Vector2i(2,1), Vector2i(1,2)],
			[Vector2i(0,1), Vector2i(1,1), Vector2i(1,2), Vector2i(2,2)],
			[Vector2i(1,0), Vector2i(0,1), Vector2i(1,1), Vector2i(0,2)]
		]
	},
	"J": {
		"color": Color(0.3, 0.4, 0.85),  # Sodalite blue
		"rotations": [
			[Vector2i(0,0), Vector2i(0,1), Vector2i(1,1), Vector2i(2,1)],
			[Vector2i(1,0), Vector2i(2,0), Vector2i(1,1), Vector2i(1,2)],
			[Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(2,2)],
			[Vector2i(1,0), Vector2i(1,1), Vector2i(0,2), Vector2i(1,2)]
		]
	},
	"L": {
		"color": Color(0.9, 0.6, 0.2),  # Amber
		"rotations": [
			[Vector2i(2,0), Vector2i(0,1), Vector2i(1,1), Vector2i(2,1)],
			[Vector2i(1,0), Vector2i(1,1), Vector2i(1,2), Vector2i(2,2)],
			[Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(0,2)],
			[Vector2i(0,0), Vector2i(1,0), Vector2i(1,1), Vector2i(1,2)]
		]
	}
}

const TETROMINO_KEYS := ["I", "O", "T", "S", "Z", "J", "L"]

# === Game State ===
var grid: Array  # 2D array of Color or null
var current_piece: Dictionary = {}  # { "key": "T", "rotation": 0, "position": Vector2i }
var next_piece_key: String = ""
var score: int = 0
var rows_cleared: int = 0
var level: int = 1
var drop_timer: float = 0.0
var drop_interval: float = 1.0  # Seconds per drop — decreases with level

# === Win Condition ===
# The player needs to "complete Stonehenge" by clearing this many rows
const ROWS_TO_WIN: int = 20  # ~20 rows = a full monument

# === Visual ===
@onready var grid_container: Node2D = $GridContainer
@onready var ui_layer: CanvasLayer = $UILayer
@onready var score_label: Label = $UILayer/ScoreLabel
@onready var rows_label: Label = $UILayer/RowsLabel
@onready var level_label: Label = $UILayer/LevelLabel
@onready var next_piece_preview: ColorRect = $UILayer/NextPiecePreview
@onready var win_screen: Control = $UILayer/WinScreen
@onready var game_over_screen: Control = $UILayer/GameOverScreen

func _ready() -> void:
	_init_grid()
	_spawn_piece()
	current_state = State.PLAYING
	
	# Connect GameManager signals
	GameManager.game_completed.connect(_on_game_completed)
	
	# Audio: Living mode + zone ambient
	if AudioManager:
		AudioManager.set_mode(AudioManager.AudioMode.LIVING)
		AudioManager.play_zone_ambient("fae_kingdom")
	
	# Steam rich presence
	if SteamManager:
		SteamManager.set_rich_presence("Standing Stones", "Level %d" % level)

func _init_grid() -> void:
	grid = []
	for y in range(GRID_HEIGHT):
		var row: Array = []
		for x in range(GRID_WIDTH):
			row.append(null)
		grid.append(row)

func _process(delta: float) -> void:
	if current_state != State.PLAYING:
		return
	
	drop_timer += delta
	if drop_timer >= drop_interval:
		drop_timer = 0.0
		_drop_piece()

func _input(event: InputEvent) -> void:
	if current_state != State.PLAYING:
		return
	
	if event.is_action_pressed("ui_left"):
		_move_piece(Vector2i(-1, 0))
	elif event.is_action_pressed("ui_right"):
		_move_piece(Vector2i(1, 0))
	elif event.is_action_pressed("ui_up"):
		_rotate_piece()
	elif event.is_action_pressed("ui_down"):
		_move_piece(Vector2i(0, 1))
		drop_timer = 0.0  # Reset timer on manual drop
	elif event.is_action_pressed("ui_accept"):  # Space = hard drop
		_hard_drop()

# === Piece Logic ===

func _spawn_piece() -> void:
	if next_piece_key == "":
		next_piece_key = TETROMINO_KEYS.pick_random()
	
	current_piece = {
		"key": next_piece_key,
		"rotation": 0,
		"position": Vector2i(GRID_WIDTH / 2 - 2, 0)
	}
	
	# Generate next piece
	next_piece_key = TETROMINO_KEYS.pick_random()
	
	# Check for game over (piece can't spawn)
	if not _is_valid_position(current_piece):
		_game_over()

func _get_piece_cells(piece: Dictionary) -> Array[Vector2i]:
	var key: String = piece["key"]
	var rot: int = piece["rotation"]
	var pos: Vector2i = piece["position"]
	var cells: Array[Vector2i] = []
	
	var rotations = TETROMINOES[key]["rotations"]
	for cell in rotations[rot]:
		cells.append(Vector2i(pos.x + cell.x, pos.y + cell.y))
	
	return cells

func _is_valid_position(piece: Dictionary) -> bool:
	var cells := _get_piece_cells(piece)
	for cell in cells:
		if cell.x < 0 or cell.x >= GRID_WIDTH:
			return false
		if cell.y >= GRID_HEIGHT:
			return false
		if cell.y >= 0 and grid[cell.y][cell.x] != null:
			return false
	return true

func _move_piece(offset: Vector2i) -> void:
	var new_piece = current_piece.duplicate()
	new_piece["position"] = current_piece["position"] + offset
	if _is_valid_position(new_piece):
		current_piece = new_piece
	queue_redraw()

func _rotate_piece() -> void:
	var new_piece = current_piece.duplicate()
	new_piece["rotation"] = (current_piece["rotation"] + 1) % 4
	# Try wall kicks
	var kicks = [Vector2i(0,0), Vector2i(-1,0), Vector2i(1,0), Vector2i(-2,0), Vector2i(2,0)]
	for kick in kicks:
		new_piece["position"] = current_piece["position"] + kick
		if _is_valid_position(new_piece):
			current_piece = new_piece
			queue_redraw()
			return

func _hard_drop() -> void:
	while _is_valid_position({ "key": current_piece["key"], "rotation": current_piece["rotation"], "position": current_piece["position"] + Vector2i(0, 1) }):
		current_piece["position"] += Vector2i(0, 1)
	_lock_piece()

func _drop_piece() -> void:
	var new_piece = current_piece.duplicate()
	new_piece["position"] = current_piece["position"] + Vector2i(0, 1)
	if _is_valid_position(new_piece):
		current_piece = new_piece
		queue_redraw()
	else:
		_lock_piece()

func _lock_piece() -> void:
	var cells := _get_piece_cells(current_piece)
	var color: Color = TETROMINOES[current_piece["key"]]["color"]
	
	for cell in cells:
		if cell.y >= 0 and cell.y < GRID_HEIGHT:
			grid[cell.y][cell.x] = color
	
	_check_rows()
	
	# Audio: piece locked
	if AudioManager:
		AudioManager.play_stone_chime("preseli_blue_stone", -8.0)
	
	_spawn_piece()
	queue_redraw()

func _check_rows() -> void:
	var rows_to_clear: Array[int] = []
	
	for y in range(GRID_HEIGHT):
		var full := true
		for x in range(GRID_WIDTH):
			if grid[y][x] == null:
				full = false
				break
		if full:
			rows_to_clear.append(y)
	
	if rows_to_clear.is_empty():
		return
	
	# Clear and shift rows (bottom to top)
	for y in rows_to_clear:
		for x in range(GRID_WIDTH):
			grid[y][x] = null
		# Shift everything above down
		for shift_y in range(y, 0, -1):
			for x in range(GRID_WIDTH):
				grid[shift_y][x] = grid[shift_y - 1][x]
		# Clear top row
		for x in range(GRID_WIDTH):
			grid[0][x] = null
	
	# Update score
	var cleared := rows_to_clear.size()
	rows_cleared += cleared
	score += [0, 100, 300, 500, 800][cleared] * level
	
	# Level up every 5 rows
	level = 1 + int(rows_cleared / 5)
	drop_interval = max(0.1, 1.0 - (level - 1) * 0.1)
	
	_update_ui()
	
	# Audio: row clear stinger
	if AudioManager and cleared > 0:
		AudioManager.play_stinger("standing_stones_row_clear")
		if cleared >= 4:  # Tetris!
			AudioManager.play_stinger("standing_stones_level_up")
	
	# Steam: track rows
	if SteamManager and cleared > 0:
		if rows_cleared >= 10:
			SteamManager.unlock_achievement("first_game")
	
	# Check win condition
	if rows_cleared >= ROWS_TO_WIN:
		_win()

func _win() -> void:
	current_state = State.WIN
	win_screen.visible = true
	
	# Audio: victory — Nine Songs chord
	if AudioManager:
		AudioManager.play_stinger("fae_portal_ignition")
		await get_tree().create_timer(0.5).timeout
		AudioManager.play_nine_songs_chord()
	
	# Steam: unlock Fae Kingdom achievement
	if SteamManager:
		SteamManager.unlock_achievement("first_game")
		SteamManager.unlock_achievement("fae_portal_unlocked")
	
	# Notify GameManager — this unlocks the Fae Kingdom portal!
	GameManager.complete_game("standing_stones", score)

func _game_over() -> void:
	current_state = State.GAME_OVER
	game_over_screen.visible = true
	
	# Audio: defeat
	if AudioManager:
		AudioManager.play_stinger("monster_encounter")

func _on_game_completed(game_id: String) -> void:
	if game_id == "standing_stones":
		# Show the Fae Kingdom portal igniting
		print("=== STONEHENGE COMPLETE ===")
		print("The Fae Kingdom portal ignites...")
		print("Preseli Blue Stone earned!")
		print("New area unlocked: Fae Kingdom")
		# TODO: Transition to Fae Kingdom portal cutscene

func _update_ui() -> void:
	if score_label:
		score_label.text = "Score: %d" % score
	if rows_label:
		rows_label.text = "Stones Placed: %d / %d" % [rows_cleared, ROWS_TO_WIN]
	if level_label:
		level_label.text = "Level: %d" % level

# === Rendering ===
func _draw() -> void:
	# Draw grid background (ancient stone texture placeholder)
	var grid_rect := Rect2(0, 0, GRID_WIDTH * CELL_SIZE, GRID_HEIGHT * CELL_SIZE)
	draw_rect(grid_rect, Color(0.12, 0.1, 0.08), true)  # Dark stone background
	
	# Draw grid lines
	for x in range(GRID_WIDTH + 1):
		draw_line(
			Vector2(x * CELL_SIZE, 0),
			Vector2(x * CELL_SIZE, GRID_HEIGHT * CELL_SIZE),
			Color(0.2, 0.18, 0.15), 1.0
		)
	for y in range(GRID_HEIGHT + 1):
		draw_line(
			Vector2(0, y * CELL_SIZE),
			Vector2(GRID_WIDTH * CELL_SIZE, y * CELL_SIZE),
			Color(0.2, 0.18, 0.15), 1.0
		)
	
	# Draw locked blocks
	for y in range(GRID_HEIGHT):
		for x in range(GRID_WIDTH):
			if grid[y][x] != null:
				_draw_block(Vector2i(x, y), grid[y][x])
	
	# Draw current piece
	if current_piece.size() > 0:
		var cells := _get_piece_cells(current_piece)
		var color: Color = TETROMINOES[current_piece["key"]]["color"]
		for cell in cells:
			if cell.y >= 0:
				_draw_block(cell, color)
	
	# Draw Stonehenge progress bar on the right side
	var bar_x := GRID_WIDTH * CELL_SIZE + 20
	var bar_width := 16
	var bar_height := GRID_HEIGHT * CELL_SIZE
	var progress := float(rows_cleared) / float(ROWS_TO_WIN)
	
	# Bar background
	draw_rect(Rect2(bar_x, 0, bar_width, bar_height), Color(0.15, 0.12, 0.1), true)
	# Progress fill (glowing blue — Preseli bluestone energy)
	var fill_height := bar_height * progress
	draw_rect(Rect2(bar_x, bar_height - fill_height, bar_width, fill_height), Color(0.4, 0.9, 1.0, 0.8), true)

func _draw_block(cell: Vector2i, color: Color) -> void:
	var rect := Rect2(
		cell.x * CELL_SIZE + 1,
		cell.y * CELL_SIZE + 1,
		CELL_SIZE - 2,
		CELL_SIZE - 2
	)
	
	# Main fill
	draw_rect(rect, color, true)
	
	# Highlight (top-left)
	draw_rect(
		Rect2(rect.position, Vector2(rect.size.x, 3)),
		color.lightened(0.3),
		true
	)
	draw_rect(
		Rect2(rect.position, Vector2(3, rect.size.y)),
		color.lightened(0.3),
		true
	)
	
	# Shadow (bottom-right)
	draw_rect(
		Rect2(rect.position + Vector2(0, rect.size.y - 3), Vector2(rect.size.x, 3)),
		color.darkened(0.3),
		true
	)
	draw_rect(
		Rect2(rect.position + Vector2(rect.size.x - 3, 0), Vector2(3, rect.size.y)),
		color.darkened(0.3),
		true
	)
