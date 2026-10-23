extends Node
## Dev tool: renders kit props one by one with axis markers (red +X, blue +Z,
## green +Y) to check which way each faces.
##   godot --path . --rendering-driver opengl3_angle res://tools/prop_preview.tscn -- Name1 Name2 ...
## Images go to test_output/props/<Name>.png.

const OUT := "res://test_output/props/"


func _ready() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(OUT))
	var win := get_window()
	win.unfocusable = true
	win.mouse_passthrough = true
	win.size = Vector2i(96, 64)
	var vp := SubViewport.new()
	vp.size = Vector2i(640, 480)
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(vp)
	var env := WorldEnvironment.new()
	env.environment = Environment.new()
	env.environment.background_mode = Environment.BG_COLOR
	env.environment.background_color = Color(0.3, 0.3, 0.33)
	env.environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.environment.ambient_light_color = Color(0.75, 0.75, 0.75)
	vp.add_child(env)
	var sun := DirectionalLight3D.new()
	sun.rotation = Vector3(-0.8, 0.6, 0)
	vp.add_child(sun)
	var cam := Camera3D.new()
	vp.add_child(cam)
	for prop_name in OS.get_cmdline_user_args():
		var holder := Node3D.new()
		vp.add_child(holder)
		var p := Builder.prop(holder, prop_name, Vector3.ZERO)
		if p == null:
			print("missing ", prop_name)
			holder.queue_free()
			continue
		await get_tree().process_frame
		var box := Creatures._mesh_bounds(p)
		var s := maxf(box.size.length(), 0.3)
		for axis in [[Vector3.RIGHT, Color.RED], [Vector3.UP, Color.GREEN], [Vector3.BACK, Color.BLUE]]:
			var a := Builder.box(holder, Vector3.ONE * s * 0.02 + (axis[0] as Vector3).abs() * s * 0.5, (axis[0] as Vector3) * s * 0.25, axis[1], false)
			a.name = "Axis"
		cam.position = box.get_center() + Vector3(s * 0.75, s * 0.5, s * 1.0)
		cam.look_at(box.get_center())
		for i in 4:
			await get_tree().process_frame
		vp.get_texture().get_image().save_png(ProjectSettings.globalize_path(OUT + prop_name + ".png"))
		holder.queue_free()
		await get_tree().process_frame
	get_tree().quit(0)
