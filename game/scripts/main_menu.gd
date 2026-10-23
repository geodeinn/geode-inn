extends Control
## Title screen: continue or start a story, play online, settings.
## Every launch begins with the boot sequence from the client's spec
## (docs/library/mechanics/boot_sequence_nurture_layer.md): silence, the 42Hz
## Song, the heartbeat, the watchers waking, and the Inn's first words, "The
## fire is lit." Then the name. Any key or click skips to the menu.
##
## Launch flags (after --):
##   --smoke-test          release check, walks every zone and quits
##   --final-room-preview  straight into the Final Room, for the client to see it
##                         (uses its own save, never the player's)

const BOOT := [
	# [seconds from start, what happens]
	[0.0, "stone_cold"],
	[3.0, "first_frequency"],
	[6.0, "heartbeat"],
	[10.0, "logo"],
	[14.0, "reading"],
	[18.0, "first_words"],
	[21.0, "title"],
	[24.0, "hub"],
]

var _status: Label
var _name: LineEdit
var _class: OptionButton
var _address: LineEdit
var _new_box: VBoxContainer
var _online_box: VBoxContainer
var _settings: SettingsPanel
var _look_panel: LookPanel
var _credits: CreditsPanel
var _chosen_look: Dictionary = {}
var _look_note: Label
var _pulse: PulseLine
var _menu: Control
var _boot_layer: Control
var _logo: Control
var _boot_title: Label
var _boot_sub: Label
var _voice: VoiceOfTheInn
var _boot_t := 0.0
var _boot_step := 0
var _booting := false


func _ready() -> void:
	theme = UITheme.get_theme()
	set_anchors_preset(Control.PRESET_FULL_RECT)
	var bg := ColorRect.new()
	bg.color = Color(0.06, 0.045, 0.03)
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(bg)
	_pulse = PulseLine.new()
	add_child(_pulse)
	_build_menu()
	_build_boot()
	Net.connected.connect(_on_connected)
	Net.connection_failed.connect(func() -> void: _status.text = "Couldn't reach that server.")
	var args := OS.get_cmdline_user_args()
	if "--smoke-test" in args:
		_skip_boot()
		SceneRouter.run_smoke_test.call_deferred()
	elif "--final-room-preview" in args:
		_skip_boot()
		_preview_final_room.call_deferred()
	elif DisplayServer.get_name() == "headless" or "--server" in args:
		_skip_boot()
	else:
		_start_boot()


func _build_menu() -> void:
	_menu = CenterContainer.new()
	_menu.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(_menu)
	var col := VBoxContainer.new()
	col.custom_minimum_size = Vector2(480, 0)
	col.add_theme_constant_override("separation", 10)
	_menu.add_child(col)
	var t := UITheme.title("THE GEODE INN", 54)
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(t)
	var sub := UITheme.text("A Subterranean Sanctuary · Est. MMXXIV", 18, UITheme.MUTED)
	sub.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(sub)
	col.add_child(HSeparator.new())
	if PlayerState.has_save():
		col.add_child(UITheme.button("Continue", _continue))
	col.add_child(UITheme.button("New story", func() -> void:
		_new_box.visible = not _new_box.visible
		_online_box.visible = false))
	_new_box = VBoxContainer.new()
	_new_box.visible = false
	col.add_child(_new_box)
	_new_box.add_child(UITheme.text("Your name", 15, UITheme.MUTED))
	_name = LineEdit.new()
	_name.max_length = 24
	_name.text = Settings.player_name
	_new_box.add_child(_name)
	_new_box.add_child(UITheme.text("Your path", 15, UITheme.MUTED))
	_class = OptionButton.new()
	_class.add_item("The Artisan Thief (a selkie jeweler who can dive)")
	_class.set_item_metadata(0, "artisan_thief")
	_class.add_item("The Tinkering Weeaboo (a changeling who fixes things)")
	_class.set_item_metadata(1, "tinkering_weeaboo")
	_new_box.add_child(_class)
	var look_row := HBoxContainer.new()
	_new_box.add_child(look_row)
	look_row.add_child(UITheme.button("Your look", func() -> void:
		_look_panel.edit(_chosen_look if not _chosen_look.is_empty() else CharacterModel.player_look(_name.text))))
	_look_note = UITheme.text("  (one is picked for you if you skip this)", 14, UITheme.MUTED)
	look_row.add_child(_look_note)
	_new_box.add_child(UITheme.button("Enter the Inn", _new_story))
	col.add_child(UITheme.button("Play together", func() -> void:
		_online_box.visible = not _online_box.visible
		_new_box.visible = false))
	_online_box = VBoxContainer.new()
	_online_box.visible = false
	col.add_child(_online_box)
	_online_box.add_child(UITheme.text("Server address", 15, UITheme.MUTED))
	_address = LineEdit.new()
	_address.text = Settings.server_address
	_online_box.add_child(_address)
	var row := HBoxContainer.new()
	_online_box.add_child(row)
	row.add_child(UITheme.button("Join", _join))
	row.add_child(UITheme.button("Host for friends", _host))
	col.add_child(UITheme.button("Settings", func() -> void: _settings.open()))
	col.add_child(UITheme.button("Credits", func() -> void: _credits.open()))
	col.add_child(UITheme.button("Quit", func() -> void: get_tree().quit()))
	_status = UITheme.text("", 16, UITheme.AMBER)
	_status.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(_status)
	_settings = SettingsPanel.new()
	add_child(_settings)
	_look_panel = LookPanel.new()
	add_child(_look_panel)
	_look_panel.look_chosen.connect(func(look: Dictionary) -> void:
		_chosen_look = look
		_look_note.text = "  (chosen)")
	_credits = CreditsPanel.new()
	add_child(_credits)
	# While a window is open the title menu steps back, so the two never overlap.
	for p in [_settings, _look_panel, _credits]:
		(p as GamePanel).visibility_changed.connect(func() -> void:
			_menu.visible = not (_settings.visible or _look_panel.visible or _credits.visible))


# ---------------------------------------------------------------- the boot sequence

func _build_boot() -> void:
	_boot_layer = Control.new()
	_boot_layer.set_anchors_preset(Control.PRESET_FULL_RECT)
	_boot_layer.mouse_filter = Control.MOUSE_FILTER_STOP
	add_child(_boot_layer)
	var black := ColorRect.new()
	black.color = Color(0.039, 0.031, 0.024)
	black.set_anchors_preset(Control.PRESET_FULL_RECT)
	black.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_boot_layer.add_child(black)
	_logo = BootLogo.new()
	_logo.modulate.a = 0.0
	_boot_layer.add_child(_logo)
	_boot_title = UITheme.title("THE GEODE INN", 58)
	_boot_title.set_anchors_preset(Control.PRESET_CENTER)
	_boot_title.offset_left = -400
	_boot_title.offset_right = 400
	_boot_title.offset_top = 20
	_boot_title.offset_bottom = 90
	_boot_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_boot_title.modulate.a = 0.0
	_boot_layer.add_child(_boot_title)
	_boot_sub = UITheme.text("A Subterranean Sanctuary · Est. MMXXIV", 18, UITheme.MUTED)
	_boot_sub.set_anchors_preset(Control.PRESET_CENTER)
	_boot_sub.offset_left = -400
	_boot_sub.offset_right = 400
	_boot_sub.offset_top = 92
	_boot_sub.offset_bottom = 120
	_boot_sub.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_boot_sub.modulate.a = 0.0
	_boot_layer.add_child(_boot_sub)
	_voice = VoiceOfTheInn.new()
	_boot_layer.add_child(_voice)


func _start_boot() -> void:
	_booting = true
	_boot_t = 0.0
	_boot_step = 0
	_menu.modulate.a = 0.0
	_pulse.visible = false


func is_booting() -> bool:
	return _booting


func _skip_boot() -> void:
	_booting = false
	_boot_layer.visible = false
	_menu.modulate.a = 1.0
	_pulse.visible = true


func _process(delta: float) -> void:
	if not _booting:
		return
	_boot_t += delta
	while _boot_step < BOOT.size() and _boot_t >= float(BOOT[_boot_step][0]):
		_boot_phase(String(BOOT[_boot_step][1]))
		_boot_step += 1
	if _boot_t >= 28.0:
		_finish_boot()


func _boot_phase(phase: String) -> void:
	match phase:
		"stone_cold":
			pass  # True silence. The Inn does not pretend to be alive before it is.
		"first_frequency":
			AudioDirector.play_freq(GameData.song_root_hz(), 25.0, "sine", 0.06, "Music")
			AudioDirector.play_freq(GameData.song_root_hz() * 4.0, 25.0, "sine", 0.02, "Music")
		"heartbeat":
			_pulse.visible = true
		"logo":
			create_tween().tween_property(_logo, "modulate:a", 1.0, 2.0)
		"reading":
			# The watchers wake before the Inn speaks.
			var watcher := float(GameData.audio.get("system", {}).get("gargoyle_frequencies_hz", {}).get("watcher", 111))
			AudioDirector.play_freq(watcher, 10.0, "sine", 0.03, "Music")
		"first_words":
			create_tween().tween_property(_logo, "modulate:a", 0.0, 2.0)
			_voice.speak(VoiceOfTheInn.line("entrance"))
		"title":
			create_tween().tween_property(_boot_title, "modulate:a", 1.0, 1.5)
			var tw := create_tween()
			tw.tween_interval(1.0)
			tw.tween_property(_boot_sub, "modulate:a", 1.0, 1.0)
		"hub":
			var tw := create_tween()
			tw.tween_property(_boot_title, "modulate:a", 0.0, 2.0)
			tw.parallel().tween_property(_boot_sub, "modulate:a", 0.0, 2.0)


func _finish_boot() -> void:
	_booting = false
	var tw := create_tween()
	tw.tween_property(_boot_layer, "modulate:a", 0.0, 1.0)
	tw.parallel().tween_property(_menu, "modulate:a", 1.0, 1.2)
	tw.tween_callback(func() -> void: _boot_layer.visible = false)
	_pulse.visible = true


func _input(event: InputEvent) -> void:
	if not _booting:
		return
	var pressed: bool = (event is InputEventKey and event.pressed) or (event is InputEventMouseButton and event.pressed) or (event is InputEventJoypadButton and event.pressed)
	if pressed:
		_finish_boot()
		get_viewport().set_input_as_handled()


# ---------------------------------------------------------------- entering

func _continue() -> void:
	if PlayerState.load_profile():
		_begin_visit()
		_enter()
	else:
		_status.text = "That save couldn't be read."


func _new_story() -> void:
	var player_name := _name.text.strip_edges()
	if player_name.is_empty():
		_status.text = "Tell the Host your name first."
		return
	Settings.player_name = player_name
	Settings.save_settings()
	PlayerState.new_profile(player_name, String(_class.get_item_metadata(_class.selected)))
	if not _chosen_look.is_empty():
		PlayerState.profile["look"] = CharacterModel.sanitize_look(_chosen_look)
	PlayerState.add_chronicle("Arrived at the Geode Inn.", "start")
	_begin_visit()
	PlayerState.save_profile()
	_enter()


## A new session in the Inn. After a long time away, the voice of the Inn
## remembers: not "welcome back", but "the fire was kept lit". Ziggy counts the days.
func _begin_visit() -> void:
	var away := PlayerState.begin_visit()
	var cfg: Dictionary = GameData.world.get("voice_of_the_inn", {})
	PlayerState.set_flag("last_absence_days", away / 86400)
	if away >= int(cfg.get("return_after_seconds", 86400)):
		SceneRouter.pending_voice = VoiceOfTheInn.line("return_visit")


func _enter() -> void:
	SceneRouter.goto("main_floor", "door")


func _ensure_profile() -> bool:
	if PlayerState.has_save() and PlayerState.load_profile():
		_begin_visit()
		return true
	var player_name := _name.text.strip_edges()
	if player_name.is_empty():
		_status.text = "Start a story first so the Inn knows your name."
		_new_box.visible = true
		return false
	PlayerState.new_profile(player_name)
	_begin_visit()
	return true


func _join() -> void:
	if not _ensure_profile():
		return
	Settings.server_address = _address.text.strip_edges()
	Settings.save_settings()
	var err := Net.join(Settings.server_address)
	_status.text = "Knocking on the door..." if err == OK else "Couldn't start the connection."


func _host() -> void:
	if not _ensure_profile():
		return
	var err := Net.host()
	if err == OK:
		_status.text = "Hosting on port %d." % Net.default_port()
		_enter()
	else:
		_status.text = "Couldn't open the port (%s)." % error_string(err)


func _on_connected() -> void:
	_status.text = "Connected."
	_enter()


## The Final Room can't be earned in the first release (it needs the endgame),
## so the client can look at it with this flag. Its own save; the real one is untouched.
func _preview_final_room() -> void:
	PlayerState.slot = "final_room_preview"
	if not PlayerState.load_profile():
		PlayerState.new_profile("Preview")
	SceneRouter.goto("final_room", "corridor_top")


## A placeholder for the Antikythera logo: a golden ring pulsing with the heartbeat.
class BootLogo extends Control:
	var judge := BeatJudge.new(50.0)

	func _ready() -> void:
		mouse_filter = Control.MOUSE_FILTER_IGNORE

	func _process(_delta: float) -> void:
		queue_redraw()

	func _draw() -> void:
		var c := get_viewport_rect().size / 2.0 + Vector2(0, -40)
		var ph := judge.phase(Net.clock())
		var pulse := 1.0 + 0.04 * exp(-ph * 7.0)
		var gold := Color(0.85, 0.66, 0.3, 0.8)
		draw_arc(c, 70.0 * pulse, 0.0, TAU, 96, gold, 2.0, true)
		draw_arc(c, 54.0 * pulse, 0.0, TAU, 96, Color(gold, 0.5), 1.4, true)
		for i in 12:
			var a := float(i) / 12.0 * TAU + Net.clock() * 0.05
			draw_line(c + Vector2(cos(a), sin(a)) * 54.0 * pulse, c + Vector2(cos(a), sin(a)) * 70.0 * pulse, Color(gold, 0.6), 1.2, true)
