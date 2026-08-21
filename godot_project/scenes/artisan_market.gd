class_name ArtisanMarket
extends Node2D

## Script for the 'Artisan Market' scene in Geode Inn.
## Features a warm timber market hall with y-sorted vendor stalls and NPCs,
## CanvasModulate #241C18, multiple overlapping warm lights (#F5EFE3, energy 0.6),
## cloth canopy wave shader (gentle sine movement for stall awnings),
## and interactive merchant booths including the Soulstice Jewelry booth.

signal booth_interacted(booth_id: String, booth_name: String, items_catalog: Array)

@export_group("Canvas Atmosphere")
## Timber market hall canvas tint (#241C18)
@export var canvas_tint: Color = Color("241c18")

@export_group("Warm Overhead Lighting")
## Market stall warm lamp color (#F5EFE3)
@export var lamp_color: Color = Color("f5efe3")
@export var lamp_energy: float = 0.6
@export var lamp_positions: Array[Vector2] = [
	Vector2(400, 320),
	Vector2(800, 320),
	Vector2(1200, 320),
	Vector2(1600, 320),
	Vector2(600, 680),
	Vector2(1000, 680),
	Vector2(1400, 680)
]

# Nodes
var _canvas_modulate: CanvasModulate
var _market_y_sort_node: Node2D
var _booth_container: Node2D
var _market_lights: Array[PointLight2D] = []
var _market_ui: CanvasLayer

# Market Stall Catalog
var _stalls_data: Array[Dictionary] = [
	{
		"booth_id": "soulstice_jewelry",
		"name": "Soulstice Jewelry Booth",
		"vendor_name": "Lyra the Gem-Carver",
		"pos": Vector2(400, 480),
		"color": Color("b8860b"),
		"items": [
			{"name": "Moonstone Geode Pendant", "price": "45 Crystalline Shards"},
			{"name": "Star-Sapphire Ring", "price": "75 Crystalline Shards"},
			{"name": "Sun-Amber Amulet", "price": "60 Crystalline Shards"}
		]
	},
	{
		"booth_id": "runic_woodcarvings",
		"name": "Elderwood Runic Carvings",
		"vendor_name": "Einar Wood-Singer",
		"pos": Vector2(800, 480),
		"color": Color("8b4513"),
		"items": [
			{"name": "Carved Oak Rune Talisman", "price": "25 Crystalline Shards"},
			{"name": "Pine Scented Incense Burner", "price": "15 Crystalline Shards"}
		]
	},
	{
		"booth_id": "alchemical_elixirs",
		"name": "Alembic Herbal Elixirs",
		"vendor_name": "Aurelia the Alchemist",
		"pos": Vector2(1200, 480),
		"color": Color("2e8b57"),
		"items": [
			{"name": "Warm Geode Herbal Tea", "price": "10 Crystalline Shards"},
			{"name": "Elixir of Clear Focus", "price": "35 Crystalline Shards"}
		]
	},
	{
		"booth_id": "woven_textiles",
		"name": "Silk & Loom Tapestries",
		"vendor_name": "Maren Weaver",
		"pos": Vector2(1600, 480),
		"color": Color("4682b4"),
		"items": [
			{"name": "Hand-Woven Hearth Cloak", "price": "50 Crystalline Shards"},
			{"name": "Soft Cashmere Blanket", "price": "40 Crystalline Shards"}
		]
	}
]


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("artisan_market")

	# 2. CanvasModulate setup (#241C18)
	_setup_canvas_modulate()

	# 3. Y-Sort Node setup for market hall depth
	_setup_y_sort_environment()

	# 4. Create multiple overlapping warm lights (#F5EFE3 energy 0.6)
	_setup_market_lighting()

	# 5. Build market stall booths with cloth canopy wave shaders
	_setup_market_booths_and_vendors()

	# 6. Setup Market Shop UI
	_setup_market_ui()


func _process(delta: float) -> void:
	# Epilepsy safety: Gentle sine wave pulse for market lamps (period ~ 12.5s >= 2.5s)
	var time_sec: float = Time.get_ticks_msec() * 0.0005
	var wave: float = sin(time_sec) * 0.03
	for lamp in _market_lights:
		lamp.energy = lamp_energy + wave


func _setup_canvas_modulate() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "MarketCanvasModulate"
	_canvas_modulate.color = canvas_tint
	add_child(_canvas_modulate)


func _setup_y_sort_environment() -> void:
	_market_y_sort_node = Node2D.new()
	_market_y_sort_node.name = "YSortedMarketHall"
	_market_y_sort_node.y_sort_enabled = true
	add_child(_market_y_sort_node)

	# Floor tile background
	var floor_bg := ColorRect.new()
	floor_bg.name = "MarketTimberFloor"
	floor_bg.size = Vector2(1920, 1080)
	floor_bg.color = Color("1a1410")
	add_child(floor_bg)


func _create_radial_light_texture(radius: int = 192) -> GradientTexture2D:
	var grad := Gradient.new()
	grad.set_color(0, Color(1, 1, 1, 1))
	grad.set_color(1, Color(1, 1, 1, 0))
	var tex := GradientTexture2D.new()
	tex.gradient = grad
	tex.fill = GradientTexture2D.FILL_RADIAL
	tex.fill_from = Vector2(0.5, 0.5)
	tex.fill_to = Vector2(1.0, 0.5)
	tex.width = radius * 2
	tex.height = radius * 2
	return tex


func _setup_market_lighting() -> void:
	var lights_node := Node2D.new()
	lights_node.name = "OverheadMarketLamps"
	add_child(lights_node)

	for pos in lamp_positions:
		var lamp := PointLight2D.new()
		lamp.name = "MarketLamp_" + str(pos.x) + "_" + str(pos.y)
		lamp.color = lamp_color
		lamp.energy = lamp_energy
		lamp.position = pos
		lamp.texture = _create_radial_light_texture(220)
		lamp.texture_scale = 1.4
		lights_node.add_child(lamp)
		_market_lights.append(lamp)


func _setup_market_booths_and_vendors() -> void:
	# Cloth canopy wave shader material for stall awnings
	var canopy_shader := Shader.new()
	canopy_shader.code = """
	shader_type canvas_item;

	uniform vec4 canopy_color : source_color = vec4(0.7, 0.5, 0.2, 1.0);
	uniform float wave_speed : hint_range(0.1, 2.0) = 0.5;

	void fragment() {
		vec2 uv = UV;
		// Gentle sine wave displacement representing cloth fluttering in indoor breeze
		float wave = sin(uv.x * 10.0 + TIME * wave_speed) * 0.03;
		vec2 wavy_uv = vec2(uv.x, uv.y + wave);

		// Stripe pattern
		float stripe = step(0.5, sin(wavy_uv.x * 30.0));
		vec4 col = mix(canopy_color, canopy_color * 0.75, stripe);

		COLOR = col;
	}
	"""

	for data in _stalls_data:
		var stall_root := Node2D.new()
		stall_root.name = "StallNode_" + data["booth_id"]
		stall_root.position = data["pos"]
		stall_root.y_sort_enabled = true
		_market_y_sort_node.add_child(stall_root)

		# 1. Cloth Canopy Awning with wave shader
		var awning := ColorRect.new()
		awning.name = "ClothCanopyAwning"
		awning.size = Vector2(220, 70)
		awning.position = Vector2(-110, -120)

		var mat := ShaderMaterial.new()
		mat.shader = canopy_shader
		mat.set_shader_parameter("canopy_color", data["color"])
		awning.material = mat
		stall_root.add_child(awning)

		# 2. Timber Counter Countertop
		var counter := ColorRect.new()
		counter.name = "TimberCounter"
		counter.size = Vector2(200, 50)
		counter.position = Vector2(-100, -40)
		counter.color = Color("38271a")
		stall_root.add_child(counter)

		# 3. Y-sorted NPC Vendor Sprite Placeholder
		var vendor := ColorRect.new()
		vendor.name = "VendorNPC_" + data["vendor_name"]
		vendor.size = Vector2(40, 70)
		vendor.position = Vector2(-20, -90) # Positioned behind counter
		vendor.color = data["color"].lightened(0.2)
		stall_root.add_child(vendor)

		# 4. Interactive Area2D for shopping
		var area := Area2D.new()
		area.name = "BoothInteractArea"
		
		var shape := CollisionShape2D.new()
		var rect := RectangleShape2D.new()
		rect.size = Vector2(240, 140)
		shape.shape = rect
		area.add_child(shape)

		area.input_event.connect(_on_booth_input_event.bind(data))
		stall_root.add_child(area)


func _on_booth_input_event(_vp: Node, event: InputEvent, _idx: int, data: Dictionary) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_show_market_shop(data)
		booth_interacted.emit(data["booth_id"], data["name"], data["items"])


func _setup_market_ui() -> void:
	_market_ui = CanvasLayer.new()
	_market_ui.name = "MarketUILayer"
	_market_ui.visible = false
	add_child(_market_ui)

	var panel := PanelContainer.new()
	panel.name = "ShopPanel"
	panel.anchor_left = 0.2
	panel.anchor_top = 0.65
	panel.anchor_right = 0.8
	panel.anchor_bottom = 0.94
	_market_ui.add_child(panel)

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

	var name_lbl := Label.new()
	name_lbl.name = "BoothTitle"
	name_lbl.add_theme_color_override("font_color", lamp_color)
	vbox.add_child(name_lbl)

	var vendor_lbl := Label.new()
	vendor_lbl.name = "VendorName"
	vbox.add_child(vendor_lbl)

	var items_lbl := Label.new()
	items_lbl.name = "ItemsList"
	items_lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
	vbox.add_child(items_lbl)


func _show_market_shop(data: Dictionary) -> void:
	var title_lbl: Label = _market_ui.get_node("ShopPanel/Margin/VBox/BoothTitle")
	var vendor_lbl: Label = _market_ui.get_node("ShopPanel/Margin/VBox/VendorName")
	var items_lbl: Label = _market_ui.get_node("ShopPanel/Margin/VBox/ItemsList")

	title_lbl.text = data["name"]
	vendor_lbl.text = "Merchant: " + data["vendor_name"]

	var catalog_text: String = "Available Goods:\n"
	for item in data["items"]:
		catalog_text += " • " + item["name"] + " — " + item["price"] + "\n"

	items_lbl.text = catalog_text
	_market_ui.visible = true

	var tween := create_tween()
	tween.tween_interval(6.0)
	tween.tween_callback(func(): _market_ui.visible = false)
