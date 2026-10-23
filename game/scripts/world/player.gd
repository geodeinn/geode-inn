class_name Player
extends CharacterBody3D
## Third-person player. WASD or left stick to move, right mouse drag or right
## stick to look, E to use, C to sit, Space to tap whatever is at hand.
## Placeholder body until the client's character models arrive (the selkie
## Artisan Thief by default).

signal interact_pressed
signal sit_pressed
signal tap_pressed

const SPEED := 4.2
const TURN_SPEED := 10.0
const SIT_OFFSET := Vector3(0, 0, 0.12)   # where the feet go, from the seat's centre

var input_locked := false
## Sitting on a seat puts the player on it; standing up steps them off the front.
var sitting := false:
	set(v):
		if sitting and not v and _seat != null and is_instance_valid(_seat) and is_inside_tree():
			global_position = _seat.global_transform * Vector3(0, 0, -0.9)
		if not v:
			_seat = null
		sitting = v
var _seat: Node3D
var is_frog := false
var speed_multiplier := 1.0
var net_enabled := true   # off in single-player spaces like the Final Room
var first_person := false
var camera: Camera3D
var _yaw := 0.0
var _pitch := -0.32
var _arm: SpringArm3D
var _pivot: Node3D
var _body: Node3D
var _gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity", 9.8)
var _net_timer := 0.0
var _still_time := 0.0


func _ready() -> void:
	var shape := CollisionShape3D.new()
	var cap := CapsuleShape3D.new()
	cap.radius = 0.35
	cap.height = 1.7
	shape.shape = cap
	shape.position.y = 0.85
	add_child(shape)
	_body = Node3D.new()
	_body.name = "Body"
	add_child(_body)
	_build_body()
	_pivot = Node3D.new()
	_pivot.position.y = 1.45
	add_child(_pivot)
	_arm = SpringArm3D.new()
	_arm.spring_length = 4.6
	_arm.margin = 0.2
	_arm.collision_mask = 1 | 2   # walls, and the camera-only blockers in doorways
	_arm.add_excluded_object(get_rid())
	_pivot.add_child(_arm)
	camera = Camera3D.new()
	camera.fov = 62.0
	camera.current = true
	_arm.add_child(camera)
	_apply_camera()


var _model: Node3D
var _person: CharacterModel


func _build_body() -> void:
	for c in _body.get_children():
		c.queue_free()
	_model = null
	_person = null
	if is_frog:
		Creatures.frog(_body)
		return
	# The client's player model, when it exists: player_<class>.glb.
	var cls := String(PlayerState.profile.get("class", "artisan_thief"))
	_model = Builder.load_model(_body, "res://assets/models/characters/player_%s.glb" % cls)
	if _model != null:
		Builder.play_anim(_model, "idle")
		return
	if CharacterModel.available():
		_person = CharacterModel.make(_body, CharacterModel.look_of(PlayerState.profile))
		return
	# Selkie jeweler: dark clothes, the leather apron, a labradorite glint.
	Builder.cylinder(_body, 0.32, 1.1, Vector3(0, 0.55, 0), Color(0.16, 0.14, 0.15), false, "", 0.26)
	Builder.box(_body, Vector3(0.46, 0.75, 0.06), Vector3(0, 0.62, -0.3), Color(0.36, 0.25, 0.16), false)
	Builder.sphere(_body, 0.22, Vector3(0, 1.38, 0), Color(0.86, 0.82, 0.8))
	Builder.box(_body, Vector3(0.5, 0.18, 0.46), Vector3(0, 1.55, 0.04), Color(0.06, 0.06, 0.08), false)
	Builder.sphere(_body, 0.05, Vector3(0.12, 0.85, -0.34), Color(0.3, 0.8, 0.85), 2.5)


## Sits down on a seat (a nook's bench): on it, facing out the front.
func sit_on(seat: Node3D) -> void:
	sitting = true
	_seat = seat
	velocity = Vector3.ZERO
	global_position = seat.global_transform * SIT_OFFSET
	_body.rotation.y = seat.global_rotation.y


## Rebuilds the body after the player changes their look in the creator.
func refresh_look() -> void:
	_build_body()


func set_frog(on: bool) -> void:
	if is_frog == on:
		return
	is_frog = on
	_build_body()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		var m := event as InputEventMouseMotion
		_yaw -= m.relative.x * Settings.mouse_sensitivity * 0.01
		_pitch = clampf(_pitch - m.relative.y * Settings.mouse_sensitivity * 0.01, -1.2, 0.35)
		_apply_camera()
	if input_locked:
		return
	if event.is_action_pressed("interact"):
		interact_pressed.emit()
	elif event.is_action_pressed("sit"):
		sit_pressed.emit()
	elif event.is_action_pressed("tap"):
		tap_pressed.emit()


func _apply_camera() -> void:
	if _pivot:
		_pivot.rotation = Vector3(_pitch, _yaw, 0.0)


func set_view(yaw: float, pitch := -0.32) -> void:
	_yaw = yaw
	_pitch = pitch
	_apply_camera()


## First person puts the camera at eye height with no arm (the nook's SIT Lock,
## the Final Room chair).
func set_first_person(on: bool, eye_height := 1.05) -> void:
	first_person = on
	_arm.spring_length = 0.0 if on else 4.6
	_pivot.position.y = eye_height if on else 1.45
	_body.visible = not on


## You Looked: the camera steps outside for a moment, high and back, so the
## player sees themselves sitting in the Inn. Off returns to wherever it was.
var detached := false
var _before_detach := {}


func set_detached(on: bool) -> void:
	if on == detached:
		return
	detached = on
	if on:
		_before_detach = { "first": first_person, "pitch": _pitch, "yaw": _yaw }
		first_person = false
		_body.visible = true
		_pivot.position.y = 1.45
		_arm.spring_length = 7.0
		set_view(_yaw + PI * 0.75, -0.55)
	else:
		set_first_person(bool(_before_detach.get("first", false)))
		set_view(float(_before_detach.get("yaw", _yaw)), float(_before_detach.get("pitch", _pitch)))


func _physics_process(delta: float) -> void:
	var look := Input.get_axis("look_left", "look_right")
	if absf(look) > 0.05:
		_yaw -= look * 2.4 * delta
		_apply_camera()
	var input := Vector2.ZERO
	if not input_locked:
		input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	if sitting and input.length() > 0.2:
		sitting = false
	var dir := Vector3.ZERO
	if not sitting and input.length() > 0.05:
		var yaw_basis := Basis(Vector3.UP, _yaw)
		dir = (yaw_basis * Vector3(input.x, 0.0, input.y)).normalized()
		_body.rotation.y = lerp_angle(_body.rotation.y, atan2(-dir.x, -dir.z), clampf(TURN_SPEED * delta, 0.0, 1.0))
	var speed := SPEED * (0.55 if is_frog else 1.0) * speed_multiplier
	velocity.x = dir.x * speed
	velocity.z = dir.z * speed
	if _seat != null:
		velocity = Vector3.ZERO   # on the bench; the bench's own collision would push us off
	else:
		if not is_on_floor():
			velocity.y -= _gravity * delta
		else:
			velocity.y = -0.1
		move_and_slide()
	_still_time = (_still_time + delta) if dir == Vector3.ZERO else 0.0
	_body.position.y = -0.35 if sitting and _model == null and _person == null else 0.0
	if _model != null:
		Builder.play_anim(_model, "sit" if sitting else ("walk" if dir != Vector3.ZERO else "idle"))
	elif _person != null:
		if sitting:
			_person.play("Sitting_Idle")
		else:
			_person.move_speed(Vector2(velocity.x, velocity.z).length())
	_net_timer += delta
	if net_enabled and _net_timer >= 0.1:
		_net_timer = 0.0
		Net.send_state(SceneRouter.current_zone, global_position, _body.rotation.y)


## Seconds the player has held still (the Nook Effect counts this).
func still_time() -> float:
	return _still_time


func facing_yaw() -> float:
	return _body.rotation.y
