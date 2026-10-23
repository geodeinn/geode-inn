class_name Creatures
extends RefCounted
## The animals of the Inn. Wolf and dragon come from Quaternius's CC0 packs,
## the barn owl from Poly by Google (CC-BY 3.0); see CREDITS.md. Ziggy, Pluck,
## the frog and the bits worn on heads are shaped here. Every builder falls
## back to plain shapes when its model file is missing.

const WOLF := "res://assets/creatures/Wolf.fbx"
const DRAGON := "res://assets/creatures/Dragon.fbx"
const OWL := "res://assets/creatures/BarnOwl.glb"


## A creature for a characters.json "creature" id.
static func build(kind: String, parent: Node3D, col: Color) -> Node3D:
	match kind:
		"wolf":
			return wolf(parent)
		"dragon":
			return dragon_asleep(parent)
		"owl":
			return owl(parent)
		"gecko":
			return gecko(parent, col)
		"fossil_rat":
			return fossil_rat(parent)
	return null


static func _load(path: String) -> Node3D:
	if not ResourceLoader.exists(path):
		return null
	return (load(path) as PackedScene).instantiate() as Node3D


static func _anim(model: Node) -> AnimationPlayer:
	return model.find_child("AnimationPlayer", true, false) as AnimationPlayer


## Plays the first animation whose name ends with suffix ("Idle", "Walking").
static func play(model: Node, suffix: String, speed := 1.0) -> void:
	var ap := _anim(model)
	if ap == null:
		return
	for a in ap.get_animation_list():
		if String(a).ends_with(suffix):
			if ap.current_animation != a:
				ap.get_animation(a).loop_mode = Animation.LOOP_LINEAR
				ap.play(a, 0.3)
			ap.speed_scale = speed
			return


static var _recolored: Dictionary = {}   # kept, so a material never goes before its mesh does


static func clear_cache() -> void:
	_recolored.clear()


static func _recolor(base: BaseMaterial3D, albedo: Color, rough := -1.0) -> BaseMaterial3D:
	var key := "%d|%s|%s" % [base.get_instance_id(), albedo.to_html(), rough]
	if not _recolored.has(key):
		var m := base.duplicate() as BaseMaterial3D
		m.albedo_color = albedo
		if rough >= 0.0:
			m.roughness = rough
		_recolored[key] = m
	return _recolored[key]


static func _tint_all(model: Node, tint: Color) -> void:
	for n in model.find_children("*", "MeshInstance3D", true, false):
		var mi := n as MeshInstance3D
		if mi.material_override is BaseMaterial3D:
			var o := mi.material_override as BaseMaterial3D
			mi.material_override = _recolor(o, o.albedo_color * tint)
			continue
		for s in mi.mesh.get_surface_count():
			var base := mi.get_active_material(s) as BaseMaterial3D
			if base == null:
				continue
			mi.set_surface_override_material(s, _recolor(base, base.albedo_color * tint))


# ---------------------------------------------------------------- wolf

## Jay's wolf: grey, about 0.8 m at the shoulder, facing -Z like everyone else.
static func wolf(parent: Node3D) -> Node3D:
	var holder := Node3D.new()
	holder.name = "Wolf"
	parent.add_child(holder)
	var m := _load(WOLF)
	if m == null:
		Builder.box(holder, Vector3(0.45, 0.45, 0.9), Vector3(0, 0.35, 0), Color(0.5, 0.5, 0.52), false)
		Builder.sphere(holder, 0.22, Vector3(0, 0.65, -0.55), Color(0.55, 0.55, 0.57))
		return holder
	m.scale = Vector3.ONE * 0.14
	m.rotation.y = PI / 2.0   # the model runs along +X
	m.position = Vector3(0.12, 0, 0)
	holder.add_child(m)
	_tint_all(m, Color(0.4, 0.39, 0.38))
	play(m, "Idle")
	return holder


# ---------------------------------------------------------------- the baby dragon

## Asleep on the gems: the rig is posed lying down, head on the floor, wings
## folded along the back and the tail curled round. Eyes closed (hidden).
static func dragon_asleep(parent: Node3D) -> Node3D:
	var holder := Node3D.new()
	holder.name = "Dragon"
	parent.add_child(holder)
	var m := _load(DRAGON)
	if m == null:
		var green := Color(0.42, 0.5, 0.36)
		Builder.sphere(holder, 0.32, Vector3.ZERO, green).scale = Vector3(1.3, 0.8, 1.0)
		Builder.sphere(holder, 0.17, Vector3(0.42, 0.04, 0.18), green.lightened(0.1))
		return holder
	# Lying down is the upright model tipped forward onto its belly.
	var tip := Node3D.new()
	tip.name = "Lie"
	tip.rotation.x = PI / 2.0
	holder.add_child(tip)
	tip.add_child(m)
	_amethyst(m)
	var eyes := m.find_child("EyeArmature", true, false)
	if eyes:
		eyes.visible = false
	var ap := _anim(m)
	if ap:
		ap.stop()
	var s := m.find_child("Skeleton3D", true, false) as Skeleton3D
	if s:
		s.reset_bone_poses()
		var to_model := m.transform * _chain(s, m)   # the FBX root and armature transforms
		# Directions are in the lying frame: +Z forward, +Y up, +X the dragon's left.
		var aims := [
			["Neck", Vector3(0, -0.15, 1)], ["Head", Vector3(0, -0.35, 1)], ["Face", Vector3(0, -0.2, 1)],
			["Shoulder.L", Vector3(0.7, 0.4, -0.3)], ["Wing1.L", Vector3(0.55, -0.05, -0.83)],
			["Wing2.L", Vector3(0.3, -0.15, -0.94)], ["Wing3.L", Vector3(0.22, -0.2, -0.95)], ["Wing4.L", Vector3(0.15, -0.25, -0.95)],
			["Shoulder.R", Vector3(-0.7, 0.4, -0.3)], ["Wing1.R", Vector3(-0.55, -0.05, -0.83)],
			["Wing2.R", Vector3(-0.3, -0.15, -0.94)], ["Wing3.R", Vector3(-0.22, -0.2, -0.95)], ["Wing4.R", Vector3(-0.15, -0.25, -0.95)],
			["UpperLeg.L", Vector3(0.3, -0.6, 0.75)], ["LowerLeg.L", Vector3(0.1, -0.3, -0.95)], ["Feet.L", Vector3(0.05, -0.2, 0.98)],
			["UpperLeg.R", Vector3(-0.3, -0.6, 0.75)], ["LowerLeg.R", Vector3(-0.1, -0.3, -0.95)], ["Feet.R", Vector3(-0.05, -0.2, 0.98)],
			["Tail1", Vector3(0, -0.2, -1)], ["Tail2", Vector3(0.45, -0.1, -0.9)], ["Tail3", Vector3(0.95, -0.05, -0.1)],
			["Tail4", Vector3(0.55, 0, 0.85)],
		]
		var lie := Basis(Vector3.RIGHT, -PI / 2.0)   # lying frame -> upright model frame
		for a in aims:
			_aim_bone(s, String(a[0]), to_model.basis.inverse() * (lie * (a[1] as Vector3)))
		# Wings this small read as folded; a baby's wings are the last thing to grow.
		for w in ["Wing1.L", "Wing1.R"]:
			var b := s.find_bone(w)
			if b >= 0:
				s.set_bone_pose_scale(b, Vector3.ONE * 0.62)
		m.scale = Vector3.ONE * 0.3
		# Settle it on the floor: the lowest bone a little above the ground, the
		# body over the holder's origin.
		var low := INF
		var mid := Vector3.ZERO
		var to_holder := tip.transform * m.transform * _chain(s, m)
		for b in s.get_bone_count():
			var p := to_holder * s.get_bone_global_pose(b).origin
			low = minf(low, p.y)
			if s.get_bone_name(b) == "Body":
				mid = p
		tip.position = Vector3(-mid.x, 0.06 - low, -mid.z)
	return holder


## The transform from a node's frame to an ancestor's (not including the ancestor's own).
static func _chain(node: Node3D, ancestor: Node) -> Transform3D:
	var xf := Transform3D()
	var p: Node = node
	while p != ancestor and p != null:
		xf = (p as Node3D).transform * xf
		p = p.get_parent()
	return xf


## Canon colours: deep amethyst purple scales, a gold belly.
static func _amethyst(model: Node) -> void:
	for n in model.find_children("*", "MeshInstance3D", true, false):
		var mi := n as MeshInstance3D
		for s in mi.mesh.get_surface_count():
			var base := mi.get_active_material(s) as BaseMaterial3D
			if base == null:
				continue
			var c := base.albedo_color
			var col := Color(0.13, 0.08, 0.18)                    # wings, claws
			if c.r > c.b * 1.5 and c.g > c.b * 1.5:
				col = Color(0.86, 0.66, 0.26)                     # belly: gold
			elif c.r > c.g * 1.5:
				col = Color(0.2, 0.1, 0.3)                        # scales: amethyst
			mi.set_surface_override_material(s, _recolor(base, col, 0.55))


## Turns a bone (and so everything below it) so it points along dir, given in
## skeleton space.
static func _aim_bone(s: Skeleton3D, bone_name: String, dir: Vector3) -> void:
	var b := s.find_bone(bone_name)
	if b < 0:
		return
	var g := s.get_bone_global_pose(b)
	var along := g.basis.y.normalized()
	var want := dir.normalized()
	if along.is_equal_approx(want):
		return
	var delta := Quaternion(along, want)
	var new_global := Basis(delta) * g.basis
	var parent := s.get_bone_parent(b)
	var parent_basis := s.get_bone_global_pose(parent).basis if parent >= 0 else Basis()
	var local := parent_basis.inverse() * new_global
	s.set_bone_pose_rotation(b, local.get_rotation_quaternion())


# ---------------------------------------------------------------- the owl

## The barn owl that keeps the lighthouse light, about 40 cm tall.
static func owl(parent: Node3D) -> Node3D:
	var holder := Node3D.new()
	holder.name = "Owl"
	parent.add_child(holder)
	var m := _load(OWL)
	if m == null:
		Builder.sphere(holder, 0.18, Vector3(0, 0.2, 0), Color(0.8, 0.66, 0.42)).scale = Vector3(1, 1.4, 1)
		Builder.sphere(holder, 0.12, Vector3(0, 0.42, -0.04), Color(0.95, 0.92, 0.86))
		return holder
	holder.add_child(m)
	var box := _mesh_bounds(m)
	var k := 0.42 / maxf(box.size.y, 0.001)
	m.scale = Vector3.ONE * k
	m.position = Vector3(-box.get_center().x * k, -box.position.y * k, -box.get_center().z * k)
	m.rotation.y = PI   # face the room
	holder.set_meta("owl", true)
	return holder


static func _mesh_bounds(model: Node3D) -> AABB:
	var out := AABB()
	var first := true
	for n in model.find_children("*", "MeshInstance3D", true, false):
		var mi := n as MeshInstance3D
		var xf := Transform3D()
		var p: Node = mi
		while p != model and p != null:
			xf = (p as Node3D).transform * xf
			p = p.get_parent()
		var box := xf * mi.get_aabb()
		out = box if first else out.merge(box)
		first = false
	return out


# ---------------------------------------------------------------- shaped here

static func _capsule(parent: Node3D, radius: float, height: float, pos: Vector3, col: Color, rough := 0.7) -> MeshInstance3D:
	var mesh := CapsuleMesh.new()
	mesh.radius = radius
	mesh.height = maxf(height, radius * 2.0)
	mesh.radial_segments = 16
	mesh.rings = 6
	var mi := MeshInstance3D.new()
	mi.mesh = mesh
	mi.material_override = Builder.mat(col, 0.0, rough)
	mi.position = pos
	parent.add_child(mi)
	return mi


## Ziggy, a crested gecko: a soft orange body, the crest of little spines from
## the brows to the tail, big lidless eyes and the smile.
static func gecko(parent: Node3D, col: Color) -> Node3D:
	var g := Node3D.new()
	g.name = "Gecko"
	parent.add_child(g)
	var belly := col.lightened(0.25)
	var body := _capsule(g, 0.04, 0.2, Vector3(0, 0.04, 0.0), col)
	body.rotation.x = PI / 2.0
	body.scale = Vector3(1.15, 1.0, 0.8)
	var head := _capsule(g, 0.042, 0.11, Vector3(0, 0.055, -0.13), col.lightened(0.05))
	head.rotation.x = PI / 2.0
	head.scale = Vector3(1.2, 1.0, 0.8)
	_capsule(g, 0.03, 0.12, Vector3(0, 0.03, -0.01), belly).rotation.x = PI / 2.0
	var tail := _capsule(g, 0.022, 0.22, Vector3(0, 0.035, 0.2), col.darkened(0.08))
	tail.rotation.x = PI / 2.0 - 0.15
	for i in 9:
		var z := -0.16 + i * 0.045
		var spine := Builder.cylinder(g, 0.006, 0.022, Vector3(0, 0.085 - absf(z) * 0.08, z), col.darkened(0.25), false, "", 0.0)
		spine.rotation.x = 0.4
	for side in [-1.0, 1.0]:
		Builder.cylinder(g, 0.006, 0.02, Vector3(side * 0.03, 0.095, -0.14), col.darkened(0.25), false, "", 0.0).rotation.z = side * 0.6
		for z in [-0.07, 0.07]:
			var leg := _capsule(g, 0.012, 0.07, Vector3(side * 0.055, 0.02, z), col)
			leg.rotation.z = side * 1.1
			Builder.sphere(g, 0.012, Vector3(side * 0.085, 0.004, z - 0.01), col.lightened(0.15)).scale = Vector3(1.3, 0.4, 1.3)
	for side in [-1.0, 1.0]:
		var eye := Builder.sphere(g, 0.019, Vector3(side * 0.036, 0.078, -0.165), Color(0.55, 0.42, 0.12), 0.15)
		eye.name = "EyeL" if side < 0.0 else "EyeR"
		Builder.sphere(eye, 0.008, Vector3(side * 0.006, 0.0, -0.014), Color(0.03, 0.02, 0.02)).scale = Vector3(0.5, 1.4, 0.5)
	var smile := Builder.cylinder(g, 0.028, 0.004, Vector3(0, 0.04, -0.168), Color(0.25, 0.12, 0.08), false, "", 0.028)
	smile.rotation.x = PI / 2.0
	smile.scale = Vector3(1.0, 1.0, 0.25)
	return g


## Pluck: the fossil rat that never quite fossilized all the way through. A
## little bone-white skeleton with a warm glow inside, a long tail.
static func fossil_rat(parent: Node3D) -> Node3D:
	var r := Node3D.new()
	r.name = "FossilRat"
	parent.add_child(r)
	var bone := Color(0.86, 0.8, 0.66)
	var dark := Color(0.32, 0.26, 0.2)
	var skull := Builder.sphere(r, 0.05, Vector3(0, 0.17, -0.1), bone)
	skull.scale = Vector3(0.9, 0.85, 1.1)
	var snout := Builder.cylinder(r, 0.03, 0.1, Vector3(0, 0.15, -0.17), bone, false, "", 0.008)
	snout.rotation.x = -PI / 2.0 + 0.3
	for side in [-1.0, 1.0]:
		Builder.sphere(r, 0.014, Vector3(side * 0.028, 0.185, -0.135), dark)
		var ear := Builder.cylinder(r, 0.022, 0.006, Vector3(side * 0.035, 0.215, -0.07), bone.darkened(0.08), false, "", 0.022)
		ear.rotation = Vector3(PI / 2.0 - 0.3, 0, side * 0.5)
	var spine := _capsule(r, 0.022, 0.24, Vector3(0, 0.15, 0.06), bone, 0.5)
	spine.rotation.x = PI / 2.0 - 0.15
	for i in 6:
		var z := -0.02 + i * 0.03
		var rib := MeshInstance3D.new()
		var torus := TorusMesh.new()
		torus.inner_radius = 0.045 - i * 0.003
		torus.outer_radius = 0.053 - i * 0.003
		torus.rings = 16
		torus.ring_segments = 6
		rib.mesh = torus
		rib.material_override = Builder.mat(bone, 0.0, 0.5)
		rib.position = Vector3(0, 0.12, z)
		rib.rotation.x = PI / 2.0
		r.add_child(rib)
	# The warmth that let it keep dancing.
	Builder.sphere(r, 0.03, Vector3(0, 0.12, 0.04), Color(1.0, 0.62, 0.3), 2.2)
	for side in [-1.0, 1.0]:
		for z in [-0.04, 0.14]:
			var leg := _capsule(r, 0.009, 0.12, Vector3(side * 0.04, 0.06, z), bone, 0.5)
			leg.rotation.z = side * 0.25
	for i in 7:
		var seg := Builder.sphere(r, 0.012 - i * 0.001, Vector3(0, 0.13 - i * 0.012, 0.22 + i * 0.035), bone)
		seg.scale = Vector3(1, 1, 1.4)
	return r


## The frog the Common Room makes of the rude: round, green, golden-eyed.
static func frog(parent: Node3D) -> Node3D:
	var f := Node3D.new()
	f.name = "Frog"
	parent.add_child(f)
	f.scale = Vector3.ONE * 0.8
	var green := Color(0.26, 0.44, 0.19)
	var belly := Color(0.72, 0.74, 0.5)
	Builder.sphere(f, 0.3, Vector3(0, 0.28, 0.02), green).scale = Vector3(1.15, 0.8, 1.2)
	Builder.sphere(f, 0.22, Vector3(0, 0.22, -0.14), belly).scale = Vector3(1.1, 0.7, 0.9)
	Builder.sphere(f, 0.2, Vector3(0, 0.42, -0.2), green).scale = Vector3(1.3, 0.8, 1.0)
	for side in [-1.0, 1.0]:
		Builder.sphere(f, 0.085, Vector3(side * 0.13, 0.55, -0.24), green.lightened(0.05))
		Builder.sphere(f, 0.065, Vector3(side * 0.14, 0.57, -0.29), Color(0.95, 0.78, 0.25), 0.3)
		Builder.sphere(f, 0.03, Vector3(side * 0.145, 0.58, -0.34), Color(0.05, 0.05, 0.05))
		var thigh := Builder.sphere(f, 0.14, Vector3(side * 0.26, 0.16, 0.16), green.darkened(0.08))
		thigh.scale = Vector3(0.7, 0.6, 1.3)
		Builder.sphere(f, 0.08, Vector3(side * 0.3, 0.03, -0.08), green.darkened(0.05)).scale = Vector3(1.0, 0.35, 1.6)
		Builder.sphere(f, 0.06, Vector3(side * 0.16, 0.05, -0.3), green.darkened(0.05)).scale = Vector3(1.0, 0.4, 1.4)
	var mouth := Builder.cylinder(f, 0.17, 0.006, Vector3(0, 0.36, -0.36), Color(0.15, 0.25, 0.1), false, "", 0.17)
	mouth.rotation.x = PI / 2.0
	mouth.scale = Vector3(1.0, 1.0, 0.12)
	return f


## What a few of the cast wear on top of the kit: Naut's own head, Brindle's cap.
static func dress(cid: String, person: CharacterModel) -> void:
	match cid:
		"naut":
			squid_head(person.attach("Head"), Builder.color(String(GameData.character(cid).get("color", "#3d5a66"))).lightened(0.12))
		"brindle":
			mushroom_cap(person.attach("Head"))


## Naut's head: a squid's mantle rising up and back, two wide eyes behind
## round spectacles, and the tentacles hanging where a beard would be. Built in
## the Head bone's frame (+Y up, +Z out of the face).
static func squid_head(parent: Node3D, col: Color) -> Node3D:
	var h := Node3D.new()
	h.name = "SquidHead"
	parent.add_child(h)
	var mantle := _capsule(h, 0.13, 0.42, Vector3(0, 0.2, -0.05), col, 0.45)
	mantle.rotation.x = -0.35
	var fin := Builder.sphere(h, 0.1, Vector3(0, 0.4, -0.13), col.darkened(0.1))
	fin.scale = Vector3(1.6, 0.5, 0.9)
	Builder.sphere(h, 0.12, Vector3(0, 0.07, 0.03), col.lightened(0.08)).scale = Vector3(1.05, 0.85, 1.0)
	var glass := Color(0.85, 0.92, 0.95, 0.35)
	for side in [-1.0, 1.0]:
		Builder.sphere(h, 0.045, Vector3(side * 0.07, 0.12, 0.1), Color(0.95, 0.88, 0.6))
		Builder.sphere(h, 0.022, Vector3(side * 0.072, 0.12, 0.138), Color(0.06, 0.05, 0.05))
		var rim := MeshInstance3D.new()
		var torus := TorusMesh.new()
		torus.inner_radius = 0.047
		torus.outer_radius = 0.055
		rim.mesh = torus
		rim.material_override = Builder.mat(Color(0.75, 0.6, 0.3), 0.0, 0.3, 0.8)
		rim.position = Vector3(side * 0.07, 0.12, 0.155)
		rim.rotation.x = PI / 2.0
		h.add_child(rim)
		var lens := Builder.cylinder(h, 0.047, 0.004, Vector3(side * 0.07, 0.12, 0.153), glass, false, "", 0.047)
		lens.rotation.x = PI / 2.0
	Builder.cylinder(h, 0.004, 0.04, Vector3(0, 0.125, 0.155), Color(0.75, 0.6, 0.3), false, "", 0.004).rotation.z = PI / 2.0
	for i in 8:
		var a := (float(i) / 7.0 - 0.5) * 2.4
		var t := _capsule(h, 0.018, 0.2 + 0.06 * cos(a * 1.3), Vector3(sin(a) * 0.08, -0.04, 0.06 + cos(a) * 0.04), col.darkened(0.06), 0.5)
		t.rotation = Vector3(0.25, 0, a * 0.18)
	return h


## Brindle's mushroom cap, worn like a hat.
static func mushroom_cap(parent: Node3D) -> Node3D:
	var c := Node3D.new()
	c.name = "MushroomCap"
	parent.add_child(c)
	var cap := Builder.sphere(c, 0.16, Vector3(0, 0.17, 0), Color(0.5, 0.2, 0.13))
	cap.scale = Vector3(1.2, 0.6, 1.2)
	Builder.cylinder(c, 0.18, 0.025, Vector3(0, 0.15, 0), Color(0.86, 0.8, 0.68), false, "", 0.13)
	for i in 7:
		var a := i * 0.9
		var r := 0.07 if i % 2 == 0 else 0.13
		var y := 0.17 + 0.096 * sqrt(maxf(1.0 - pow(r / 0.192, 2.0), 0.0))
		Builder.sphere(c, 0.02, Vector3(cos(a) * r, y, sin(a) * r), Color(0.94, 0.9, 0.82)).scale = Vector3(1, 0.4, 1)
	return c
