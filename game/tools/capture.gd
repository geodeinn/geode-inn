extends Node
## Takes screenshots of each zone and the main UI for review and milestone
## reports. Needs a renderer (not --headless):
##   godot --path . --rendering-driver opengl3_angle res://tools/capture.tscn
## Images go to test_output/shots/. Uses its own save slot.

const OUT := "res://test_output/shots/"

## Zones render into this offscreen viewport, so the capture never needs a
## visible window and can't receive keyboard or mouse input from the desktop.
var _vp: SubViewport


func _ready() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(OUT))
	var win := get_window()
	win.unfocusable = true
	win.mouse_passthrough = true
	win.size = Vector2i(96, 64)
	win.position = Vector2i(0, 0)
	_vp = SubViewport.new()
	_vp.size = Vector2i(1280, 720)
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_vp.audio_listener_enable_3d = false
	add_child(_vp)
	PlayerState.slot = "capture"
	PlayerState.new_profile("Traveler")
	PlayerState.begin_visit()
	await _shot_scene("res://scenes/main_menu.tscn", "01_main_menu", func(m: Node) -> void: m.call("_skip_boot"))
	await _shot_scene("res://scenes/main_menu.tscn", "02_boot_first_words", func(m: Node) -> void:
		m.set("_boot_t", 17.95)
		m.set("_boot_step", 5), 3, 1.7)
	await _shot_zone("main_floor", "door", "03_main_floor_axis", func(z: Node) -> void:
		z.player.set_view(0.0, -0.1))
	await _shot_zone("main_floor", "door", "04_dialogue_host", func(z: Node) -> void:
		z.player.global_position = Vector3(0.2, 0.2, 5.4)
		z.player.set_view(-2.5, -0.2)
		z.hud.dialogue.open("host"))
	await _shot_zone("main_floor", "door", "05_bar_and_garden", func(z: Node) -> void:
		z.player.global_position = Vector3(-4.6, 0.2, -5.4)
		z.player.set_view(0.75, -0.22))
	# The Geode Corner with a geode part full and the echo waiting.
	QuestManager.start("the_welcome")
	QuestManager.complete_step("the_welcome", "meet_host")
	EventBus.emit_event("visit:geode_corner")
	EventBus.emit_event("nook_complete")
	var n := 0
	for id in GameData.stones_in_zone("Main Floor"):
		if n < 24:
			PlayerState.learn_stone(id)
			n += 1
	QuestManager.start("unstrung_echo")
	await _shot_zone("main_floor", "door", "06_dragons_geode_corner", func(z: Node) -> void:
		z.player.global_position = Vector3(6.0, 0.2, -6.6)
		z.player.set_view(0.0, -0.38))
	await _shot_zone("main_floor", "door", "07_harmonize", func(z: Node) -> void:
		z.player.global_position = Vector3(5.6, 0.2, -7.4)
		z.player.set_view(0.2, -0.25)
		z.hud.harmonize.start("unstrung_echo", z.hud.pulse)
		z.hud.open_panel(z.hud.harmonize)
		z.hud.harmonize.choose(0, "smoky_quartz" if PlayerState.has_tone("smoky_quartz") else PlayerState.learned_stone_ids()[0]))
	await _shot_zone("main_floor", "door", "08_market_and_inn_tree", func(z: Node) -> void:
		z.player.global_position = Vector3(5.0, 0.2, 7.6)
		z.player.set_view(0.15, -0.2))
	await _shot_zone("main_floor", "door", "09_library_nook", func(z: Node) -> void:
		z.player.global_position = Vector3(8.6, 0.2, -3.0)
		z.player.set_view(-0.55, -0.2))
	await _shot_zone("main_floor", "door", "10_arcade", func(z: Node) -> void:
		z.player.global_position = Vector3(-6.4, 0.2, 1.4)
		z.player.set_view(PI / 2.0 + 0.15, -0.18))
	await _shot_zone("main_floor", "faire_grounds", "11_faire_grounds", func(z: Node) -> void:
		z.player.global_position = Vector3(11.6, 0.2, 5.5)
		z.player.set_view(-PI / 2.0, -0.12))
	await _shot_zone("campgrounds", "porch", "12_campgrounds_market_field", func(z: Node) -> void:
		z.player.set_view(PI, -0.2))
	await _shot_zone("campgrounds", "porch", "13_seven_sisters", func(z: Node) -> void:
		z.player.global_position = Vector3(0, 0.2, -0.5)
		z.player.set_view(PI, -0.3)
		z.circle.tap("p1", Vector3(0, 0, 8), "wood", Net.clock())
		z.circle.tap("p2", Vector3(0.5, 0, 8), "hide", Net.clock()))
	await _shot_zone("campgrounds", "porch", "14_huntsman_tavern", func(z: Node) -> void:
		z.player.global_position = Vector3(-17.8, 0.35, -7.4)
		z.player.get("_arm").spring_length = 2.4
		z.player.set_view(0.75, -0.12))
	await _shot_zone("campgrounds", "porch", "15_lunas_tent", func(z: Node) -> void:
		z.player.global_position = Vector3(14.0, 0.2, -8.0)
		z.player.set_view(0.0, -0.22))
	await _shot_zone("campgrounds", "porch", "16_forge", func(z: Node) -> void:
		z.player.global_position = Vector3(19.4, 0.2, -5.0)
		z.player.set_view(-2.7, -0.22))
	await _shot_zone("campgrounds", "porch", "17_shore_dock_lighthouse", func(z: Node) -> void:
		z.player.global_position = Vector3(-22.0, 0.2, 7.0)
		z.player.set_view(PI, -0.1))
	QuestManager.start("the_wolf_and_the_welcome")
	EventBus.emit_event("visit:treeline")
	for i in 3:
		EventBus.emit_event("tracks", { "amount": 1 })
	await _shot_zone("campgrounds", "porch", "18_travelers_clearing", func(z: Node) -> void:
		z.player.global_position = Vector3(29.0, 0.2, 24.0)
		z.player.set_view(-2.6, -0.2))
	PlayerState.claim_plot(2)
	PlayerState.homestead()["tier"] = 2
	PlayerState.homestead()["name"] = "Ivy Cottage"
	await _shot_zone("campgrounds", "porch", "19_homestead_cottage", func(z: Node) -> void:
		z.player.global_position = Vector3(-31.5, 0.2, -6.0)
		z.player.set_view(PI / 2.0 + 0.1, -0.18))
	PlayerState.add_material("block", 50)
	PlayerState.add_material("plank", 61)
	PlayerState.add_material("brick", 34)
	await _shot_zone("campgrounds", "porch", "20_homestead_panel", func(z: Node) -> void:
		z.player.global_position = Vector3(-35.0, 0.2, -6.5)
		z.hud.homestead.plot = 2
		z.hud.open_panel(z.hud.homestead))
	PlayerState.add_material("wood", 12)
	PlayerState.add_material("hemp", 8)
	PlayerState.add_material("clay", 6)
	await _shot_zone("campgrounds", "porch", "21_workbench_panel", func(z: Node) -> void:
		z.player.global_position = Vector3(-31.0, 0.2, -1.6)
		z.hud.workbench.station = "workbench"
		z.hud.open_panel(z.hud.workbench))
	await _shot_zone("campgrounds", "porch", "22_forge_tuning", func(z: Node) -> void:
		z.player.global_position = Vector3(21.2, 0.2, -1.0)
		z.hud.open_panel(z.hud.forge)
		z.hud.forge.pick(PlayerState.learned_stone_ids()[0]))
	SceneRouter.faire_config = GameData.faire["sample_faires"][0]
	await _shot_zone("faire", "entrance", "23_faire_entrance", func(z: Node) -> void:
		z.player.set_view(0.0, -0.25))
	await _shot_zone("faire", "entrance", "24_faire_booth", func(z: Node) -> void:
		z.player.global_position = Vector3(-9.5, 0.2, -2.0)
		z.player.set_view(0.6, -0.25)
		z.hud.market.prepare("Soulstice Jewelry", GameData.faire["sample_faires"][0]["booths"][0]["items"])
		z.hud.open_panel(z.hud.market))
	SceneRouter.faire_config = {}
	await _shot_zone("final_room", "corridor_top", "25_final_room_seated", func(z: Node) -> void:
		z.handle_interaction(z.get("_chair")), 90)
	await _shot_zone("main_floor", "door", "26_journal", func(z: Node) -> void:
		z.hud.open_panel(z.hud.journal))
	await _shot_zone("main_floor", "door", "27_common_room_chat", func(z: Node) -> void:
		z.player.global_position = Vector3(0, 0.2, -1.8)
		z.player.set_view(0.0, -0.2)
		EventBus.chat_received.emit({ "from": 0, "name": "The Fire", "text": "Quartz-K enters the Common Room, warming by the fire.", "ink": "gold" })
		EventBus.chat_received.emit({ "from": 5, "name": "Quartz-K", "text": "Is the Firekeeper telling a story tonight?", "ink": "sepia" })
		EventBus.chat_received.emit({ "from": 0, "name": "The Fire", "text": "The wood shifts. The room breathes.", "ink": "gold" })
		EventBus.chat_received.emit({ "from": 6, "name": "Tadpole-8", "text": "ribbit?", "ink": "green", "frog": true }))
	await _shot_zone("main_floor", "door", "28_voice_return_visit", func(z: Node) -> void:
		z.player.set_view(0.0, -0.1)
		z.hud.voice.speak(VoiceOfTheInn.line("return_visit")), 3, 1.7)
	await _shot_zone("main_floor", "door", "29_walking_past_the_wanderer", func(z: Node) -> void:
		z.player.global_position = Vector3(-3.6, 0.2, 7.4)
		z.player.set_view(0.25, -0.12))
	await _shot_zone("main_floor", "door", "30_the_hearth_fire", func(z: Node) -> void:
		z.player.global_position = Vector3(0.0, 0.2, -1.6)
		z.player.set_view(0.0, -0.2))
	print("[capture] done")
	get_tree().quit(0)


func _shot_zone(zone: String, spawn: String, file_name: String, setup: Callable, frames := 40, seconds := 0.0) -> void:
	SceneRouter.spawn_point = spawn
	SceneRouter.current_zone = zone
	await _shot_scene(SceneRouter.ZONES[zone], file_name, setup, frames, seconds)


func _shot_scene(path: String, file_name: String, setup: Callable, frames := 40, seconds := 0.0) -> void:
	var scene: PackedScene = load(path)
	var node: Node = scene.instantiate()
	_vp.add_child(node)
	for i in 3:
		await get_tree().process_frame
	setup.call(node)
	for i in frames:
		await get_tree().process_frame
	if seconds > 0.0:
		await get_tree().create_timer(seconds).timeout
	var hud: Variant = node.get("hud")
	if hud != null:
		var open_names := []
		for p in hud.get("_panels"):
			if p.visible:
				open_names.append(String(p.get_script().get_global_name()))
		print("[capture] %s panels open: %s" % [file_name, str(open_names)])
	var img := _vp.get_texture().get_image()
	img.save_png(ProjectSettings.globalize_path(OUT + file_name + ".png"))
	print("[capture] ", file_name)
	node.queue_free()
	await get_tree().process_frame
