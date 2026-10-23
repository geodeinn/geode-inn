extends Node
## Loads every script in the project and reports any that fail to parse.
##   godot --headless --path . res://tools/check_scripts.tscn


func _ready() -> void:
	var bad := 0
	for path in _scripts("res://"):
		var s: Script = load(path)
		if s == null or not s.can_instantiate():
			print("FAILED ", path)
			bad += 1
	print("checked scripts, %d failed" % bad)
	get_tree().quit(1 if bad > 0 else 0)


func _scripts(dir: String) -> Array[String]:
	var out: Array[String] = []
	for d in DirAccess.get_directories_at(dir):
		if d.begins_with(".") or d in ["test_output", "build", "export"]:
			continue
		out.append_array(_scripts(dir.path_join(d)))
	for f in DirAccess.get_files_at(dir):
		if f.ends_with(".gd"):
			out.append(dir.path_join(f))
	return out
