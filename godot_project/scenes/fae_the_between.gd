## fae_the_between.gd
## Liminal floating landmasses between Seelie and Unseelie court territories in the Fae Realm.
## Features desaturated twilight sky, spirit lanterns along floating paths (#A8C8E8), horizontal drifting mist,
## birch tree silhouettes, water mirror reflections, and dynamic environment shifts based on player Fae reputation.
extends Node2D

# Designer-tweakable parameters
@export_range(-1.0, 1.0) var player_reputation: float = 0.0 # -1.0 = Pure Unseelie, +1.0 = Pure Seelie
@export var canvas_modulate_base: Color = Color("#4A5868") # Neutral desaturated twilight slate
@export var seelie_tint_modifier: Color = Color("#201505") # Warmer golden offset
@export var unseelie_tint_modifier: Color = Color("#051220") # Cooler indigo offset

@export var spirit_lantern_color: Color = Color("#A8C8E8") # Ethereal pale blue
@export var spirit_lantern_energy: float = 0.7
@export var lantern_positions: Array[Vector2] = [
	Vector2(200, 450),
	Vector2(420, 380),
	Vector2(640, 420),
	Vector2(860, 360),
	Vector2(1080, 440)
]

# Signals
signal reputation_changed(new_reputation: float)

# Internal nodes
var _canvas_modulate: CanvasModulate
var _lantern_lights: Array[PointLight2D] = []
var _mist_particles: CPUParticles2D
var _water_mirror_rect: ColorRect
var _water_mirror_mat: ShaderMaterial
var _sky_background_rect: ColorRect


func _ready() -> void:
	_setup_twilight_background()
	_setup_canvas_modulate()
	_setup_spirit_lanterns()
	_setup_horizontal_mist()
	_setup_water_mirror()
	_setup_birch_silhouettes()
	update_reputation(player_reputation)


func _setup_twilight_background() -> void:
	# Desaturated gradient twilight sky background
	_sky_background_rect = ColorRect.new()
	_sky_background_rect.name = "DesaturatedTwilightSky"
	_sky_background_rect.size = Vector2(1280, 720)
	_sky_background_rect.color = Color("#2D3845")
	add_child(_sky_background_rect)


func _setup_canvas_modulate() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	_canvas_modulate.color = canvas_modulate_base
	add_child(_canvas_modulate)


func _setup_spirit_lanterns() -> void:
	# Spirit lanterns guiding the player along floating stone bridges
	for i in range(lantern_positions.size()):
		var light := CatacombLighting.create_crystal_light(
			spirit_lantern_color,
			spirit_lantern_energy,
			lantern_positions[i],
			0.25 # 4 second pulse period (Epilepsy safe)
		)
		light.name = "SpiritLantern_%d" % i
		add_child(light)
		_lantern_lights.append(light)


func _setup_horizontal_mist() -> void:
	# Mist particles drifting horizontally between floating islands
	_mist_particles = CPUParticles2D.new()
	_mist_particles.name = "LiminalHorizontalMist"
	_mist_particles.amount = 60
	_mist_particles.lifetime = 10.0
	_mist_particles.preprocess = 5.0
	_mist_particles.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	_mist_particles.emission_rect_extents = Vector2(50, 360)
	_mist_particles.position = Vector2(-50, 360)
	_mist_particles.direction = Vector2(1.0, 0.0) # Horizontal drift
	_mist_particles.spread = 10.0
	_mist_particles.gravity = Vector2(0, 0)
	_mist_particles.initial_velocity_min = 15.0
	_mist_particles.initial_velocity_max = 35.0
	_mist_particles.scale_amount_min = 15.0
	_mist_particles.scale_amount_max = 35.0
	_mist_particles.color = Color(0.65, 0.75, 0.85, 0.15)
	add_child(_mist_particles)


func _setup_water_mirror() -> void:
	# Mirror water surface beneath floating landmasses reflecting sky and lanterns
	_water_mirror_mat = CatacombLighting.create_water_reflection()
	_water_mirror_mat.set_shader_parameter("water_tint", Vector4(0.25, 0.32, 0.40, 0.45))
	_water_mirror_mat.set_shader_parameter("wave_speed", 0.3)
	
	_water_mirror_rect = ColorRect.new()
	_water_mirror_rect.name = "LiminalWaterMirror"
	_water_mirror_rect.position = Vector2(0, 520)
	_water_mirror_rect.size = Vector2(1280, 200)
	_water_mirror_rect.material = _water_mirror_mat
	add_child(_water_mirror_rect)


func _setup_birch_silhouettes() -> void:
	# Birch tree silhouette nodes along island edges
	var tree_container := Node2D.new()
	tree_container.name = "BirchTreeSilhouettes"
	add_child(tree_container)


## Dynamically adjusts environmental temperature and light based on player's Fae reputation
## player_rep > 0: Seelie warm amber golden bias
## player_rep < 0: Unseelie cool indigo violet bias
func update_reputation(rep: float) -> void:
	player_reputation = clampf(rep, -1.0, 1.0)
	reputation_changed.emit(player_reputation)
	
	if not is_instance_valid(_canvas_modulate):
		return
		
	var target_color := canvas_modulate_base
	if player_reputation > 0.0:
		# Shift towards warm Seelie amber
		target_color = canvas_modulate_base + (seelie_tint_modifier * player_reputation)
	else:
		# Shift towards cool Unseelie indigo
		target_color = canvas_modulate_base + (unseelie_tint_modifier * absf(player_reputation))
		
	_canvas_modulate.color = target_color
	print("[TheBetween] Dynamic environment updated for reputation %.2f -> CanvasModulate: %s" % [player_reputation, target_color.to_html()])
