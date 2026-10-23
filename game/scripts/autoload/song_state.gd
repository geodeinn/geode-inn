extends Node
## The Song. One world value shared by every player on the server (the client
## confirmed the Song is a core part of the whole world), climbing from 42Hz
## toward 44Hz as everyone plays. 44Hz is the endgame, so the first release
## stops at release_cap_hz. Each player also has their own Song Spectrum
## (their points), which decides which hidden layers they can perceive.

var world_points := 0.0
var _start_hz := 42.0
var _complete_hz := 44.0
var _cap_hz := 44.0
var _rate := 0.0005


func _ready() -> void:
	var song: Dictionary = GameData.world.get("song", {})
	_start_hz = float(song.get("start_hz", 42.0))
	_complete_hz = float(song.get("complete_hz", 44.0))
	_cap_hz = minf(float(song.get("release_cap_hz", _complete_hz)), _complete_hz)
	_rate = float(song.get("world_hz_per_point", 0.0005))
	EventBus.game_event.connect(_on_game_event)


func world_hz() -> float:
	return hz_for_points(world_points)


func hz_for_points(points: float) -> float:
	return clampf(_start_hz + points * _rate, _start_hz, _cap_hz)


## 0.0 at 42Hz, 1.0 at 44Hz.
func world_progress() -> float:
	return inverse_lerp(_start_hz, _complete_hz, world_hz())


func is_complete() -> bool:
	return world_hz() >= _complete_hz


func cap_hz() -> float:
	return _cap_hz


func personal_points() -> float:
	return float(PlayerState.profile.get("song_points", 0.0))


## Adds points for something the player did. Offline the world is the player's
## own; online the server owns the world total and broadcasts it back.
func add_points(points: float, reason := "") -> void:
	if points <= 0.0:
		return
	PlayerState.profile["song_points"] = personal_points() + points
	if Net.is_online():
		Net.submit_song_points(points, reason)
	else:
		world_points += points
	EventBus.song_changed.emit(world_hz(), personal_points())


func points_for(kind: String) -> float:
	return float(GameData.world.get("song", {}).get("points", {}).get(kind, 0.0))


## Server snapshot (or a test) sets the shared value.
func set_world_points(points: float) -> void:
	world_points = maxf(points, 0.0)
	EventBus.song_changed.emit(world_hz(), personal_points())


func can_perceive(layer_id: String) -> bool:
	for layer in GameData.world.get("song", {}).get("spectrum_layers", []):
		if layer["id"] == layer_id:
			return personal_points() >= float(layer["min_points"])
	return false


func perceived_layers() -> Array[String]:
	var out: Array[String] = []
	for layer in GameData.world.get("song", {}).get("spectrum_layers", []):
		if personal_points() >= float(layer["min_points"]):
			out.append(String(layer["id"]))
	return out


func _on_game_event(id: String, _data: Dictionary) -> void:
	match id:
		"stone_learned":
			add_points(points_for("stone_learned"), id)
		"nook_complete":
			add_points(points_for("nook_complete"), id)
		"faire_visit":
			add_points(points_for("faire_visit"), id)
		"circle:ignited":
			add_points(points_for("circle_ignited"), id)
		"circle:seven_sisters":
			add_points(points_for("seven_sisters"), id)
		_:
			if id.begins_with("harmonized:"):
				add_points(points_for("harmonized"), id)
			elif id.begins_with("built:"):
				add_points(points_for("built"), id)
