extends Node
## Headless test runner. Run from the game folder:
##   godot --headless --path . res://tests/test_runner.tscn
## Exit code 0 means every test passed. Each tests/test_*.gd file is a
## RefCounted with test_* methods; `t` is this runner (use t.check / t.near).

var failures: Array[String] = []
var passed := 0
var _current := ""


func _ready() -> void:
	var files := []
	for f in DirAccess.get_files_at("res://tests"):
		if f.begins_with("test_") and f.ends_with(".gd") and f != "test_runner.gd":
			files.append(f)
	files.sort()
	for f in files:
		var script: GDScript = load("res://tests/" + f)
		if script == null or not script.can_instantiate():
			failures.append("%s: test file failed to load (parse error)" % f)
			continue
		for m in script.get_script_method_list():
			var method := String(m["name"])
			if not method.begins_with("test_"):
				continue
			_reset_state()
			_current = "%s.%s" % [f.get_basename(), method]
			if OS.has_environment("TEST_TRACE"):
				print("> ", _current)
			var suite: Object = script.new()
			var before := failures.size()
			if suite.has_method("setup"):
				suite.call("setup", self)
			# await works for both plain and coroutine test methods.
			await suite.call(method, self)
			if failures.size() == before:
				passed += 1
	print("")
	print("==== %d passed, %d failed ====" % [passed, failures.size()])
	for f in failures:
		print("FAIL " + f)
	Builder.clear_cache()
	UITheme.clear_cache()
	CharacterModel.clear_cache()
	Creatures.clear_cache()
	await get_tree().process_frame
	get_tree().quit(0 if failures.is_empty() else 1)


func _reset_state() -> void:
	PlayerState.new_profile("Tester")
	SongState.world_points = 0.0
	Services.unlocked_achievements.clear()


func check(condition: bool, what: String) -> void:
	if not condition:
		failures.append("%s: %s" % [_current, what])


func eq(actual: Variant, expected: Variant, what: String) -> void:
	if actual != expected:
		failures.append("%s: %s (got %s, want %s)" % [_current, what, str(actual), str(expected)])


func near(actual: float, expected: float, tolerance: float, what: String) -> void:
	if absf(actual - expected) > tolerance:
		failures.append("%s: %s (got %s, want %s +/- %s)" % [_current, what, str(actual), str(expected), str(tolerance)])
