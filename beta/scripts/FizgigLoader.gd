extends Node
## FizgigLoader.gd (Autoload Singleton)
## The universal loading screen system. Fizgigs/brownies in zone-specific scenarios.
## One fizgig pauses and looks at the player during Whisper Layer triggers.

signal loading_started(zone: String)
signal loading_finished(zone: String)

var _is_loading: bool = false
var _current_zone: String = ""

# Zone-specific fizgig scenarios (text descriptions for prompt-coded animation)
const FIZGIG_SCENARIOS := {
	"common_room": "Three fizgigs — Brindle dropping a wrench, Cobble catching it, Thatch gluing it to the ceiling.",
	"archive": "Fizgigs trying to alphabetize scrolls. Thatch is eating the B's.",
	"garden": "Fizgigs planting coconut shells. Confused when they don't grow.",
	"meadery": "Fizgigs trying to pour mead. Cobble drinks it. Brindle pours more. Repeat.",
	"standing_stones": "Three fizgigs measuring a standing stone with a too-short ruler.",
	"tomb_tunnel": "Fizgigs with tiny flashlights, huddled together, scared.",
	"andean_run": "Fizgigs rolling down a mountain. Not on purpose. Or maybe on purpose.",
	"monster_of_the_deep": "Fizgigs in a tiny boat. One is fishing. The other is the bait.",
	"sandfall": "Fizgigs slowly sinking. Calm about it. Too calm.",
	"world_map": "Fizgigs trying to fold a map. It's bigger than them. All three.",
	"fae_threshold": "Fizgigs staring at a portal. One pokes it. Regrets it.",
	"seelie_court": "Fizgigs in summer light, sneezing from pollen. Golden. Warm.",
	"unseelie_court": "Fizgigs shivering. Blue light. Frost on coconut shells.",
	"catacombs": "Fizgigs with candles. The candles keep going out. Relighting them.",
	"cinema": "ONE fizgig pauses. Looks directly at the player. Blank expression. Returns to work. The Inn's creepiest moment.",
	"shadow_inn": "Fizgigs with pot-lid shields. Trembling. Not comedy anymore.",
	"hollow_men": "",  # No fizgigs. Silence. The only loading screen without them.
	"final_room": "",  # No loading screen. Direct transition.
	"cosmology": "Fizgigs with a ladder. The ladder is too short. Obviously. They keep trying.",
	"staircase": "Fizgigs carrying an oversized beaker. Liquid sloshing. Everything is sticky.",
	"bone_room": "Fizgigs arranging bones. Respectfully. They bow to each skull.",
	"cave_city": "Fizgigs exploring. One finds a rock. Shows the others. It's just a rock. They're excited anyway.",
	"poison_garden": "Fizgigs wearing tiny gas masks. The masks are coconut shells with holes.",
}

func load_zone(zone: String) -> void:
	_current_zone = zone
	_is_loading = true
	loading_started.emit(zone)
	
	# Special: Hollow Men has no fizgig loading screen
	if zone == "hollow_men":
		# Pure silence. Black screen. The absence is the point.
		pass
	
	# Special: Whisper Layer trigger during cinema
	if zone == "cinema":
		# The fizgig that looks at the player — the Inn's creepiest moment
		pass
	
	# In actual implementation:
	# 1. Show fizgig animation (prompt-coded, pre-rendered)
	# 2. Display the scenario text
	# 3. Wait for scene to load
	# 4. Fade to black, transition
	
	_is_loading = false
	loading_finished.emit(zone)

func get_scenario(zone: String) -> String:
	return FIZGIG_SCENARIOS.get(zone, "Three fizgigs doing something with tools. One of them has the wrong tool.")

func has_fizgig(zone: String) -> bool:
	return FIZGIG_SCENARIOS.get(zone, "default") != ""

## Generate prompt script for a zone's fizgig loading screen animation
func generate_fizgig_prompt(zone: String) -> String:
	var scenario := FIZGIG_SCENARIOS.get(zone, "")
	if scenario == "":
		return ""  # No fizgig for this zone
	
	var prompt := """FIZGIG LOADING SCREEN — {zone}
Style: Royo × Vampire Hunter D × Trinity Blood. Chibi proportions. Warm amber lighting.
Characters: Brindle (anxious, holding wrong tool), Cobble (calm, holding correct tool), Thatch (chaotic, gluing something)
Scenario: {scenario}
Duration: 3-5 seconds, looping
Mood: Comic relief. Except in Shadow Inn zones where the comedy becomes tragedy.
""".format({"zone": zone, "scenario": scenario})
	return prompt
