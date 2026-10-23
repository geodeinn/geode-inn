class_name ForgePanel
extends GamePanel
## The Metal That Sings (dissection 14, option 4): tune a finding to a stone.
## Pick a stone you carry; the finding starts out of tune. Tap the edge to
## raise it, the face to lower it, and ring them together. When the metal
## matches the stone, it sings.

signal tuned(stone_id: String)

const SINGS_CENTS := 12.0

var stone_id := ""
var finding_cents := 0.0      # how far the finding is from the stone, in cents
var _picker: OptionButton
var _status: Label


func _init() -> void:
	super._init("The Anvil", Vector2(680, 460))


func refresh() -> void:
	clear_body()
	body.add_child(UITheme.text("A clasp on the anvil, still warm. Pick a stone to tune it to.", 16, UITheme.MUTED))
	_picker = OptionButton.new()
	_picker.add_item("(choose a stone)")
	for sid in PlayerState.learned_stone_ids():
		_picker.add_item("%s  (%s)" % [GameData.stones[sid]["name"], GameData.stone_note_name(sid)])
		_picker.set_item_metadata(_picker.item_count - 1, sid)
	_picker.item_selected.connect(func(i: int) -> void:
		if i > 0:
			pick(String(_picker.get_item_metadata(i))))
	body.add_child(_picker)
	var row := HBoxContainer.new()
	body.add_child(row)
	row.add_child(UITheme.button("Tap the edge (higher)", nudge.bind(25.0)))
	row.add_child(UITheme.button("Tap the face (lower)", nudge.bind(-25.0)))
	var fine := HBoxContainer.new()
	body.add_child(fine)
	fine.add_child(UITheme.button("Light tap up", nudge.bind(5.0)))
	fine.add_child(UITheme.button("Light tap down", nudge.bind(-5.0)))
	body.add_child(UITheme.button("Ring them together", ring))
	_status = UITheme.text("", 18, UITheme.AMBER)
	body.add_child(_status)
	if not stone_id.is_empty():
		_update()


func pick(sid: String) -> void:
	stone_id = sid
	# Fresh metal is never in tune: a few semitones off, one way or the other.
	finding_cents = (1.0 if randf() < 0.5 else -1.0) * randf_range(180.0, 420.0)
	_update()
	ring()


func finding_hz() -> float:
	return GameData.stone_hz(stone_id) * pow(2.0, finding_cents / 1200.0)


func nudge(cents: float) -> void:
	if stone_id.is_empty():
		return
	finding_cents += cents
	AudioDirector.play_freq(finding_hz(), 0.8, "triangle", 0.12)
	_update()


func ring() -> void:
	if stone_id.is_empty():
		return
	AudioDirector.play_stone(stone_id, 1.6, false)
	AudioDirector.play_freq(finding_hz(), 1.6, "triangle", 0.1)


func _update() -> void:
	if _status == null:
		return
	var off := absf(finding_cents)
	if off <= SINGS_CENTS:
		_status.text = "It sings."
		AudioDirector.play_chord([GameData.stone_hz(stone_id), finding_hz() * 2.0], 2.0)
		PlayerState.add_chronicle("Tuned a clasp to %s. The metal sang." % GameData.stones[stone_id]["name"], "craft")
		EventBus.emit_event("forge:tuned", { "stone": stone_id })
		tuned.emit(stone_id)
		stone_id = ""
	elif off <= 40.0:
		_status.text = "Almost. The two are beating against each other, slow."
	elif off <= 120.0:
		_status.text = "Closer. You can hear them pulling."
	else:
		_status.text = "Far apart. The metal wants to be %s." % ("lower" if finding_cents > 0.0 else "higher")
