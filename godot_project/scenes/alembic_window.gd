class_name AlembicWindow
extends Node2D

## Script for the 'Alembic Window' intimate laboratory alcove in Geode Inn.
## Features a dark gothic stone window with alchemical glass tube apparatus,
## CanvasModulate #0F1218, stained glass light shaft shader, animated liquid tube flow shader,
## warm interior glow (#E09B69 energy 0.5), creating a very dark, intimate, contemplative space.

signal flow_observed(fluid_rate: float)

@export_group("Canvas Atmosphere")
## Very dark gothic alcove canvas tint (#0F1218)
@export var canvas_tint: Color = Color("0f1218")

@export_group("Interior Lighting")
## Warm interior amber glow color (#E09B69)
@export var interior_glow_color: Color = Color("e09b69")
@export var interior_glow_energy: float = 0.5
@export var window_center_pos: Vector2 = Vector2(960, 480)

@export_group("Liquid Apparatus Flow")
## Speed multiplier for animated liquid flowing through glass tubes
@export_range(0.1, 3.0) var fluid_flow_speed: float = 0.8

# Nodes
var _canvas_modulate: CanvasModulate
var _interior_light: PointLight2D
var _stained_glass_shaft: ColorRect
var _liquid_tubes_rect: ColorRect
var _contemplation_area: Area2D
var _ui_layer: CanvasLayer


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("alembic_window")

	# 2. CanvasModulate setup (#0F1218)
	_setup_canvas_modulate()

	# 3. Gothic stone arch window environment
	_setup_gothic_arch_window()

	# 4. Warm interior glow (#E09B69 energy 0.5)
	_setup_interior_glow()

	# 5. Stained glass light shaft shader
	_setup_stained_glass_shaft_shader()

	# 6. Animated liquid tube flow shader
	_setup_liquid_tube_flow_shader()

	# 7. Contemplative interaction area
	_setup_contemplative_interaction()

	# 8. Setup UI overlay for contemplation lore
	_setup_ui()


func _process(delta: float) -> void:
	# Epilepsy safety: Gentle sine wave pulse for warm interior glow (period ~ 12.5s >= 2.5s)
	if _interior_light != null:
		var wave: float = sin(Time.get_ticks_msec() * 0.0005) * 0.04
		_interior_light.energy = interior_glow_energy + wave


func _setup_canvas_modulate() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "AlcoveCanvasModulate"
	_canvas_modulate.color = canvas_tint
	add_child(_canvas_modulate)


func _setup_gothic_arch_window() -> void:
	var bg := ColorRect.new()
	bg.name = "GothicAlcoveWall"
	bg.size = Vector2(1920, 1080)
	bg.color = Color("0a0c10")
	add_child(bg)

	# Gothic Arch Frame
	var arch := ColorRect.new()
	arch.name = "GothicStoneArch"
	arch.size = Vector2(360, 600)
	arch.position = window_center_pos - Vector2(180, 300)
	arch.color = Color("151a22")
	add_child(arch)


func _create_radial_light_texture(radius: int = 200) -> GradientTexture2D:
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


func _setup_interior_glow() -> void:
	if get_node_or_null("/root/CatacombLighting"):
		_interior_light = CatacombLighting.create_torch_light(interior_glow_color, interior_glow_energy, window_center_pos + Vector2(0, 100))
	else:
		_interior_light = PointLight2D.new()
		_interior_light.name = "InteriorGlowLight"
		_interior_light.color = interior_glow_color
		_interior_light.energy = interior_glow_energy
		_interior_light.position = window_center_pos + Vector2(0, 100)
		_interior_light.texture = _create_radial_light_texture(240)
		_interior_light.texture_scale = 1.4
		add_child(_interior_light)


func _setup_stained_glass_shaft_shader() -> void:
	_stained_glass_shaft = ColorRect.new()
	_stained_glass_shaft.name = "StainedGlassShaftRect"
	_stained_glass_shaft.size = Vector2(300, 520)
	_stained_glass_shaft.position = window_center_pos - Vector2(150, 260)

	var shader := Shader.new()
	shader.code = """
	shader_type canvas_item;

	uniform vec4 glass_amber : source_color = vec4(0.88, 0.61, 0.41, 0.4);
	uniform vec4 glass_violet : source_color = vec4(0.35, 0.25, 0.45, 0.4);

	void fragment() {
		vec2 uv = UV;
		float arch_shape = smoothstep(0.5, 0.48, length(vec2((uv.x - 0.5) * 1.5, (uv.y - 0.3))));
		float shaft = sin(uv.x * 12.0 + TIME * 0.1) * 0.5 + 0.5;

		vec4 col = mix(glass_amber, glass_violet, shaft);
		COLOR = col * arch_shape * (1.0 - uv.y * 0.5);
	}
	"""

	var mat := ShaderMaterial.new()
	mat.shader = shader
	_stained_glass_shaft.material = mat
	add_child(_stained_glass_shaft)


func _setup_liquid_tube_flow_shader() -> void:
	_liquid_tubes_rect = ColorRect.new()
	_liquid_tubes_rect.name = "LiquidTubeFlowRect"
	_liquid_tubes_rect.size = Vector2(260, 380)
	_liquid_tubes_rect.position = window_center_pos - Vector2(130, 190)

	var shader := Shader.new()
	shader.code = """
	shader_type canvas_item;

	uniform vec4 fluid_color : source_color = vec4(0.9, 0.55, 0.3, 0.85);
	uniform float flow_speed : hint_range(0.1, 5.0) = 0.8;

	void fragment() {
		vec2 uv = UV;

		// Serpentine tube mask
		float tube_mask = step(0.04, abs(sin(uv.y * 18.0) * 0.35 - (uv.x - 0.5)));

		// Animated fluid pulses traveling through glass tubes
		float flow = sin(uv.y * 40.0 - TIME * flow_speed * 4.0) * 0.5 + 0.5;
		flow = pow(flow, 2.0);

		vec4 fluid = mix(fluid_color * 0.6, fluid_color, flow);
		COLOR = mix(fluid, vec4(0.0), tube_mask);
	}
	"""

	var mat := ShaderMaterial.new()
	mat.shader = shader
	mat.set_shader_parameter("flow_speed", fluid_flow_speed)
	_liquid_tubes_rect.material = mat
	add_child(_liquid_tubes_rect)


func _setup_contemplative_interaction() -> void:
	_contemplation_area = Area2D.new()
	_contemplation_area.name = "ContemplationArea"
	_contemplation_area.position = window_center_pos

	var col := CollisionShape2D.new()
	var shape := CircleShape2D.new()
	shape.radius = 120.0
	col.shape = shape
	_contemplation_area.add_child(col)

	_contemplation_area.input_event.connect(func(_vp: Node, event: InputEvent, _idx: int):
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			_show_contemplation_dialog("Alembic Window", "Golden alchemical fluid circulates through glass coils, mirroring the quiet rhythm of breath and time.")
			flow_observed.emit(fluid_flow_speed)
	)
	add_child(_contemplation_area)


func _setup_ui() -> void:
	_ui_layer = CanvasLayer.new()
	_ui_layer.name = "AlembicUILayer"
	_ui_layer.visible = false
	add_child(_ui_layer)

	var panel := PanelContainer.new()
	panel.name = "AlembicPanel"
	panel.anchor_left = 0.25
	panel.anchor_top = 0.72
	panel.anchor_right = 0.75
	panel.anchor_bottom = 0.92
	_ui_layer.add_child(panel)

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
	title_lbl.add_theme_color_override("font_color", interior_glow_color)
	vbox.add_child(title_lbl)

	var desc_lbl := Label.new()
	desc_lbl.name = "Desc"
	desc_lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
	vbox.add_child(desc_lbl)


func _show_contemplation_dialog(title: String, desc: String) -> void:
	var title_lbl: Label = _ui_layer.get_node("AlembicPanel/Margin/VBox/Title")
	var desc_lbl: Label = _ui_layer.get_node("AlembicPanel/Margin/VBox/Desc")

	title_lbl.text = title
	desc_lbl.text = desc
	_ui_layer.visible = true

	var tween := create_tween()
	tween.tween_interval(5.0)
	tween.tween_callback(func(): _ui_layer.visible = false)
