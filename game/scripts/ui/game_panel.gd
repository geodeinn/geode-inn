class_name GamePanel
extends PanelContainer
## Base for the in-game windows: a title, a close button and a body that each
## panel fills in refresh().

signal closed

var body: VBoxContainer
var _title: Label


func _init(title_text := "", min_size := Vector2(640, 460)) -> void:
	visible = false
	custom_minimum_size = min_size
	set_anchors_preset(Control.PRESET_CENTER)
	offset_left = -min_size.x / 2.0
	offset_right = min_size.x / 2.0
	offset_top = -min_size.y / 2.0 - 30.0
	offset_bottom = min_size.y / 2.0 - 30.0
	var outer := VBoxContainer.new()
	outer.add_theme_constant_override("separation", 10)
	add_child(outer)
	var head := HBoxContainer.new()
	outer.add_child(head)
	_title = UITheme.title(title_text)
	_title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	head.add_child(_title)
	head.add_child(UITheme.button("Close", close))
	var scroll := ScrollContainer.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	outer.add_child(scroll)
	body = VBoxContainer.new()
	body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	body.add_theme_constant_override("separation", 8)
	scroll.add_child(body)


func set_title(t: String) -> void:
	_title.text = t


func open() -> void:
	refresh()
	visible = true


func close() -> void:
	if visible:
		visible = false
		closed.emit()


func clear_body() -> void:
	for c in body.get_children():
		body.remove_child(c)
		c.queue_free()


## Override in each panel.
func refresh() -> void:
	pass
