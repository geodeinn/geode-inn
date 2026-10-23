class_name VoiceOfTheInn
extends Control
## Elio, the voice of the Inn (core definition spec, part 3). Not a character:
## no portrait, no box, no name. A line of text in the middle of the screen
## and a soft 42Hz motif, at the few moments the voice speaks: the entrance,
## the return after a long time away, the first tectonic shift. It is silent
## during play, NPC dialogue, reading and the Common Room.

var _label: Label
var _queue: Array[String] = []
var _busy := false


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_label = Label.new()
	_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_label.add_theme_font_size_override("font_size", 30)
	_label.add_theme_color_override("font_color", Color(0.96, 0.86, 0.62))
	_label.add_theme_color_override("font_shadow_color", Color(0, 0, 0, 0.7))
	_label.add_theme_constant_override("shadow_offset_x", 0)
	_label.add_theme_constant_override("shadow_offset_y", 2)
	_label.modulate.a = 0.0
	add_child(_label)
	_fit()
	EventBus.inn_voice.connect(speak)


## Centered a little above the middle of the screen, sized from the viewport
## itself so it never depends on how the parent was laid out.
func _fit() -> void:
	var vp := get_viewport_rect().size
	var w := minf(1040.0, vp.x - 40.0)
	_label.global_position = Vector2((vp.x - w) / 2.0, vp.y * 0.5 - 130.0)
	_label.size = Vector2(w, 90.0)


func _process(_delta: float) -> void:
	if _busy:
		_fit()


## The line for a moment ("entrance", "return_visit", ...) from data/world.json.
static func line(moment: String) -> String:
	return String(GameData.world.get("voice_of_the_inn", {}).get("lines", {}).get(moment, ""))


func speak(text: String) -> void:
	if text.is_empty():
		return
	_queue.append(text)
	if not _busy:
		_next()


func is_speaking() -> bool:
	return _busy


func showing() -> String:
	return _label.text if _busy else ""


func _next() -> void:
	if _queue.is_empty():
		_busy = false
		return
	_busy = true
	_label.text = _queue.pop_front()
	AudioDirector.elio_motif()
	# At the pace of a sleeping body: in over a beat, held, out over two.
	var tw := create_tween()
	tw.tween_property(_label, "modulate:a", 1.0, 1.2)
	tw.tween_interval(3.0)
	tw.tween_property(_label, "modulate:a", 0.0, 2.4)
	tw.tween_callback(_next)
