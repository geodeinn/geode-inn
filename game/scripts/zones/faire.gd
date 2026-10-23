extends ZoneBase
## One faire, built from its owner's config: the layout's booths, stage, pub
## and joust field, painted in the owner's colors, with their booth signs,
## artisans and stage lineup. Every rented faire uses this same template. The
## way in and out is the Faire Grounds, off the Main Floor's market.

var config: Dictionary = {}


func build_world() -> void:
	zone_id = "faire"
	outdoor = true
	config = SceneRouter.faire_config
	if config.is_empty():
		var samples: Array = GameData.faire.get("sample_faires", [])
		config = samples[0] if not samples.is_empty() else {}
	spawns = { "default": [Vector3(0, 0.2, 21), 0.0], "entrance": [Vector3(0, 0.2, 21), 0.0] }
	Builder.environment(self, true)
	var sun := DirectionalLight3D.new()
	sun.rotation = Vector3(deg_to_rad(-55), deg_to_rad(-25), 0)
	sun.light_energy = 1.2
	sun.shadow_enabled = not Settings.low_detail()
	sun.directional_shadow_max_distance = 40.0
	add_child(sun)
	Builder.skin(Color(0.36, 0.44, 0.22), "grass", false)
	for wood in [Color(0.45, 0.32, 0.2), Color(0.35, 0.25, 0.16), Color(0.4, 0.3, 0.2), Color(0.42, 0.3, 0.18), Color(0.5, 0.36, 0.22)]:
		Builder.skin(wood, "planks", false)
	Builder.skin(Color(0.4, 0.28, 0.18), "boards", false)    # the stage
	Builder.skin(Color(0.5, 0.2, 0.14), "tiles", false)      # the pub roof
	Builder.box(self, Vector3(70, 0.2, 70), Vector3(0, -0.1, 0), Color(0.36, 0.44, 0.22), true, "Ground")
	# The field's edge: walls you can't see, just inside the ground's edge.
	for edge in [[Vector3(70, 8, 1), Vector3(0, 4, -34.5)], [Vector3(70, 8, 1), Vector3(0, 4, 34.5)], [Vector3(1, 8, 70), Vector3(-34.5, 4, 0)], [Vector3(1, 8, 70), Vector3(34.5, 4, 0)]]:
		Builder.solid(self, edge[0], edge[1]).name = "Edge"
	var layout: Dictionary = GameData.faire["layouts"].get(String(config.get("layout", "ring")), GameData.faire["layouts"]["ring"])
	var palette: Array = GameData.faire["palettes"].get(String(config.get("palette", "royal")), ["#6b2a3a", "#d4a64a"])
	var main_col := Builder.color(String(palette[0]))
	var trim_col := Builder.color(String(palette[1]))
	_entrance(main_col, trim_col)
	var booth_spots: Array = layout["booths"]
	var booths: Array = config.get("booths", [])
	for i in booth_spots.size():
		var spot: Array = booth_spots[i]
		var pos := Vector3(float(spot[0]), 0, float(spot[1]))
		if i < booths.size():
			_booth(pos, booths[i], main_col if i % 2 == 0 else trim_col.darkened(0.3), trim_col)
		else:
			_empty_booth(pos)
	_stage(_v(layout["stage"]), main_col, trim_col)
	_pub(_v(layout["pub"]))
	_joust(_v(layout["joust"]), main_col, trim_col)
	add_npc("faire_herald", Vector3(2.5, 0, 16))
	_greenery()
	for i in 8:
		var ang := i * TAU / 8.0
		Builder.box(self, Vector3(0.12, 5.0, 0.12), Vector3(cos(ang) * 26.0, 2.5, sin(ang) * 26.0), Color(0.4, 0.3, 0.2), true)
		Builder.box(self, Vector3(0.9, 1.6, 0.04), Vector3(cos(ang) * 26.0 + 0.5, 4.0, sin(ang) * 26.0), main_col if i % 2 == 0 else trim_col, false)


## Trees round the field and grass and flowers between the booths, so the
## faire sits in a meadow rather than on a plain.
func _greenery() -> void:
	if not Builder.has_props():
		return
	var rng := RandomNumberGenerator.new()
	rng.seed = 77
	for i in 26:
		var ang := i * TAU / 26.0 + rng.randf() * 0.1
		var p := Vector3(cos(ang), 0, sin(ang)) * rng.randf_range(31.0, 34.0)
		if p.z > 20.0 and absf(p.x) < 8.0:
			continue   # the way in
		var kind := "Pine_%d" % (1 + i % 5) if i % 3 == 0 else "CommonTree_%d" % (1 + i % 5)
		Builder.prop(self, kind, p, rng.randf() * TAU, rng.randf_range(0.9, 1.2))
	var picks := { "Grass_Common_Short": [], "Grass_Wispy_Short": [], "Flower_3_Group": [], "Flower_4_Group": [], "Bush_Common_Flowers": [] }
	var sizes := { "Grass_Common_Short": 0.42, "Grass_Wispy_Short": 0.5, "Flower_3_Group": 0.32, "Flower_4_Group": 0.28, "Bush_Common_Flowers": 0.6 }
	for n in 220:
		var p := Vector3(rng.randf_range(-33, 33), 0, rng.randf_range(-33, 33))
		var r := p.length()
		if r < 27.0 or r > 33.0:
			continue   # keep the faire itself clear; plant the margins
		var kind: String = picks.keys()[rng.randi() % picks.size()]
		var s := float(sizes[kind]) * rng.randf_range(0.7, 1.0)
		picks[kind].append(Transform3D(Basis(Vector3.UP, rng.randf() * TAU).scaled(Vector3.ONE * s), p))
	for kind in picks:
		Builder.scatter(self, kind, picks[kind], 45.0)


func _v(p: Array) -> Vector3:
	return Vector3(float(p[0]), 0, float(p[1]))


func _entrance(main_col: Color, trim_col: Color) -> void:
	Builder.box(self, Vector3(0.6, 5, 0.6), Vector3(-3, 2.5, 24), main_col, true)
	Builder.box(self, Vector3(0.6, 5, 0.6), Vector3(3, 2.5, 24), main_col, true)
	Builder.box(self, Vector3(7, 0.8, 0.6), Vector3(0, 5.2, 24), trim_col, true)
	Builder.label(self, String(config.get("faire_name", "The Faire")), Vector3(0, 6.2, 24), 72, trim_col.lightened(0.3))
	Builder.label(self, "Hosted by " + String(config.get("owner", "")), Vector3(0, 4.3, 24.3), 36)
	Interactable.make(self, "portal", "exit", Vector3(0, 0, 25.2), "Head back to the Inn", 1.8, { "zone": "main_floor", "spawn": "faire_grounds" })
	Interactable.make(self, "trigger", "arrived", Vector3(0, 0, 21), "", 2.5, { "event": "visit:faire" })


func _booth(pos: Vector3, booth: Dictionary, canopy: Color, trim: Color) -> void:
	var root := Node3D.new()
	add_child(root)
	# Each booth faces the middle of the faire.
	root.look_at_from_position(pos, Vector3(0, 0, 0) if pos.length() > 0.1 else Vector3(0, 0, -1), Vector3.UP)
	Builder.box(root, Vector3(2.6, 0.9, 1.0), Vector3(0, 0.45, -0.6), Color(0.45, 0.32, 0.2), true)
	for x in [-1.2, 1.2]:
		Builder.box(root, Vector3(0.1, 2.5, 0.1), Vector3(x, 1.25, -1.3), Color(0.35, 0.25, 0.16), false)
		Builder.box(root, Vector3(0.1, 2.5, 0.1), Vector3(x, 1.25, 0.2), Color(0.35, 0.25, 0.16), false)
	Builder.box(root, Vector3(2.8, 0.1, 1.9), Vector3(0, 2.55, -0.55), canopy, false)
	Builder.box(root, Vector3(2.8, 0.35, 0.05), Vector3(0, 2.35, 0.4), trim, false)
	var sign_label := Builder.label(root, String(booth.get("sign", "Booth")), Vector3(0, 2.95, 0.45), 40, Color(1, 0.92, 0.7))
	sign_label.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	sign_label.rotation.y = PI
	var artisan := String(booth.get("artisan", ""))
	if not artisan.is_empty():
		Builder.label(root, artisan, Vector3(0, 1.6, -1.2), 30)
	if Builder.has_props():
		Builder.prop(root, "Coin_Pile", Vector3(-0.9, 0.9, -0.55), 0.4)
		for i in 3:
			Builder.gem(root, 0.06, Vector3(-0.3 + i * 0.4, 0.96, -0.5), Color.from_hsv(i * 0.21 + pos.x * 0.01, 0.5, 0.95), 0.5)
		Builder.prop(root, "Chalice", Vector3(0.95, 0.9, -0.6))
	else:
		for i in 4:
			Builder.sphere(root, 0.07, Vector3(-0.9 + i * 0.6, 0.98, -0.5), Color.from_hsv(i * 0.21 + pos.x * 0.01, 0.5, 0.9), 1.2)
	Interactable.make(self, "booth", String(booth.get("sign", "booth")), pos + (Vector3.ZERO - pos).normalized() * 1.6 if pos.length() > 0.1 else pos,
		"Browse " + String(booth.get("sign", "the booth")), 2.0, { "sign": booth.get("sign", "Booth"), "items": booth.get("items", []) })


func _empty_booth(pos: Vector3) -> void:
	Builder.box(self, Vector3(2.2, 0.8, 1.0), pos + Vector3(0, 0.4, 0), Color(0.4, 0.3, 0.2), true)
	Builder.label(self, "Space to let", pos + Vector3(0, 1.4, 0), 30, Color(0.8, 0.75, 0.65))


func _stage(pos: Vector3, main_col: Color, trim_col: Color) -> void:
	Builder.box(self, Vector3(6, 0.8, 4), pos + Vector3(0, 0.4, 0), Color(0.4, 0.28, 0.18), true)
	Builder.box(self, Vector3(6.4, 3.4, 0.2), pos + Vector3(0, 2.5, -2.0), main_col, false)
	Builder.label(self, "The Stage", pos + Vector3(0, 4.6, -1.8), 48, trim_col.lightened(0.3))
	var lineup: Array = config.get("performers", [])
	var text := "Today: " + ", ".join(PackedStringArray(lineup)) if not lineup.is_empty() else "Open stage"
	Builder.label(self, text, pos + Vector3(0, 3.6, -1.7), 30)
	Builder.omni(self, pos + Vector3(0, 3.0, 1.0), Color(1.0, 0.85, 0.6), 1.5, 9.0)


func _pub(pos: Vector3) -> void:
	Builder.box(self, Vector3(6, 3.5, 4.5), pos + Vector3(0, 1.75, 0), Color(0.42, 0.3, 0.18), true)
	Builder.box(self, Vector3(6.6, 0.4, 5.0), pos + Vector3(0, 3.7, 0), Color(0.5, 0.2, 0.14), false)
	Builder.label(self, "The Pub", pos + Vector3(0, 4.5, 0), 44)
	if Builder.has_props():
		var front := (Vector3.ZERO - pos).normalized() if pos.length() > 0.1 else Vector3.BACK
		var out := pos + front * 3.4
		var side := Vector3(front.z, 0, -front.x)
		var yaw := atan2(front.x, front.z)
		Builder.prop(self, "Table_Large", out, yaw + PI / 2.0)
		for k in [-1.0, 1.0]:
			Builder.prop(self, "Bench", out + front * (0.7 * k), yaw + PI / 2.0)
		Builder.prop(self, "Barrel", out + side * 2.2, 0.4)
		Builder.prop(self, "Barrel_Apples", out + side * 2.2 + front * 0.8, 1.4)
		Builder.prop(self, "Mug", out + Vector3(0, 0.82, 0), 0.7)
		Builder.lantern(self, pos + front * 2.3 + Vector3(0, 2.8, 0), yaw, Color(1.0, 0.72, 0.42), 0.9, 8.0)


func _joust(pos: Vector3, main_col: Color, trim_col: Color) -> void:
	Builder.box(self, Vector3(1.2, 0.9, 16), pos + Vector3(0, 0.45, 0), Color(0.5, 0.36, 0.22), true)
	for i in 5:
		Builder.box(self, Vector3(0.1, 1.8, 0.1), pos + Vector3(-1.2, 0.9, -8 + i * 4), Color(0.4, 0.3, 0.2), false)
		Builder.box(self, Vector3(0.6, 0.8, 0.03), pos + Vector3(-1.2, 1.5, -8 + i * 4), main_col if i % 2 == 0 else trim_col, false)
	Builder.label(self, "The Joust, on the hour", pos + Vector3(0, 2.6, 0), 40)


func on_zone_ready() -> void:
	EventBus.emit_event("faire_visit")
	PlayerState.add_chronicle("Visited %s." % String(config.get("faire_name", "a faire")), "faire")
