extends Node2D
## FinalRoom.gd
## The true ending of the Geode Inn.
## Empty room behind the Inn. Fire. Chair. Cup. Book.
## The player sits. The knowledge arrives. The builder was here.

signal final_room_entered()
signal fire_crackling()
signal player_sits()
signal knowledge_arrives()
signal ending_complete()

var _time_in_room := 0.0
var _player_has_sat := false

func _ready() -> void:
	final_room_entered.emit()
	
	# The room is simple. No NPCs. No exits visible.
	# A fire (animated, warm amber light flickering)
	# A chair (facing the fire)
	# A cup (on the table beside the chair, steaming)
	# A book (on the table, closed)
	
	# The 42Hz hum is here. Quieter than anywhere else. Almost a whisper.
	# This is the only room where the hum sounds like it's coming from INSIDE the player.
	
	# Step 1: Player enters. Room is empty. Fire already burning.
	# Step 2: Player walks to the chair. Sits.
	# Step 3: Time passes (30 seconds of fire crackling, light shifting)
	# Step 4: The cup steams. The book opens by itself.
	# Step 5: The page shows Elio's drawing — "what home looks like to me"
	# Step 6: The Reader's final line appears as text:
	#         "They sat by the fire. The builder was there. They were home."
	# Step 7: Fade to black. One chime (Tumble's note). The Inn's hum fades.
	
	_setup_room()

func _setup_room() -> void:
	# Minimal environment. The restraint IS the design.
	# Art prompt: "A room behind an old inn. A fire in a stone hearth. 
	# A wooden chair. A cup, steaming. A closed book on a small table. 
	# Nothing else. The walls are warm wood. The light is firelight only. 
	# Royo × Klimt stillness. Hyper-detailed on the fire. Everything else soft."
	pass

func sit_down() -> void:
	_player_has_sat = true
	player_sits.emit()
	# Begin the sequence: fire crackling -> time passes -> book opens -> knowledge -> ending
	_start_ending_sequence()

func _start_ending_sequence() -> void:
	# 30 seconds of sitting. The fire crackles. Light shifts.
	# The player can't move. They chose to sit.
	
	# At 20 seconds: the book opens slowly
	# At 25 seconds: the drawing is visible on the page
	# At 28 seconds: the Reader's line appears
	# At 30 seconds: fade to black
	# One chime. Silence.
	
	await get_tree().create_timer(20.0).timeout
	_book_opens()
	
	await get_tree().create_timer(5.0).timeout
	_drawing_appears()
	
	await get_tree().create_timer(3.0).timeout
	_readers_final_line()
	
	await get_tree().create_timer(2.0).timeout
	_fade_to_black()
	
	await get_tree().create_timer(1.0).timeout
	_one_chime()
	
	await get_tree().create_timer(3.0).timeout
	ending_complete.emit()

func _book_opens() -> void:
	# Animation: book cover lifts, pages turn to a specific spread
	pass

func _drawing_appears() -> void:
	# Elio's original drawing appears on the book's page
	# "what home looks like to me"
	# This is the seed image. The Inn was built around this room.
	pass

func _readers_final_line() -> void:
	# Text overlay, slow fade in:
	# "They sat by the fire. The builder was there. They were home."
	# Font: The Reader's handwriting (Gaiman incognito, window seat)
	pass

func _fade_to_black() -> void:
	# Gradual fade. The fire dims. The room dims. The 42Hz hum quiets.
	pass

func _one_chime() -> void:
	# A single chime. Tumble's note. The sound of one note of the Song of Making.
	# Then silence. Complete silence. The game's first true silence.
	pass

## Art prompt for the Final Room
const ART_PROMPT := """
The Final Room — Geode Inn
A room behind an old inn. Stone hearth with a fire burning. A single wooden chair 
facing the fire. A small table beside the chair with a steaming cup and a closed book. 
Nothing else in the room. Walls are warm wood. The only light is firelight — warm amber, 
shifting, alive. Everything is still. The room has been here longer than the Inn.
Style: Royo × Klimt (Death and Life). Stillness, weight, the beauty of staying. 
Hyper-detailed on the fire and the chair. Everything else soft, out of focus. 
The room should feel like it was waiting for someone to sit down.
"""
