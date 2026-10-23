class_name ChatPanel
extends PanelContainer
## Zone chat, always on screen (bottom left), built to the Common Room spec:
## no accounts, no records, no admin, no reports, no mutes. A new traveler
## warms by the fire before speaking. The only tool anyone has is the frog,
## and only after two minutes by the fire. Press T to talk.

signal typing_changed(is_typing: bool)

const INK := { "sepia": "#d8cfc0", "gold": "#c4954a", "green": "#8fb84a" }

var _log: RichTextLabel
var _input: LineEdit
var _people: VBoxContainer
var _status: Label
var _footer: Label
var _can_speak_at := 0.0
var _can_frog_at := 0.0


func _ready() -> void:
	set_anchors_preset(Control.PRESET_BOTTOM_LEFT)
	offset_left = 14
	offset_right = 444
	offset_bottom = -86
	offset_top = -140
	modulate.a = 0.88
	var col := VBoxContainer.new()
	add_child(col)
	_log = RichTextLabel.new()
	_log.bbcode_enabled = true
	_log.scroll_following = true
	_log.custom_minimum_size = Vector2(400, 120)
	_log.visible = false
	_log.add_theme_font_size_override("normal_font_size", 15)
	col.add_child(_log)
	_input = LineEdit.new()
	_input.placeholder_text = "Press T to speak to the room..."
	_input.max_length = int(GameData.world.get("moderation", {}).get("chat_max_len", 500))
	_input.text_submitted.connect(_send)
	_input.focus_entered.connect(func() -> void: typing_changed.emit(true))
	_input.focus_exited.connect(func() -> void: typing_changed.emit(false))
	col.add_child(_input)
	_status = UITheme.text("", 13, UITheme.AMBER)
	col.add_child(_status)
	_people = VBoxContainer.new()
	col.add_child(_people)
	_footer = UITheme.text("No accounts. No records. No archives. What you say here stays in the room. When you leave, it's gone. Forever.", 11, UITheme.MUTED.darkened(0.15))
	_footer.visible = false
	col.add_child(_footer)
	EventBus.chat_received.connect(_on_line)
	Net.vote_result.connect(func(msg: String) -> void: _status.text = msg)
	Net.chat_refused.connect(func(msg: String) -> void: _status.text = msg)
	Net.welcomed.connect(_on_welcomed)


func _on_welcomed(_display_name: String, speak_wait: float, frog_wait: float) -> void:
	var now := Time.get_unix_time_from_system()
	_can_speak_at = now + speak_wait
	_can_frog_at = now + frog_wait


func speak_wait() -> float:
	return maxf(0.0, _can_speak_at - Time.get_unix_time_from_system()) if Net.is_online() else 0.0


## The log folds away when the room has been quiet for a while, so it doesn't
## sit over the world. The next line brings it back.
const QUIET_FOLD_S := 20.0
var _last_line_at := 0.0


func _fold_if_quiet() -> void:
	if _log.visible and not _input.has_focus() and Time.get_ticks_msec() / 1000.0 - _last_line_at > QUIET_FOLD_S:
		_log.visible = false
		_footer.visible = false
		offset_top = -140


func is_folded() -> bool:
	return not _log.visible


func _process(_delta: float) -> void:
	_fold_if_quiet()
	if not Net.is_online():
		return
	var wait := speak_wait()
	if wait > 0.0:
		_input.editable = false
		_input.placeholder_text = "Warming by the fire... %ds" % int(ceil(wait))
		_status.text = "You're warming by the fire. %d seconds before you can speak." % int(ceil(wait))
	elif not _input.editable:
		_input.editable = true
		_input.placeholder_text = "Press T to speak to the room..."
		_status.text = "The fire has warmed you. Speak if you like."
		get_tree().create_timer(4.0).timeout.connect(func() -> void:
			if _status.text.begins_with("The fire has warmed you"):
				_status.text = "")


func focus_input() -> void:
	if _input.editable:
		_input.grab_focus()


func _send(text: String) -> void:
	_input.text = ""
	_input.release_focus()
	if not text.strip_edges().is_empty():
		Net.send_chat(text)


func _on_line(entry: Dictionary) -> void:
	_last_line_at = Time.get_ticks_msec() / 1000.0
	if not _log.visible:
		_log.visible = true
		_footer.visible = true
		offset_top = -330
	var who := String(entry.get("name", "?"))
	var ink := String(entry.get("ink", "green" if bool(entry.get("frog", false)) else "sepia"))
	var stamp := Time.get_time_string_from_system().substr(0, 5)
	if ink == "gold":
		_log.append_text("[color=%s][i][%s] %s[/i][/color]\n" % [INK["gold"], stamp, String(entry.get("text", "")).xml_escape()])
	else:
		_log.append_text("[color=#8a7a60][%s][/color] [color=%s]%s:[/color] %s\n" % [stamp, INK.get(ink, INK["sepia"]), who.xml_escape(), String(entry.get("text", "")).xml_escape()])


## Rebuilds the list of travelers here (online only). Each row has one thing
## you can do: frog them, once you've been by the fire long enough.
func set_people(people: Dictionary) -> void:
	for c in _people.get_children():
		c.queue_free()
	if not Net.is_online():
		return
	for id in people.keys():
		var row := HBoxContainer.new()
		_people.add_child(row)
		var name_label := UITheme.text(String(people[id].get("name", "?")), 14, Color("#8fb84a") if bool(people[id].get("frog", false)) else UITheme.INK)
		name_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row.add_child(name_label)
		var b := UITheme.button("frog", func() -> void:
			if Time.get_unix_time_from_system() < _can_frog_at:
				_status.text = "You haven't been by the fire long enough. The community doesn't know you yet."
			else:
				Net.frog(int(id)))
		b.tooltip_text = "Three travelers frog someone, and they become a frog until they leave."
		b.add_theme_font_size_override("font_size", 13)
		row.add_child(b)
