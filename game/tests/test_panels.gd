extends RefCounted
## Every window opens, shows content, and closes, in a real zone.


func test_every_panel_opens(t) -> void:
	SceneRouter.spawn_point = "porch"
	var zone: Node = (load("res://scenes/zones/campgrounds.tscn") as PackedScene).instantiate()
	t.add_child(zone)
	await t.get_tree().process_frame
	var hud: HUD = zone.get("hud")
	hud.homestead.plot = 0
	var panels := {
		"cave": hud.cave, "workbench": hud.workbench, "homestead": hud.homestead, "forge": hud.forge, "journal": hud.journal,
		"faires": hud.faires, "faire_editor": hud.faire_editor, "settings": hud.settings, "pause": hud.pause,
	}
	for key in panels.keys():
		var p: GamePanel = panels[key]
		hud.open_panel(p)
		await t.get_tree().process_frame
		t.check(p.visible, key + " is visible")
		t.check(p.body.get_child_count() > 0, key + " has content")
		t.check(hud.any_panel_open(), key + " counts as open")
		hud.close_panels()
		t.check(not p.visible, key + " closes")
	hud.workbench.station = "forge"
	hud.open_panel(hud.workbench)
	t.check(hud.workbench.get("_title").text == "The Forge", "the forge's own recipes")
	hud.close_panels()
	zone.queue_free()
	await t.get_tree().process_frame


func test_panels_stay_open(t) -> void:
	SceneRouter.spawn_point = "door"
	var zone: Node = (load("res://scenes/zones/main_floor.tscn") as PackedScene).instantiate()
	t.add_child(zone)
	await t.get_tree().process_frame
	var hud: HUD = zone.get("hud")
	for p in [hud.settings, hud.journal, hud.cave]:
		hud.open_panel(p)
		for i in 40:
			await t.get_tree().process_frame
		t.check(p.visible, "%s still open after 40 frames" % p.get_script().get_global_name())
		hud.close_panels()
	zone.queue_free()
	await t.get_tree().process_frame


func test_workbench_makes_things(t) -> void:
	SceneRouter.spawn_point = "porch"
	var zone: Node = (load("res://scenes/zones/campgrounds.tscn") as PackedScene).instantiate()
	t.add_child(zone)
	await t.get_tree().process_frame
	var hud: HUD = zone.get("hud")
	PlayerState.add_material("hemp", 7)
	hud.workbench.station = "workbench"
	hud.open_panel(hud.workbench)
	t.eq(hud.workbench.make("rope", 5), 5, "five rope")
	t.eq(hud.workbench.make("rope", 99), 2, "the rest of the hemp")
	t.eq(PlayerState.material_count("rope"), 7, "seven rope")
	hud.close_panels()
	zone.queue_free()
	await t.get_tree().process_frame


func test_chat_has_no_report_or_mute(t) -> void:
	var src := FileAccess.get_file_as_string("res://scripts/ui/chat_panel.gd")
	for word in ["\"Report\"", "\"Mute\"", "report_player", "_muted"]:
		t.check(not src.contains(word), "the Common Room has no %s: the community is the moderation" % word)
	var net_src := FileAccess.get_file_as_string("res://scripts/autoload/net.gd")
	t.check(not net_src.contains("rpc_report"), "and the server takes no reports")


func test_chat_folds_when_quiet_and_prompt_stays_on_top(t) -> void:
	SceneRouter.spawn_point = "door"
	var zone: Node = (load("res://scenes/zones/main_floor.tscn") as PackedScene).instantiate()
	t.add_child(zone)
	await t.get_tree().process_frame
	var hud: HUD = zone.get("hud")
	Net.send_chat("hello")
	await t.get_tree().process_frame
	t.check(not hud.chat.is_folded(), "a new line opens the log")
	hud.chat.set("_last_line_at", Time.get_ticks_msec() / 1000.0 - 30.0)
	await t.get_tree().process_frame
	t.check(hud.chat.is_folded(), "a quiet room folds the log away")
	var prompt: Control = hud.get("_prompt")
	t.check(prompt.get_index() > hud.chat.get_index(), "the use prompt is drawn over the chat")
	var flames := 0
	for n in zone.get_tree().get_nodes_in_group("flame"):
		if zone.is_ancestor_of(n):
			flames += 1
	t.check(flames >= 2, "the hearth and Naut's fire are flames, not glowing balls")
	zone.queue_free()
	await t.get_tree().process_frame


func test_voice_of_the_inn(t) -> void:
	var v := VoiceOfTheInn.new()
	t.add_child(v)
	await t.get_tree().process_frame
	EventBus.inn_voice.emit(VoiceOfTheInn.line("entrance"))
	t.check(v.is_speaking(), "the voice speaks")
	t.eq(v.showing(), "The fire is lit.", "the first words at every launch")
	v.queue_free()
	await t.get_tree().process_frame


func test_faire_editor_collects_a_valid_faire(t) -> void:
	SceneRouter.spawn_point = "porch"
	var zone: Node = (load("res://scenes/zones/campgrounds.tscn") as PackedScene).instantiate()
	t.add_child(zone)
	await t.get_tree().process_frame
	var hud: HUD = zone.get("hud")
	hud.open_panel(hud.faire_editor)
	var ed := hud.faire_editor
	ed.get("_name").text = "Willow Green Faire"
	ed.get("_owner").text = "Willow Guild"
	ed.get("_performers").text = "Drums, Lute"
	var rows: Array = ed.get("_booth_rows")
	t.check(rows.size() > 0, "booth rows built for the default layout")
	rows[0][0].text = "Candles"
	rows[0][1].text = "Wick and Co"
	var cfg: Dictionary = ed.collect()
	var reg := FaireRegistry.new()
	t.eq(reg.validate(cfg).size(), 0, "the editor's faire is valid: " + str(reg.validate(cfg)))
	t.eq(cfg["performers"].size(), 2, "two performers")
	t.eq(cfg["booths"].size(), 1, "one filled booth")
	zone.queue_free()
	await t.get_tree().process_frame
