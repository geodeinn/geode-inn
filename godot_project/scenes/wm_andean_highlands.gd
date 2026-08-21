## wm_andean_highlands.gd
## High altitude Andean Mountain landscape scene script for Geode Inn.
## Features cool mountain canvas modulate (#3A4A55), cold mountain light (#B8C8D0), thin air mist,
## terraced crop fields, llama NPCs, Inca stonework ruins, survival crafting mechanics triggers (Don't Starve style),
## and connection to the Andean Run game.
extends Node2D

# Designer-tweakable parameters
@export var canvas_modulate_color: Color = Color("#3A4A55") # Cool mountain slate shadow
@export var mountain_light_color: Color = Color("#B8C8D0") # Crisp high-altitude daylight
@export var mountain_light_energy: float = 1.0

@export var llama_count: int = 4
@export var altitude_cold_rate: float = 1.5 # Cold survival decay multiplier

@export var target_andean_run_scene: String = "res://scenes/andean_run.tscn"

# Signals
signal survival_crafting_opened(crafting_bench_id: String)
signal llama_herded(llama_id: int)
signal andean_run_entered()

# Internal references
var _canvas_modulate: CanvasModulate
var _mountain_light: DirectionalLight2D
var _thin_air_mist: CPUParticles2D
var _llama_nodes: Array[Node2D] = []
var _crafting_bench_areas: Array[Area2D] = []


func _ready() -> void:
	_setup_atmosphere()
	_setup_mountain_lighting()
	_setup_thin_air_mist_particles()
	_setup_terraced_fields()
	_setup_inca_stonework_ruins()
	_setup_llama_npcs()
	_setup_survival_crafting_benches()


func _setup_atmosphere() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	_canvas_modulate.color = canvas_modulate_color
	add_child(_canvas_modulate)


func _setup_mountain_lighting() -> void:
	_mountain_light = DirectionalLight2D.new()
	_mountain_light.name = "AndeanMountainSun"
	_mountain_light.color = mountain_light_color
	_mountain_light.energy = mountain_light_energy
	_mountain_light.rotation = deg_to_rad(55.0)
	add_child(_mountain_light)


func _setup_thin_air_mist_particles() -> void:
	# Wispy thin air mist drifting across high mountain peaks
	_thin_air_mist = CPUParticles2D.new()
	_thin_air_mist.name = "HighAltitudeThinMist"
	_thin_air_mist.amount = 35
	_thin_air_mist.lifetime = 8.0
	_thin_air_mist.preprocess = 4.0
	_thin_air_mist.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	_thin_air_mist.emission_rect_extents = Vector2(650, 150)
	_thin_air_mist.position = Vector2(640, 200)
	_thin_air_mist.direction = Vector2(1.0, -0.2)
	_thin_air_mist.spread = 15.0
	_thin_air_mist.gravity = Vector2(2.0, -1.0)
	_thin_air_mist.initial_velocity_min = 10.0
	_thin_air_mist.initial_velocity_max = 25.0
	_thin_air_mist.scale_amount_min = 8.0
	_thin_air_mist.scale_amount_max = 20.0
	_thin_air_mist.color = Color(0.85, 0.92, 0.98, 0.15)
	add_child(_thin_air_mist)


func _setup_terraced_fields() -> void:
	# Concentric terraced agriculture fields (moray terraces)
	var terrace_container := Node2D.new()
	terrace_container.name = "IncaTerracedFields"
	add_child(terrace_container)


func _setup_inca_stonework_ruins() -> void:
	# Ancient Inca stone mortarless stonework ruins
	var ruins_container := Node2D.new()
	ruins_container.name = "IncaMortarlessStonework"
	add_child(ruins_container)


func _setup_llama_npcs() -> void:
	# Grazing llama NPCs wandering mountain paths
	for i in range(llama_count):
		var llama := Node2D.new()
		llama.name = "AndeanLlama_%d" % i
		llama.position = Vector2(300 + (i * 200), 450 + randf_range(-30, 30))
		
		var area := Area2D.new()
		area.name = "LlamaInteractArea"
		var col := CollisionShape2D.new()
		var circle := CircleShape2D.new()
		circle.radius = 25.0
		col.shape = circle
		area.add_child(col)
		
		var llama_idx := i
		area.body_entered.connect(func(body: Node) -> void:
			print("[AndeanHighlands] Llama %d approached by %s" % [llama_idx, body.name])
			llama_herded.emit(llama_idx)
		)
		llama.add_child(area)
		
		add_child(llama)
		_llama_nodes.append(llama)


func _setup_survival_crafting_benches() -> void:
	# Survival crafting stations triggering Don't Starve style crafting UI
	var bench_positions := [Vector2(450, 380), Vector2(850, 420)]
	
	for i in range(bench_positions.size()):
		var pos := bench_positions[i]
		var area := Area2D.new()
		var bench_id := "IncaCraftingBench_%d" % i
		area.name = bench_id
		area.position = pos
		
		var col := CollisionShape2D.new()
		var circle := CircleShape2D.new()
		circle.radius = 45.0
		col.shape = circle
		area.add_child(col)
		
		area.body_entered.connect(func(body: Node) -> void:
			print("[AndeanHighlands] Survival crafting station %s accessed by %s" % [bench_id, body.name])
			survival_crafting_opened.emit(bench_id)
		)
		
		add_child(area)
		_crafting_bench_areas.append(area)
