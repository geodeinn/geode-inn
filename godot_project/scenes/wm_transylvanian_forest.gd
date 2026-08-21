## wm_transylvanian_forest.gd
## Dark misty Transylvanian Forest scene script for Geode Inn.
## Features deep forest canvas modulate (#1A2218), soft moonlight through canopy (#5A7A6A),
## dense low fog particles, ancient twisted root trees, gently pulsing warm fireflies (#FFD080),
## Romani caravan campsite with music enchantment mechanic, and frequent owl narrative sightings.
extends Node2D

# Designer-tweakable parameters
@export var canvas_modulate_color: Color = Color("#1A2218") # Deep forest midnight green
@export var moonlight_color: Color = Color("#5A7A6A") # Soft pale teal moonlight filtering through leaves
@export var moonlight_energy: float = 0.4

@export var firefly_color: Color = Color("#FFD080") # Warm yellow gentle glow
@export var firefly_count: int = 12
@export var firefly_pulse_period: float = 3.0 # Safe 3-second gentle sine pulse (Epilepsy safe)

@export var owl_spawn_chance: float = 0.75 # Narrative spine owl frequency
@export var caravan_position: Vector2 = Vector2(640, 420)

# Signals
signal music_enchantment_started()
signal owl_sighted(owl_id: String)

# Internal references
var _canvas_modulate: CanvasModulate
var _moonlight: DirectionalLight2D
var _firefly_lights: Array[PointLight2D] = []
var _fog_particles: CPUParticles2D
var _caravan_area: Area2D
var _owl_area: Area2D
var _time_passed: float = 0.0


func _ready() -> void:
	_setup_atmosphere()
	_setup_canopy_moonlight()
	_setup_dense_low_fog()
	_setup_warm_fireflies()
	_setup_romani_caravan_campsite()
	_setup_owl_narrative_sightings()


func _process(delta: float) -> void:
	_time_passed += delta
	_update_firefly_pulsing()


func _setup_atmosphere() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	_canvas_modulate.color = canvas_modulate_color
	add_child(_canvas_modulate)


func _setup_canopy_moonlight() -> void:
	_moonlight = DirectionalLight2D.new()
	_moonlight.name = "TransylvanianMoonlight"
	_moonlight.color = moonlight_color
	_moonlight.energy = moonlight_energy
	_moonlight.rotation = deg_to_rad(70.0)
	add_child(_moonlight)


func _setup_dense_low_fog() -> void:
	# Dense, low-hanging forest fog hovering near the twisted roots
	_fog_particles = CPUParticles2D.new()
	_fog_particles.name = "DenseLowForestFog"
	_fog_particles.amount = 70
	_fog_particles.lifetime = 10.0
	_fog_particles.preprocess = 5.0
	_fog_particles.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	_fog_particles.emission_rect_extents = Vector2(650, 100)
	_fog_particles.position = Vector2(640, 580)
	_fog_particles.direction = Vector2(0.5, -0.1)
	_fog_particles.spread = 20.0
	_fog_particles.gravity = Vector2(0, 0)
	_fog_particles.initial_velocity_min = 5.0
	_fog_particles.initial_velocity_max = 15.0
	_fog_particles.scale_amount_min = 20.0
	_fog_particles.scale_amount_max = 45.0
	_fog_particles.color = Color(0.4, 0.5, 0.45, 0.22)
	add_child(_fog_particles)


func _setup_warm_fireflies() -> void:
	# Warm yellow fireflies pulsing slowly in forest clearings (safe sine wave, period 3s)
	for i in range(firefly_count):
		var pos := Vector2(
			150 + randf() * 980,
			250 + randf() * 300
		)
		var light := PointLight2D.new()
		light.name = "WarmFireflyLight_%d" % i
		light.color = firefly_color
		light.energy = 0.5
		light.position = pos
		light.texture_scale = 1.0
		add_child(light)
		_firefly_lights.append(light)


func _update_firefly_pulsing() -> void:
	# Gentle sine modulation: pulse between 0.2 and 0.8 energy over 3s
	var phase := _time_passed * (TAU / firefly_pulse_period)
	for i in range(_firefly_lights.size()):
		var light := _firefly_lights[i]
		if is_instance_valid(light):
			# Offset phase per firefly so they don't pulse completely in lockstep
			var offset := float(i) * 0.5
			var val := (sin(phase + offset) + 1.0) * 0.5
			light.energy = lerp(0.2, 0.8, val)


func _setup_romani_caravan_campsite() -> void:
	# Campsite in clearing triggering the Music Enchantment mechanic
	_caravan_area = Area2D.new()
	_caravan_area.name = "RomaniCaravanCampsiteArea"
	_caravan_area.position = caravan_position
	
	var col := CollisionShape2D.new()
	var circle := CircleShape2D.new()
	circle.radius = 80.0
	col.shape = circle
	_caravan_area.add_child(col)
	
	_caravan_area.body_entered.connect(func(body: Node) -> void:
		print("[TransylvanianForest] Romani caravan campsite approached by %s -> Music Enchantment mechanic activated!" % body.name)
		music_enchantment_started.emit()
	)
	add_child(_caravan_area)


func _setup_owl_narrative_sightings() -> void:
	# Frequent owl sightings connecting to the main narrative spine
	if randf() <= owl_spawn_chance:
		_owl_area = Area2D.new()
		_owl_area.name = "ForestOwlPerchArea"
		_owl_area.position = Vector2(400, 200)
		
		var col := CollisionShape2D.new()
		var circle := CircleShape2D.new()
		circle.radius = 60.0
		col.shape = circle
		_owl_area.add_child(col)
		
		_owl_area.body_entered.connect(func(body: Node) -> void:
			print("[TransylvanianForest] Wise forest owl observed perching on ancient root tree near %s (Hoo-hoot!)" % body.name)
			owl_sighted.emit("TransylvanianOwl_01")
		)
		add_child(_owl_area)
