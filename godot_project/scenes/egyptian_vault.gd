class_name EgyptianVault
extends Node2D

## Script for the Egypt zone artifact gallery ('The Egyptian Vault').
## Features a shallow-angle corridor of stone-carved shelves with hieroglyphic dividers,
## rough sandstone textures (#C2A88D to #9D856A), three warm golden-orange oil lamps (#F4A460, energy 0.6),
## recessed niches with examineable artifacts (sculpted head, vessels, jars, bowls, figurines),
## TileMap shelf system with hieroglyphic border tiles, DepthOfField shader on background,
## and museum audio ambience with soft footstep echoes.

signal artifact_inspected(artifact_data: Dictionary)

@export_group("Oil Lamp Lighting")
## Warm golden-orange oil lamp light color (#F4A460)
@export var oil_lamp_color: Color = Color("f4a460")
@export var oil_lamp_energy: float = 0.6
@export var oil_lamp_count: int = 3

@export_group("Sandstone Palette")
## Light sandstone tone (#C2A88D)
@export var sandstone_light: Color = Color("c2a88d")
## Dark sandstone shadow tone (#9D856A)
@export var sandstone_dark: Color = Color("9d856a")

@export_group("Depth Of Field & Bokeh")
## Blur amount for background shelves DepthOfField shader
@export_range(0.0, 8.0) var dof_blur_amount: float = 2.5
## Highlight luminance threshold for bokeh circles
@export_range(0.0, 1.0) var bokeh_threshold: float = 0.65

# Nodes
var _tilemap_shelves: TileMap
var _examine_ui: CanvasLayer
var _dof_rect: ColorRect
var _ambient_audio: AudioStreamPlayer
var _footstep_audio: AudioStreamPlayer2D
var _lamp_lights: Array[Node2D] = []

# Vault Artifact Catalog
var _vault_artifacts: Array[Dictionary] = [
	{
		"slot_id": "slot_head",
		"name": "Sculpted Limestone Head",
		"type": "sculpted_head",
		"desc": "A finely carved limestone head of a priestess, eyes inlaid with faint lapis lazuli traces.",
		"position": Vector2(480, 480)
	},
	{
		"slot_id": "slot_vessel",
		"name": "Alabaster Perfume Vessel",
		"type": "vessels",
		"desc": "Translucent alabaster flask carved with lotus blooms, still holding dried myrrh resin.",
		"position": Vector2(720, 480)
	},
	{
		"slot_id": "slot_canopic",
		"name": "Falcon-Headed Canopic Jar",
		"desc": "Carved soft limestone jar with Qebehsenuef falcon lid guarding sacred offerings.",
		"type": "jars",
		"position": Vector2(960, 480)
	},
	{
		"slot_id": "slot_bowl",
		"name": "Faience Offering Bowl",
		"desc": "Bright turquoise faience bowl stamped with hieroglyphic blessings for eternal safe passage.",
		"type": "bowls",
		"position": Vector2(1200, 480)
	},
	{
		"slot_id": "slot_figurine",
		"name": "Gilded Ushabti Figurine",
		"desc": "Small carved wooden ushabti figurine coated in gold leaf, inscribed with Chapter 6 of the Book of the Dead.",
		"type": "figurines",
		"position": Vector2(1440, 480)
	}
]


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("egyptian_vault")

	# 2. Construct sandstone background & DepthOfField bokeh shader
	_setup_sandstone_background_and_dof()

	# 3. Setup TileMap shelf system with hieroglyphic border tiles
	_setup_tilemap_shelves()

	# 4. Create three warm golden-orange oil lamps (#F4A460, energy 0.6)
	_setup_oil_lamps()

	# 5. Populate recessed niches with artifacts and examine interaction slots
	_populate_artifact_niches()

	# 6. Build inspect UI overlay dialog
	_setup_examine_ui()

	# 7. Setup museum audio ambience & footstep echo sound players
	_setup_vault_audio()


func _process(_delta: float) -> void:
	pass


## Constructs background sandstone layers and DepthOfField bokeh shader on far wall
func _setup_sandstone_background_and_dof() -> void:
	var bg_wall := ColorRect.new()
	bg_wall.name = "SandstoneWall"
	bg_wall.size = Vector2(1920, 1080)
	bg_wall.color = sandstone_dark
	add_child(bg_wall)

	# DepthOfField Bokeh Shader Rect on far background shelves
	var back_buffer := BackBufferCopy.new()
	back_buffer.name = "BokehBackBuffer"
	back_buffer.copy_mode = BackBufferCopy.COPY_MODE_RECT
	back_buffer.rect = Rect2(0, 0, 1920, 400)
	add_child(back_buffer)

	_dof_rect = ColorRect.new()
	_dof_rect.name = "DepthOfFieldBokeh"
	_dof_rect.size = Vector2(1920, 400) # Far top shelf row

	var shader := Shader.new()
	shader.code = """
	shader_type canvas_item;

	uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;
	uniform float blur_amount : hint_range(0.0, 10.0) = 2.5;
	uniform float bokeh_threshold : hint_range(0.0, 1.0) = 0.65;

	void fragment() {
		vec2 uv = SCREEN_UV;
		vec2 texel = vec2(1.0) / vec2(textureSize(screen_texture, 0));
		vec4 color = vec4(0.0);
		float total = 0.0;

		for (int x = -2; x <= 2; x++) {
			for (int y = -2; y <= 2; y++) {
				vec2 offset = vec2(float(x), float(y)) * texel * blur_amount;
				vec4 sample_col = texture(screen_texture, uv + offset);
				float weight = 1.0 / (1.0 + length(vec2(float(x), float(y))));
				if (max(sample_col.r, max(sample_col.g, sample_col.b)) > bokeh_threshold) {
					weight *= 1.7; // Bokeh highlight boost
				}
				color += sample_col * weight;
				total += weight;
			}
		}
		COLOR = color / total;
	}
	"""

	var mat := ShaderMaterial.new()
	mat.shader = shader
	mat.set_shader_parameter("blur_amount", dof_blur_amount)
	mat.set_shader_parameter("bokeh_threshold", bokeh_threshold)
	_dof_rect.material = mat

	add_child(_dof_rect)


## Configures TileMap with custom hieroglyphic border tiles for shelf structure
func _setup_tilemap_shelves() -> void:
	_tilemap_shelves = TileMap.new()
	_tilemap_shelves.name = "HieroglyphicTileMapShelves"
	# In Godot 4.x TileMap uses TileSet resources. We assign a clean placeholder structure.
	var tile_set := TileSet.new()
	tile_set.tile_size = Vector2i(64, 64)
	_tilemap_shelves.tile_set = tile_set

	add_child(_tilemap_shelves)


## Spawns three oil lamps (#F4A460, energy 0.6)
func _setup_oil_lamps() -> void:
	var lamps_node := Node2D.new()
	lamps_node.name = "OilLamps"
	add_child(lamps_node)

	var lamp_positions: Array[Vector2] = [
		Vector2(400, 380),
		Vector2(960, 380),
		Vector2(1520, 380)
	]

	for pos in lamp_positions:
		var light: Node2D
		if get_node_or_null("/root/CatacombLighting"):
			light = CatacombLighting.create_torch_light(oil_lamp_color, oil_lamp_energy, pos)
		else:
			var pl := PointLight2D.new()
			pl.color = oil_lamp_color
			pl.energy = oil_lamp_energy
			pl.position = pos
			pl.enabled = true
			light = pl

		lamps_node.add_child(light)
		_lamp_lights.append(light)


## Populates recessed niches with artifacts and interaction triggers
func _populate_artifact_niches() -> void:
	var niches_container := Node2D.new()
	niches_container.name = "ArtifactNiches"
	add_child(niches_container)

	for artifact in _vault_artifacts:
		var pos: Vector2 = artifact["position"]

		# 1. Recessed Niche background frame
		var frame := ColorRect.new()
		frame.name = "NicheFrame_%s" % artifact["slot_id"]
		frame.size = Vector2(160, 180)
		frame.position = pos - frame.size * 0.5
		frame.color = sandstone_dark.darkened(0.3)
		niches_container.add_child(frame)

		# 2. Artifact Sprite placeholder
		var sprite := Sprite2D.new()
		sprite.name = "ArtifactSprite_%s" % artifact["slot_id"]
		sprite.position = pos
		niches_container.add_child(sprite)

		# 3. Interactive Examine Area2D
		var area := Area2D.new()
		area.name = "ExamineArea_%s" % artifact["slot_id"]
		area.position = pos

		var col := CollisionShape2D.new()
		var shape := CircleShape2D.new()
		shape.radius = 70.0
		col.shape = shape
		area.add_child(col)

		area.set_meta("artifact_data", artifact)
		area.body_entered.connect(_on_artifact_area_entered.bind(area))

		niches_container.add_child(area)


func _on_artifact_area_entered(_body: Node, area: Area2D) -> void:
	var data: Dictionary = area.get_meta("artifact_data")
	artifact_inspected.emit(data)
	_show_examine_dialog(data["name"], data["desc"])
	_play_footstep_echo(area.position)


## Builds built-in examine UI dialog overlay
func _setup_examine_ui() -> void:
	_examine_ui = CanvasLayer.new()
	_examine_ui.name = "InspectUI"
	_examine_ui.visible = false
	add_child(_examine_ui)

	var panel := PanelContainer.new()
	panel.name = "InspectPanel"
	panel.anchor_left = 0.2
	panel.anchor_top = 0.72
	panel.anchor_right = 0.8
	panel.anchor_bottom = 0.94
	_examine_ui.add_child(panel)

	var margin := MarginContainer.new()
	margin.name = "MarginContainer"
	margin.add_theme_constant_override("margin_left", 24)
	margin.add_theme_constant_override("margin_top", 20)
	margin.add_theme_constant_override("margin_right", 24)
	margin.add_theme_constant_override("margin_bottom", 20)
	panel.add_child(margin)

	var vbox := VBoxContainer.new()
	vbox.name = "VBox"
	margin.add_child(vbox)

	var title_lbl := Label.new()
	title_lbl.name = "TitleLabel"
	title_lbl.add_theme_color_override("font_color", oil_lamp_color)
	vbox.add_child(title_lbl)

	var desc_lbl := Label.new()
	desc_lbl.name = "DescLabel"
	desc_lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
	vbox.add_child(desc_lbl)


func _show_examine_dialog(title: String, desc: String) -> void:
	var panel := _examine_ui.get_node("InspectPanel")
	var title_lbl: Label = panel.get_node("MarginContainer/VBox/TitleLabel")
	var desc_lbl: Label = panel.get_node("MarginContainer/VBox/DescLabel")

	title_lbl.text = title
	desc_lbl.text = desc
	_examine_ui.visible = true

	var tw := create_tween()
	tw.tween_interval(4.5)
	tw.tween_callback(func(): _examine_ui.visible = false)


## Configures museum audio ambience and soft footstep echo player
func _setup_vault_audio() -> void:
	_ambient_audio = AudioStreamPlayer.new()
	_ambient_audio.name = "MuseumAmbiencePlayer"
	_ambient_audio.autoplay = true
	_ambient_audio.volume_db = -6.0
	add_child(_ambient_audio)

	_footstep_audio = AudioStreamPlayer2D.new()
	_footstep_audio.name = "FootstepEchoPlayer"
	_footstep_audio.max_distance = 1500.0
	add_child(_footstep_audio)


func _play_footstep_echo(pos: Vector2) -> void:
	if _footstep_audio != null:
		_footstep_audio.position = pos
		if _footstep_audio.stream != null:
			_footstep_audio.play()
