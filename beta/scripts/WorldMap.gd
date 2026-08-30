extends Node2D
## WorldMap.gd
## The world map showing 37 zones as clickable pins.
## First visit to a zone plays a prompt-coded animated intro.
## Some zones have playable games; others are narrative visit points only.

const ZONES := [
	# World Map zones (cultural)
	{"id": "egypt", "name": "Egypt", "artist": "O'Keeffe × Royo", "has_game": true, "game": "tomb_tunnel", "pin": Vector2(1450, 800)},
	{"id": "greece", "name": "Greece", "artist": "Monet × Royo", "has_game": false, "game": "", "pin": Vector2(1400, 600)},
	{"id": "mesopotamia", "name": "Mesopotamia", "artist": "Hokusai × Royo", "has_game": false, "game": "", "pin": Vector2(1550, 650)},
	{"id": "camelot", "name": "Camelot", "artist": "Moreau × Royo", "has_game": false, "game": "", "pin": Vector2(1000, 450)},
	{"id": "peru", "name": "Peru", "artist": "Olmos × Royo", "has_game": true, "game": "andean_run", "pin": Vector2(800, 900)},
	{"id": "china", "name": "China", "artist": "Mulan ink-wash × Royo", "has_game": false, "game": "", "pin": Vector2(1700, 550)},
	{"id": "norse", "name": "Norse", "artist": "Book of Kells × Royo", "has_game": false, "game": "", "pin": Vector2(1100, 250)},
	{"id": "slavic", "name": "Slavic", "artist": "Roerich × Royo", "has_game": false, "game": "", "pin": Vector2(1300, 300)},
	{"id": "india", "name": "India", "artist": "Tagore × Royo", "has_game": false, "game": "", "pin": Vector2(1600, 800)},
	{"id": "bayou", "name": "Bayou", "artist": "Don't Starve × Royo", "has_game": false, "game": "", "pin": Vector2(600, 800)},
	# Parks zones
	{"id": "colorado_plateau", "name": "Colorado Plateau", "artist": "Dixon × Royo", "has_game": false, "game": "", "pin": Vector2(500, 550)},
	{"id": "yellowstone", "name": "Yellowstone", "artist": "Benton × Royo", "has_game": false, "game": "", "pin": Vector2(550, 400)},
	{"id": "superstitions", "name": "Superstition Mts", "artist": "Bierstadt × Royo", "has_game": false, "game": "", "pin": Vector2(650, 600)},
	{"id": "appalachians", "name": "Appalachian Trail", "artist": "Wyeth × Royo", "has_game": false, "game": "", "pin": Vector2(1000, 650)},
	{"id": "petrified_forest", "name": "Petrified Forest", "artist": "Adams × Royo", "has_game": false, "game": "", "pin": Vector2(700, 500)},
	{"id": "redwood", "name": "Redwood", "artist": "Carr × Royo", "has_game": false, "game": "", "pin": Vector2(400, 400)},
	# Underground
	{"id": "catacombs", "name": "Catacombs", "artist": "Klimt × Royo", "has_game": false, "game": "", "pin": Vector2(960, 540)},
	{"id": "atlantis", "name": "Atlantis", "artist": "Royo", "has_game": true, "game": "monster_of_the_deep", "pin": Vector2(1500, 950)},
	{"id": "tidal_caves", "name": "Tidal Caves", "artist": "Lewis × Royo", "has_game": false, "game": "", "pin": Vector2(1450, 850)},
	{"id": "bone_room", "name": "Bone Room", "artist": "O'Keeffe × Klimt", "has_game": false, "game": "", "pin": Vector2(960, 700)},
	{"id": "cave_city", "name": "Cave City", "artist": "Doré × Royo", "has_game": false, "game": "", "pin": Vector2(900, 800)},
	{"id": "poison_garden", "name": "Poison Garden", "artist": "Gorey × Royo", "has_game": false, "game": "", "pin": Vector2(960, 750)},
	{"id": "seelie_court", "name": "Seelie Court", "artist": "Lee × Royo", "has_game": false, "game": "", "pin": Vector2(1200, 950)},
	{"id": "unseelie_court", "name": "Unseelie Court", "artist": "Bauer × Royo", "has_game": false, "game": "", "pin": Vector2(1200, 850)},
]

signal zone_selected(zone_id: String)
signal game_launched(game_id: String)

func _ready() -> void:
	SaveManager.visit_zone("world_map")
	_setup_pins()

func _setup_pins() -> void:
	for zone in ZONES:
		var pin := Area2D.new()
		pin.position = zone.pin
		pin.name = zone.id
		
		var collision := CollisionShape2D.new()
		var circle := CircleShape2D.new()
		circle.radius = 20
		collision.shape = circle
		pin.add_child(collision)
		
		pin.input_event.connect(_on_zone_clicked.bind(zone))
		add_child(pin)

func _on_zone_clicked(_viewport, event, _shape, zone: Dictionary) -> void:
	if event is InputEventMouseButton and event.pressed:
		zone_selected.emit(zone.id)
		
		var visited := SaveManager.get_flag("visited_zones") as Array
		
		if not zone.id in visited:
			# First visit — play animated intro cutscene
			CutscenePlayer.play_cutscene("zone_intro_" + zone.id)
			SaveManager.visit_zone(zone.id)
		
		if zone.get("has_game", false):
			var game_id := zone.get("game", "")
			if game_id != "":
				FizgigLoader.load_zone(zone.id)
				game_launched.emit(game_id)
				# Launch the arcade game scene
		else:
			# Narrative visit point — show zone description and any dialogue
			_show_zone_narrative(zone)

func _show_zone_narrative(zone: Dictionary) -> void:
	# Display zone description based on artist style and mythology
	# For beta: text-based with art backdrop
	var narrative := """
	[{name}] — {artist}
	
	The {name} stretches before you in the style of {artist}.
	""".format({"name": zone.name, "artist": zone.artist})
	# Display this in a panel with the zone's art
