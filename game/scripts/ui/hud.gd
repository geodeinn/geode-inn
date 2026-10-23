class_name HUD
extends CanvasLayer
## Everything on screen during play: the Pulse Line, the Song readout, the
## quest tracker, prompts, toasts, dialogue, chat and the windows.

var root: Control
var pulse: PulseLine
var dialogue: DialogueBox
var chat: ChatPanel
var cave: CavePanel
var harmonize: HarmonizePanel
var workbench: WorkbenchPanel
var homestead: HomesteadPanel
var forge: ForgePanel
var journal: JournalPanel
var voice: VoiceOfTheInn
var faires: FaireDirectoryPanel
var faire_editor: FaireEditorPanel
var market: MarketPanel
var settings: SettingsPanel
var pause: PausePanel
var look: LookPanel
var credits: CreditsPanel
var _prompt: Label
var _song: Label
var _quest: Label
var _toasts: VBoxContainer
var _panels: Array[GamePanel] = []


func _ready() -> void:
	layer = 10
	root = Control.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.theme = UITheme.get_theme()
	add_child(root)
	pulse = PulseLine.new()
	root.add_child(pulse)
	_song = UITheme.outline(UITheme.text("", 15, UITheme.AMBER))
	_song.autowrap_mode = TextServer.AUTOWRAP_OFF
	_song.position = Vector2(18, 12)
	root.add_child(_song)
	_quest = UITheme.outline(UITheme.text("", 16))
	_quest.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	_quest.offset_left = -470
	_quest.offset_right = -18
	_quest.offset_top = 12
	_quest.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	root.add_child(_quest)
	_prompt = UITheme.outline(UITheme.title("", 20), 6)
	_prompt.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	_prompt.offset_left = -330
	_prompt.offset_right = 470
	_prompt.offset_top = -176
	_prompt.offset_bottom = -140
	_prompt.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_toasts = VBoxContainer.new()
	_toasts.set_anchors_preset(Control.PRESET_CENTER_TOP)
	_toasts.offset_left = -300
	_toasts.offset_right = 300
	_toasts.offset_top = 48
	_toasts.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(_toasts)
	var keys := UITheme.outline(UITheme.text("E use   C sit   Space tap   G geode   J journal   T talk   Esc menu", 13, UITheme.MUTED), 4)
	keys.set_anchors_preset(Control.PRESET_BOTTOM_RIGHT)
	keys.offset_left = -470
	keys.offset_right = -16
	keys.offset_top = -84
	keys.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	root.add_child(keys)
	_keys_label = keys
	chat = ChatPanel.new()
	root.add_child(chat)
	# The use prompt sits above the chat, drawn on top of it, right of center.
	root.add_child(_prompt)
	dialogue = DialogueBox.new()
	root.add_child(dialogue)
	cave = _add_panel(CavePanel.new()) as CavePanel
	harmonize = _add_panel(HarmonizePanel.new()) as HarmonizePanel
	workbench = _add_panel(WorkbenchPanel.new()) as WorkbenchPanel
	homestead = _add_panel(HomesteadPanel.new()) as HomesteadPanel
	forge = _add_panel(ForgePanel.new()) as ForgePanel
	journal = _add_panel(JournalPanel.new()) as JournalPanel
	faires = _add_panel(FaireDirectoryPanel.new()) as FaireDirectoryPanel
	faire_editor = _add_panel(FaireEditorPanel.new()) as FaireEditorPanel
	market = _add_panel(MarketPanel.new()) as MarketPanel
	settings = _add_panel(SettingsPanel.new()) as SettingsPanel
	pause = _add_panel(PausePanel.new()) as PausePanel
	look = _add_panel(LookPanel.new()) as LookPanel
	credits = _add_panel(CreditsPanel.new()) as CreditsPanel
	voice = VoiceOfTheInn.new()
	root.add_child(voice)
	pause.journal_requested.connect(func() -> void: open_panel(journal))
	pause.settings_requested.connect(func() -> void: open_panel(settings))
	pause.credits_requested.connect(func() -> void: open_panel(credits))
	pause.look_requested.connect(func() -> void:
		look.look = CharacterModel.look_of(PlayerState.profile)
		open_panel(look))
	faires.setup_requested.connect(func() -> void: open_panel(faire_editor))
	EventBus.toast.connect(toast)
	EventBus.song_changed.connect(func(_w: float, _p: float) -> void: _refresh_song())
	EventBus.quest_started.connect(func(_q: String) -> void: _refresh_quest())
	EventBus.quest_step_completed.connect(func(_q: String, _s: String) -> void: _refresh_quest())
	EventBus.quest_completed.connect(func(_q: String) -> void: _refresh_quest())
	_refresh_song()
	_refresh_quest()


func _add_panel(p: GamePanel) -> GamePanel:
	root.add_child(p)
	_panels.append(p)
	return p


var _keys_label: Label


## Quiet mode for rooms with no UI (the Final Room): only the Pulse Line and
## a bare prompt remain, so Silent Mode players still have the heartbeat.
func set_quiet(on: bool) -> void:
	_song.visible = not on
	_quest.visible = not on
	chat.visible = not on
	if _keys_label:
		_keys_label.visible = not on


func open_panel(p: GamePanel) -> void:
	for other in _panels:
		if other != p and other.visible:
			other.visible = false
	p.open()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func any_panel_open() -> bool:
	for p in _panels:
		if p.visible:
			return true
	return false


func close_panels() -> void:
	for p in _panels:
		p.close()


func is_busy() -> bool:
	return any_panel_open() or dialogue.visible


func show_prompt(text: String) -> void:
	_prompt.text = text


func toast(text: String) -> void:
	var l := UITheme.outline(UITheme.text(text, 18, UITheme.AMBER_BRIGHT))
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_toasts.add_child(l)
	var tw := l.create_tween()
	tw.tween_interval(3.2)
	tw.tween_property(l, "modulate:a", 0.0, 0.8)
	tw.tween_callback(l.queue_free)


func _refresh_song() -> void:
	if _song == null:
		return
	var layers := SongState.perceived_layers()
	_song.text = "The Song  %.4f Hz\nYour spectrum  %.1f   (%d of %d layers)" % [SongState.world_hz(), SongState.personal_points(), layers.size(), GameData.world["song"]["spectrum_layers"].size()]


func _refresh_quest() -> void:
	var lines := PackedStringArray()
	for qid in QuestManager.active_quests():
		var step := QuestManager.current_step(qid)
		lines.append("%s\n%s" % [GameData.quests[qid]["name"], step.get("text", "")])
	_quest.text = "\n\n".join(lines.slice(0, 3))
