class_name HarmonizePanel
extends GamePanel
## Harmonization: match the being's tones with stones from your cave. The
## second line on the Pulse Line closes in as you get closer; when every tone
## matches, the lines merge and the being shows its true form.

signal harmonized(being_id: String)

var being_id := ""
var pulse: PulseLine
var _h: Harmonizer
var _pickers: Array[OptionButton] = []
var _bar: ProgressBar
var _status: Label


func _init() -> void:
	super._init("Harmonize", Vector2(720, 470))


func start(id: String, pulse_line: PulseLine) -> void:
	being_id = id
	pulse = pulse_line
	var being: Dictionary = GameData.world["beings"][id]
	var cfg: Dictionary = GameData.world.get("harmonization", {})
	_h = Harmonizer.new(being["target_hz"], float(cfg.get("tolerance_cents", 35.0)), bool(cfg.get("octave_equivalent", true)))
	set_title(String(being["name"]))
	if pulse:
		pulse.mode = "combat"
		pulse.alignment = 0.0
		pulse.merged = false


func refresh() -> void:
	clear_body()
	_pickers.clear()
	if _h == null:
		return
	var being: Dictionary = GameData.world["beings"][being_id]
	body.add_child(UITheme.text(String(being["dissonant_text"]), 18))
	var tones := _h.target_hz.size()
	body.add_child(UITheme.text("It hums one note. Listen, then choose a stone that answers it." if tones == 1
		else "It hums %d tones. Listen, then choose a stone for each." % tones, 16, UITheme.MUTED))
	var learned := PlayerState.learned_stone_ids()
	for slot in _h.target_hz.size():
		var row := HBoxContainer.new()
		row.add_theme_constant_override("separation", 10)
		body.add_child(row)
		row.add_child(UITheme.button("Listen" if tones == 1 else "Listen to tone %d" % (slot + 1), _listen.bind(slot)))
		var pick := OptionButton.new()
		pick.custom_minimum_size = Vector2(330, 0)
		pick.add_item("(choose a stone)")
		for sid in learned:
			pick.add_item("%s  (%s)" % [GameData.stones[sid]["name"], GameData.stone_note_name(sid)])
			pick.set_item_metadata(pick.item_count - 1, sid)
		pick.item_selected.connect(_on_pick.bind(slot))
		row.add_child(pick)
		_pickers.append(pick)
	_bar = ProgressBar.new()
	_bar.max_value = 1.0
	_bar.step = 0.001
	_bar.show_percentage = false
	_bar.custom_minimum_size = Vector2(0, 14)
	body.add_child(_bar)
	_status = UITheme.text("", 17, UITheme.AMBER)
	body.add_child(_status)
	body.add_child(UITheme.button("Play your chord", _play_chord))
	_update()


func _listen(slot: int) -> void:
	AudioDirector.play_freq(_h.target_hz[slot], 1.4, "sine", 0.2)


func _on_pick(index: int, slot: int) -> void:
	var sid := ""
	if index > 0:
		sid = String(_pickers[slot].get_item_metadata(index))
		AudioDirector.play_stone(sid, 1.2, false)
	_h.set_slot(slot, sid)
	_update()


## Picks a stone by id (used by keyboard shortcuts and tests).
func choose(slot: int, stone_id: String) -> void:
	for i in _pickers[slot].item_count:
		if i > 0 and String(_pickers[slot].get_item_metadata(i)) == stone_id:
			_pickers[slot].select(i)
			_on_pick(i, slot)
			return


func _play_chord() -> void:
	var freqs: Array = []
	for sid in _h.chosen:
		if not sid.is_empty():
			freqs.append(GameData.stone_hz(sid))
	AudioDirector.play_chord(freqs, 1.6)


func _update() -> void:
	var a := _h.alignment()
	_bar.value = a
	if pulse:
		pulse.alignment = a
	if _h.is_complete():
		_complete()
	elif a > 0.85:
		_status.text = "Very close. The two lines are nearly one."
	elif a > 0.5:
		_status.text = "Closer. Something in it is listening."
	else:
		_status.text = "Still out of tune."


func _complete() -> void:
	var being: Dictionary = GameData.world["beings"][being_id]
	if pulse:
		pulse.merged = true
		pulse.alignment = 1.0
	_play_chord()
	_status.text = "The lines merge. " + String(being["true_form"])
	for p in _pickers:
		p.disabled = true
	PlayerState.add_companion(String(being["companion"]))
	PlayerState.add_chronicle("Harmonized %s. %s" % [being["name"], being["true_form"]], "harmony", { "being": being_id })
	EventBus.emit_event("harmonized:" + being_id)
	harmonized.emit(being_id)


func close() -> void:
	if pulse:
		pulse.mode = "baseline"
		pulse.merged = false
	super.close()
