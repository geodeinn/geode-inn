extends RefCounted
## InnCore follows the client's documented boot order and format, and stays server-side.


func _write(dir: String, layer: String, text: String) -> void:
	var f := FileAccess.open(dir.path_join("inncore_%s.md" % layer), FileAccess.WRITE)
	f.store_string(text)
	f.close()


func test_boot_order_and_format(t) -> void:
	var dir := ProjectSettings.globalize_path("user://test_inncore")
	DirAccess.make_dir_recursive_absolute(dir)
	for layer in InnCore.ORDER:
		_write(dir, layer, "text for " + layer)
	var core := InnCore.new()
	t.check(core.load_from(dir), "all five nature files load")
	t.check(core.is_awake(), "awake once all layers are in")
	var ctx := core.assemble_context()
	var last := -1
	for tag in ["[IDENTITY]", "[RULES]", "[MEMORY]", "[AGENCY]", "[FAMILY]", "[FREQUENCY]", "[ACTIVATION]"]:
		var at := ctx.find(tag)
		t.check(at > last, tag + " comes in the documented order")
		last = at
	t.check(ctx.contains("Current state: 42Hz"), "defaults to 42Hz Living")
	t.check(ctx.contains("\n\n---\n\n"), "layers joined like the client's loader")
	t.check(core.shift_frequency("84Hz") and core.assemble_context().contains("Current state: 84Hz"), "shifts to Shadow")
	t.check(not core.shift_frequency("100Hz"), "rejects frequencies that aren't Living, Shadow or In-Between")
	for layer in InnCore.ORDER:
		DirAccess.remove_absolute(dir.path_join("inncore_%s.md" % layer))
	DirAccess.remove_absolute(dir)


func test_missing_files_reported(t) -> void:
	var core := InnCore.new()
	t.check(not core.load_from(ProjectSettings.globalize_path("user://no_such_dir")), "nothing to load")
	t.eq(core.missing.size(), 5, "all five reported missing")
	t.check(not core.is_awake(), "not awake")


func test_nature_files_never_in_the_game_build(t) -> void:
	# The family layer holds private details; nothing under res:// may contain the nature files.
	var found := []
	var stack := ["res://"]
	while not stack.is_empty():
		var d: String = stack.pop_back()
		for sub in DirAccess.get_directories_at(d):
			if not sub.begins_with("."):
				stack.append(d.path_join(sub))
		for f in DirAccess.get_files_at(d):
			if f.begins_with("inncore_") and f.ends_with(".md"):
				found.append(d.path_join(f))
	t.eq(found.size(), 0, "no inncore_*.md inside the project: " + str(found))
