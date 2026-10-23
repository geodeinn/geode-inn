class_name CavePanel
extends GamePanel
## Your geode: the player's home, inventory and progress bar, which is a sound
## rather than a number. Each learned stone is a chime you can ring, and every
## new one adds a gem to the geode in the Dragon's Geode Corner.

signal whistle_requested


func _init() -> void:
	super._init("Your Geode", Vector2(700, 540))


func refresh() -> void:
	clear_body()
	var ids := PlayerState.learned_stone_ids()
	if ids.is_empty():
		body.add_child(UITheme.text("The geode is nearly silent. Stones you find will each add a chime.", 18, UITheme.MUTED))
	else:
		body.add_child(UITheme.text("%d tones. Ring a stone to hear it. Giving a stone away never takes its tone." % ids.size(), 16, UITheme.MUTED))
		var grid := GridContainer.new()
		grid.columns = 2
		grid.add_theme_constant_override("h_separation", 12)
		body.add_child(grid)
		for id in ids:
			var s: Dictionary = GameData.stones[id]
			var b := UITheme.button("%s   %s   x%d" % [s["name"], GameData.stone_note_name(id), PlayerState.stone_count(id)], ring.bind(id))
			b.custom_minimum_size = Vector2(320, 40)
			b.alignment = HORIZONTAL_ALIGNMENT_LEFT
			grid.add_child(b)
		body.add_child(UITheme.button("Ring every stone", ring_all))
	body.add_child(HSeparator.new())
	body.add_child(UITheme.title("Companions", 20))
	var comps: Array = PlayerState.profile["companions"]
	if comps.is_empty():
		body.add_child(UITheme.text("No companions yet. Beings you answer, and seeds you grow, will stay close.", 16, UITheme.MUTED))
	for c in comps:
		body.add_child(UITheme.text("Close by: " + String(c), 17))
	if PlayerState.is_unlocked("wolfs_whistle"):
		body.add_child(UITheme.button("Blow the Wolf's Whistle (outdoors)", func() -> void:
			whistle_requested.emit()
			close()))
	body.add_child(HSeparator.new())
	body.add_child(UITheme.text("Song Spectrum: %.1f    The world's Song: %.4f Hz" % [SongState.personal_points(), SongState.world_hz()], 16, UITheme.AMBER))


func ring(stone_id: String) -> void:
	AudioDirector.play_stone(stone_id, 2.0)
	EventBus.emit_event("chime:" + stone_id)


func ring_all() -> void:
	var ids := PlayerState.learned_stone_ids()
	for i in ids.size():
		get_tree().create_timer(0.35 * i).timeout.connect(AudioDirector.play_stone.bind(ids[i], 1.6, false))
