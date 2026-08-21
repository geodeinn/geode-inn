class_name ModernReligionsLibrary
extends Node2D

## Script for the 'Modern Religions & Wisdom Library' scene in Geode Inn.
## Features a marble library hall with animated stained glass light shafts (#6A91CB energy 0.8),
## CanvasModulate #22232B, book dust particles drifting in light shafts,
## and scholarly, neutral, objective comparative religion interactable archives.

signal religion_entry_read(tradition_id: String, tradition_title: String)

@export_group("Canvas Atmosphere")
## Marble library hall canvas tint (#22232B)
@export var canvas_tint: Color = Color("22232b")

@export_group("Stained Glass Light Shafts")
## Stained glass light shaft blue tint (#6A91CB)
@export var stained_glass_color: Color = Color("6a91cb")
@export var stained_glass_energy: float = 0.8
@export var light_shaft_positions: Array[Vector2] = [
	Vector2(450, 300),
	Vector2(960, 300),
	Vector2(1470, 300)
]

@export_group("Book Dust Particles")
## Amount of book dust floating in light shafts
@export var dust_particle_count: int = 30

# Nodes
var _canvas_modulate: CanvasModulate
var _shaft_lights: Array[PointLight2D] = []
var _stained_glass_rect: ColorRect
var _dust_particles: GPUParticles2D
var _library_ui: CanvasLayer

# World Wisdom Traditions Catalog (Neutral, Scholarly Presentation)
var _religion_archives: Array[Dictionary] = [
	{
		"id": "eastern_traditions",
		"title": "Eastern Wisdom Traditions (Dharma & Tao)",
		"pos": Vector2(400, 520),
		"summary": "Scholarly overview of Buddhist mindfulness, Vedic philosophy, and Taoist natural harmony — emphasizing inner contemplation, interconnectedness, and moral equilibrium across generations."
	},
	{
		"id": "abrahamic_traditions",
		"title": "Abrahamic Faiths & Monotheistic Thought",
		"pos": Vector2(800, 520),
		"summary": "Comparative study of Judaism, Christianity, and Islam — highlighting shared historical roots in the Levant, covenantal ethics, divine justice, and prophetic tradition."
	},
	{
		"id": "indigenous_earth",
		"title": "Indigenous & Earth-Centered Spiritualities",
		"pos": Vector2(1200, 520),
		"summary": "Exploration of global indigenous worldviews, honoring ecological stewardship, ancestral memory, and sacred reciprocity with nature."
	},
	{
		"id": "universal_ethics",
		"title": "Comparative Philosophy & Humanist Ethics",
		"pos": Vector2(1600, 520),
		"summary": "A neutral synthesis of universal moral imperatives, interfaith dialogue, and golden-rule ethics throughout human civilization."
	}
]


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("modern_religions_library")

	# 2. CanvasModulate setup (#22232B)
	_setup_canvas_modulate()

	# 3. Marble Library floor & wall environment
	_setup_marble_library_hall()

	# 4. Animated Stained Glass Window Shader & Light Shafts (#6A91CB energy 0.8)
	_setup_stained_glass_window_and_lights()

	# 5. Book dust particles drifting in light shafts
	_setup_book_dust_particles()

	# 6. Instantiate interactive religion archive bookshelves
	_setup_scholarly_bookshelves()

	# 7. Setup Library UI overlay
	_setup_library_ui()


func _process(delta: float) -> void:
	# Epilepsy safety: Gentle sine wave pulse for light shafts (period ~ 12.5s >= 2.5s)
	var wave: float = sin(Time.get_ticks_msec() * 0.0005) * 0.05
	for light in _shaft_lights:
		light.energy = stained_glass_energy + wave


func _setup_canvas_modulate() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "LibraryCanvasModulate"
	_canvas_modulate.color = canvas_tint
	add_child(_canvas_modulate)


func _setup_marble_library_hall() -> void:
	var floor_rect := ColorRect.new()
	floor_rect.name = "MarbleHallFloor"
	floor_rect.size = Vector2(1920, 1080)
	floor_rect.color = Color("181820")
	add_child(floor_rect)


func _create_shaft_light_texture(radius: int = 256) -> GradientTexture2D:
	var grad := Gradient.new()
	grad.set_color(0, Color(1, 1, 1, 1))
	grad.set_color(1, Color(1, 1, 1, 0))
	var tex := GradientTexture2D.new()
	tex.gradient = grad
	tex.fill = GradientTexture2D.FILL_RADIAL
	tex.fill_from = Vector2(0.5, 0.2)
	tex.fill_to = Vector2(0.5, 1.0)
	tex.width = radius * 2
	tex.height = radius * 2
	return tex


func _setup_stained_glass_window_and_lights() -> void:
	# Stained Glass Window Shader with animated polychromatic light drift
	_stained_glass_rect = ColorRect.new()
	_stained_glass_rect.name = "StainedGlassWindowOverlay"
	_stained_glass_rect.size = Vector2(1920, 400)

	var shader := Shader.new()
	shader.code = """
	shader_type canvas_item;

	uniform vec4 glass_blue : source_color = vec4(0.41, 0.57, 0.8, 0.7);
	uniform vec4 glass_gold : source_color = vec4(0.85, 0.75, 0.4, 0.5);

	void fragment() {
		vec2 uv = UV * 8.0;
		float grid = step(0.9, fract(uv.x)) + step(0.9, fract(uv.y));
		float shift = sin(UV.x * 4.0 + TIME * 0.1) * 0.5 + 0.5;

		vec4 col = mix(glass_blue, glass_gold, shift);
		col = mix(col, vec4(0.05, 0.05, 0.1, 1.0), clamp(grid, 0.0, 1.0)); // Lead kame borders

		COLOR = col * (1.0 - UV.y * 0.6);
	}
	"""

	var mat := ShaderMaterial.new()
	mat.shader = shader
	_stained_glass_rect.material = mat
	add_child(_stained_glass_rect)

	# Light Shafts
	var lights_node := Node2D.new()
	lights_node.name = "LightShaftsContainer"
	add_child(lights_node)

	for pos in light_shaft_positions:
		var shaft := PointLight2D.new()
		shaft.name = "LightShaft_" + str(pos.x)
		shaft.color = stained_glass_color
		shaft.energy = stained_glass_energy
		shaft.position = pos
		shaft.texture = _create_shaft_light_texture(300)
		shaft.texture_scale = 1.8
		lights_node.add_child(shaft)
		_shaft_lights.append(shaft)


func _setup_book_dust_particles() -> void:
	_dust_particles = GPUParticles2D.new()
	_dust_particles.name = "BookDustParticles"
	_dust_particles.position = Vector2(960, 200)
	_dust_particles.amount = dust_particle_count
	_dust_particles.lifetime = 10.0
	_dust_particles.preprocess = 5.0

	var mat := ParticleProcessMaterial.new()
	mat.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
	mat.emission_box_extents = Vector3(900, 100, 1)
	mat.direction = Vector3(0.2, 1, 0) # Slanted down along light shaft
	mat.spread = 15.0
	mat.initial_velocity_min = 8.0
	mat.initial_velocity_max = 20.0
	mat.gravity = Vector3(0, 1.5, 0)
	mat.scale_min = 1.0
	mat.scale_max = 2.5

	var grad := Gradient.new()
	grad.set_color(0, Color(stained_glass_color.r, stained_glass_color.g, stained_glass_color.b, 0.0))
	grad.set_color(1, Color(stained_glass_color.r, stained_glass_color.g, stained_glass_color.b, 0.0))
	grad.add_point(0.3, Color(1.0, 1.0, 1.0, 0.6))
	grad.add_point(0.7, Color(stained_glass_color.r, stained_glass_color.g, stained_glass_color.b, 0.3))

	var grad_tex := GradientTexture1D.new()
	grad_tex.gradient = grad
	mat.color_ramp = grad_tex

	_dust_particles.process_material = mat
	add_child(_dust_particles)


func _setup_scholarly_bookshelves() -> void:
	var shelves_node := Node2D.new()
	shelves_node.name = "ArchiveBookshelves"
	add_child(shelves_node)

	for archive in _religion_archives:
		var pos: Vector2 = archive["pos"]

		# Marble Frame
		var frame := ColorRect.new()
		frame.name = "ArchiveFrame_" + archive["id"]
		frame.size = Vector2(220, 200)
		frame.position = pos - Vector2(110, 100)
		frame.color = Color("2e303c")
		shelves_node.add_child(frame)

		# Area2D for Examination
		var area := Area2D.new()
		area.name = "ArchiveArea_" + archive["id"]
		area.position = pos

		var col := CollisionShape2D.new()
		var shape := RectangleShape2D.new()
		shape.size = Vector2(220, 200)
		col.shape = shape
		area.add_child(col)

		area.input_event.connect(_on_archive_input_event.bind(archive))
		shelves_node.add_child(area)


func _on_archive_input_event(_vp: Node, event: InputEvent, _idx: int, archive: Dictionary) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_show_library_dialog(archive["title"], archive["summary"])
		religion_entry_read.emit(archive["id"], archive["title"])


func _setup_library_ui() -> void:
	_library_ui = CanvasLayer.new()
	_library_ui.name = "LibraryUILayer"
	_library_ui.visible = false
	add_child(_library_ui)

	var panel := PanelContainer.new()
	panel.name = "LibraryPanel"
	panel.anchor_left = 0.2
	panel.anchor_top = 0.68
	panel.anchor_right = 0.8
	panel.anchor_bottom = 0.94
	_library_ui.add_child(panel)

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
	title_lbl.add_theme_color_override("font_color", stained_glass_color)
	vbox.add_child(title_lbl)

	var desc_lbl := Label.new()
	desc_lbl.name = "Summary"
	desc_lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
	vbox.add_child(desc_lbl)


func _show_library_dialog(title: String, summary: String) -> void:
	var title_lbl: Label = _library_ui.get_node("LibraryPanel/Margin/VBox/Title")
	var desc_lbl: Label = _library_ui.get_node("LibraryPanel/Margin/VBox/Summary")

	title_lbl.text = title
	desc_lbl.text = summary
	_library_ui.visible = true

	var tween := create_tween()
	tween.tween_interval(6.0)
	tween.tween_callback(func(): _library_ui.visible = false)
