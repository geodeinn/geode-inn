extends Node
## Dev tool: renders the creature models in each of their animations (start,
## middle, end) so a pose can be picked.
##   godot --path . --rendering-driver opengl3_angle res://tools/creature_probe.tscn

const OUT := "res://test_output/models/"


func _ready() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(OUT))
	var win := get_window()
	win.unfocusable = true
	win.mouse_passthrough = true
	win.size = Vector2i(96, 64)
	var vp := SubViewport.new()
	vp.size = Vector2i(1200, 800)
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(vp)
	var env := WorldEnvironment.new()
	env.environment = Environment.new()
	env.environment.background_mode = Environment.BG_COLOR
	env.environment.background_color = Color(0.2, 0.2, 0.22)
	env.environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.environment.ambient_light_color = Color(0.7, 0.7, 0.7)
	vp.add_child(env)
	var sun := DirectionalLight3D.new()
	sun.rotation = Vector3(-0.8, 0.6, 0)
	vp.add_child(sun)
	var cam := Camera3D.new()
	vp.add_child(cam)
	for path in OS.get_cmdline_user_args():
		var inst: Node3D = (load(path) as PackedScene).instantiate()
		vp.add_child(inst)
		var ap := inst.find_child("AnimationPlayer", true, false) as AnimationPlayer
		await get_tree().process_frame
		var aabb := AABB()
		var first := true
		for mi in inst.find_children("*", "MeshInstance3D", true, false):
			var box := (mi as MeshInstance3D).global_transform * (mi as MeshInstance3D).get_aabb()
			aabb = box if first else aabb.merge(box)
			first = false
		var size := maxf(aabb.size.length(), 0.5)
		cam.position = aabb.get_center() + Vector3(size * 0.9, size * 0.45, size * 0.9)
		cam.look_at(aabb.get_center())
		print(path, " aabb ", aabb)
		var names := ap.get_animation_list() if ap else PackedStringArray([""])
		for an in names:
			for frac in [0.0, 0.5, 1.0]:
				if ap and an != "":
					ap.play(an)
					ap.seek(ap.get_animation(an).length * frac, true)
					ap.pause()
				for i in 4:
					await get_tree().process_frame
				var file := "%s_%s_%d.png" % [path.get_file().get_basename(), an.replace("|", "_"), int(frac * 100)]
				vp.get_texture().get_image().save_png(ProjectSettings.globalize_path(OUT + file))
		inst.queue_free()
	get_tree().quit(0)
