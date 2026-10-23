extends Node
## Everything the player owns and has done. One profile per player.
##
## Stone rule (connection map, page 3): once a stone's tone is learned the geode
## cave keeps it forever. Spending a stone (Charon's fare, crafting, trading)
## only uses up the physical stone, so the player's Song never goes down.

const SAVE_DIR := "user://saves/"
const PROFILE_VERSION := 2

var profile: Dictionary = {}
## Which save file play writes to. The smoke test and the Final Room preview
## use their own, so they never touch a player's real save.
var slot := "main"


func _ready() -> void:
	if profile.is_empty():
		new_profile("")


func new_profile(player_name: String, player_class := "artisan_thief") -> void:
	profile = {
		"version": PROFILE_VERSION,
		"name": player_name,
		"class": player_class,
		"learned_stones": {},
		"stone_counts": {},
		"materials": GameData.crafting.get("starting_materials", {}).duplicate(),
		"companions": [],
		"unlocks": {},
		"flags": {},
		"chronicle": [],
		"journal": {},
		"homestead": { "plot": -1, "tier": 0, "name": "", "key": "" },
		"nooks_sat": {},
		"song_points": 0.0,
		"quests": {},
		"counters": {},
		"visits": 0,
		"last_seen_unix": 0,
		"created_unix": int(Time.get_unix_time_from_system()),
	}


# ---------------------------------------------------------------- stones

func learn_stone(stone_id: String, count := 1) -> void:
	if not GameData.stones.has(stone_id):
		push_warning("unknown stone " + stone_id)
		return
	var learned: Dictionary = profile["learned_stones"]
	var is_new := not learned.has(stone_id)
	if not is_new and bool(GameData.stones[stone_id].get("unique_per_player", false)):
		return  # the Self Stone (41.7Hz): one per player, ever
	learned[stone_id] = true
	add_stone(stone_id, count)
	if is_new:
		EventBus.stone_learned.emit(stone_id)
		EventBus.emit_event("stone_learned", { "stone": stone_id })


func add_stone(stone_id: String, count := 1) -> void:
	var counts: Dictionary = profile["stone_counts"]
	counts[stone_id] = int(counts.get(stone_id, 0)) + count
	EventBus.stone_count_changed.emit(stone_id, counts[stone_id])


## Uses up one physical stone. The learned tone stays in the cave.
func spend_stone(stone_id: String) -> bool:
	var counts: Dictionary = profile["stone_counts"]
	if int(counts.get(stone_id, 0)) <= 0:
		return false
	counts[stone_id] = int(counts[stone_id]) - 1
	EventBus.stone_count_changed.emit(stone_id, counts[stone_id])
	return true


func has_tone(stone_id: String) -> bool:
	return profile["learned_stones"].has(stone_id)


func stone_count(stone_id: String) -> int:
	return int(profile["stone_counts"].get(stone_id, 0))


func learned_stone_ids() -> Array[String]:
	var out: Array[String] = []
	for id in GameData.stone_order:
		if has_tone(id):
			out.append(id)
	return out


# ---------------------------------------------------------------- materials

func material_count(id: String) -> int:
	return int(profile["materials"].get(id, 0))


func add_material(id: String, amount := 1) -> void:
	var mats: Dictionary = profile["materials"]
	mats[id] = int(mats.get(id, 0)) + amount
	EventBus.materials_changed.emit()
	if amount > 0:
		EventBus.emit_event("material:" + id, { "amount": amount })


func can_afford(cost: Dictionary) -> bool:
	for id in cost.keys():
		if material_count(id) < int(cost[id]):
			return false
	return true


func spend_materials(cost: Dictionary) -> bool:
	if not can_afford(cost):
		return false
	var mats: Dictionary = profile["materials"]
	for id in cost.keys():
		mats[id] = int(mats[id]) - int(cost[id])
	EventBus.materials_changed.emit()
	return true


# ---------------------------------------------------------------- companions, unlocks, flags

func add_companion(companion_id: String) -> void:
	if companion_id in profile["companions"]:
		return
	profile["companions"].append(companion_id)
	EventBus.companion_added.emit(companion_id)


func has_companion(companion_id: String) -> bool:
	return companion_id in profile["companions"]


func unlock(id: String) -> void:
	profile["unlocks"][id] = true
	EventBus.emit_event("unlocked:" + id)


func is_unlocked(id: String) -> bool:
	return profile["unlocks"].has(id)


func set_flag(id: String, value: Variant = true) -> void:
	profile["flags"][id] = value


func flag(id: String) -> Variant:
	return profile["flags"].get(id)


# ---------------------------------------------------------------- chronicle, journal, nooks, building

## The Player Chronicle: one running record that the Ragana, the Fortune
## Teller, Kali, the Siren's Mirror and the reincarnation spine all read from.
func add_chronicle(text: String, kind := "note", data: Dictionary = {}) -> void:
	profile["chronicle"].append({ "t": int(Time.get_unix_time_from_system()), "kind": kind, "text": text, "data": data })


func chronicle() -> Array:
	return profile["chronicle"]


func record_observation(zone: String, observation_id: String) -> bool:
	var journal: Dictionary = profile["journal"]
	if not journal.has(zone):
		journal[zone] = []
	if observation_id in journal[zone]:
		return false
	journal[zone].append(observation_id)
	EventBus.emit_event("journal:" + zone, { "total": journal[zone].size() })
	return true


func observations(zone: String) -> Array:
	return profile["journal"].get(zone, [])


func mark_nook(nook_id: String) -> int:
	profile["nooks_sat"][nook_id] = true
	return profile["nooks_sat"].size()


## The player's homestead: one plot at the faire's edge, built up tier by tier.
## The key lets a game server recognize the plot's owner without an account.
func homestead() -> Dictionary:
	var h: Dictionary = profile["homestead"]
	if String(h.get("key", "")).is_empty():
		h["key"] = Crypto.new().generate_random_bytes(12).hex_encode()
	return h


func homestead_tier() -> int:
	return int(profile["homestead"].get("tier", 0))


func claim_plot(plot: int) -> void:
	homestead()["plot"] = plot


func has_built(tier_id: String) -> bool:
	var reached := homestead_tier()
	for t in GameData.tiers:
		if String(t["id"]) == tier_id:
			return reached >= int(t["tier"])
	return false


# ---------------------------------------------------------------- visits

## A new session in the Inn. Returns the seconds since the last one (0 the first time).
func begin_visit() -> int:
	var now := int(Time.get_unix_time_from_system())
	var last := int(profile.get("last_seen_unix", 0))
	profile["visits"] = int(profile.get("visits", 0)) + 1
	profile["last_seen_unix"] = now
	return 0 if last <= 0 else maxi(now - last, 0)


func visits() -> int:
	return int(profile.get("visits", 0))


# ---------------------------------------------------------------- save and load

func save_profile(slot_name := "") -> bool:
	var use := slot if slot_name.is_empty() else slot_name
	profile["last_seen_unix"] = int(Time.get_unix_time_from_system())
	DirAccess.make_dir_recursive_absolute(SAVE_DIR)
	var path := SAVE_DIR + use + ".json"
	var text := JSON.stringify(profile, "  ")
	var f := FileAccess.open(path, FileAccess.WRITE)
	if f == null:
		return false
	f.store_string(text)
	f.close()
	Services.cloud_write(use + ".json", text)
	return true


func load_profile(slot_name := "") -> bool:
	var use := slot if slot_name.is_empty() else slot_name
	var path := SAVE_DIR + use + ".json"
	var text := ""
	if FileAccess.file_exists(path):
		text = FileAccess.get_file_as_string(path)
	else:
		text = Services.cloud_read(use + ".json")
	if text.is_empty():
		return false
	var parsed: Variant = JSON.parse_string(text)
	if typeof(parsed) != TYPE_DICTIONARY:
		return false
	profile = migrate(parsed)
	return true


func has_save(slot_name := "") -> bool:
	return FileAccess.file_exists(SAVE_DIR + (slot if slot_name.is_empty() else slot_name) + ".json")


## Fills in any keys a newer build added so old saves keep loading.
func migrate(data: Dictionary) -> Dictionary:
	var current := profile.duplicate(true)
	new_profile(String(data.get("name", "")))
	var fresh := profile
	profile = current
	for key in fresh.keys():
		if not data.has(key):
			data[key] = fresh[key]
	# JSON numbers come back as floats; counts are ints.
	for dict_key in ["stone_counts", "materials", "counters"]:
		var d: Dictionary = data[dict_key]
		for k in d.keys():
			d[k] = int(d[k])
	# Version 1 saves used the site's element workbench and campsite blueprints.
	# Those materials no longer exist; the homestead starts fresh.
	if int(data.get("version", 1)) < 2:
		data["materials"] = {}
		data.erase("built")
		data["homestead"] = fresh["homestead"]
	for k in ["plot", "tier"]:
		data["homestead"][k] = int(data["homestead"].get(k, 0 if k == "tier" else -1))
	data["visits"] = int(data.get("visits", 0))
	data["last_seen_unix"] = int(data.get("last_seen_unix", 0))
	data["version"] = PROFILE_VERSION
	return data
