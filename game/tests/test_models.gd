extends RefCounted
## Real models replace placeholders: a character with a "model" path loads it
## and plays its idle animation.


func _make_model_scene(path: String) -> void:
	var root := Node3D.new()
	root.name = "TestModel"
	var mesh := MeshInstance3D.new()
	mesh.mesh = CapsuleMesh.new()
	root.add_child(mesh)
	mesh.owner = root
	var ap := AnimationPlayer.new()
	root.add_child(ap)
	ap.owner = root
	var lib := AnimationLibrary.new()
	for anim_name in ["idle", "walk", "sit"]:
		var a := Animation.new()
		a.length = 1.0
		a.loop_mode = Animation.LOOP_LINEAR
		lib.add_animation(anim_name, a)
	ap.add_animation_library("", lib)
	var packed := PackedScene.new()
	packed.pack(root)
	ResourceSaver.save(packed, path)
	root.free()


func test_npc_uses_model_and_idles(t) -> void:
	var path := "user://test_model.tscn"
	_make_model_scene(path)
	GameData.characters["host"]["model"] = path
	SceneRouter.spawn_point = "door"
	var zone: Node = (load("res://scenes/zones/main_floor.tscn") as PackedScene).instantiate()
	t.add_child(zone)
	await t.get_tree().process_frame
	var npc: Node = zone.get_node("NPC_host")
	var model := npc.find_child("TestModel", true, false)
	t.check(model != null, "the host's model replaced the placeholder")
	var aps := model.find_children("*", "AnimationPlayer", true, false) if model else []
	var ap: AnimationPlayer = aps[0] if not aps.is_empty() else null
	t.check(ap != null, "model has its AnimationPlayer")
	if ap:
		t.eq(ap.current_animation, "idle", "idle animation playing (has idle: %s, list %s)" % [ap.has_animation("idle"), ap.get_animation_list()])
	GameData.characters["host"].erase("model")
	zone.queue_free()
	await t.get_tree().process_frame
	DirAccess.remove_absolute(ProjectSettings.globalize_path(path))
