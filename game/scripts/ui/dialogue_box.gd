class_name DialogueBox
extends PanelContainer
## Talks with a character. Picks the first dialogue entry whose conditions
## pass, types each line out in the character's instrument voice, then runs
## the entry's actions (start quests, give stones...). An entry can end in
## choices; each choice has its own reply lines and actions.

signal finished(character_id: String)

var character_id := ""
var _lines: Array = []
var _actions: Array = []
var _choices: Array = []
var _line_index := 0
var _shown := 0.0
var _voice: Dictionary = {}
var _letter_timer := 0.0
var _hold := 0.0
var _name_label: Label
var _text: RichTextLabel
var _portrait: TextureRect
var _initial: Label
var _hint: Label
var _choice_box: VBoxContainer


func _ready() -> void:
	visible = false
	set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	custom_minimum_size = Vector2(860, 190)
	offset_left = -430
	offset_right = 430
	offset_top = -290
	offset_bottom = -96
	grow_vertical = Control.GROW_DIRECTION_BEGIN
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 16)
	add_child(row)
	var frame := PanelContainer.new()
	frame.custom_minimum_size = Vector2(150, 150)
	row.add_child(frame)
	_portrait = TextureRect.new()
	_portrait.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_portrait.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	_portrait.custom_minimum_size = Vector2(140, 140)
	frame.add_child(_portrait)
	_initial = UITheme.title("", 64)
	_initial.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_initial.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	frame.add_child(_initial)
	var col := VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(col)
	_name_label = UITheme.title("", 24)
	col.add_child(_name_label)
	_text = RichTextLabel.new()
	_text.bbcode_enabled = false
	_text.fit_content = true
	_text.custom_minimum_size = Vector2(620, 90)
	_text.add_theme_font_size_override("normal_font_size", 20)
	_text.size_flags_vertical = Control.SIZE_EXPAND_FILL
	col.add_child(_text)
	_choice_box = VBoxContainer.new()
	_choice_box.visible = false
	col.add_child(_choice_box)
	_hint = UITheme.text("E / click to continue", 14, UITheme.MUTED)
	_hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	col.add_child(_hint)


## Opens the conversation for a character. Returns false if they have nothing to say.
func open(cid: String) -> bool:
	var entry := pick_entry(cid)
	if entry.is_empty():
		return false
	var lines: Array = entry.get("lines", []).duplicate()
	if entry.has("dynamic"):
		lines.append_array(dynamic_lines(String(entry["dynamic"])))
		lines.append_array(entry.get("after", []))
	_begin(cid, lines, entry.get("actions", []), entry.get("choices", []))
	return true


## Says lines as a character with no conditions or actions (the Ragana's
## verdict on a finished homestead, for one).
func say(cid: String, lines: Array) -> void:
	_begin(cid, lines, [], [])


func _begin(cid: String, lines: Array, actions: Array, choices: Array) -> void:
	character_id = cid
	var ch := GameData.character(cid)
	_voice = ch.get("voice", {})
	_name_label.text = String(ch.get("name", cid))
	var portrait_path := String(ch.get("portrait", ""))
	if not portrait_path.is_empty() and ResourceLoader.exists(portrait_path):
		_portrait.texture = load(portrait_path)
		_initial.text = ""
	else:
		_portrait.texture = null
		_initial.text = String(ch.get("name", "?")).trim_prefix("The ").substr(0, 1)
		_initial.add_theme_color_override("font_color", Builder.color(String(ch.get("color", "#c9a84c"))).lightened(0.3))
	_lines = lines
	_actions = actions
	_choices = choices
	_line_index = 0
	_clear_choices()
	_start_line()
	visible = true


static func pick_entry(cid: String) -> Dictionary:
	for entry in GameData.dialogue.get(cid, []):
		if conditions_pass(entry.get("when", {})):
			return entry
	return {}


static func conditions_pass(when: Dictionary) -> bool:
	for key in when.keys():
		var v := String(when[key])
		match key:
			"quest_not_started":
				if QuestManager.state(v) != QuestManager.NOT_STARTED:
					return false
			"quest_active":
				if not QuestManager.is_active(v):
					return false
			"quest_done":
				if not QuestManager.is_done(v):
					return false
			"quest_step":
				var parts := v.split(":")
				if not QuestManager.is_on_step(parts[0], parts[1]):
					return false
			"flag":
				if not PlayerState.flag(v):
					return false
			"not_flag":
				if PlayerState.flag(v):
					return false
			"has_stone":
				if not PlayerState.has_tone(v):
					return false
			"carries_stone":
				if PlayerState.stone_count(v) <= 0:
					return false
			"unlocked":
				if not PlayerState.is_unlocked(v):
					return false
			"visits_at_least":
				if PlayerState.visits() < int(when[key]):
					return false
			"visit_after":
				if PlayerState.visits() <= int(PlayerState.flag(v) if PlayerState.flag(v) != null else 1 << 30):
					return false
	return true


static func run_actions(actions: Array) -> void:
	for a in actions:
		if a.has("start_quest"):
			QuestManager.start(String(a["start_quest"]))
		if a.has("complete_step"):
			var parts := String(a["complete_step"]).split(":")
			QuestManager.complete_step(parts[0], parts[1])
		if a.has("set_flag"):
			PlayerState.set_flag(String(a["set_flag"]), a.get("value", true))
		if a.has("mark_visit"):
			PlayerState.set_flag(String(a["mark_visit"]), PlayerState.visits())
		if a.has("give_stone"):
			PlayerState.learn_stone(String(a["give_stone"]))
			EventBus.toast.emit("Received: " + String(GameData.stones[a["give_stone"]]["name"]))
		if a.has("take_stone"):
			if PlayerState.spend_stone(String(a["take_stone"])):
				EventBus.toast.emit("Given: %s. Its tone stays with you." % String(GameData.stones[a["take_stone"]]["name"]))
		if a.has("give_material"):
			for m in a["give_material"].keys():
				PlayerState.add_material(m, int(a["give_material"][m]))
		if a.has("unlock"):
			PlayerState.unlock(String(a["unlock"]))


## Lines the game writes from the player's own history.
static func dynamic_lines(kind: String) -> Array:
	match kind:
		"fortune_reading":
			return fortune_reading(PlayerState.profile)
	return []


## The Fortune Teller's reading: recognition, never prediction. The stones
## answer from what the player has actually done (the Chronicle) and carry.
static func fortune_reading(profile: Dictionary) -> Array:
	var out: Array = []
	var learned: Dictionary = profile.get("learned_stones", {})
	if learned.is_empty():
		return ["Your pouch is empty. Nothing to read. That's a reading too: you've only just arrived, and you came in anyway."]
	var ids: Array = learned.keys()
	var first := String(ids[0])
	out.append("%s. The first stone you ever carried. It still remembers the hand that picked it up." % String(GameData.stones.get(first, {}).get("name", first)))
	var chron: Array = profile.get("chronicle", [])
	var kinds := {}
	for e in chron:
		kinds[String(e.get("kind", ""))] = String(e.get("text", ""))
	if kinds.has("harmony"):
		out.append("Something that had lost its note found it again because you listened. The stones heard that.")
	if kinds.has("build"):
		out.append("There's a roof somewhere with your hands in it. The clay remembers whose they were.")
	if kinds.has("quest") and chron.size() >= 4:
		out.append("You've done a lot of small kind things in a row. The stones don't call that luck.")
	if ids.size() >= 10:
		out.append("%d stones. You don't collect them. You listen to them. There's a difference, and they know it." % ids.size())
	elif ids.size() == 1:
		out.append("Only the one. You hold on to things. That isn't a flaw.")
	return out


func _start_line() -> void:
	_text.text = String(_lines[_line_index])
	_text.visible_characters = 0
	_shown = 0.0
	_hold = 0.0
	_letter_timer = 0.0


func is_typing() -> bool:
	return visible and _text.visible_characters != -1 and _text.visible_characters < _text.get_total_character_count()


func is_choosing() -> bool:
	return visible and _choice_box.visible


func _process(delta: float) -> void:
	if not visible or not is_typing():
		return
	if _hold > 0.0:
		_hold -= delta
		return
	var reveal := maxf(float(_voice.get("reveal_ms", 45.0)) / 1000.0 / maxf(Settings.text_speed, 0.1), 0.008)
	_letter_timer += delta
	while _letter_timer >= reveal and is_typing():
		_letter_timer -= reveal
		var i := _text.visible_characters
		_text.visible_characters = i + 1
		var ch := _text.text.substr(i, 1)
		if ch != " " and i % 2 == 0:
			AudioDirector.voice_blip(_voice, i)
		if ch in [".", "!", "?"]:
			_hold = float(_voice.get("pause_ms", 600.0)) / 1000.0 * 0.5
			break


## Advance: finish the current line, or go to the next one, or show the
## choices, or close.
func advance() -> void:
	if is_choosing():
		return
	if is_typing():
		_text.visible_characters = _text.get_total_character_count()
		return
	_line_index += 1
	if _line_index < _lines.size():
		_start_line()
		return
	run_actions(_actions)
	_actions = []
	if not _choices.is_empty():
		_show_choices()
		return
	visible = false
	finished.emit(character_id)


func _show_choices() -> void:
	_clear_choices()
	_choice_box.visible = true
	_hint.text = "Choose"
	for i in _choices.size():
		var c: Dictionary = _choices[i]
		var b := UITheme.button("%d.  %s" % [i + 1, String(c["text"])], choose.bind(i))
		b.alignment = HORIZONTAL_ALIGNMENT_LEFT
		_choice_box.add_child(b)
	var first := _choice_box.get_child(0) as Button
	(func() -> void:
		if is_instance_valid(first) and first.is_inside_tree():
			first.grab_focus()).call_deferred()


func _clear_choices() -> void:
	for c in _choice_box.get_children():
		_choice_box.remove_child(c)
		c.queue_free()
	_choice_box.visible = false
	_hint.text = "E / click to continue"


## Picks a choice: its reply lines play, then its actions run.
func choose(index: int) -> void:
	if not is_choosing() or index < 0 or index >= _choices.size():
		return
	var c: Dictionary = _choices[index]
	_choices = []
	_clear_choices()
	var reply: Array = c.get("lines", [])
	_actions = c.get("actions", [])
	if reply.is_empty():
		run_actions(_actions)
		_actions = []
		visible = false
		finished.emit(character_id)
		return
	_lines = reply
	_line_index = 0
	_start_line()


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and not is_choosing():
		advance()
		accept_event()


func _unhandled_key_input(event: InputEvent) -> void:
	if not is_choosing() or not (event is InputEventKey) or not event.pressed:
		return
	var k := (event as InputEventKey).physical_keycode
	if k >= KEY_1 and k <= KEY_9:
		choose(k - KEY_1)
		get_viewport().set_input_as_handled()
