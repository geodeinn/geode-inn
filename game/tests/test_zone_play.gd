extends RefCounted
## Zone mechanics driven through the zone code: the SIT mechanic, gathering
## at the heartbeat, building a homestead, taps and drum circles, the Seven
## Sisters, the garden, Ziggy, observations, faire booths, the small door.


func _zone(t, path: String, spawn := "") -> Node:
	SceneRouter.spawn_point = spawn
	var zone: Node = (load(path) as PackedScene).instantiate()
	t.add_child(zone)
	for i in 3:
		await t.get_tree().process_frame
	return zone


func _find(zone: Node, kind: String, id: String) -> Interactable:
	for n in zone.get_tree().get_nodes_in_group("interactable"):
		var it := n as Interactable
		if zone.is_ancestor_of(it) and it.kind == kind and it.id == id:
			return it
	return null


func _free(t, zone: Node) -> void:
	zone.queue_free()
	await t.get_tree().process_frame


func test_the_sit_mechanic(t) -> void:
	var nook_cfg: Dictionary = GameData.world["nook"]
	var saved := nook_cfg.duplicate()
	nook_cfg["sit_seconds_to_reveal"] = 0.2
	nook_cfg["first_person_seconds"] = 0.5
	nook_cfg["you_looked_seconds"] = 1.1
	nook_cfg["detach_seconds"] = 0.8
	var zone: Node = await _zone(t, "res://scenes/zones/main_floor.tscn", "door")
	var nook := _find(zone, "nook", "window")
	zone.player.global_position = nook.global_position
	zone.handle_interaction(nook)
	t.check(zone.player.sitting, "sitting in the nook")
	t.eq(zone.hud.pulse.mode, "nook", "the heartbeat comes forward")
	t.check(AudioDirector.hum_on(), "the 42Hz hum is heard")
	var fired := [false]
	var cb := func(id: String, _d: Dictionary) -> void:
		if id == "nook_complete":
			fired[0] = true
	EventBus.game_event.connect(cb)
	# Holding still: 0.5 s before stillness counts, then the settle time.
	await t.get_tree().create_timer(1.3).timeout
	t.check(fired[0], "settling in completes the nook")
	var revealed := 0
	for n in zone.get_tree().get_nodes_in_group("nook_reveal"):
		if n.visible:
			revealed += 1
	t.check(revealed > 0, "the hidden layer shows while sitting")
	t.check(zone.player.first_person, "the SIT Lock: first person")
	await t.get_tree().create_timer(0.6).timeout
	EventBus.game_event.disconnect(cb)
	t.check(Services.unlocked_achievements.has("YOU_LOOKED"), "You Looked")
	t.check(zone.player.detached, "the camera steps outside for a moment")
	await t.get_tree().create_timer(0.9).timeout
	t.check(not zone.player.detached, "and comes back")
	t.check(zone.player.first_person, "to the SIT Lock")
	zone.player.sitting = false
	await t.get_tree().process_frame
	await t.get_tree().process_frame
	t.eq(zone.hud.pulse.mode, "baseline", "standing up restores the line")
	t.check(not zone.player.first_person, "third person again")
	t.check(not AudioDirector.hum_on(), "the hum fades")
	for key in saved:
		nook_cfg[key] = saved[key]
	await _free(t, zone)


func test_gathering_at_the_heartbeat(t) -> void:
	var zone: Node = await _zone(t, "res://scenes/zones/campgrounds.tscn", "porch")
	var tree := _find(zone, "gather", "tree")
	zone.player.global_position = tree.global_position + Vector3(1.0, 0.2, 0)
	await t.get_tree().process_frame
	zone.handle_interaction(tree)
	t.check(zone.is_gathering(), "felling begins")
	var cap := int(GameData.gather_nodes["tree"]["capacity"])
	for i in cap:
		zone.gather_beat()
	t.eq(PlayerState.material_count("wood"), cap, "one log per heartbeat")
	t.check(not tree.enabled, "the tree rests")
	t.check(not zone.is_gathering(), "and the work stops")
	zone.handle_interaction(tree)
	t.check(not zone.is_gathering(), "can't gather from a resting tree")
	await _free(t, zone)


func test_gathering_waits_for_the_beat(t) -> void:
	var zone: Node = await _zone(t, "res://scenes/zones/campgrounds.tscn", "porch")
	var reeds := _find(zone, "gather", "reeds")
	zone.player.global_position = reeds.global_position + Vector3(0.8, 0.2, 0)
	await t.get_tree().process_frame
	zone.handle_interaction(reeds)
	await t.get_tree().create_timer(2.6).timeout
	var got := PlayerState.material_count("thatch")
	t.check(got >= 1 and got <= 3, "about one bundle of thatch per beat in 2.6 s (got %d)" % got)
	zone.player.global_position += Vector3(2.0, 0, 0)
	await t.get_tree().process_frame
	await t.get_tree().process_frame
	t.check(not zone.is_gathering(), "walking away stops the work")
	await _free(t, zone)


func test_build_a_lean_to(t) -> void:
	var zone: Node = await _zone(t, "res://scenes/zones/campgrounds.tscn", "porch")
	var plot := _find(zone, "plot", "plot_1")
	zone.handle_interaction(plot)
	t.check(zone.hud.homestead.visible, "the plot opens")
	zone.hud.homestead.claim()
	t.eq(int(PlayerState.homestead()["plot"]), 1, "claimed plot 1")
	PlayerState.add_material("wood", 10)
	PlayerState.add_material("rope", 20)
	PlayerState.add_material("bundle", 15)
	zone.hud.homestead.refresh()
	zone.hud.homestead.get("_name_edit").text = "The Little Roof"
	t.check(zone.hud.homestead.build(), "built from the panel")
	t.eq(PlayerState.homestead_tier(), 1, "a lean-to")
	t.check(Services.unlocked_achievements.has("FIRST_ROOF"), "It Stands")
	t.check(zone.hud.dialogue.visible and zone.hud.dialogue.character_id == "ragana", "the Ragana comes to measure")
	t.eq(String(zone.hud.dialogue.get("_lines")[0]), "It stands. Adequate.", "the verdict")
	await t.get_tree().process_frame
	var holder: Node3D = zone.get("_plot_nodes")[1]
	t.check(holder.get_child_count() > 4, "the lean-to is drawn on the plot")
	t.check(_find(zone, "nook", "home") != null, "and there's a seat inside")
	await _free(t, zone)


func test_tapping_and_pluck(t) -> void:
	var zone: Node = await _zone(t, "res://scenes/zones/campgrounds.tscn", "porch")
	zone.player.global_position = Vector3(2.4, 0.2, 10.4)
	await t.get_tree().process_frame
	var surface: Node3D = zone.nearest_surface(zone.player.global_position)
	t.check(surface != null and String(surface.get_meta("surface")) == "hide", "the bongo is at hand")
	var ignited := [false]
	var cb := func(id: String, _d: Dictionary) -> void:
		if id == "circle:ignited":
			ignited[0] = true
	EventBus.game_event.connect(cb)
	for i in 4:
		zone.call("_on_tap")
		await t.get_tree().create_timer(0.75).timeout
	t.check(zone.call("pluck_is_playing"), "Pluck arrives and plays along")
	await t.get_tree().create_timer(1.2).timeout
	EventBus.game_event.disconnect(cb)
	t.check(ignited[0], "two tappers: the circle lights")
	t.check(zone.call("circle_lit_near", Vector3(0, 0, 8)), "lit at the Seven Sisters")
	t.check(SongState.personal_points() >= 1.0, "strangers harmonizing feeds the Song")
	t.eq(String(zone.hud.get("_prompt").text), "", "no prompt, no UI")
	await _free(t, zone)


func test_the_seven_sisters_chord(t) -> void:
	var zone: Node = await _zone(t, "res://scenes/zones/campgrounds.tscn", "porch")
	var sisters := []
	for n in zone.get_tree().get_nodes_in_group("tap_surface"):
		if zone.is_ancestor_of(n) and n.has_meta("sister"):
			sisters.append(n)
	sisters.sort_custom(func(a: Node, b: Node) -> bool: return int(a.get_meta("sister")) < int(b.get_meta("sister")))
	# Light a circle at the fire first: a stranger joins in.
	zone.circle.tap("p9", Vector3(0, 0, 8), "wood", Net.clock())
	for s in sisters:
		zone.player.global_position = (s as Node3D).global_position + Vector3(0, 0.2, 0)
		zone.call("_on_tap")
	t.check(Services.unlocked_achievements.has("SEVEN_SISTERS"), "all seven in one lit circle: the ring's chord")
	await _free(t, zone)


func test_remote_taps_are_heard(t) -> void:
	var zone: Node = await _zone(t, "res://scenes/zones/campgrounds.tscn", "porch")
	zone.call("_on_remote_tap", 42, Vector3(0, 0, 8), "sister:3")
	zone.call("_on_remote_tap", 43, Vector3(0.5, 0, 8), "wood")
	t.check(zone.call("circle_lit_near", Vector3(0, 0, 8)), "two other players tapping light a circle too")
	await _free(t, zone)


func test_the_anvil_and_the_forge_panel(t) -> void:
	var zone: Node = await _zone(t, "res://scenes/zones/campgrounds.tscn", "porch")
	PlayerState.learn_stone("clear_quartz")
	QuestManager.start("the_metal_that_sings")
	zone.handle_interaction(_find(zone, "anvil", "anvil"))
	t.check(QuestManager.is_on_step("the_metal_that_sings", "tune"), "the anvil's chord")
	zone.handle_interaction(_find(zone, "anvil", "anvil"))
	var forge: ForgePanel = zone.hud.forge
	t.check(forge.visible, "the anvil opens the tuning")
	forge.pick("clear_quartz")
	var guard := 0
	while not QuestManager.is_done("the_metal_that_sings") and guard < 200:
		forge.nudge(-5.0 if forge.finding_cents > 0.0 else 5.0)
		guard += 1
	t.check(QuestManager.is_done("the_metal_that_sings"), "the metal sang when it matched")
	await _free(t, zone)


func test_the_wolfs_paths(t) -> void:
	var zone: Node = await _zone(t, "res://scenes/zones/campgrounds.tscn", "porch")
	QuestManager.start("the_wolf_and_the_welcome")
	EventBus.emit_event("visit:treeline")
	for i in 3:
		zone.handle_interaction(_find(zone, "track", "track_%d" % i))
	zone.handle_interaction(_find(zone, "track", "track_0"))
	t.eq(QuestManager.counter("tracks"), 3.0, "each track counts once")
	t.check(PlayerState.stone_count("dendritic_agate") == 1, "something on the wolf's path for Luna")
	t.check(QuestManager.is_on_step("the_wolf_and_the_welcome", "clearing"), "on to the clearing")
	await _free(t, zone)


func test_the_garden_grows_a_companion(t) -> void:
	var zone: Node = await _zone(t, "res://scenes/zones/main_floor.tscn", "door")
	QuestManager.start("the_seed")
	PlayerState.set_flag("seed_shape", "brave")
	QuestManager.complete_step("the_seed", "tell")
	zone.call("garden", 1)
	t.check(QuestManager.is_on_step("the_seed", "grow"), "planted")
	zone.call("garden", 1)
	t.check(not QuestManager.is_done("the_seed"), "not yet: patience")
	PlayerState.set_flag("seed_planted_unix", int(Time.get_unix_time_from_system()) - 600)
	zone.call("garden", 1)
	t.check(QuestManager.is_done("the_seed"), "it grew")
	t.check(PlayerState.has_companion("Ember"), "a brave story grows a bold companion")
	t.check(PlayerState.is_unlocked("catalysts_recipe"), "the Catalyst's Recipe")
	await t.get_tree().process_frame
	var humble := _find(zone, "humble", "broom")
	t.check(humble != null and humble.visible, "and now the broom has opinions")
	await _free(t, zone)


func test_finding_ziggy(t) -> void:
	var zone: Node = await _zone(t, "res://scenes/zones/main_floor.tscn", "door")
	var z := _find(zone, "ziggy", "ziggy")
	var hidden_at := z.global_position
	zone.handle_interaction(z)
	t.check(PlayerState.flag("found_ziggy"), "found")
	t.check(Services.unlocked_achievements.has("FOUND_ZIGGY"), "Hide and Seek")
	t.check(z.global_position.distance_to(hidden_at) > 3.0, "the geode rim is home now")
	await _free(t, zone)


func test_observations_in_world(t) -> void:
	var zone: Node = await _zone(t, "res://scenes/zones/campgrounds.tscn", "porch")
	zone.handle_interaction(_find(zone, "observe", "forge_chord"))
	zone.handle_interaction(_find(zone, "observe", "forge_chord"))
	t.eq(PlayerState.observations("campgrounds").size(), 1, "one note for the forge, not two")
	await _free(t, zone)


func test_market_stall_and_phrasing_law(t) -> void:
	var zone: Node = await _zone(t, "res://scenes/zones/main_floor.tscn", "door")
	zone.handle_interaction(_find(zone, "booth", "stall_0"))
	await t.get_tree().process_frame
	await t.get_tree().process_frame
	var market: MarketPanel = zone.hud.market
	t.check(market.visible, "the Artifacts stall opens")
	var text := ""
	for c in market.body.find_children("*", "Label", true, false):
		text += (c as Label).text + "\n"
	t.check(text.contains("The Aurora Pendant"), "the canon catalog")
	t.check(text.contains("beyond the door"), "the one that travels")
	for w in ["$", "website", "real world", "geodeinn", "shop online"]:
		t.check(not text.to_lower().contains(w), "never names the fourth wall (%s)" % w)
	await _free(t, zone)


func test_faire_booth_and_visit(t) -> void:
	SceneRouter.faire_config = GameData.faire["sample_faires"][0]
	var zone: Node = await _zone(t, "res://scenes/zones/faire.tscn", "entrance")
	var points := SongState.personal_points()
	t.check(points >= 1.0, "a faire visit adds to the Song")
	zone.handle_interaction(_find(zone, "booth", "Soulstice Jewelry"))
	await t.get_tree().process_frame
	await t.get_tree().process_frame
	t.check(zone.hud.market.visible, "booth opens the market")
	t.check(zone.hud.market.body.get_child_count() >= 4, "Soulstice's pieces are listed")
	SceneRouter.faire_config = {}
	await _free(t, zone)


func test_the_small_door(t) -> void:
	var p := PlayerState.profile
	var cfg := FinalRoomRules.cfg()
	for level in cfg["levels"]:
		p["flags"]["visited_level:" + String(level)] = true
	for choice in cfg["endgame_choices"]:
		p["flags"]["endgame_choice:" + String(choice)] = true
	for point in cfg["silica_thread_points"]:
		p["flags"]["silica_thread:" + String(point)] = true
	p["flags"]["achievement:INTENTION"] = true
	p["flags"]["egg_hatched"] = true
	p["flags"]["whisper_acknowledged"] = true
	var n := 0
	for id in GameData.stone_order:
		if n >= 100:
			break
		p["learned_stones"][id] = true
		n += 1
	var zone: Node = await _zone(t, "res://scenes/zones/main_floor.tscn", "faire_grounds")
	t.check(not (zone.get("_small_door") as Node3D).visible, "not by the side door: only through the main entrance")
	await _free(t, zone)
	zone = await _zone(t, "res://scenes/zones/main_floor.tscn", "door")
	t.check((zone.get("_small_door") as Node3D).visible, "earned, and through the main entrance: the small door is there")
	t.check(_find(zone, "trigger", "small_door").prompt.is_empty(), "no sign, no label, no prompt")
	await _free(t, zone)


func test_the_final_room(t) -> void:
	var cfg: Dictionary = GameData.world["final_room"]
	var saved := cfg.duplicate()
	cfg["presence_seconds"] = 0.3
	cfg["achievement_seconds"] = 0.5
	cfg["cup_look_seconds"] = 0.3
	var toasts := [0]
	var tcb := func(_s: String) -> void: toasts[0] += 1
	var zone: Node = await _zone(t, "res://scenes/zones/final_room.tscn", "corridor_top")
	EventBus.toast.connect(tcb)
	t.check(bool(FinalRoomRules.record(PlayerState.profile)["entered"]), "the visit is recorded")
	zone.handle_interaction(_find(zone, "chair", "chair"))
	t.check(zone.player.sitting and zone.player.first_person, "sitting in the chair, first person")
	t.eq(_find(zone, "chair", "chair").prompt, "Stand.", "the only words: Sit. Stand.")
	var cup: Node3D = zone.get("_cup_node")
	var cam: Camera3D = zone.player.camera
	# The spring arm pulls the camera in on the next physics frames.
	await t.get_tree().create_timer(0.15).timeout
	var dir := cup.global_position - cam.global_position
	zone.player.set_view(atan2(-dir.x, -dir.z), asin(clampf(dir.y / dir.length(), -1.0, 1.0)))
	await t.get_tree().create_timer(0.8).timeout
	t.check(bool(FinalRoomRules.record(PlayerState.profile)["presence_acknowledged"]), "the presence")
	t.check(zone.hud.pulse.second_offset >= 0.0, "a second heartbeat joins")
	t.check(Services.unlocked_achievements.has("INN_HOME"), "the silent achievement")
	t.check((_find(zone, "cup", "cup") as Interactable).enabled, "looking at the cup brings Drink")
	zone.handle_interaction(_find(zone, "cup", "cup"))
	t.check(bool(FinalRoomRules.record(PlayerState.profile)["drank_this_visit"]), "the cup is warm. That's it.")
	EventBus.toast.disconnect(tcb)
	t.eq(toasts[0], 0, "no toasts, no text in the Final Room")
	for key in saved:
		cfg[key] = saved[key]
	await _free(t, zone)


func test_offline_chat_echoes(t) -> void:
	var got := [""]
	var cb := func(e: Dictionary) -> void: got[0] = String(e["text"])
	EventBus.chat_received.connect(cb)
	Net.send_chat("  hello inn  ")
	EventBus.chat_received.disconnect(cb)
	t.eq(got[0], "hello inn", "solo chat shows your own line")


func test_whistle_outdoors_only(t) -> void:
	PlayerState.unlock("wolfs_whistle")
	var zone: Node = await _zone(t, "res://scenes/zones/main_floor.tscn", "door")
	zone.whistle()
	t.check(not zone.has_wolf(), "the wolf won't hear it indoors")
	await _free(t, zone)
	zone = await _zone(t, "res://scenes/zones/campgrounds.tscn", "porch")
	zone.whistle()
	t.check(zone.has_wolf(), "outdoors, the wolf comes running")
	await _free(t, zone)
