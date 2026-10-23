extends Node
## Loads every JSON file in res://data once and gives typed lookups.
## The data mirrors geodeinn.com where it can, so the game and the site agree.

const DATA_DIR := "res://data/"

var audio: Dictionary = {}
var stones: Dictionary = {}          # id -> stone dict
var stone_order: Array[String] = []
var crafting: Dictionary = {}
var materials: Dictionary = {}       # id -> material dict
var recipes: Dictionary = {}         # id -> recipe dict (station, needs, makes)
var tiers: Array = []                # homestead tiers 1..5, in order
var gather_nodes: Dictionary = {}
var arcade: Dictionary = {}
var characters: Dictionary = {}
var quests: Dictionary = {}
var dialogue: Dictionary = {}
var world: Dictionary = {}
var faire: Dictionary = {}
var market: Dictionary = {}
var eq_preset: Dictionary = {}
var instruments: Dictionary = {}
var load_errors: Array[String] = []
var _dialogue_file: Dictionary = {}


## Other sections of dialogue.json besides the character entries (humble_objects).
func dialogue_extra(section: String) -> Dictionary:
	return _dialogue_file.get(section, {})


func _init() -> void:
	reload()


func reload() -> void:
	load_errors.clear()
	audio = _load("audio_profiles.json")
	var stone_file := _load("stones.json")
	stones.clear()
	stone_order.clear()
	for s in stone_file.get("stones", []):
		stones[s["id"]] = s
		stone_order.append(s["id"])
	crafting = _load("crafting.json")
	materials.clear()
	for m in crafting.get("materials", []):
		materials[m["id"]] = m
	recipes.clear()
	for r in crafting.get("recipes", []):
		recipes[r["id"]] = r
	tiers = crafting.get("tiers", [])
	tiers.sort_custom(func(a: Dictionary, b: Dictionary) -> bool: return int(a["tier"]) < int(b["tier"]))
	gather_nodes.clear()
	for g in crafting.get("gather_nodes", []):
		gather_nodes[g["id"]] = g
	characters = _load("characters.json").get("characters", {})
	quests = _load("quests.json").get("quests", {})
	_dialogue_file = _load("dialogue.json")
	dialogue = _dialogue_file.get("dialogue", {})
	world = _load("world.json")
	faire = _load("faire.json")
	market = _load("market_sample.json")
	eq_preset = _load("eq_preset.json")
	instruments = _load("instruments.json").get("instruments", {})
	arcade = _load("arcade.json")


func _load(file_name: String) -> Dictionary:
	var path := DATA_DIR + file_name
	if not FileAccess.file_exists(path):
		load_errors.append("missing " + path)
		return {}
	var text := FileAccess.get_file_as_string(path)
	var parsed: Variant = JSON.parse_string(text)
	if typeof(parsed) != TYPE_DICTIONARY:
		load_errors.append("bad json " + path)
		return {}
	return parsed


## Homestead tier n (1..5), or {} past the last one.
func tier(n: int) -> Dictionary:
	for t in tiers:
		if int(t["tier"]) == n:
			return t
	return {}


## Stones the client's data places in a zone ("Campgrounds", "Main Floor"),
## commonest first. Used for finds while gathering and on the wolf's paths.
func stones_in_zone(inn_zone: String, rarities: Array = ["common", "uncommon"]) -> Array[String]:
	var out: Array[String] = []
	for id in stone_order:
		var s: Dictionary = stones[id]
		if String(s.get("inn_zone", "")) == inn_zone and String(s.get("rarity", "common")) in rarities:
			out.append(id)
	return out


## The note a stone rings, same rule as the site: frequency_hz if set,
## otherwise the Mohs map entry for round(hardness), otherwise 440.
func stone_hz(stone_id: String) -> float:
	var s: Dictionary = stones.get(stone_id, {})
	if s.is_empty():
		return float(audio.get("default_stone_hz", 440.0))
	var f: Variant = s.get("frequency_hz")
	if f != null and float(f) > 0.0:
		return float(f)
	return mohs_to_hz(_hardness(s))


## Hardness, or 0 when the client's data doesn't have one (7 stones), so the
## note falls back to 440 like the site does.
static func _hardness(s: Dictionary) -> float:
	var h: Variant = s.get("hardness")
	return 0.0 if h == null else float(h)


func mohs_to_hz(hardness: float) -> float:
	var key := str(int(round(hardness)))
	var mohs: Dictionary = audio.get("mohs_map", {})
	if mohs.has(key):
		return float(mohs[key]["hz"])
	return float(audio.get("default_stone_hz", 440.0))


func stone_note_name(stone_id: String) -> String:
	var s: Dictionary = stones.get(stone_id, {})
	if s.is_empty():
		return "?"
	if s.get("frequency_hz") != null:
		return "%s Hz" % str(snappedf(float(s["frequency_hz"]), 0.1))
	var key := str(int(round(_hardness(s))))
	var mohs: Dictionary = audio.get("mohs_map", {})
	return String(mohs[key]["note"]) if mohs.has(key) else "A4"


func driver_profile(driver: String) -> Dictionary:
	var profiles: Dictionary = audio.get("driver_profiles", {})
	return profiles.get(driver, profiles.get("balancedArmature", {}))


func room_driver(room: String) -> String:
	return String(audio.get("room_drivers", {}).get(room, "balancedArmature"))


func room_bpm(room: String) -> float:
	return float(audio.get("room_bpm", {}).get(room, heartbeat_bpm()))


func heartbeat_bpm() -> float:
	return float(audio.get("system", {}).get("heartbeat_bpm", 50))


func song_root_hz() -> float:
	return float(audio.get("system", {}).get("song_hz", 42))


func material_name(id: String) -> String:
	return String(materials.get(id, {}).get("name", id.capitalize()))


func character(id: String) -> Dictionary:
	return characters.get(id, {})


func market_item(id: String) -> Dictionary:
	for item in market.get("items", []):
		if item["id"] == id:
			return item
	return {}
