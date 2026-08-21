class_name PlanetChamber
extends Node2D

## Script for the 'Planet Chamber' orrery room in Geode Inn.
## Features a circular chamber with floating planetary orbs orbiting a brass sun center,
## CanvasModulate #2A323D, cool cyan planet lights (#7AB1E1 energy 1.5), warm brass center light (#C3A292 energy 0.9),
## slow orbital particle ring, self-rotating/orbiting planets, and interactive planet lore entries.

signal planet_lore_opened(planet_id: String, planet_name: String, lore_text: String)

@export_group("Canvas & Ambient")
## Orrery room canvas tint (#2A323D)
@export var canvas_tint: Color = Color("2a323d")

@export_group("Lighting Colors")
## Light color emitting from floating planetary orbs (#7AB1E1)
@export var planet_light_color: Color = Color("7ab1e1")
@export var planet_light_energy: float = 1.5

## Central brass orrery glow color (#C3A292)
@export var brass_center_color: Color = Color("c3a292")
@export var brass_center_energy: float = 0.9

@export_group("Orrery Mechanics")
## Center position of the brass orrery
@export var orrery_center: Vector2 = Vector2(960, 540)
## Speed multiplier for planetary orbits
@export_range(0.01, 1.0) var orbit_speed: float = 0.15
## Speed multiplier for planet axial rotations
@export_range(0.01, 2.0) var rotation_speed: float = 0.5

# Nodes
var _canvas_modulate: CanvasModulate
var _brass_center_light: PointLight2D
var _orbital_particle_ring: GPUParticles2D
var _lore_dialog_ui: CanvasLayer
var _planets_container: Node2D

# Planetary Orbs Catalog
var _planets_data: Array[Dictionary] = [
	{
		"id": "mercury_orb",
		"name": "Hermetic Messenger",
		"radius": 140.0,
		"speed_factor": 1.6,
		"size": 22.0,
		"color": Color("a4b0be"),
		"lore": "Swift traveler of the lower spheres, carrying alchemical secrets between mortal soil and divine fire."
	},
	{
		"id": "venus_orb",
		"name": "Morningstar Jewel",
		"radius": 220.0,
		"speed_factor": 1.2,
		"size": 30.0,
		"color": Color("eccc68"),
		"lore": "Resplendent veil of golden harmony, shimmering with copper resonance and timeless artistic inspiration."
	},
	{
		"id": "earth_orb",
		"name": "Geode Hearth",
		"radius": 310.0,
		"speed_factor": 1.0,
		"size": 34.0,
		"color": Color("70a1ff"),
		"lore": "The living heart of the physical realm, cradling crystalline caverns and subterranean warmth."
	},
	{
		"id": "mars_orb",
		"name": "Iron Forge Orb",
		"radius": 400.0,
		"speed_factor": 0.8,
		"size": 28.0,
		"color": Color("ff6b81"),
		"lore": "Crimson sphere of transformation, forging strength through trial and refined elemental resolve."
	},
	{
		"id": "jupiter_orb",
		"name": "Crown Sovereign",
		"radius": 500.0,
		"speed_factor": 0.5,
		"size": 48.0,
		"color": Color("e1b12c"),
		"lore": "Grand monarch of expansion and wisdom, guiding celestial harmony with steady gravitational grace."
	}
]

var _planet_nodes: Array[Dictionary] = []


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("planet_chamber")

	# 2. CanvasModulate setup (#2A323D)
	_setup_canvas_modulate()

	# 3. Orrery background & floor design
	_setup_orrery_background()

	# 4. Central brass orrery point light (#C3A292 energy 0.9)
	_setup_brass_center_light()

	# 5. Orbital particle ring setup
	_setup_orbital_particle_ring()

	# 6. Instantiate planetary orbs with lights, axial rotation, and interaction Area2Ds
	_setup_planetary_orbs()

	# 7. Lore UI panel
	_setup_lore_ui()


func _process(delta: float) -> void:
	# Update planetary orbits and self-axial rotations
	var time_sec: float = Time.get_ticks_msec() * 0.001

	for p in _planet_nodes:
		var data: Dictionary = p["data"]
		var node: Node2D = p["node"]
		var sprite: ColorRect = p["sprite"]

		# Orbit calculation around center
		var angle: float = time_sec * orbit_speed * data["speed_factor"] + p["initial_angle"]
		var orbit_pos := orrery_center + Vector2(cos(angle), sin(angle)) * data["radius"]
		node.position = orbit_pos

		# Axial self-rotation
		sprite.rotation += delta * rotation_speed * data["speed_factor"]


func _setup_canvas_modulate() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "OrreryCanvasModulate"
	_canvas_modulate.color = canvas_tint
	add_child(_canvas_modulate)


func _create_radial_light_texture(radius: int = 128) -> GradientTexture2D:
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


func _setup_orrery_background() -> void:
	var bg := ColorRect.new()
	bg.name = "OrreryChamberFloor"
	bg.size = Vector2(1920, 1080)
	bg.color = Color("1a2027")
	add_child(bg)


func _setup_brass_center_light() -> void:
	if get_node_or_null("/root/CatacombLighting"):
		_brass_center_light = CatacombLighting.create_torch_light(brass_center_color, brass_center_energy, orrery_center)
	else:
		_brass_center_light = PointLight2D.new()
		_brass_center_light.name = "BrassCenterLight"
		_brass_center_light.color = brass_center_color
		_brass_center_light.energy = brass_center_energy
		_brass_center_light.position = orrery_center
		_brass_center_light.texture = _create_radial_light_texture(220)
		_brass_center_light.texture_scale = 1.4
		add_child(_brass_center_light)

	# Brass Sun Center Mesh/Rect Visual
	var sun_visual := ColorRect.new()
	sun_visual.name = "BrassSunCore"
	sun_visual.size = Vector2(70, 70)
	sun_visual.position = orrery_center - Vector2(35, 35)
	sun_visual.color = brass_center_color
	add_child(sun_visual)


func _setup_orbital_particle_ring() -> void:
	_orbital_particle_ring = GPUParticles2D.new()
	_orbital_particle_ring.name = "OrbitalParticleRing"
	_orbital_particle_ring.position = orrery_center
	_orbital_particle_ring.amount = 60
	_orbital_particle_ring.lifetime = 6.0
	_orbital_particle_ring.preprocess = 3.0

	var mat := ParticleProcessMaterial.new()
	mat.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_RING
	mat.emission_ring_radius = 320.0
	mat.emission_ring_inner_radius = 300.0
	mat.emission_ring_cone_angle = 90.0
	mat.gravity = Vector3(0, 0, 0)
	mat.orbit_velocity_min = 0.05
	mat.orbit_velocity_max = 0.12
	mat.scale_min = 1.0
	mat.scale_max = 2.5

	var grad := Gradient.new()
	grad.set_color(0, Color(planet_light_color.r, planet_light_color.g, planet_light_color.b, 0.0))
	grad.set_color(1, Color(planet_light_color.r, planet_light_color.g, planet_light_color.b, 0.0))
	grad.add_point(0.3, Color(planet_light_color.r, planet_light_color.g, planet_light_color.b, 0.7))
	grad.add_point(0.7, Color(brass_center_color.r, brass_center_color.g, brass_center_color.b, 0.5))

	var grad_tex := GradientTexture1D.new()
	grad_tex.gradient = grad
	mat.color_ramp = grad_tex

	_orbital_particle_ring.process_material = mat
	add_child(_orbital_particle_ring)


func _setup_planetary_orbs() -> void:
	_planets_container = Node2D.new()
	_planets_container.name = "PlanetsContainer"
	add_child(_planets_container)

	var angle_step: float = (2.0 * PI) / _planets_data.size()

	for i in range(_planets_data.size()):
		var data: Dictionary = _planets_data[i]
		var init_angle: float = i * angle_step

		var planet_node := Node2D.new()
		planet_node.name = "Orb_" + data["id"]
		_planets_container.add_child(planet_node)

		# Planet Light (#7AB1E1 energy 1.5)
		var p_light := PointLight2D.new()
		p_light.name = "PlanetLight"
		p_light.color = planet_light_color
		p_light.energy = planet_light_energy
		p_light.texture = _create_radial_light_texture(int(data["size"] * 3.5))
		planet_node.add_child(p_light)

		# Visual Orb Rect
		var orb_rect := ColorRect.new()
		orb_rect.name = "OrbSprite"
		orb_rect.size = Vector2(data["size"], data["size"])
		orb_rect.position = - Vector2(data["size"] * 0.5, data["size"] * 0.5)
		orb_rect.color = data["color"]
		planet_node.add_child(orb_rect)

		# Area2D for Click interaction / Lore entry
		var area := Area2D.new()
		area.name = "InteractArea"
		
		var shape := CollisionShape2D.new()
		var circle := CircleShape2D.new()
		circle.radius = data["size"] * 1.2
		shape.shape = circle
		area.add_child(shape)

		area.input_event.connect(_on_planet_input_event.bind(data))
		planet_node.add_child(area)

		_planet_nodes.append({
			"data": data,
			"node": planet_node,
			"sprite": orb_rect,
			"initial_angle": init_angle
		})


func _on_planet_input_event(_vp: Node, event: InputEvent, _idx: int, data: Dictionary) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_show_planet_lore(data["name"], data["lore"])
		planet_lore_opened.emit(data["id"], data["name"], data["lore"])


func _setup_lore_ui() -> void:
	_lore_dialog_ui = CanvasLayer.new()
	_lore_dialog_ui.name = "PlanetLoreLayer"
	_lore_dialog_ui.visible = false
	add_child(_lore_dialog_ui)

	var panel := PanelContainer.new()
	panel.name = "LorePanel"
	panel.anchor_left = 0.25
	panel.anchor_top = 0.72
	panel.anchor_right = 0.75
	panel.anchor_bottom = 0.92
	_lore_dialog_ui.add_child(panel)

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
	name_lbl.name = "PlanetTitle"
	name_lbl.add_theme_color_override("font_color", planet_light_color)
	vbox.add_child(name_lbl)

	var lore_lbl := Label.new()
	lore_lbl.name = "LoreText"
	lore_lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
	vbox.add_child(lore_lbl)


func _show_planet_lore(title: String, text: String) -> void:
	var title_lbl: Label = _lore_dialog_ui.get_node("LorePanel/Margin/VBox/PlanetTitle")
	var lore_lbl: Label = _lore_dialog_ui.get_node("LorePanel/Margin/VBox/LoreText")

	title_lbl.text = title
	lore_lbl.text = text
	_lore_dialog_ui.visible = true

	var tween := create_tween()
	tween.tween_interval(5.0)
	tween.tween_callback(func(): _lore_dialog_ui.visible = false)
