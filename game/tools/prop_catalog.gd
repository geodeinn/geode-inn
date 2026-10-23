extends SceneTree
## Dev tool: prints the size of every model in assets/props, nature and village
## (metres, in the model's own frame) so props can be placed by measure.
##   godot --headless --path . --script res://tools/prop_catalog.gd


func _init() -> void:
	for dir in ["res://assets/props/", "res://assets/nature/", "res://assets/village/"]:
		for f in DirAccess.get_files_at(dir):
			if not f.ends_with(".gltf"):
				continue
			var inst: Node3D = (load(dir + f) as PackedScene).instantiate()
			var box := AABB()
			var first := true
			var tris := 0
			for n in inst.find_children("*", "MeshInstance3D", true, false):
				var mi := n as MeshInstance3D
				var xf := Transform3D()
				var p: Node = mi
				while p != inst and p != null:
					xf = (p as Node3D).transform * xf
					p = p.get_parent()
				var b := xf * mi.get_aabb()
				box = b if first else box.merge(b)
				first = false
				for s in mi.mesh.get_surface_count():
					tris += mi.mesh.surface_get_array_index_len(s) / 3
			print("%-34s size %s  min %s  tris %d" % [dir.get_file() if false else dir.trim_prefix("res://assets/") + f.get_basename(), box.size.snappedf(0.01), box.position.snappedf(0.01), tris])
			inst.free()
	quit()
