extends Node
## FizgigLoader.gd (Autoload Singleton)
## The universal loading screen system for the Geode Inn.
## Tumble and the brownies (Franjean/Rool energy) provide comic relief
## during all zone transitions. NOT fizgigs in overalls.

# === Loading Screen Scenes ===
# In production, these would be pre-loaded PackedScenes.
# For now, we use programmatic drawing + the terminal-based animation system.

var _is_loading: bool = false
var _current_zone: String = ""
var _loading_progress: float = 0.0

# Zone-specific fizgig scenarios (from the design doc)
const LOADING_SCENARIOS := {
	"main_floor": "Brownies dropping wrenches — Brindle fumbles a pot lid, Cobble catches it, Thatch pretends not to notice.",
	"standing_stones": "Tumble rolls into a henge stone and bounces off, confused. Brindle tries to measure it with a tiny ruler.",
	"tomb_tunnel": "Brownies with tiny flashlights looking scared. Tumble gets stuck in a canopic jar.",
	"andean_run": "Tumble tries to climb a causeway step, rolls back down. Brownies form a ladder that's too short.",
	"monster_of_the_deep": "Tumble falls into water, floats. Brownies peer over the edge with coconut shell goggles.",
	"hollow_men": "Brownies hold pot-lid shields against shadows. Tumble hides behind Brindle. NOT comedy — futile defense.",
	"cosmology": "Brownies set up a ladder that's far too short to reach the stars. Tumble watches, mesmerized.",
	"fae_kingdom": "Tumble sits on a mushroom. Brownies argue about whether to knock. One bows to a toadstool.",
	"shadow_inn": "Brownies hold pot-lid shields. The loading screen isn't comedy here — it's futile defense against the frequency they're now conscious of.",
	"whisper_layer": "One fizgig pauses mid-action and looks directly at the player with a blank expression, then returns to work. The Inn's creepiest moment — the fizgig ISN'T in on it, it just noticed you.",
	"default": "Tumble rolls across the screen, gets stuck on something, wriggles free. Brownies sweep up behind."
}

# Zone-specific loading colors (matching the zone's artist palette)
const LOADING_COLORS := {
	"main_floor": {"bg": "#1a1410", "accent": "#c9a44c"},
	"standing_stones": {"bg": "#2a2a3a", "accent": "#7b8fa8"},
	"tomb_tunnel": {"bg": "#3a2a1a", "accent": "#d4a04c"},
	"andean_run": {"bg": "#1a2a3a", "accent": "#6fa8d4"},
	"monster_of_the_deep": {"bg": "#0a1a2a", "accent": "#4c8fd4"},
	"hollow_men": {"bg": "#0a0a0a", "accent": "#3a3a3a"},
	"cosmology": {"bg": "#0a0a1a", "accent": "#6c4cd4"},
	"shadow_inn": {"bg": "#0a0a0a", "accent": "#4c1a1a"},
	"default": {"bg": "#1a1410", "accent": "#c9a44c"}
}

signal loading_started(zone_name: String)
signal loading_progress_updated(progress: float)
signal loading_complete(zone_name: String)

func _ready() -> void:
	# In production, this would preload the fizgig animation scenes
	pass

## Start a loading transition for a zone
func load_zone(zone_name: String) -> void:
	if _is_loading:
		push_warning("FizgigLoader already loading — queueing " + zone_name)
		return
	
	_is_loading = true
	_current_zone = zone_name
	_loading_progress = 0.0
	
	loading_started.emit(zone_name)
	
	# Get the scenario text for this zone
	var scenario: String = LOADING_SCENARIOS.get(zone_name, LOADING_SCENARIOS["default"])
	print("[FizgigLoader] Loading zone: " + zone_name)
	print("[FizgigLoader] Scene: " + scenario)
	
	# Simulate loading progress (in production, this tracks actual asset loading)
	# The 42Hz hum plays during loading
	await _simulate_load()
	
	_is_loading = false
	loading_complete.emit(zone_name)
	
	# Transition to the zone scene
	_transition_to_zone(zone_name)

## Internal: simulate loading progress over ~2 seconds
func _simulate_load() -> void:
	while _loading_progress < 1.0:
		await get_tree().create_timer(0.05).timeout
		_loading_progress += 0.025  # ~2 seconds total
		_loading_progress = min(_loading_progress, 1.0)
		loading_progress_updated.emit(_loading_progress)

## Transition to the target zone scene
func _transition_to_zone(zone_name: String) -> void:
	# In production, this would use:
	# get_tree().change_scene_to_file("res://scenes/" + zone_name + ".tscn")
	# For now, just log
	print("[FizgigLoader] Transitioning to: " + zone_name)
	
	# Emit a signal that the main scene manager can catch
	# to actually switch scenes
	get_tree().call_group("zone_manager", "_on_zone_loaded", zone_name)

## Get the loading screen text for the current zone
func get_scenario_text(zone_name: String = "") -> String:
	var zone = zone_name if zone_name != "" else _current_zone
	return LOADING_SCENARIOS.get(zone, LOADING_SCENARIOS["default"])

## Get the color palette for a zone's loading screen
func get_zone_colors(zone_name: String = "") -> Dictionary:
	var zone = zone_name if zone_name != "" else _current_zone
	return LOADING_COLORS.get(zone, LOADING_COLORS["default"])

## Is currently loading?
func is_loading() -> bool:
	return _is_loading

## Get current loading progress (0.0 to 1.0)
func get_progress() -> float:
	return _loading_progress
