class_name Builder
extends RefCounted
## Small helpers that build placeholder geometry in code. Every placeholder can
## be swapped for the client's real models later: give a node a "model" path in
## data (a .glb or .tscn) and Builder.model_or_box() loads it instead.

static var _materials: Dictionary = {}


static func clear_cache() -> void:
	_materials.clear()


static func mat(color: Color, emission := 0.0, rough := 0.85, metal := 0.0) -> StandardMaterial3D:
	var key := "%s|%s|%s|%s" % [color.to_html(), emission, rough, metal]
	if _materials.has(key):
		return _materials[key]
	var m := StandardMaterial3D.new()
	m.albedo_color = color
	m.roughness = rough
	m.metallic = metal
	if emission > 0.0:
		m.emission_enabled = true
		m.emission = color
		m.emission_energy_multiplier = emission
	if color.a < 1.0:
		m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	_materials[key] = m
	return m


static func box(parent: Node, size: Vector3, pos: Vector3, color: Color, collide := true, node_name := "") -> Node3D:
	var mesh := BoxMesh.new()
	mesh.size = size
	return _place(parent, mesh, BoxShape3D.new(), size, pos, color, collide, node_name)


static func cylinder(parent: Node, radius: float, height: float, pos: Vector3, color: Color, collide := true, node_name := "", top_radius := -1.0) -> Node3D:
	var mesh := CylinderMesh.new()
	mesh.bottom_radius = radius
	mesh.top_radius = radius if top_radius < 0.0 else top_radius
	mesh.height = height
	mesh.radial_segments = 20
	var shape := CylinderShape3D.new()
	shape.radius = radius
	shape.height = height
	return _place(parent, mesh, shape, Vector3.ZERO, pos, color, collide, node_name)


static func sphere(parent: Node, radius: float, pos: Vector3, color: Color, emission := 0.0, node_name := "") -> MeshInstance3D:
	var mesh := SphereMesh.new()
	mesh.radius = radius
	mesh.height = radius * 2.0
	mesh.radial_segments = 16
	mesh.rings = 8
	var mi := MeshInstance3D.new()
	mi.mesh = mesh
	mi.material_override = mat(color, emission)
	mi.position = pos
	if not node_name.is_empty():
		mi.name = node_name
	parent.add_child(mi)
	return mi


static func _place(parent: Node, mesh: Mesh, shape: Shape3D, size: Vector3, pos: Vector3, color: Color, collide: bool, node_name: String) -> Node3D:
	var mi := MeshInstance3D.new()
	mi.mesh = mesh
	mi.material_override = mat(color)
	if not collide:
		mi.position = pos
		if not node_name.is_empty():
			mi.name = node_name
		parent.add_child(mi)
		return mi
	var body := StaticBody3D.new()
	body.position = pos
	if not node_name.is_empty():
		body.name = node_name
	if shape is BoxShape3D:
		(shape as BoxShape3D).size = size
	var cs := CollisionShape3D.new()
	cs.shape = shape
	body.add_child(cs)
	body.add_child(mi)
	parent.add_child(body)
	return body


## Stops the camera, not the player (physics layer 2 only). Goes in doorways
## so the third-person camera can't slip outside the room behind the player.
static func camera_blocker(parent: Node, size: Vector3, pos: Vector3) -> StaticBody3D:
	var body := StaticBody3D.new()
	body.name = "CameraBlocker"
	body.position = pos
	body.collision_layer = 2
	body.collision_mask = 0
	var cs := CollisionShape3D.new()
	var shape := BoxShape3D.new()
	shape.size = size
	cs.shape = shape
	body.add_child(cs)
	parent.add_child(body)
	return body


static func label(parent: Node, text: String, pos: Vector3, size := 48, color := Color(0.95, 0.82, 0.5), billboard := true) -> Label3D:
	var l := Label3D.new()
	l.text = text
	l.font_size = size
	l.pixel_size = 0.0055
	l.position = pos
	l.modulate = color
	l.outline_size = 8
	l.outline_modulate = Color(0.05, 0.03, 0.02, 0.9)
	if billboard:
		l.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	l.no_depth_test = false
	# Signs fade out when the camera is right on top of them (so a name never
	# fills the screen) and when they're far away (so the room isn't a wall of text).
	l.visibility_range_begin = 1.6 + size * 0.025
	l.visibility_range_end = 12.0 + size * 0.45
	l.visibility_range_fade_mode = GeometryInstance3D.VISIBILITY_RANGE_FADE_SELF
	l.visibility_range_begin_margin = 0.6
	l.visibility_range_end_margin = 3.0
	parent.add_child(l)
	return l


## A fire: an orange body and a hotter core, flickering (ZoneBase moves every
## node in the "flame" group). Reads as fire, not as a glowing ball.
static func flame(parent: Node, pos: Vector3, size := 0.4) -> Node3D:
	var f := Node3D.new()
	f.name = "Flame"
	f.position = pos
	parent.add_child(f)
	for i in 3:
		var log := cylinder(f, size * 0.16, size * 2.2, Vector3((i - 1) * size * 0.35, size * 0.12, 0), Color(0.24, 0.14, 0.08), false)
		log.rotation = Vector3(0, i * 1.1, PI / 2.0)
	var fire := Node3D.new()
	fire.name = "Fire"
	f.add_child(fire)
	var outer := sphere(fire, size, Vector3(0, size * 0.6, 0), Color(0.95, 0.38, 0.08), 1.6)
	outer.scale = Vector3(1.0, 1.7, 1.0)
	var mid := sphere(fire, size * 0.7, Vector3(0, size * 0.7, 0), Color(1.0, 0.6, 0.15), 1.9)
	mid.scale = Vector3(0.9, 1.9, 0.9)
	var core := sphere(fire, size * 0.38, Vector3(0, size * 0.55, 0), Color(1.0, 0.86, 0.45), 2.2)
	core.scale = Vector3(1.0, 1.5, 1.0)
	fire.add_to_group("flame")
	fire.set_meta("seed", randf() * 100.0)
	return f


static func omni(parent: Node, pos: Vector3, color: Color, energy := 1.5, light_range := 8.0) -> OmniLight3D:
	var o := OmniLight3D.new()
	o.position = pos
	o.light_color = color
	o.light_energy = energy
	o.omni_range = light_range
	o.shadow_enabled = false
	parent.add_child(o)
	return o


## Loads a real model when one is given in data, otherwise a placeholder box.
static func model_or_box(parent: Node, model_path: String, size: Vector3, pos: Vector3, color: Color) -> Node3D:
	if not model_path.is_empty() and ResourceLoader.exists(model_path):
		var scene: PackedScene = load(model_path)
		var inst: Node3D = scene.instantiate()
		inst.position = pos
		parent.add_child(inst)
		return inst
	return box(parent, size, pos, color)


## Loads a model (.glb/.tscn) if the path exists, otherwise returns null.
static func load_model(parent: Node, model_path: String) -> Node3D:
	if model_path.is_empty() or not ResourceLoader.exists(model_path):
		return null
	var scene: PackedScene = load(model_path)
	var inst: Node3D = scene.instantiate()
	parent.add_child(inst)
	return inst


## Plays a named animation on the first AnimationPlayer inside a model, if it has one.
static func play_anim(model: Node, anim_name: String) -> void:
	if model == null:
		return
	var players := model.find_children("*", "AnimationPlayer", true, false)
	if players.is_empty():
		return
	var ap := players[0] as AnimationPlayer
	if ap.has_animation(anim_name) and ap.current_animation != anim_name:
		ap.play(anim_name)


static func environment(parent: Node, outdoor: bool) -> WorldEnvironment:
	var env := Environment.new()
	if outdoor:
		var sky_mat := ProceduralSkyMaterial.new()
		sky_mat.sky_top_color = Color(0.36, 0.52, 0.72)
		sky_mat.sky_horizon_color = Color(0.78, 0.74, 0.62)
		sky_mat.ground_bottom_color = Color(0.22, 0.2, 0.15)
		sky_mat.ground_horizon_color = Color(0.6, 0.56, 0.45)
		var sky := Sky.new()
		sky.sky_material = sky_mat
		env.background_mode = Environment.BG_SKY
		env.sky = sky
		env.ambient_light_source = Environment.AMBIENT_SOURCE_SKY
		env.ambient_light_energy = 0.8
	else:
		env.background_mode = Environment.BG_COLOR
		env.background_color = Color(0.05, 0.035, 0.025)
		env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
		env.ambient_light_color = Color(0.5, 0.36, 0.22)
		env.ambient_light_energy = 0.55
		env.fog_enabled = true
		env.fog_light_color = Color(0.22, 0.14, 0.08)
		env.fog_density = 0.012
	env.tonemap_mode = Environment.TONE_MAPPER_FILMIC
	var we := WorldEnvironment.new()
	we.environment = env
	parent.add_child(we)
	return we


static func color(hex: String, fallback := Color(0.5, 0.4, 0.3)) -> Color:
	return Color.html(hex) if Color.html_is_valid(hex) else fallback
