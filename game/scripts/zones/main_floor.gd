extends ZoneBase
## The Main Floor (walkthrough dissection 13, Sep 10 2026): the heart, the
## home room. The front door, the hearth and the staircase stand on one axis.
## The Catalyst's bar is built into the wall beside the fire, with the
## impossible garden behind it, and on past it the arcade's glow. The market
## isn't a room: it lines the paths, and its stalls wrap the Inn-Tree's trunk.
## The Library Nook keeps Naut's fireplace corner and the Ragana's reading
## table. The Dragon's Geode Corner sits beside the hearth. Ziggy is hiding
## somewhere from the very first hour. The Faire Grounds open off the east
## wall. And beside the main entrance there may one day be a small door.

const WOOD := Color(0.36, 0.24, 0.15)
const DARK_WOOD := Color(0.22, 0.14, 0.09)
const STONE := Color(0.33, 0.3, 0.28)
const CRYSTAL := Color(0.45, 0.32, 0.62)
const BARK := Color(0.27, 0.19, 0.12)
const TRUNK := Vector3(6.2, 0, 2.2)
const CORNER := Vector3(6.0, 0, -10.8)
const MAX_GEMS := 60

var _echo: Node3D
var _dragon: Node3D
var _gems: Array[Node3D] = []
var _ziggy: Node3D
var _ziggy_eyes: Array[Node3D] = []
var _ziggy_it: Interactable
var _small_door: Node3D
var _small_door_plug: Node3D
var _beds: Array[Node3D] = []
var _score_rows: Node3D
var _score_timer := 0.0
var _blink_timer := 3.0


func build_world() -> void:
	zone_id = "main_floor"
	spawns = {
		"default": [Vector3(0, 0.2, 8.6), 0.0],
		"door": [Vector3(0, 0.2, 8.6), 0.0],
		"small_door": [Vector3(-2.8, 0.2, 9.3), 0.0],
		"faire_grounds": [Vector3(14.4, 0.2, 5.5), PI / 2.0],
	}
	Builder.environment(self, false)
	_room()
	_hearth_and_staircase()
	_bar_and_garden()
	_arcade()
	_market()
	_library_nook()
	_geode_corner()
	_faire_grounds()
	_small_door_place()
	_ziggy_place()
	_humble_objects()
	for cid in ["host", "firekeeper", "catalyst", "ragana", "naut", "wanderer", "brindle", "charles"]:
		add_npc(cid)
	add_nook("window", Vector3(-10.7, 0, 8.4), -PI / 2.0)
	add_nook("corner", Vector3(10.7, 0, 8.4), PI / 2.0)
	add_nook("hearth_w", Vector3(-3.3, 0, -2.6), 0.35, "Sit by the fire")
	add_nook("hearth_e", Vector3(3.3, 0, -2.6), -0.35, "Sit by the fire")
	add_nook("library", Vector3(10.8, 0, -3.9), PI / 2.0, "Sit and read")
	Interactable.make(self, "portal", "front_door", Vector3(0, 0, 10.3), "Step out to the Campgrounds", 1.4, { "zone": "campgrounds", "spawn": "porch" })
	_hidden_layers()


# ---------------------------------------------------------------- the room

func _room() -> void:
	Builder.box(self, Vector3(24.4, 0.2, 23.2), Vector3(0, -0.1, -0.75), WOOD, true, "Floor")
	for i in 11:
		Builder.box(self, Vector3(24.4, 0.02, 0.06), Vector3(0, 0.01, -11.0 + i * 2.1), DARK_WOOD, false)
	# Rugs down the Great Hall's axis.
	Builder.box(self, Vector3(2.6, 0.02, 9.0), Vector3(0, 0.015, 3.6), Color(0.45, 0.12, 0.1), false)
	Builder.box(self, Vector3(2.2, 0.025, 8.6), Vector3(0, 0.02, 3.6), Color(0.55, 0.38, 0.16), false)
	Builder.box(self, Vector3(24.8, 5.0, 0.4), Vector3(0, 2.5, -12.2), STONE, true, "WallNorth")
	Builder.box(self, Vector3(0.4, 5.0, 23.2), Vector3(-12.2, 2.5, -0.75), STONE, true, "WallWest")
	# East wall, open to the Faire Grounds between z 4.3 and 6.7.
	Builder.box(self, Vector3(0.4, 5.0, 16.5), Vector3(12.2, 2.5, -3.95), STONE, true, "WallEastN")
	Builder.box(self, Vector3(0.4, 5.0, 4.0), Vector3(12.2, 2.5, 8.7), STONE, true, "WallEastS")
	Builder.box(self, Vector3(0.4, 1.8, 2.4), Vector3(12.2, 4.1, 5.5), STONE, true, "FaireLintel")
	# South wall: the front door (x -1.2..1.2) and, beside it, room for a small door (x -3.3..-2.3).
	Builder.box(self, Vector3(8.9, 5.0, 0.4), Vector3(-7.75, 2.5, 10.7), STONE, true, "WallSouthW")
	Builder.box(self, Vector3(1.1, 5.0, 0.4), Vector3(-1.75, 2.5, 10.7), STONE, true, "WallSouthMid")
	Builder.box(self, Vector3(11.0, 5.0, 0.4), Vector3(6.7, 2.5, 10.7), STONE, true, "WallSouthE")
	Builder.box(self, Vector3(2.4, 2.0, 0.4), Vector3(0, 4.0, 10.7), STONE, true, "DoorLintel")
	Builder.box(self, Vector3(1.0, 3.3, 0.4), Vector3(-2.8, 3.35, 10.7), STONE, true, "SmallDoorLintel")
	Builder.box(self, Vector3(2.0, 3.0, 0.1), Vector3(0, 1.5, 10.95), Color(0.9, 0.75, 0.45), false, "DoorGlow")
	Builder.camera_blocker(self, Vector3(2.4, 3.0, 0.4), Vector3(0, 1.5, 10.7))
	Builder.camera_blocker(self, Vector3(1.0, 1.7, 0.4), Vector3(-2.8, 0.85, 10.7))
	Builder.label(self, "The Campgrounds", Vector3(0, 3.4, 10.4), 40)
	for x in [-6.0, 0.0, 6.0]:
		Builder.box(self, Vector3(0.35, 0.35, 23.2), Vector3(x, 4.8, -0.75), DARK_WOOD, false)
	for p in [Vector3(-9, 3.2, -11.8), Vector3(9, 3.2, -11.8), Vector3(-11.8, 3.0, 2), Vector3(11.8, 3.0, -1), Vector3(-6, 3.0, 10.3), Vector3(6, 3.0, 10.3)]:
		Builder.sphere(self, 0.08, p, Color(1.0, 0.75, 0.4), 4.0)
		Builder.omni(self, p, Color(1.0, 0.68, 0.38), 1.1, 9.0)
	# Leaded windows beside the nooks.
	for x in [-10.6, 10.6]:
		Builder.box(self, Vector3(1.4, 1.2, 0.08), Vector3(x, 1.9, 10.5), Color(0.25, 0.35, 0.5), false)


func _hearth_and_staircase() -> void:
	# The hearth: the room's heart, on the axis from the front door.
	Builder.box(self, Vector3(4.2, 5.0, 1.6), Vector3(0, 2.5, -6.6), Color(0.28, 0.25, 0.23), true, "Hearth")
	Builder.box(self, Vector3(2.4, 1.4, 0.4), Vector3(0, 0.7, -5.75), Color(0.06, 0.04, 0.03), false)
	Builder.flame(self, Vector3(0, 0.0, -5.5), 0.3)
	Builder.omni(self, Vector3(0, 1.0, -4.8), Color(1.0, 0.55, 0.22), 3.0, 12.0)
	Builder.label(self, "The Hearth", Vector3(0, 3.6, -5.6), 36)
	# The Common Room: the hearth is the Main Floor's gathering space.
	for i in 5:
		var a := PI * (0.15 + 0.175 * i)
		var p := Vector3(cos(a) * 3.6, 0, -5.4 + sin(a) * 2.6)
		if absf(p.x) > 2.6:
			continue
		Builder.cylinder(self, 0.35, 0.4, p + Vector3(0, 0.2, 0), Color(0.5, 0.2, 0.16), true)
	Builder.label(self, "The Common Room", Vector3(0, 2.6, -3.2), 28, Color(0.85, 0.72, 0.5))
	# The staircase rises behind the hearth in two flights to a gallery.
	for side in [-1.0, 1.0]:
		var run := 4.4
		var rise := 2.8
		var x: float = side * 3.3
		var ramp := Builder.box(self, Vector3(1.6, 0.2, sqrt(run * run + rise * rise)), Vector3(x, rise / 2.0 - 0.1, -6.2 - run / 2.0), DARK_WOOD, true, "StairRamp")
		ramp.rotation.x = atan2(rise, run)
		for s in 11:
			var f := float(s) / 11.0
			Builder.box(self, Vector3(1.6, 0.08, 0.36), Vector3(x, f * rise + 0.04, -6.2 - f * run), WOOD.lightened(0.08), false)
		Builder.box(self, Vector3(0.08, 1.0, 4.6), Vector3(x + side * 0.82, rise / 2.0 + 0.6, -8.4), DARK_WOOD, false)
	# The stair core: solid stone between the flights, under the gallery.
	Builder.box(self, Vector3(5.0, 2.6, 4.8), Vector3(0, 1.3, -9.8), STONE.darkened(0.1), true, "StairCore")
	Builder.box(self, Vector3(8.2, 0.2, 1.6), Vector3(0, 2.7, -11.4), DARK_WOOD, true, "Gallery")
	Builder.box(self, Vector3(5.0, 1.0, 0.08), Vector3(0, 3.3, -10.6), DARK_WOOD, false)
	Builder.box(self, Vector3(1.4, 2.2, 0.1), Vector3(0, 3.9, -11.95), Color(0.16, 0.1, 0.06), false, "StairDoor")
	Builder.label(self, "The Staircase", Vector3(0, 5.2, -11.6), 34)
	Interactable.make(self, "stair_top", "staircase", Vector3(0, 2.8, -11.3), "The stairs go on up", 1.4)


func _bar_and_garden() -> void:
	# The bar, built into the wall beside the fire: bottles woven into the stone
	# like the wall grew a shelf for them.
	Builder.box(self, Vector3(4.0, 1.1, 0.8), Vector3(-6.8, 0.55, -9.2), DARK_WOOD, true, "Bar")
	Builder.box(self, Vector3(4.2, 0.08, 1.0), Vector3(-6.8, 1.12, -9.2), WOOD.lightened(0.15), false)
	for i in 21:
		var c: Color = [Color(0.3, 0.55, 0.3), Color(0.55, 0.2, 0.2), Color(0.7, 0.55, 0.2), Color(0.35, 0.3, 0.6)][i % 4]
		Builder.cylinder(self, 0.07, 0.3, Vector3(-8.6 + (i % 7) * 0.6, 1.5 + (i / 7) * 0.75, -11.92), c, false)
		if i % 3 == 0:
			Builder.sphere(self, 0.03, Vector3(-8.6 + (i % 7) * 0.6, 1.72 + (i / 7) * 0.75, -11.9), c.lightened(0.4), 3.0)
	Builder.label(self, "The Catalyst's Bar", Vector3(-6.8, 2.6, -9.4), 36)
	for x in [-8.2, -6.8, -5.4]:
		Builder.cylinder(self, 0.25, 0.75, Vector3(x, 0.38, -8.3), WOOD, true)
	# The impossible garden, behind the bar, on the Inn-Tree's bark. The way in
	# is past the end of the bar; the beds line the far wall.
	Builder.box(self, Vector3(0.3, 3.4, 3.8), Vector3(-9.3, 1.7, -10.3), BARK, true, "GardenWall")
	Builder.box(self, Vector3(0.3, 3.4, 0.9), Vector3(-9.3, 1.7, -6.45), BARK, true, "GardenWallS")
	Builder.box(self, Vector3(2.9, 3.4, 0.3), Vector3(-10.75, 1.7, -6.0), BARK, true, "GardenFront")
	Builder.label(self, "The Garden", Vector3(-9.3, 3.7, -7.6), 30, Color(0.7, 0.95, 0.7))
	for i in 3:
		var bed := Node3D.new()
		bed.name = "Bed%d" % i
		bed.position = Vector3(-11.3, 0, -11.0 + i * 1.8)
		add_child(bed)
		Builder.box(bed, Vector3(1.4, 0.35, 1.5), Vector3(0, 0.17, 0), Color(0.12, 0.08, 0.05), true)
		for k in 7:
			var glow := Color(0.5, 1.0, 0.6) if k % 2 == 0 else Color(0.5, 0.8, 1.0)
			Builder.sphere(bed, 0.05, Vector3(-0.5 + (k % 4) * 0.3, 0.42 + (k % 3) * 0.08, -0.5 + k * 0.16), glow, 4.0)
		Interactable.make(bed, "garden", "bed_%d" % i, Vector3.ZERO, "Look at the garden", 1.7, { "bed": i })
		_beds.append(bed)
	Builder.omni(self, Vector3(-10.6, 1.5, -9.0), Color(0.55, 1.0, 0.65), 0.8, 5.0)


func _arcade() -> void:
	var games: Array = GameData.arcade.get("games", [])
	var by_id := {}
	for g in games:
		by_id[String(g["id"])] = g
	var lineup := ["game_tomb_tunnel", "game_monster_of_the_deep", "game_andean_run", "game_rune_hunt", "game_crystal_catcher", "game_the_forest_defense"]
	for i in lineup.size():
		_cabinet(Vector3(-11.4, 0, -3.4 + i * 1.5), -PI / 2.0, by_id.get(lineup[i], { "title": "?" }))
	# The corner of honor: Standing Stones, the Tetris that opens the Fae portal.
	_cabinet(Vector3(-11.1, 0, 5.4), -PI * 0.75, by_id.get(String(GameData.arcade.get("corner_of_honor", "")), { "title": "Standing Stones" }), true)
	Builder.label(self, "The Arcade", Vector3(-10.0, 3.6, 1.0), 40)
	# The Score Stone: a seven-foot obsidian monolith. Every other traveler a silhouette.
	var stone := Builder.box(self, Vector3(0.9, 2.15, 0.35), Vector3(-8.4, 1.07, -4.4), Color(0.05, 0.05, 0.07), true, "ScoreStone")
	stone.rotation.y = PI / 2.0
	_score_rows = Node3D.new()
	_score_rows.position = Vector3(-8.2, 0, -4.4)
	_score_rows.rotation.y = PI / 2.0
	add_child(_score_rows)
	Interactable.make(self, "score_stone", "score_stone", Vector3(-7.6, 0, -4.4), "Look at the Score Stone", 1.6)


func _cabinet(pos: Vector3, yaw: float, game: Dictionary, honor := false) -> void:
	var cab := Node3D.new()
	cab.position = pos
	cab.rotation.y = yaw
	add_child(cab)
	Builder.box(cab, Vector3(0.8, 1.9, 0.7), Vector3(0, 0.95, 0), Color(0.2, 0.12, 0.07), true)
	var hue := fmod(float(String(game.get("title", "")).hash() % 1000) / 1000.0, 1.0)
	Builder.box(cab, Vector3(0.6, 0.45, 0.05), Vector3(0, 1.4, -0.36), Color.from_hsv(hue, 0.5, 0.9), false)
	Builder.sphere(cab, 0.05, Vector3(0, 1.4, -0.4), Color.from_hsv(hue, 0.6, 1.0), 4.0)
	Builder.box(cab, Vector3(0.82, 0.12, 0.05), Vector3(0, 1.82, -0.36), Color(0.75, 0.6, 0.3), false)
	var l := Builder.label(cab, String(game.get("title", "")), Vector3(0, 2.2, 0), 26 if not honor else 32, Color(1.0, 0.85, 0.5) if honor else Color(0.9, 0.82, 0.6))
	l.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	Interactable.make(cab, "cabinet", String(game.get("id", "cabinet")), Vector3(0, 0, -0.9), "Look at " + String(game.get("title", "the cabinet")), 1.2, { "title": game.get("title", "") })


func _market() -> void:
	# The Inn-Tree's trunk: the market's heart. Stalls wrap around it.
	Builder.cylinder(self, 0.95, 5.0, TRUNK + Vector3(0, 2.5, 0), Color(0.3, 0.22, 0.14), true, "TreeTrunk", 0.8)
	for a in 7:
		var ang := a * TAU / 7.0 + 0.3
		var root_piece := Builder.box(self, Vector3(0.25, 0.25, 1.7), TRUNK + Vector3(cos(ang) * 1.15, 0.12, sin(ang) * 1.15), Color(0.28, 0.2, 0.12), false)
		root_piece.rotation.y = -ang + PI / 2.0
	var stalls := [
		["Artifacts", "Artifacts", Color(0.42, 0.22, 0.42)],
		["Gemstone Jewelry", "Gemstone Jewelry", Color(0.5, 0.26, 0.2)],
		["Gemstone Earrings", "Gemstone Earrings", Color(0.26, 0.36, 0.44)],
		["Celtic Leatherwork", "Celtic Leatherwork", Color(0.28, 0.36, 0.22)],
	]
	for i in stalls.size():
		var ang := PI * 0.25 + i * PI * 0.5
		var p := TRUNK + Vector3(cos(ang) * 2.8, 0, sin(ang) * 2.8)
		var stall := Node3D.new()
		stall.position = p
		add_child(stall)
		stall.look_at(TRUNK + Vector3(cos(ang) * 6.0, 0, sin(ang) * 6.0), Vector3.UP)
		Builder.box(stall, Vector3(1.8, 0.85, 0.7), Vector3(0, 0.42, 0), DARK_WOOD.lightened(0.1), true)
		Builder.box(stall, Vector3(2.0, 0.08, 1.2), Vector3(0, 2.3, 0.2), stalls[i][2], false)
		for k in 4:
			Builder.sphere(stall, 0.07, Vector3(-0.6 + k * 0.4, 0.93, 0), Color.from_hsv(0.1 * k + i * 0.2, 0.5, 0.9), 1.5)
		var sign := Builder.label(stall, String(stalls[i][0]), Vector3(0, 2.7, -0.2), 28)
		sign.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		Interactable.make(stall, "booth", "stall_%d" % i, Vector3(0, 0, -1.0), "Browse " + String(stalls[i][0]), 1.6, { "sign": stalls[i][0], "category": stalls[i][1], "items": [] })
	Builder.label(self, "The Market", TRUNK + Vector3(0, 5.3, 0), 40)
	# The goods live along the walk, too, like a gallery that happens to sell.
	var pieces := [
		[Vector3(-2.6, 0, 7.0), "soulstice_preseli_bluestone_pendant"],
		[Vector3(-5.2, 0, 3.6), "soulstice_triple_moon_with_smoky_quartz_agate_and_garnet_on_a_silk_ribbon"],
		[Vector3(-6.6, 0, 0.4), "soulstice_viking_earrings"],
		[Vector3(3.2, 0, 7.6), "soulstice_labradorite_pendant_sterling_silver"],
	]
	for pc in pieces:
		var item := GameData.market_item(String(pc[1]))
		var stand := Node3D.new()
		stand.position = pc[0]
		add_child(stand)
		Builder.cylinder(stand, 0.25, 1.0, Vector3(0, 0.5, 0), DARK_WOOD, true)
		Builder.sphere(stand, 0.09, Vector3(0, 1.1, 0), Color(0.75, 0.85, 1.0), 2.0)
		var title := String(item.get("canon_name", item.get("title", "A piece")))
		Interactable.make(stand, "booth", "piece_" + String(pc[1]), Vector3.ZERO, "Look at " + title, 1.4, { "sign": title, "items": [String(pc[1])] })


func _library_nook() -> void:
	Builder.box(self, Vector3(0.3, 3.4, 5.0), Vector3(8.0, 1.7, -9.7), DARK_WOOD, true, "LibraryWall")
	for z in [-7.4, -5.6]:
		Builder.box(self, Vector3(0.5, 3.2, 1.7), Vector3(11.7, 1.6, z), DARK_WOOD, true)
		for shelf in 4:
			for b in 5:
				var c := Color.from_hsv(fmod(z * 0.13 + b * 0.17 + shelf * 0.31, 1.0), 0.45, 0.45)
				Builder.box(self, Vector3(0.22, 0.55, 0.26), Vector3(11.35, 0.5 + shelf * 0.75, z - 0.6 + b * 0.3), c, false)
	for x in [8.9, 10.2]:
		Builder.box(self, Vector3(1.2, 3.2, 0.5), Vector3(x, 1.6, -11.7), DARK_WOOD, true)
	# Naut's fireplace corner.
	Builder.box(self, Vector3(0.5, 1.5, 1.4), Vector3(11.7, 0.75, -10.0), Color(0.3, 0.26, 0.24), true, "NautFire")
	Builder.flame(self, Vector3(11.3, 0.0, -10.0), 0.15)
	Builder.omni(self, Vector3(11.0, 0.9, -10.0), Color(1.0, 0.6, 0.3), 1.4, 5.0)
	# The Ragana's reading table.
	Builder.box(self, Vector3(1.4, 0.06, 0.9), Vector3(9.6, 0.78, -5.4), WOOD.lightened(0.1), true)
	Builder.box(self, Vector3(0.1, 0.76, 0.1), Vector3(9.6, 0.38, -5.4), DARK_WOOD, false)
	Builder.box(self, Vector3(0.35, 0.05, 0.25), Vector3(9.4, 0.83, -5.4), Color(0.85, 0.8, 0.68), false)
	Builder.label(self, "The Library Nook", Vector3(10.0, 3.6, -6.5), 34)


func _geode_corner() -> void:
	var c := CORNER
	for x in [4.4, 7.6]:
		Builder.box(self, Vector3(0.3, 3.2, 3.4), Vector3(x, 1.6, -10.5), CRYSTAL.darkened(0.45), true)
	Builder.box(self, Vector3(3.5, 0.8, 0.3), Vector3(6.0, 2.8, -8.8), CRYSTAL.darkened(0.45), false)
	Builder.label(self, "The Dragon's Geode Corner", Vector3(6.0, 3.6, -8.7), 30, Color(0.8, 0.7, 1.0))
	for i in 12:
		var ang := float(i) / 12.0 * PI
		var p := c + Vector3(cos(ang) * 1.5, 0.2 + (i % 3) * 0.7, -0.4 - sin(ang) * 0.6)
		var crystal := Builder.cylinder(self, 0.14, 0.8, p, CRYSTAL.lightened(0.2), false, "", 0.02)
		crystal.rotation = Vector3(0.4 * sin(i), 0, 0.5 * cos(i * 1.7))
	# The geode: a broken-open shell, crystal inside. It fills with gems as the
	# player grows. The geode forming is the progress bar.
	var shell := Builder.sphere(self, 1.15, c + Vector3(0, 0.2, 0), Color(0.3, 0.24, 0.34))
	shell.scale = Vector3(1.0, 0.5, 0.85)
	var inner := Builder.sphere(self, 1.0, c + Vector3(0, 0.38, 0), Color(0.62, 0.5, 0.82), 0.6)
	inner.scale = Vector3(1.0, 0.36, 0.8)
	for i in MAX_GEMS:
		var ang := float(i) * 2.399
		var r := 0.25 + 0.65 * sqrt(float(i) / MAX_GEMS)
		var gem := Builder.sphere(self, 0.05, c + Vector3(cos(ang) * r, 0.55 + 0.05 * sin(i), sin(ang) * r * 0.75), Color.from_hsv(fmod(i * 0.137, 1.0), 0.55, 1.0), 3.0)
		gem.visible = false
		_gems.append(gem)
	# The baby dragon, asleep in it, breathing at the hearth's tempo.
	_dragon = Node3D.new()
	_dragon.name = "BabyDragon"
	_dragon.position = c + Vector3(0, 0.66, 0.1)
	_dragon.scale = Vector3.ONE * 1.5
	add_child(_dragon)
	var green := Color(0.5, 0.66, 0.4)
	var body := Builder.sphere(_dragon, 0.32, Vector3.ZERO, green)
	body.scale = Vector3(1.4, 0.7, 0.9)
	Builder.sphere(_dragon, 0.17, Vector3(0.42, 0.04, 0.18), green.lightened(0.1))
	var tail := Builder.cylinder(_dragon, 0.07, 0.8, Vector3(-0.45, -0.05, -0.2), green.darkened(0.1), false, "", 0.02)
	tail.rotation = Vector3(0, 0.6, PI / 2.0)
	for side in [-1.0, 1.0]:
		var wing := Builder.box(_dragon, Vector3(0.5, 0.03, 0.28), Vector3(0.0, 0.22, side * 0.18), green.darkened(0.25), false)
		wing.rotation.x = side * 0.5
	Builder.label(_dragon, "zzz", Vector3(0.5, 0.5, 0.2), 22, Color(0.85, 0.85, 1.0))
	Builder.omni(self, c + Vector3(0, 1.6, 0.6), Color(0.7, 0.55, 1.0), 1.6, 7.0)
	Builder.cylinder(self, 0.26, 0.7, Vector3(7.05, 0.35, -9.25), Color(0.4, 0.36, 0.42), true, "Pedestal")
	Interactable.make(self, "cave", "pedestal", Vector3(6.0, 0, -9.3), "Ring your stones", 1.5)
	Interactable.make(self, "trigger", "corner_entry", Vector3(6.0, 0, -9.4), "", 1.5, { "event": "visit:geode_corner" })
	# The Unstrung Echo (proposed): a restless light that hums a note it can't hold.
	_echo = Builder.sphere(self, 0.26, c + Vector3(-1.0, 1.4, -0.4), Builder.color("#6fc4ff"), 1.4, "UnstrungEcho")
	_echo.add_to_group("being_unstrung_echo")
	_echo.add_to_group("frequency_node")
	var it := Interactable.make(_echo, "being", "unstrung_echo", Vector3.ZERO, "Listen to the restless light", 2.6)
	it.add_to_group("being_unstrung_echo")


func _faire_grounds() -> void:
	Builder.box(self, Vector3(5.0, 0.2, 2.6), Vector3(14.7, -0.1, 5.5), WOOD.darkened(0.1), true)
	Builder.box(self, Vector3(5.0, 4.0, 0.3), Vector3(14.7, 2.0, 4.15), STONE, true)
	Builder.box(self, Vector3(5.0, 4.0, 0.3), Vector3(14.7, 2.0, 6.85), STONE, true)
	Builder.box(self, Vector3(0.3, 4.0, 2.6), Vector3(17.2, 2.0, 5.5), STONE, true)
	for i in 4:
		var col: Color = [Color(0.6, 0.18, 0.22), Color(0.82, 0.62, 0.22)][i % 2]
		Builder.box(self, Vector3(0.6, 1.2, 0.04), Vector3(13.2 + i * 1.1, 2.6, 4.32), col, false)
	Builder.label(self, "The Faire Grounds", Vector3(12.0, 3.2, 5.5), 34)
	Builder.box(self, Vector3(0.2, 2.2, 0.2), Vector3(16.4, 1.1, 5.5), WOOD, true)
	Builder.box(self, Vector3(0.1, 0.5, 1.6), Vector3(16.3, 1.9, 5.5), Color(0.6, 0.45, 0.25), false)
	Builder.label(self, "Faires in Town", Vector3(16.2, 2.6, 5.5), 30)
	Interactable.make(self, "signpost", "faires", Vector3(15.8, 0, 5.5), "Read the faire signpost", 1.6)
	Builder.omni(self, Vector3(14.7, 3.0, 5.5), Color(1.0, 0.75, 0.45), 1.2, 6.0)


## The small door (the Final Room spec): set into the wall to the left of the
## main entrance, no sign, no label, no glow. It is only there once it has
## been earned, and it looks like it has always been there.
func _small_door_place() -> void:
	_small_door_plug = Builder.box(self, Vector3(1.0, 1.7, 0.4), Vector3(-2.8, 0.85, 10.7), STONE, true, "SmallDoorPlug")
	_small_door = Node3D.new()
	_small_door.name = "SmallDoor"
	_small_door.position = Vector3(-2.8, 0, 10.55)
	add_child(_small_door)
	Builder.box(_small_door, Vector3(0.9, 1.6, 0.06), Vector3(0, 0.8, 0), Color(0.16, 0.12, 0.1), false)
	Builder.sphere(_small_door, 0.03, Vector3(0.3, 0.8, -0.05), Color(0.5, 0.42, 0.3))
	Interactable.make(_small_door, "trigger", "small_door", Vector3(0, 0, -0.35), "", 0.45, { "event": "final_room:enter" })
	_small_door.visible = false


func _set_small_door(open: bool) -> void:
	_small_door.visible = open
	_small_door_plug.visible = not open
	var cs := _small_door_plug.get_child(0) as CollisionShape3D
	if cs != null:
		cs.disabled = open


## Ziggy hides from the very first hour (ruled Sep 10 2026). Finding him is
## the game's first hide-and-seek; once found, the geode rim is home.
func _ziggy_place() -> void:
	_ziggy = Node3D.new()
	_ziggy.name = "Ziggy"
	add_child(_ziggy)
	var col := Builder.color(String(GameData.character("ziggy").get("color", "#c98a3a")))
	var body := Builder.box(_ziggy, Vector3(0.09, 0.06, 0.22), Vector3(0, 0.03, 0), col, false)
	body.rotation.y = 0.0
	Builder.sphere(_ziggy, 0.055, Vector3(0, 0.05, -0.14), col.lightened(0.1))
	Builder.box(_ziggy, Vector3(0.015, 0.03, 0.2), Vector3(0, 0.08, 0.0), col.darkened(0.2), false)
	var tail := Builder.cylinder(_ziggy, 0.02, 0.2, Vector3(0, 0.02, 0.2), col.darkened(0.1), false, "", 0.005)
	tail.rotation.x = PI / 2.0
	for side in [-1.0, 1.0]:
		var eye := Builder.sphere(_ziggy, 0.016, Vector3(side * 0.035, 0.075, -0.17), Color(0.1, 0.08, 0.05))
		_ziggy_eyes.append(eye)
	_ziggy_it = Interactable.make(_ziggy, "ziggy", "ziggy", Vector3.ZERO, "Look closer", 1.0)


func _ziggy_spot() -> void:
	if PlayerState.flag("found_ziggy"):
		_ziggy.position = CORNER + Vector3(1.05, 0.62, 0.35)
		_ziggy.rotation.y = -0.8
		_ziggy_it.prompt = "Say hello to Ziggy"
		_ziggy_it.radius = 2.0
	else:
		# Tucked between the Inn-Tree's roots, on the side facing away from the door.
		_ziggy.position = TRUNK + Vector3(0.55, 0.12, -1.15)
		_ziggy.rotation.y = 2.4


func _humble_objects() -> void:
	# The broom by the door and the doorstop that holds it.
	var broom := Builder.cylinder(self, 0.03, 1.4, Vector3(-1.75, 0.7, 10.2), WOOD.lightened(0.2), false)
	broom.rotation.z = 0.12
	Builder.cylinder(self, 0.14, 0.3, Vector3(-1.84, 0.14, 10.2), Color(0.6, 0.5, 0.25), false, "", 0.05)
	Builder.box(self, Vector3(0.22, 0.12, 0.3), Vector3(1.05, 0.06, 10.3), Color(0.35, 0.3, 0.28), false, "Doorstop")
	for spec in [["stool", Vector3(-5.4, 0, -8.3)], ["broom", Vector3(-1.75, 0, 10.0)], ["doorstop", Vector3(1.05, 0, 10.1)]]:
		var it := Interactable.make(self, "humble", String(spec[0]), spec[1], "Listen", 1.2)
		it.add_to_group("needs_unlock")
		it.set_meta("unlock", "catalysts_recipe")


func _hidden_layers() -> void:
	# Fae glimmers: visible once the player's Song Spectrum reaches 8.
	for p in [Vector3(-11.6, 0.3, 9.9), Vector3(11.6, 0.3, -11.6), Vector3(11.6, 0.3, 9.9), Vector3(-11.6, 0.4, -11.6), TRUNK + Vector3(-0.8, 4.6, 0)]:
		var g := Builder.sphere(self, 0.06, p, Color(0.7, 1.0, 0.75), 6.0)
		g.add_to_group("layer_fae_glimmers")
	# The Ragana's old notes, seen through the Ragana's Lens.
	var notes := [
		[Vector3(-12.0, 2.6, -2.0), PI / 2.0, "Col. 112: the hearth draws 3 degrees warmer when the Song rises."],
		[Vector3(-4.6, 2.4, -11.95), 0.0, "Col. 7: the bar's third stool hums a quarter-tone flat. Adequate."],
		[Vector3(-2.1, 2.9, -5.75), 0.0, "Col. 41: 50 beats a minute. Always 50."],
		[Vector3(11.4, 3.0, -6.0), -PI / 2.0, "Col. 1: the first column. Everyone starts here."],
	]
	for n in notes:
		var l := Builder.label(self, String(n[2]), n[0], 26, Color(0.75, 0.9, 1.0), false)
		l.rotation.y = float(n[1])
		l.add_to_group("needs_unlock")
		l.set_meta("unlock", "ragana_lens")
	# What a nook reveals: the frequencies in the room become visible.
	for i in 14:
		var p := Vector3(randf_range(-11, 11), randf_range(0.5, 4.2), randf_range(-11, 9.5))
		var mote := Builder.sphere(self, 0.04, p, Color(1.0, 0.85, 0.5), 5.0)
		mote.add_to_group("nook_reveal")


# ---------------------------------------------------------------- live behavior

func on_zone_ready() -> void:
	# The small door appears the next time the player comes in by the main entrance.
	var unlocked := bool(FinalRoomRules.record(PlayerState.profile)["unlocked"])
	if SceneRouter.spawn_point in ["door", ""]:
		unlocked = FinalRoomRules.check_on_entry(PlayerState.profile)
	_set_small_door(unlocked or SceneRouter.spawn_point == "small_door")
	_ziggy_spot()
	_update_echo_visibility()
	_refresh_gems()
	_shed_scales()
	_refresh_beds()
	EventBus.quest_started.connect(func(_q: String) -> void: _update_echo_visibility())
	EventBus.stone_learned.connect(func(_s: String) -> void: _refresh_gems())
	EventBus.game_event.connect(_on_event)


func _on_event(id: String, _data: Dictionary) -> void:
	if id == "final_room:enter":
		SceneRouter.goto("final_room", "corridor_top")


func _update_echo_visibility() -> void:
	_echo.visible = being_available("unstrung_echo")


func gem_count() -> int:
	var n := 0
	for g in _gems:
		if g.visible:
			n += 1
	return n


func _refresh_gems() -> void:
	var n := mini(PlayerState.learned_stone_ids().size(), MAX_GEMS)
	for i in _gems.size():
		_gems[i].visible = i < n


## Ziggy's return-count: one shed scale on the corner floor per day away. Shown, never spoken.
func _shed_scales() -> void:
	if not PlayerState.flag("found_ziggy"):
		return
	var days := mini(int(PlayerState.flag("last_absence_days") if PlayerState.flag("last_absence_days") != null else 0), 30)
	for i in days:
		var ang := float(i) * 2.1
		var s := Builder.box(self, Vector3(0.04, 0.004, 0.03), CORNER + Vector3(1.0 + cos(ang) * 0.35, 0.01, 1.0 + sin(ang) * 0.3), Color(0.85, 0.65, 0.35), false, "ShedScale%d" % i)
		s.rotation.y = ang


func _refresh_beds() -> void:
	var bed_i := int(PlayerState.flag("seed_bed") if PlayerState.flag("seed_bed") != null else -1)
	for i in _beds.size():
		var sprout := _beds[i].get_node_or_null("Sprout")
		if i == bed_i and sprout == null:
			sprout = Builder.cylinder(_beds[i], 0.04, 0.35, Vector3(0.2, 0.52, 0.1), Color(0.5, 0.9, 0.4), false, "Sprout", 0.01)
			sprout.name = "Sprout"
		if sprout != null:
			sprout.scale = Vector3.ONE * (2.0 if PlayerState.flag("seed_grown") else 1.0)


func handle_interaction(it: Interactable) -> void:
	match it.kind:
		"ziggy":
			_find_ziggy()
		"garden":
			garden(int(it.data.get("bed", 0)))
		"humble":
			var lines: Array = GameData.dialogue_extra("humble_objects").get(it.id, [])
			if not lines.is_empty():
				hud.toast(String(lines[0]) if lines.size() == 1 else " ".join(PackedStringArray(lines)))
		"cabinet":
			hud.toast("%s. The cabinet hums, warm. The game inside isn't awake in this build yet." % String(it.data.get("title", "")))
		"score_stone":
			hud.toast("Every traveler is a silhouette with a score. Yours is the one that glows. A skyline, not a ranking.")
		"stair_top":
			hud.toast("The stairs keep climbing past the gallery, up into the tree. Another day.")
		_:
			super.handle_interaction(it)


func _find_ziggy() -> void:
	if not PlayerState.flag("found_ziggy"):
		PlayerState.set_flag("found_ziggy", true)
		PlayerState.add_chronicle("Found Ziggy hiding in the Inn-Tree's roots. The geode rim is home now.", "friend")
		Services.unlock_achievement("FOUND_ZIGGY")
		hud.toast("A crested gecko, smiling. It blinks at you, then scampers off toward the geode.")
		_ziggy_spot()
	else:
		_blink(maxi(1, int(PlayerState.flag("last_absence_days") if PlayerState.flag("last_absence_days") != null else 1)))


## The story-for-seed trade: plant the seed, give it time, and it grows into
## a companion shaped by the story that bought it.
func garden(bed: int) -> void:
	var cfg: Dictionary = GameData.world.get("seed_companions", {})
	if QuestManager.is_on_step("the_seed", "plant"):
		PlayerState.set_flag("seed_bed", bed)
		PlayerState.set_flag("seed_planted_unix", int(Time.get_unix_time_from_system()))
		hud.toast("You press the seed into the soil. The garden hums.")
		EventBus.emit_event("seed:planted")
		_refresh_beds()
		return
	if PlayerState.flag("seed_planted_unix") != null and not PlayerState.flag("seed_grown") and bed == int(PlayerState.flag("seed_bed")):
		var waited := int(Time.get_unix_time_from_system()) - int(PlayerState.flag("seed_planted_unix"))
		if waited < int(cfg.get("grow_seconds", 180)):
			hud.toast("Not yet. Patience. Things grow here that can't grow anywhere else.")
			return
		var shape: Dictionary = cfg.get("shapes", {}).get(String(PlayerState.flag("seed_shape")), cfg.get("shapes", {}).get("quiet", {}))
		PlayerState.set_flag("seed_grown", true)
		PlayerState.add_companion(String(shape.get("companion", "Hush")))
		PlayerState.add_chronicle("A story became a seed, and the seed became %s." % String(shape.get("companion", "a friend")), "companion")
		hud.toast(String(shape.get("text", "Something grows.")))
		EventBus.emit_event("seed:grown")
		_refresh_beds()
		return
	hud.toast("Phosphorescent peas and glowroot, in a bed that shouldn't hold soil. It does anyway.")


func _blink(times: int) -> void:
	var tw := create_tween()
	for i in mini(times, 12):
		for eye in _ziggy_eyes:
			tw.parallel().tween_property(eye, "scale", Vector3(1, 0.1, 1), 0.08)
		tw.tween_interval(0.12)
		for eye in _ziggy_eyes:
			tw.parallel().tween_property(eye, "scale", Vector3.ONE, 0.08)
		tw.tween_interval(0.4)


func on_beat(_index: int) -> void:
	# The dragon sleeps at the hearth's tempo.
	var tw := create_tween()
	tw.tween_property(_dragon, "scale", Vector3(1.5, 1.59, 1.5), 0.45)
	tw.tween_property(_dragon, "scale", Vector3.ONE * 1.5, 0.6)


func _process(delta: float) -> void:
	super._process(delta)
	if _echo.visible:
		var t := Net.clock()
		_echo.position = CORNER + Vector3(-1.0 + sin(t * 1.7) * 0.3, 1.4 + sin(t * 3.1) * 0.18, -0.4 + cos(t * 1.3) * 0.25)
	if PlayerState.flag("found_ziggy"):
		_blink_timer -= delta
		if _blink_timer <= 0.0:
			_blink_timer = 12.0
			var days := int(PlayerState.flag("last_absence_days") if PlayerState.flag("last_absence_days") != null else 0)
			if days > 0:
				_blink(days)
	_score_timer -= delta
	if _score_timer <= 0.0:
		_score_timer = 2.0
		_refresh_score_stone()


## The Score Stone renders every player as a silhouette (the Thrum's law):
## your own row glows amber, everyone else's is a shadow with a score.
func _refresh_score_stone() -> void:
	for c in _score_rows.get_children():
		c.queue_free()
	var rows := [[SongState.personal_points(), true]]
	for id in Net.remote_players.keys():
		rows.append([float(Net.remote_players[id].get("points", 0.0)), false])
	rows.sort_custom(func(a: Array, b: Array) -> bool: return float(a[0]) > float(b[0]))
	for i in mini(rows.size(), 8):
		var mine := bool(rows[i][1])
		var y := 1.9 - i * 0.22
		var shade := Color(0.95, 0.7, 0.3) if mine else Color(0.12, 0.12, 0.14)
		var sil := Builder.sphere(_score_rows, 0.05, Vector3(-0.25, y, 0), shade, 2.5 if mine else 0.0)
		sil.scale = Vector3(1.0, 1.6, 0.4)
		Builder.label(_score_rows, "%d" % int(rows[i][0]), Vector3(0.12, y, 0), 22, shade if mine else Color(0.45, 0.45, 0.5), false)
