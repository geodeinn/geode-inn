extends Node
## Dev tool: renders the cast and creatures offscreen for review.
##   godot --path . --rendering-driver opengl3_angle res://tools/model_preview.tscn
## Images go to test_output/models/.

const OUT := "res://test_output/models/"

var _vp: SubViewport
var _cam: Camera3D
var _stage: Node3D


func _ready() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(OUT))
	var win := get_window()
	win.unfocusable = true
	Settings.graphics_quality = "high"   # screenshots show the full detail
	win.mouse_passthrough = true
	win.size = Vector2i(96, 64)
	_vp = SubViewport.new()
	_vp.size = Vector2i(1600, 900)
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_vp.audio_listener_enable_3d = false
	add_child(_vp)
	_stage = Node3D.new()
	_vp.add_child(_stage)
	var env := WorldEnvironment.new()
	env.environment = Environment.new()
	env.environment.background_mode = Environment.BG_COLOR
	env.environment.background_color = Color(0.16, 0.15, 0.17)
	env.environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.environment.ambient_light_color = Color(0.62, 0.6, 0.62)
	env.environment.ambient_light_energy = 0.7
	env.environment.tonemap_mode = Environment.TONE_MAPPER_FILMIC
	_stage.add_child(env)
	var sun := DirectionalLight3D.new()
	sun.rotation = Vector3(-0.7, 0.5, 0.0)
	sun.light_energy = 1.3
	sun.shadow_enabled = true
	_stage.add_child(sun)
	Builder.box(_stage, Vector3(40, 0.1, 20), Vector3(0, -0.05, 0), Color(0.32, 0.3, 0.28), false)
	_cam = Camera3D.new()
	_cam.fov = 40.0
	_cam.current = true
	_vp.add_child(_cam)
	var args := OS.get_cmdline_user_args()
	var cast: Array = []
	for cid in GameData.characters.keys():
		if GameData.characters[cid].has("look"):
			cast.append(cid)
	var row := Node3D.new()
	_stage.add_child(row)
	var x := -float(cast.size() - 1) * 0.45
	for cid in cast:
		var holder := Node3D.new()
		holder.position = Vector3(x, 0, 0)
		holder.rotation.y = PI   # face the camera (characters face -Z)
		row.add_child(holder)
		Creatures.dress(cid, CharacterModel.make(holder, GameData.characters[cid]["look"]))
		x += 0.9
	await _settle(30)
	await _shoot(Vector3(0, 1.3, 15.5), Vector3(0, 0.95, 0), "cast_lineup")
	_cam.fov = 22.0
	for i in mini(cast.size(), 99):
		var px := -float(cast.size() - 1) * 0.45 + i * 0.9
		var h := float(GameData.characters[cast[i]]["look"].get("height", 1.0))
		await _shoot(Vector3(px, 1.55 * h, 2.6 * maxf(h, 0.5)), Vector3(px, 1.45 * h, 0), "face_" + cast[i])
		if "all" not in args and i > 4:
			break
	row.queue_free()
	await _settle(3)
	# The creatures, with a person for scale.
	var zoo := Node3D.new()
	_stage.add_child(zoo)
	var spots := {
		"person": Vector3(-2.4, 0, 0), "wolf": Vector3(-1.0, 0, 0), "dragon": Vector3(0.6, 0.0, 0),
		"owl": Vector3(1.9, 0, 0), "gecko": Vector3(2.6, 0, 0.4), "fossil_rat": Vector3(3.1, 0, 0.4), "frog": Vector3(3.8, 0, 0.3),
	}
	for kind in spots:
		var h := Node3D.new()
		h.position = spots[kind]
		h.rotation.y = PI * 0.8
		zoo.add_child(h)
		match kind:
			"person":
				CharacterModel.make(h, CharacterModel.PLAYER_LOOKS[0])
			"frog":
				Creatures.frog(h)
			_:
				Creatures.build(kind, h, Color(0.79, 0.54, 0.23))
	await _settle(10)
	_cam.fov = 40.0
	await _shoot(Vector3(0.8, 1.6, 6.0), Vector3(0.8, 0.6, 0), "creatures")
	_cam.fov = 30.0
	await _shoot(Vector3(0.6, 1.4, 2.4), Vector3(0.6, 0.4, 0), "dragon_close")
	await _shoot(Vector3(3.0, 0.5, 1.6), Vector3(3.0, 0.1, 0.3), "small_ones")
	print("[models] done")
	get_tree().quit(0)


func _settle(frames: int) -> void:
	for i in frames:
		await get_tree().process_frame


func _shoot(from: Vector3, at: Vector3, file_name: String) -> void:
	_cam.position = from
	_cam.look_at(at, Vector3.UP)
	RenderingServer.force_draw(false)
	await get_tree().process_frame
	await get_tree().process_frame
	var img := _vp.get_texture().get_image()
	img.save_png(ProjectSettings.globalize_path(OUT + file_name + ".png"))
	print("[models] ", file_name)
