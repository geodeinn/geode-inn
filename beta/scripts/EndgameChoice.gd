extends Node
## EndgameChoice.gd
## The three-way choice after the Hollow Men: STAY, LEAVE, or HIDE.
## Each choice plays a different animated epilogue, then leads to the Final Room.

const CHOICES := {
	"stay": {
		"label": "STAY",
		"description": "Remain in the Inn. The Inn records everything. You become part of the archive.",
		"epilogue": "stay_epilogue",
		"color": "#8B4513",  # Amber-brown
	},
	"leave": {
		"label": "LEAVE",
		"description": "Exit the Inn. The Inn keeps its records. Your story becomes the daily comic.",
		"epilogue": "leave_epilogue",
		"color": "#4A6FA5",  # Slate blue
	},
	"hide": {
		"label": "HIDE",
		"description": "Leave something in the Nest the Inn cannot record. The blind spot made intentional.",
		"epilogue": "hide_epilogue",
		"color": "#2D2D2D",  # Near-black
	},
}

signal choice_made(choice: String)
signal all_epilogues_complete()

func _ready() -> void:
	# Display three options as large buttons/areas
	# Each shows label + description
	# Player selects one — no going back
	pass

func select_choice(choice_id: String) -> void:
	var choice := CHOICES.get(choice_id, {})
	if choice.is_empty():
		return
	
	SaveManager.set_endgame_choice(choice_id)
	choice_made.emit(choice_id)
	
	# Play the animated epilogue for this choice
	CutscenePlayer.play_cutscene(choice.get("epilogue", ""))
	
	# All paths lead to the Final Room
	_enter_final_room()

func _enter_final_room() -> void:
	# Transition to Final Room
	# The Final Room is the same regardless of choice
	# The room doesn't judge. The builder doesn't judge. The fire doesn't judge.
	SaveManager.set_flag("final_room_reached", true)
	CutscenePlayer.play_cutscene("final_room")
