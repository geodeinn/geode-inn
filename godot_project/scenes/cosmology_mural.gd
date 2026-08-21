class_name CosmologyMural
extends Node2D

## Script for the 'Cosmology Mural' ceiling gallery scene in Geode Inn.
## Features a parallax ceiling mural with CanvasModulate #302E32, sconce uplights (#B29F8B energy 0.6),
## gold leaf shimmer specular light shader, normal-map depth shader for plaster cracks,
## and extremely sparse falling plaster dust particles.

signal mural_section_examined(section_id: String, section_title: String)

@export_group("Canvas Atmosphere")
## Deep atmospheric canvas tint (#302E32)
@export var canvas_tint: Color = Color("302e32")

@export_group("Sconce Uplighting")
## Sconce uplight warm stone color (#B29F8B)
@export var sconce_color: Color = Color("b29f8b")
@export var sconce_energy: float = 0.6
@export var sconce_positions: Array[Vector2] = [
	Vector2(320, 800),
	Vector2(740, 800),
	Vector2(1180, 800),
	Vector2(1600, 800)
]

@export_group("Plaster Dust Particles")
## Extremely sparse plaster dust particle count (epilepsy & visual clarity safe)
@export var dust_particle_count: int = 14

# Nodes
var _canvas_modulate: CanvasModulate
var _mural_parallax_bg: ParallaxBackground
var _sconce_lights: Array[PointLight2D] = []
var _mural_rect: ColorRect
var _dust_particles: GPUParticles2D
var _ui_layer: CanvasLayer

# Mural Interactive Sections
var _mural_sections: Array[Dictionary] = [
	{
		"id": "creation_myth",
		"title": "Cosmic Yggdrasil & Star Roots",
		"pos": Vector2(400, 400),
		"desc": "Intricate gold leaf inlay depicting the World Tree intertwining with celestial constellations."
	},
	{
		"id": "zodiac_wheel",
		"title": "Alchemical Wheel of Ages",
		"pos": Vector2(960, 350),
		"desc": "Fresco painting showing planetary movements etched in plaster with deep crack relief."
	},
	{
		"id": "ascension_tapestry",
		"title": "Tapestry of Divine Light",
		"pos": Vector2(1520, 400),
		"desc": "Gold leaf shimmer highlights mortal souls ascending toward celestial heights."
	}
]


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("cosmology_mural")

	# 2. CanvasModulate setup (#302E32)
	_setup_canvas_modulate()

	# 3. Build Parallax ceiling mural background with Gold Leaf Shimmer & Plaster Normal-Map Shader
	_setup_ceiling_mural_parallax()

	# 4. Instantiate sconce uplights (#B29F8B, energy 0.6)
	_setup_sconce_uplights()

	# 5. Build extremely sparse plaster dust particles emitter
	_setup_sparse_plaster_dust()

	# 6. Set up interactive Area2Ds for mural examination
	_setup_mural_interactables()

	# 7. Setup UI overlay for mural lore
	_setup_lore_ui()


func _process(delta: float) -> void:
	# Epilepsy safety: Gentle sine wave pulse for sconce uplights (period ~ 12.5s >= 2.5s)
	var time_sec: float = Time.get_ticks_msec() * 0.0005
	var wave: float = sin(time_sec) * 0.04
	for light in _sconce_lights:
		light.energy = sconce_energy + wave


func _setup_canvas_modulate() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "MuralCanvasModulate"
	_canvas_modulate.color = canvas_tint
	add_child(_canvas_modulate)


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


func _setup_ceiling_mural_parallax() -> void:
	_mural_parallax_bg = ParallaxBackground.new()
	_mural_parallax_bg.name = "CosmologyParallaxBackground"
	add_child(_mural_parallax_bg)

	var layer := ParallaxLayer.new()
	layer.name = "MuralLayer"
	layer.motion_scale = Vector2(0.3, 0.3)
	_mural_parallax_bg.add_child(layer)

	_mural_rect = ColorRect.new()
	_mural_rect.name = "MuralShimmerCanvas"
	_mural_rect.size = Vector2(2400, 1200)
	_mural_rect.position = Vector2(-240, -100)

	# Gold Leaf Shimmer shader with specular light & plaster cracks normal-map simulation
	var shader := Shader.new()
	shader.code = """
	shader_type canvas_item;

	uniform vec4 plaster_color : source_color = vec4(0.24, 0.22, 0.25, 1.0);
	uniform vec4 gold_color : source_color = vec4(0.85, 0.72, 0.38, 1.0);
	uniform float shimmer_speed : hint_range(0.01, 1.0) = 0.2;

	float crack_pattern(vec2 p) {
		vec2 i = floor(p);
		vec2 f = fract(p);
		float d = min(min(f.x, 1.0 - f.x), min(f.y, 1.0 - f.y));
		return smoothstep(0.02, 0.08, d);
	}

	void fragment() {
		vec2 uv = UV * 6.0;
		float cracks = crack_pattern(uv);
		
		// Shimmer wave moving gently across gold veins
		float shimmer = sin(UV.x * 12.0 + UV.y * 8.0 + TIME * shimmer_speed) * 0.5 + 0.5;
		shimmer = pow(shimmer, 4.0); // Specular highlight pulse

		vec4 base = mix(plaster_color * 0.7, plaster_color, cracks);
		vec4 gold_leaf = mix(gold_color, vec4(1.0, 0.95, 0.7, 1.0), shimmer);

		// Combine plaster cracks depth with specular gold leaf shimmer
		float gold_mask = step(0.65, sin(uv.x * 2.0) * cos(uv.y * 2.0));
		COLOR = mix(base, gold_leaf, gold_mask * 0.7);
	}

	void light() {
		// Specular light reflection on gold leaf mural surface
		vec3 light_dir = normalize(LIGHT_POSITION - vec3(FRAGCOORD.xy, 0.0));
		float spec = pow(max(dot(NORMAL, light_dir), 0.0), 16.0);
		LIGHT_COLOR += LIGHT_COLOR * spec * 0.4;
	}
	"""

	var mat := ShaderMaterial.new()
	mat.shader = shader
	_mural_rect.material = mat
	layer.add_child(_mural_rect)


func _setup_sconce_uplights() -> void:
	var lights_node := Node2D.new()
	lights_node.name = "SconceUplightsContainer"
	add_child(lights_node)

	for pos in sconce_positions:
		var uplight := PointLight2D.new()
		uplight.name = "SconceUplight_" + str(pos.x)
		uplight.color = sconce_color
		uplight.energy = sconce_energy
		uplight.position = pos
		uplight.texture = _create_radial_light_texture(240)
		uplight.texture_scale = 1.3
		lights_node.add_child(uplight)
		_sconce_lights.append(uplight)


func _setup_sparse_plaster_dust() -> void:
	_dust_particles = GPUParticles2D.new()
	_dust_particles.name = "PlasterDustParticles"
	_dust_particles.position = Vector2(960, 0)
	_dust_particles.amount = dust_particle_count
	_dust_particles.lifetime = 12.0
	_dust_particles.preprocess = 6.0

	var mat := ParticleProcessMaterial.new()
	mat.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
	mat.emission_box_extents = Vector3(1000, 10, 1)
	mat.direction = Vector3(0, 1, 0)
	mat.spread = 20.0
	mat.initial_velocity_min = 6.0
	mat.initial_velocity_max = 14.0
	mat.gravity = Vector3(0, 2.0, 0)
	mat.scale_min = 1.0
	mat.scale_max = 2.0

	var grad := Gradient.new()
	grad.set_color(0, Color(sconce_color.r, sconce_color.g, sconce_color.b, 0.0))
	grad.set_color(1, Color(sconce_color.r, sconce_color.g, sconce_color.b, 0.0))
	grad.add_point(0.2, Color(sconce_color.r, sconce_color.g, sconce_color.b, 0.5))
	grad.add_point(0.8, Color(sconce_color.r, sconce_color.g, sconce_color.b, 0.2))

	var grad_tex := GradientTexture1D.new()
	grad_tex.gradient = grad
	mat.color_ramp = grad_tex

	_dust_particles.process_material = mat
	add_child(_dust_particles)


func _setup_mural_interactables() -> void:
	var interactables := Node2D.new()
	interactables.name = "MuralInteractables"
	add_child(interactables)

	for sec in _mural_sections:
		var area := Area2D.new()
		area.name = "MuralArea_" + sec["id"]
		area.position = sec["pos"]

		var col := CollisionShape2D.new()
		var rect_shape := RectangleShape2D.new()
		rect_shape.size = Vector2(200, 150)
		col.shape = rect_shape
		area.add_child(col)

		area.input_event.connect(_on_mural_input_event.bind(sec))
		interactables.add_child(area)


func _on_mural_input_event(_vp: Node, event: InputEvent, _idx: int, sec: Dictionary) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_show_mural_dialog(sec["title"], sec["desc"])
		mural_section_examined.emit(sec["id"], sec["title"])


func _setup_lore_ui() -> void:
	_ui_layer = CanvasLayer.new()
	_ui_layer.name = "MuralUILayer"
	_ui_layer.visible = false
	add_child(_ui_layer)

	var panel := PanelContainer.new()
	panel.name = "LorePanel"
	panel.anchor_left = 0.2
	panel.anchor_top = 0.75
	panel.anchor_right = 0.8
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
	title_lbl.add_theme_color_override("font_color", sconce_color)
	vbox.add_child(title_lbl)

	var desc_lbl := Label.new()
	desc_lbl.name = "Desc"
	desc_lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
	vbox.add_child(desc_lbl)


func _show_mural_dialog(title: String, desc: String) -> void:
	var title_lbl: Label = _ui_layer.get_node("LorePanel/Margin/VBox/Title")
	var desc_lbl: Label = _ui_layer.get_node("LorePanel/Margin/VBox/Desc")

	title_lbl.text = title
	desc_lbl.text = desc
	_ui_layer.visible = true

	var tween := create_tween()
	tween.tween_interval(5.0)
	tween.tween_callback(func(): _ui_layer.visible = false)
