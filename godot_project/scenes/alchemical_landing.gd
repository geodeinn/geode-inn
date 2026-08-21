class_name AlchemicalLanding
extends Node2D

## Script for the 'Alchemical Landing' laboratory scene in Geode Inn.
## Located at the base of the staircase, featuring CanvasModulate #161412,
## warm alchemical glow (#B5702F energy 0.7), glass refraction shader on glassware,
## rising steam particles (GPUParticles2D), and interactable Alembic & Crucible minigame triggers.

signal alchemy_minigame_started(apparatus_type: String)
signal recipe_brewed(result_item: String)

@export_group("Canvas Atmosphere")
## Dark stone laboratory landing canvas tint (#161412)
@export var canvas_tint: Color = Color("161412")

@export_group("Alchemical Lighting")
## Warm amber alchemical glow color (#B5702F)
@export var alchemical_glow_color: Color = Color("b5702f")
@export var alchemical_glow_energy: float = 0.7
@export var lab_bench_pos: Vector2 = Vector2(960, 580)

@export_group("Steam Particles")
## Number of steam particles rising from crucibles and alembics
@export var steam_particle_count: int = 28

# Nodes
var _canvas_modulate: CanvasModulate
var _alchemical_light: PointLight2D
var _steam_particles: GPUParticles2D
var _glass_refraction_rect: ColorRect
var _alembic_area: Area2D
var _crucible_area: Area2D
var _alchemy_ui: CanvasLayer


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("alchemical_landing")

	# 2. CanvasModulate setup (#161412)
	_setup_canvas_modulate()

	# 3. Laboratory bench & landing visual structure
	_setup_lab_environment()

	# 4. Warm alchemical glow light (#B5702F energy 0.7)
	_setup_alchemical_lighting()

	# 5. Glass refraction shader on glass apparatus
	_setup_glass_refraction_shader()

	# 6. Rising steam particles emitter (GPUParticles2D)
	_setup_rising_steam()

	# 7. Setup Alembic and Crucible interactive Area2D triggers
	_setup_apparatus_interactables()

	# 8. Construct Alchemy Mini-game UI dialog layer
	_setup_alchemy_ui()


func _process(delta: float) -> void:
	# Epilepsy safety: Gentle sine wave pulse for alchemical glow (period ~ 12.5s >= 2.5s)
	if _alchemical_light != null:
		var wave: float = sin(Time.get_ticks_msec() * 0.0005) * 0.05
		_alchemical_light.energy = alchemical_glow_energy + wave


func _setup_canvas_modulate() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "LandingCanvasModulate"
	_canvas_modulate.color = canvas_tint
	add_child(_canvas_modulate)


func _setup_lab_environment() -> void:
	var floor_bg := ColorRect.new()
	floor_bg.name = "LaboratoryFloor"
	floor_bg.size = Vector2(1920, 1080)
	floor_bg.color = Color("100e0d")
	add_child(floor_bg)

	# Workbench
	var bench := ColorRect.new()
	bench.name = "AlchemicalWorkbench"
	bench.size = Vector2(500, 100)
	bench.position = lab_bench_pos - Vector2(250, 50)
	bench.color = Color("2d2218")
	add_child(bench)


func _create_radial_light_texture(radius: int = 220) -> GradientTexture2D:
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


func _setup_alchemical_lighting() -> void:
	if get_node_or_null("/root/CatacombLighting"):
		_alchemical_light = CatacombLighting.create_torch_light(alchemical_glow_color, alchemical_glow_energy, lab_bench_pos)
	else:
		_alchemical_light = PointLight2D.new()
		_alchemical_light.name = "AlchemicalGlowLight"
		_alchemical_light.color = alchemical_glow_color
		_alchemical_light.energy = alchemical_glow_energy
		_alchemical_light.position = lab_bench_pos
		_alchemical_light.texture = _create_radial_light_texture(260)
		_alchemical_light.texture_scale = 1.6
		add_child(_alchemical_light)


func _setup_glass_refraction_shader() -> void:
	var back_buffer := BackBufferCopy.new()
	back_buffer.name = "RefractionBackBuffer"
	back_buffer.copy_mode = BackBufferCopy.COPY_MODE_RECT
	back_buffer.rect = Rect2(lab_bench_pos.x - 220, lab_bench_pos.y - 120, 440, 120)
	add_child(back_buffer)

	_glass_refraction_rect = ColorRect.new()
	_glass_refraction_rect.name = "GlassRefractionOverlay"
	_glass_refraction_rect.size = Vector2(440, 120)
	_glass_refraction_rect.position = lab_bench_pos - Vector2(220, 120)

	var shader := Shader.new()
	shader.code = """
	shader_type canvas_item;

	uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;
	uniform float refraction_amount : hint_range(0.0, 0.05) = 0.015;

	void fragment() {
		vec2 uv = SCREEN_UV;
		// Simulated cylindrical glass flask refraction distortion
		float distortion = sin(UV.x * 20.0 + TIME * 0.3) * refraction_amount;
		vec2 refracted_uv = vec2(uv.x + distortion, uv.y);

		vec4 scene_color = texture(screen_texture, refracted_uv);
		vec4 glass_tint = vec4(0.7, 0.85, 0.9, 0.15);

		COLOR = mix(scene_color, glass_tint, 0.2);
	}
	"""

	var mat := ShaderMaterial.new()
	mat.shader = shader
	_glass_refraction_rect.material = mat
	add_child(_glass_refraction_rect)


func _setup_rising_steam() -> void:
	_steam_particles = GPUParticles2D.new()
	_steam_particles.name = "RisingSteamParticles"
	_steam_particles.position = lab_bench_pos + Vector2(-100, -50)
	_steam_particles.amount = steam_particle_count
	_steam_particles.lifetime = 4.0
	_steam_particles.preprocess = 2.0

	var mat := ParticleProcessMaterial.new()
	mat.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_CIRCLE
	mat.emission_sphere_radius = 25.0
	mat.direction = Vector3(0, -1, 0)
	mat.spread = 20.0
	mat.initial_velocity_min = 15.0
	mat.initial_velocity_max = 35.0
	mat.gravity = Vector3(0, -6.0, 0)
	mat.scale_min = 2.0
	mat.scale_max = 5.0

	var grad := Gradient.new()
	grad.set_color(0, Color(0.9, 0.95, 1.0, 0.0))
	grad.set_color(1, Color(0.9, 0.95, 1.0, 0.0))
	grad.add_point(0.2, Color(0.9, 0.95, 1.0, 0.35))
	grad.add_point(0.7, Color(0.8, 0.85, 0.9, 0.15))

	var grad_tex := GradientTexture1D.new()
	grad_tex.gradient = grad
	mat.color_ramp = grad_tex

	_steam_particles.process_material = mat
	add_child(_steam_particles)


func _setup_apparatus_interactables() -> void:
	var apparatus_container := Node2D.new()
	apparatus_container.name = "ApparatusInteractables"
	add_child(apparatus_container)

	# 1. Glass Alembic Distillation Flask
	_alembic_area = Area2D.new()
	_alembic_area.name = "AlembicArea"
	_alembic_area.position = lab_bench_pos + Vector2(-120, -70)

	var alembic_col := CollisionShape2D.new()
	var circle1 := CircleShape2D.new()
	circle1.radius = 45.0
	alembic_col.shape = circle1
	_alembic_area.add_child(alembic_col)

	_alembic_area.input_event.connect(func(_vp: Node, event: InputEvent, _idx: int):
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			_start_alchemy_minigame("Alembic")
	)
	apparatus_container.add_child(_alembic_area)

	# 2. Bronze Crucible Fusing Vessel
	_crucible_area = Area2D.new()
	_crucible_area.name = "CrucibleArea"
	_crucible_area.position = lab_bench_pos + Vector2(120, -70)

	var crucible_col := CollisionShape2D.new()
	var circle2 := CircleShape2D.new()
	circle2.radius = 45.0
	crucible_col.shape = circle2
	_crucible_area.add_child(crucible_col)

	_crucible_area.input_event.connect(func(_vp: Node, event: InputEvent, _idx: int):
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			_start_alchemy_minigame("Crucible")
	)
	apparatus_container.add_child(_crucible_area)


func _start_alchemy_minigame(type: String) -> void:
	alchemy_minigame_started.emit(type)
	var recipe_result: String = "Philosopher's Dew" if type == "Alembic" else "Transmuted Ore"
	_show_alchemy_dialog(type + " Alchemy Minigame", "Select ingredients to transmute. Liquid condensed: " + recipe_result + ".")
	recipe_brewed.emit(recipe_result)


func _setup_alchemy_ui() -> void:
	_alchemy_ui = CanvasLayer.new()
	_alchemy_ui.name = "AlchemyUILayer"
	_alchemy_ui.visible = false
	add_child(_alchemy_ui)

	var panel := PanelContainer.new()
	panel.name = "AlchemyPanel"
	panel.anchor_left = 0.25
	panel.anchor_top = 0.72
	panel.anchor_right = 0.75
	panel.anchor_bottom = 0.92
	_alchemy_ui.add_child(panel)

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
	title_lbl.add_theme_color_override("font_color", alchemical_glow_color)
	vbox.add_child(title_lbl)

	var desc_lbl := Label.new()
	desc_lbl.name = "Desc"
	desc_lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
	vbox.add_child(desc_lbl)


func _show_alchemy_dialog(title: String, desc: String) -> void:
	var title_lbl: Label = _alchemy_ui.get_node("AlchemyPanel/Margin/VBox/Title")
	var desc_lbl: Label = _alchemy_ui.get_node("AlchemyPanel/Margin/VBox/Desc")

	title_lbl.text = title
	desc_lbl.text = desc
	_alchemy_ui.visible = true

	var tween := create_tween()
	tween.tween_interval(5.0)
	tween.tween_callback(func(): _alchemy_ui.visible = false)
