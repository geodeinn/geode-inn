extends RefCounted
## Stones, the homestead, harmonization, the heartbeat, the Song, saves, sound.


func test_spending_a_stone_keeps_its_tone(t) -> void:
	PlayerState.learn_stone("clear_quartz")
	t.eq(PlayerState.stone_count("clear_quartz"), 1, "one clear quartz")
	t.check(PlayerState.spend_stone("clear_quartz"), "can give it away")
	t.eq(PlayerState.stone_count("clear_quartz"), 0, "no physical stone left")
	t.check(PlayerState.has_tone("clear_quartz"), "the geode still has the tone")
	t.check(not PlayerState.spend_stone("clear_quartz"), "can't give what you don't have")


func test_self_stone_is_one_per_player(t) -> void:
	PlayerState.learn_stone("self_stone")
	PlayerState.learn_stone("self_stone")
	t.eq(PlayerState.stone_count("self_stone"), 1, "only one Self Stone, ever")


func test_workbench_and_forge(t) -> void:
	t.eq(Crafting.make("plank"), 0, "nothing to make planks from yet")
	PlayerState.add_material("wood", 5)
	t.eq(Crafting.max_makeable("plank"), 5, "five logs, five planks")
	t.eq(Crafting.make("plank", 3), 3, "made three")
	t.eq(PlayerState.material_count("wood"), 2, "used three logs")
	t.eq(PlayerState.material_count("plank"), 3, "three planks")
	PlayerState.add_material("sand", 2)
	PlayerState.add_material("clay", 1)
	t.eq(Crafting.make("mortar", 5), 1, "mortar needs sand and clay; one clay makes one")
	t.eq(Crafting.recipes_at("forge").size(), 3, "the forge fires brick, ingots and glass")
	t.check("brick" in Crafting.recipes_at("forge"), "clay plus fire is brick, at the forge")


func test_homestead_tiers(t) -> void:
	t.check(not Crafting.can_build_next(), "no plot yet")
	PlayerState.claim_plot(3)
	t.check(not Crafting.can_build_next(), "no materials yet")
	t.eq(Crafting.missing_for(Crafting.next_tier()).get("rope", 0), 20, "the lean-to needs 20 rope")
	PlayerState.add_material("wood", 10)
	PlayerState.add_material("rope", 20)
	PlayerState.add_material("bundle", 15)
	var got := [false]
	var cb := func(id: String, _d: Dictionary) -> void:
		if id == "built:lean_to":
			got[0] = true
	EventBus.game_event.connect(cb)
	t.check(Crafting.build_next("Hearthside"), "the lean-to goes up")
	EventBus.game_event.disconnect(cb)
	t.check(got[0], "built:lean_to event")
	t.eq(PlayerState.homestead_tier(), 1, "tier 1")
	t.eq(String(PlayerState.homestead()["name"]), "Hearthside", "named")
	t.eq(PlayerState.material_count("rope"), 0, "materials spent")
	t.check(PlayerState.has_built("lean_to"), "has_built knows")
	t.check(not PlayerState.has_built("cottage"), "not a cottage yet")
	t.check(String(PlayerState.chronicle()[-1]["text"]).begins_with("Built a lean-to"), "chronicle: " + String(PlayerState.chronicle()[-1]["text"]))


func test_ancestral_hall_waits_for_its_charms(t) -> void:
	PlayerState.claim_plot(0)
	PlayerState.homestead()["tier"] = 4
	for m in GameData.tier(5)["requires"]:
		PlayerState.add_material(m, 5)
	t.check(not Crafting.can_build_next(), "the Philosopher's Stone and the Silica Thread aren't in the first release")
	PlayerState.unlock("philosophers_stone")
	PlayerState.unlock("silica_thread")
	t.check(Crafting.can_build_next(), "with both, it can be built")


func test_harmonize_the_unstrung_echo(t) -> void:
	var being: Dictionary = GameData.world["beings"]["unstrung_echo"]
	var h := Harmonizer.new(being["target_hz"])
	t.check(not h.is_complete(), "starts unmatched")
	h.set_slot(0, "malachite")
	t.check(not h.is_complete(), "malachite (F4) doesn't match B4")
	var off := h.alignment()
	h.set_slot(0, "clear_quartz")
	t.check(h.alignment() > off, "alignment rises with the right stone")
	t.check(h.is_complete(), "clear quartz answers it")
	t.near(h.alignment(), 1.0, 0.001, "fully aligned")


func test_octaves_count(t) -> void:
	t.near(Harmonizer.cents_between(440.0, 880.0, true), 0.0, 0.01, "an octave is the same note")
	t.near(Harmonizer.cents_between(440.0, 880.0, false), 1200.0, 0.01, "unless octaves are strict")
	t.near(Harmonizer.cents_between(440.0, 466.16, true), 100.0, 0.5, "a semitone is 100 cents")


func test_heartbeat_clock(t) -> void:
	var b := BeatJudge.new(50.0)
	t.near(b.interval_s(), 1.2, 0.0001, "50 BPM is 1.2 s per beat")
	t.eq(b.nearest_beat(2.35), 2, "2.35 s is nearest beat 2")
	t.near(b.offset_ms(2.35), -50.0, 0.01, "50 ms early")
	t.near(b.phase(1.8), 0.5, 0.0001, "half way between beats")


func test_song_climbs_and_stops_short_of_the_endgame(t) -> void:
	t.near(SongState.world_hz(), 42.0, 0.0001, "starts at 42Hz")
	SongState.add_points(10.0, "test")
	t.near(SongState.world_hz(), 42.005, 0.0001, "10 points moves the world 0.005Hz")
	t.near(SongState.personal_points(), 10.0, 0.0001, "personal spectrum 10")
	t.check(SongState.can_perceive("fae_glimmers"), "8+ points shows fae glimmers")
	t.check(not SongState.can_perceive("moss_voices"), "16 needed for moss voices")
	SongState.set_world_points(1e9)
	t.near(SongState.world_hz(), 43.9, 0.0001, "the first release stops at 43.9Hz")
	t.check(not SongState.is_complete(), "44Hz is the endgame, not in this release")


func test_save_and_load(t) -> void:
	PlayerState.learn_stone("clear_quartz")
	PlayerState.add_material("brick", 3)
	PlayerState.claim_plot(5)
	PlayerState.add_chronicle("test entry")
	t.check(PlayerState.save_profile("test_slot"), "saved")
	PlayerState.new_profile("Someone else")
	t.check(PlayerState.load_profile("test_slot"), "loaded")
	t.eq(PlayerState.profile["name"], "Tester", "name came back")
	t.check(PlayerState.has_tone("clear_quartz"), "tone came back")
	t.eq(PlayerState.material_count("brick"), 3, "bricks came back as an int")
	t.eq(typeof(PlayerState.profile["materials"]["brick"]), TYPE_INT, "counts are ints after JSON")
	t.eq(int(PlayerState.homestead()["plot"]), 5, "the plot came back")
	t.eq(typeof(PlayerState.homestead()["plot"]), TYPE_INT, "plot is an int")
	DirAccess.remove_absolute(PlayerState.SAVE_DIR + "test_slot.json")


func test_old_saves_migrate(t) -> void:
	var old := { "version": 1, "name": "Old", "learned_stones": { "quartz": true }, "stone_counts": { "quartz": 1.0 }, "materials": { "magma": 3.0 }, "counters": {}, "built": [{ "blueprint": "campfire", "slot": 0 }] }
	var migrated := PlayerState.migrate(old)
	t.check(migrated.has("chronicle"), "missing keys filled in")
	t.eq(migrated["stone_counts"]["quartz"], 1, "float counts become ints")
	t.eq(migrated["materials"].size(), 0, "the old element materials are gone")
	t.check(not migrated.has("built"), "the old campsite blueprints are gone")
	t.eq(int(migrated["homestead"]["plot"]), -1, "a fresh homestead")
	t.eq(int(migrated["version"]), PlayerState.PROFILE_VERSION, "now current")


func test_visits(t) -> void:
	t.eq(PlayerState.begin_visit(), 0, "first visit: no time away")
	t.eq(PlayerState.visits(), 1, "one visit")
	PlayerState.profile["last_seen_unix"] = int(Time.get_unix_time_from_system()) - 2 * 86400 - 5
	var away := PlayerState.begin_visit()
	t.check(away >= 2 * 86400, "two days away")
	t.eq(PlayerState.visits(), 2, "two visits")


func test_audio_synthesis(t) -> void:
	var wav := AudioDirector.synth_layers([{ "hz": 440.0, "wave": "sine", "gain": 0.5, "attack": 0.01 }], 0.5)
	t.eq(wav.data.size(), int(AudioDirector.MIX_RATE * 0.5) * 2, "16-bit mono sample count")
	# Count upward zero crossings in the middle of the tone to estimate pitch.
	var crossings := 0
	var prev := 0
	var start := int(AudioDirector.MIX_RATE * 0.1)
	var end := int(AudioDirector.MIX_RATE * 0.3)
	for i in range(start, end):
		var s := wav.data.decode_s16(i * 2)
		if prev < 0 and s >= 0:
			crossings += 1
		prev = s
	t.near(float(crossings) / 0.2, 440.0, 10.0, "the tone is 440Hz")
	for inst in ["cello", "tap_wood", "tap_stone", "tap_metal", "tap_earth", "tap_clay", "tap_soft", "bodhran"]:
		var voice := AudioDirector.synth_instrument(inst, 196.0, 0.1, 0.2)
		t.check(voice.data.size() > 0, inst + " renders")


func test_the_hum(t) -> void:
	AudioDirector.set_hum(true)
	t.check(AudioDirector.hum_on(), "the 42Hz hum starts")
	AudioDirector.set_hum(false)
	t.check(not AudioDirector.hum_on(), "and stops")


func test_audio_buses(t) -> void:
	t.check(AudioServer.get_bus_index("Soulstice") != -1, "client EQ bus exists")
	for driver in GameData.audio["driver_profiles"]:
		t.check(AudioServer.get_bus_index("Drv_" + driver) != -1, "driver bus " + driver)
	var ba := AudioServer.get_bus_index("Drv_balancedArmature")
	t.check(AudioServer.get_bus_effect(ba, 0) is AudioEffectBandPassFilter, "balanced armature bus is a band-pass")
	t.near((AudioServer.get_bus_effect(ba, 0) as AudioEffectFilter).cutoff_hz, 1600.0, 0.1, "at 1600Hz")


func test_market_rows_normalize(t) -> void:
	var rows := [{ "id": "a1", "name": "Ring", "price": 25, "vendor": "Soulstice", "category": "Artifacts" }, "junk"]
	var items := Services.normalize_market_items(rows)
	t.eq(items.size(), 1, "junk rows dropped")
	t.eq(items[0]["title"], "Ring", "name maps to title")
	t.eq(items[0]["category"], "Artifacts", "category kept for the stalls")


func test_no_shop_links_by_default(t) -> void:
	t.check(not Services.can_open_shop_links(), "offline-first: no links out unless the client turns them on")


# ---------------------------------------------------------------- the drum circle

func test_a_second_tapper_ignites_the_circle(t) -> void:
	var dc := DrumCircle.new()
	var r := dc.tap("me", Vector3.ZERO, "wood", 10.0)
	t.check(not bool(r["ignited_now"]), "one tapper is a spark, not a circle")
	dc.tap("me", Vector3.ZERO, "wood", 11.0)
	r = dc.tap("pluck", Vector3(1, 0, 0), "wood", 11.5)
	t.check(bool(r["ignited_now"]), "a second tapper lights it")
	t.eq(dc.circles.size(), 1, "one circle")
	dc.tap("p7", Vector3(40, 0, 0), "stone", 12.0)
	t.eq(dc.circles.size(), 2, "far away is a different spark")
	t.eq(dc.tick(30.0).size(), 2, "both end when nobody taps")
	t.eq(dc.circles.size(), 0, "gone")


func test_taps_are_never_quantized(t) -> void:
	var dc := DrumCircle.new()
	var times := [0.0, 0.83, 1.71, 2.52, 3.40, 4.26]
	for tm in times:
		dc.tap("me", Vector3.ZERO, "hide", tm)
	var c: Dictionary = dc.circles[0]
	for i in times.size():
		t.near(float(c["taps"][i]["t"]), times[i], 0.0, "tap %d kept exactly as played" % i)
	var bpm := dc.tempo_of(c, "me")
	t.check(bpm > 66.0 and bpm < 74.0, "the hands' own tempo, about 70 BPM (got %.1f)" % bpm)


func test_circles_drift_gently_toward_the_heartbeat(t) -> void:
	var dc := DrumCircle.new()
	var tm := 0.0
	while tm < 700.0:
		dc.tap("me", Vector3.ZERO, "wood", tm)
		dc.tap("p2", Vector3.ZERO, "wood", tm + 0.2)
		tm += 60.0 / 120.0
	var c: Dictionary = dc.circles[0]
	var measured := dc.measured_bpm(c)
	var shown := dc.reflected_bpm(c, tm)
	t.check(absf(measured - 120.0) < 3.0, "the circle plays at 120 (%.1f)" % measured)
	t.check(shown < measured and shown > 50.0, "the ring leans toward 50 (%.1f)" % shown)
	t.check(shown >= measured - (measured - 50.0) * 0.25 - 0.01, "but never more than a quarter of the way: the players' tempo outranks the pull")


func test_rhythm_is_the_handshake(t) -> void:
	var dc := DrumCircle.new()
	var shape := [0.0, 0.3, 0.6, 1.2, 1.5]
	var tm := 0.0
	for rep in 2:
		for s in shape:
			dc.tap("ana", Vector3.ZERO, "wood", tm + s)
		tm += 2.4
	var c: Dictionary = dc.circles[0]
	t.check(c["patterns"].has("ana"), "a pattern played twice is yours")
	var got: Array = []
	for s in shape:
		var r := dc.tap("ben", Vector3.ZERO, "wood", tm + s * 1.2)
		got.append_array(r["recognized"])
	t.check(not got.is_empty() and got[0] == ["ana", "ben"], "playing someone's rhythm back is recognized, even a little slower: " + str(got))


# ---------------------------------------------------------------- the Common Room

func test_threshold_and_cooldown(t) -> void:
	var m := Moderation.new()
	var now := 1000.0
	m.join(2, "Ann", now)
	t.check(not bool(m.say(2, "hi", now + 10.0)["ok"]), "warming by the fire for 45 s")
	t.check(String(m.say(2, "hi", now + 10.0)["error"]).begins_with("You're still warming by the fire"), "the site's wording")
	t.check(bool(m.say(2, "hi", now + 46.0)["ok"]), "can speak after 45 s")
	m.join(3, "Bo", now)
	t.check(not bool(m.frog(2, 3, now + 60.0)["ok"]), "no frogging in the first two minutes")
	t.check(bool(m.frog(2, 3, now + 121.0)["ok"]), "allowed after two minutes")
	t.eq(String(m.frog(2, 3, now + 122.0)["error"]), "You have already frogged this traveler.", "one frog per traveler")
	t.eq(String(m.frog(3, 3, now + 130.0)["error"]), "You cannot frog yourself.", "no self frogs")


func test_three_frogs_transform_and_three_transformations_claim(t) -> void:
	var m := Moderation.new()
	var now := 1000.0
	for p in [2, 3, 4, 9]:
		m.join(p, "T%d" % p, now)
	var later := now + 200.0
	t.eq(int(m.frog(2, 9, later)["votes"]), 1, "1/3")
	t.eq(int(m.frog(3, 9, later)["votes"]), 2, "2/3")
	var r := m.frog(4, 9, later)
	t.check(bool(r["transformed"]), "the third frog transforms them")
	t.check(m.is_frog(9), "a frog now")
	t.check(m.display_name(9) != "T9", "the name is a frog name: " + m.display_name(9))
	t.check(String(m.say(9, "you are all terrible", later + 1.0)["text"]) in GameData.world["moderation"]["ribbits"], "every line is a ribbit")
	t.check(m.is_frog(9), "frog until they leave, no timer")
	for i in 2:
		for p in [2, 3, 4]:
			r = m.frog(p, 9, later + 10.0 + i)
	t.check(bool(r["claimed"]), "three transformations: the swamp claims them")
	t.check(not m.has(9), "removed")
	t.check(m.is_heightened(later + 20.0), "the room is heightened")
	t.near(m.threshold_s(later + 20.0), 120.0, 0.0, "newcomers wait 120 s while heightened")
	t.near(m.threshold_s(later + 400.0), 45.0, 0.0, "back to 45 s after five minutes")


func test_names_and_limits(t) -> void:
	var m := Moderation.new()
	var rec := m.join(5, "   ", 0.0)
	t.check(String(rec["name"]).contains("-"), "a blank name becomes a stone name: " + String(rec["name"]))
	m.join(6, "Wren", 0.0)
	var dupe := m.join(7, "Wren", 0.0)
	t.check(String(dupe["name"]).begins_with("Wren-"), "a name already by the fire gets a letter")
	var long := "a".repeat(700)
	t.eq(String(m.say(6, long, 100.0)["text"]).length(), 500, "500 characters at most")
	for i in 8:
		m.say(6, "line", 100.0 + i * 0.1)
	t.check(not bool(m.say(6, "flood", 101.0)["ok"]), "flood guard")
	t.check(not m.random_fire_line().is_empty(), "the fire has its lines")
