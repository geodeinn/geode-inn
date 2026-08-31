###
# Geode Inn — Main Hub (Vertical Descent)
# The Godot hub scene that mirrors the web app's vertical descent layout.
# 10 zone buttons stacked vertically, each leading to a zone scene.
# Celtic knotwork gold-on-dark-stone aesthetic throughout.
#
# Layout (top to bottom):
#   1. Cosmology (Dalí) — The highest room
#   2. Clockwork Skies — Gears and orreries
#   3. Main Floor — The lobby (hub of hubs)
#   4. Campgrounds — The world outside
#   5. Staircase (Alchemy) — The spiral descent
#   6. Catacombs (Klimt) — Ancient civilizations
#   7. Fae Kingdom — Stone circle portals
#   8. Water Zone — Tidal caves and Atlantis
#   9. Undercity — Gothic, 84Hz Shadow
#  10. Spiral Gallery — The museum extension
###

extends Node2D
signal zone_entered(zone_name: String)
signal game_launched(game_id: String)

# === Hub Configuration ===
const HUB_ZONES := [
	{
		"name": "Cosmology",
		"subtitle": "Where the ceiling dissolves into impossible skies",
		"artist": "Dalí",
		"scene": "res://beta/scenes/Cosmology.tscn",
		"color": Color(0.3, 0.5, 0.9),
		"games": [],
	},
	{
		"name": "Clockwork Skies",
		"subtitle": "Gears and starlight in the rafters",
		"artist": "Da Vinci",
		"scene": "res://beta/scenes/ClockworkSkies.tscn",
		"color": Color(0.5, 0.5, 0.7),
		"games": [],
	},
	{
		"name": "Main Floor",
		"subtitle": "The lobby — everything connects through here",
		"artist": "Van Gogh / Picasso",
		"scene": "res://beta/scenes/MainFloor.tscn",
		"color": Color(0.85, 0.68, 0.32),
		"games": ["tumble_run"],
	},
	{
		"name": "Campgrounds",
		"subtitle": "The world outside — parks and wilderness",
		"artist": "Dixon / Benton / Wyeth",
		"scene": "res://beta/scenes/Campgrounds.tscn",
		"color": Color(0.3, 0.7, 0.3),
		"games": ["andean_run"],
	},
	{
		"name": "Staircase",
		"subtitle": "The spiral descent — alchemy between states",
		"artist": "Matisse",
		"scene": "res://beta/scenes/Staircase.tscn",
		"color": Color(0.6, 0.3, 0.7),
		"games": [],
	},
	{
		"name": "Catacombs",
		"subtitle": "Ancient civilizations in golden stillness",
		"artist": "Klimt",
		"scene": "res://beta/scenes/Catacombs.tscn",
		"color": Color(0.72, 0.55, 0.26),
		"games": ["tomb_tunnel", "sandfall"],
	},
	{
		"name": "Fae Kingdom",
		"subtitle": "Stone circle portals to summer and winter courts",
		"artist": "Lee / Bauer",
		"scene": "res://beta/scenes/FaeKingdom.tscn",
		"color": Color(0.2, 0.9, 0.7),
		"games": ["standing_stones"],
	},
	{
		"name": "Water Zone",
		"subtitle": "Tidal caves, Atlantis, and the deep",
		"artist": "Royo / Lewis",
		"scene": "res://beta/scenes/WaterZone.tscn",
		"color": Color(0.2, 0.5, 0.8),
		"games": ["monster_of_the_deep"],
	},
	{
		"name": "Undercity",
		"subtitle": "The deepest Inn — 84Hz Shadow, Hollow Men",
		"artist": "Gothic",
		"scene": "res://beta/scenes/Undercity.tscn",
		"color": Color(0.15, 0.12, 0.1),
		"games": ["hollow_men"],
	},
	{
		"name": "Spiral Gallery",
		"subtitle": "The museum extension — art through the ages",
		"artist": "Carr / Escher / Rothko",
		"scene": "res://beta/scenes/SpiralGallery.tscn",
		"color": Color(0.8, 0.8, 0.85),
		"games": [],
	},
]

# === UI Nodes ===
var button_container: VBoxContainer
var title_label: Label
var subtitle_label: Label
var footer_label: Label
var scroll_container: ScrollContainer
var player_info_label: Label

# === State ===
var hovered_zone: int = -1
var selected_zone: int = -1

func _ready() -> void:
	_create_ui()
	# Audio: main hub ambient (42Hz Song)
	if AudioManager:
		AudioManager.play_zone_ambient("main_floor")
		AudioManager.set_mode(AudioManager.AudioMode.LIVING)
	
	# Steam rich presence
	if SteamManager:
		SteamManager.set_rich_presence("In the Geode Inn", "Main Hub")
	
	print("[MainHub] Ready — %d zones available" % HUB_ZONES.size())

func _create_ui() -> void:
	# Title
	title_label = Label.new()
	title_label.text = "THE GEODE INN"
	title_label.position = Vector2(640, 30)
	title_label.size = Vector2(400, 40)
	title_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title_label.add_theme_font_size_override("font_size", 28)
	title_label.add_theme_color_override("font_color", Color(0.85, 0.68, 0.32))
	title_label.add_theme_color_override("font_shadow_color", Color(0, 0, 0, 0.8))
	title_label.add_theme_constant_override("shadow_offset_x", 2)
	title_label.add_theme_constant_override("shadow_offset_y", 2)
	add_child(title_label)
	
	# Subtitle
	subtitle_label = Label.new()
	subtitle_label.text = "Descend."
	subtitle_label.position = Vector2(640, 68)
	subtitle_label.size = Vector2(400, 24)
	subtitle_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	subtitle_label.add_theme_font_size_override("font_size", 18)
	subtitle_label.add_theme_color_override("font_color", Color(0.6, 0.55, 0.45, 0.8))
	subtitle_label.add_theme_constant_override("font_italic", 1)
	add_child(subtitle_label)
	
	# Scrollable button container
	scroll_container = ScrollContainer.new()
	scroll_container.position = Vector2(340, 100)
	scroll_container.size = Vector2(600, 520)
	scroll_container.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	
	button_container = VBoxContainer.new()
	button_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	button_container.add_theme_constant_override("separation", 8)
	
	for i in range(HUB_ZONES.size()):
		var zone = HUB_ZONES[i]
		var btn = _create_zone_button(zone, i)
		button_container.add_child(btn)
	
	scroll_container.add_child(button_container)
	add_child(scroll_container)
	
	# Player info (bottom left)
	player_info_label = Label.new()
	player_info.position = Vector2(20, 690)
	player_info.size = Vector2(300, 20)
	player_info.add_theme_font_size_override("font_size", 12)
	player_info.add_theme_color_override("font_color", Color(0.5, 0.45, 0.35, 0.6))
	
	if GameManager:
		player_info_label.text = "Stones: %d | Games: %d | Zones: %d" % [
			GameManager.stones_collected.size(),
			GameManager.games_completed.size(),
			GameManager.visited_zones.size(),
		]
	add_child(player_info_label)
	
	# Footer
	footer_label = Label.new()
	footer_label.text = "The Inn is an archive aware of the player."
	footer_label.position = Vector2(640, 690)
	footer_label.size = Vector2(400, 20)
	footer_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	footer_label.add_theme_font_size_override("font_size", 11)
	footer_label.add_theme_color_override("font_color", Color(0.4, 0.38, 0.32, 0.5))
	add_child(footer_label)

func _create_zone_button(zone: Dictionary, index: int) -> Button:
	var btn = Button.new()
	btn.text = zone.name + "\n" + zone.subtitle
	btn.custom_minimum_size = Vector2(560, 48)
	
	# Styling: dark stone with gold border
	var style_normal = StyleBoxFlat.new()
	style_normal.bg_color = Color(0.08, 0.06, 0.04, 0.9)
	style_normal.border_width_left = 3
	style_normal.border_color = zone.color
	style_normal.corner_radius_top_left = 4
	style_normal.corner_radius_top_right = 4
	style_normal.corner_radius_bottom_left = 4
	style_normal.corner_radius_bottom_right = 4
	style_normal.content_margin_left = 16
	style_normal.content_margin_top = 8
	btn.add_theme_stylebox("normal", style_normal)
	
	var style_hover = StyleBoxFlat.new()
	style_hover.bg_color = Color(0.12, 0.09, 0.06, 0.95)
	style_hover.border_width_left = 4
	style_hover.border_color = zone.color.lightened(0.2)
	style_hover.corner_radius_top_left = 4
	style_hover.corner_radius_top_right = 4
	style_hover.corner_radius_bottom_left = 4
	style_hover.corner_radius_bottom_right = 4
	style_hover.content_margin_left = 16
	style_hover.content_margin_top = 8
	btn.add_theme_stylebox("hover", style_hover)
	
	btn.add_theme_font_size_override("font_size", 14)
	btn.add_theme_color_override("font_color", Color(0.82, 0.75, 0.62))
	btn.add_theme_color_override("font_hover_color", zone.color.lightened(0.3))
	btn.alignment = HORIZONTAL_ALIGNMENT_LEFT
	
	# Click handler
	btn.pressed.connect(func(): _on_zone_clicked(index))
	
	return btn

func _on_zone_clicked(index: int) -> void:
	if index < 0 or index >= HUB_ZONES.size():
		return
	
	var zone = HUB_ZONES[index]
	selected_zone = index
	
	# Audio: portal sound
	if AudioManager:
		AudioManager.play_ui_sound("portal")
	
	# Notify GameManager
	if GameManager:
		GameManager.enter_zone(zone.name)
	
	zone_entered.emit(zone.name)
	
	print("[MainHub] Zone selected: %s (artist: %s)" % [zone.name, zone.artist])
	
	# Launch games if zone has them
	if zone.games.size() > 0:
		print("[MainHub] Games available: %s" % str(zone.games))
	
	# Scene transition (when scenes are built)
	# get_tree().change_scene_to_file(zone.scene)

func _process(_delta: float) -> void:
	# Update player info
	if GameManager and player_info_label:
		player_info_label.text = "Stones: %d | Games: %d | Zones: %d" % [
			GameManager.stones_collected.size(),
			GameManager.games_completed.size(),
			GameManager.visited_zones.size(),
		]

# === Launch Games ===

func launch_game(game_id: String) -> void:
	if AudioManager:
		AudioManager.play_ui_sound("portal")
	
	game_launched.emit(game_id)
	
	match game_id:
		"standing_stones":
			# get_tree().change_scene_to_file("res://beta/scenes/StandingStones.tscn")
			print("[MainHub] Launching Standing Stones...")
		"tomb_tunnel":
			print("[MainHub] Launching Tomb Tunnel...")
		"andean_run":
			print("[MainHub] Launching Andean Run...")
		"monster_of_the_deep":
			print("[MainHub] Launching Monster of the Deep...")
		"hollow_men":
			print("[MainHub] Launching Hollow Men...")
		"tumble_run":
			print("[MainHub] Launching Tumble Run...")
		"sandfall":
			print("[MainHub] Launching Sandfall...")
		_:
			print("[MainHub] Unknown game: %s" % game_id)
