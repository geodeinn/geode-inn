class_name UITheme
extends RefCounted
## Cozy Gothic UI: warm, dark, amber-lit, matching geodeinn.com.

const BG := Color(0.07, 0.05, 0.035, 0.94)
const BG_SOFT := Color(0.12, 0.085, 0.055, 0.96)
const AMBER := Color(0.79, 0.62, 0.3)
const AMBER_BRIGHT := Color(0.95, 0.78, 0.42)
const INK := Color(0.93, 0.86, 0.72)
const MUTED := Color(0.66, 0.58, 0.46)
const GOOD := Color(0.55, 0.82, 0.55)
const WARN := Color(0.92, 0.55, 0.38)

static var _theme: Theme


static func clear_cache() -> void:
	_theme = null


static func get_theme() -> Theme:
	if _theme != null:
		return _theme
	var t := Theme.new()
	t.default_font_size = 18
	var panel := _box(BG, AMBER.darkened(0.45), 1, 8, 14)
	t.set_stylebox("panel", "PanelContainer", panel)
	t.set_stylebox("panel", "Panel", panel)
	t.set_color("font_color", "Label", INK)
	t.set_color("font_color", "Button", INK)
	t.set_color("font_hover_color", "Button", AMBER_BRIGHT)
	t.set_color("font_pressed_color", "Button", AMBER_BRIGHT)
	t.set_color("font_disabled_color", "Button", MUTED.darkened(0.3))
	t.set_stylebox("normal", "Button", _box(BG_SOFT, AMBER.darkened(0.5), 1, 6, 8))
	t.set_stylebox("hover", "Button", _box(BG_SOFT.lightened(0.08), AMBER, 1, 6, 8))
	t.set_stylebox("pressed", "Button", _box(BG_SOFT.lightened(0.14), AMBER_BRIGHT, 1, 6, 8))
	t.set_stylebox("focus", "Button", _box(Color(0, 0, 0, 0), AMBER_BRIGHT, 2, 6, 8))
	t.set_stylebox("disabled", "Button", _box(BG_SOFT.darkened(0.2), MUTED.darkened(0.5), 1, 6, 8))
	t.set_stylebox("normal", "LineEdit", _box(Color(0.04, 0.03, 0.02, 0.95), AMBER.darkened(0.4), 1, 4, 8))
	t.set_stylebox("focus", "LineEdit", _box(Color(0.04, 0.03, 0.02, 0.95), AMBER, 1, 4, 8))
	t.set_color("font_color", "LineEdit", INK)
	t.set_color("font_color", "CheckBox", INK)
	t.set_color("font_color", "OptionButton", INK)
	t.set_stylebox("normal", "OptionButton", _box(BG_SOFT, AMBER.darkened(0.5), 1, 6, 8))
	t.set_stylebox("panel", "PopupMenu", _box(BG, AMBER.darkened(0.3), 1, 4, 6))
	t.set_color("font_color", "PopupMenu", INK)
	t.set_stylebox("normal", "RichTextLabel", StyleBoxEmpty.new())
	t.set_color("default_color", "RichTextLabel", INK)
	t.set_stylebox("slider", "HSlider", _box(Color(0.2, 0.15, 0.1), AMBER.darkened(0.5), 1, 3, 2))
	t.set_stylebox("background", "ProgressBar", _box(Color(0.1, 0.07, 0.05), AMBER.darkened(0.5), 1, 3, 0))
	t.set_stylebox("fill", "ProgressBar", _box(AMBER.darkened(0.15), AMBER, 0, 3, 0))
	t.set_stylebox("panel", "TabContainer", panel)
	_theme = t
	return t


static func _box(bg: Color, border: Color, border_w: int, radius: int, margin: int) -> StyleBoxFlat:
	var sb := StyleBoxFlat.new()
	sb.bg_color = bg
	sb.border_color = border
	sb.set_border_width_all(border_w)
	sb.set_corner_radius_all(radius)
	sb.content_margin_left = margin
	sb.content_margin_right = margin
	sb.content_margin_top = margin * 0.6
	sb.content_margin_bottom = margin * 0.6
	return sb


static func title(text: String, size := 26) -> Label:
	var l := Label.new()
	l.text = text
	l.add_theme_color_override("font_color", AMBER_BRIGHT)
	l.add_theme_font_size_override("font_size", size)
	return l


static func text(content: String, size := 17, color := INK) -> Label:
	var l := Label.new()
	l.text = content
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.add_theme_font_size_override("font_size", size)
	l.add_theme_color_override("font_color", color)
	return l


## A label for a grid cell: never wraps, so a narrow column can't squeeze it
## down to one letter per line.
static func cell(content: String, size := 15, color := INK) -> Label:
	var l := text(content, size, color)
	l.autowrap_mode = TextServer.AUTOWRAP_OFF
	return l


## Readable over a bright sky: a thin dark outline.
static func outline(l: Label, width := 5) -> Label:
	l.add_theme_constant_override("outline_size", width)
	l.add_theme_color_override("font_outline_color", Color(0.05, 0.035, 0.02, 0.85))
	return l


static func button(text_value: String, on_pressed: Callable) -> Button:
	var b := Button.new()
	b.text = text_value
	b.pressed.connect(on_pressed)
	b.pressed.connect(AudioDirector.ui_tick)
	return b
