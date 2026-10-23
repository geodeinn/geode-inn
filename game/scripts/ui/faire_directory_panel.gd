class_name FaireDirectoryPanel
extends GamePanel
## The Faire Grounds signpost: every faire with an active rental, open any day
## of the year. Faire owners set theirs up here with their rental key.

signal enter_faire(config: Dictionary)
signal setup_requested

var _list: VBoxContainer


func _init() -> void:
	super._init("Faires in Town", Vector2(700, 500))
	Net.faire_list_received.connect(_on_list)


func refresh() -> void:
	clear_body()
	body.add_child(UITheme.text("Pick a faire to visit. Every booth is kept by its artisan.", 16, UITheme.MUTED))
	_list = VBoxContainer.new()
	body.add_child(_list)
	_list.add_child(UITheme.text("Asking around...", 16, UITheme.MUTED))
	body.add_child(HSeparator.new())
	body.add_child(UITheme.text("Own a faire? Set it up here with the rental key from your faire rental.", 15, UITheme.MUTED))
	body.add_child(UITheme.button("Set up my faire", func() -> void: setup_requested.emit()))
	Net.request_faires()


func _on_list(faires: Array) -> void:
	if _list == null:
		return
	for c in _list.get_children():
		c.queue_free()
	if faires.is_empty():
		_list.add_child(UITheme.text("No faires in town right now.", 16, UITheme.MUTED))
	for f in faires:
		var row := HBoxContainer.new()
		_list.add_child(row)
		var info := UITheme.text("%s\n%s, %d booths, %s layout" % [f["faire_name"], f.get("owner", ""), f.get("booths", []).size(), String(f.get("layout", "")).capitalize()], 16)
		info.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row.add_child(info)
		row.add_child(UITheme.button("Visit", func() -> void: enter_faire.emit(f)))
