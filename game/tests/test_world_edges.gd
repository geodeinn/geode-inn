extends RefCounted
## Nobody walks off the world: every open zone has walls at the edge of its
## ground, and anyone who ends up below the floor is brought back.


func _zone(t, zone_name: String, spawn: String) -> Node:
	SceneRouter.spawn_point = spawn
	SceneRouter.current_zone = zone_name
	var zone: Node = (load(SceneRouter.ZONES[zone_name]) as PackedScene).instantiate()
	t.add_child(zone)
	await t.get_tree().physics_frame
	await t.get_tree().physics_frame
	return zone


## A ray from inside the edge outward must hit something before it leaves the ground.
func _walled(zone: Node, from: Vector3, dir: Vector3, ground_half: float) -> bool:
	var space := (zone as Node3D).get_world_3d().direct_space_state
	var q := PhysicsRayQueryParameters3D.create(from, from + dir * 30.0)
	q.collision_mask = 1
	var hit := space.intersect_ray(q)
	if hit.is_empty():
		return false
	var p: Vector3 = hit["position"]
	return absf(p.x) <= ground_half and absf(p.z) <= ground_half


func _check_edges(t, zone: Node, ground_half: float, inset: float, what: String) -> void:
	var missing := []
	for i in 9:
		var along := -ground_half + 4.0 + i * (ground_half * 2.0 - 8.0) / 8.0
		for side in [[Vector3(along, 1.0, ground_half - inset), Vector3.BACK], [Vector3(along, 1.0, -ground_half + inset), Vector3.FORWARD],
				[Vector3(ground_half - inset, 1.0, along), Vector3.RIGHT], [Vector3(-ground_half + inset, 1.0, along), Vector3.LEFT]]:
			if not _walled(zone, side[0], side[1], ground_half):
				missing.append(side[0])
	t.check(missing.is_empty(), "%s: a wall at every edge before the ground ends (open at %s)" % [what, str(missing.slice(0, 4))])


func test_faire_has_edges(t) -> void:
	var zone: Node = await _zone(t, "faire", "entrance")
	_check_edges(t, zone, 35.0, 3.0, "the faire")
	zone.queue_free()
	await t.get_tree().process_frame


func test_campgrounds_has_edges(t) -> void:
	var zone: Node = await _zone(t, "campgrounds", "porch")
	_check_edges(t, zone, 65.0, 5.0, "the campgrounds")
	zone.queue_free()
	await t.get_tree().process_frame


func test_a_fall_is_caught(t) -> void:
	var zone: Node = await _zone(t, "faire", "entrance")
	var player: Player = zone.get("player")
	player.global_position = Vector3(80, -30, 80)
	await t.get_tree().process_frame
	await t.get_tree().process_frame
	var spawn: Vector3 = zone.get("spawns")["default"][0]
	t.check(player.global_position.distance_to(spawn) < 1.0, "below the world, the player is set back at the way in (%s)" % str(player.global_position))
	zone.queue_free()
	await t.get_tree().process_frame
