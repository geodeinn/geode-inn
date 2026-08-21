class_name AlcoveCorridor
extends Node2D

## Script for the artifact browsing hallway ('The Alcove Corridor').
## Features a curved corridor with recessed rectangular alcoves, Y-sorted shelf layers,
## warm wall torchlight (#FFC56E), cool blue/cyan floor runes (#64FDFD, 0.5Hz pulse),
## cool blue interior alcove lighting (#AEEEEE) illuminating pottery and vases,
## weathered stone/moss textures, and interactive examine points.

signal artifact_examined(artifact_id: String, artifact_name: String, description: String)

@export_group("Lighting Settings")
## Warm torchlight color on walls and ceiling (#FFC56E)
@export var torch_color: Color = Color("ffc56e")
@export var torch_energy: float = 0.75
## Cool blue/cyan rune color near floor (#64FDFD)
@export var rune_color: Color = Color("64fdfd")
@export var rune_energy: float = 0.5
@export var rune_pulse_hz: float = 0.5
## Cool blue interior alcove light color (#AEEEEE)
@export var alcove_light_color: Color = Color("aeeeee")
@export var alcove_light_energy: float = 0.65

@export_group("Corridor & Alcoves")
@export var alcove_count: int = 6
@export var corridor_curve_radius: float = 1200.0

# Internal references
var _y_sort_layer: Node2D
var _examine_ui: CanvasLayer
var _active_artifact: Node2D = null

# Sample artifact dataset for alcove contents
var _artifact_data: Array[Dictionary] = [
	{
		"id": "amphora_01",
		"name": "Ancient Glazed Amphora",
		"desc": "A heavy terracotta vessel coated with weathered blue glaze. Smells softly of ancient spices.",
		"type": "pottery",
		"icon_color": Color("aeeeee")
	},
	{
		"id": "urn_02",
		"name": "Runed Ritual Jar",
		"desc": "Carved stone urn bearing faded catacomb runes. Resonance faintly matches 432Hz.",
		"type": "vase",
		"icon_color": Color("64fdfd")
	},
	{
		"id": "scroll_vessel_03",
		"name": "Bronze Scroll Container",
		"desc": "Sealed cylinder of oxidized bronze, verdigris forming ivy-like patterns along its rim.",
		"type": "vessel",
		"icon_color": Color("ffc56e")
	},
	{
		"id": "celadon_vase_04",
		"name": "Celadon Flask",
		"desc": "Smooth ceramic flask with crackled celadon glaze, preserving clear spring water inside.",
		"type": "flask",
		"icon_color": Color("aeeeee")
	},
	{
		"id": "obsidian_bowl_05",
		"name": "Etched Obsidian Bowl",
		"desc": "Dark volcanic glass bowl etched with constellation maps from forgotten skies.",
		"type": "bowl",
		"icon_color": Color("64fdfd")
	},
	{
		"id": "chalice_06",
		"name": "Gilded Relic Chalice",
		"desc": "A heavy golden chalice set with small unpolished geodes, resting on damp moss.",
		"type": "chalice",
		"icon_color": Color("ffc56e")
	}
]


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("alcove_corridor")

	# 2. Setup Y-Sort container so player can walk behind/in front of shelf sprites
	_setup_ysort_layer()

	# 3. Create curved wall torches
	_setup_wall_torches()

	# 4. Create blue floor runes with slow 0.5Hz pulse
	_setup_floor_runes()

	# 5. Populate alcoves with pottery/vases, cool blue light, and examine points
	_populate_alcoves()

	# 6. Build built-in examine UI dialog overlay
	_setup_examine_ui()


func _process(_delta: float) -> void:
	# Handle interact key input (e.g. 'ui_accept' or 'interact')
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("interact"):
		_trigger_active_interaction()


## Initializes Y-sort container node
func _setup_ysort_layer() -> void:
	_y_sort_layer = Node2D.new()
	_y_sort_layer.name = "YSortLayer"
	_y_sort_layer.y_sort_enabled = true
	add_child(_y_sort_layer)


## Spawns warm torchlight on upper corridor walls and ceiling
func _setup_wall_torches() -> void:
	var torches_node := Node2D.new()
	torches_node.name = "WallTorches"
	add_child(torches_node)

	for i in range(alcove_count):
		# Position along curved arc
		var angle := lerp(-0.5, 0.5, float(i) / float(alcove_count - 1))
		var pos := Vector2(
			960.0 + sin(angle) * corridor_curve_radius * 0.5,
			300.0 + cos(angle) * 120.0
		)

		var light: Node2D
		if get_node_or_null("/root/CatacombLighting"):
			light = CatacombLighting.create_torch_light(torch_color, torch_energy, pos)
		else:
			var pl := PointLight2D.new()
			pl.color = torch_color
			pl.energy = torch_energy
			pl.position = pos
			pl.enabled = true
			light = pl

		torches_node.add_child(light)


## Spawns floor rune markers with moss textures and slow 0.5Hz pulse
func _setup_floor_runes() -> void:
	var runes_node := Node2D.new()
	runes_node.name = "FloorRunes"
	add_child(runes_node)

	for i in range(alcove_count):
		var angle := lerp(-0.5, 0.5, float(i) / float(alcove_count - 1))
		var rune_pos := Vector2(
			960.0 + sin(angle) * corridor_curve_radius * 0.5,
			680.0 + cos(angle) * 100.0
		)

		# Create moss/rune floor marker sprite representation
		var marker := Sprite2D.new()
		marker.name = "RuneMarker_%d" % i
		marker.position = rune_pos
		runes_node.add_child(marker)

		# Create 0.5Hz slow pulsing crystal light for runes
		var light: Node2D
		if get_node_or_null("/root/CatacombLighting"):
			light = CatacombLighting.create_crystal_light(rune_color, rune_energy, rune_pos, rune_pulse_hz)
		else:
			var pl := PointLight2D.new()
			pl.color = rune_color
			pl.energy = rune_energy
			pl.position = rune_pos
			pl.enabled = true
			light = pl
			# Add tween for 0.5Hz gentle pulse (epilepsy safe)
			var tw := create_tween().set_loops()
			tw.tween_property(pl, "energy", rune_energy * 1.3, 1.0)
			tw.tween_property(pl, "energy", rune_energy * 0.7, 1.0)

		runes_node.add_child(light)


## Populates recessed rectangular alcoves with Y-sorted shelf sprites, cool blue light, and interaction triggers
func _populate_alcoves() -> void:
	for i in range(alcove_count):
		var data: Dictionary = _artifact_data[i % _artifact_data.size()]
		var angle := lerp(-0.5, 0.5, float(i) / float(alcove_count - 1))

		# Position on shelf row
		var alcove_pos := Vector2(
			960.0 + sin(angle) * corridor_curve_radius * 0.5,
			450.0 + cos(angle) * 80.0
		)

		# 1. Recessed Alcove Shelf Node (inside Y-Sort layer)
		var shelf := Node2D.new()
		shelf.name = "AlcoveShelf_%d" % i
		shelf.position = alcove_pos
		_y_sort_layer.add_child(shelf)

		# 2. Cool Blue Interior Light (#AEEEEE) inside recessed niche
		var alcove_light: Node2D
		if get_node_or_null("/root/CatacombLighting"):
			alcove_light = CatacombLighting.create_crystal_light(alcove_light_color, alcove_light_energy, alcove_pos, 0.0)
		else:
			var pl := PointLight2D.new()
			pl.color = alcove_light_color
			pl.energy = alcove_light_energy
			pl.position = alcove_pos
			pl.enabled = true
			alcove_light = pl
		add_child(alcove_light)

		# 3. Artifact Examine Point (Area2D trigger)
		var area := Area2D.new()
		area.name = "ExaminePoint_%s" % data["id"]
		area.position = alcove_pos

		var col := CollisionShape2D.new()
		var shape := CircleShape2D.new()
		shape.radius = 60.0
		col.shape = shape
		area.add_child(col)

		area.set_meta("artifact_data", data)
		area.body_entered.connect(_on_artifact_area_entered.bind(area))
		area.body_exited.connect(_on_artifact_area_exited.bind(area))

		add_child(area)


func _on_artifact_area_entered(_body: Node, area: Area2D) -> void:
	_active_artifact = area


func _on_artifact_area_exited(_body: Node, area: Area2D) -> void:
	if _active_artifact == area:
		_active_artifact = null


func _trigger_active_interaction() -> void:
	if _active_artifact == null:
		return

	var data: Dictionary = _active_artifact.get_meta("artifact_data")
	artifact_examined.emit(data["id"], data["name"], data["desc"])
	_show_examine_dialog(data["name"], data["desc"])


## Builds and displays artifact examine dialog overlay
func _setup_examine_ui() -> void:
	_examine_ui = CanvasLayer.new()
	_examine_ui.name = "ExamineUI"
	_examine_ui.visible = false
	add_child(_examine_ui)

	var panel := PanelContainer.new()
	panel.name = "ExaminePanel"
	panel.anchor_left = 0.25
	panel.anchor_top = 0.7
	panel.anchor_right = 0.75
	panel.anchor_bottom = 0.95
	_examine_ui.add_child(panel)

	var margin := MarginContainer.new()
	margin.name = "MarginContainer"
	margin.add_theme_constant_override("margin_left", 20)
	margin.add_theme_constant_override("margin_top", 20)
	margin.add_theme_constant_override("margin_right", 20)
	margin.add_theme_constant_override("margin_bottom", 20)
	panel.add_child(margin)

	var vbox := VBoxContainer.new()
	vbox.name = "DialogVBox"
	margin.add_child(vbox)

	var title_lbl := Label.new()
	title_lbl.name = "TitleLabel"
	title_lbl.add_theme_color_override("font_color", Color("64fdfd"))
	vbox.add_child(title_lbl)

	var desc_lbl := Label.new()
	desc_lbl.name = "DescLabel"
	desc_lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
	vbox.add_child(desc_lbl)


func _show_examine_dialog(title: String, desc: String) -> void:
	var panel := _examine_ui.get_node("ExaminePanel")
	var title_lbl: Label = panel.get_node("MarginContainer/DialogVBox/TitleLabel")
	var desc_lbl: Label = panel.get_node("MarginContainer/DialogVBox/DescLabel")

	title_lbl.text = title
	desc_lbl.text = desc
	_examine_ui.visible = true

	# Auto hide after 4 seconds or next click
	var tw := create_tween()
	tw.tween_interval(4.0)
	tw.tween_callback(func(): _examine_ui.visible = false)
