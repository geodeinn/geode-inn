## geode_cave.gd
## Reward room script for Geode Inn.
## Features a glowing central geode, warm torch lighting, shallow water pool with reflection shader,
## smooth pebble floor, and a stone collection reward system with Mohs hardness audio chimes.
extends Node2D

# Designer-tweakable parameters
@export var geode_position: Vector2 = Vector2(500, 320)
@export var geode_light_color: Color = CatacombLighting.COLOR_COOL_GEODE_BLUE # #AACCFF
@export var geode_light_energy: float = 1.2
@export var geode_light_radius: float = 2.5

@export var torch_position: Vector2 = Vector2(950, 280)
@export var torch_light_color: Color = CatacombLighting.COLOR_WARM_TORCH_ORANGE # #FF9900
@export var torch_light_energy: float = 0.6

@export var water_pool_bounds: Rect2 = Rect2(200, 480, 750, 160)
@export var pebble_floor_color: Color = CatacombLighting.COLOR_STONE_BEIGE # #B9A89A

# Signals
signal gem_added_to_geode(stone_name: String, mohs_hardness: float)

# Node references
var _geode_light: PointLight2D
var _torch_light: PointLight2D
var _geode_gems_container: Node2D
var _water_sprite: ColorRect
var _canvas_modulate: CanvasModulate
var _collected_stones: Array[Dictionary] = []


func _ready() -> void:
	_setup_atmosphere()
	_setup_lights()
	_setup_water_pool()
	_setup_pebble_floor()
	_setup_geode_display()


func _process(_delta: float) -> void:
	# Keep runtime checks safe and perform optional dynamic environment updates
	pass


func _setup_atmosphere() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	add_child(_canvas_modulate)
	CatacombLighting.apply_zone_atmosphere("geode_cave", _canvas_modulate)
	
	var mist := CatacombLighting.create_mist_particles()
	mist.position = Vector2(640, 360)
	add_child(mist)


func _setup_lights() -> void:
	# 1. Large central geode glowing cool blue-white (#AACCFF, energy 1.2, large radius)
	_geode_light = PointLight2D.new()
	_geode_light.name = "GeodeCentralLight"
	_geode_light.color = geode_light_color
	_geode_light.energy = geode_light_energy
	_geode_light.position = geode_position
	_geode_light.texture = CatacombLighting._generate_radial_light_texture(512)
	_geode_light.texture_scale = geode_light_radius
	_geode_light.enabled = true
	add_child(_geode_light)
	
	# 2. Warm torch light on right side (#FF9900, energy 0.6)
	_torch_light = CatacombLighting.create_torch_light(
		torch_light_color,
		torch_light_energy,
		torch_position
	)
	_torch_light.name = "RightSideTorch"
	add_child(_torch_light)


func _setup_water_pool() -> void:
	# Shallow water pool with reflection shader from CatacombLighting
	_water_sprite = ColorRect.new()
	_water_sprite.name = "ShallowWaterPool"
	_water_sprite.position = water_pool_bounds.position
	_water_sprite.size = water_pool_bounds.size
	_water_sprite.material = CatacombLighting.create_water_reflection()
	add_child(_water_sprite)


func _setup_pebble_floor() -> void:
	# Smooth pebble floor node representation
	var pebble_floor := Node2D.new()
	pebble_floor.name = "SmoothPebbleFloor"
	pebble_floor.modulate = pebble_floor_color
	add_child(pebble_floor)


func _setup_geode_display() -> void:
	# Container node inside geode where gems appear as player collects stones
	_geode_gems_container = Node2D.new()
	_geode_gems_container.name = "GeodeGemsContainer"
	_geode_gems_container.position = geode_position
	add_child(_geode_gems_container)


## Reward System: Adds a collected stone/gem sprite into the geode, plays sound chime based on Mohs hardness.
## Uses epilepsy-safe, non-assertive Tween animations.
func add_collected_stone(stone_name: String, mohs_hardness: float, gem_color: Color = Color.CYAN) -> void:
	mohs_hardness = clampf(mohs_hardness, 1.0, 10.0)
	_collected_stones.append({"name": stone_name, "hardness": mohs_hardness, "color": gem_color})
	
	# Create new Gem Sprite inside geode container
	var gem_sprite := Sprite2D.new()
	gem_sprite.name = "Gem_" + stone_name.validate_filename()
	gem_sprite.modulate = gem_color
	gem_sprite.modulate.a = 0.0 # Start invisible for smooth fade-in
	
	# Position gems in gentle circular cluster inside geode center
	var angle := randf() * TAU
	var radius := randf_range(10.0, 60.0)
	gem_sprite.position = Vector2(cos(angle), sin(angle)) * radius
	gem_sprite.scale = Vector2(0.5, 0.5)
	_geode_gems_container.add_child(gem_sprite)
	
	# Gentle, non-assertive Tween animation (epilepsy-safe, soft ease-in-out)
	var tween := create_tween().set_parallel(true)
	tween.tween_property(gem_sprite, "modulate:a", 1.0, 1.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(gem_sprite, "scale", Vector2(1.0, 1.0), 1.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	
	# Play chime audio mapped to Mohs hardness (1-10 mapped to 200Hz - 800Hz)
	play_mohs_chime(mohs_hardness)
	
	gem_added_to_geode.emit(stone_name, mohs_hardness)


## Synthesizes and plays a chime audio tone corresponding to Mohs hardness scale.
## Maps 1.0 -> 200 Hz (deep resonant chime) up to 10.0 -> 800 Hz (crystalline high chime).
func play_mohs_chime(mohs_hardness: float) -> void:
	var freq: float = lerp(200.0, 800.0, (mohs_hardness - 1.0) / 9.0)
	var sample_rate := 44100
	var duration := 1.2
	var num_samples := int(sample_rate * duration)
	var pcm_data := PackedByteArray()
	pcm_data.resize(num_samples * 2)
	
	for i in range(num_samples):
		var t := float(i) / float(sample_rate)
		# Smooth exponential decay envelope with soft attack
		var env := exp(-4.0 * t) * minf(t * 120.0, 1.0)
		# Fundamental sine wave + subtle 2nd harmonic (warm metallic chime tone)
		var wave := (sin(TAU * freq * t) * 0.75 + sin(TAU * freq * 2.01 * t) * 0.25) * env
		var sample_int := int(clampf(wave, -1.0, 1.0) * 32767.0)
		pcm_data.encode_s16(i * 2, sample_int)
		
	var wav := AudioStreamWav.new()
	wav.format = AudioStreamWav.FORMAT_16_BITS
	wav.mix_rate = sample_rate
	wav.data = pcm_data
	
	var player := AudioStreamPlayer.new()
	add_child(player)
	player.stream = wav
	player.play()
	player.finished.connect(player.queue_free)
