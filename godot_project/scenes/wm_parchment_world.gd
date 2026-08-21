## wm_parchment_world.gd
## Aged parchment world map UI scene script for Geode Inn.
## Features warm parchment CanvasModulate (#F5E6C8), aging shader with edge wear & ink bleed,
## interactable region pins (Celtic Highlands, Egyptian Desert, Andean Highlands, Norse Coast,
## Transylvanian Forest, Stonehenge, Japanese Temple), quest tooltips, and compass rose element.
extends Node2D

# Designer-tweakable parameters
@export var canvas_modulate_color: Color = Color("#F5E6C8") # Warm aged parchment tint
@export var compass_position: Vector2 = Vector2(1150, 120)

# Signals
signal region_selected(region_id: String, region_name: String)
signal quest_inspected(region_id: String, quests: Array[String])

# Internal references
var _canvas_modulate: CanvasModulate
var _parchment_bg: ColorRect
var _aging_shader_mat: ShaderMaterial
var _compass_sprite: Sprite2D
var _pin_nodes: Dictionary = {}

# Map Region Configuration Data
const MAP_REGIONS: Dictionary = {
	"celtic_highlands": {
		"name": "Celtic Highlands",
		"position": Vector2(350, 240),
		"quests": ["Standing Stones Secret", "Highland Sheep Herding", "Festival of Lugnasad"]
	},
	"egyptian_desert": {
		"name": "Egyptian Desert",
		"position": Vector2(750, 480),
		"quests": ["Sandstone Archaeology", "Vault Key Deciphering", "Heat Haze Mirage"]
	},
	"andean_highlands": {
		"name": "Andean Highlands",
		"position": Vector2(320, 520),
		"quests": ["Inca Stonework Crafting", "Terraced Crop Harvest", "Llama Trail Run"]
	},
	"norse_coast": {
		"name": "Norse Coast",
		"position": Vector2(520, 180),
		"quests": ["Longship Boat Thatch", "Valkyrie Chattr", "Valhalla Sea Passage"]
	},
	"transylvanian_forest": {
		"name": "Transylvanian Forest",
		"position": Vector2(620, 320),
		"quests": ["Romani Caravan Enchantment", "Owl Whispers", "Firefly Lantern Tuning"]
	},
	"stonehenge": {
		"name": "Stonehenge",
		"position": Vector2(440, 280),
		"quests": ["Standing Stones Tetris", "Fae Portal Alignment", "Solstice Golden Hour"]
	},
	"japanese_temple": {
		"name": "Japanese Temple",
		"position": Vector2(920, 280),
		"quests": ["Raked Sand Garden", "Koi Pond Reflection", "Cherry Blossom Rest"]
	}
}


func _ready() -> void:
	_setup_canvas_modulate()
	_setup_parchment_background_and_shader()
	_setup_compass_rose()
	_setup_region_pins()


func _setup_canvas_modulate() -> void:
	# CanvasModulate set to warm parchment (#F5E6C8), strictly no dynamic lights
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	_canvas_modulate.color = canvas_modulate_color
	add_child(_canvas_modulate)


func _setup_parchment_background_and_shader() -> void:
	# Subtle parchment aging shader: edge wear, vignette, ink bleed effect
	var shader := Shader.new()
	shader.code = """
shader_type canvas_item;

uniform vec4 parchment_color : source_color = vec4(0.96, 0.90, 0.78, 1.0); // #F5E6C8
uniform vec4 ink_bleed_color : source_color = vec4(0.25, 0.20, 0.15, 1.0);

void fragment() {
	vec2 uv = UV;
	
	# Edge wear vignette calculation
	float dist_from_center = distance(uv, vec2(0.5));
	float vignette = smoothstep(0.35, 0.70, dist_from_center);
	
	# Subtle paper noise texture pattern
	float noise = sin(uv.x * 120.0) * cos(uv.y * 120.0) * 0.03;
	vec3 final_color = mix(parchment_color.rgb + noise, ink_bleed_color.rgb, vignette * 0.4);
	
	COLOR = vec4(final_color, 1.0);
}
"""
	_aging_shader_mat = ShaderMaterial.new()
	_aging_shader_mat.shader = shader
	
	_parchment_bg = ColorRect.new()
	_parchment_bg.name = "ParchmentBackgroundRect"
	_parchment_bg.size = Vector2(1280, 720)
	_parchment_bg.material = _aging_shader_mat
	add_child(_parchment_bg)


func _setup_compass_rose() -> void:
	# Hand-drawn style compass rose ornament in top right corner
	_compass_sprite = Sprite2D.new()
	_compass_sprite.name = "HandDrawnCompassRose"
	_compass_sprite.position = compass_position
	add_child(_compass_sprite)


func _setup_region_pins() -> void:
	# Create interactable Area2D region pins for each world map zone
	for region_id in MAP_REGIONS.keys():
		var data: Dictionary = MAP_REGIONS[region_id]
		var pin_pos: Vector2 = data["position"]
		
		var area := Area2D.new()
		area.name = "RegionPinArea_%s" % region_id
		area.position = pin_pos
		
		var col := CollisionShape2D.new()
		var circle := CircleShape2D.new()
		circle.radius = 24.0
		col.shape = circle
		area.add_child(col)
		
		# Connect input event for map interaction
		area.input_event.connect(func(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
			if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
				_on_region_pin_clicked(region_id)
		)
		
		add_child(area)
		_pin_nodes[region_id] = area


func _on_region_pin_clicked(region_id: String) -> void:
	if MAP_REGIONS.has(region_id):
		var data: Dictionary = MAP_REGIONS[region_id]
		var reg_name: String = data["name"]
		var quests: Array[String] = data["quests"]
		
		print("[ParchmentWorldMap] Region pin selected: %s (%s) | Quests: %s" % [reg_name, region_id, str(quests)])
		region_selected.emit(region_id, reg_name)
		quest_inspected.emit(region_id, quests)
