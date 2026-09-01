# DialogueManager.gd — NPC Dialogue System (Autoload)
# Loads dialogue trees from DialogueTrees.gd (78 entries, 21 NPCs, 15 zones)
# Manages condition flags, priority queue, whisper layer, branching responses
# UI: bottom-of-screen text box with portrait area, line text, and response buttons
# Voice profiles define text speed and audio tone per NPC

extends Node

# === SIGNALS ===
signal dialogue_started(npc_name: String)
signal dialogue_finished(npc_name: String)
signal flag_set(flag_name: String)
signal line_shown(text: String)
signal responses_shown(responses: Array)

# === STATE ===
var _trees: DialogueTrees = DialogueTrees.new()
var _flags: Dictionary = {}
var _active_npc: String = ""
var _active_entries: Array = []
var _current_entry: Dictionary = {}
var _current_line_index: int = 0
var _is_in_dialogue: bool = false
var _waiting_for_response: bool = false

# === UI NODES (created dynamically) ===
var _dialogue_box: Panel
var _name_label: Label
var _text_label: RichTextLabel
var _response_container: VBoxContainer
var _portrait_rect: ColorRect
var _continue_hint: Label

# === TEXT SPEED ===
var _typewriter_speed := 0.03  # seconds per character
var _typewriter_timer := 0.0
var _full_text := ""
var _displayed_chars := 0
var _is_typing := false

func _ready() -> void:
	print("[DialogueManager] Loaded %d NPC dialogue trees" % _trees.get_all_npcs().size())

func _process(delta: float) -> void:
	if _is_typing:
		_typewriter_timer += delta
		if _typewriter_timer >= _typewriter_speed:
			_typewriter_timer = 0.0
			_displayed_chars += 1
			if _displayed_chars <= _full_text.length():
				_text_label.visible_characters = _displayed_chars
			else:
				_is_typing = false
				_text_label.visible_characters = -1  # Show all
				if _current_entry.get("responses", []).size() > 0:
					_show_responses(_current_entry["responses"])
				else:
					_continue_hint.visible = true

# === PUBLIC API ===

func start_dialogue(npc_name: String, zone: String = "") -> void:
	if _is_in_dialogue:
		return
	
	var entries := _trees.get_tree(npc_name)
	if entries.is_empty():
		print("[DialogueManager] No dialogue for: %s" % npc_name)
		return
	
	# Filter by zone if specified, and by condition flags
	var valid_entries := []
	for entry in entries:
		if zone != "" and entry.get("zone", "") != zone and entry.get("zone", "") != "Variable":
			continue
		var cond: String = entry.get("conditionTag", "")
		if cond != "" and not has_flag(cond):
			continue
		valid_entries.append(entry)
	
	if valid_entries.is_empty():
		# Fall back to any entry for this NPC
		valid_entries = entries
	
	# Sort by priority (highest first)
	valid_entries.sort_custom(func(a, b): return a.get("priority", 0) > b.get("priority", 0))
	
	_active_npc = npc_name
	_active_entries = valid_entries
	_current_entry = valid_entries[0]
	_current_line_index = 0
	_is_in_dialogue = true
	
	_show_dialogue_box()
	_show_current_line()
	
	dialogue_started.emit(npc_name)
	print("[DialogueManager] Started dialogue with %s (%d entries, zone: %s)" % [npc_name, valid_entries.size(), zone])

func advance() -> void:
	if not _is_in_dialogue:
		return
	
	if _is_typing:
		# Skip typewriter — show full line immediately
		_is_typing = false
		_displayed_chars = _full_text.length()
		_text_label.visible_characters = -1
		if _current_entry.get("responses", []).size() > 0:
			_show_responses(_current_entry["responses"])
		else:
			_continue_hint.visible = true
		return
	
	if _waiting_for_response:
		return  # Player must choose a response
	
	# Advance to next line
	_current_line_index += 1
	var lines: Array = _current_entry.get("lines", [])
	
	if _current_line_index < lines.size():
		_show_current_line()
	else:
		# End of this entry's lines — set flags
		for flag in _current_entry.get("setFlags", []):
			set_flag(flag)
		
		# Check if there are more entries (multi-page dialogue)
		# For now, end dialogue after first entry
		end_dialogue()

func choose_response(response_index: int) -> void:
	if not _waiting_for_response:
		return
	
	var responses: Array = _current_entry.get("responses", [])
	if response_index < 0 or response_index >= responses.size():
		return
	
	var response = responses[response_index]
	_waiting_for_response = false
	_hide_responses()
	
	# Handle response — could set flags, trigger quest, or show more dialogue
	if response is Dictionary:
		# Set flags from response
		for flag in response.get("setFlags", []):
			set_flag(flag)
		
		# Check for next dialogue or quest link
		var next: String = response.get("next", "")
		if next != "":
			# Jump to next dialogue entry
			for entry in _active_entries:
				if entry.get("dialogueId", "") == next:
					_current_entry = entry
					_current_line_index = 0
					_show_current_line()
					return
		
		# Check for quest trigger
		var quest: String = response.get("quest", "")
		if quest != "":
			print("[DialogueManager] Quest triggered: %s" % quest)
			# In full build: notify GameManager to start quest
	
	# End dialogue after response
	end_dialogue()

func end_dialogue() -> void:
	if not _is_in_dialogue:
		return
	
	_is_in_dialogue = false
	_waiting_for_response = false
	_is_typing = false
	_active_npc = ""
	_hide_dialogue_box()
	
	dialogue_finished.emit(_active_npc)

func set_flag(flag_name: String) -> void:
	_flags[flag_name] = true
	flag_set.emit(flag_name)
	print("[DialogueManager] Flag set: %s" % flag_name)

func has_flag(flag_name: String) -> bool:
	return _flags.has(flag_name)

func is_in_dialogue() -> bool:
	return _is_in_dialogue

func get_active_npc() -> String:
	return _active_npc

# === UI ===

func _show_dialogue_box() -> void:
	# Create dialogue box at bottom of screen
	_dialogue_box = Panel.new()
	_dialogue_box.position = Vector2(60, 400)
	_dialogue_box.size = Vector2(904, 140)
	_dialogue_box.add_theme_stylebox_override("panel", _make_dialogue_style())
	
	# Portrait area (left side)
	_portrait_rect = ColorRect.new()
	_portrait_rect.position = Vector2(10, 10)
	_portrait_rect.size = Vector2(80, 80)
	_portrait_rect.color = Color(0.3, 0.25, 0.15, 0.8)
	_dialogue_box.add_child(_portrait_rect)
	
	# NPC name
	_name_label = Label.new()
	_name_label.position = Vector2(100, 10)
	_name_label.size = Vector2(794, 24)
	_name_label.text = _active_npc
	_name_label.add_theme_font_size_override("font_size", 16)
	_name_label.add_theme_color_override("font_color", Color(0.85, 0.72, 0.35))
	_dialogue_box.add_child(_name_label)
	
	# Dialogue text (typewriter effect)
	_text_label = RichTextLabel.new()
	_text_label.position = Vector2(100, 36)
	_text_label.size = Vector2(794, 60)
	_text_label.bbcode_enabled = true
	_text_label.add_theme_color_override("default_color", Color(0.82, 0.76, 0.55))
	_text_label.add_theme_font_size_override("normal_font_size", 14)
	_dialogue_box.add_child(_text_label)
	
	# Continue hint
	_continue_hint = Label.new()
	_continue_hint.position = Vector2(830, 100)
	_continue_hint.text = "▼"
	_continue_hint.add_theme_color_override("font_color", Color(0.6, 0.5, 0.25))
	_continue_hint.visible = false
	_dialogue_box.add_child(_continue_hint)
	
	# Response buttons container
	_response_container = VBoxContainer.new()
	_response_container.position = Vector2(100, 100)
	_response_container.size = Vector2(794, 30)
	_response_container.visible = false
	_dialogue_box.add_child(_response_container)
	
	# Add to scene tree — find the current scene
	var current_scene := get_tree().current_scene
	if current_scene:
		current_scene.add_child(_dialogue_box)

func _show_current_line() -> void:
	var lines: Array = _current_entry.get("lines", [])
	if _current_line_index >= lines.size():
		end_dialogue()
		return
	
	_full_text = lines[_current_line_index]
	_displayed_chars = 0
	_text_label.text = _full_text
	_text_label.visible_characters = 0
	_is_typing = true
	_continue_hint.visible = false
	_hide_responses()
	
	line_shown.emit(_full_text)

func _show_responses(responses: Array) -> void:
	_waiting_for_response = true
	_response_container.visible = true
	_response_container.position = Vector2(100, 96)
	
	# Clear old buttons
	for child in _response_container.get_children():
		child.queue_free()
	
	# Create response buttons
	for i in range(responses.size()):
		var btn := Button.new()
		var text := ""
		if responses[i] is Dictionary:
			text = responses[i].get("text", "...")
		else:
			text = str(responses[i])
		
		btn.text = "▶ " + text
		btn.add_theme_color_override("font_color", Color(0.82, 0.76, 0.55))
		btn.add_theme_color_override("font_hover_color", Color(0.95, 0.88, 0.50))
		btn.add_theme_stylebox_override("normal", _make_button_style())
		btn.add_theme_stylebox_override("hover", _make_button_style(Color(0.15, 0.12, 0.08)))
		
		# Connect button
		var idx := i
		btn.pressed.connect(func(): choose_response(idx))
		
		_response_container.add_child(btn)
	
	responses_shown.emit(responses)

func _hide_responses() -> void:
	_response_container.visible = false
	_waiting_for_response = false

func _hide_dialogue_box() -> void:
	if _dialogue_box and is_instance_valid(_dialogue_box):
		_dialogue_box.queue_free()
	_dialogue_box = null

func _make_dialogue_style() -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = Color(0.06, 0.05, 0.04, 0.95)
	style.border_width_left = 2
	style.border_width_right = 2
	style.border_width_top = 2
	style.border_width_bottom = 2
	style.border_color = Color(0.5, 0.42, 0.20, 0.8)
	style.corner_radius_top_left = 4
	style.corner_radius_top_right = 4
	style.corner_radius_bottom_left = 4
	style.corner_radius_bottom_right = 4
	style.content_margin_left = 8
	style.content_margin_right = 8
	style.content_margin_top = 8
	style.content_margin_bottom = 8
	return style

func _make_button_style(hover_color: Color = Color(0.10, 0.08, 0.06)) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = hover_color
	style.border_width_left = 1
	style.border_width_right = 1
	style.border_width_top = 1
	style.border_width_bottom = 1
	style.border_color = Color(0.4, 0.33, 0.15, 0.5)
	return style
