# ZoneCollision.gd — Procedural Tilemap Collision for Geode Inn Zones
# Generates walls, corridors, and walkable space per zone
# Uses TileMapLayer with procedural tile placement based on zone layout
# Each zone has a defined collision shape: border walls, interior obstacles, corridor openings

extends Node2D

# === TILE SET (procedural — no external tileset needed) ===
# Tile types: 0 = empty (walkable), 1 = wall, 2 = pillar, 3 = water, 4 = rubble
enum Tile { EMPTY, WALL, PILLAR, WATER, RUBBLE }

const TILE_SIZE := 32
const COLS := 32  # 1024px / 32px
const ROWS := 18  # 576px / 32px

# === ZONE LAYOUTS ===
# Each zone defines: border thickness, corridor openings (edges), interior obstacle pattern
const ZONE_LAYOUTS := {
	"main_floor": {
		"border": 2,
		"openings": {"north": true, "south": true, "east": true, "west": true},
		"obstacles": "pillars_grid",  # Decorative pillars in a grid pattern
		"obstacle_spacing": 6,
		"floor_color": Color(0.08, 0.06, 0.04),
		"wall_color": Color(0.12, 0.10, 0.07),
		"accent_color": Color(0.50, 0.42, 0.20),
	},
	"cosmology": {
		"border": 1,
		"openings": {"south": true},
		"obstacles": "star_clusters",  # Scattered obstacle clusters
		"obstacle_spacing": 5,
		"floor_color": Color(0.02, 0.02, 0.08),
		"wall_color": Color(0.04, 0.04, 0.12),
		"accent_color": Color(0.30, 0.40, 0.78),
	},
	"staircase": {
		"border": 2,
		"openings": {"north": true, "south": true},
		"obstacles": "vertical_corridor",  # Narrow vertical path with side walls
		"obstacle_spacing": 4,
		"floor_color": Color(0.06, 0.05, 0.08),
		"wall_color": Color(0.08, 0.07, 0.10),
		"accent_color": Color(0.50, 0.35, 0.60),
	},
	"catacombs": {
		"border": 2,
		"openings": {"north": true, "east": true, "west": true},
		"obstacles": "maze_partial",  # Partial maze with dead ends
		"obstacle_spacing": 3,
		"floor_color": Color(0.04, 0.03, 0.03),
		"wall_color": Color(0.06, 0.05, 0.04),
		"accent_color": Color(0.45, 0.30, 0.25),
	},
	"fae_kingdom": {
		"border": 1,
		"openings": {"west": true},
		"obstacles": "organic_clusters",  # Tree-like clusters
		"obstacle_spacing": 4,
		"floor_color": Color(0.04, 0.08, 0.04),
		"wall_color": Color(0.06, 0.10, 0.05),
		"accent_color": Color(0.30, 0.78, 0.40),
	},
	"undercity": {
		"border": 2,
		"openings": {"east": true},
		"obstacles": "dense_rubble",  # Dense obstacle field
		"obstacle_spacing": 2,
		"floor_color": Color(0.03, 0.02, 0.04),
		"wall_color": Color(0.05, 0.03, 0.06),
		"accent_color": Color(0.35, 0.20, 0.45),
	},
	"archive": {
		"border": 2,
		"openings": {"west": true},
		"obstacles": "bookshelf_rows",  # Horizontal rows with gaps
		"obstacle_spacing": 5,
		"floor_color": Color(0.06, 0.05, 0.04),
		"wall_color": Color(0.08, 0.07, 0.05),
		"accent_color": Color(0.45, 0.35, 0.20),
	},
	"market": {
		"border": 2,
		"openings": {"west": true},
		"obstacles": "stall_clusters",  # Merchant stall positions
		"obstacle_spacing": 6,
		"floor_color": Color(0.07, 0.06, 0.04),
		"wall_color": Color(0.09, 0.08, 0.06),
		"accent_color": Color(0.50, 0.42, 0.20),
	},
	"campgrounds": {
		"border": 1,
		"openings": {"south": true},
		"obstacles": "scattered_trees",  # Random tree positions
		"obstacle_spacing": 5,
		"floor_color": Color(0.05, 0.07, 0.04),
		"wall_color": Color(0.07, 0.09, 0.05),
		"accent_color": Color(0.35, 0.55, 0.30),
	},
	"common_room": {
		"border": 2,
		"openings": {"west": true},
		"obstacles": "furniture_ring",  # Chairs and tables in a ring
		"obstacle_spacing": 4,
		"floor_color": Color(0.07, 0.05, 0.04),
		"wall_color": Color(0.09, 0.07, 0.05),
		"accent_color": Color(0.50, 0.40, 0.25),
	},
	"composer": {
		"border": 2,
		"openings": {"north": true},
		"obstacles": "workbench_row",  # Workbenches along one wall
		"obstacle_spacing": 8,
		"floor_color": Color(0.06, 0.05, 0.04),
		"wall_color": Color(0.08, 0.07, 0.05),
		"accent_color": Color(0.50, 0.42, 0.20),
	},
}

# === GENERATED COLLISION MAP ===
var _collision_grid: Array = []  # 2D array of Tile values
var _tile_map: TileMapLayer
var _background: Sprite2D
var _zone_bg_textures: Dictionary = {}

func _ready() -> void:
	print("[ZoneCollision] Ready — %d zone layouts defined" % ZONE_LAYOUTS.size())

func build_zone(zone_key: String, parent: Node2D) -> void:
	# Clear previous
	if _tile_map and is_instance_valid(_tile_map):
		_tile_map.queue_free()
	if _background and is_instance_valid(_background):
		_background.queue_free()
	
	if not ZONE_LAYOUTS.has(zone_key):
		print("[ZoneCollision] No layout for zone: %s — using default" % zone_key)
		zone_key = "main_floor"
	
	var layout := ZONE_LAYOUTS[zone_key]
	
	# Generate collision grid
	_collision_grid = _generate_grid(layout)
	
	# Create background sprite
	_background = Sprite2D.new()
	_background.name = "ZoneBackground"
	_background.centered = false
	_background.position = Vector2.ZERO
	_background.size = Vector2(1024, 576)
	
	# Try to load zone image
	var zone_img_path := _get_zone_image_path(zone_key)
	if ResourceLoader.exists(zone_img_path):
		_background.texture = load(zone_img_path)
		_background.scale = Vector2(
			1024.0 / _background.texture.get_width() if _background.texture else 1.0,
			576.0 / _background.texture.get_height() if _background.texture else 1.0
		)
	else:
		# Procedural background — solid color with subtle texture
		_background.texture = _make_bg_texture(layout.floor_color, layout.wall_color)
	
	parent.add_child(_background)
	parent.move_child(_background, 0)  # Behind everything
	
	# Create tilemap for collision visualization
	_tile_map = TileMapLayer.new()
	_tile_map.name = "CollisionTiles"
	parent.add_child(_tile_map)
	
	# Draw collision tiles as colored rects (visual walls)
	_draw_collision_tiles(layout)
	
	print("[ZoneCollision] Built zone: %s (%d wall tiles)" % [zone_key, _count_walls()])

func _generate_grid(layout: Dictionary) -> Array:
	var grid: Array = []
	for y in range(ROWS):
		var row: Array = []
		for x in range(COLS):
			row.append(Tile.EMPTY)
		grid.append(row)
	
	var border: int = layout.get("border", 2)
	var openings: Dictionary = layout.get("openings", {})
	
	# Border walls
	for y in range(ROWS):
		for x in range(COLS):
			if y < border or y >= ROWS - border or x < border or x >= COLS - border:
				grid[y][x] = Tile.WALL
	
	# Corridor openings
	if openings.get("north", false):
		var mid := COLS / 2
		for x in range(mid - 2, mid + 2):
			for y in range(0, border + 1):
				grid[y][x] = Tile.EMPTY
	if openings.get("south", false):
		var mid := COLS / 2
		for x in range(mid - 2, mid + 2):
			for y in range(ROWS - border - 1, ROWS):
				grid[y][x] = Tile.EMPTY
	if openings.get("west", false):
		var mid := ROWS / 2
		for y in range(mid - 2, mid + 2):
			for x in range(0, border + 1):
				grid[y][x] = Tile.EMPTY
	if openings.get("east", false):
		var mid := ROWS / 2
		for y in range(mid - 2, mid + 2):
			for x in range(COLS - border - 1, COLS):
				grid[y][x] = Tile.EMPTY
	
	# Interior obstacles
	var pattern: String = layout.get("obstacles", "none")
	var spacing: int = layout.get("obstacle_spacing", 5)
	
	match pattern:
		"pillars_grid":
			for y in range(border + 2, ROWS - border - 2, spacing):
				for x in range(border + 2, COLS - border - 2, spacing):
					grid[y][x] = Tile.PILLAR
		"star_clusters":
			var rng := RandomNumberGenerator.new()
			rng.seed = 42
			for i in range(8):
				var cx := rng.randi_range(border + 1, COLS - border - 2)
				var cy := rng.randi_range(border + 1, ROWS - border - 2)
				grid[cy][cx] = Tile.PILLAR
				# Small cluster
				if grid[cy][cx + 1] == Tile.EMPTY: grid[cy][cx + 1] = Tile.PILLAR
				if grid[cy + 1][cx] == Tile.EMPTY: grid[cy + 1][cx] = Tile.PILLAR
		"vertical_corridor":
			# Narrow the playable space for staircase
			for y in range(ROWS):
				if y > 2 and y < ROWS - 3:
					grid[y][border + 4] = Tile.WALL
					grid[y][COLS - border - 5] = Tile.WALL
		"maze_partial":
			var rng := RandomNumberGenerator.new()
			rng.seed = 77
			for y in range(border + 2, ROWS - border - 2, spacing):
				for x in range(border + 2, COLS - border - 2, spacing):
					if rng.randf() > 0.4:
						grid[y][x] = Tile.RUBBLE
						if rng.randf() > 0.5 and x + 1 < COLS - border:
							grid[y][x + 1] = Tile.RUBBLE
		"organic_clusters":
			var rng := RandomNumberGenerator.new()
			rng.seed = 13
			for i in range(12):
				var cx := rng.randi_range(border + 2, COLS - border - 3)
				var cy := rng.randi_range(border + 2, ROWS - border - 3)
				# Tree cluster
				grid[cy][cx] = Tile.PILLAR
				if cx + 1 < COLS - border: grid[cy][cx + 1] = Tile.PILLAR
				if cy + 1 < ROWS - border: grid[cy + 1][cx] = Tile.PILLAR
		"dense_rubble":
			var rng := RandomNumberGenerator.new()
			rng.seed = 99
			for y in range(border + 1, ROWS - border - 1):
				for x in range(border + 1, COLS - border - 1):
					if rng.randf() > 0.7:
						grid[y][x] = Tile.RUBBLE
		"bookshelf_rows":
			for y in range(border + 3, ROWS - border - 2, spacing):
				for x in range(border + 2, COLS - border - 2):
					grid[y][x] = Tile.WALL
				# Gap in each row
				var gap := (y * 7) % (COLS - 2 * border - 4) + border + 2
				grid[y][gap] = Tile.EMPTY
				if gap + 1 < COLS - border: grid[y][gap + 1] = Tile.EMPTY
		"stall_clusters":
			for y in range(border + 3, ROWS - border - 2, spacing):
				for x in range(border + 2, COLS - border - 2, spacing):
					grid[y][x] = Tile.PILLAR
					if x + 1 < COLS - border: grid[y][x + 1] = Tile.PILLAR
		"scattered_trees":
			var rng := RandomNumberGenerator.new()
			rng.seed = 55
			for i in range(10):
				var cx := rng.randi_range(border + 1, COLS - border - 2)
				var cy := rng.randi_range(border + 1, ROWS - border - 2)
				grid[cy][cx] = Tile.PILLAR
		"furniture_ring":
			# Tables in a ring around center
			var center_x := COLS / 2
			var center_y := ROWS / 2
			var radius := 5
			for angle in range(0, 360, 45):
				var rad := deg_to_rad(angle)
				var x := int(center_x + cos(rad) * radius)
				var y := int(center_y + sin(rad) * radius * 0.6)
				if x > border and x < COLS - border and y > border and y < ROWS - border:
					grid[y][x] = Tile.PILLAR
		"workbench_row":
			for x in range(border + 2, COLS - border - 2):
				grid[border + 1][x] = Tile.WALL
				grid[ROWS - border - 2][x] = Tile.WALL
	
	return grid

func _draw_collision_tiles(layout: Dictionary) -> void:
	# Draw walls as colored rectangles using a CanvasItem
	var wall_color := layout.get("wall_color", Color(0.1, 0.08, 0.06))
	var accent := layout.get("accent_color", Color(0.5, 0.4, 0.2))
	
	for y in range(ROWS):
		for x in range(COLS):
			var tile: int = _collision_grid[y][x]
			if tile == Tile.EMPTY:
				continue
			
			var rect := ColorRect.new()
			rect.position = Vector2(x * TILE_SIZE, y * TILE_SIZE)
			rect.size = Vector2(TILE_SIZE, TILE_SIZE)
			rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
			
			match tile:
				Tile.WALL:
					rect.color = wall_color
				Tile.PILLAR:
					rect.color = accent.darkened(0.3)
					rect.size = Vector2(TILE_SIZE - 4, TILE_SIZE - 4)
					rect.position += Vector2(2, 2)
				Tile.WATER:
					rect.color = Color(0.1, 0.15, 0.25, 0.7)
				Tile.RUBBLE:
					rect.color = wall_color.lightened(0.15)
					rect.size = Vector2(TILE_SIZE - 6, TILE_SIZE - 6)
					rect.position += Vector2(3, 3)
			
			_tile_map.add_child(rect)

func is_walkable(world_pos: Vector2) -> bool:
	var tile_x := int(world_pos.x / TILE_SIZE)
	var tile_y := int(world_pos.y / TILE_SIZE)
	
	if tile_x < 0 or tile_x >= COLS or tile_y < 0 or tile_y >= ROWS:
		return false
	
	return _collision_grid[tile_y][tile_x] == Tile.EMPTY

func get_collision_rects() -> Array:
	var rects: Array = []
	for y in range(ROWS):
		for x in range(COLS):
			if _collision_grid[y][x] != Tile.EMPTY:
				rects.append(Rect2(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE))
	return rects

func _count_walls() -> int:
	var count := 0
	for y in range(ROWS):
		for x in range(COLS):
			if _collision_grid[y][x] != Tile.EMPTY:
				count += 1
	return count

func _get_zone_image_path(zone_key: String) -> String:
	# Map zone keys to our existing zone image files
	match zone_key:
		"main_floor": return "res://assets/zones/zone_L3_main_floor_matisse_subtle.png"
		"cosmology": return "res://assets/zones/zone_L1_cosmology_turner.png"
		"staircase": return "res://assets/zones/zone_L5_staircase_escher.png"
		"catacombs": return "res://assets/zones/zone_L6_catacombs_goya.png"
		"fae_kingdom": return "res://assets/zones/zone_L7_faerie_rackham.png"
		"undercity": return "res://assets/zones/zone_L9_undercity_klimt_v2.png"
		"archive": return "res://assets/zones/z27_miskatonic.png"
		"market": return "res://assets/zones/z29_meadery_picasso.png"
		"campgrounds": return "res://assets/zones/zone_L4_campgrounds_mucha.png"
		"common_room": return "res://assets/zones/z28_garden_van_gogh.png"
		"composer": return "res://assets/zones/z33_tidal_caves.png"
		_: return "res://assets/zones/zone_L3_main_floor_matisse_subtle.png"

func _make_bg_texture(floor_color: Color, wall_color: Color) -> ImageTexture:
	var img := Image.create(1024, 576, false, Image.FORMAT_RGBA8)
	img.fill(floor_color)
	
	# Add subtle texture — random darker spots
	var rng := RandomNumberGenerator.new()
	rng.seed = floor_color.r * 1000 + floor_color.g * 100
	for i in range(500):
		var x := rng.randi_range(0, 1023)
		var y := rng.randi_range(0, 575)
		var dark := floor_color.darkened(0.05)
		img.set_pixel(x, y, dark)
	
	# Add border accent
	var border_col := wall_color.lightened(0.1)
	for x in range(1024):
		img.set_pixel(x, 0, border_col)
		img.set_pixel(x, 575, border_col)
	for y in range(576):
		img.set_pixel(0, y, border_col)
		img.set_pixel(1023, y, border_col)
	
	return ImageTexture.create_from_image(img)
