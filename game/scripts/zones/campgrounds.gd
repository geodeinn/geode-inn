extends ZoneBase
## The Campgrounds (walkthrough dissection 14, Sep 10 2026): the front porch,
## the hands, the welcome before the door, and the first open sky. A
## Renaissance Faire: the Market Field's stalls around the Inn's entrance,
## Jay's Huntsman Tavern, Luna's tent-studio, the Blacksmith's open-air forge,
## the woods (the wolf's paths, the Traveler's Clearing, and the Fortune
## Teller's tent farthest from the Inn), the shore (the loch, Zeke's dock, the
## lighthouse the Owl keeps), the Seven Sisters around the main fire, and the
## homestead plots in the outer ring.

const GRASS := Color(0.34, 0.42, 0.22)
const DIRT := Color(0.45, 0.36, 0.24)
const TIMBER := Color(0.38, 0.26, 0.16)
const CANVAS := Color(0.78, 0.7, 0.55)
const LOG := Color(0.3, 0.21, 0.13)
const SISTERS := Vector3(0, 0, 8)
const TREELINE := Vector3(14, 0, 12)
const CLEARING := Vector3(33, 0, 30)
const TAVERN_DOOR := Vector3(-16, 0, -9)

var _plot_nodes: Array[Node3D] = []
var _plot_its: Array[Interactable] = []
var _others: Dictionary = {}            # plot -> { owner, tier, name } from the server
var _home_nook: Interactable
var _wolf_home: Node3D
var _travelers: Array[Node3D] = []
var _water: Node3D
var _beam: Node3D
var _pluck: Node3D
var _pluck_timer: Timer
var _pluck_home := Vector3.ZERO
var _sister_taps: Dictionary = {}       # sister index -> clock time
var _chord_rung := {}
var _commission_piece: Node3D


func build_world() -> void:
	zone_id = "campgrounds"
	outdoor = true
	spawns = {
		"default": [Vector3(0, 0.5, -23.5), PI],
		"porch": [Vector3(0, 0.5, -23.5), PI],
	}
	Builder.environment(self, true)
	var sun := DirectionalLight3D.new()
	sun.rotation = Vector3(deg_to_rad(-50), deg_to_rad(35), 0)
	sun.light_energy = 1.25
	sun.light_color = Color(1.0, 0.93, 0.8)
	sun.shadow_enabled = not Settings.low_detail()
	sun.directional_shadow_max_distance = 45.0
	add_child(sun)
	Builder.skin(GRASS, "grass")
	Builder.skin(DIRT, "forest")
	Builder.skin(TIMBER, "planks")
	Builder.skin(LOG, "bark", false)
	Builder.skin(Color(0.3, 0.22, 0.14), "bark", false)       # the Inn-Tree
	Builder.skin(Color(0.62, 0.55, 0.41), "sand", false)
	Builder.skin(Color(0.72, 0.6, 0.32), "thatch", false)
	Builder.skin(Color(0.55, 0.53, 0.5), "cobble")             # homestead stone
	Builder.skin(Color(0.86, 0.8, 0.68), "plaster", false)
	Builder.skin(Color(0.86, 0.84, 0.8), "plaster", false)     # the lighthouse
	Builder.skin(Color(0.52, 0.5, 0.46), "rock")               # the Seven Sisters
	Builder.skin(Color(0.42, 0.4, 0.37), "cobble", false)     # the tavern fireplace
	Builder.skin(Color(0.35, 0.22, 0.18), "brick", false)      # the forge
	Builder.skin(Color(0.5, 0.2, 0.15), "tiles", false)        # the tavern roof
	Builder.box(self, Vector3(130, 0.2, 130), Vector3(0, -0.1, 0), GRASS, true, "Ground")
	for edge in [[Vector3(130, 6, 1), Vector3(0, 3, -62)], [Vector3(130, 6, 1), Vector3(0, 3, 62)], [Vector3(1, 6, 130), Vector3(-62, 3, 0)], [Vector3(1, 6, 130), Vector3(62, 3, 0)]]:
		_invisible_wall(edge[0], edge[1])
	Builder.box(self, Vector3(4, 0.02, 34), Vector3(0, 0.01, -8), DIRT, false)
	Builder.box(self, Vector3(40, 0.02, 3), Vector3(0, 0.01, -9), DIRT, false)
	var path_w := Builder.box(self, Vector3(3, 0.02, 30), Vector3(-12, 0.01, 6), DIRT, false)
	path_w.rotation.y = 0.6
	var path_e := Builder.box(self, Vector3(3, 0.02, 30), Vector3(14, 0.01, 4), DIRT, false)
	path_e.rotation.y = -0.5
	_inn_front()
	_market_field()
	_tavern()
	_luna_tent()
	_forge()
	_woods()
	_shore()
	_seven_sisters()
	_plots()
	_gather_spots()
	_observations()
	_trees()
	_dress_campgrounds()
	for cid in ["jay", "wisteria", "luna", "blacksmith", "fortune", "zeke", "owl"]:
		add_npc(cid)
	_pluck = add_npc("pluck")
	_pluck_home = _pluck.position
	# Vaulknut works alone in the Tidal Caves per canon; not placed here.


func _invisible_wall(size: Vector3, pos: Vector3) -> void:
	var body := StaticBody3D.new()
	body.position = pos
	var cs := CollisionShape3D.new()
	var shape := BoxShape3D.new()
	shape.size = size
	cs.shape = shape
	body.add_child(cs)
	add_child(body)


# ---------------------------------------------------------------- the front of the Inn

func _inn_front() -> void:
	Builder.box(self, Vector3(30, 9, 3), Vector3(0, 4.5, -28), Color(0.3, 0.22, 0.14), true, "InnTrunk")
	Builder.box(self, Vector3(3, 3.4, 0.2), Vector3(0, 1.7, -26.4), Color(0.9, 0.72, 0.42), false, "InnDoor")
	Builder.box(self, Vector3(8, 0.3, 4), Vector3(0, 0.15, -24.5), TIMBER, true, "Porch")
	Builder.label(self, "The Geode Inn", Vector3(0, 4.2, -26.2), 64)
	Builder.omni(self, Vector3(0, 3.0, -25.5), Color(1.0, 0.7, 0.4), 1.5, 8.0)
	Interactable.make(self, "portal", "inn_door", Vector3(0, 0, -25.9), "Go back inside the Inn", 1.6, { "zone": "main_floor", "spawn": "door" })


## The Market Field: stalls in a loose semicircle around the Inn's front
## entrance. The workshop's storefront; new stalls arrive as zones unlock.
func _market_field() -> void:
	var stalls := [
		["Stone Vendor", Color(0.5, 0.42, 0.36), "Rough stones in a bin, unpolished. Every craft starts here, with something that hasn't been shaped yet."],
		["Tool Vendor", Color(0.32, 0.36, 0.42), "Jeweler's tools, trays, findings. All laid out like they're waiting for hands."],
		["General Store", Color(0.42, 0.34, 0.2), "Torches, rope, rations. The deeper places will ask for these someday."],
		["Bookmark Stall", Color(0.48, 0.24, 0.38), "Bookmarks for a library the seller swears is infinite. The seller is right."],
	]
	var center := Vector3(0, 0, -19)
	for i in stalls.size():
		var ang := deg_to_rad(30.0 + i * 40.0)
		var p := center + Vector3(cos(ang) * 8.0, 0, sin(ang) * 8.0)
		var stall := Node3D.new()
		stall.position = p
		add_child(stall)
		stall.look_at(center, Vector3.UP)
		var counter := Builder.box(stall, Vector3(2.6, 0.9, 1.0), Vector3(0, 0.45, 0), TIMBER, true)
		if Builder.dress(counter, "Stall_Cart_Empty", Vector3(0.55, -0.45, 0), PI) != null:
			_cart_goods(stall, i)
		else:
			Builder.box(stall, Vector3(3.0, 0.1, 2.0), Vector3(0, 2.6, 0.3), stalls[i][1], false)
			for x in [-1.3, 1.3]:
				Builder.box(stall, Vector3(0.1, 2.6, 0.1), Vector3(x, 1.3, 1.1), TIMBER, false)
			for k in 5:
				Builder.sphere(stall, 0.07, Vector3(-1.0 + k * 0.5, 1.0, 0), Color.from_hsv(0.13 * k + i * 0.21, 0.4, 0.85), 0.8)
		var l := Builder.label(stall, String(stalls[i][0]), Vector3(0, 3.0, 0), 36)
		l.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		Interactable.make(stall, "vendor", "vendor_%d" % i, Vector3(0, 0, -1.2), "Look over the " + String(stalls[i][0]), 1.8, { "text": stalls[i][2] })
	Builder.label(self, "The Market Field", center + Vector3(0, 3.4, 6.0), 40)


# ---------------------------------------------------------------- the Huntsman Tavern

## Jay's tavern: log walls, a stone fireplace, a brass bell over the door.
## Communal tables, no private booths. The wolf's blanket by the door.
func _tavern() -> void:
	var wall := TIMBER.darkened(0.1)
	Builder.box(self, Vector3(8.0, 0.15, 6.0), Vector3(-20, 0.07, -9), TIMBER.lightened(0.05), true, "TavernFloor")
	Builder.box(self, Vector3(0.3, 3.4, 6.0), Vector3(-24, 1.7, -9), wall, true)
	Builder.box(self, Vector3(8.0, 3.4, 0.3), Vector3(-20, 1.7, -12), wall, true)
	Builder.box(self, Vector3(8.0, 3.4, 0.3), Vector3(-20, 1.7, -6), wall, true)
	Builder.box(self, Vector3(0.3, 3.4, 2.2), Vector3(-16, 1.7, -10.9), wall, true)
	Builder.box(self, Vector3(0.3, 3.4, 2.2), Vector3(-16, 1.7, -7.1), wall, true)
	Builder.box(self, Vector3(0.3, 1.0, 1.6), Vector3(-16, 2.9, -9), wall, true)
	var roof := Builder.box(self, Vector3(9.0, 0.3, 7.0), Vector3(-20, 3.55, -9), Color(0.5, 0.2, 0.15), false)
	roof.rotation.z = 0.06
	Builder.box(self, Vector3(8.0, 0.05, 6.0), Vector3(-20, 3.38, -9), TIMBER.darkened(0.15), false, "TavernCeiling")
	Builder.box(self, Vector3(2.4, 0.9, 0.12), Vector3(-15.75, 3.8, -9), Color(0.2, 0.13, 0.08), false)
	var sign := Builder.label(self, "The Huntsman", Vector3(-15.65, 3.8, -9), 40, Color(0.95, 0.85, 0.6), false)
	sign.rotation.y = PI / 2.0
	# The brass bell over the door: it rings for everyone who comes in.
	Builder.sphere(self, 0.16, Vector3(-15.6, 2.7, -8.0), Color(0.8, 0.62, 0.25), 0.3, "BrassBell")
	Interactable.make(self, "trigger", "tavern_entry", TAVERN_DOOR + Vector3(-0.8, 0, 0), "", 0.9, { "event": "tavern:entered" })
	# Stone fireplace on the back wall.
	Builder.box(self, Vector3(0.8, 2.2, 2.2), Vector3(-23.5, 1.1, -9), Color(0.42, 0.4, 0.37), true)
	Builder.flame(self, Vector3(-22.95, 0.15, -9), 0.2)
	var fire_light := Builder.omni(self, Vector3(-22.4, 1.2, -9), Color(1.0, 0.6, 0.3), 1.6, 7.0)
	fire_light.add_to_group("circle_dim")
	# The bar, Jay's own brew on tap, and the pickled eggs nobody eats.
	Builder.box(self, Vector3(3.0, 1.0, 0.7), Vector3(-19.0, 0.5, -10.6), TIMBER.lightened(0.1), true, "TavernBar")
	var jar := Builder.cylinder(self, 0.12, 0.3, Vector3(-18.0, 1.15, -10.6), Color(0.85, 0.88, 0.7, 0.6), false)
	add_tap_surface(jar, "clay")
	var keg := Builder.cylinder(self, 0.3, 0.6, Vector3(-20.0, 1.3, -10.6), Color(0.45, 0.3, 0.18), false)
	Builder.dress(keg, "Barrel", Vector3(0, -0.3, 0), 0.0, 0.68)
	add_tap_surface(keg, "wood")
	# One long communal table: no private booths, you sit next to whoever's there.
	var table := Builder.box(self, Vector3(3.6, 0.08, 1.0), Vector3(-19.4, 0.78, -7.6), TIMBER.lightened(0.15), true)
	add_tap_surface(table, "wood")
	if Builder.dress(table, "Table_Large", Vector3(0, -0.78, 0)) == null:
		for x in [-20.9, -17.9]:
			Builder.box(self, Vector3(0.12, 0.74, 0.12), Vector3(x, 0.37, -7.6), TIMBER, false)
	for z in [-8.25, -6.95]:
		Builder.prop(self, "Bench", Vector3(-19.4, 0, z))
	for i in 3:
		var mug := Builder.cylinder(self, 0.06, 0.12, Vector3(-20.4 + i * 0.8, 0.88, -7.5), Color(0.62, 0.46, 0.32), false)
		add_tap_surface(mug, "clay")
		Builder.dress(mug, "Mug", Vector3(0, -0.06, 0), i * 1.7)
	# The map wall: Jay's zone map, kept up to date with traveler reports.
	Builder.box(self, Vector3(2.2, 1.4, 0.05), Vector3(-21.9, 1.9, -11.8), Color(0.82, 0.74, 0.55), false, "MapWall")
	Builder.label(self, "Water Zone: rough seas this week.\nFae Kingdom: Seelie court in session.", Vector3(-21.9, 1.95, -11.75), 18, Color(0.25, 0.18, 0.1), false)
	add_nook("tavern", Vector3(-22.4, 0.15, -7.0), PI / 2.0, "Sit by the tavern fire")
	# The wolf's blanket by the door. The wolf is always there when Jay is.
	Builder.box(self, Vector3(1.2, 0.04, 0.9), Vector3(-17.0, 0.17, -6.9), Color(0.5, 0.25, 0.2), false)
	_wolf_home = Node3D.new()
	_wolf_home.name = "JaysWolf"
	add_child(_wolf_home)
	Creatures.wolf(_wolf_home)
	Builder.label(_wolf_home, "The Wolf", Vector3(0, 1.35, 0), 30)
	# The travelers who wait at the clearing come to the tavern once Jay has said hi.
	for i in 2:
		var t := Node3D.new()
		add_child(t)
		if CharacterModel.available():
			CharacterModel.make(t, CharacterModel.PLAYER_LOOKS[5 + i])
			_npc_body(t, 0.3, 1.75)
		else:
			Builder.cylinder(t, 0.3, 1.1, Vector3(0, 0.55, 0), Color(0.42 + i * 0.1, 0.38, 0.33), true, "", 0.24)
			Builder.sphere(t, 0.2, Vector3(0, 1.32, 0), Color(0.8, 0.7, 0.6))
		_travelers.append(t)


# ---------------------------------------------------------------- Luna's tent-studio

## Canvas with the sides rolled up. The bench, the Stone Library (sorted by
## hardness), the Display Board of finished Wearable Songs, the Commission Book.
## Watching Luna work is a meditative idle: the bench in front is a nook.
func _luna_tent() -> void:
	var c := Vector3(14, 0, -12)
	for corner in [Vector3(-3, 0, -2.5), Vector3(3, 0, -2.5), Vector3(-3, 0, 2.5), Vector3(3, 0, 2.5)]:
		Builder.box(self, Vector3(0.12, 3.0, 0.12), c + corner + Vector3(0, 1.5, 0), TIMBER, false)
	var canvas_roof := Builder.box(self, Vector3(6.6, 0.08, 5.6), c + Vector3(0, 3.1, 0), CANVAS, false, "TentCanvas")
	canvas_roof.rotation.x = 0.05
	for side in [-1.0, 1.0]:
		var rolled := Builder.cylinder(self, 0.18, 6.4, c + Vector3(0, 2.9, side * 2.75), CANVAS.darkened(0.15), false)
		rolled.rotation.z = PI / 2.0
	var bench := Builder.box(self, Vector3(2.0, 0.9, 0.8), c + Vector3(0, 0.45, 0), TIMBER.lightened(0.1), true, "LunaBench")
	add_tap_surface(bench, "wood")
	if Builder.dress(bench, "Workbench", Vector3(0, -0.45, 0), PI) != null:
		Builder.prop(bench, "CandleStick", Vector3(-0.7, 0.43, 0.1), 0.5)
		Builder.prop(bench, "Coin_Pile_2", Vector3(-0.2, 0.43, 0.05), 0.9)
		Builder.prop(bench, "Potion_1", Vector3(0.25, 0.43, -0.15))
		for k in 3:
			Builder.gem(bench, 0.04, Vector3(0.1 + k * 0.14, 0.47, 0.12), Color.from_hsv(0.55 + k * 0.12, 0.45, 0.95), 0.4)
	Builder.cylinder(self, 0.15, 0.15, c + Vector3(0.6, 0.98, 0), Color(0.55, 0.5, 0.45), false)
	# The Stone Library, by Mohs hardness.
	Builder.box(self, Vector3(0.5, 2.0, 2.6), c + Vector3(2.7, 1.0, -0.6), TIMBER, true, "StoneLibrary")
	for h in 9:
		Builder.sphere(self, 0.07, c + Vector3(2.4, 0.3 + (h % 5) * 0.35, -1.7 + (h / 5) * 1.1 + (h % 5) * 0.12), Color.from_hsv(h * 0.1, 0.4, 0.8), 0.6)
	Builder.label(self, "Stone Library, by hardness 1-9", c + Vector3(2.7, 2.4, -0.6), 22)
	# The Display Board of Wearable Songs.
	Builder.box(self, Vector3(1.8, 1.4, 0.1), c + Vector3(-2.4, 1.4, -1.6), Color(0.3, 0.22, 0.28), false, "DisplayBoard")
	for k in 5:
		Builder.sphere(self, 0.06, c + Vector3(-3.0 + k * 0.3, 1.5 + (k % 2) * 0.2, -1.52), Color.from_hsv(0.6 + k * 0.08, 0.5, 0.9), 2.0)
	_commission_piece = Builder.gem(self, 0.09, c + Vector3(-2.4, 1.0, -1.5), Color(0.55, 0.85, 0.6), 1.2)
	_commission_piece.name = "CommissionPiece"
	Builder.label(self, "Wearable Songs", c + Vector3(-2.4, 2.4, -1.6), 22)
	var stand := Builder.box(self, Vector3(0.5, 1.0, 0.4), c + Vector3(-2.2, 0.5, 1.4), TIMBER, true, "CommissionStand")
	if Builder.dress(stand, "BookStand", Vector3(0, -0.5, 0), PI) == null:
		Builder.box(self, Vector3(0.4, 0.06, 0.3), c + Vector3(-2.2, 1.03, 1.4), Color(0.6, 0.2, 0.2), false)
	Interactable.make(self, "observe_book", "commission_book", c + Vector3(-2.2, 0, 2.0), "Read the Commission Book", 1.3)
	Builder.label(self, "Luna's Tent", c + Vector3(0, 3.8, 0), 40)
	add_nook("luna_watch", c + Vector3(0, 0, 2.2), 0.0, "Sit and watch Luna work")


# ---------------------------------------------------------------- the forge

## The working fire: hot and purposeful. The anvil rings the metal chord, and
## the hammer falls on the beat; the Blacksmith has never counted.
func _forge() -> void:
	var c := Vector3(22, 0, 0)
	Builder.box(self, Vector3(3, 2.2, 2.4), c + Vector3(1.2, 1.1, 1.4), Color(0.35, 0.22, 0.18), true, "Forge")
	Builder.flame(self, c + Vector3(1.2, 0.8, 0.05), 0.24)
	var fl := Builder.omni(self, c + Vector3(1.2, 1.6, -0.6), Color(1.0, 0.5, 0.2), 1.2, 6.0)
	fl.add_to_group("circle_dim")
	var anvil := Builder.box(self, Vector3(0.9, 0.5, 0.4), c + Vector3(-0.8, 0.75, 0.6), Color(0.25, 0.25, 0.28), true, "Anvil")
	add_tap_surface(anvil, "metal")
	if Builder.dress(anvil, "Anvil_Log", Vector3(0, -0.75, 0)) == null:
		Builder.box(self, Vector3(0.4, 0.5, 0.3), c + Vector3(-0.8, 0.25, 0.6), TIMBER, false)
	Builder.prop(self, "WeaponStand", c + Vector3(-2.4, 0, 2.2), 0.3)
	Builder.prop(self, "Whetstone", c + Vector3(0.0, 0, 3.4), PI)
	Builder.prop(self, "Barrel", c + Vector3(3.0, 0, 2.9), 0.2)
	Builder.prop(self, "Bucket_Metal", c + Vector3(-1.7, 0, 1.1))
	Builder.prop(self, "Chain_Coil", c + Vector3(2.7, 0, 0.2), 1.0)
	Builder.prop(self, "Crate_Metal", c + Vector3(3.1, 0, 4.0), 0.4)
	Interactable.make(self, "anvil", "anvil", c + Vector3(-0.8, 0, -0.4), "Strike the anvil", 1.4)
	Interactable.make(self, "workbench", "forge_fire", c + Vector3(1.2, 0, -0.9), "Fire something in the forge", 1.4, { "station": "forge" })
	# The Metal Library: every metal in the jewelry system, with its frequency.
	Builder.box(self, Vector3(0.3, 1.8, 2.0), c + Vector3(3.2, 0.9, -1.6), TIMBER, true)
	var chord: Dictionary = GameData.audio.get("metal_chord_hz", {})
	var lines := PackedStringArray()
	for m in chord.keys():
		lines.append("%s  %s Hz" % [String(m).capitalize(), str(chord[m])])
	Builder.label(self, "The Metal Library\n" + "\n".join(lines), c + Vector3(3.0, 2.4, -1.6), 22)
	Builder.label(self, "The Forge", c + Vector3(0.6, 3.2, 1.0), 40)


# ---------------------------------------------------------------- the woods

## The treeline is the boundary between the known and the not-yet-known. Not
## dangerous: unknown, which is different. The wolf's paths run through it.
func _woods() -> void:
	Interactable.make(self, "trigger", "treeline", TREELINE, "", 3.0, { "event": "visit:treeline" })
	var tracks := [Vector3(19, 0, 16), Vector3(24, 0, 21), Vector3(28.5, 0, 25.5)]
	for i in tracks.size():
		var it := Interactable.make(self, "track", "track_%d" % i, tracks[i], "Look at the tracks", 1.6, { "find": "dendritic_agate" if i == 1 else "" })
		for k in 4:
			Builder.box(it, Vector3(0.12, 0.01, 0.18), Vector3(-0.3 + k * 0.2, 0.012, (k % 2) * 0.2 - 0.1), Color(0.25, 0.2, 0.14), false)
	# The Traveler's Clearing: where the afraid and the waiting sit before entering.
	Builder.flame(self, CLEARING, 0.3)
	var cl := Builder.omni(self, CLEARING + Vector3(0, 1.2, 0), Color(1.0, 0.6, 0.3), 1.5, 7.0)
	cl.add_to_group("circle_dim")
	for i in 4:
		var ang := i * TAU / 4.0 + 0.4
		var log := Builder.cylinder(self, 0.22, 1.6, CLEARING + Vector3(cos(ang) * 2.2, 0.22, sin(ang) * 2.2), LOG, true)
		log.rotation = Vector3(0, -ang, PI / 2.0)
		add_tap_surface(log, "wood")
	Builder.label(self, "The Traveler's Clearing", CLEARING + Vector3(0, 2.4, 0), 34)
	Interactable.make(self, "trigger", "clearing", CLEARING, "", 3.0, { "event": "visit:travelers_clearing" })
	# The Fortune Teller's tent: deep purple and gold, farthest from the Inn.
	var tent := Vector3(41.6, 0, 40.2)
	Builder.cylinder(self, 2.2, 3.2, tent + Vector3(0, 1.6, 0), Color(0.33, 0.12, 0.38), true, "FortuneTent", 0.05)
	Builder.cylinder(self, 2.25, 0.2, tent + Vector3(0, 0.6, 0), Color(0.78, 0.62, 0.25), false)
	Builder.label(self, "The Fortune Teller", tent + Vector3(0, 3.9, 0), 36)


# ---------------------------------------------------------------- the shore

## The loch, the dock, the lighthouse light: the first sky meets the first
## tide. Zeke's tide chart is the player's first clock.
func _shore() -> void:
	Builder.box(self, Vector3(60, 0.04, 8), Vector3(-40, 0.02, 16), Color(0.62, 0.55, 0.41), false, "Sand")
	_water = Builder.box(self, Vector3(60, 0.06, 50), Vector3(-40, 0.04, 45), Color(0.16, 0.32, 0.42, 0.85), false, "Loch")
	var water := StandardMaterial3D.new()
	water.albedo_color = Color(0.08, 0.2, 0.25, 0.9)
	water.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	water.roughness = 0.08
	water.metallic_specular = 0.6
	(_water as MeshInstance3D).material_override = water
	# The water's edge holds the shore; the dock is the way out over it.
	_invisible_wall(Vector3(44.6, 3, 0.4), Vector3(-37.7, 1.5, 20.2))
	_invisible_wall(Vector3(2.6, 3, 0.4), Vector3(-11.3, 1.5, 20.2))
	_invisible_wall(Vector3(0.4, 3, 50), Vector3(-9.8, 1.5, 45))
	var dock := Builder.box(self, Vector3(2.5, 0.3, 13), Vector3(-14, 0.15, 26.3), TIMBER.lightened(0.05), true, "Dock")
	add_tap_surface(dock, "wood")
	for z in [21.0, 25.0, 29.0, 32.5]:
		for x in [-15.2, -12.8]:
			Builder.cylinder(self, 0.12, 1.6, Vector3(x, 0.1, z), TIMBER.darkened(0.2), false)
	_invisible_wall(Vector3(0.3, 3, 13), Vector3(-15.4, 1.5, 26.3))
	_invisible_wall(Vector3(0.3, 3, 13), Vector3(-12.6, 1.5, 26.3))
	_invisible_wall(Vector3(2.8, 3, 0.3), Vector3(-14, 1.5, 32.9))
	Builder.box(self, Vector3(0.12, 1.6, 0.12), Vector3(-12.4, 0.8, 18.8), TIMBER, true)
	Builder.box(self, Vector3(1.0, 0.7, 0.06), Vector3(-12.4, 1.6, 18.8), Color(0.82, 0.74, 0.55), false, "TideChart")
	Interactable.make(self, "tide_chart", "tide_chart", Vector3(-12.4, 0, 18.0), "Read Zeke's tide chart", 1.4)
	Builder.label(self, "The Dock", Vector3(-14, 2.6, 20.5), 34)
	# The lighthouse: the Owl keeps the light; the beam sweeps once a heartbeat.
	var lh := Vector3(-30, 0, 15)
	Builder.cylinder(self, 1.6, 9.0, lh + Vector3(0, 4.5, 0), Color(0.86, 0.84, 0.8), true, "Lighthouse", 1.1)
	for band in 3:
		Builder.cylinder(self, 1.62 - band * 0.16, 0.6, lh + Vector3(0, 1.5 + band * 2.6, 0), Color(0.62, 0.18, 0.16), false, "", 1.5 - band * 0.16)
	Builder.cylinder(self, 0.9, 1.2, lh + Vector3(0, 9.6, 0), Color(0.95, 0.9, 0.6), false, "Lamp")
	_beam = Node3D.new()
	_beam.position = lh + Vector3(0, 9.6, 0)
	add_child(_beam)
	Builder.box(_beam, Vector3(0.3, 0.3, 16), Vector3(0, 0, -8.6), Color(1.0, 0.95, 0.7, 0.25), false)
	Builder.omni(_beam, Vector3(0, 0, -3), Color(1.0, 0.95, 0.7), 1.6, 12.0)
	Builder.box(self, Vector3(0.14, 2.0, 0.14), Vector3(-30, 1.0, 12.6), TIMBER, true)
	Builder.label(self, "The Lighthouse", lh + Vector3(0, 11, 0), 40)


# ---------------------------------------------------------------- the Seven Sisters

## The standing fire pit: a mini Stonehenge, duplicating Sherwood's Seven
## Sisters circle down to the logs as benches. Six stones hold the fire; the
## seventh stands alone on the alignment axis. Each sister is a lithophone.
func _seven_sisters() -> void:
	var c := SISTERS
	Builder.box(self, Vector3(16, 0.02, 16), c + Vector3(0, 0.012, 1.5), DIRT.darkened(0.08), false, "PackedEarth")
	Builder.flame(self, c, 0.4)
	var fire_light := Builder.omni(self, c + Vector3(0, 1.3, 0), Color(1.0, 0.6, 0.3), 2.0, 9.0)
	fire_light.add_to_group("circle_dim")
	for i in 8:
		var ang := i * TAU / 8.0
		var ring_stone := Builder.sphere(self, 0.16, c + Vector3(cos(ang) * 0.85, 0.1, sin(ang) * 0.85), Color(0.42, 0.4, 0.38))
		add_tap_surface(ring_stone, "stone")
	var tones: Array = GameData.world.get("drum_circle", {}).get("seven_sisters", {}).get("tones_hz", [])
	for i in 6:
		var ang := (i + 0.5) * TAU / 6.0
		var stone := Builder.box(self, Vector3(0.9, 2.5 + (i % 2) * 0.4, 0.55), c + Vector3(cos(ang) * 4.5, 1.3, sin(ang) * 4.5), Color(0.52, 0.5, 0.46), true, "Sister%d" % i)
		stone.rotation.y = -ang
		add_tap_surface(stone, "stone", float(tones[i]) if i < tones.size() else 330.0, i)
		_standing_stone(stone, 2.5 + (i % 2) * 0.4, i)
	var outlier := Builder.box(self, Vector3(1.0, 2.9, 0.7), c + Vector3(0, 1.45, 9.5), Color(0.5, 0.48, 0.43), true, "Sister6")
	outlier.rotation.z = -0.06
	add_tap_surface(outlier, "stone", float(tones[6]) if tones.size() > 6 else 494.0, 6)
	_standing_stone(outlier, 2.9, 6)
	for i in 6:
		var ang := i * TAU / 6.0
		var log := Builder.cylinder(self, 0.24, 1.8, c + Vector3(cos(ang) * 6.3, 0.24, sin(ang) * 6.3), LOG, true)
		log.rotation = Vector3(0, -ang + PI / 2.0, PI / 2.0)
		add_tap_surface(log, "wood")
	# A few things to play, left by the fire: the bongo, a washtub, spoons, mugs, the brownies' coconut shells.
	var bongo := Builder.cylinder(self, 0.18, 0.35, c + Vector3(2.4, 0.18, 3.2), Color(0.62, 0.46, 0.3), false, "Bongo")
	add_tap_surface(bongo, "hide")
	var tub := Builder.cylinder(self, 0.4, 0.4, c + Vector3(-2.6, 0.2, 3.4), Color(0.6, 0.62, 0.64), false, "Washtub", 0.45)
	Builder.dress(tub, "Bucket_Metal", Vector3(0, -0.2, 0), 0.0, 1.7)
	add_tap_surface(tub, "metal")
	var stump := Builder.cylinder(self, 0.3, 0.5, c + Vector3(-3.6, 0.25, -1.6), LOG, true, "Stump")
	add_tap_surface(stump, "wood")
	var spoons := Builder.box(self, Vector3(0.2, 0.02, 0.05), c + Vector3(-3.6, 0.52, -1.6), Color(0.75, 0.75, 0.78), false)
	add_tap_surface(spoons, "metal")
	for k in 2:
		var shell := Builder.sphere(self, 0.1, c + Vector3(3.5 + k * 0.25, 0.08, -1.2), Color(0.42, 0.3, 0.2))
		shell.scale.y = 0.6
		add_tap_surface(shell, "wood")
	for i in 4:
		var ang := i * TAU / 4.0 + 0.8
		var post := c + Vector3(cos(ang) * 8.2, 0, sin(ang) * 8.2)
		Builder.box(self, Vector3(0.12, 2.2, 0.12), post + Vector3(0, 1.1, 0), TIMBER, false)
		var lantern := Builder.lantern(self, post + Vector3(0, 2.15, 0), atan2(c.x - post.x, c.z - post.z), Color(1.0, 0.75, 0.45), 0.9, 6.0)
		lantern.add_to_group("circle_dim")
	Builder.label(self, "The Seven Sisters", c + Vector3(0, 3.8, 0), 40)


## Dresses a Sister in one of the kit's rocks, stood on end and weathered.
func _standing_stone(stone: Node3D, height: float, i: int) -> void:
	var rock := Builder.dress(stone, "Rock_Medium_%d" % (1 + i % 3), Vector3(0, -height * 0.5, 0), i * 0.7)
	if rock != null:
		rock.scale = Vector3(0.3, height / 2.2, 0.2)
		Creatures._tint_all(rock, Color(0.82, 0.82, 0.8))


# ---------------------------------------------------------------- homestead plots

func plot_position(i: int) -> Vector3:
	var p: Array = GameData.crafting.get("plots", {}).get("ring_1", [])[i]
	return Vector3(float(p[0]), 0, float(p[1]))


func _plots() -> void:
	var ring: Array = GameData.crafting.get("plots", {}).get("ring_1", [])
	for i in ring.size():
		var p := plot_position(i)
		var holder := Node3D.new()
		holder.name = "Plot%d" % i
		holder.position = p
		add_child(holder)
		holder.look_at(Vector3(0, 0, 0), Vector3.UP)
		_plot_nodes.append(holder)
		var it := Interactable.make(self, "plot", "plot_%d" % i, p, "Look at this plot", 3.2, { "plot": i })
		_plot_its.append(it)
	# Workbenches at the faire's edge, one on each side.
	for spec in [[Vector3(-31.0, 0, -3.0), "WestBench"], [Vector3(31.5, 0, -12.0), "EastBench"]]:
		var bench := Builder.box(self, Vector3(2.2, 0.9, 1.0), spec[0] + Vector3(0, 0.45, 0), TIMBER.lightened(0.15), true, String(spec[1]))
		add_tap_surface(bench, "wood")
		if Builder.dress(bench, "Workbench", Vector3(0, -0.45, 0), PI) != null:
			Builder.prop(bench, "Workbench_Drawers", Vector3(0, -0.45, 0), PI)
			Builder.prop(bench, "Axe_Bronze", Vector3(0.6, 0.47, 0.1), 1.4)
			Builder.prop(bench, "Rope_1", Vector3(-0.5, 0.45, 0.0), 0.3, 0.7)
		if Builder.dress(bench, "Workbench", Vector3(0, -0.45, 0), PI) != null:
			Builder.prop(bench, "Workbench_Drawers", Vector3(0, -0.45, 0), PI)
			Builder.prop(bench, "Axe_Bronze", Vector3(0.6, 0.47, 0.1), 1.4)
			Builder.prop(bench, "Rope_1", Vector3(-0.5, 0.45, 0.0), 0.3, 0.7)
		Builder.label(self, "Workbench", spec[0] + Vector3(0, 1.6, 0), 32)
		Interactable.make(self, "workbench", String(spec[1]).to_lower(), spec[0] + Vector3(0, 0, 0.9), "Use the workbench", 1.6, { "station": "workbench" })


func _draw_plots() -> void:
	var mine := int(PlayerState.homestead()["plot"])
	for i in _plot_nodes.size():
		var holder := _plot_nodes[i]
		for c in holder.get_children():
			c.queue_free()
		var it := _plot_its[i]
		it.data["owner"] = ""
		var tier := 0
		var title := ""
		var owner := ""
		if i == mine:
			tier = PlayerState.homestead_tier()
			title = String(PlayerState.homestead()["name"])
			it.prompt = "Your homestead"
		elif _others.has(i):
			tier = int(_others[i].get("tier", 0))
			title = String(_others[i].get("name", ""))
			owner = String(_others[i].get("owner", "a traveler"))
			it.data["owner"] = owner
			it.prompt = "%s's homestead" % owner
		else:
			it.prompt = "An open plot"
		_draw_tier(holder, tier, i == mine or _others.has(i))
		var label := title if not title.is_empty() else (owner if not owner.is_empty() else ("Your plot" if i == mine else ""))
		if not label.is_empty():
			Builder.label(holder, label, Vector3(0, 4.6 if tier >= 2 else 2.6, 0), 32)
	if _home_nook != null:
		_home_nook.get_parent().queue_free()
		_home_nook = null
	if mine >= 0 and PlayerState.homestead_tier() >= 1:
		# Inside, a little toward the door, facing out at the field.
		var at := plot_position(mine)
		var toward_field := (Vector3.ZERO - at).normalized()
		_home_nook = add_nook("home", at + toward_field * 0.9 + Vector3(0, 0.05, 0), atan2(-toward_field.x, -toward_field.z), "Sit inside")


func _draw_tier(h: Node3D, tier: int, claimed: bool) -> void:
	for corner in [Vector3(-3, 0, -3), Vector3(3, 0, -3), Vector3(-3, 0, 3), Vector3(3, 0, 3)]:
		Builder.box(h, Vector3(0.08, 1.0, 0.08), corner + Vector3(0, 0.5, 0), TIMBER, false)
		Builder.box(h, Vector3(0.35, 0.22, 0.02), corner + Vector3(0.18, 0.9, 0), Color(0.75, 0.25, 0.2) if claimed else Color(0.85, 0.82, 0.7), false)
	var thatch := Color(0.72, 0.6, 0.32)
	var stone := Color(0.55, 0.53, 0.5)
	var plaster := Color(0.86, 0.8, 0.68)
	match tier:
		1:
			# Lean-to: a wood frame, a thatched roof leaning against a rise.
			for x in [-1.2, 1.2]:
				Builder.box(h, Vector3(0.12, 2.0, 0.12), Vector3(x, 1.0, -1.0), TIMBER, false)
			var roof := Builder.box(h, Vector3(3.0, 0.15, 2.6), Vector3(0, 1.4, 0.0), thatch, false)
			roof.rotation.x = 0.5
		2:
			# Cottage: stone foundation, wattle-and-daub walls, thatched roof.
			Builder.box(h, Vector3(4.2, 0.4, 3.4), Vector3(0, 0.2, 0), stone, false)
			Builder.box(h, Vector3(4.0, 2.2, 3.2), Vector3(0, 1.5, 0), plaster, false)
			var r2 := Builder.box(h, Vector3(4.6, 0.25, 2.2), Vector3(0, 2.9, -0.7), thatch, false)
			r2.rotation.x = -0.5
			var r3 := Builder.box(h, Vector3(4.6, 0.25, 2.2), Vector3(0, 2.9, 0.7), thatch, false)
			r3.rotation.x = 0.5
			Builder.box(h, Vector3(0.9, 1.7, 0.06), Vector3(0, 1.25, -1.63), TIMBER.darkened(0.2), false)
		3:
			# Workshop Home: home and crafting station, a chimney, a bench out front.
			Builder.box(h, Vector3(5.0, 0.4, 4.0), Vector3(0, 0.2, 0), stone, false)
			Builder.box(h, Vector3(4.8, 2.6, 3.8), Vector3(0, 1.7, 0), plaster, false)
			Builder.box(h, Vector3(5.2, 0.3, 4.2), Vector3(0, 3.15, 0), thatch, false)
			Builder.box(h, Vector3(0.7, 1.6, 0.7), Vector3(1.6, 3.8, 0.8), stone, false)
			Builder.box(h, Vector3(1.6, 0.8, 0.6), Vector3(-1.4, 0.4, -2.4), TIMBER.lightened(0.1), false)
			Builder.box(h, Vector3(0.6, 0.5, 0.05), Vector3(1.2, 1.9, -1.93), Color(0.6, 0.75, 0.85, 0.7), false)
		4:
			# Estate: a grand home, two storeys, glass windows.
			Builder.box(h, Vector3(5.6, 0.5, 4.6), Vector3(0, 0.25, 0), stone, false)
			Builder.box(h, Vector3(5.4, 4.6, 4.4), Vector3(0, 2.8, 0), stone.lightened(0.15), false)
			Builder.box(h, Vector3(5.8, 0.35, 4.8), Vector3(0, 5.2, 0), Color(0.42, 0.3, 0.26), false)
			for x in [-1.6, 0.0, 1.6]:
				for y in [1.6, 3.6]:
					Builder.box(h, Vector3(0.7, 0.8, 0.05), Vector3(x, y, -2.23), Color(0.65, 0.8, 0.9, 0.75), false)
		5:
			# Ancestral Hall: the material no longer limits the form.
			Builder.box(h, Vector3(5.8, 0.5, 5.0), Vector3(0, 0.25, 0), stone, false)
			Builder.box(h, Vector3(5.4, 5.4, 4.6), Vector3(0, 3.2, 0), Color(0.72, 0.78, 0.92, 0.75), false)
			Builder.cylinder(h, 0.4, 7.0, Vector3(0, 3.5, 0), Color(0.85, 0.9, 1.0), false, "", 0.1)
		_:
			pass


func on_built(_tier: int) -> void:
	_draw_plots()
	var t := GameData.tier(_tier)
	var verdict: Array = t.get("verdict", [])
	if not verdict.is_empty():
		# The Ragana comes to measure. Adequate is the ceiling, and the ceiling is the point.
		hud.dialogue.say("ragana", verdict)


func on_homesteads_changed() -> void:
	_draw_plots()


# ---------------------------------------------------------------- gathering

func _gather_spots() -> void:
	var spots := [
		["tree", Vector3(16, 0, 8)], ["tree", Vector3(-26, 0, -21)], ["tree", Vector3(27, 0, -19)], ["tree", Vector3(-34, 0, 8.5)],
		["outcrop", Vector3(-30, 0, -12)], ["outcrop", Vector3(28, 0, -6)], ["outcrop", Vector3(7, 0, 21)],
		["clay_bank", Vector3(-20, 0, 15.5)], ["clay_bank", Vector3(-36, 0, 15.5)],
		["shore", Vector3(-24, 0, 17.4)], ["shore", Vector3(-43, 0, 17.4)],
		["ore_seam", Vector3(27, 0, 4)], ["ore_seam", Vector3(-36, 0, -25)],
		["hemp", Vector3(-28, 0, -6)], ["hemp", Vector3(30, 0, -15.5)], ["hemp", Vector3(-26, 0, 6)],
		["reeds", Vector3(-10.8, 0, 17.8)], ["reeds", Vector3(-47, 0, 17.6)],
	]
	for s in spots:
		var node_id := String(s[0])
		var it := add_gather(node_id, s[1])
		_gather_look(it, node_id)
		Builder.label(it, String(GameData.gather_nodes[node_id]["name"]), Vector3(0, 2.0 if node_id == "tree" else 1.3, 0), 28)


func _gather_look(it: Node3D, node_id: String) -> void:
	if Builder.has_props() and _gather_prop(it, node_id):
		return
	match node_id:
		"tree":
			Builder.cylinder(it, 0.32, 3.2, Vector3(0, 1.6, 0), Color(0.32, 0.22, 0.13), false)
			Builder.sphere(it, 1.4, Vector3(0, 3.6, 0), Color(0.24, 0.38, 0.18))
		"outcrop":
			var rock := Builder.sphere(it, 0.7, Vector3(0, 0.3, 0), Color(0.5, 0.48, 0.45))
			rock.scale = Vector3(1.3, 0.7, 1.0)
		"clay_bank":
			Builder.box(it, Vector3(1.6, 0.35, 1.0), Vector3(0, 0.17, 0), Color(0.68, 0.45, 0.32), false)
		"shore":
			Builder.box(it, Vector3(1.8, 0.1, 1.2), Vector3(0, 0.05, 0), Color(0.62, 0.55, 0.41).darkened(0.12), false)
		"ore_seam":
			var seam := Builder.sphere(it, 0.6, Vector3(0, 0.3, 0), Color(0.3, 0.28, 0.32))
			seam.scale = Vector3(1.2, 0.8, 1.0)
			Builder.sphere(it, 0.1, Vector3(0.3, 0.5, -0.3), Color(0.8, 0.5, 0.25), 2.0)
		"hemp":
			for k in 6:
				Builder.cylinder(it, 0.04, 1.4, Vector3(-0.5 + (k % 3) * 0.5, 0.7, -0.3 + (k / 3) * 0.6), Color(0.4, 0.55, 0.25), false)
		"reeds":
			for k in 7:
				Builder.cylinder(it, 0.03, 1.6, Vector3(-0.6 + k * 0.2, 0.8, sin(k) * 0.3), Color(0.62, 0.6, 0.35), false)


## The kit's plants and rocks for a gathering spot. False if there's nothing for it.
func _gather_prop(it: Node3D, node_id: String) -> bool:
	var turn := randf() * TAU
	match node_id:
		"tree":
			Builder.prop(it, "CommonTree_%d" % (1 + absi(int(it.position.x)) % 5), Vector3.ZERO, turn, 0.62)
		"outcrop":
			Builder.prop(it, "Rock_Medium_%d" % (1 + absi(int(it.position.z)) % 3), Vector3.ZERO, turn, 0.42)
		"ore_seam":
			var rock := Builder.prop(it, "Rock_Medium_2", Vector3.ZERO, turn, 0.4)
			Creatures._tint_all(rock, Color(0.62, 0.58, 0.66))
			for k in 3:
				Builder.gem(it, 0.06, Vector3(-0.3 + k * 0.3, 0.45 + (k % 2) * 0.12, -0.25), Color(0.85, 0.55, 0.28), 0.6)
		"hemp":
			for k in 3:
				Builder.prop(it, "Grass_Wispy_Tall", Vector3(-0.5 + k * 0.5, 0, (k % 2) * 0.4 - 0.2), turn + k, 0.8)
			Builder.prop(it, "Plant_1", Vector3(0.1, 0, 0.3), turn, 0.7)
		"reeds":
			for k in 4:
				Builder.prop(it, "Grass_Common_Tall", Vector3(-0.6 + k * 0.4, 0, sin(k) * 0.3), turn + k, 0.9)
		_:
			return false
	return true


func gather_stone_zone() -> String:
	return "Campgrounds"


# ---------------------------------------------------------------- observations, trees

func _observations() -> void:
	var spots := {
		"forge_chord": Vector3(20.2, 0, 1.8), "tavern_bell": Vector3(-14.8, 0, -8.0), "map_wall": Vector3(-21.8, 0, -10.9),
		"pickled_eggs": Vector3(-17.8, 0, -9.8), "seven_sisters": SISTERS + Vector3(0, 0, 8.4), "lighthouse": Vector3(-27.2, 0, 12.6),
		"wolf_sea": Vector3(-8, 0, 16), "real_sky": Vector3(6, 0, -21.5),
	}
	var texts := {}
	for o in GameData.world["journal_observations"]["campgrounds"]:
		texts[o["id"]] = o["text"]
	for id in spots.keys():
		var it := Interactable.make(self, "observe", id, spots[id], "Look closely", 1.4, { "text": texts.get(id, "") })
		Builder.wisp(it, 0.12, Vector3(0, 1.6, 0), Color(1.0, 0.85, 0.5))   # something worth a closer look


func _trees() -> void:
	for i in 34:
		var ang := i * TAU / 34.0
		var r := 54.0 + (i % 3) * 3.0
		var p := Vector3(cos(ang) * r, 0, sin(ang) * r)
		if p.x < -10.0 and p.z > 18.0:
			continue
		if Builder.has_props():
			var kind := "Pine_%d" % (1 + i % 5) if i % 2 == 0 else "CommonTree_%d" % (1 + (i / 2) % 5)
			Builder.prop(self, kind, p, i * 2.3, 1.05 + (i % 3) * 0.15)
			Builder.solid(self, Vector3(0.8, 4.0, 0.8), p + Vector3(0, 2, 0))
			continue
		Builder.cylinder(self, 0.4, 4.0, p + Vector3(0, 2, 0), Color(0.3, 0.22, 0.14), true)
		Builder.sphere(self, 2.2, p + Vector3(0, 5.0, 0), Color(0.2, 0.34, 0.16).lightened((i % 4) * 0.05))
	# The woods: Rackham trees past the treeline.
	for i in 40:
		var p := Vector3(18.0 + fmod(i * 7.3, 30.0), 0, 12.0 + fmod(i * 11.9, 32.0))
		if p.distance_to(CLEARING) < 5.0 or p.distance_to(Vector3(41.6, 0, 40.2)) < 4.5 or p.distance_to(TREELINE) < 3.5:
			continue
		var blocked := false
		for t in [Vector3(19, 0, 16), Vector3(24, 0, 21), Vector3(28.5, 0, 25.5)]:
			if p.distance_to(t) < 2.2:
				blocked = true
		if blocked:
			continue
		if Builder.has_props():
			var kind := "TwistedTree_%d" % (1 + i % 5) if i % 3 != 2 else "CommonTree_%d" % (1 + i % 5)
			Builder.prop(self, kind, p, i * 1.9, 0.42 if kind.begins_with("Twisted") else 0.8)
			Builder.solid(self, Vector3(0.7, 4.0, 0.7), p + Vector3(0, 2, 0))
			continue
		Builder.cylinder(self, 0.35, 4.6, p + Vector3(0, 2.3, 0), Color(0.28, 0.2, 0.12), true)
		Builder.sphere(self, 2.0, p + Vector3(0, 5.4, 0), Color(0.18, 0.3, 0.15).lightened((i % 5) * 0.04))


# ---------------------------------------------------------------- dressing

## What each cart in the Market Field has out (counter top at 0.82 m).
func _cart_goods(stall: Node3D, i: int) -> void:
	var top := 0.82
	match i:
		0:   # Stone Vendor: rough stones in crates
			Builder.prop(stall, "FarmCrate_Empty", Vector3(-0.5, top, 0.0), 0.1)
			for k in 5:
				Builder.prop(stall, "Pebble_Round_%d" % (1 + k), Vector3(-0.7 + (k % 3) * 0.2, top + 0.08, -0.08 + (k / 3) * 0.15), k * 1.3, 0.35)
			Builder.prop(stall, "Bucket_Wooden_1", Vector3(0.5, top, 0.0), 0.5)
		1:   # Tool Vendor
			Builder.prop(stall, "Pickaxe_Bronze", Vector3(-0.6, top + 0.05, 0.0), 0.0, 0.6).rotation.z = PI / 2.0
			Builder.prop(stall, "Axe_Bronze", Vector3(0.1, top + 0.03, 0.0), 0.0, 0.8).rotation.z = PI / 2.0
			Builder.prop(stall, "Key_Metal", Vector3(0.6, top, 0.05), 0.6)
			Builder.prop(stall, "Whetstone", Vector3(1.6, 0, 0.9), 0.4, 0.6)
		2:   # General Store
			Builder.prop(stall, "Rope_2", Vector3(-0.6, top, 0.0), 0.2, 0.6)
			Builder.prop(stall, "Bag", Vector3(0.1, top, 0.0), 0.8, 0.5)
			Builder.prop(stall, "Candle_2", Vector3(0.55, top, -0.05))
			Builder.prop(stall, "FarmCrate_Apple", Vector3(1.7, 0, 0.8), 0.3)
		3:   # Bookmark Stall
			Builder.prop(stall, "Book_Stack_1", Vector3(-0.6, top, 0.0), 0.3)
			Builder.prop(stall, "Scroll_1", Vector3(-0.1, top, 0.05), 1.2)
			Builder.prop(stall, "Book_Stack_2", Vector3(0.4, top, -0.05), 2.0)
			Builder.prop(stall, "BookGroup_Small_3", Vector3(0.8, top, 0.0), PI)


const PLANT_SCALE := {
	"Bush_Common": 0.6, "Bush_Common_Flowers": 0.6, "Grass_Common_Short": 0.42, "Grass_Wispy_Short": 0.5,
	"Flower_3_Group": 0.32, "Flower_4_Group": 0.28, "Fern_1": 0.55, "Clover_2": 0.38, "Mushroom_Common": 0.7, "Plant_7_Big": 0.9,
}


## Plants, stones and life around the field: bushes and flowers at the edges,
## grass and ferns in the woods, pebbles on the paths, barrels and crates where
## people work, lanterns by the Inn's door.
func _dress_campgrounds() -> void:
	if not Builder.has_props():
		return
	var rng := RandomNumberGenerator.new()
	rng.seed = 4242
	var keep_clear := [Vector3(0, 0, -19), SISTERS, Vector3(-20, 0, -9), Vector3(14, 0, -12), Vector3(22, 0, 0), CLEARING, Vector3(41.6, 0, 40.2), Vector3(-14, 0, 24), Vector3(-30, 0, 15)]
	var free := func(p: Vector3, r: float) -> bool:
		for c in keep_clear:
			if Vector2(p.x - c.x, p.z - c.z).length() < r + 6.0:
				return false
		for i in GameData.crafting.get("plots", {}).get("ring_1", []).size():
			if p.distance_to(plot_position(i)) < r + 4.5:
				return false
		if absf(p.x) < 3.0 and p.z < 10.0:
			return false   # the main path
		if p.x < -8.0 and p.z > 18.0:
			return false   # the loch
		return true
	var picks := { "Bush_Common": [], "Bush_Common_Flowers": [], "Grass_Common_Short": [], "Grass_Wispy_Short": [], "Flower_3_Group": [],
			"Flower_4_Group": [], "Fern_1": [], "Clover_2": [], "Mushroom_Common": [], "Plant_7_Big": [] }
	var weights := ["Grass_Common_Short", "Grass_Common_Short", "Grass_Wispy_Short", "Grass_Common_Short", "Clover_2", "Flower_3_Group",
			"Flower_4_Group", "Bush_Common", "Bush_Common_Flowers", "Plant_7_Big"]
	for n in 420:
		var p := Vector3(rng.randf_range(-52, 52), 0, rng.randf_range(-52, 52))
		var kind: String = weights[rng.randi() % weights.size()]
		var in_woods := p.x > 16.0 and p.z > 10.0
		if in_woods:
			kind = ["Fern_1", "Fern_1", "Mushroom_Common", "Grass_Wispy_Short", "Bush_Common", "Plant_7_Big"][rng.randi() % 6]
		if not free.call(p, 0.5):
			continue
		var s := rng.randf_range(0.7, 1.0) * float(PLANT_SCALE.get(kind, 0.5))
		picks[kind].append(Transform3D(Basis(Vector3.UP, rng.randf() * TAU).scaled(Vector3.ONE * s), p))
	for kind in picks:
		Builder.scatter(self, kind, picks[kind], 45.0)
	# Stepping stones on the paths.
	var stones := []
	for k in 26:
		var z := -24.0 + k * 1.3
		if z > 8.0:
			break
		stones.append(Transform3D(Basis(Vector3.UP, rng.randf() * TAU).scaled(Vector3.ONE * 0.8), Vector3(rng.randf_range(-1.2, 1.2), 0.0, z)))
	Builder.scatter(self, "RockPath_Round_Small_%d" % 1, stones, 50.0)
	# Pebbles on the shore.
	var pebbles := []
	for k in 40:
		pebbles.append(Transform3D(Basis(Vector3.UP, rng.randf() * TAU), Vector3(rng.randf_range(-58, -12), 0.03, rng.randf_range(12.5, 19.5))))
	Builder.scatter(self, "Pebble_Round_2", pebbles, 40.0)
	# The Inn's front: lanterns either side of the door, barrels on the porch, ivy on the bark.
	for x in [-2.4, 2.4]:
		Builder.lantern(self, Vector3(x, 3.0, -26.45), 0.0, Color(1.0, 0.7, 0.4), 1.0, 8.0)
	Builder.prop(self, "Barrel", Vector3(-3.3, 0.3, -24.0), 0.4)
	Builder.prop(self, "Barrel_Apples", Vector3(-3.4, 0.3, -23.1), 1.2)
	Builder.prop(self, "Crate_Wooden", Vector3(3.4, 0.3, -23.8), 0.3)
	for x in [-11.0, -6.0, 6.5, 11.5]:
		Builder.prop(self, "Prop_Vine%d" % (1 if x < 0 else 2), Vector3(x, 6.0, -26.48), 0.0, 1.4)
	# The tavern: lanterns, bottles behind the bar, barrels in the corner.
	Builder.lantern(self, Vector3(-16.18, 2.6, -11.0), -PI / 2.0, Color(1.0, 0.7, 0.4), 0.8, 6.0)
	Builder.lantern(self, Vector3(-23.8, 2.6, -11.0), PI / 2.0, Color(1.0, 0.7, 0.4), 0.7, 6.0)
	Builder.prop(self, "Shelf_Small_Bottles", Vector3(-19.0, 1.5, -11.84))
	Builder.prop(self, "Barrel", Vector3(-23.3, 0.15, -11.3), 0.5)
	Builder.prop(self, "Barrel", Vector3(-22.6, 0.15, -11.45), 1.5)
	Builder.prop(self, "CandleStick_Triple", Vector3(-19.4, 0.82, -7.6), 0.0)
	# The dock: Zeke's crates, rope and a barrel.
	Builder.prop(self, "Crate_Wooden", Vector3(-13.3, 0.3, 30.5), 0.3, 0.8)
	Builder.prop(self, "Barrel", Vector3(-14.7, 0.3, 31.6), 0.0)
	Builder.prop(self, "Rope_3", Vector3(-14.4, 0.3, 28.4), 0.7, 0.8)
	Builder.prop(self, "Chain_Coil", Vector3(-13.6, 0.3, 23.0), 1.4, 0.7)
	# The forge yard's cart, the Seven Sisters' wood pile, Luna's lantern.
	Builder.prop(self, "Prop_Wagon", Vector3(26.5, 0, 6.5), 2.6)
	Builder.prop(self, "Barrel_Holder", SISTERS + Vector3(-6.8, 0, -4.5), 0.9)
	Builder.lantern(self, Vector3(16.9, 2.7, -14.4), -PI / 2.0, Color(1.0, 0.75, 0.45), 0.8, 7.0)


# ---------------------------------------------------------------- live behavior

func on_zone_ready() -> void:
	_place_wolf_and_travelers()
	_draw_plots()
	_commission_piece.visible = QuestManager.is_done("the_hands_that_remember")
	EventBus.game_event.connect(_on_event)
	EventBus.quest_step_completed.connect(func(_q: String, _s: String) -> void: _place_wolf_and_travelers())
	EventBus.quest_completed.connect(func(q: String) -> void:
		_place_wolf_and_travelers()
		if q == "the_hands_that_remember":
			_commission_piece.visible = true)
	Net.homesteads_received.connect(func(list: Array) -> void:
		_others.clear()
		var mine := int(PlayerState.homestead()["plot"])
		for h in list:
			if int(h["plot"]) != mine:
				_others[int(h["plot"])] = h
		_draw_plots())
	Net.plot_result.connect(func(ok: bool, _plot: int, message: String) -> void:
		if not message.is_empty():
			hud.toast(message)
		elif not ok:
			hud.toast("No plot free here right now.")
		_draw_plots()
		if hud.homestead.visible:
			hud.homestead.plot = int(PlayerState.homestead()["plot"])
			hud.homestead.refresh())
	if Net.is_online() and int(PlayerState.homestead()["plot"]) >= 0:
		Net.claim_plot(int(PlayerState.homestead()["plot"]))
		Net.update_homestead()
	_pluck_timer = Timer.new()
	_pluck_timer.one_shot = false
	add_child(_pluck_timer)
	_pluck_timer.timeout.connect(_pluck_tap)


## The wolf goes where the wolf needs to be. Jay's wolf is by the tavern door,
## except when it's acting strangely at the treeline.
func _place_wolf_and_travelers() -> void:
	var at_treeline := QuestManager.is_on_step("the_wolf_and_the_welcome", "treeline") or QuestManager.is_on_step("the_wolf_and_the_welcome", "tracks")
	var at_clearing := QuestManager.is_on_step("the_wolf_and_the_welcome", "clearing")
	if at_treeline:
		_wolf_home.position = TREELINE + Vector3(1.0, 0, 1.0)
		_wolf_home.rotation.y = -2.4
	elif at_clearing:
		_wolf_home.position = CLEARING + Vector3(-2.6, 0, -1.0)
		_wolf_home.rotation.y = 0.5
	else:
		_wolf_home.position = Vector3(-17.0, 0.15, -6.9)
		_wolf_home.rotation.y = PI / 2.0
	_wolf_home.visible = not has_wolf()
	var welcomed := QuestManager.is_done("the_wolf_and_the_welcome")
	for i in _travelers.size():
		var person := _travelers[i].get_node_or_null("Model") as CharacterModel
		if welcomed:
			# On the bench at Jay's long table, talking.
			_travelers[i].position = Vector3(-20.4 + i * 1.6, 0.15, -8.45)
			_travelers[i].rotation.y = PI
		else:
			_travelers[i].position = CLEARING + Vector3(1.6 + i * 1.0, 0, 1.4 - i * 2.2)
			var to_fire := CLEARING - _travelers[i].position
			_travelers[i].rotation.y = atan2(-to_fire.x, -to_fire.z)
		if person != null:
			person.idle_anim = "Sitting_Talking" if welcomed else "Idle"
			person.play(person.idle_anim, 0.0)


func whistle() -> void:
	super.whistle()
	if has_wolf():
		_wolf_home.visible = false


func _on_event(id: String, _data: Dictionary) -> void:
	if id == "tavern:entered":
		AudioDirector.tap("ships_bell", 660.0, 0.35)


func handle_interaction(it: Interactable) -> void:
	match it.kind:
		"vendor":
			hud.toast(String(it.data.get("text", "")))
		"anvil":
			strike_anvil()
		"track":
			follow_track(it)
		"tide_chart":
			hud.toast("High water, low water, all of it on the beat. Right now: %s." % tide_word())
		"observe_book":
			hud.toast("The Commission Book. Pages of requests, some of them years old. One reads: dendritic agate, the kind with the little trees inside." if not QuestManager.is_done("the_hands_that_remember")
				else "The Commission Book. One old request has a line through it now, in Luna's hand: finished.")
		_:
			super.handle_interaction(it)


## The anvil rings the metal chord: copper, silver and gold, 79, 80, 82 Hz.
func strike_anvil() -> void:
	var chord: Dictionary = GameData.audio.get("metal_chord_hz", { "copper": 79, "silver": 80, "gold": 82 })
	for m in chord.keys():
		# Played four octaves up so it rings on any speaker; the beating between them is the same.
		AudioDirector.play_freq(float(chord[m]) * 4.0, 2.4, "triangle", 0.07)
	AudioDirector.tap("tap_metal", 316.0, 0.3)
	if QuestManager.is_on_step("the_metal_that_sings", "chord"):
		EventBus.emit_event("forge:chord")
		hud.toast("Three tones at once, beating slow against each other.")
	elif QuestManager.is_on_step("the_metal_that_sings", "tune"):
		hud.open_panel(hud.forge)
	else:
		hud.toast("The anvil rings three tones at once.")


func follow_track(it: Interactable) -> void:
	var key := "track_seen:" + it.id
	if PlayerState.flag(key):
		hud.toast("The wolf's tracks, going on deeper into the woods.")
		return
	PlayerState.set_flag(key, true)
	hud.toast("Wolf tracks. They go on deeper into the woods.")
	var find := String(it.data.get("find", ""))
	if not find.is_empty() and GameData.stones.has(find):
		PlayerState.learn_stone(find)
		hud.toast("Something on the wolf's path: %s." % GameData.stones[find]["name"])
		AudioDirector.play_stone(find, 1.6, false)
	EventBus.emit_event("tracks", { "amount": 1 })


## The tide breathes on the heartbeat: one breath every eight beats.
func tide_phase() -> float:
	return fposmod(Net.clock() / (judge.interval_s() * 8.0), 1.0)


func tide_word() -> String:
	var s := sin(tide_phase() * TAU)
	if s > 0.6:
		return "high water"
	if s < -0.6:
		return "low water"
	return "the tide coming in" if cos(tide_phase() * TAU) > 0.0 else "the tide going out"


func on_beat(_index: int) -> void:
	# The forge is the only sound out here that plays the heartbeat explicitly.
	if player.global_position.distance_to(Vector3(21.2, 0, 0.6)) < 16.0:
		AudioDirector.tap("tap_metal", 300.0, 0.12)


# ---------------------------------------------------------------- Pluck and the Seven Sisters

## Pluck arrives first, always, and dances to the player's tempo. In a game
## with nobody else around, Pluck is the second tapper that lights the circle.
func on_tap(who: String, pos: Vector3, _surface: String, node: Node3D) -> void:
	if node != null and node.has_meta("sister"):
		_sister_tapped(int(node.get_meta("sister")))
	if who != "me":
		return
	var c := _circle_near(pos)
	if c.is_empty():
		return
	var mine := 0
	for x in c["taps"]:
		if String(x["who"]) == "me":
			mine += 1
	if mine >= int(circle.cfg.get("pluck_joins_after_taps", 3)):
		var bpm := circle.tempo_of(c, "me")
		if bpm > 0.0:
			_pluck.position = (c["center"] as Vector3) + Vector3(1.8, 0, 1.2)
			_pluck_timer.wait_time = 60.0 / clampf(bpm, 30.0, 200.0)
			if _pluck_timer.is_stopped():
				_pluck_timer.start()
	_pluck_last_heard = Net.clock()


var _pluck_last_heard := -100.0


func _circle_near(pos: Vector3) -> Dictionary:
	for c in circle.circles:
		if (c["center"] as Vector3).distance_to(pos) <= float(circle.cfg.get("circle_radius", 7.0)):
			return c
	return {}


func _pluck_tap() -> void:
	if Net.clock() - _pluck_last_heard > 4.0:
		_pluck_timer.stop()
		var tw := create_tween()
		tw.tween_property(_pluck, "position", _pluck_home, 2.0)
		return
	var surface := "wood"
	play_surface(surface, 0.0, 0.55)
	var r := circle.tap("pluck", _pluck.position, surface, Net.clock())
	_after_tap(r, "pluck", null)
	var tw := create_tween()
	tw.tween_property(_pluck, "scale", Vector3(1.0, 1.15, 1.0), 0.08)
	tw.tween_property(_pluck, "scale", Vector3.ONE, 0.2)


func pluck_is_playing() -> bool:
	return _pluck_timer != null and not _pluck_timer.is_stopped()


## All seven sisters in one lit circle: the ring's own chord.
func _sister_tapped(i: int) -> void:
	var t := Net.clock()
	_sister_taps[i] = t
	var window := float(GameData.world.get("drum_circle", {}).get("seven_sisters", {}).get("chord_window_s", 9.6))
	if _sister_taps.size() < 7 or not circle_lit_near(SISTERS):
		return
	for k in 7:
		if t - float(_sister_taps.get(k, -1000.0)) > window:
			return
	var c := _circle_near(SISTERS)
	var key := str(c.get("started", 0.0))
	if _chord_rung.has(key):
		return
	_chord_rung[key] = true
	var tones: Array = GameData.world.get("drum_circle", {}).get("seven_sisters", {}).get("tones_hz", [])
	AudioDirector.play_chord(tones, 3.0)
	PlayerState.add_chronicle("All seven sisters sang together in one circle.", "circle")
	Services.unlock_achievement("SEVEN_SISTERS")
	EventBus.emit_event("circle:seven_sisters")


func _process(delta: float) -> void:
	super._process(delta)
	var t := Net.clock()
	if _beam != null:
		_beam.rotation.y = fposmod(t / judge.interval_s(), 1.0) * TAU
	if _water != null:
		_water.position.y = 0.04 + 0.1 * sin(tide_phase() * TAU)
