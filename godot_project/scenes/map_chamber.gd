## map_chamber.gd
## World map navigation hub for Geode Inn.
## Features a domed circular chamber with a central stone map table, interactive scroll shelves,
## parallax dome background, and lighting configured via CatacombLighting autoload.
extends Node2D

# Designer-tweakable parameters
@export var table_position: Vector2 = Vector2(640, 480)
@export var spotlight_color: Color = Color.WHITE
@export var spotlight_energy: float = 1.2
@export var sconce_color: Color = CatacombLighting.COLOR_WARM_SCONCE_GOLD # #FFB347
@export var sconce_energy: float = 0.8
@export var crystal_color: Color = CatacombLighting.COLOR_COOL_TURQUOISE # #00E6FF
@export var crystal_pulse_hz: float = 0.3
@export var scroll_shelves_positions: Array[Vector2] = [
	Vector2(250, 300),
	Vector2(1030, 300),
	Vector2(320, 580),
	Vector2(960, 580)
]

# Signals
signal map_table_opened()
signal scroll_shelf_inspected(index: int)

# Scene references / Node pointers
@onready var canvas_modulate: CanvasModulate = $CanvasModulate if has_node("CanvasModulate") else null
@onready var parallax_bg: ParallaxBackground = $ParallaxBackground if has_node("ParallaxBackground") else null

var _sconce_lights: Array[PointLight2D] = []
var _crystal_lights: Array[PointLight2D] = []
var _table_area: Area2D
var _shelf_areas: Array[Area2D] = []


func _ready() -> void:
	_setup_atmosphere()
	_setup_parallax_dome()
	_setup_lights()
	_setup_map_table()
	_setup_scroll_shelves()


func _process(delta: float) -> void:
	# Parallax ambient rotation / micro-drift for atmospheric depth
	if parallax_bg:
		parallax_bg.scroll_offset.x += 2.0 * delta


func _setup_atmosphere() -> void:
	if not canvas_modulate:
		canvas_modulate = CanvasModulate.new()
		canvas_modulate.name = "CanvasModulate"
		add_child(canvas_modulate)
	
	# Apply zone preset from CatacombLighting autoload
	CatacombLighting.apply_zone_atmosphere("map_chamber", canvas_modulate)
	
	# Add atmospheric mist
	var mist := CatacombLighting.create_mist_particles()
	mist.position = Vector2(640, 360)
	add_child(mist)


func _setup_parallax_dome() -> void:
	if not parallax_bg:
		parallax_bg = ParallaxBackground.new()
		parallax_bg.name = "ParallaxBackground"
		add_child(parallax_bg)
	
	var layer := ParallaxLayer.new()
	layer.motion_scale = Vector2(0.2, 0.2)
	parallax_bg.add_child(layer)
	
	# Dome ceiling visual sprite container
	var dome_sprite := Sprite2D.new()
	dome_sprite.name = "DomeCeilingSprite"
	dome_sprite.position = Vector2(640, 200)
	layer.add_child(dome_sprite)


func _setup_lights() -> void:
	# 1. Overhead spotlight focused directly on the central stone relief map table (#FFFFFF)
	var spotlight := PointLight2D.new()
	spotlight.name = "OverheadSpotlight"
	spotlight.color = spotlight_color
	spotlight.energy = spotlight_energy
	spotlight.position = table_position + Vector2(0, -180)
	spotlight.texture = CatacombLighting._generate_radial_light_texture(384)
	spotlight.texture_scale = 2.0
	spotlight.enabled = true
	add_child(spotlight)
	
	# 2. Warm wall sconces (#FFB347) placed symmetrically in alcoves
	var sconce_positions: Array[Vector2] = [
		Vector2(180, 250), Vector2(1100, 250),
		Vector2(180, 500), Vector2(1100, 500)
	]
	for pos in sconce_positions:
		var sconce := CatacombLighting.create_torch_light(sconce_color, sconce_energy, pos)
		add_child(sconce)
		_sconce_lights.append(sconce)
		
	# 3. Turquoise crystals (#00E6FF) with gentle 0.3Hz pulsing around chamber perimeter
	var crystal_positions: Array[Vector2] = [
		Vector2(400, 220), Vector2(880, 220),
		Vector2(300, 420), Vector2(980, 420)
	]
	for pos in crystal_positions:
		var crystal := CatacombLighting.create_crystal_light(crystal_color, 0.7, pos, crystal_pulse_hz)
		add_child(crystal)
		_crystal_lights.append(crystal)


func _setup_map_table() -> void:
	# Interactive stone relief table Area2D
	_table_area = Area2D.new()
	_table_area.name = "MapTableArea"
	_table_area.position = table_position
	
	var col := CollisionShape2D.new()
	var circle := CircleShape2D.new()
	circle.radius = 90.0
	col.shape = circle
	_table_area.add_child(col)
	
	# Visual representation of stone table (#D6CDB8 relief map)
	var table_sprite := Sprite2D.new()
	table_sprite.name = "StoneTableSprite"
	table_sprite.modulate = CatacombLighting.COLOR_STONE_MAP_TABLE
	_table_area.add_child(table_sprite)
	
	_table_area.input_event.connect(_on_table_input_event)
	add_child(_table_area)


func _setup_scroll_shelves() -> void:
	for i in range(scroll_shelves_positions.size()):
		var shelf_pos := scroll_shelves_positions[i]
		var shelf_area := Area2D.new()
		shelf_area.name = "ScrollShelfArea_%d" % i
		shelf_area.position = shelf_pos
		
		var col := CollisionShape2D.new()
		var rect := RectangleShape2D.new()
		rect.size = Vector2(80, 100)
		col.shape = rect
		shelf_area.add_child(col)
		
		# Shelf sprite visual (sandstone tint #C2A88D)
		var shelf_sprite := Sprite2D.new()
		shelf_sprite.name = "ShelfSprite"
		shelf_sprite.modulate = CatacombLighting.COLOR_STONE_SANDSTONE
		shelf_area.add_child(shelf_sprite)
		
		var shelf_idx := i
		shelf_area.input_event.connect(func(_viewport, event: InputEvent, _shape_idx):
			if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
				_on_scroll_shelf_clicked(shelf_idx)
		)
		
		add_child(shelf_area)
		_shelf_areas.append(shelf_area)


func _on_table_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("[MapChamber] Map Table clicked — Opening World Map UI.")
		map_table_opened.emit()


func _on_scroll_shelf_clicked(index: int) -> void:
	print("[MapChamber] Scroll Shelf #%d clicked — Reading archive scroll." % index)
	scroll_shelf_inspected.emit(index)
