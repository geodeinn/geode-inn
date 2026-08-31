###
# Geode Inn — Dialogue UI System
# Renders NPC dialogue with voice profile applied.
# Shows: NPC name, hook word (verbal fingerprint), dialogue text, response options.
# Uses the Dialogue entity data loaded by FizgigLoader.
###

extends CanvasLayer
signal dialogue_started(npc_name: String)
signal dialogue_ended()
signal response_selected(response_id: String)

# === UI Nodes (created programmatically for now) ===
var panel: Panel
var name_label: Label
var hook_label: Label
var text_label: RichTextLabel
var response_container: VBoxContainer
var portrait_texture: TextureRect
var continue_hint: Label

# === State ===
var current_entry: Dictionary = {}
var current_line_index: int = 0
var current_lines: Array = []
var is_typing: bool = false
var type_speed: float = 0.03  # Seconds per character
var full_text: String = ""
var displayed_text: String = ""

# === Voice Profile (applied to text rendering) ===
var voice_profile: Dictionary = {}

func _ready() -> void:
	layer = 10
	_create_ui()
	_hide_ui()

func _create_ui() -> void:
	# Main panel — dark stone background with gold border feel
	panel = Panel.new()
	panel.set_anchors_preset(Control.PRESET_FULL_RECT)
	panel.offset_left = 50
	panel.offset_right = -50
	panel.offset_top = -150
	panel.offset_bottom = -30
	panel.anchor_top = 1.0
	panel.anchor_bottom = 1.0
	
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.08, 0.06, 0.04, 0.95)
	style.border_width_top = 2
	style.border_width_bottom = 2
	style.border_width_left = 2
	style.border_width_right = 2
	style.border_color = Color(0.72, 0.55, 0.26, 0.8)  # Gold
	style.corner_radius_top_left = 8
	style.corner_radius_top_right = 8
	style.corner_radius_bottom_left = 8
	style.corner_radius_bottom_right = 8
	style.content_margin_left = 24
	style.content_margin_right = 24
	style.content_margin_top = 16
	style.content_margin_bottom = 16
	panel.add_theme_stylebox("panel", style)
	
	# Portrait (left side, 96x96)
	portrait_texture = TextureRect.new()
	portrait_texture.size = Vector2(96, 96)
	portrait_texture.position = Vector2(0, 0)
	portrait_texture.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
	portrait_texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	panel.add_child(portrait_texture)
	
	# NPC name (top, gold text)
	name_label = Label.new()
	name_label.position = Vector2(110, 4)
	name_label.size = Vector2(400, 28)
	name_label.add_theme_font_size_override("font_size", 20)
	name_label.add_theme_color_override("font_color", Color(0.85, 0.68, 0.32))  # Gold
	name_label.add_theme_color_override("font_shadow_color", Color(0, 0, 0, 0.8))
	name_label.add_theme_constant_override("shadow_offset_x", 1)
	name_label.add_theme_constant_override("shadow_offset_y", 1)
	panel.add_child(name_label)
	
	# Hook word (italic, muted, right of name)
	hook_label = Label.new()
	hook_label.position = Vector2(110, 32)
	hook_label.size = Vector2(500, 20)
	hook_label.add_theme_font_size_override("font_size", 13)
	hook_label.add_theme_color_override("font_color", Color(0.6, 0.55, 0.45, 0.7))
	hook_label.add_theme_constant_override("font_italic", 1)
	panel.add_child(hook_label)
	
	# Dialogue text (main body)
	text_label = RichTextLabel.new()
	text_label.position = Vector2(110, 58)
	text_label.size = Vector2(600, 60)
	text_label.add_theme_font_size_override("normal_font_size", 16)
	text_label.add_theme_color_override("default_color", Color(0.88, 0.82, 0.72))
	text_label.bbcode_enabled = true
	text_label.fit_content = true
	text_label.scroll_active = false
	panel.add_child(text_label)
	
	# Response container (below text)
	response_container = VBoxContainer.new()
	response_container.position = Vector2(110, 125)
	response_container.size = Vector2(600, 80)
	response_container.add_theme_constant_override("separation", 6)
	panel.add_child(response_container)
	
	# Continue hint (bottom right)
	continue_hint = Label.new()
	continue_hint.position = Vector2(-120, -20)
	continue_hint.anchor_left = 1.0
	continue_hint.anchor_top = 1.0
	continue_hint.size = Vector2(100, 20)
	continue_hint.add_theme_font_size_override("font_size", 12)
	continue_hint.add_theme_color_override("font_color", Color(0.5, 0.45, 0.35, 0.6))
	continue_hint.text = "[E] continue"
	panel.add_child(continue_hint)
	
	add_child(panel)

func _hide_ui() -> void:
	panel.visible = false

func _process(_delta: float) -> void:
	if is_typing:
		_typewriter_effect()

# === Start Dialogue ===

func start_dialogue(npc_name: String, entry_id: String = "") -> void:
	# Load dialogue from DialogueManager
	if not DialogueManager:
		print("[DialogueUI] No DialogueManager found")
		return
	
	var entries = DialogueManager.get_entries_for_npc(npc_name)
	if entries.is_empty():
		print("[DialogueUI] No dialogue entries for: %s" % npc_name)
		return
	
	# Pick entry by ID or use first
	current_entry = {}
	if entry_id != "":
		for e in entries:
			if e.get("dialogueId", "") == entry_id:
				current_entry = e
				break
	if current_entry.is_empty():
		current_entry = entries[0]
	
	# Extract lines
	current_lines = current_entry.get("lines", [])
	if current_lines.is_empty():
		# Single-line entry
		current_lines = [current_entry.get("text", "")]
	
	current_line_index = 0
	
	# Load voice profile
	voice_profile = _get_voice_profile(npc_name)
	
	# Apply voice profile to typewriter
	type_speed = voice_profile.get("reveal_speed", 0.03)
	
	# Set up UI
	panel.visible = true
	name_label.text = npc_name
	
	# Hook word (verbal fingerprint)
	var hook = _get_hook_word(npc_name)
	hook_label.text = "[ " + hook + " ]" if hook != "" else ""
	
	# Portrait
	var portrait_path = "res://beta/assets/art/portraits/" + npc_name.to_lower().replace(" ", "_") + ".png"
	if FileAccess.file_exists(portrait_path):
		portrait_texture.texture = load(portrait_path)
	else:
		portrait_texture.texture = null
	
	# Clear responses
	_clear_responses()
	
	# Start first line
	_show_current_line()
	
	dialogue_started.emit(npc_name)
	
	# Audio: stone chime for dialogue start (voice profile instrument)
	if AudioManager:
		var instrument = voice_profile.get("instrument", "clear_quartz")
		AudioManager.play_stone_chime(instrument, -12.0)

func _show_current_line() -> void:
	if current_line_index >= current_lines.size():
		_end_dialogue()
		return
	
	full_text = current_lines[current_line_index]
	displayed_text = ""
	text_label.text = ""
	is_typing = true
	continue_hint.text = "..."

func _typewriter_effect() -> void:
	if displayed_text.length() < full_text.length():
		displayed_text = full_text.substr(0, displayed_text.length() + 1)
		text_label.text = displayed_text
		
		# Play subtle tick sound occasionally (based on voice profile pause_weight)
		var pause_weight = voice_profile.get("pause_weight", 0.3)
		if randf() < pause_weight * 0.15:
			if AudioManager:
				AudioManager.play_ui_sound("button_click")
	else:
		is_typing = false
		continue_hint.text = "[E] continue"
		
		# Show responses if this is the last line and has responses
		if current_line_index == current_lines.size() - 1:
			_show_responses()

func _show_responses() -> void:
	var responses = current_entry.get("responses", [])
	if responses.is_empty():
		return
	
	_clear_responses()
	for i in range(responses.size()):
		var resp = responses[i]
		var btn = Button.new()
		btn.text = resp.get("text", "...")
		btn.add_theme_font_size_override("font_size", 14)
		btn.add_theme_color_override("font_color", Color(0.85, 0.78, 0.62))
		btn.add_theme_color_override("font_hover_color", Color(0.95, 0.88, 0.52))
		
		var style_normal = StyleBoxFlat.new()
		style_normal.bg_color = Color(0.1, 0.08, 0.06, 0.8)
		style_normal.border_width_left = 2
		style_normal.border_color = Color(0.5, 0.4, 0.2, 0.5)
		btn.add_theme_stylebox("normal", style_normal)
		
		var style_hover = StyleBoxFlat.new()
		style_hover.bg_color = Color(0.15, 0.12, 0.08, 0.9)
		style_hover.border_width_left = 2
		style_hover.border_color = Color(0.72, 0.55, 0.26, 0.8)
		btn.add_theme_stylebox("hover", style_hover)
		
		var resp_id = resp.get("id", str(i))
		btn.pressed.connect(func(): _on_response_selected(resp_id, resp))
		response_container.add_child(btn)

func _clear_responses() -> void:
	for child in response_container.get_children():
		child.queue_free()

func _on_response_selected(response_id: String, response_data: Dictionary) -> void:
	response_selected.emit(response_id)
	
	# Set dialogue flags if specified
	var set_flags = response_data.get("setFlags", {})
	for flag in set_flags:
		if SaveManager:
			SaveManager.set_dialogue_flag(flag, set_flags[flag])
	
	# Navigate to next entry if specified
	var next_entry = response_data.get("nextEntry", "")
	if next_entry != "":
		start_dialogue(current_entry.get("npcName", ""), next_entry)
	else:
		_end_dialogue()

func _end_dialogue() -> void:
	is_typing = false
	_hide_ui()
	dialogue_ended.emit()

func _input(event: InputEvent) -> void:
	if not panel.visible:
		return
	
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_E or event.keycode == KEY_SPACE or event.keycode == KEY_ENTER:
			if is_typing:
				# Skip typewriter — show full text immediately
				displayed_text = full_text
				text_label.text = full_text
				is_typing = false
				continue_hint.text = "[E] continue"
				if current_line_index == current_lines.size() - 1:
					_show_responses()
			else:
				# Advance to next line
				current_line_index += 1
				_show_current_line()
		elif event.keycode == KEY_ESCAPE:
			_end_dialogue()

# === Voice Profile Loading ===

func _get_voice_profile(npc_name: String) -> Dictionary:
	# Load from the voice profiles autoload or file
	var profiles = _load_voice_profiles()
	if profiles.has(npc_name):
		return profiles[npc_name]
	return {}

func _load_voice_profiles() -> Dictionary:
	# Try loading from the voice profiles resource
	var path = "res://godot_project/scripts/geode_inn_voice_profiles.gd"
	# The profiles are in an autoload or can be loaded as a resource
	# For now, return a basic profile
	return {}

func _get_hook_word(npc_name: String) -> String:
	# Hook words catalog — the verbal fingerprint of each NPC
	var hooks = {
		"Beverley": "precision",
		"Joe": "amused",
		"Lozen": "watchful",
		"Quire": "hushed",
		"Brim": "mischievous",
		"Naut": "ancient",
		"Lark": "guidance",
		"The Reader": "observe",
		"Tumble": "wobble",
		"The Bog Fairy Golem": "grow",
		"Kathy": "rooted",
		"Evan": "checkmate",
		"Rachel Kaiser": "transform",
		"Stephanie": "curious",
		"Oleander": "trendy",
		"Malachi": "winter",
		"The Crone": "unblinking",
		"Selkie": "craft",
		"Oceananoir": "depth",
		"Will": "steady",
	}
	return hooks.get(npc_name, "")
