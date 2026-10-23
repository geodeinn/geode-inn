class_name Builder
extends RefCounted
## Helpers that build the world in code: boxes and posts that take real
## textures from the zone's palette (Builder.skin), props and plants from the
## CC0 kits (Builder.prop), lanterns, gems and fires. Any piece can still be
## swapped for the client's own models: give a node a "model" path in data (a
## .glb or .tscn) and Builder.model_or_box() loads it instead.

static var _materials: Dictionary = {}
static var _surface_mats: Dictionary = {}
static var _box_meshes: Dictionary = {}
static var _scenes: Dictionary = {}
static var _skins: Array = []   # [base colour, surface id, match shades too]

## Render layers: the world, and people (lighter graphics lights people with
## one fill light instead of every lamp; each lamp is another pass over them).
const WORLD_LAYER := 1
const PEOPLE_LAYER := 2
const SKY_HDRI := "res://assets/sky/kloofendal_48d_partly_cloudy_puresky_2k.hdr"
const PH := "res://assets/textures/surfaces/"
const KIT := "res://assets/textures/village/"
## Real surfaces. Poly Haven (CC0): ph id. Quaternius Medieval Village (CC0):
## kit name. m is metres per tile; avg is the albedo's average colour, so a
## tint can bring the texture to the palette colour it replaces.
const SURFACES := {
	"floor": { "ph": "old_wood_floor", "m": 2.4, "avg": Color(0.337, 0.286, 0.243) },
	"planks": { "ph": "old_planks_02", "m": 2.0, "avg": Color(0.384, 0.333, 0.278) },
	"dark_planks": { "ph": "dark_wooden_planks", "m": 2.0, "avg": Color(0.325, 0.29, 0.247) },
	"boards": { "ph": "brown_planks_05", "m": 2.0, "avg": Color(0.604, 0.58, 0.533) },
	"thatch": { "ph": "reed_roof_04", "m": 2.0, "avg": Color(0.612, 0.525, 0.404) },
	"grass": { "ph": "leafy_grass", "m": 3.0, "avg": Color(0.592, 0.514, 0.349) },
	"forest": { "ph": "forest_ground_04", "m": 3.0, "avg": Color(0.416, 0.353, 0.267) },
	"sand": { "ph": "coast_sand_01", "m": 3.0, "avg": Color(0.51, 0.447, 0.357) },
	"plaster": { "kit": "T_Plaster", "m": 3.0, "avg": Color(0.686, 0.62, 0.498) },
	"cobble": { "kit": "T_UnevenBrick", "m": 2.5, "avg": Color(0.529, 0.475, 0.4) },
	"brick": { "kit": "T_Brick", "m": 2.5, "avg": Color(0.573, 0.522, 0.459) },
	"tiles": { "kit": "T_RoundTiles", "m": 2.5, "avg": Color(0.698, 0.329, 0.188) },
	"bark": { "albedo": "res://assets/nature/Bark_NormalTree.png", "normal": "res://assets/nature/Bark_NormalTree_Normal.png", "m": 2.0, "avg": Color(0.549, 0.345, 0.263) },
	"rock": { "albedo": "res://assets/nature/Rocks_Diffuse.png", "m": 3.0, "avg": Color(0.306, 0.345, 0.251) },
}


static func clear_cache() -> void:
	_materials.clear()
	_surface_mats.clear()
	_box_meshes.clear()
	_scenes.clear()
	_skins.clear()
	_flame_mat = null
	_plain.clear()


## A zone says which of its palette colours are which surface. With shades on,
## lighter and darker versions of the colour take the surface too.
static func skin(color: Color, surface: String, shades := true) -> void:
	_skins.append([color, surface, shades])


static func clear_skins() -> void:
	_skins.clear()


## [surface id, tint] for a palette colour, or [] when it stays a plain colour.
static func surface_for(color: Color) -> Array:
	if color.a < 1.0 or _skins.is_empty():
		return []
	var best: Array = []
	var best_score := INF
	for s in _skins:
		var base: Color = s[0]
		var score := 0.0 if color.is_equal_approx(base) else (_shade_error(color, base) if bool(s[2]) else INF)
		if score < best_score:
			best_score = score
			best = s
	if best.is_empty() or best_score > 0.02 or not ResourceLoader.exists(_surface_paths(String(best[1]))[0]):
		return []
	var avgc: Color = SURFACES[best[1]]["avg"]
	return [best[1], Color(color.r / avgc.r, color.g / avgc.g, color.b / avgc.b)]


## How far a colour is from being base.lightened(a) or base.darkened(a) for
## some a up to 0.6 (the largest channel error; 0 is an exact shade).
static func _shade_error(color: Color, base: Color) -> float:
	var best := INF
	# darkened: c = b * (1 - a)
	var a := 1.0 - color.r / maxf(base.r, 0.001)
	if a >= -0.001 and a <= 0.6:
		best = maxf(absf(base.g * (1.0 - a) - color.g), absf(base.b * (1.0 - a) - color.b))
	# lightened: c = b + (1 - b) * a
	a = (color.r - base.r) / maxf(1.0 - base.r, 0.001)
	if a >= -0.001 and a <= 0.6:
		best = minf(best, maxf(absf(base.g + (1.0 - base.g) * a - color.g), absf(base.b + (1.0 - base.b) * a - color.b)))
	return best


## [albedo, normal, roughness, roughness is the ORM green channel]
static func _surface_paths(id: String) -> Array:
	var s: Dictionary = SURFACES[id]
	if s.has("ph"):
		var p := PH + String(s["ph"]) + "/" + String(s["ph"])
		return [p + "_diff_1k.jpg", p + "_nor_gl_1k.jpg", p + "_rough_1k.jpg", false]
	if s.has("kit"):
		var k := KIT + String(s["kit"])
		var orm := ResourceLoader.exists(k + "_ORM.png")
		return [k + "_BaseColor.png", k + "_Normal.png", k + ("_ORM.png" if orm else "_Roughness.png"), orm]
	return [String(s["albedo"]), String(s.get("normal", "")), String(s.get("rough", "")), false]


## A textured material. Boxes carry UVs in metres; anything else is mapped
## from the world (triplanar), so posts, logs and towers tile the same way.
static func surface_material(id: String, tint: Color, triplanar := false) -> StandardMaterial3D:
	var key := "%s|%s|%s|%s" % [id, tint.to_html(), triplanar, Settings.low_detail()]
	if _surface_mats.has(key):
		return _surface_mats[key]
	var paths := _surface_paths(id)
	var m := StandardMaterial3D.new()
	m.albedo_texture = load(paths[0])
	m.albedo_color = tint
	# Lighter graphics keep the colour texture only: a third of the work per pixel.
	var full := not Settings.low_detail()
	if full and not String(paths[1]).is_empty() and ResourceLoader.exists(paths[1]):
		m.normal_enabled = true
		m.normal_texture = load(paths[1])
		m.normal_scale = 0.8
	if full and not String(paths[2]).is_empty() and ResourceLoader.exists(paths[2]):
		m.roughness_texture = load(paths[2])
		m.roughness_texture_channel = BaseMaterial3D.TEXTURE_CHANNEL_GREEN if bool(paths[3]) else BaseMaterial3D.TEXTURE_CHANNEL_RED
		m.roughness = 1.0
	else:
		m.roughness = 0.88
	m.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC
	var k := 1.0 / float(SURFACES[id]["m"])
	if triplanar:
		m.uv1_triplanar = true
		m.uv1_world_triplanar = true
		m.uv1_scale = Vector3(k, k, k)
	else:
		m.uv1_scale = Vector3(k, k, 1.0)
	_surface_mats[key] = m
	return m


## A box whose UVs are in metres on every face (so a texture tiles, never stretches).
static func box_mesh(size: Vector3) -> ArrayMesh:
	var key := size.snappedf(0.001)
	if _box_meshes.has(key):
		return _box_meshes[key]
	var h := size * 0.5
	var st := SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	# normal, then the face's right and down as seen from outside (clockwise winding)
	var faces := [
		[Vector3.RIGHT, Vector3.FORWARD, Vector3.DOWN], [Vector3.LEFT, Vector3.BACK, Vector3.DOWN],
		[Vector3.UP, Vector3.RIGHT, Vector3.BACK], [Vector3.DOWN, Vector3.RIGHT, Vector3.FORWARD],
		[Vector3.BACK, Vector3.RIGHT, Vector3.DOWN], [Vector3.FORWARD, Vector3.LEFT, Vector3.DOWN],
	]
	for f in faces:
		var n: Vector3 = f[0]
		var u: Vector3 = f[1]
		var v: Vector3 = f[2]
		var corners := []
		for c: Vector2 in [Vector2(-1, -1), Vector2(1, -1), Vector2(1, 1), Vector2(-1, 1)]:
			var p := n * absf(n.dot(h)) + u * (c.x * absf(u.dot(h))) + v * (c.y * absf(v.dot(h)))
			corners.append([p, Vector2(p.dot(u), p.dot(v))])
		for idx in [0, 1, 2, 0, 2, 3]:
			st.set_normal(n)
			st.set_uv(corners[idx][1])
			st.add_vertex(corners[idx][0])
	st.generate_tangents()
	var mesh := st.commit()
	_box_meshes[key] = mesh
	return mesh


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
	var look := surface_for(color)
	var mesh: Mesh
	if look.is_empty():
		var bm := BoxMesh.new()
		bm.size = size
		mesh = bm
	else:
		mesh = box_mesh(size)
	return _place(parent, mesh, BoxShape3D.new(), size, pos, color, collide, node_name, look)


static func cylinder(parent: Node, radius: float, height: float, pos: Vector3, color: Color, collide := true, node_name := "", top_radius := -1.0) -> Node3D:
	var mesh := CylinderMesh.new()
	mesh.bottom_radius = radius
	mesh.top_radius = radius if top_radius < 0.0 else top_radius
	mesh.height = height
	mesh.radial_segments = 20
	var shape := CylinderShape3D.new()
	shape.radius = radius
	shape.height = height
	return _place(parent, mesh, shape, Vector3.ZERO, pos, color, collide, node_name, surface_for(color))


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


static func _place(parent: Node, mesh: Mesh, shape: Shape3D, size: Vector3, pos: Vector3, color: Color, collide: bool, node_name: String, look: Array = []) -> Node3D:
	var mi := MeshInstance3D.new()
	mi.mesh = mesh
	mi.material_override = mat(color) if look.is_empty() else surface_material(String(look[0]), look[1], not (mesh is ArrayMesh))
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


const PROP_DIRS := ["res://assets/props/", "res://assets/nature/", "res://assets/village/"]


static func _prop_scene(prop_name: String) -> PackedScene:
	if not _scenes.has(prop_name):
		var found: PackedScene = null
		for d in PROP_DIRS:
			if ResourceLoader.exists(d + prop_name + ".gltf"):
				found = load(d + prop_name + ".gltf")
				break
		_scenes[prop_name] = found
	return _scenes[prop_name]


## A model from the CC0 kits by name ("Barrel", "Pine_3", "Prop_Wagon").
## Returns null when the kit isn't installed, so callers can keep their shapes.
static func prop(parent: Node, prop_name: String, pos: Vector3, yaw := 0.0, scale := 1.0) -> Node3D:
	var ps := _prop_scene(prop_name)
	if ps == null:
		return null
	var inst := ps.instantiate() as Node3D
	inst.position = pos
	inst.rotation.y = yaw
	inst.scale = Vector3.ONE * scale
	parent.add_child(inst)
	return inst


static func has_props() -> bool:
	return _prop_scene("Barrel") != null


## Many copies of one plant or stone drawn in a single call (MultiMesh), each
## at its own transform. Fades out past fade_end metres.
static func scatter(parent: Node, prop_name: String, xforms: Array, fade_end := 0.0) -> void:
	var ps := _prop_scene(prop_name)
	if ps == null or xforms.is_empty():
		return
	if Settings.low_detail():
		# Lighter graphics: a third of the plants, and they fade sooner.
		var some := []
		for i in range(0, xforms.size(), 3):
			some.append(xforms[i])
		xforms = some
		fade_end *= 0.6
	var inst := ps.instantiate() as Node3D
	for n in inst.find_children("*", "MeshInstance3D", true, false):
		var mi := n as MeshInstance3D
		var local := Transform3D()
		var p: Node = mi
		while p != inst and p != null:
			local = (p as Node3D).transform * local
			p = p.get_parent()
		var mm := MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.mesh = mi.mesh
		mm.instance_count = xforms.size()
		for i in xforms.size():
			mm.set_instance_transform(i, (xforms[i] as Transform3D) * local)
		var mmi := MultiMeshInstance3D.new()
		mmi.name = prop_name
		mmi.multimesh = mm
		if fade_end > 0.0:
			mmi.visibility_range_end = fade_end
			mmi.visibility_range_end_margin = 4.0
			mmi.visibility_range_fade_mode = GeometryInstance3D.VISIBILITY_RANGE_FADE_SELF
		parent.add_child(mmi)
	inst.free()


## An invisible wall for a prop that should stand in the way.
static func solid(parent: Node, size: Vector3, pos: Vector3, yaw := 0.0) -> StaticBody3D:
	var body := StaticBody3D.new()
	body.position = pos
	body.rotation.y = yaw
	var cs := CollisionShape3D.new()
	var shape := BoxShape3D.new()
	shape.size = size
	cs.shape = shape
	body.add_child(cs)
	parent.add_child(body)
	return body


## Hides a shape's own mesh and dresses it in a kit prop instead, keeping the
## node itself (tap surfaces, colliders and interactables stay where they were).
static func dress(node: Node3D, prop_name: String, offset := Vector3.ZERO, yaw := 0.0, scale := 1.0) -> Node3D:
	var p := prop(node, prop_name, offset, yaw, scale)
	if p == null:
		return null
	var own: Node = node if node is MeshInstance3D else null
	if own == null:
		for c in node.get_children():
			if c is MeshInstance3D and c != p:
				own = c
				break
	if own != null:
		(own as MeshInstance3D).mesh = null
	return p


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


## A person's name over their head: always the same small size on screen,
## hidden behind walls, gone past 15 m so a room never turns into a wall of text.
static func name_tag(parent: Node, text: String, pos: Vector3, color := Color(0.97, 0.88, 0.62)) -> Label3D:
	var l := Label3D.new()
	l.text = text
	l.font_size = 40
	l.fixed_size = true
	l.pixel_size = 0.00075
	l.position = pos
	l.modulate = color
	l.outline_size = 10
	l.outline_modulate = Color(0.05, 0.03, 0.02, 0.85)
	l.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	l.visibility_range_end = 15.0
	l.visibility_range_end_margin = 2.0
	l.visibility_range_fade_mode = GeometryInstance3D.VISIBILITY_RANGE_FADE_SELF
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
	# Embers glowing in the wood, and the flames rising off them.
	var embers := sphere(fire, size * 0.42, Vector3(0, size * 0.12, 0), Color(1.0, 0.42, 0.1), 2.0)
	embers.scale = Vector3(1.0, 0.35, 1.0)
	flames(fire, Vector3(0, size * 0.2, 0), size)
	fire.add_to_group("flame")
	fire.set_meta("seed", randf() * 100.0)
	return f


## Flames rising from a point: soft tongues that burn yellow at the root and
## redden as they climb and fade.
static func flames(parent: Node, pos: Vector3, size := 0.4) -> CPUParticles3D:
	var p := CPUParticles3D.new()
	p.name = "Flames"
	p.amount = 26
	p.lifetime = 0.75
	p.preprocess = 1.0
	p.randomness = 0.4
	p.emission_shape = CPUParticles3D.EMISSION_SHAPE_SPHERE
	p.emission_sphere_radius = size * 0.4
	p.direction = Vector3.UP
	p.spread = 14.0
	p.gravity = Vector3(0, size * 2.5, 0)
	p.initial_velocity_min = size * 0.5
	p.initial_velocity_max = size * 1.3
	p.scale_amount_min = 0.7
	p.scale_amount_max = 1.25
	var shrink := Curve.new()
	shrink.add_point(Vector2(0, 0.7))
	shrink.add_point(Vector2(0.25, 1.0))
	shrink.add_point(Vector2(1, 0.15))
	p.scale_amount_curve = shrink
	var ramp := Gradient.new()
	ramp.set_color(0, Color(1.0, 0.92, 0.55, 0.95))
	ramp.set_color(1, Color(0.25, 0.05, 0.02, 0.0))
	ramp.add_point(0.3, Color(1.0, 0.55, 0.14, 0.85))
	ramp.add_point(0.7, Color(0.75, 0.2, 0.06, 0.45))
	p.color_ramp = ramp
	var quad := QuadMesh.new()
	quad.size = Vector2(size * 1.0, size * 1.35)
	quad.material = _flame_material()
	p.mesh = quad
	p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	p.position = pos
	parent.add_child(p)
	return p


## A living light (the Unstrung Echo, a companion): a bright small core, a soft
## halo round it and sparks drifting off. Returns the root; the core is "Core".
static func wisp(parent: Node, radius: float, pos: Vector3, color: Color, node_name := "") -> Node3D:
	var w := Node3D.new()
	w.position = pos
	if not node_name.is_empty():
		w.name = node_name
	parent.add_child(w)
	var core := sphere(w, radius * 0.22, Vector3.ZERO, color.lightened(0.15), 1.4, "Core")
	core.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	# The glow: a feathered spot that always faces the camera (no hard edge).
	var halo := MeshInstance3D.new()
	var hm := QuadMesh.new()
	hm.size = Vector2.ONE * radius * 2.6
	halo.mesh = hm
	var m := StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	m.albedo_texture = _flame_material().albedo_texture
	m.albedo_color = Color(color.r, color.g, color.b, 0.75)
	halo.material_override = m
	halo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	w.add_child(halo)
	var p := CPUParticles3D.new()
	p.amount = 10
	p.lifetime = 1.4
	p.preprocess = 1.0
	p.emission_shape = CPUParticles3D.EMISSION_SHAPE_SPHERE
	p.emission_sphere_radius = radius * 0.6
	p.direction = Vector3.UP
	p.spread = 180.0
	p.gravity = Vector3(0, 0.15, 0)
	p.initial_velocity_min = 0.05
	p.initial_velocity_max = 0.2
	p.scale_amount_min = 0.5
	p.scale_amount_max = 1.0
	var fade := Gradient.new()
	fade.set_color(0, Color(color.r, color.g, color.b, 0.9))
	fade.set_color(1, Color(color.r, color.g, color.b, 0.0))
	p.color_ramp = fade
	var quad := QuadMesh.new()
	quad.size = Vector2.ONE * radius * 0.35
	quad.material = _flame_material()
	p.mesh = quad
	p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	w.add_child(p)
	return w


static var _flame_mat: StandardMaterial3D


## Additive, always facing the camera, a soft round spot coloured by the
## particle's own colour ramp.
static func _flame_material() -> StandardMaterial3D:
	if _flame_mat == null:
		var spot := GradientTexture2D.new()
		spot.fill = GradientTexture2D.FILL_RADIAL
		spot.fill_from = Vector2(0.5, 0.55)
		spot.fill_to = Vector2(0.5, 0.0)
		spot.width = 64
		spot.height = 64
		var g := Gradient.new()
		g.set_color(0, Color(1, 1, 1, 1))
		g.set_color(1, Color(1, 1, 1, 0))
		g.add_point(0.45, Color(1, 1, 1, 0.55))
		spot.gradient = g
		var m := StandardMaterial3D.new()
		m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		m.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
		m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		m.billboard_mode = BaseMaterial3D.BILLBOARD_PARTICLES
		m.vertex_color_use_as_albedo = true
		m.albedo_texture = spot
		m.no_depth_test = false
		_flame_mat = m
	return _flame_mat


## A cut stone: two six-sided points base to base, catching the light on
## its facets (a gem, not a glowing ball).
static func gem(parent: Node, radius: float, pos: Vector3, color: Color, emission := 0.4) -> Node3D:
	var g := Node3D.new()
	g.position = pos
	parent.add_child(g)
	var m := StandardMaterial3D.new()
	m.albedo_color = color
	m.metallic = 0.2
	m.roughness = 0.12
	m.metallic_specular = 0.9
	if emission > 0.0:
		m.emission_enabled = true
		m.emission = color
		m.emission_energy_multiplier = emission
	for up in [1.0, -1.0]:
		var c := CylinderMesh.new()
		c.radial_segments = 6
		c.rings = 1
		c.bottom_radius = radius if up > 0.0 else 0.0
		c.top_radius = 0.0 if up > 0.0 else radius
		c.height = radius * (0.9 if up > 0.0 else 1.4)
		var mi := MeshInstance3D.new()
		mi.mesh = c
		mi.material_override = m
		mi.position.y = up * c.height * 0.5
		g.add_child(mi)
	return g


static var _plain: Dictionary = {}   # material id -> its lighter copy


## Lighter graphics: every material under root keeps its colour texture and
## loses its normal, roughness and occlusion maps.
static func simplify_materials(root: Node) -> void:
	for n in root.find_children("*", "MeshInstance3D", true, false):
		var mi := n as MeshInstance3D
		if mi.mesh == null:
			continue
		if mi.material_override is BaseMaterial3D:
			mi.material_override = _plain_copy(mi.material_override)
			continue
		for s in mi.mesh.get_surface_count():
			var m := mi.get_active_material(s) as BaseMaterial3D
			if m != null:
				var p := _plain_copy(m)
				if p != m:
					mi.set_surface_override_material(s, p)


static func _plain_copy(m: BaseMaterial3D) -> BaseMaterial3D:
	if not (m.normal_enabled or m.roughness_texture != null or m.ao_enabled or (m is ORMMaterial3D and (m as ORMMaterial3D).orm_texture != null)):
		return m
	var id := m.get_instance_id()
	if not _plain.has(id):
		var p := m.duplicate() as BaseMaterial3D
		p.normal_enabled = false
		p.normal_texture = null
		p.roughness_texture = null
		p.ao_enabled = false
		if p is ORMMaterial3D:
			(p as ORMMaterial3D).orm_texture = null
		_plain[id] = p
	return _plain[id]


## A wall lantern from the props kit with its light, or a small lamp shape
## when the kit isn't installed. yaw turns the lantern to face into the room.
static func lantern(parent: Node, pos: Vector3, yaw := 0.0, color := Color(1.0, 0.68, 0.38), energy := 1.1, light_range := 9.0) -> OmniLight3D:
	var holder := Node3D.new()
	holder.name = "Lantern"
	holder.position = pos
	holder.rotation.y = yaw
	parent.add_child(holder)
	var light_at := Vector3(0, 0, 0)
	if prop(holder, "Lantern_Wall", Vector3(0, -0.7, 0)) != null:
		light_at = Vector3(0, -0.36, 1.0)   # inside the hanging cage
		var glass := sphere(holder, 0.06, light_at, color, 3.0)
		glass.scale = Vector3(1.0, 1.5, 1.0)
	else:
		sphere(holder, 0.08, light_at, color, 4.0)
	var o := omni(holder, light_at, color, energy, light_range)
	# Lighter graphics: the lantern glows but lights nothing (each light is
	# another pass over everything it touches).
	o.visible = not Settings.low_detail()
	return o


static func omni(parent: Node, pos: Vector3, color: Color, energy := 1.5, light_range := 8.0) -> OmniLight3D:
	var o := OmniLight3D.new()
	o.position = pos
	o.light_color = color
	o.light_energy = energy
	o.omni_range = light_range
	o.shadow_enabled = false
	if Settings.low_detail():
		o.light_cull_mask = WORLD_LAYER   # lighter graphics: lamps light the room, not the people
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
		var sky := Sky.new()
		if ResourceLoader.exists(SKY_HDRI):
			# A real sky (Poly Haven, CC0): it lights the scene as well as filling it.
			var pano := PanoramaSkyMaterial.new()
			pano.panorama = load(SKY_HDRI)
			pano.energy_multiplier = 1.0
			sky.sky_material = pano
			sky.radiance_size = Sky.RADIANCE_SIZE_64
		else:
			var sky_mat := ProceduralSkyMaterial.new()
			sky_mat.sky_top_color = Color(0.36, 0.52, 0.72)
			sky_mat.sky_horizon_color = Color(0.78, 0.74, 0.62)
			sky_mat.ground_bottom_color = Color(0.22, 0.2, 0.15)
			sky_mat.ground_horizon_color = Color(0.6, 0.56, 0.45)
			sky.sky_material = sky_mat
		env.background_mode = Environment.BG_SKY
		env.sky = sky
		env.ambient_light_source = Environment.AMBIENT_SOURCE_SKY
		env.ambient_light_energy = 0.6
		env.reflected_light_source = Environment.REFLECTION_SOURCE_SKY
		env.fog_enabled = true
		env.fog_light_color = Color(0.62, 0.68, 0.74)
		env.fog_density = 0.0022
		env.fog_aerial_perspective = 0.6
		env.fog_sky_affect = 0.0
		env.tonemap_exposure = 0.82
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
