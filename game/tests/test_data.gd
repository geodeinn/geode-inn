extends RefCounted
## The data files load, agree with each other, and match the client's data.


func test_all_files_load(t) -> void:
	t.eq(GameData.load_errors.size(), 0, "no data load errors: " + str(GameData.load_errors))


func test_client_counts(t) -> void:
	t.eq(GameData.stones.size(), 199, "the 200-stone census minus the merged record pair (+ Self Stone)")
	t.eq(GameData.market.get("items", []).size(), 38, "38 Soulstice products, duplicates removed")
	t.eq(GameData.arcade.get("games", []).size(), 61, "61 arcade titles")
	t.eq(GameData.tiers.size(), 5, "five homestead tiers")
	t.eq(GameData.crafting.get("plots", {}).get("ring_1", []).size(), 12, "twelve plots in the first ring")
	var base := 0
	for m in GameData.crafting["materials"]:
		if m["group"] == "base":
			base += 1
	t.eq(base, 7, "seven base materials: wood, stone, clay, sand, ore, hemp, thatch")


func test_recipes_and_tiers_use_known_materials(t) -> void:
	for id in GameData.recipes:
		var r: Dictionary = GameData.recipes[id]
		t.check(GameData.materials.has(r["makes"]), "%s makes unknown %s" % [id, r["makes"]])
		t.check(r["station"] in ["workbench", "forge"], "%s station" % id)
		for m in r["needs"]:
			t.check(GameData.materials.has(m), "%s needs unknown %s" % [id, m])
	for tier in GameData.tiers:
		for m in tier["requires"]:
			t.check(GameData.materials.has(m), "%s needs unknown %s" % [tier["id"], m])
		t.check(not tier.get("verdict", []).is_empty(), "%s has the Ragana's verdict" % tier["id"])


func test_every_material_can_be_had(t) -> void:
	var have := {}
	for g in GameData.gather_nodes.values():
		have[String(g["gives"])] = true
	for r in GameData.recipes.values():
		have[String(r["makes"])] = true
	for m in GameData.materials:
		t.check(have.has(m), "nothing gathers or makes %s" % m)


func test_tier_costs_follow_the_building_doc(t) -> void:
	var lean_to := GameData.tier(1)
	t.eq(int(lean_to["requires"]["wood"]), 10, "lean-to frame: 10 logs")
	t.eq(int(lean_to["requires"]["rope"]), 20, "lean-to cordage: 20")
	t.eq(int(lean_to["requires"]["bundle"]), 15, "lean-to roof: 15 bundles")
	t.eq(String(lean_to["verdict"][0]), "It stands. Adequate.", "the Ragana's first verdict")
	t.eq(int(GameData.tier(2)["requires"]["ingot"]), 10, "cottage: 10 copper ingots")
	t.eq(String(GameData.tier(4)["verdict"][-1]), "Adequate.", "the long pause, then Adequate")
	t.check(not GameData.tier(5).get("requires_unlocks", []).is_empty(), "the Ancestral Hall needs the Philosopher's Stone and the Silica Thread")


func test_mohs_map_matches_site(t) -> void:
	t.near(GameData.mohs_to_hz(1.0), 261.6, 0.01, "hardness 1 is C4")
	t.near(GameData.mohs_to_hz(7.0), 493.9, 0.01, "hardness 7 is B4 (quartz)")
	t.near(GameData.mohs_to_hz(9.0), 587.3, 0.01, "hardness 9 is D5")
	t.near(GameData.mohs_to_hz(10.0), 440.0, 0.01, "hardness 10 falls back to 440 like the site")
	t.near(GameData.mohs_to_hz(5.5), 440.0, 0.01, "5.5 rounds up to 6 like JS Math.round")
	t.near(GameData.mohs_to_hz(2.25), 293.7, 0.01, "2.25 rounds to 2")


func test_stone_notes(t) -> void:
	t.near(GameData.stone_hz("clear_quartz"), 493.9, 0.01, "clear quartz rings B4")
	t.eq(GameData.stone_note_name("clear_quartz"), "B4", "clear quartz note name")
	t.near(GameData.stone_hz("malachite"), 349.2, 0.01, "malachite (3.5) rounds to 4, F4")
	t.near(GameData.stone_hz("self_stone"), 41.7, 0.001, "the Self Stone keeps its own 41.7Hz")
	t.check(bool(GameData.stones["self_stone"].get("unique_per_player", false)), "one Self Stone per player")
	t.near(GameData.stone_hz("sea_glass"), 440.0, 0.01, "a stone with no hardness falls back to 440")
	t.check(GameData.stones["clear_quartz"].get("driver_hz") != null, "the repo's density frequency is kept as driver_hz")


func test_zone_stone_pools(t) -> void:
	var camp := GameData.stones_in_zone("Campgrounds")
	t.check(camp.size() >= 15, "the client's data puts plenty of stones in the Campgrounds (%d)" % camp.size())
	t.check("moss_agate" in camp, "moss agate is a Campgrounds stone")
	t.check(not "dendritic_agate" in camp, "rare finds aren't in the common pool")


func test_audio_profiles_match_site(t) -> void:
	var p: Dictionary = GameData.driver_profile("balancedArmature")
	t.eq(p["osc"], "triangle", "balanced armature is a triangle wave")
	t.near(float(p["filter"]["freq"]), 1600.0, 0.1, "balanced armature band at 1600")
	t.eq(GameData.audio["driver_profiles"].size(), 7, "seven driver profiles")
	t.near(GameData.heartbeat_bpm(), 50.0, 0.0, "heartbeat 50 BPM")
	t.near(GameData.song_root_hz(), 42.0, 0.0, "song root 42Hz")
	t.eq(GameData.room_driver("Catacombs"), "dynamic", "catacombs use the dynamic driver")


func test_quest_references(t) -> void:
	for qid in GameData.quests:
		var q: Dictionary = GameData.quests[qid]
		t.check(GameData.characters.has(q["giver"]), "%s giver %s exists" % [qid, q["giver"]])
		for req in q.get("requires", []):
			t.check(GameData.quests.has(req), "%s requires unknown %s" % [qid, req])
		for s in q["reward"].get("stones", []):
			t.check(GameData.stones.has(s), "%s rewards unknown stone %s" % [qid, s])
		var ach := String(q["reward"].get("achievement", ""))
		if not ach.is_empty():
			t.check(GameData.world["achievements"].has(ach), "%s achievement %s defined" % [qid, ach])


func _check_actions(t, cid: String, actions: Array) -> void:
	for action in actions:
		if action.has("start_quest"):
			t.check(GameData.quests.has(action["start_quest"]), "%s starts unknown quest" % cid)
		if action.has("complete_step"):
			var parts: PackedStringArray = String(action["complete_step"]).split(":")
			var found := false
			for s in GameData.quests.get(parts[0], {}).get("steps", []):
				if s["id"] == parts[1]:
					found = true
			t.check(found, "%s completes unknown step %s" % [cid, action["complete_step"]])
		for key in ["give_stone", "take_stone"]:
			if action.has(key):
				t.check(GameData.stones.has(action[key]), "%s %s unknown stone %s" % [cid, key, action[key]])


func test_dialogue_references(t) -> void:
	for cid in GameData.dialogue:
		t.check(GameData.characters.has(cid), "dialogue for unknown character " + cid)
		for entry in GameData.dialogue[cid]:
			_check_actions(t, cid, entry.get("actions", []))
			for c in entry.get("choices", []):
				t.check(not String(c.get("text", "")).is_empty(), "%s choice has text" % cid)
				_check_actions(t, cid, c.get("actions", []))
			var when: Dictionary = entry.get("when", {})
			for key in ["carries_stone", "has_stone"]:
				if when.has(key):
					t.check(GameData.stones.has(when[key]), "%s checks unknown stone %s" % [cid, when[key]])


func test_beings_are_harmonizable_with_reachable_stones(t) -> void:
	for id in GameData.world["beings"]:
		var b: Dictionary = GameData.world["beings"][id]
		var h := Harmonizer.new(b["target_hz"])
		for slot in b["target_hz"].size():
			t.check(not h.matching_stones(slot, GameData.stone_order).is_empty(), "%s slot %d has a matching stone" % [id, slot])
	var echo := Harmonizer.new(GameData.world["beings"]["unstrung_echo"]["target_hz"])
	t.check("clear_quartz" in echo.matching_stones(0, ["clear_quartz"]), "The Welcome's clear quartz answers the echo")


func test_character_portraits_exist(t) -> void:
	for id in GameData.characters:
		var p := String(GameData.characters[id].get("portrait", ""))
		if not p.is_empty():
			t.check(ResourceLoader.exists(p), "portrait for %s at %s" % [id, p])


func test_market_canon_artifacts(t) -> void:
	var named := {}
	for it in GameData.market["items"]:
		if it.has("canon_name"):
			named[String(it["canon_name"])] = true
	for want in ["The Aurora Pendant", "The Truth-Teller's Ring", "The Cat's Eye of Bastet", "The Bluestone Key"]:
		t.check(named.has(want), "the market's canon catalog has " + want)


func test_faire_samples_point_at_real_items(t) -> void:
	for f in GameData.faire["sample_faires"]:
		for b in f["booths"]:
			for id in b["items"]:
				t.check(not GameData.market_item(String(id)).is_empty(), "booth %s lists unknown item %s" % [b["sign"], id])
