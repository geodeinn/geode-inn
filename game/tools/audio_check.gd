extends Node
## Records what the game actually outputs, for checking pitches without a
## sound card. Run with Movie Maker:
##   godot --path . --rendering-driver opengl3_angle --write-movie test_output/audio/frame.png --fixed-fps 30 --quit-after 300 res://tools/audio_check.tscn
## Writes PNG frames plus a .wav of the mixed game audio. Timeline:
##   0.5 s  Clear Quartz chime (B4, 493.9 Hz) in the Main Floor (balanced armature)
##   2.5 s  Malachite chime (hardness 3.5 rounds to 4: F4, 349.2 Hz) in the Catacombs (dynamic driver)
##   4.5 s  The third of the Seven Sisters, tapped (E4, 329.6 Hz)
##   6.5 s  The nook's 42Hz hum (its 168 Hz layer is what small speakers carry)


func _ready() -> void:
	get_window().unfocusable = true
	get_window().mouse_passthrough = true
	Settings.pulse_audio = false   # keep the heartbeat out of this recording
	AudioDirector.apply_volumes()
	await get_tree().create_timer(0.5).timeout
	AudioDirector.set_room("Main Floor")
	AudioDirector.play_stone("clear_quartz", 1.6, false)
	await get_tree().create_timer(2.0).timeout
	AudioDirector.set_room("Catacombs")
	AudioDirector.play_stone("malachite", 1.6, false)
	await get_tree().create_timer(2.0).timeout
	var tones: Array = GameData.world["drum_circle"]["seven_sisters"]["tones_hz"]
	AudioDirector.play_shaped(float(tones[2]), 1.2, "dynamic", 0.06)
	AudioDirector.tap("tap_stone", float(tones[2]), 0.18)
	await get_tree().create_timer(2.0).timeout
	AudioDirector.set_hum(true)
