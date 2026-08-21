class_name AllfathersThrone
extends Node2D

## Script for 'Allfather's Throne' scene in Geode Inn.
## Grand celestial throne room featuring CanvasModulate #121824,
## warm throne lighting (#C48652, energy 2.0), cool celestial archway light (#3F6875, energy 1.2),
## falling celestial dust particles (#FDFAF7), a procedural nebula parallax background shader,
## interactable Area2D for Allfather Odin encounter, and Huginn/Muninn raven sentinels perched on throne back.

signal odin_dialog_triggered(dialog_id: String)
signal raven_examined(raven_name: String)

@export_group("Canvas Atmosphere")
## Deep atmospheric canvas tint (#121824)
@export var canvas_tint: Color = Color("121824")

@export_group("Throne Center Light")
## Golden celestial light color at throne center (#C48652)
@export var throne_light_color: Color = Color("c48652")
@export var throne_light_energy: float = 2.0
@export var throne_light_pos: Vector2 = Vector2(960, 520)

@export_group("Archway Light")
## Cool starry teal archway light color (#3F6875)
@export var archway_light_color: Color = Color("3f6875")
@export var archway_light_energy: float = 1.2
@export var archway_light_pos: Vector2 = Vector2(960, 200)

@export_group("Celestial Particles")
## Gentle drifting celestial dust particle color (#FDFAF7)
@export var dust_color: Color = Color("fdfaf7")
@export var dust_particle_count: int = 40

# Nodes
var _canvas_modulate: CanvasModulate
var _throne_light: PointLight2D
var _archway_light: PointLight2D
var _nebula_background: ColorRect
var _dust_particles: GPUParticles2D
var _throne_area: Area2D
var _huginn_area: Area2D
var _muninn_area: Area2D
var _dialog_ui: CanvasLayer


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("allfathers_throne")

	# 2. Setup CanvasModulate tint
	_setup_canvas_modulate()

	# 3. Create nebula parallax shader background
	_setup_nebula_background()

	# 4. Construct point lights (Throne & Archway)
	_setup_lights()

	# 5. Build celestial dust particle emitter (#FDFAF7)
	_setup_celestial_dust()

	# 6. Setup Throne & Raven Area2D interactables
	_setup_throne_and_ravens()

	# 7. Construct dialogue UI overlay
	_setup_dialog_ui()


func _process(delta: float) -> void:
	# Epilepsy safety: Gentle sine wave pulse for throne ambient glow (period ~ 12.5s >= 2.5s)
	if _throne_light != null:
		var pulse: float = sin(Time.get_ticks_msec() * 0.0005) * 0.1
		_throne_light.energy = throne_light_energy + pulse


## Applies CanvasModulate color #121824
func _setup_canvas_modulate() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CelestialCanvasModulate"
	_canvas_modulate.color = canvas_tint
	add_child(_canvas_modulate)


## Generates a procedural radial gradient texture for PointLight2D instances
func _create_radial_light_texture(radius: int = 256) -> GradientTexture2D:
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


## Constructs throne center (#C48652) and archway (#3F6875) lights
func _setup_lights() -> void:
	var lights_node := Node2D.new()
	lights_node.name = "LightingContainer"
	add_child(lights_node)

	# 1. Throne Center PointLight2D (#C48652, energy 2.0)
	if get_node_or_null("/root/CatacombLighting"):
		var light_node := CatacombLighting.create_torch_light(throne_light_color, throne_light_energy, throne_light_pos)
		lights_node.add_child(light_node)
	else:
		_throne_light = PointLight2D.new()
		_throne_light.name = "ThroneCenterLight"
		_throne_light.color = throne_light_color
		_throne_light.energy = throne_light_energy
		_throne_light.position = throne_light_pos
		_throne_light.texture = _create_radial_light_texture(300)
		_throne_light.texture_scale = 1.5
		lights_node.add_child(_throne_light)

	# 2. Archway PointLight2D (#3F6875, energy 1.2)
	_archway_light = PointLight2D.new()
	_archway_light.name = "ArchwayLight"
	_archway_light.color = archway_light_color
	_archway_light.energy = archway_light_energy
	_archway_light.position = archway_light_pos
	_archway_light.texture = _create_radial_light_texture(256)
	_archway_light.texture_scale = 1.2
	lights_node.add_child(_archway_light)


## Creates nebula parallax shader background
func _setup_nebula_background() -> void:
	_nebula_background = ColorRect.new()
	_nebula_background.name = "NebulaParallaxBackground"
	_nebula_background.size = Vector2(1920, 1080)

	var shader := Shader.new()
	shader.code = """
	shader_type canvas_item;

	uniform vec4 color_dark : source_color = vec4(0.07, 0.09, 0.14, 1.0);
	uniform vec4 color_nebula : source_color = vec4(0.25, 0.41, 0.46, 1.0);
	uniform vec4 color_gold : source_color = vec4(0.77, 0.53, 0.32, 1.0);

	float hash(vec2 p) {
		return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
	}

	float noise(vec2 p) {
		vec2 i = floor(p);
		vec2 f = fract(p);
		f = f * f * (3.0 - 2.0 * f);
		float a = hash(i);
		float b = hash(i + vec2(1.0, 0.0));
		float c = hash(i + vec2(0.0, 1.0));
		float d = hash(i + vec2(1.0, 1.0));
		return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
	}

	float fbm(vec2 p) {
		float val = 0.0;
		float amp = 0.5;
		for (int i = 0; i < 4; i++) {
			val += amp * noise(p);
			p *= 2.01;
			amp *= 0.5;
		}
		return val;
	}

	void fragment() {
		vec2 uv = UV * 3.0;
		float time = TIME * 0.02; // Slow nebula drift
		float n = fbm(uv + vec2(time, time * 0.5));
		float gold_n = fbm(uv * 2.0 - vec2(time * 0.3, time * 0.2));

		vec4 base = mix(color_dark, color_nebula, smoothstep(0.3, 0.7, n));
		base = mix(base, color_gold, smoothstep(0.55, 0.85, gold_n) * 0.4);
		COLOR = base;
	}
	"""

	var mat := ShaderMaterial.new()
	mat.shader = shader
	_nebula_background.material = mat
	add_child(_nebula_background)


## Instantiates GPUParticles2D emitting celestial dust drifting downward (#FDFAF7)
func _setup_celestial_dust() -> void:
	_dust_particles = GPUParticles2D.new()
	_dust_particles.name = "CelestialDustParticles"
	_dust_particles.position = Vector2(960, -50)
	_dust_particles.amount = dust_particle_count
	_dust_particles.lifetime = 10.0
	_dust_particles.preprocess = 5.0

	var mat := ParticleProcessMaterial.new()
	mat.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
	mat.emission_box_extents = Vector3(960, 20, 1)
	mat.direction = Vector3(0, 1, 0)
	mat.spread = 15.0
	mat.initial_velocity_min = 12.0
	mat.initial_velocity_max = 28.0
	mat.gravity = Vector3(0, 4.0, 0)

	# Particle scale and color gradient
	mat.scale_min = 1.5
	mat.scale_max = 3.5

	var grad := Gradient.new()
	grad.set_color(0, Color(dust_color.r, dust_color.g, dust_color.b, 0.0))
	grad.set_color(1, Color(dust_color.r, dust_color.g, dust_color.b, 0.8))
	grad.add_point(0.2, Color(dust_color.r, dust_color.g, dust_color.b, 0.9))
	grad.add_point(0.8, Color(dust_color.r, dust_color.g, dust_color.b, 0.4))

	var grad_tex := GradientTexture1D.new()
	grad_tex.gradient = grad
	mat.color_ramp = grad_tex

	_dust_particles.process_material = mat
	add_child(_dust_particles)


## Configures interactable Area2D nodes for Throne and Raven sentinels Huginn & Muninn
func _setup_throne_and_ravens() -> void:
	var interactables := Node2D.new()
	interactables.name = "Interactables"
	add_child(interactables)

	# 1. Main Throne Area2D (Allfather Odin Encounter)
	_throne_area = Area2D.new()
	_throne_area.name = "ThroneOdinArea"
	_throne_area.position = throne_light_pos

	var throne_shape := CollisionShape2D.new()
	var throne_circle := CircleShape2D.new()
	throne_circle.radius = 110.0
	throne_shape.shape = throne_circle
	_throne_area.add_child(throne_shape)

	_throne_area.input_event.connect(_on_throne_input_event)
	interactables.add_child(_throne_area)

	# Visual Throne Sprite Placeholder
	var throne_rect := ColorRect.new()
	throne_rect.name = "ThronePlaceholder"
	throne_rect.size = Vector2(120, 180)
	throne_rect.position = throne_light_pos - Vector2(60, 110)
	throne_rect.color = Color("231b2c")
	interactables.add_child(throne_rect)

	# 2. Huginn (Thought) Raven Sentinel Area2D on left throne back
	_huginn_area = Area2D.new()
	_huginn_area.name = "HuginnRavenArea"
	_huginn_area.position = throne_light_pos + Vector2(-50, -100)

	var huginn_shape := CollisionShape2D.new()
	var raven_circle_1 := CircleShape2D.new()
	raven_circle_1.radius = 35.0
	huginn_shape.shape = raven_circle_1
	_huginn_area.add_child(huginn_shape)
	_huginn_area.input_event.connect(func(_vp: Node, event: InputEvent, _idx: int):
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			_trigger_raven_dialog("Huginn", "Huginn tilts his head stoically, whispering memories of distant stars.")
	)
	interactables.add_child(_huginn_area)

	# 3. Muninn (Memory) Raven Sentinel Area2D on right throne back
	_muninn_area = Area2D.new()
	_muninn_area.name = "MuninnRavenArea"
	_muninn_area.position = throne_light_pos + Vector2(50, -100)

	var muninn_shape := CollisionShape2D.new()
	var raven_circle_2 := CircleShape2D.new()
	raven_circle_2.radius = 35.0
	muninn_shape.shape = raven_circle_2
	_muninn_area.add_child(muninn_shape)
	_muninn_area.input_event.connect(func(_vp: Node, event: InputEvent, _idx: int):
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			_trigger_raven_dialog("Muninn", "Muninn gaze pierces deep, recording every quiet deed within the Inn.")
	)
	interactables.add_child(_muninn_area)


func _on_throne_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_show_odin_dialog("Allfather Odin", "Welcome, traveler of the Nine Realms. The Geode Inn holds timeless truths for those who seek with an open mind.")
		odin_dialog_triggered.emit("odin_intro")


func _trigger_raven_dialog(raven_name: String, message: String) -> void:
	raven_examined.emit(raven_name)
	_show_odin_dialog(raven_name + " (Raven Sentinel)", message)


## Dialogue UI popup overlay
func _setup_dialog_ui() -> void:
	_dialog_ui = CanvasLayer.new()
	_dialog_ui.name = "CelestialDialogLayer"
	_dialog_ui.visible = false
	add_child(_dialog_ui)

	var panel := PanelContainer.new()
	panel.name = "DialogPanel"
	panel.anchor_left = 0.25
	panel.anchor_top = 0.75
	panel.anchor_right = 0.75
	panel.anchor_bottom = 0.92
	_dialog_ui.add_child(panel)

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

	var name_label := Label.new()
	name_label.name = "SpeakerName"
	name_label.add_theme_color_override("font_color", throne_light_color)
	vbox.add_child(name_label)

	var text_label := Label.new()
	text_label.name = "SpeakerText"
	text_label.autowrap_mode = TextServer.AUTOWRAP_WORD
	vbox.add_child(text_label)


func _show_odin_dialog(speaker: String, text: String) -> void:
	var name_lbl: Label = _dialog_ui.get_node("DialogPanel/Margin/VBox/SpeakerName")
	var text_lbl: Label = _dialog_ui.get_node("DialogPanel/Margin/VBox/SpeakerText")

	name_lbl.text = speaker
	text_lbl.text = text
	_dialog_ui.visible = true

	var tween := create_tween()
	tween.tween_interval(5.0)
	tween.tween_callback(func(): _dialog_ui.visible = false)
