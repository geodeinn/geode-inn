extends Node
## Dev tool: frame time per zone, rendered offscreen at 1280x720 (so it never
## takes the desktop's focus).
##   godot --path . --rendering-driver opengl3_angle res://tools/bench.tscn [-- low]

var _vp: SubViewport


func _ready() -> void:
	var win := get_window()
	win.unfocusable = true
	win.mouse_passthrough = true
	win.size = Vector2i(96, 64)
	if "low" in OS.get_cmdline_user_args():
		Settings.graphics_quality = "low"
	elif "high" in OS.get_cmdline_user_args():
		Settings.graphics_quality = "high"
	print("[bench] adapter: ", RenderingServer.get_video_adapter_name(), "  low detail: ", Settings.low_detail())
	_vp = SubViewport.new()
	_vp.size = Vector2i(1280, 720)
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_vp.audio_listener_enable_3d = false
	if Settings.low_detail():
		_vp.scaling_3d_scale = 0.75
		_vp.mesh_lod_threshold = 8.0
	for a in OS.get_cmdline_user_args():
		if a.begins_with("scale="):   # scale_arg: try another 3D resolution
			_vp.scaling_3d_scale = float(a.substr(6))
	add_child(_vp)
	PlayerState.slot = "bench"
	PlayerState.new_profile("Bench")
	for spec in [["main_floor", "door"], ["campgrounds", "porch"], ["faire", "entrance"]]:
		SceneRouter.spawn_point = spec[1]
		SceneRouter.current_zone = spec[0]
		var zone: Node = (load(SceneRouter.ZONES[spec[0]]) as PackedScene).instantiate()
		_vp.add_child(zone)
		for i in 20:
			await get_tree().process_frame
		print("[bench] %-12s %.1f ms/frame  all" % [spec[0], await _measure()])
		if "parts" in OS.get_cmdline_user_args():
			# What each kind of thing costs: hide it and measure again.
			for kind in ["OmniLight3D", "CharacterModel", "MultiMeshInstance3D", "CPUParticles3D", "Label3D"]:
				var hidden := []
				for n in zone.find_children("*", "", true, false):
					if n.is_queued_for_deletion():
						continue
					if n.is_class(kind) or (kind == "CharacterModel" and n is CharacterModel):
						if (n as Node3D).visible:
							(n as Node3D).visible = false
							hidden.append(n)
				print("[bench] %-12s %.1f ms/frame  without %s (%d)" % [spec[0], await _measure(), kind, hidden.size()])
				for n in hidden:
					if is_instance_valid(n):
						(n as Node3D).visible = true
			var players := zone.find_children("*", "AnimationPlayer", true, false)
			for ap in players:
				(ap as AnimationPlayer).pause()
			print("[bench] %-12s %.1f ms/frame  animations paused (%d)" % [spec[0], await _measure(), players.size()])
			for ap in players:
				(ap as AnimationPlayer).play()
			_vp.mesh_lod_threshold = 8.0
			print("[bench] %-12s %.1f ms/frame  LOD threshold 8" % [spec[0], await _measure()])
			var skinned := []
			for cm in zone.find_children("*", "CharacterModel", true, false):
				for mi in cm.find_children("*", "MeshInstance3D", true, false):
					skinned.append([mi, (mi as MeshInstance3D).skeleton, (mi as MeshInstance3D).skin])
					(mi as MeshInstance3D).skeleton = NodePath("")
			print("[bench] %-12s %.1f ms/frame  people drawn without skinning (%d meshes)" % [spec[0], await _measure(), skinned.size()])
			for s in skinned:
				(s[0] as MeshInstance3D).skeleton = s[1]
			_vp.mesh_lod_threshold = 8.0 if Settings.low_detail() else 1.0
		zone.queue_free()
		await get_tree().process_frame
	get_tree().quit(0)


func _measure() -> float:
	for i in 5:
		await get_tree().process_frame
	var t0 := Time.get_ticks_usec()
	for i in 30:
		await get_tree().process_frame
	return float(Time.get_ticks_usec() - t0) / 30000.0
