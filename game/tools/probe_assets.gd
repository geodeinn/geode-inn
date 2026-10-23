extends Node
## Dev tool: prints the node tree, skeletons and animations of imported scenes.
##   godot --headless --path . res://tools/probe_assets.tscn -- <res://path> [...]


func _ready() -> void:
	for path in OS.get_cmdline_user_args():
		var ps: PackedScene = load(path)
		if ps == null:
			print("CAN'T LOAD ", path)
			continue
		var root := ps.instantiate()
		print("=== ", path)
		_dump(root, 0)
		for ap in root.find_children("*", "AnimationPlayer", true, false):
			var p := ap as AnimationPlayer
			print("  AnimationPlayer ", root.get_path_to(p), " root_node=", p.root_node, " anims=", p.get_animation_list().size())
			var list := p.get_animation_list()
			print("   ", list.slice(0, 50))
			if list.size() > 0:
				var a := p.get_animation(list[min(1, list.size() - 1)])
				for i in mini(a.get_track_count(), 6):
					print("    track ", a.track_get_path(i), " type ", a.track_get_type(i))
		for sk in root.find_children("*", "Skeleton3D", true, false):
			var s := sk as Skeleton3D
			print("  Skeleton ", root.get_path_to(s), " bones=", s.get_bone_count(), " first=", s.get_bone_name(0))
			var all := []
			for b in s.get_bone_count():
				all.append(s.get_bone_name(b))
			print("   bones: ", ", ".join(all))
			var hips := s.find_bone("pelvis")
			if hips >= 0:
				print("   pelvis rest ", s.get_bone_rest(hips))
		root.free()
	get_tree().quit()


func _dump(n: Node, depth: int) -> void:
	if depth > 5:
		return
	var extra := ""
	if n is MeshInstance3D:
		var m := n as MeshInstance3D
		extra = " mesh=%s surfaces=%d skin=%s skel=%s" % [m.mesh.resource_name if m.mesh else "-", m.mesh.get_surface_count() if m.mesh else 0, m.skin != null, m.skeleton]
	print("  ".repeat(depth + 1), n.name, " <", n.get_class(), ">", extra)
	for c in n.get_children():
		_dump(c, depth + 1)
