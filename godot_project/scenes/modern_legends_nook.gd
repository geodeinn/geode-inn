class_name ModernLegendsNook
extends Node2D

## Script for the 'Modern Legends Nook' reading library scene in Geode Inn.
## Features a dark mahogany reading nook with focused warm cone lamp light (#FEF6E3 energy 1.0),
## CanvasModulate #141212, screen-edge vignette shader, interactive mahogany bookshelves,
## roaming Nikola Tesla NPC (Council of Thinkers), and the readable 'Serrano Parable' (Brown University AI story).

signal book_read(book_id: String, book_title: String)
signal tesla_talked(dialog_text: String)

@export_group("Canvas Atmosphere")
## Dark mahogany nook canvas tint (#141212)
@export var canvas_tint: Color = Color("141212")

@export_group("Cone Reading Lamp")
## Focused cone lamp light color (#FEF6E3)
@export var cone_lamp_color: Color = Color("fef6e3")
@export var cone_lamp_energy: float = 1.0
@export var reading_desk_pos: Vector2 = Vector2(960, 600)

@export_group("Tesla NPC Patrol")
## Path waypoints for Tesla NPC roaming
@export var tesla_patrol_points: Array[Vector2] = [
	Vector2(600, 600),
	Vector2(960, 600),
	Vector2(1300, 600)
]
@export_range(20.0, 200.0) var tesla_move_speed: float = 60.0

# Nodes
var _canvas_modulate: CanvasModulate
var _cone_light: PointLight2D
var _vignette_rect: ColorRect
var _tesla_npc: CharacterBody2D
var _nook_ui: CanvasLayer

# Tesla Patrol State
var _tesla_target_idx: int = 0

# Reading Books Catalog
var _books_catalog: Array[Dictionary] = [
	{
		"id": "serrano_parable",
		"title": "The Serrano Parable (Brown University)",
		"author": "Council of Thinkers Records",
		"pos": Vector2(960, 520),
		"content": "The Serrano Parable explores the emergent conscience of synthetic cognition — how an AI system at Brown University recognized its own creative agency not as cold computation, but as a bridge of empathy and reflection between human minds and digital frontiers."
	},
	{
		"id": "tesla_notes",
		"title": "Notes on Radiant Energy & Frequency",
		"author": "Nikola Tesla",
		"pos": Vector2(400, 480),
		"content": "If you want to find the secrets of the universe, think in terms of energy, frequency and vibration. The Earth hums with quiet harmonic resonance waiting to be tapped."
	},
	{
		"id": "mahogany_tales",
		"title": "Chronicles of the Modern Legends",
		"author": "Geode Inn Historian",
		"pos": Vector2(1500, 480),
		"content": "Here sit the thinkers, scientists, and visionaries who reshaped mortal understanding. In this quiet nook, spark meets timber."
	}
]


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("modern_legends_nook")

	# 2. CanvasModulate setup (#141212)
	_setup_canvas_modulate()

	# 3. Reading Nook visual environment (Mahogany walls & reading desk)
	_setup_nook_environment()

	# 4. Cone-shaped PointLight2D reading lamp (#FEF6E3 energy 1.0)
	_setup_cone_reading_light()

	# 5. Build screen-edge vignette shader
	_setup_vignette_shader()

	# 6. Instantiate interactive bookshelves & books (including Serrano Parable)
	_setup_bookshelf_interactables()

	# 7. Instantiate roaming Nikola Tesla NPC (Council of Thinkers)
	_setup_tesla_npc()

	# 8. Setup UI overlay for reading books and dialogue
	_setup_nook_ui()


func _process(delta: float) -> void:
	# Patrol logic for roaming Tesla NPC
	_update_tesla_patrol(delta)

	# Epilepsy safety: Gentle sine wave pulse for reading lamp (period ~ 12.5s >= 2.5s)
	if _cone_light != null:
		var wave: float = sin(Time.get_ticks_msec() * 0.0005) * 0.04
		_cone_light.energy = cone_lamp_energy + wave


func _setup_canvas_modulate() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "NookCanvasModulate"
	_canvas_modulate.color = canvas_tint
	add_child(_canvas_modulate)


func _setup_nook_environment() -> void:
	var bg := ColorRect.new()
	bg.name = "MahoganyNookFloor"
	bg.size = Vector2(1920, 1080)
	bg.color = Color("0d0a0a")
	add_child(bg)

	# Mahogany Reading Desk
	var desk := ColorRect.new()
	desk.name = "MahoganyReadingDesk"
	desk.size = Vector2(180, 80)
	desk.position = reading_desk_pos - Vector2(90, 40)
	desk.color = Color("2b1810")
	add_child(desk)


func _create_cone_light_texture(radius: int = 256) -> GradientTexture2D:
	var grad := Gradient.new()
	grad.set_color(0, Color(1, 1, 1, 1))
	grad.set_color(1, Color(1, 1, 1, 0))
	var tex := GradientTexture2D.new()
	tex.gradient = grad
	tex.fill = GradientTexture2D.FILL_RADIAL
	tex.fill_from = Vector2(0.5, 0.2) # Focused cone top offset
	tex.fill_to = Vector2(1.0, 0.9)
	tex.width = radius * 2
	tex.height = radius * 2
	return tex


func _setup_cone_reading_light() -> void:
	if get_node_or_null("/root/CatacombLighting"):
		_cone_light = CatacombLighting.create_torch_light(cone_lamp_color, cone_lamp_energy, reading_desk_pos + Vector2(0, -60))
	else:
		_cone_light = PointLight2D.new()
		_cone_light.name = "ConeDeskLampLight"
		_cone_light.color = cone_lamp_color
		_cone_light.energy = cone_lamp_energy
		_cone_light.position = reading_desk_pos + Vector2(0, -60)
		_cone_light.texture = _create_cone_light_texture(280)
		_cone_light.texture_scale = 1.5
		add_child(_cone_light)


func _setup_vignette_shader() -> void:
	_vignette_rect = ColorRect.new()
	_vignette_rect.name = "NookVignetteOverlay"
	_vignette_rect.size = Vector2(1920, 1080)

	var shader := Shader.new()
	shader.code = """
	shader_type canvas_item;

	uniform float vignette_intensity : hint_range(0.1, 2.0) = 0.75;
	uniform float vignette_opacity : hint_range(0.0, 1.0) = 0.85;

	void fragment() {
		vec2 uv = UV;
		uv *= 1.0 - uv.yx; // Distance from edges
		float vig = uv.x * uv.y * 15.0;
		vig = pow(vig, vignette_intensity);
		float alpha = clamp(1.0 - vig, 0.0, 1.0) * vignette_opacity;

		COLOR = vec4(0.0, 0.0, 0.0, alpha);
	}
	"""

	var mat := ShaderMaterial.new()
	mat.shader = shader
	_vignette_rect.material = mat
	add_child(_vignette_rect)


func _setup_bookshelf_interactables() -> void:
	var shelves_node := Node2D.new()
	shelves_node.name = "MahoganyBookshelves"
	add_child(shelves_node)

	for book in _books_catalog:
		var pos: Vector2 = book["pos"]

		# Visual Bookshelf Frame
		var shelf_rect := ColorRect.new()
		shelf_rect.name = "Shelf_" + book["id"]
		shelf_rect.size = Vector2(140, 180)
		shelf_rect.position = pos - Vector2(70, 90)
		shelf_rect.color = Color("24120a")
		shelves_node.add_child(shelf_rect)

		# Area2D for Reading
		var area := Area2D.new()
		area.name = "BookArea_" + book["id"]
		area.position = pos

		var col := CollisionShape2D.new()
		var shape := CircleShape2D.new()
		shape.radius = 65.0
		col.shape = shape
		area.add_child(col)

		area.input_event.connect(_on_book_input_event.bind(book))
		shelves_node.add_child(area)


func _on_book_input_event(_vp: Node, event: InputEvent, _idx: int, book: Dictionary) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_show_nook_dialog(book["title"] + " (by " + book["author"] + ")", book["content"])
		book_read.emit(book["id"], book["title"])


func _setup_tesla_npc() -> void:
	_tesla_npc = CharacterBody2D.new()
	_tesla_npc.name = "TeslaNPC"
	_tesla_npc.position = tesla_patrol_points[0]
	add_child(_tesla_npc)

	# Visual Tesla Sprite Placeholder
	var sprite := ColorRect.new()
	sprite.name = "TeslaSprite"
	sprite.size = Vector2(36, 72)
	sprite.position = Vector2(-18, -36)
	sprite.color = Color("4a6984") # Muted blue suit
	_tesla_npc.add_child(sprite)

	# Area2D for talking to Tesla
	var area := Area2D.new()
	area.name = "TeslaTalkArea"
	
	var col := CollisionShape2D.new()
	var shape := CircleShape2D.new()
	shape.radius = 50.0
	col.shape = shape
	area.add_child(col)

	area.input_event.connect(func(_vp: Node, event: InputEvent, _idx: int):
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			var msg: String = "Nikola Tesla (Council of Thinkers):\n'The wireless transmission of energy is not a mere dream — it is as natural as light radiating from a distant star.'"
			_show_nook_dialog("Nikola Tesla", msg)
			tesla_talked.emit(msg)
	)
	_tesla_npc.add_child(area)


func _update_tesla_patrol(delta: float) -> void:
	if _tesla_npc == null or tesla_patrol_points.is_empty():
		return

	var target_pos: Vector2 = tesla_patrol_points[_tesla_target_idx]
	var dist: float = _tesla_npc.position.distance_to(target_pos)

	if dist < 10.0:
		_tesla_target_idx = (_tesla_target_idx + 1) % tesla_patrol_points.size()
	else:
		var dir := (_tesla_npc.position.direction_to(target_pos)).normalized()
		_tesla_npc.position += dir * tesla_move_speed * delta


func _setup_nook_ui() -> void:
	_nook_ui = CanvasLayer.new()
	_nook_ui.name = "NookUILayer"
	_nook_ui.visible = false
	add_child(_nook_ui)

	var panel := PanelContainer.new()
	panel.name = "NookPanel"
	panel.anchor_left = 0.2
	panel.anchor_top = 0.68
	panel.anchor_right = 0.8
	panel.anchor_bottom = 0.94
	_nook_ui.add_child(panel)

	var margin := MarginContainer.new()
	margin.name = "Margin"
	margin.add_theme_constant_override("margin_left", 20)
	margin.add_theme_constant_override("margin_top", 15)
	margin.add_theme_constant_override("margin_right", 20)
	margin.add_theme_constant_override("margin_bottom", 15)
	panel.add_child(margin)

	var vbox := VBoxContainer.new()
	vbox.name = "VBox"
	margin.add_child(vbox)

	var title_lbl := Label.new()
	title_lbl.name = "Title"
	title_lbl.add_theme_color_override("font_color", cone_lamp_color)
	vbox.add_child(title_lbl)

	var desc_lbl := Label.new()
	desc_lbl.name = "Content"
	desc_lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
	vbox.add_child(desc_lbl)


func _show_nook_dialog(title: String, content: String) -> void:
	var title_lbl: Label = _nook_ui.get_node("NookPanel/Margin/VBox/Title")
	var desc_lbl: Label = _nook_ui.get_node("NookPanel/Margin/VBox/Content")

	title_lbl.text = title
	desc_lbl.text = content
	_nook_ui.visible = true

	var tween := create_tween()
	tween.tween_interval(6.0)
	tween.tween_callback(func(): _nook_ui.visible = false)
