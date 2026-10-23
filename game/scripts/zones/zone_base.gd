class_name ZoneBase
extends Node3D
## Shared behavior for every zone: spawns the player and HUD, finds what the
## player can use, runs nooks (the SIT mechanic), gathering at the heartbeat,
## taps and drum circles, shows hidden layers the player can perceive, keeps
## companions close and draws other players. Each zone overrides
## build_world() to lay out its space.

var zone_id := ""
var spawns: Dictionary = {}           # name -> [Vector3, yaw]
var single_player := false            # no other players, nothing sent to the server
var plain_prompts := false            # prompts without the key hint ("Sit." not "[E] Sit.")
var outdoor := false                  # the Wolf's Whistle works here
var taps_enabled := true
var player: Player
var hud: HUD
var focus: Interactable
var remote_nodes: Dictionary = {}
var judge := BeatJudge.new(50.0)
var circle := DrumCircle.new()
var _nook: Interactable
var _nook_time := 0.0
var _nooks_done: Dictionary = {}
var _looked_this_sit := false
var _gathering: Interactable
var _gather_left: Dictionary = {}     # node instance id -> units left
var _companions: Array[Node3D] = []
var _wolf: Node3D
var _rings: Dictionary = {}           # circle dict id -> ring node
var _save_timer := 0.0
var _people_count := -1
var _chat_typing := false


func _ready() -> void:
	judge = BeatJudge.new(GameData.heartbeat_bpm())
	build_world()
	PlayerState.set_flag("visited_level:" + zone_id)
	_spawn_player()
	player.net_enabled = not single_player
	hud = HUD.new()
	add_child(hud)
	hud.dialogue.finished.connect(_on_dialogue_finished)
	hud.harmonize.harmonized.connect(_on_harmonized)
	hud.homestead.built.connect(_on_built)
	hud.homestead.claimed.connect(func(_p: int) -> void: on_homesteads_changed())
	hud.cave.whistle_requested.connect(whistle)
	hud.faires.enter_faire.connect(func(cfg: Dictionary) -> void:
		hud.close_panels()
		SceneRouter.goto("faire", "entrance", cfg))
	hud.chat.typing_changed.connect(func(v: bool) -> void: _chat_typing = v)
	hud.pulse.beat.connect(_on_beat)
	player.interact_pressed.connect(_on_interact)
	player.sit_pressed.connect(_on_sit)
	player.tap_pressed.connect(_on_tap)
	EventBus.song_changed.connect(func(_w: float, _p: float) -> void: update_layers())
	EventBus.game_event.connect(func(id: String, _d: Dictionary) -> void:
		if id.begins_with("unlocked:") or id.begins_with("quest_done:"):
			update_layers())
	EventBus.companion_added.connect(func(_c: String) -> void: _refresh_companions())
	EventBus.player_frog_changed.connect(_on_frog_changed)
	Net.snapshot_received.connect(_on_snapshot)
	Net.tap_heard.connect(_on_remote_tap)
	Net.claimed_by_swamp.connect(func() -> void: hud.toast("The swamp claimed you. The fire burns low."))
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	update_layers()
	_refresh_companions()
	if Net.is_online() and not single_player:
		Net.register_self(PlayerState.profile.get("name", "Traveler"), zone_id)
	on_zone_ready()
	# The voice of the Inn, when the moment calls for it (the return visit).
	if not SceneRouter.pending_voice.is_empty():
		var line := SceneRouter.pending_voice
		SceneRouter.pending_voice = ""
		get_tree().create_timer(1.4).timeout.connect(func() -> void:
			if is_instance_valid(hud):
				hud.voice.speak(line))


## Override: build geometry, NPCs, interactables, spawns.
func build_world() -> void:
	pass


## Override: anything after the player and HUD exist.
func on_zone_ready() -> void:
	pass


func _spawn_player() -> void:
	player = Player.new()
	player.name = "Player"
	add_child(player)
	var spawn: Array = spawns.get(SceneRouter.spawn_point, spawns.get("default", [Vector3.ZERO, 0.0]))
	player.global_position = spawn[0]
	player.set_view(float(spawn[1]))


# ---------------------------------------------------------------- building helpers

## A character. Those with nothing to say (Charles, Pluck) stand in the world
## but aren't talked to. Returns the character's root node.
func add_npc(cid: String, pos_override := Vector3.INF) -> Node3D:
	var ch := GameData.character(cid)
	var p: Array = ch.get("pos", [0, 0, 0])
	var pos := Vector3(p[0], p[1], p[2]) if pos_override == Vector3.INF else pos_override
	var root := Node3D.new()
	root.name = "NPC_" + cid
	root.position = pos
	add_child(root)
	var col := Builder.color(String(ch.get("color", "#806040")))
	var model := Builder.load_model(root, String(ch.get("model", "")))
	if model != null:
		Builder.play_anim(model, "idle")
	else:
		Builder.cylinder(root, 0.34, 1.15, Vector3(0, 0.58, 0), col, true, "", 0.27)
		Builder.sphere(root, 0.23, Vector3(0, 1.42, 0), col.lightened(0.45))
	Builder.label(root, String(ch.get("name", cid)), Vector3(0, 2.0, 0), 34)
	var portrait := String(ch.get("portrait", ""))
	if not portrait.is_empty() and ResourceLoader.exists(portrait):
		# A small card of the client's concept art, seen from a few steps away,
		# never filling the screen up close. The full portrait is in the dialogue box.
		var card := Sprite3D.new()
		card.texture = load(portrait)
		card.pixel_size = 0.00042
		card.position = Vector3(0, 2.55, 0)
		card.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		card.visibility_range_begin = 3.2
		card.visibility_range_end = 20.0
		root.add_child(card)
	if GameData.dialogue.has(cid):
		Interactable.make(root, "npc", cid, Vector3.ZERO, "Talk to " + String(ch.get("name", cid)), 2.4)
	return root


func add_nook(nook_id: String, pos: Vector3, yaw := 0.0, prompt := "Sit in the nook") -> Interactable:
	var seat := Node3D.new()
	seat.position = pos
	seat.rotation.y = yaw
	add_child(seat)
	Builder.box(seat, Vector3(1.4, 0.35, 1.0), Vector3(0, 0.17, 0), Color(0.42, 0.18, 0.16), true)
	Builder.box(seat, Vector3(1.4, 0.7, 0.2), Vector3(0, 0.5, 0.45), Color(0.36, 0.15, 0.13), true)
	Builder.omni(seat, Vector3(0, 1.4, 0), Color(1.0, 0.7, 0.4), 0.6, 3.0)
	return Interactable.make(seat, "nook", nook_id, Vector3.ZERO, prompt, 1.8)


## A surface that answers a tap in its own voice. tone_hz > 0 makes it a
## lithophone (the Seven Sisters).
func add_tap_surface(node: Node3D, surface: String, tone_hz := 0.0, sister := -1) -> void:
	node.add_to_group("tap_surface")
	node.set_meta("surface", surface)
	if tone_hz > 0.0:
		node.set_meta("tone_hz", tone_hz)
	if sister >= 0:
		node.set_meta("sister", sister)


## A gathering spot (data/crafting.json gather_nodes). Gathering runs at the
## heartbeat: one unit per beat while the player stays. Draw its look as
## children of the returned node so it hides while it rests.
func add_gather(node_id: String, pos: Vector3) -> Interactable:
	var node: Dictionary = GameData.gather_nodes[node_id]
	var it := Interactable.make(self, "gather", node_id, pos, "Gather from the " + String(node["name"]), 2.0, { "node": node_id })
	it.add_to_group("frequency_node")
	_gather_left[it.get_instance_id()] = int(node.get("capacity", 6))
	return it


## Groups decide visibility: layer_<id> needs the Song Spectrum layer,
## needs_unlock needs an unlock (like the Ragana's lens), nook_reveal shows
## only while the Nook Effect is active.
func update_layers() -> void:
	for layer in GameData.world["song"]["spectrum_layers"]:
		var on := SongState.can_perceive(String(layer["id"]))
		for n in get_tree().get_nodes_in_group("layer_" + String(layer["id"])):
			n.visible = on
	for n in get_tree().get_nodes_in_group("needs_unlock"):
		n.visible = PlayerState.is_unlocked(String(n.get_meta("unlock", "")))
	for n in get_tree().get_nodes_in_group("nook_reveal"):
		n.visible = _nook_revealed()


func _nook_cfg(key: String, fallback: float) -> float:
	return float(GameData.world.get("nook", {}).get(key, fallback))


func _nook_revealed() -> bool:
	return _nook != null and player != null and player.sitting and _nook_time >= _nook_cfg("sit_seconds_to_reveal", 8.0)


func sitting_in_nook() -> bool:
	return _nook != null and player.sitting


func nook_time() -> float:
	return _nook_time


# ---------------------------------------------------------------- per frame

func _process(delta: float) -> void:
	if player == null:
		return
	var busy := hud.is_busy() or _chat_typing
	player.input_locked = busy
	_update_focus()
	_update_triggers()
	_update_nook(delta)
	_update_gathering()
	_update_warmth()
	_update_companions(delta)
	_update_circles(delta)
	_update_flames()
	_save_timer += delta
	if _save_timer > 60.0:
		_save_timer = 0.0
		PlayerState.save_profile()


func _update_focus() -> void:
	var best: Interactable = null
	var best_d := INF
	for n in get_tree().get_nodes_in_group("interactable"):
		var it := n as Interactable
		if it.kind == "trigger" or not it.in_range(player.global_position):
			continue
		var d := it.distance_to_player(player.global_position)
		if d < best_d:
			best_d = d
			best = it
	focus = best
	if hud.is_busy():
		hud.show_prompt("")
	elif _gathering != null:
		hud.show_prompt(gather_status())
	elif player.sitting and _nook != null:
		hud.show_prompt("")
	elif focus != null and not focus.prompt.is_empty():
		hud.show_prompt(focus.prompt if plain_prompts else "[E] " + focus.prompt)
	else:
		hud.show_prompt("")


## Fires flicker: uneven, never the same twice.
func _update_flames() -> void:
	var t := Net.clock()
	for n in get_tree().get_nodes_in_group("flame"):
		var f := n as Node3D
		if not is_ancestor_of(f):
			continue
		var s := float(f.get_meta("seed", 0.0))
		var k := sin(t * 7.3 + s) * 0.5 + sin(t * 12.1 + s * 1.7) * 0.3 + sin(t * 3.1 + s * 0.4) * 0.2
		f.scale = Vector3(1.0 - k * 0.05, 1.0 + k * 0.12, 1.0 - k * 0.05)


func _update_triggers() -> void:
	for n in get_tree().get_nodes_in_group("interactable"):
		var it := n as Interactable
		if it.kind == "trigger" and it.check_trigger(player.global_position):
			EventBus.emit_event(String(it.data.get("event", "")))


# ---------------------------------------------------------------- the nook (SIT)

## The SIT mechanic (nook effect master spec): sit, and the heartbeat comes
## forward and the 42Hz hum is heard. Settle in and the hidden layer shows.
## After 2 minutes the camera locks to first person. After 10, You Looked:
## the camera steps outside for a moment and you see yourself sitting here.
func _update_nook(delta: float) -> void:
	if _nook == null:
		return
	if not player.sitting:
		_leave_nook()
		return
	var was := _nook_revealed()
	if player.still_time() > 0.5:
		_nook_time += delta
	if _nook_revealed() and not was:
		update_layers()
		if not _nooks_done.has(_nook.id):
			_nooks_done[_nook.id] = true
			PlayerState.mark_nook(zone_id + ":" + _nook.id)
			EventBus.emit_event("nook_complete", { "nook": _nook.id })
			hud.toast("The Inn breathes. You notice things you hadn't.")
	if _nook_time >= _nook_cfg("first_person_seconds", 120.0) and not player.first_person and not player.detached:
		player.set_first_person(true, 0.95)
	if _nook_time >= _nook_cfg("you_looked_seconds", 600.0) and not _looked_this_sit:
		_looked_this_sit = true
		Services.unlock_achievement("YOU_LOOKED")
		player.set_detached(true)
		get_tree().create_timer(_nook_cfg("detach_seconds", 6.0)).timeout.connect(func() -> void:
			if is_instance_valid(player):
				player.set_detached(false))


func _sit_in(nook: Interactable) -> void:
	_stop_gathering()
	player.sitting = true
	_nook = nook
	_nook_time = 0.0
	_looked_this_sit = false
	hud.pulse.mode = "nook"
	AudioDirector.set_hum(true)


func _leave_nook() -> void:
	_nook = null
	_nook_time = 0.0
	hud.pulse.mode = "baseline"
	AudioDirector.set_hum(false)
	if player.detached:
		player.set_detached(false)
	if player.first_person:
		player.set_first_person(false)
	update_layers()


func _update_warmth() -> void:
	if hud.pulse.mode != "baseline":
		return
	var best := INF
	for n in get_tree().get_nodes_in_group("frequency_node"):
		if (n as Node3D).is_visible_in_tree():
			best = minf(best, (n as Node3D).global_position.distance_to(player.global_position))
	hud.pulse.warmth = 0.0 if best == INF else clampf(1.0 - (best - 2.0) / 7.0, -1.0, 1.0)


# ---------------------------------------------------------------- input

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("menu"):
		if hud.any_panel_open():
			hud.close_panels()
		elif not hud.dialogue.visible:
			hud.open_panel(hud.pause)
		get_viewport().set_input_as_handled()
		return
	if hud.dialogue.visible and event.is_action_pressed("interact"):
		hud.dialogue.advance()
		get_viewport().set_input_as_handled()
		return
	if hud.is_busy() or _chat_typing:
		return
	if event.is_action_pressed("journal"):
		hud.open_panel(hud.journal)
	elif event.is_action_pressed("cave"):
		hud.open_panel(hud.cave)
	elif event.is_action_pressed("chat"):
		hud.chat.focus_input()
		get_viewport().set_input_as_handled()


func _on_sit() -> void:
	if focus != null and focus.kind == "nook":
		_sit_in(focus)
	elif player.sitting:
		player.sitting = false


func _on_interact() -> void:
	if focus == null:
		return
	handle_interaction(focus)


## What using each kind of thing does. Zones can override and call super.
func handle_interaction(it: Interactable) -> void:
	match it.kind:
		"npc":
			hud.dialogue.open(it.id)
		"nook":
			_sit_in(it)
		"cave":
			hud.open_panel(hud.cave)
		"being":
			_try_harmonize(it)
		"gather":
			start_gathering(it)
		"plot":
			hud.homestead.plot = int(it.data.get("plot", 0))
			hud.homestead.owner_name = String(it.data.get("owner", ""))
			hud.open_panel(hud.homestead)
		"workbench":
			hud.workbench.station = String(it.data.get("station", "workbench"))
			hud.open_panel(hud.workbench)
		"observe":
			if PlayerState.record_observation(zone_id, it.id):
				hud.toast("Noted in your journal: " + String(it.data.get("text", "")))
			else:
				hud.toast("Already in your notebook.")
		"portal":
			SceneRouter.goto(String(it.data["zone"]), String(it.data.get("spawn", "")))
		"booth":
			hud.market.prepare(String(it.data.get("sign", "Booth")), it.data.get("items", []), String(it.data.get("category", "")))
			hud.open_panel(hud.market)
		"signpost":
			hud.open_panel(hud.faires)


func _on_dialogue_finished(_cid: String) -> void:
	update_layers()
	on_dialogue_finished(_cid)


## Override for zone reactions to finished conversations.
func on_dialogue_finished(_cid: String) -> void:
	pass


# ---------------------------------------------------------------- harmonization

## A being can be harmonized once, and only when its quest allows it.
func being_available(being_id: String) -> bool:
	var b: Dictionary = GameData.world["beings"][being_id]
	if PlayerState.has_companion(String(b["companion"])):
		return false
	var req := String(b.get("requires_quest", ""))
	if not req.is_empty() and not QuestManager.is_done(req):
		return false
	if being_id == "unstrung_echo":
		return QuestManager.is_active("unstrung_echo")
	return true


func _try_harmonize(it: Interactable) -> void:
	if not being_available(it.id):
		hud.toast("It drifts away from you. Not yet.")
		return
	if PlayerState.learned_stone_ids().is_empty():
		hud.toast("You have no stones to answer it with.")
		return
	hud.harmonize.start(it.id, hud.pulse)
	hud.open_panel(hud.harmonize)


func _on_harmonized(being_id: String) -> void:
	for n in get_tree().get_nodes_in_group("being_" + being_id):
		var tw := create_tween()
		tw.tween_property(n, "scale", Vector3.ONE * 0.01, 1.2)
		tw.tween_callback(func() -> void: n.visible = false)


# ---------------------------------------------------------------- gathering at the heartbeat

func start_gathering(it: Interactable) -> void:
	if not it.enabled:
		return
	player.sitting = false
	_gathering = it
	_gather_from = player.global_position


var _gather_from := Vector3.ZERO


func is_gathering() -> bool:
	return _gathering != null


func gather_left(it: Interactable) -> int:
	return int(_gather_left.get(it.get_instance_id(), 0))


func gather_status() -> String:
	if _gathering == null:
		return ""
	var node: Dictionary = GameData.gather_nodes[String(_gathering.data["node"])]
	var m := String(node["gives"])
	return "%s... %d %s. Move to stop." % [String(GameData.materials[m].get("work", "gathering")).capitalize(), PlayerState.material_count(m), GameData.material_name(m)]


func _update_gathering() -> void:
	if _gathering == null:
		return
	var moved := Vector2(player.global_position.x - _gather_from.x, player.global_position.z - _gather_from.z).length()
	if not is_instance_valid(_gathering) or not _gathering.enabled or moved > 0.6:
		_stop_gathering()


func _stop_gathering() -> void:
	_gathering = null


## One beat of work: one unit, and the work-song's note for that material.
func gather_beat() -> void:
	if _gathering == null:
		return
	var it := _gathering
	var node: Dictionary = GameData.gather_nodes[String(it.data["node"])]
	var m := String(node["gives"])
	PlayerState.add_material(m, 1)
	AudioDirector.work(String(GameData.materials[m].get("work", "")))
	var left := gather_left(it) - 1
	_gather_left[it.get_instance_id()] = left
	if node.has("stone_chance") and randf() < float(node["stone_chance"]):
		var pool := GameData.stones_in_zone(gather_stone_zone())
		if not pool.is_empty():
			var sid := pool[randi() % pool.size()]
			PlayerState.learn_stone(sid)
			hud.toast("Something glints in the %s: %s" % [GameData.material_name(m).to_lower(), GameData.stones[sid]["name"]])
			AudioDirector.play_stone(sid, 1.6, false)
	if left <= 0:
		_stop_gathering()
		it.enabled = false
		it.visible = false
		get_tree().create_timer(float(node.get("respawn_s", 45))).timeout.connect(func() -> void:
			if is_instance_valid(it):
				_gather_left[it.get_instance_id()] = int(node.get("capacity", 6))
				it.enabled = true
				it.visible = true)


## The client's inn_zone name for stones found here.
func gather_stone_zone() -> String:
	return zone_id.capitalize()


func _on_beat(_index: int) -> void:
	if _gathering != null:
		gather_beat()
	on_beat(_index)


## Override for anything that keeps the heartbeat.
func on_beat(_index: int) -> void:
	pass


func _on_built(tier: int) -> void:
	var t := GameData.tier(tier)
	hud.toast("Built: " + String(t.get("name", "")))
	if tier == 1:
		Services.unlock_achievement("FIRST_ROOF")
	on_built(tier)


## Override to draw the new structure.
func on_built(_tier: int) -> void:
	pass


## Override to redraw plots when ownership changes.
func on_homesteads_changed() -> void:
	pass


# ---------------------------------------------------------------- taps and drum circles

## Space: tap whatever is at hand. A stump, a stone, a mug, the ground. No
## prompt, no UI. If someone else taps along, a circle starts.
func _on_tap() -> void:
	if not taps_enabled or hud.is_busy() or _chat_typing:
		return
	var s := nearest_surface(player.global_position)
	var surface := String(s.get_meta("surface")) if s != null else "ground"
	var tone := float(s.get_meta("tone_hz", 0.0)) if s != null else 0.0
	var pos := s.global_position if s != null else player.global_position
	play_surface(surface, tone, 1.0)
	Net.send_tap(zone_id, pos, surface if tone <= 0.0 else "sister:%d" % int(s.get_meta("sister", 0)))
	var r := circle.tap("me", pos, surface, Net.clock())
	_after_tap(r, "me", s)
	on_tap("me", pos, surface, s)


func nearest_surface(at: Vector3, reach := 1.9) -> Node3D:
	var best: Node3D = null
	var best_d := reach
	for n in get_tree().get_nodes_in_group("tap_surface"):
		var node := n as Node3D
		if not is_ancestor_of(node):
			continue
		var a := node.global_position
		var d := Vector2(a.x - at.x, a.z - at.z).length()
		if d < best_d:
			best_d = d
			best = node
	return best


func play_surface(surface: String, tone_hz: float, gain: float) -> void:
	if tone_hz > 0.0:
		AudioDirector.play_shaped(tone_hz, 1.2, "dynamic", 0.06 * gain)
		AudioDirector.tap("tap_stone", tone_hz, 0.18 * gain)
		return
	var spec: Dictionary = GameData.world.get("drum_circle", {}).get("surfaces", {}).get(surface, {})
	AudioDirector.tap(String(spec.get("instrument", "tap_earth")), float(spec.get("hz", 90.0)), 0.5 * gain)


func _on_remote_tap(peer: int, pos: Vector3, surface: String) -> void:
	var tone := 0.0
	var real_surface := surface
	if surface.begins_with("sister:"):
		var tones: Array = GameData.world.get("drum_circle", {}).get("seven_sisters", {}).get("tones_hz", [])
		var i := int(surface.substr(7))
		tone = float(tones[i]) if i >= 0 and i < tones.size() else 0.0
		real_surface = "stone"
	var d := pos.distance_to(player.global_position)
	if d < 30.0:
		play_surface(real_surface, tone, clampf(1.0 - d / 30.0, 0.15, 1.0))
	var who := "p%d" % peer
	var node: Node3D = null
	if surface.begins_with("sister:"):
		for n in get_tree().get_nodes_in_group("tap_surface"):
			if is_ancestor_of(n) and n.has_meta("sister") and int(n.get_meta("sister")) == int(surface.substr(7)):
				node = n
	var r := circle.tap(who, pos, real_surface, Net.clock())
	_after_tap(r, who, node)
	on_tap(who, pos, real_surface, node)


func _after_tap(r: Dictionary, _who: String, _surface: Node3D) -> void:
	if bool(r["ignited_now"]):
		EventBus.emit_event("circle:ignited")
	for pair in r["recognized"]:
		if "me" in pair:
			_sparkle(player.global_position + Vector3(0, 1.6, 0))
			PlayerState.add_chronicle("At the circle, someone played your rhythm back to you." if pair[0] == "me" else "At the circle, you played someone's rhythm back to them.", "circle")


## Override for zone reactions to taps (Pluck, the Seven Sisters).
func on_tap(_who: String, _pos: Vector3, _surface: String, _node: Node3D) -> void:
	pass


## The tempo ring: a soft pulse on the ground at each lit circle, at the
## circle's own groove. Nearby lanterns ease down a step to make room.
func _update_circles(_delta: float) -> void:
	var t := Net.clock()
	circle.tick(t)
	var lit_centers: Array[Vector3] = []
	var keep := {}
	for c in circle.circles:
		if not bool(c["ignited"]):
			continue
		var key := str(c["started"]) + str(c["center"])
		keep[key] = true
		lit_centers.append(c["center"])
		if not _rings.has(key):
			var ring := Builder.cylinder(self, 2.6, 0.03, (c["center"] as Vector3) + Vector3(0, 0.03, 0), Color(1.0, 0.72, 0.35, 0.35), false, "TempoRing", 2.6)
			(ring as MeshInstance3D).material_override = Builder.mat(Color(1.0, 0.72, 0.35, 0.35), 1.5)
			_rings[key] = ring
		var bpm := circle.reflected_bpm(c, t)
		var ph := fposmod(t - float(c["ignited_at"]), 60.0 / maxf(bpm, 20.0)) / (60.0 / maxf(bpm, 20.0)) if bpm > 0.0 else 0.5
		var ring_node: Node3D = _rings[key]
		ring_node.scale = Vector3.ONE * (1.0 + 0.12 * exp(-ph * 6.0))
	for key in _rings.keys():
		if not keep.has(key):
			_rings[key].queue_free()
			_rings.erase(key)
	for n in get_tree().get_nodes_in_group("circle_dim"):
		var light := n as OmniLight3D
		if not light.has_meta("base_energy"):
			light.set_meta("base_energy", light.light_energy)
		var near := false
		for cpos in lit_centers:
			if cpos.distance_to(light.global_position) < 12.0:
				near = true
		light.light_energy = lerpf(light.light_energy, float(light.get_meta("base_energy")) * (0.78 if near else 1.0), 0.05)


func circle_lit_near(pos: Vector3) -> bool:
	for c in circle.circles:
		if bool(c["ignited"]) and (c["center"] as Vector3).distance_to(pos) < float(circle.cfg.get("circle_radius", 7.0)):
			return true
	return false


func _sparkle(at: Vector3) -> void:
	for i in 8:
		var s := Builder.sphere(self, 0.04, at, Color(1.0, 0.9, 0.6), 5.0)
		var dir := Vector3(randf_range(-1, 1), randf_range(0.2, 1.0), randf_range(-1, 1)).normalized() * 0.6
		var tw := create_tween()
		tw.tween_property(s, "position", at + dir, 0.9)
		tw.parallel().tween_property(s, "scale", Vector3.ONE * 0.1, 0.9)
		tw.tween_callback(s.queue_free)


# ---------------------------------------------------------------- companions

func _companion_color(name_id: String) -> Color:
	for b in GameData.world["beings"].values():
		if String(b["companion"]) == name_id:
			return Builder.color(String(b.get("color", "#ffffff")))
	var shapes: Dictionary = GameData.world.get("seed_companions", {}).get("shapes", {})
	for s in shapes.values():
		if String(s["companion"]) == name_id:
			return Builder.color(String(s.get("color", "#ffffff")))
	return Color(1, 1, 1)


func _refresh_companions() -> void:
	for c in _companions:
		c.queue_free()
	_companions.clear()
	var i := 0
	for name_id in PlayerState.profile["companions"]:
		var orb := Builder.sphere(self, 0.13, player.global_position + Vector3(0.8, 1.6, 0), _companion_color(String(name_id)), 1.2, "Companion_" + String(name_id))
		orb.set_meta("slot", i)
		_companions.append(orb)
		i += 1


## The Wolf's Whistle: the wolf comes running in any outdoor zone.
func whistle() -> void:
	if not PlayerState.is_unlocked("wolfs_whistle"):
		return
	AudioDirector.play_freq(1760.0, 0.5, "sine", 0.08)
	if not outdoor:
		hud.toast("The whistle sounds thin indoors. The wolf won't hear it in here.")
		return
	if _wolf != null:
		return
	_wolf = Node3D.new()
	_wolf.name = "WhistledWolf"
	add_child(_wolf)
	_wolf.global_position = player.global_position + Vector3(6, 0, 6)
	Builder.box(_wolf, Vector3(0.45, 0.45, 0.9), Vector3(0, 0.35, 0), Color(0.5, 0.5, 0.52), false)
	Builder.sphere(_wolf, 0.22, Vector3(0, 0.65, -0.55), Color(0.55, 0.55, 0.57))
	hud.toast("The wolf comes running.")


func has_wolf() -> bool:
	return _wolf != null


func _update_companions(delta: float) -> void:
	var t := Net.clock()
	for orb in _companions:
		var slot := int(orb.get_meta("slot"))
		var angle := t * 0.8 + slot * 2.1
		var target := player.global_position + Vector3(cos(angle) * 0.9, 1.7 + sin(t * 2.0 + slot) * 0.12, sin(angle) * 0.9)
		orb.global_position = orb.global_position.lerp(target, clampf(delta * 4.0, 0.0, 1.0))
	if _wolf != null:
		var to := player.global_position + Vector3(1.2, 0, 1.2)
		if _wolf.global_position.distance_to(to) > 0.8:
			var next := _wolf.global_position.lerp(to, clampf(delta * 2.5, 0.0, 1.0))
			if next.distance_to(_wolf.global_position) > 0.001:
				_wolf.look_at(Vector3(to.x, _wolf.global_position.y, to.z), Vector3.UP)
			_wolf.global_position = next


# ---------------------------------------------------------------- other players

func _on_snapshot(_list: Array) -> void:
	if single_player:
		return
	for id in Net.remote_players.keys():
		var entry: Dictionary = Net.remote_players[id]
		if not remote_nodes.has(id):
			var rp := RemotePlayer.new()
			add_child(rp)
			rp.setup(int(id), String(entry.get("name", "?")))
			rp.position = entry.get("pos", Vector3.ZERO)
			remote_nodes[id] = rp
		(remote_nodes[id] as RemotePlayer).apply(entry)
	for id in remote_nodes.keys():
		if not Net.remote_players.has(id):
			remote_nodes[id].queue_free()
			remote_nodes.erase(id)
	var sig := ""
	for id in Net.remote_players.keys():
		sig += "%d:%s;" % [int(id), String(Net.remote_players[id].get("name", ""))]
	if sig.hash() != _people_count:
		_people_count = sig.hash()
		hud.chat.set_people(Net.remote_players)


## A frog stays a frog until they leave (the Common Room spec).
func _on_frog_changed(peer: int, is_frog: bool) -> void:
	if peer != Net.local_id():
		return
	player.set_frog(is_frog)
	if is_frog:
		hud.toast("The swamp reclaims its own. Ribbit, until you leave.")
