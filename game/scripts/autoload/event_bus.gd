extends Node
## Global signals so systems stay decoupled. Gameplay code emits `game_event`
## with a short string id ("visit:geode_corner", "harmonized:unstrung_echo") and
## the quest, song and achievement systems listen for it.

signal game_event(id: String, data: Dictionary)
signal stone_learned(stone_id: String)
signal stone_count_changed(stone_id: String, count: int)
signal materials_changed()
signal companion_added(companion_id: String)
signal quest_started(quest_id: String)
signal quest_step_completed(quest_id: String, step_id: String)
signal quest_completed(quest_id: String)
signal song_changed(world_hz: float, personal_points: float)
signal pulse_mode_requested(mode: String)
signal toast(text: String)
signal chat_received(entry: Dictionary)
signal player_frog_changed(peer_id: int, is_frog: bool)
signal settings_changed()
signal inn_voice(text: String)        # Elio, the voice of the Inn, at the few moments it speaks


func emit_event(id: String, data: Dictionary = {}) -> void:
	game_event.emit(id, data)
