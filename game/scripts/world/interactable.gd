class_name Interactable
extends Node3D
## Something the player can use. The zone decides what happens by `kind`:
## npc, nook, cave, being, gather, plot, workbench, drum, observe, portal,
## booth, signpost, trigger (fires when walked into, no button).

var kind := ""
var id := ""
var prompt := ""
var radius := 2.2
var data: Dictionary = {}
var enabled := true
var _was_inside := false


static func make(parent: Node, p_kind: String, p_id: String, pos: Vector3, p_prompt: String, p_radius := 2.2, p_data: Dictionary = {}) -> Interactable:
	var it := Interactable.new()
	it.kind = p_kind
	it.id = p_id
	it.prompt = p_prompt
	it.radius = p_radius
	it.data = p_data
	it.position = pos
	it.name = "%s_%s" % [p_kind, p_id]
	parent.add_child(it)
	return it


func _ready() -> void:
	add_to_group("interactable")


func distance_to_player(player_pos: Vector3) -> float:
	var a := global_position
	a.y = 0.0
	player_pos.y = 0.0
	return a.distance_to(player_pos)


func in_range(player_pos: Vector3) -> bool:
	return enabled and is_visible_in_tree() and distance_to_player(player_pos) <= radius


## Triggers report the moment the player steps in, once per visit.
func check_trigger(player_pos: Vector3) -> bool:
	var inside := in_range(player_pos)
	var fired := inside and not _was_inside
	_was_inside = inside
	return fired
