###
# Geode Inn — World Map Navigation System
# Renders the 37 zone pins on a stylized world map in Godot.
# Two layers: Stone pins (gem origins) and Lore pins (cultural mythology).
# Clicking a pin shows zone info and allows travel.
###

extends Node2D
signal zone_selected(zone_name: String)
signal stone_selected(stone_name: String)

# === Zone Definitions (37 zones) ===
const ZONES := [
	# Main Floor
	{"name": "Main Floor", "type": "hub", "artist": "Van Gogh / Picasso", "lat": 0.5, "lng": 0.5, "zone_page": "main_floor"},
	{"name": "Garden", "type": "zone", "artist": "Van Gogh", "lat": 0.48, "lng": 0.52, "zone_page": "garden"},
	{"name": "Meadery", "type": "zone", "artist": "Picasso", "lat": 0.52, "lng": 0.48, "zone_page": "meadery"},
	{"name": "Artisan Market", "type": "market", "artist": "Mapplethorpe", "lat": 0.46, "lng": 0.54, "zone_page": "market"},
	
	# Cosmology (Upstairs)
	{"name": "Cosmology", "type": "cosmology", "artist": "Dalí", "lat": 0.3, "lng": 0.5, "zone_page": "cosmology"},
	{"name": "Clockwork Skies", "type": "cosmology", "artist": "Da Vinci", "lat": 0.35, "lng": 0.45, "zone_page": "clockwork_skies"},
	
	# Campgrounds (Exterior)
	{"name": "Colorado Plateau", "type": "parks", "artist": "Dixon", "lat": 0.25, "lng": 0.2, "zone_page": "colorado_plateau"},
	{"name": "Yellowstone", "type": "parks", "artist": "Benton", "lat": 0.22, "lng": 0.3, "zone_page": "yellowstone"},
	{"name": "Superstitions", "type": "parks", "artist": "Bierstadt", "lat": 0.28, "lng": 0.25, "zone_page": "superstitions"},
	{"name": "Appalachians", "type": "parks", "artist": "Wyeth", "lat": 0.27, "lng": 0.6, "zone_page": "appalachians"},
	{"name": "Petrified Forest", "type": "parks", "artist": "Adams", "lat": 0.24, "lng": 0.35, "zone_page": "petrified_forest"},
	{"name": "Redwood", "type": "parks", "artist": "Carr", "lat": 0.2, "lng": 0.15, "zone_page": "redwood"},
	
	# World Map (Cultural Zones)
	{"name": "Egypt", "type": "world", "artist": "O'Keeffe", "lat": 0.55, "lng": 0.55, "zone_page": "egypt"},
	{"name": "Greece", "type": "world", "artist": "Monet", "lat": 0.5, "lng": 0.58, "zone_page": "greece"},
	{"name": "Mesopotamia", "type": "world", "artist": "Hokusai", "lat": 0.52, "lng": 0.62, "zone_page": "mesopotamia"},
	{"name": "Camelot", "type": "world", "artist": "Moreau", "lat": 0.48, "lng": 0.45, "zone_page": "camelot"},
	{"name": "Peru", "type": "world", "artist": "Guo Xi", "lat": 0.6, "lng": 0.3, "zone_page": "peru"},
	{"name": "China", "type": "world", "artist": "Mulan Ink-Wash", "lat": 0.45, "lng": 0.8, "zone_page": "china"},
	{"name": "Norse", "type": "world", "artist": "Book of Kells", "lat": 0.3, "lng": 0.55, "zone_page": "norse"},
	{"name": "Slavic", "type": "world", "artist": "Roerich", "lat": 0.35, "lng": 0.6, "zone_page": "slavic"},
	{"name": "India", "type": "world", "artist": "Tagore", "lat": 0.55, "lng": 0.72, "zone_page": "india"},
	{"name": "Bayou", "type": "world", "artist": "Don't Starve", "lat": 0.5, "lng": 0.25, "zone_page": "bayou"},
	
	# Staircase (Alchemy)
	{"name": "Staircase", "type": "transition", "artist": "Matisse", "lat": 0.42, "lng": 0.5, "zone_page": "staircase"},
	
	# Catacombs (Downstairs)
	{"name": "Catacombs", "type": "underground", "artist": "Klimt", "lat": 0.65, "lng": 0.5, "zone_page": "catacombs"},
	{"name": "Undercity", "type": "underground", "artist": "Gothic", "lat": 0.68, "lng": 0.52, "zone_page": "undercity"},
	{"name": "Bone Room", "type": "underground", "artist": "O'Keeffe × Klimt", "lat": 0.7, "lng": 0.48, "zone_page": "bone_room"},
	{"name": "Cave City", "type": "underground", "artist": "Doré", "lat": 0.72, "lng": 0.55, "zone_page": "cave_city"},
	{"name": "Poison Garden", "type": "underground", "artist": "Gorey", "lat": 0.67, "lng": 0.58, "zone_page": "poison_garden"},
	
	# Fae Kingdom
	{"name": "Fae Threshold", "type": "fae", "artist": "Lee", "lat": 0.75, "lng": 0.35, "zone_page": "fae_threshold"},
	{"name": "Seelie Court", "type": "fae", "artist": "Lee", "lat": 0.78, "lng": 0.3, "zone_page": "seelie_court"},
	{"name": "Unseelie Court", "type": "fae", "artist": "Bauer", "lat": 0.78, "lng": 0.4, "zone_page": "unseelie_court"},
	{"name": "Crystal Gardens", "type": "fae", "artist": "Lee × Bauer", "lat": 0.8, "lng": 0.35, "zone_page": "crystal_gardens"},
	{"name": "Stone Circle", "type": "fae", "artist": "Lee × Bauer", "lat": 0.82, "lng": 0.35, "zone_page": "stone_circle_chamber"},
	
	# Water Zones
	{"name": "Tidal Caves", "type": "water", "artist": "Lewis", "lat": 0.6, "lng": 0.2, "zone_page": "tidal_caves"},
	{"name": "Atlantis", "type": "water", "artist": "Royo", "lat": 0.65, "lng": 0.15, "zone_page": "atlantis"},
	{"name": "Lighthouse", "type": "water", "artist": "Royo", "lat": 0.58, "lng": 0.18, "zone_page": "lighthouse"},
	
	# Exterior
	{"name": "Exterior", "type": "exterior", "artist": "Rousseau + Magritte", "lat": 0.4, "lng": 0.5, "zone_page": "exterior"},
	
	# Spiral Gallery
	{"name": "Spiral Gallery", "type": "gallery", "artist": "Carr/Escher/Rothko", "lat": 0.85, "lng": 0.5, "zone_page": "spiral_gallery"},
]

# === Pin Colors by Zone Type ===
const PIN_COLORS := {
	"hub": Color(0.85, 0.68, 0.32),       # Gold
	"cosmology": Color(0.3, 0.5, 0.9),     # Blue
	"parks": Color(0.3, 0.7, 0.3),         # Green
	"world": Color(0.9, 0.6, 0.2),         # Amber
	"transition": Color(0.6, 0.3, 0.7),    # Purple
	"underground": Color(0.5, 0.35, 0.2),  # Brown
	"fae": Color(0.2, 0.9, 0.7),           # Teal
	"water": Color(0.2, 0.5, 0.8),         # Deep blue
	"exterior": Color(0.7, 0.5, 0.3),      # Earth
	"market": Color(0.9, 0.4, 0.5),        # Rose
	"gallery": Color(0.8, 0.8, 0.8),       # Silver
}

# === State ===
var pin_nodes: Dictionary = {}  # zone_name → Area2D
var info_panel: Panel
var info_title: Label
var info_artist: Label
var info_description: Label
var travel_button: Button
var selected_zone: String = ""

func _ready() -> void:
	_create_info_panel()
	_render_pins()
	print("[WorldMap] Rendered %d zone pins" % ZONES.size())

func _create_info_panel() -> void:
	info_panel = Panel.new()
	info_panel.position = Vector2(850, 50)
	info_panel.size = Vector2(380, 200)
	info_panel.visible = false
	
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.08, 0.06, 0.04, 0.95)
	style.border_width_all = 2
	style.border_color = Color(0.72, 0.55, 0.26, 0.8)
	style.corner_radius_top_left = 8
	style.corner_radius_top_right = 8
	style.corner_radius_bottom_left = 8
	style.corner_radius_bottom_right = 8
	info_panel.add_theme_stylebox("panel", style)
	
	info_title = Label.new()
	info_title.position = Vector2(16, 12)
	info_title.size = Vector2(348, 28)
	info_title.add_theme_font_size_override("font_size", 20)
	info_title.add_theme_color_override("font_color", Color(0.85, 0.68, 0.32))
	info_panel.add_child(info_title)
	
	info_artist = Label.new()
	info_artist.position = Vector2(16, 42)
	info_artist.size = Vector2(348, 20)
	info_artist.add_theme_font_size_override("font_size", 14)
	info_artist.add_theme_color_override("font_color", Color(0.6, 0.55, 0.45))
	info_panel.add_child(info_artist)
	
	info_description = Label.new()
	info_description.position = Vector2(16, 68)
	info_description.size = Vector2(348, 80)
	info_description.add_theme_font_size_override("font_size", 13)
	info_description.add_theme_color_override("font_color", Color(0.78, 0.72, 0.62))
	info_description.autowrap = true
	info_panel.add_child(info_description)
	
	travel_button = Button.new()
	travel_button.position = Vector2(16, 155)
	travel_button.size = Vector2(348, 32)
	travel_button.text = "Enter Zone"
	travel_button.add_theme_font_size_override("font_size", 16)
	travel_button.add_theme_color_override("font_color", Color(0.85, 0.78, 0.52))
	info_panel.add_child(travel_button)
	
	add_child(info_panel)

func _render_pins() -> void:
	for zone in ZONES:
		var pin = Area2D.new()
		pin.name = "Pin_" + zone.name.replace(" ", "_")
		
		# Pin sprite (circle)
		var circle = Sprite2D.new()
		var tex = _create_pin_texture(PIN_COLORS.get(zone.type, Color.WHITE))
		circle.texture = tex
		circle.scale = Vector2(0.5, 0.5)
		pin.add_child(circle)
		
		# Pin label
		var label = Label.new()
		label.text = zone.name
		label.position = Vector2(-30, 15)
		label.size = Vector2(60, 16)
		label.add_theme_font_size_override("font_size", 10)
		label.add_theme_color_override("font_color", Color(0.78, 0.72, 0.62))
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		pin.add_child(label)
		
		# Position (normalized coords → screen coords)
		# Map area: 50,50 to 800,550
		var screen_x = 50 + zone.lng * 750
		var screen_y = 50 + zone.lat * 500
		pin.position = Vector2(screen_x, screen_y)
		
		# Click handler
		pin.input_event.connect(func(_viewport, event, _shape_idx):
			if event is InputEventMouseButton and event.pressed:
				_on_pin_clicked(zone)
		)
		
		add_child(pin)
		pin_nodes[zone.name] = pin

func _create_pin_texture(color: Color) -> ImageTexture:
	var img = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var center = Vector2i(16, 16)
	for x in range(32):
		for y in range(32):
			var dist = Vector2(x, y).distance_to(center)
			if dist <= 12:
				var alpha = 1.0 - (dist / 12.0) * 0.3
				img.set_pixel(x, y, Color(color.r, color.g, color.b, alpha))
			elif dist <= 14:
				img.set_pixel(x, y, Color(color.r, color.g, color.b, 0.5))
	return ImageTexture.create_from_image(img)

func _on_pin_clicked(zone: Dictionary) -> void:
	selected_zone = zone.name
	
	# Show info panel
	info_title.text = zone.name
	info_artist.text = "Artist: " + zone.get("artist", "")
	info_description.text = _get_zone_description(zone.name)
	info_panel.visible = true
	
	# Audio: stone chime for pin selection
	if AudioManager:
		AudioManager.play_ui_sound("button_click")
	
	zone_selected.emit(zone.name)

func _get_zone_description(zone_name: String) -> String:
	var descriptions = {
		"Cosmology": "The highest room. Surreal skies and impossible stars.",
		"Main Floor": "The lobby. Everything connects through here.",
		"Catacombs": "Ancient civilizations in golden stillness.",
		"Fae Threshold": "The entry to the Fae Kingdom. Stone circle portals.",
		"Tidal Caves": "Vorticist water energy. Selkie's workshop.",
		"Undercity": "The deepest Inn. 84Hz Shadow. Hollow Men.",
	}
	return descriptions.get(zone_name, "A zone in the Geode Inn.")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		# Click outside panel to close
		if info_panel.visible and not info_panel.get_global_rect().has_point(event.position):
			info_panel.visible = false
			selected_zone = ""
