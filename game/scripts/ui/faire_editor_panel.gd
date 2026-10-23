class_name FaireEditorPanel
extends GamePanel
## Faire owner setup: name, layout, colors, booth signs and vendors, the stage
## lineup. Saved to the game server with the owner's rental key.

var _key: LineEdit
var _name: LineEdit
var _owner: LineEdit
var _layout: OptionButton
var _palette: OptionButton
var _booths: VBoxContainer
var _performers: LineEdit
var _status: Label
var _booth_rows: Array = []


func _init() -> void:
	super._init("Set Up Your Faire", Vector2(780, 600))
	Net.faire_save_result.connect(func(ok: bool, msg: String) -> void:
		if _status:
			_status.text = msg
			_status.add_theme_color_override("font_color", UITheme.GOOD if ok else UITheme.WARN))


func refresh() -> void:
	clear_body()
	_booth_rows.clear()
	_key = _field("Rental key (from your faire rental)", "")
	_name = _field("Faire name", "")
	_owner = _field("Owner or guild", "")
	body.add_child(UITheme.text("Layout", 16))
	_layout = OptionButton.new()
	for id in GameData.faire["layouts"].keys():
		var l: Dictionary = GameData.faire["layouts"][id]
		_layout.add_item("%s: %s" % [l["name"], l["description"]])
		_layout.set_item_metadata(_layout.item_count - 1, id)
	_layout.item_selected.connect(func(_i: int) -> void: _rebuild_booths())
	body.add_child(_layout)
	body.add_child(UITheme.text("Colors", 16))
	_palette = OptionButton.new()
	for id in GameData.faire["palettes"].keys():
		_palette.add_item(String(id).capitalize())
		_palette.set_item_metadata(_palette.item_count - 1, id)
	body.add_child(_palette)
	_performers = _field("Stage lineup, separated by commas", "")
	body.add_child(UITheme.title("Booths", 18))
	_booths = VBoxContainer.new()
	body.add_child(_booths)
	_rebuild_booths()
	body.add_child(UITheme.button("Save my faire", _save))
	_status = UITheme.text("", 16)
	body.add_child(_status)


func _field(label_text: String, value: String) -> LineEdit:
	body.add_child(UITheme.text(label_text, 15, UITheme.MUTED))
	var e := LineEdit.new()
	e.text = value
	body.add_child(e)
	return e


func _rebuild_booths() -> void:
	for c in _booths.get_children():
		c.queue_free()
	_booth_rows.clear()
	var layout_id := String(_layout.get_item_metadata(_layout.selected))
	var count: int = GameData.faire["layouts"][layout_id]["booths"].size()
	for i in count:
		var row := HBoxContainer.new()
		_booths.add_child(row)
		var sign_edit := LineEdit.new()
		sign_edit.placeholder_text = "Booth %d sign (leave empty for none)" % (i + 1)
		sign_edit.custom_minimum_size = Vector2(300, 0)
		row.add_child(sign_edit)
		var artisan := LineEdit.new()
		artisan.placeholder_text = "Artisan"
		artisan.custom_minimum_size = Vector2(200, 0)
		row.add_child(artisan)
		_booth_rows.append([sign_edit, artisan])


## Collects the form into a faire config.
func collect() -> Dictionary:
	var booths: Array = []
	for r in _booth_rows:
		var sign_text := String(r[0].text).strip_edges()
		if sign_text.is_empty():
			continue
		booths.append({ "sign": sign_text, "artisan": String(r[1].text).strip_edges(), "items": [] })
	var performers: Array = []
	for p in _performers.text.split(",", false):
		if not p.strip_edges().is_empty():
			performers.append(p.strip_edges())
	return {
		"faire_name": _name.text.strip_edges(),
		"owner": _owner.text.strip_edges(),
		"layout": String(_layout.get_item_metadata(_layout.selected)),
		"palette": String(_palette.get_item_metadata(_palette.selected)),
		"performers": performers,
		"booths": booths,
		"active_until": "2000-01-01",
	}


func _save() -> void:
	_status.text = "Saving..."
	Net.save_faire(_key.text.strip_edges(), collect())
