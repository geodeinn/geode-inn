class_name RemotePlayer
extends Node3D
## Another player, drawn from server snapshots and smoothed between them.

var peer_id := 0
var target_pos := Vector3.ZERO
var target_yaw := 0.0
var is_frog := false
var _body: Node3D
var _label: Label3D
var _person: CharacterModel
var _look_name := ""
var _look_code := ""   # the look they chose (CharacterModel.encode_look); empty = picked from the name


func setup(id: int, display_name: String) -> void:
	peer_id = id
	name = "Remote_%d" % id
	_body = Node3D.new()
	add_child(_body)
	_label = Builder.name_tag(self, display_name, Vector3(0, 2.15, 0), Color(0.85, 0.92, 1.0))
	_look_name = display_name
	_rebuild()


func apply(entry: Dictionary) -> void:
	target_pos = entry.get("pos", target_pos)
	target_yaw = float(entry.get("rot_y", target_yaw))
	_label.text = String(entry.get("name", _label.text))
	var frog := bool(entry.get("frog", false))
	var code := String(entry.get("look", ""))
	if frog != is_frog or code != _look_code:
		is_frog = frog
		_look_code = code
		_rebuild()


func _rebuild() -> void:
	for c in _body.get_children():
		c.queue_free()
	_person = null
	if is_frog:
		Creatures.frog(_body)
		return
	if CharacterModel.available():
		var chosen := CharacterModel.decode_look(_look_code)
		_person = CharacterModel.make(_body, chosen if not chosen.is_empty() else CharacterModel.player_look(_look_name))
		_person.update_every = 0.1 if Settings.low_detail() else 0.0
		return
	Builder.cylinder(_body, 0.32, 1.1, Vector3(0, 0.55, 0), Color(0.22, 0.24, 0.3), false, "", 0.26)
	Builder.sphere(_body, 0.22, Vector3(0, 1.38, 0), Color(0.82, 0.76, 0.7))


func _process(delta: float) -> void:
	var before := position
	position = position.lerp(target_pos, clampf(delta * 10.0, 0.0, 1.0))
	_body.rotation.y = lerp_angle(_body.rotation.y, target_yaw, clampf(delta * 10.0, 0.0, 1.0))
	if _person != null:
		var moved := Vector2(position.x - before.x, position.z - before.z).length()
		_person.move_speed(moved / maxf(delta, 0.001))
