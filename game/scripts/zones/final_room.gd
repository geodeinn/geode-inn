extends ZoneBase
## The Final Room, the room behind the Inn (Krista and Elio, Aug 30 2026; mechanics
## spec Sep 2 2026). Not a zone, not a quest, not a reward. A short warm corridor
## down to a small room: a fire burning at 50 BPM, one chair, a table with a
## face-down book and a steaming cup, a small leaded window with night stars.
##
## Built to the spec: the only prompts are "Sit." / "Stand." and, after looking at
## the cup for 10 seconds, "Drink". No music. The heartbeat is felt (haptic), never
## heard. After 60 seconds seated a second heartbeat joins and falls into step over
## about 3.5 minutes. The book keeps a different page every few visits, unseen.
## Single-player. The room records visits and changes nothing else.

const STONE_WARM := Color(0.69, 0.48, 0.29)      # the color of bread crust
const RUG_RED := Color(0.48, 0.09, 0.08)
const RUG_GOLD := Color(0.72, 0.55, 0.22)
const ROOM_Y := -2.5
const ROOM_Z := -25.6

var _cfg: Dictionary
var _fire_light: OmniLight3D
var _fire_core: MeshInstance3D
var _steam: CPUParticles3D
var _steam_mat: StandardMaterial3D
var _chair: Interactable
var _cup: Interactable
var _cup_node: Node3D
var _noise := FastNoiseLite.new()
var _time := 0.0
var _seated_time := 0.0
var _cup_look := 0.0
var _crackle_wait := 0.4
var _crackle_n := 0
var _primary_beats := 0


func build_world() -> void:
	zone_id = "final_room"
	single_player = true
	plain_prompts = true
	taps_enabled = false
	_cfg = FinalRoomRules.cfg()
	spawns = { "default": [Vector3(0, 0.2, -0.6), 0.0], "corridor_top": [Vector3(0, 0.2, -0.6), 0.0] }
	var env := Builder.environment(self, false)
	env.environment.fog_enabled = false
	env.environment.ambient_light_color = Color(0.55, 0.33, 0.18)   # the stone's slow warmth
	env.environment.ambient_light_energy = 0.12
	env.environment.background_color = Color(0.02, 0.015, 0.01)
	_noise.seed = randi()
	Builder.skin(STONE_WARM, "cobble")
	Builder.skin(Color(0.33, 0.21, 0.12), "floor")
	Builder.skin(Color(0.42, 0.28, 0.16), "floor")
	Builder.skin(Color(0.38, 0.24, 0.13), "planks")
	_noise.frequency = 1.7
	_corridor()
	_room()
	_fireplace()
	_furniture()
	_window()


func _corridor() -> void:
	var length := 22.0
	var drop := -ROOM_Y
	var slope := atan2(drop, length)
	var ramp := Builder.box(self, Vector3(1.8, 0.2, sqrt(length * length + drop * drop)), Vector3(0, -drop / 2.0 - 0.1, -length / 2.0), STONE_WARM.darkened(0.25), true, "Corridor")
	ramp.rotation.x = -slope
	for side in [-1.0, 1.0]:
		var wall := Builder.box(self, Vector3(0.3, 3.0, length + 1.0), Vector3(side * 1.05, 1.2 - drop / 2.0, -length / 2.0), STONE_WARM.darkened(0.15), true)
		wall.rotation.x = -slope
	var roof := Builder.box(self, Vector3(1.8, 0.2, length + 1.0), Vector3(0, 2.5 - drop / 2.0, -length / 2.0), STONE_WARM.darkened(0.35), false)
	roof.rotation.x = -slope
	Builder.box(self, Vector3(1.8, 2.6, 0.2), Vector3(0, 1.2, 1.4), Color(0.25, 0.17, 0.1), true, "DoorTop")
	# The way back up. No prompt to leave: walk out and the door closes behind you.
	Interactable.make(self, "trigger", "leave", Vector3(0, 0, 0.6), "", 0.7, { "event": "final_room:leave" })


func _room() -> void:
	var y := ROOM_Y
	var z := ROOM_Z
	# Old wood floor: planks of different widths and grains, whatever was available.
	var widths := [0.38, 0.52, 0.31, 0.6, 0.44, 0.35, 0.57, 0.41, 0.36]
	var x := -2.1
	for i in widths.size():
		var w: float = widths[i]
		var tone := Color(0.33, 0.21, 0.12).lerp(Color(0.42, 0.28, 0.16), fmod(i * 0.37, 1.0))
		Builder.box(self, Vector3(w - 0.01, 0.12, 4.2), Vector3(x + w / 2.0, y - 0.06 + (i % 3) * 0.006, z), tone, true)
		x += w
	# The rug: deep red and gold, worn soft in the middle where feet have been.
	Builder.box(self, Vector3(2.4, 0.02, 1.9), Vector3(0.1, y + 0.01, z + 0.3), RUG_GOLD, false)
	Builder.box(self, Vector3(2.2, 0.025, 1.7), Vector3(0.1, y + 0.015, z + 0.3), RUG_RED, false)
	Builder.box(self, Vector3(0.9, 0.03, 0.7), Vector3(0.2, y + 0.02, z + 0.35), RUG_RED.lightened(0.12), false)
	# Rough stone, low enough to touch.
	Builder.box(self, Vector3(4.4, 2.5, 0.3), Vector3(0, y + 1.25, z - 2.2), STONE_WARM, true)
	Builder.box(self, Vector3(0.3, 2.5, 4.4), Vector3(-2.2, y + 1.25, z), STONE_WARM, true)
	Builder.box(self, Vector3(0.3, 2.5, 4.4), Vector3(2.2, y + 1.25, z), STONE_WARM, true)
	Builder.box(self, Vector3(1.6, 2.5, 0.3), Vector3(-1.4, y + 1.25, z + 2.2), STONE_WARM, true)
	Builder.box(self, Vector3(1.6, 2.5, 0.3), Vector3(1.4, y + 1.25, z + 2.2), STONE_WARM, true)
	Builder.box(self, Vector3(4.4, 0.25, 4.4), Vector3(0, y + 2.45, z), STONE_WARM.darkened(0.3), false)
	for i in 10:
		Builder.box(self, Vector3(0.35 + (i % 3) * 0.1, 0.22, 0.05), Vector3(-1.8 + i * 0.4, y + 0.4 + (i % 4) * 0.5, z - 2.04), STONE_WARM.darkened(0.08 + (i % 3) * 0.04), false)


func _fireplace() -> void:
	var y := ROOM_Y
	var z := ROOM_Z - 1.85
	Builder.box(self, Vector3(1.5, 1.6, 0.5), Vector3(0, y + 0.8, z), STONE_WARM.darkened(0.2), true, "Fireplace")
	Builder.box(self, Vector3(0.95, 0.85, 0.3), Vector3(0, y + 0.43, z + 0.12), Color(0.05, 0.03, 0.02), false)
	Builder.box(self, Vector3(1.7, 0.1, 0.6), Vector3(0, y + 1.62, z + 0.05), STONE_WARM.darkened(0.3), false)
	for i in 3:
		var log := Builder.cylinder(self, 0.06, 0.7, Vector3(-0.15 + i * 0.15, y + 0.1, z + 0.18), Color(0.25, 0.15, 0.08), false)
		log.rotation.z = PI / 2.0
		log.rotation.y = 0.3 * (i - 1)
	_fire_core = Builder.sphere(self, 0.13, Vector3(0, y + 0.16, z + 0.2), Color(0.9, 0.3, 0.07), 1.3, "Fire")
	_fire_core.scale = Vector3(1.4, 0.45, 1.0)   # embers; the flames rise off them
	Builder.flames(self, Vector3(0, y + 0.2, z + 0.2), 0.22)
	# The only light.
	_fire_light = Builder.omni(self, Vector3(0, y + 0.55, z + 0.55), Color(1.0, 0.58, 0.26), 0.9, 5.0)


func _furniture() -> void:
	var y := ROOM_Y
	var z := ROOM_Z
	var chair_pos := Vector3(0.25, y, z + 0.45)
	var chair := Node3D.new()
	chair.position = chair_pos
	add_child(chair)
	var wood := Color(0.38, 0.24, 0.13)
	Builder.box(chair, Vector3(0.6, 0.07, 0.55), Vector3(0, 0.45, 0), wood, true)
	Builder.box(chair, Vector3(0.6, 0.75, 0.07), Vector3(0, 0.85, 0.26), wood, false)
	for corner in [Vector3(-0.27, 0.22, -0.24), Vector3(0.27, 0.22, -0.24), Vector3(-0.27, 0.22, 0.24), Vector3(0.27, 0.22, 0.24)]:
		Builder.box(chair, Vector3(0.06, 0.45, 0.06), corner, wood.darkened(0.1), false)
	# The arms, darkened where the fingers fall.
	for side in [-0.31, 0.31]:
		Builder.box(chair, Vector3(0.07, 0.06, 0.5), Vector3(side, 0.68, 0.02), wood.darkened(0.25), false)
		Builder.box(chair, Vector3(0.075, 0.065, 0.12), Vector3(side, 0.685, -0.17), wood.darkened(0.45), false)
	_chair = Interactable.make(self, "chair", "chair", chair_pos, "Sit.", 1.1)
	# A table the size of a book, a book face down with a page kept, and a cup.
	var table_pos := Vector3(1.05, y, z + 0.35)
	Builder.box(self, Vector3(0.42, 0.04, 0.34), table_pos + Vector3(0, 0.55, 0), wood.lightened(0.05), true)
	Builder.box(self, Vector3(0.05, 0.55, 0.05), table_pos + Vector3(0, 0.275, 0), wood, false)
	var book := Builder.box(self, Vector3(0.2, 0.035, 0.14), table_pos + Vector3(-0.07, 0.59, 0.02), Color(0.32, 0.12, 0.1), false, "Book")
	var page := FinalRoomRules.book_page(PlayerState.profile)
	book.rotation.y = 0.25 + page * 0.07
	_cup_node = Node3D.new()
	_cup_node.position = table_pos + Vector3(0.12, 0.57, -0.04)
	add_child(_cup_node)
	Builder.cylinder(_cup_node, 0.04, 0.09, Vector3(0, 0.045, 0), Color(0.8, 0.72, 0.6), false, "", 0.045)
	Builder.cylinder(_cup_node, 0.037, 0.005, Vector3(0, 0.086, 0), Color(0.36, 0.2, 0.1), false)
	_steam = CPUParticles3D.new()
	_steam.position = Vector3(0, 0.1, 0)
	_steam.amount = 14
	_steam.lifetime = 2.4
	_steam.direction = Vector3.UP
	_steam.spread = 12.0
	_steam.gravity = Vector3(0, 0.05, 0)
	_steam.initial_velocity_min = 0.05
	_steam.initial_velocity_max = 0.1
	_steam.scale_amount_min = 0.02
	_steam.scale_amount_max = 0.05
	var puff := SphereMesh.new()
	puff.radius = 0.5
	puff.height = 1.0
	_steam.mesh = puff
	var steam_mat := StandardMaterial3D.new()
	_steam_mat = steam_mat
	steam_mat.albedo_color = Color(1, 1, 1, 0.12)
	steam_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	steam_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	_steam.material_override = steam_mat
	_cup_node.add_child(_steam)
	_cup = Interactable.make(self, "cup", "cup", chair_pos, "Drink", 1.1)
	_cup.enabled = false


func _window() -> void:
	var y := ROOM_Y
	var z := ROOM_Z - 0.4
	var x := -2.04
	# Night and stars outside, through small diamond panes.
	Builder.box(self, Vector3(0.05, 0.62, 0.62), Vector3(x - 0.08, y + 1.45, z), Color(0.03, 0.05, 0.12), false)
	for i in 14:
		var s := Builder.sphere(self, 0.008 + (i % 3) * 0.004, Vector3(x - 0.06, y + 1.2 + fmod(i * 0.371, 0.5), z - 0.25 + fmod(i * 0.613, 0.5)), Color(0.9, 0.92, 1.0), 4.0)
		s.name = "Star%d" % i
	for k in range(-3, 4):
		var bar := Builder.box(self, Vector3(0.02, 0.9, 0.012), Vector3(x, y + 1.45, z + k * 0.09), Color(0.12, 0.12, 0.13), false)
		bar.rotation.x = PI / 4.0
		var bar2 := Builder.box(self, Vector3(0.02, 0.9, 0.012), Vector3(x, y + 1.45, z + k * 0.09), Color(0.12, 0.12, 0.13), false)
		bar2.rotation.x = -PI / 4.0
	Builder.box(self, Vector3(0.12, 0.7, 0.06), Vector3(x + 0.02, y + 1.45, z - 0.34), STONE_WARM.darkened(0.3), false)
	Builder.box(self, Vector3(0.12, 0.7, 0.06), Vector3(x + 0.02, y + 1.45, z + 0.34), STONE_WARM.darkened(0.3), false)


func on_zone_ready() -> void:
	hud.set_quiet(true)
	hud.pulse.speaker_muted = true
	player.speed_multiplier = 0.5   # the corridor takes about 10 seconds, unhurried
	var r := FinalRoomRules.record(PlayerState.profile)
	r["entered"] = true
	r["revisits"] = int(r["revisits"]) + 1
	r["drank_this_visit"] = false
	EventBus.game_event.connect(_on_event)
	# The core definition spec has the Inn-Voice speak here; the Final Room spec
	# allows no words but Sit, Stand and Drink. Off until the client rules.
	if bool(GameData.world.get("voice_of_the_inn", {}).get("final_room_line_enabled", false)):
		get_tree().create_timer(2.0).timeout.connect(func() -> void: hud.voice.speak(VoiceOfTheInn.line("final_room")))


func _on_event(id: String, _data: Dictionary) -> void:
	if id == "final_room:leave":
		SceneRouter.goto("main_floor", "small_door")


func handle_interaction(it: Interactable) -> void:
	match it.kind:
		"chair":
			if player.sitting:
				_stand()
			else:
				_sit()
		"cup":
			# Nothing happens. The cup is warm. That's it.
			FinalRoomRules.record(PlayerState.profile)["drank_this_visit"] = true
			_cup.enabled = false
		_:
			super.handle_interaction(it)


func _on_sit() -> void:
	if focus == _chair or player.sitting:
		handle_interaction(_chair)


func _sit() -> void:
	player.global_position = _chair.global_position + Vector3(0, 0.1, 0)
	player.sitting = true
	player.set_first_person(true)
	player.set_view(0.0, -0.08)
	_seated_time = 0.0
	_chair.prompt = "Stand."
	FinalRoomRules.record(PlayerState.profile)["sat_down"] = true


func _stand() -> void:
	player.sitting = false
	player.set_first_person(false)
	_chair.prompt = "Sit."
	_seated_time = 0.0
	_cup.enabled = false
	_cup_look = 0.0
	hud.pulse.second_offset = -1.0


func _process(delta: float) -> void:
	super._process(delta)
	_time += delta
	# The fire is a fire: procedural, uneven, never the same twice.
	var n := _noise.get_noise_1d(_time * 3.0)
	var m := _noise.get_noise_1d(_time * 7.3 + 100.0)
	_fire_light.light_energy = 0.85 + n * 0.25 + m * 0.08
	_fire_core.scale = Vector3(1.4, 0.45, 1.0) * (1.0 + n * 0.18)   # the embers breathe
	_fire_core.position.x = m * 0.03
	_crackle_wait -= delta
	if _crackle_wait <= 0.0:
		_crackle_n += 1
		AudioDirector.crackle(_crackle_n * 7 + int(absf(n) * 13.0))
		_crackle_wait = 0.25 + absf(_noise.get_noise_1d(_time * 0.7 + 50.0)) * 2.4
	# The steam rises at 50 BPM, the same rhythm as the fire, a room where someone lives.
	var ph := judge.phase(Net.clock())
	_steam_mat.albedo_color.a = 0.07 + 0.09 * exp(-pow((ph - 0.19) / 0.15, 2.0))
	if player.first_person and not player.sitting:
		_stand()
	if player.sitting:
		_tick_seated(delta)


func _tick_seated(delta: float) -> void:
	var r := FinalRoomRules.record(PlayerState.profile)
	_seated_time += delta
	r["duration"] = float(r["duration"]) + delta
	var presence_s := float(_cfg.get("presence_seconds", 60))
	if _seated_time >= presence_s and not bool(r["presence_acknowledged"]):
		r["presence_acknowledged"] = true
	if bool(r["presence_acknowledged"]) and float(r["duration"]) >= float(_cfg.get("achievement_seconds", 120)):
		Services.unlock_achievement("INN_HOME")   # silent, Steam backend only
	# Two heartbeats in a room with one person, narrowing until they land together.
	if _seated_time >= presence_s:
		var sync_s := float(_cfg.get("sync_seconds", 210))
		var k := clampf((_seated_time - presence_s) / sync_s, 0.0, 1.0)
		hud.pulse.second_offset = lerpf(0.35, 0.0, k)
	# Looking at the cup for 10 seconds brings the only other prompt: "Drink".
	if not bool(r["drank_this_visit"]):
		var cam := player.camera
		var to_cup := (_cup_node.global_position - cam.global_position).normalized()
		var facing := -cam.global_transform.basis.z
		if facing.dot(to_cup) > cos(deg_to_rad(12.0)):
			_cup_look += delta
		else:
			_cup_look = 0.0
		_cup.enabled = _cup_look >= float(_cfg.get("cup_look_seconds", 10))


## The heartbeat, felt through the chair. After the presence, a fainter second
## pulse follows, slightly offset, and the offset shrinks to nothing.
func on_beat(_index: int) -> void:
	if not player.sitting or not Settings.effective_pulse_haptic():
		return
	_primary_beats += 1
	var offset := hud.pulse.second_offset
	for pad in Input.get_connected_joypads():
		Input.start_joy_vibration(pad, 0.3, 0.12, 0.1)
	if offset > 0.001:
		get_tree().create_timer(offset * judge.interval_s()).timeout.connect(func() -> void:
			for pad in Input.get_connected_joypads():
				Input.start_joy_vibration(pad, 0.14, 0.0, 0.08))
