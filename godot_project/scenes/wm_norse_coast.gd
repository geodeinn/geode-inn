## wm_norse_coast.gd
## Rugged Norse Coastline scene script for Geode Inn.
## Features cool overcast coastal canvas modulate (#2A3540), overcast sky light (#6A8A9A),
## ocean waves shader, sea spray particles, longship docks with interactable boats (boat-building thatch construction),
## Viking NPCs, connection to Valhalla via Yggdrasil, and Charles NPC pestering Valkyries.
extends Node2D

# Designer-tweakable parameters
@export var canvas_modulate_color: Color = Color("#2A3540") # Fjords coastal darkness
@export var overcast_sky_color: Color = Color("#6A8A9A") # Cold ocean sky light
@export var overcast_sky_energy: float = 0.5

@export var charles_annoyance_level: float = 0.8 # Charles NPC Valkyrie pestering intensity
@export var boat_thatch_progress: float = 0.0 # Don't Starve style boat construction progress (0.0 to 1.0)

@export var target_yggdrasil_scene: String = "res://scenes/yggdrasil_valhalla.tscn"

# Signals
signal boat_building_interacted(current_progress: float)
signal charles_valkyrie_dialogue_triggered()
signal valhalla_passage_opened()

# Internal references
var _canvas_modulate: CanvasModulate
var _coastal_light: DirectionalLight2D
var _waves_rect: ColorRect
var _waves_shader_mat: ShaderMaterial
var _spray_particles: CPUParticles2D
var _charles_npc_area: Area2D
var _dock_boat_area: Area2D


func _ready() -> void:
	_setup_atmosphere()
	_setup_coastal_lighting()
	_setup_ocean_waves_shader()
	_setup_sea_spray_particles()
	_setup_longship_dock_boat_building()
	_setup_viking_npcs()
	_setup_charles_and_valkyries()


func _setup_atmosphere() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	_canvas_modulate.color = canvas_modulate_color
	add_child(_canvas_modulate)


func _setup_coastal_lighting() -> void:
	_coastal_light = DirectionalLight2D.new()
	_coastal_light.name = "NorseCoastalSun"
	_coastal_light.color = overcast_sky_color
	_coastal_light.energy = overcast_sky_energy
	_coastal_light.rotation = deg_to_rad(40.0)
	add_child(_coastal_light)


func _setup_ocean_waves_shader() -> void:
	# Custom ocean surface wave animation shader for fjord waters
	var shader := Shader.new()
	shader.code = """
shader_type canvas_item;

uniform vec4 water_deep : source_color = vec4(0.12, 0.20, 0.28, 0.85);
uniform vec4 foam_color : source_color = vec4(0.80, 0.90, 0.95, 0.90);
uniform float wave_speed : hint_range(0.2, 3.0) = 1.2;

void fragment() {
	vec2 uv = UV;
	float wave1 = sin(uv.x * 20.0 + TIME * wave_speed) * 0.02;
	float wave2 = cos(uv.y * 15.0 - TIME * wave_speed * 0.8) * 0.015;
	
	float crest = smoothstep(0.48, 0.52, sin((uv.x + wave1) * 35.0 + TIME * 2.0));
	vec3 col = mix(water_deep.rgb, foam_color.rgb, crest * 0.35);
	
	COLOR = vec4(col, water_deep.a);
}
"""
	_waves_shader_mat = ShaderMaterial.new()
	_waves_shader_mat.shader = shader
	
	_waves_rect = ColorRect.new()
	_waves_rect.name = "FjordOceanWaves"
	_waves_rect.position = Vector2(0, 480)
	_waves_rect.size = Vector2(1280, 240)
	_waves_rect.material = _waves_shader_mat
	add_child(_waves_rect)


func _setup_sea_spray_particles() -> void:
	# Ocean mist and sea spray whipping off crashing fjord waves
	_spray_particles = CPUParticles2D.new()
	_spray_particles.name = "OceanSeaSpray"
	_spray_particles.amount = 60
	_spray_particles.lifetime = 3.0
	_spray_particles.preprocess = 2.0
	_spray_particles.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	_spray_particles.emission_rect_extents = Vector2(640, 20)
	_spray_particles.position = Vector2(640, 500)
	_spray_particles.direction = Vector2(0.2, -1.0)
	_spray_particles.gravity = Vector2(10.0, 40.0)
	_spray_particles.initial_velocity_min = 30.0
	_spray_particles.initial_velocity_max = 70.0
	_spray_particles.scale_amount_min = 2.0
	_spray_particles.scale_amount_max = 6.0
	_spray_particles.color = Color(0.88, 0.94, 0.98, 0.5)
	add_child(_spray_particles)


func _setup_longship_dock_boat_building() -> void:
	# Longship dock area where player constructs a boat (Don't Starve style thatch/wood crafting)
	_dock_boat_area = Area2D.new()
	_dock_boat_area.name = "LongshipDockCraftingArea"
	_dock_boat_area.position = Vector2(350, 460)
	
	var col := CollisionShape2D.new()
	var circle := CircleShape2D.new()
	circle.radius = 60.0
	col.shape = circle
	_dock_boat_area.add_child(col)
	
	_dock_boat_area.body_entered.connect(_on_boat_building_entered)
	add_child(_dock_boat_area)


func _setup_viking_npcs() -> void:
	var viking_container := Node2D.new()
	viking_container.name = "VikingNPCGathering"
	add_child(viking_container)


func _setup_charles_and_valkyries() -> void:
	# Charles NPC pestering Valkyries near the Yggdrasil bridge marker
	_charles_npc_area = Area2D.new()
	_charles_npc_area.name = "CharlesPesteringValkyriesArea"
	_charles_npc_area.position = Vector2(920, 380)
	
	var col := CollisionShape2D.new()
	var circle := CircleShape2D.new()
	circle.radius = 50.0
	col.shape = circle
	_charles_npc_area.add_child(col)
	
	_charles_npc_area.body_entered.connect(func(body: Node) -> void:
		print("[NorseCoast] Charles is pestering the Valkyries again! ('Excuse me, do you have a permit to fly?') - Triggered by %s" % body.name)
		charles_valkyrie_dialogue_triggered.emit()
	)
	add_child(_charles_npc_area)


func _on_boat_building_entered(body: Node) -> void:
	boat_thatch_progress = clampf(boat_thatch_progress + 0.25, 0.0, 1.0)
	print("[NorseCoast] Boat thatch construction progress updated by %s -> %.0f%%" % [body.name, boat_thatch_progress * 100.0])
	boat_building_interacted.emit(boat_thatch_progress)
	
	if boat_thatch_progress >= 1.0:
		print("[NorseCoast] Longship construction complete! Valhalla Yggdrasil passage unlocked.")
		valhalla_passage_opened.emit()
