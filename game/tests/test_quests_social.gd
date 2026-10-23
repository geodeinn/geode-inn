extends RefCounted
## Quest flow and faire rental.


func _welcome_done() -> void:
	QuestManager.start("the_welcome")
	QuestManager.complete_step("the_welcome", "meet_host")
	EventBus.emit_event("visit:geode_corner")
	EventBus.emit_event("nook_complete")


func test_the_welcome(t) -> void:
	t.check(QuestManager.start("the_welcome"), "starts")
	t.check(QuestManager.complete_step("the_welcome", "meet_host"), "met the host")
	t.check(not QuestManager.complete_step("the_welcome", "first_nook"), "can't skip ahead")
	EventBus.emit_event("visit:geode_corner")
	t.check(QuestManager.is_on_step("the_welcome", "first_nook"), "the Geode Corner visit advances")
	EventBus.emit_event("nook_complete")
	t.check(QuestManager.is_done("the_welcome"), "sitting in a nook finishes it")
	t.check(PlayerState.has_tone("clear_quartz"), "reward: clear quartz")
	t.check(Services.unlocked_achievements.has("FIRST_CHIME"), "achievement unlocked")
	t.check(SongState.personal_points() >= 4.0, "song points awarded")
	t.check(PlayerState.chronicle().size() >= 1, "chronicle entry written")


func test_requirements_gate_quests(t) -> void:
	t.check(not QuestManager.can_start("the_first_column"), "the Ragana waits for The Welcome")
	t.check(not QuestManager.can_start("unstrung_echo"), "so does the echo")
	_welcome_done()
	t.check(QuestManager.can_start("the_first_column"), "now it can start")
	t.check(QuestManager.can_start("the_wolf_and_the_welcome"), "Jay's quest never waited")


func test_the_first_column_counts_unique_notes(t) -> void:
	_welcome_done()
	QuestManager.start("the_first_column")
	QuestManager.complete_step("the_first_column", "take_book")
	PlayerState.record_observation("campgrounds", "forge_chord")
	PlayerState.record_observation("campgrounds", "forge_chord")
	PlayerState.record_observation("campgrounds", "tavern_bell")
	t.check(QuestManager.is_on_step("the_first_column", "observe"), "duplicates don't count")
	PlayerState.record_observation("campgrounds", "seven_sisters")
	t.check(QuestManager.is_on_step("the_first_column", "return"), "three observations done")
	QuestManager.complete_step("the_first_column", "return")
	t.check(PlayerState.is_unlocked("ragana_lens"), "the Ragana's Lens")
	t.check(Services.unlocked_achievements.has("ADEQUATE"), "Adequate")


func test_the_wolf_and_the_welcome(t) -> void:
	QuestManager.start("the_wolf_and_the_welcome")
	EventBus.emit_event("visit:treeline")
	t.check(QuestManager.is_on_step("the_wolf_and_the_welcome", "tracks"), "the treeline")
	EventBus.emit_event("tracks", { "amount": 1 })
	EventBus.emit_event("tracks", { "amount": 1 })
	t.check(QuestManager.is_on_step("the_wolf_and_the_welcome", "tracks"), "two of three tracks")
	EventBus.emit_event("tracks", { "amount": 1 })
	t.check(QuestManager.is_on_step("the_wolf_and_the_welcome", "clearing"), "three tracks")
	EventBus.emit_event("visit:travelers_clearing")
	t.check(QuestManager.is_on_step("the_wolf_and_the_welcome", "return"), "the Traveler's Clearing")
	QuestManager.complete_step("the_wolf_and_the_welcome", "return")
	t.check(PlayerState.is_unlocked("wolfs_whistle") and PlayerState.is_unlocked("jays_ale_recipe"), "the Wolf's Whistle and Jay's Ale Recipe")


func test_tracks_found_early_still_count(t) -> void:
	for i in 3:
		EventBus.emit_event("tracks", { "amount": 1 })
	QuestManager.start("the_wolf_and_the_welcome")
	EventBus.emit_event("visit:treeline")
	t.check(QuestManager.is_on_step("the_wolf_and_the_welcome", "clearing"), "the tracks were already followed")


func test_the_seed_through_dialogue(t) -> void:
	var box := DialogueBox.new()
	t.add_child(box)
	await t.get_tree().process_frame
	t.check(box.open("catalyst"), "the Catalyst has something to say")
	var guard := 0
	while box.visible and not box.is_choosing() and guard < 30:
		box.advance()
		guard += 1
	t.check(box.is_choosing(), "a story is asked for")
	box.choose(1)
	while box.visible and guard < 60:
		box.advance()
		guard += 1
	t.eq(String(PlayerState.flag("seed_shape")), "funny", "a funny story")
	t.check(QuestManager.is_on_step("the_seed", "plant"), "the seed is in hand")
	box.queue_free()


func test_the_hands_that_remember(t) -> void:
	PlayerState.learn_stone("dendritic_agate")
	var box := DialogueBox.new()
	t.add_child(box)
	await t.get_tree().process_frame
	box.open("luna")
	var guard := 0
	while box.visible and not box.is_choosing() and guard < 30:
		box.advance()
		guard += 1
	t.check(QuestManager.is_on_step("the_hands_that_remember", "give"), "Luna recognizes the stone")
	box.choose(1)
	while box.visible and guard < 60:
		box.advance()
		guard += 1
	t.check(QuestManager.is_active("the_hands_that_remember"), "keeping it is all right")
	t.eq(PlayerState.stone_count("dendritic_agate"), 1, "still carried")
	box.open("luna")
	while box.visible and not box.is_choosing() and guard < 90:
		box.advance()
		guard += 1
	box.choose(0)
	while box.visible and guard < 120:
		box.advance()
		guard += 1
	t.check(QuestManager.is_done("the_hands_that_remember"), "given")
	t.eq(PlayerState.stone_count("dendritic_agate"), 0, "the stone went to Luna")
	t.check(PlayerState.has_tone("dendritic_agate"), "its tone stays")
	box.queue_free()


func test_the_metal_that_sings(t) -> void:
	QuestManager.start("the_metal_that_sings")
	EventBus.emit_event("forge:chord")
	t.check(QuestManager.is_on_step("the_metal_that_sings", "tune"), "the anvil rang")
	EventBus.emit_event("forge:tuned")
	t.check(QuestManager.is_done("the_metal_that_sings"), "the metal sang")
	t.check(PlayerState.is_unlocked("metal_findings"), "findings unlocked")


func test_the_host_gives_three_gifts_over_three_visits(t) -> void:
	PlayerState.begin_visit()
	DialogueBox.run_actions(DialogueBox.pick_entry("host").get("actions", []))
	t.eq(int(PlayerState.flag("host_gift_1")), 1, "first gift on the first visit")
	t.check(DialogueBox.pick_entry("host").get("actions", []).is_empty(), "no second gift the same visit")
	PlayerState.begin_visit()
	var second := DialogueBox.pick_entry("host")
	t.check(String(second["lines"][1]).contains("hear"), "the second gift is hearing it")
	DialogueBox.run_actions(second["actions"])
	PlayerState.begin_visit()
	var third := DialogueBox.pick_entry("host")
	t.check(String(third["lines"][1]).contains("feel"), "the third is feeling it")


func test_fortune_reading_is_recognition(t) -> void:
	t.check(String(DialogueBox.fortune_reading(PlayerState.profile)[0]).contains("empty"), "an empty pouch reads as just arrived")
	PlayerState.learn_stone("moss_agate")
	PlayerState.add_chronicle("Harmonized The Unstrung Echo.", "harmony")
	var lines := DialogueBox.fortune_reading(PlayerState.profile)
	t.check(String(lines[0]).begins_with("Moss Agate"), "starts from the first stone carried")
	var all := " ".join(PackedStringArray(lines))
	t.check(all.contains("listened"), "reads what the player actually did")
	for w in ["will ", "future", "someday", "soon"]:
		t.check(not all.to_lower().contains(w), "no predictions (%s)" % w)


func test_sample_faire_is_valid(t) -> void:
	var reg := FaireRegistry.new()
	reg.load_samples()
	for id in reg.faires:
		t.eq(reg.validate(reg.faires[id]).size(), 0, "sample %s valid: %s" % [id, str(reg.validate(reg.faires[id]))])


func test_faire_validation(t) -> void:
	var reg := FaireRegistry.new()
	var bad := { "faire_name": "", "layout": "castle", "palette": "neon", "booths": [], "active_until": "" }
	var problems := reg.validate(bad)
	t.check(problems.size() >= 4, "name, layout, palette and date problems: " + str(problems))
	var too_many := { "faire_name": "Big", "layout": "ring", "palette": "royal", "active_until": "2030-01-01", "booths": [] }
	for i in 7:
		too_many["booths"].append({ "sign": "Booth %d" % i, "items": [] })
	t.check(not reg.validate(too_many).is_empty(), "ring only has 6 booths")


func test_faire_rental_flow(t) -> void:
	var reg := FaireRegistry.new()
	reg.register_rental("KEY-123", "oak_hollow", "2031-06-30", "Oak Hollow Guild")
	var cfg := { "faire_name": "Oak Hollow Faire", "owner": "Oak Hollow Guild", "layout": "lane", "palette": "harvest",
		"active_until": "2099-01-01", "performers": ["Drums"], "booths": [{ "sign": "Pies", "artisan": "Pie Folk", "items": [] }] }
	t.eq(reg.save_with_key("WRONG", cfg), "That rental key isn't valid.", "bad key refused")
	t.eq(reg.save_with_key("KEY-123", cfg), "", "good key saves")
	t.eq(reg.faires["oak_hollow"]["active_until"], "2031-06-30", "owner can't extend their own rental")
	t.eq(reg.active_faires("2031-01-01").size(), 1, "open before the end date")
	t.eq(reg.active_faires("2031-07-01").size(), 0, "closed after the end date")


func test_homestead_plots_on_the_server(t) -> void:
	Net.homesteads.clear()
	t.eq(Net.assign_plot(2, "key-aaaa", "Ann"), 2, "a free plot is yours")
	t.eq(Net.assign_plot(2, "key-bbbb", "Bo"), 3, "taken: the nearest free one")
	t.eq(Net.assign_plot(7, "key-aaaa", "Ann"), 2, "one plot each; asking again keeps yours")
	t.eq(Net.assign_plot(-1, "key-cccc", "Cy"), 0, "no preference: the first free plot")
	Net.homesteads.clear()
