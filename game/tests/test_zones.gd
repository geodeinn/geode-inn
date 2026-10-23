extends RefCounted
## Every zone loads, builds, and runs for a few frames without errors, and the
## things the quests need are actually in the world.


func _load_zone(t, path: String, spawn := "") -> Node:
	SceneRouter.spawn_point = spawn
	var scene: PackedScene = load(path)
	var zone: Node = scene.instantiate()
	t.add_child(zone)
	for i in 5:
		await t.get_tree().process_frame
	return zone


func _kinds(zone: Node) -> Dictionary:
	var out := {}
	for n in zone.get_tree().get_nodes_in_group("interactable"):
		if zone.is_ancestor_of(n):
			var it := n as Interactable
			out[it.kind + ":" + it.id] = it
	return out


func _free(t, zone: Node) -> void:
	zone.queue_free()
	await t.get_tree().process_frame


func test_main_floor(t) -> void:
	var zone: Node = await _load_zone(t, "res://scenes/zones/main_floor.tscn", "door")
	var k := _kinds(zone)
	for want in ["npc:host", "npc:ragana", "npc:catalyst", "npc:firekeeper", "npc:naut", "npc:wanderer", "npc:brindle",
			"cave:pedestal", "trigger:corner_entry", "being:unstrung_echo", "portal:front_door", "nook:window", "nook:hearth_w",
			"nook:library", "signpost:faires", "ziggy:ziggy", "garden:bed_0", "cabinet:game_standing_stones", "score_stone:score_stone",
			"booth:stall_0", "stair_top:staircase"]:
		t.check(k.has(want), "main floor has " + want)
	t.check(not k.has("npc:charles"), "Charles is by the fire, not talked to")
	t.check(zone.get_node_or_null("NPC_charles") != null, "but Charles is there")
	t.check(not k.has("npc:crone") and not k.has("npc:marijke"), "the old names are gone")
	var player: Player = zone.get("player")
	t.check(player != null and player.global_position.distance_to(Vector3(0, 0.2, 8.6)) < 1.0, "player spawned inside the door")
	t.check(not (zone.get("_small_door") as Node3D).visible, "no small door until it's been earned")
	var hud: HUD = zone.get("hud")
	await t.get_tree().process_frame
	t.check(hud.pulse.size.x > 100.0, "the Pulse Line spans the screen (width %d)" % int(hud.pulse.size.x))
	await _free(t, zone)


func test_the_axis(t) -> void:
	# The front door, the hearth and the staircase in a single framed axis.
	var zone: Node = await _load_zone(t, "res://scenes/zones/main_floor.tscn", "door")
	var door := (_kinds(zone)["portal:front_door"] as Node3D).global_position
	var hearth := (zone.get_node("Hearth") as Node3D).global_position
	var stairs := (zone.get_node("StairDoor") as Node3D).global_position
	t.near(door.x, 0.0, 0.01, "door on the axis")
	t.near(hearth.x, 0.0, 0.01, "hearth on the axis")
	t.near(stairs.x, 0.0, 0.01, "staircase on the axis")
	t.check(door.z > hearth.z and hearth.z > stairs.z, "door, then hearth, then stairs")
	var bar := (zone.get_node("Bar") as Node3D).global_position
	t.check(absf(bar.x - hearth.x) < 8.0 and bar.z < -8.0, "the bar is in the wall beside the fire")
	await _free(t, zone)


func test_campgrounds(t) -> void:
	var zone: Node = await _load_zone(t, "res://scenes/zones/campgrounds.tscn", "porch")
	var k := _kinds(zone)
	for want in ["npc:jay", "npc:wisteria", "npc:luna", "npc:blacksmith", "npc:fortune", "npc:zeke", "npc:owl",
			"anvil:anvil", "workbench:forge_fire", "workbench:westbench", "plot:plot_0", "plot:plot_11", "track:track_0",
			"trigger:treeline", "trigger:clearing", "trigger:tavern_entry", "tide_chart:tide_chart", "observe:forge_chord",
			"gather:tree", "gather:reeds", "gather:ore_seam", "nook:luna_watch", "nook:tavern", "portal:inn_door", "vendor:vendor_0"]:
		t.check(k.has(want), "campgrounds has " + want)
	t.check(not k.has("being:bog_wisp") and not k.has("signpost:faires"), "no Bog, and the faire signpost moved inside")
	var obs := 0
	for key in k.keys():
		if String(key).begins_with("observe:"):
			obs += 1
	t.check(obs >= 3, "enough observations for The First Column")
	var sisters := 0
	for n in zone.get_tree().get_nodes_in_group("tap_surface"):
		if zone.is_ancestor_of(n) and n.has_meta("sister"):
			sisters += 1
	t.eq(sisters, 7, "seven sisters, each an instrument")
	var far := (_kinds(zone)["npc:fortune"] as Node3D).global_position.distance_to(Vector3(0, 0, -26))
	for key in ["npc:jay", "npc:luna", "npc:blacksmith", "npc:zeke"]:
		t.check((_kinds(zone)[key] as Node3D).global_position.distance_to(Vector3(0, 0, -26)) < far, "the Fortune Teller is farther from the Inn than " + key)
	await _free(t, zone)


func test_faire_builds_from_config(t) -> void:
	SceneRouter.faire_config = GameData.faire["sample_faires"][0]
	var zone: Node = await _load_zone(t, "res://scenes/zones/faire.tscn", "entrance")
	var k := _kinds(zone)
	t.check(k.has("booth:Soulstice Jewelry"), "Soulstice booth exists")
	t.check(k.has("portal:exit"), "exit back to the Inn")
	t.eq(String(k["portal:exit"].data["zone"]), "main_floor", "through the Faire Grounds")
	t.check(k.has("trigger:arrived"), "arrival trigger")
	SceneRouter.faire_config = {}
	await _free(t, zone)


func test_final_room_builds(t) -> void:
	var zone: Node = await _load_zone(t, "res://scenes/zones/final_room.tscn", "corridor_top")
	var k := _kinds(zone)
	t.check(k.has("chair:chair") and k.has("cup:cup"), "the chair and the cup")
	t.check(not (k["cup:cup"] as Interactable).enabled, "Drink only after looking at the cup")
	t.check(zone.get("single_player") and zone.get("plain_prompts"), "single-player, plain prompts")
	t.check(zone.hud.pulse.speaker_muted, "the heartbeat is felt, not heard")
	t.check(not zone.get("taps_enabled"), "nothing to tap in here")
	await _free(t, zone)


func test_main_menu_loads(t) -> void:
	var scene: PackedScene = load("res://scenes/main_menu.tscn")
	var menu: Node = scene.instantiate()
	t.add_child(menu)
	await t.get_tree().process_frame
	t.check(menu.get_child_count() > 0, "menu built")
	t.check(not menu.call("is_booting"), "no boot sequence when headless")
	menu.queue_free()
	await t.get_tree().process_frame


func test_dialogue_runs_actions(t) -> void:
	var zone: Node = await _load_zone(t, "res://scenes/zones/main_floor.tscn", "door")
	var hud: HUD = zone.get("hud")
	t.check(hud.dialogue.open("host"), "the Host has something to say")
	t.eq(String(hud.dialogue.get("_lines")[0]), "Come in, you're safe here.", "the Host's first line is canon")
	var guard := 0
	while hud.dialogue.visible and guard < 50:
		hud.dialogue.advance()
		guard += 1
	t.check(QuestManager.is_on_step("the_welcome", "see_corner"), "talking to the Host starts The Welcome")
	await _free(t, zone)


func test_full_first_hour(t) -> void:
	# Plays the opening quests through the same calls the UI makes.
	var zone: Node = await _load_zone(t, "res://scenes/zones/main_floor.tscn", "door")
	var hud: HUD = zone.get("hud")
	hud.dialogue.open("host")
	while hud.dialogue.visible:
		hud.dialogue.advance()
	EventBus.emit_event("visit:geode_corner")
	EventBus.emit_event("nook_complete")
	t.check(QuestManager.is_done("the_welcome"), "The Welcome done")
	t.check(zone.call("gem_count") >= 1, "the geode has its first gem")
	hud.dialogue.open("host")
	while hud.dialogue.visible:
		hud.dialogue.advance()
	t.check(QuestManager.is_active("unstrung_echo"), "the Host sends you to the echo")
	t.check(zone.call("being_available", "unstrung_echo"), "the echo can be answered now")
	EventBus.emit_event("visit:geode_corner")
	hud.harmonize.start("unstrung_echo", hud.pulse)
	hud.open_panel(hud.harmonize)
	hud.harmonize.choose(0, "clear_quartz")
	t.check(QuestManager.is_done("unstrung_echo"), "answering it finishes the quest")
	t.check(PlayerState.has_companion("Echo"), "Echo stays close")
	t.check(hud.pulse.merged, "the two Pulse Lines merged")
	t.check(Services.unlocked_achievements.has("FIRST_HARMONY"), "achievement")
	hud.close_panels()
	hud.dialogue.open("ragana")
	while hud.dialogue.visible:
		hud.dialogue.advance()
	t.check(QuestManager.is_on_step("the_first_column", "observe"), "the Ragana's notebook")
	await _free(t, zone)
