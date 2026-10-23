class_name RemotePlayer
extends Node3D
## Another player, drawn from server snapshots and smoothed between them.

var peer_id := 0
var target_pos := Vector3.ZERO
var target_yaw := 0.0
var is_frog := false
var _body: Node3D
var _label: Label3D


func setup(id: int, display_name: String) -> void:
	peer_id = id
	name = "Remote_%d" % id
	_body = Node3D.new()
	add_child(_body)
	_label = Builder.label(self, display_name, Vector3(0, 2.15, 0), 40, Color(0.85, 0.92, 1.0))
	_rebuild()


func apply(entry: Dictionary) -> void:
	target_pos = entry.get("pos", target_pos)
	target_yaw = float(entry.get("rot_y", target_yaw))
	_label.text = String(entry.get("name", _label.text))
	var frog := bool(entry.get("frog", false))
	if frog != is_frog:
		is_frog = frog
		_rebuild()


func _rebuild() -> void:
	for c in _body.get_children():
		c.queue_free()
	if is_frog:
		Builder.sphere(_body, 0.35, Vector3(0, 0.3, 0), Color(0.35, 0.6, 0.25))
		return
	Builder.cylinder(_body, 0.32, 1.1, Vector3(0, 0.55, 0), Color(0.22, 0.24, 0.3), false, "", 0.26)
	Builder.sphere(_body, 0.22, Vector3(0, 1.38, 0), Color(0.82, 0.76, 0.7))


func _process(delta: float) -> void:
	position = position.lerp(target_pos, clampf(delta * 10.0, 0.0, 1.0))
	_body.rotation.y = lerp_angle(_body.rotation.y, target_yaw, clampf(delta * 10.0, 0.0, 1.0))
