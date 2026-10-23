extends Node
## Multiplayer. One authoritative game server (dedicated, or a player hosting)
## owns the shared world: the Song total, the Common Room's chat and frogs,
## faire configs and who owns which homestead plot. Clients send their position
## a few times a second and receive a snapshot of the players in their zone.
## Drum circle taps are relayed to everyone in the zone; each game hears the
## circle for itself.
##
## Modes:
##   OFFLINE    solo play, no network, the world is the player's own
##   HOST       a player's game is also the server (friends join it)
##   CLIENT     joined someone else's server
##   DEDICATED  headless server: run the game with  -- --server [--port N]
##
## The chat keeps nothing. No line is logged or saved, on the server or anywhere.

signal connected
signal connection_failed
signal disconnected
signal snapshot_received(players: Array)
signal faire_list_received(faires: Array)
signal faire_save_result(ok: bool, message: String)
signal vote_result(message: String)
signal welcomed(display_name: String, speak_wait: float, frog_wait: float)
signal chat_refused(message: String)
signal claimed_by_swamp
signal tap_heard(peer: int, pos: Vector3, surface: String)
signal homesteads_received(list: Array)
signal plot_result(ok: bool, plot: int, message: String)

enum Mode { OFFLINE, HOST, CLIENT, DEDICATED }

const SERVER_DATA_DIR := "user://server_data/"
const COMMON_ROOM := "main_floor"

## Where the server keeps the world. The multiplayer test uses its own, fresh each run.
var data_dir := SERVER_DATA_DIR

var mode: Mode = Mode.OFFLINE
var local_zone := ""
var local_name := ""
var remote_players: Dictionary = {}   # peer -> { name, zone, pos, rot_y, frog, points }

# Server state
var players: Dictionary = {}          # peer -> { name, zone, pos, rot_y, zone_since, points }
var moderation: Moderation
var faires: FaireRegistry
var homesteads: Dictionary = {}       # plot -> { key, owner, tier, name }
var _snapshot_timer := 0.0
var _save_timer := 0.0
var _fire_timer := 240.0
var _clock_origin_ms := 0


func _ready() -> void:
	_clock_origin_ms = Time.get_ticks_msec()
	moderation = Moderation.new()
	faires = FaireRegistry.new()
	multiplayer.peer_connected.connect(_on_peer_connected)
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)
	multiplayer.connected_to_server.connect(func() -> void: connected.emit())
	multiplayer.connection_failed.connect(func() -> void:
		mode = Mode.OFFLINE
		connection_failed.emit())
	multiplayer.server_disconnected.connect(func() -> void:
		mode = Mode.OFFLINE
		remote_players.clear()
		disconnected.emit())
	var args := OS.get_cmdline_user_args()
	# Test-only: one frog is enough and nobody has to warm by the fire first.
	_test_moderation = "--moderation-test" in args
	if "--server" in args:
		var port := _arg_int(args, "--port", default_port())
		start_dedicated.call_deferred(port)


# ---------------------------------------------------------------- mode control

func default_port() -> int:
	return int(Services.platform.get("server", {}).get("default_port", 24770))


func is_online() -> bool:
	return mode != Mode.OFFLINE


func is_server() -> bool:
	return mode == Mode.HOST or mode == Mode.DEDICATED


func local_id() -> int:
	return multiplayer.get_unique_id() if is_online() else 1


func host(port := 0) -> Error:
	var peer := ENetMultiplayerPeer.new()
	var err := peer.create_server(port if port > 0 else default_port(), _max_players())
	if err != OK:
		return err
	multiplayer.multiplayer_peer = peer
	mode = Mode.HOST
	_server_boot()
	players[1] = _new_player_record()
	return OK


func start_dedicated(port := 0) -> Error:
	var peer := ENetMultiplayerPeer.new()
	var err := peer.create_server(port if port > 0 else default_port(), _max_players())
	if err != OK:
		push_error("Server could not listen on port %d (%s)" % [port, error_string(err)])
		return err
	multiplayer.multiplayer_peer = peer
	mode = Mode.DEDICATED
	_server_boot()
	print("[server] The Geode Inn server listening on port %d" % (port if port > 0 else default_port()))
	return OK


func join(address: String, port := 0) -> Error:
	var peer := ENetMultiplayerPeer.new()
	var err := peer.create_client(address, port if port > 0 else default_port())
	if err != OK:
		return err
	multiplayer.multiplayer_peer = peer
	mode = Mode.CLIENT
	return OK


func leave() -> void:
	if mode == Mode.HOST or mode == Mode.DEDICATED:
		save_server_data()
	multiplayer.multiplayer_peer = OfflineMultiplayerPeer.new()
	mode = Mode.OFFLINE
	remote_players.clear()
	players.clear()


func _max_players() -> int:
	return int(Services.platform.get("server", {}).get("max_players", 64))


## Seconds since this game started. Each game keeps its own heartbeat.
func clock() -> float:
	return float(Time.get_ticks_msec() - _clock_origin_ms) / 1000.0


# ---------------------------------------------------------------- per-frame

func _process(delta: float) -> void:
	if not is_server():
		return
	_snapshot_timer += delta
	var hz := float(Services.platform.get("server", {}).get("snapshot_hz", 10))
	if _snapshot_timer >= 1.0 / hz:
		_snapshot_timer = 0.0
		_broadcast_snapshots()
	_save_timer += delta
	if _save_timer >= 30.0:
		_save_timer = 0.0
		import_rentals()
		save_server_data()
	# The fire speaks now and then, unbidden, to whoever is by it.
	_fire_timer -= delta
	if _fire_timer <= 0.0:
		var span: Array = moderation.cfg.get("fire_ambient_every_s", [180, 300])
		_fire_timer = randf_range(float(span[0]), float(span[1]))
		var zone := String(moderation.cfg.get("fire_zone", COMMON_ROOM))
		if not _peers_in_zone(zone).is_empty():
			_fire_says(zone, moderation.random_fire_line())


# ---------------------------------------------------------------- client API

## account_key is only needed for reserved names (like Elio). look is the
## player's look line (CharacterModel.encode_look), so others see who they chose to be.
func register_self(display_name: String, zone: String, account_key := "", look := "") -> void:
	local_zone = zone
	_to_server("rpc_register", [display_name, zone, account_key, look])


## The player changed their look in the creator.
func send_look(look: String) -> void:
	if is_online():
		_to_server("rpc_look", [look])


func send_state(zone: String, pos: Vector3, rot_y: float) -> void:
	local_zone = zone
	if is_online():
		_to_server("rpc_state", [zone, pos, rot_y, SongState.personal_points()])


func submit_song_points(points: float, reason: String) -> void:
	_to_server("rpc_song_points", [points, reason])


func send_chat(text: String) -> void:
	if is_online():
		_to_server("rpc_chat", [text])
	else:
		# Alone by the fire: your own words come back, and nothing is kept.
		var clean := text.strip_edges().replace("\n", " ").substr(0, int(moderation.cfg.get("chat_max_len", 500)))
		if not clean.is_empty():
			EventBus.chat_received.emit({ "from": 1, "name": _local_name(), "text": clean, "frog": false, "ink": "sepia" })


func frog(target_peer: int) -> void:
	_to_server("rpc_frog", [target_peer])


func send_tap(zone: String, pos: Vector3, surface: String) -> void:
	if is_online():
		_to_server("rpc_tap", [zone, pos, surface])


func claim_plot(plot: int) -> void:
	var h := PlayerState.homestead()
	_to_server("rpc_claim_plot", [plot, String(h["key"]), _local_name()])


func update_homestead() -> void:
	var h := PlayerState.homestead()
	if int(h["plot"]) >= 0:
		_to_server("rpc_homestead_update", [int(h["plot"]), String(h["key"]), int(h["tier"]), String(h["name"])])


func request_faires() -> void:
	if is_online():
		_to_server("rpc_request_faires", [])
	else:
		if faires.faires.is_empty():
			faires.load_samples()
		faire_list_received.emit.call_deferred(faires.active_faires())


func save_faire(rental_key: String, config: Dictionary) -> void:
	if is_online():
		_to_server("rpc_save_faire", [rental_key, config])
	else:
		var msg := faires.save_with_key(rental_key, config)
		faire_save_result.emit(msg.is_empty(), msg if not msg.is_empty() else "Saved.")


func _local_name() -> String:
	if not local_name.is_empty() and is_online():
		return local_name
	var n := String(PlayerState.profile.get("name", ""))
	return n if not n.is_empty() else "Traveler"


func _to_server(method: String, args: Array) -> void:
	if not is_online():
		return
	if is_server():
		_local_sender = 1
		callv(method, args)
		_local_sender = 0
	else:
		var call_args := [1, method]
		call_args.append_array(args)
		callv("rpc_id", call_args)


var _local_sender := 0


func _sender() -> int:
	if _local_sender != 0:
		return _local_sender
	var s := multiplayer.get_remote_sender_id()
	return s if s != 0 else 1


# ---------------------------------------------------------------- server side

var _test_moderation := false


func _server_boot() -> void:
	players.clear()
	homesteads.clear()
	moderation = Moderation.new()
	if _test_moderation:
		var cfg: Dictionary = moderation.cfg.duplicate()
		cfg["frog_votes_needed"] = 1
		cfg["frog_cooldown_s"] = 0
		cfg["speak_threshold_s"] = 0
		moderation.cfg = cfg
		data_dir = "user://server_data_test/"
		DirAccess.remove_absolute(ProjectSettings.globalize_path(data_dir + "world.json"))
	faires = FaireRegistry.new()
	load_server_data()
	load_reserved_keys()
	load_inn_core()
	import_rentals()
	if _test_moderation:
		faires.register_rental("TEST-KEY", "test_faire", "2099-12-31", "Test Guild")


var reserved_keys: Dictionary = {}   # reserved name -> key (server only)
var inn_core := InnCore.new()        # Elio's nature files (server only, never sent to clients)


## Loads Elio's nature files from server_data/inncore/ if the operator put them there.
func load_inn_core() -> void:
	var dir := ProjectSettings.globalize_path(data_dir + "inncore")
	if inn_core.load_from(dir):
		print("[server] InnCore loaded: Elio's five nature files are in place")
	elif inn_core.missing.size() < InnCore.ORDER.size():
		print("[server] InnCore incomplete, missing: %s" % ", ".join(inn_core.missing))


## The name a player may use. Reserved names (data/world.json) need their key;
## anyone else asking for one, in any letter case, gets a blank name back and
## the Common Room gives them a stone name, like a traveler who left it blank.
static func allowed_name(requested: String, key: String, keys: Dictionary) -> String:
	var clean := requested.strip_edges().substr(0, 30)
	for reserved in keys.keys():
		if clean.to_lower() == String(reserved).to_lower():
			return String(reserved) if not key.is_empty() and key == String(keys[reserved]) else ""
	return clean


## Makes sure every reserved name has a key in server_data/reserved_keys.json.
## New keys are random; the server prints where to find them, never the key itself.
func load_reserved_keys() -> void:
	var path := data_dir + "reserved_keys.json"
	reserved_keys = {}
	if FileAccess.file_exists(path):
		var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
		if typeof(parsed) == TYPE_DICTIONARY:
			reserved_keys = parsed
	var changed := false
	for n in GameData.world.get("reserved_names", {}).get("names", []):
		if not reserved_keys.has(n):
			var crypto := Crypto.new()
			reserved_keys[n] = crypto.generate_random_bytes(18).hex_encode()
			changed = true
	if changed:
		DirAccess.make_dir_recursive_absolute(data_dir)
		var f := FileAccess.open(path, FileAccess.WRITE)
		if f != null:
			f.store_string(JSON.stringify(reserved_keys, "  "))
			f.close()
			print("[server] reserved account keys saved in %s" % ProjectSettings.globalize_path(path))


## Rentals bought on the client's site reach the server as rows in
## server_data/rentals.json: [{ "key", "faire_id", "active_until", "owner" }].
## The site (or the server admin) appends a row; the server picks it up at
## boot and every 30 s, so owners can set up their faire right away.
func import_rentals() -> int:
	var path := data_dir + "rentals.json"
	if not FileAccess.file_exists(path):
		return 0
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	if typeof(parsed) != TYPE_ARRAY:
		push_warning("rentals.json should be a list")
		return 0
	var n := 0
	for r in parsed:
		if typeof(r) == TYPE_DICTIONARY and r.has("key") and r.has("faire_id") and r.has("active_until"):
			faires.register_rental(String(r["key"]), String(r["faire_id"]), String(r["active_until"]), String(r.get("owner", "")))
			n += 1
	return n


func _new_player_record() -> Dictionary:
	return { "name": "", "zone": "", "pos": Vector3.ZERO, "rot_y": 0.0, "zone_since": Time.get_unix_time_from_system(), "points": 0.0, "look": "" }


func _on_peer_connected(peer: int) -> void:
	if is_server():
		players[peer] = _new_player_record()
		print("[server] peer %d connected (%d online)" % [peer, players.size()])


func _on_peer_disconnected(peer: int) -> void:
	if is_server():
		if players.has(peer) and String(players[peer]["zone"]) == COMMON_ROOM and moderation.has(peer):
			_fire_says(COMMON_ROOM, "%s leaves the Common Room. The fire settles." % moderation.display_name(peer), peer)
		players.erase(peer)
		moderation.leave(peer)
		print("[server] peer %d left (%d online)" % [peer, players.size()])
	remote_players.erase(peer)


@rpc("any_peer", "call_remote", "reliable")
func rpc_register(display_name: String, zone: String, account_key := "", look := "") -> void:
	if not is_server():
		return
	var peer := _sender()
	var rec: Dictionary = players.get(peer, _new_player_record())
	rec["look"] = clean_look(look)
	var now := Time.get_unix_time_from_system()
	if not moderation.has(peer):
		moderation.join(peer, allowed_name(display_name, account_key, reserved_keys), now)
	rec["name"] = moderation.display_name(peer)
	players[peer] = rec
	_send_to(peer, "rpc_welcome", [peer, SongState.world_points, rec["name"], moderation.speak_wait(peer, now), moderation.frog_wait(peer, now)])
	_enter_zone(peer, zone)


## A look line from a player, checked and rewritten (unknown values become
## defaults; nothing else gets through).
static func clean_look(look: String) -> String:
	var parsed := CharacterModel.decode_look(look)
	return "" if parsed.is_empty() else CharacterModel.encode_look(parsed)


@rpc("any_peer", "call_remote", "reliable")
func rpc_look(look: String) -> void:
	if not is_server():
		return
	var peer := _sender()
	if players.has(peer):
		players[peer]["look"] = clean_look(look)


func _enter_zone(peer: int, zone: String) -> void:
	var rec: Dictionary = players[peer]
	var before := String(rec["zone"])
	if before == zone:
		return
	if before == COMMON_ROOM:
		_fire_says(COMMON_ROOM, "%s leaves the Common Room. The fire settles." % moderation.display_name(peer), peer)
	rec["zone"] = zone
	rec["zone_since"] = Time.get_unix_time_from_system()
	if zone == COMMON_ROOM:
		_fire_says(COMMON_ROOM, "%s enters the Common Room, warming by the fire." % moderation.display_name(peer))
	if zone == "campgrounds":
		_send_to(peer, "rpc_homesteads", [_homestead_list()])


@rpc("any_peer", "call_remote", "unreliable_ordered")
func rpc_state(zone: String, pos: Vector3, rot_y: float, points := 0.0) -> void:
	if not is_server():
		return
	var peer := _sender()
	if not players.has(peer) or not moderation.has(peer):
		return
	var rec: Dictionary = players[peer]
	_enter_zone(peer, zone)
	rec["pos"] = pos
	rec["rot_y"] = rot_y
	rec["points"] = points


@rpc("any_peer", "call_remote", "reliable")
func rpc_song_points(points: float, _reason: String) -> void:
	if not is_server():
		return
	# One action can't move the whole world much; cap each submission.
	SongState.set_world_points(SongState.world_points + clampf(points, 0.0, 10.0))


@rpc("any_peer", "call_remote", "reliable")
func rpc_chat(text: String) -> void:
	if not is_server():
		return
	var peer := _sender()
	if not players.has(peer):
		return
	var said := moderation.say(peer, text, Time.get_unix_time_from_system())
	if not bool(said["ok"]):
		_send_to(peer, "rpc_chat_refused", [String(said["error"])])
		return
	var rec: Dictionary = players[peer]
	var is_frog := moderation.is_frog(peer)
	var entry := { "from": peer, "name": moderation.display_name(peer), "text": said["text"], "frog": is_frog, "ink": "green" if is_frog else "sepia", "zone": rec["zone"] }
	for p in _peers_in_zone(String(rec["zone"])):
		_send_to(p, "rpc_chat_line", [entry])


@rpc("any_peer", "call_remote", "reliable")
func rpc_frog(target: int) -> void:
	if not is_server():
		return
	var voter := _sender()
	if not players.has(voter):
		return
	var now := Time.get_unix_time_from_system()
	if players.has(target) and String(players[target]["zone"]) != String(players[voter]["zone"]):
		_send_to(voter, "rpc_vote_result", ["That traveler is no longer here."])
		return
	var r := moderation.frog(voter, target, now)
	if not bool(r["ok"]):
		_send_to(voter, "rpc_vote_result", [String(r["error"])])
		return
	if not players.has(target):
		return
	var zone := String(players[target]["zone"])
	var needed := int(moderation.cfg.get("frog_votes_needed", 3))
	if not bool(r["transformed"]):
		_fire_says(zone, "A traveler gestures at %s. (%d/%d)" % [moderation.display_name(target), int(r["votes"]), needed])
		_send_to(voter, "rpc_vote_result", ["Frogged. (%d/%d)" % [int(r["votes"]), needed]])
		return
	players[target]["name"] = r["frog_name"]
	_fire_says(zone, "%s has been transformed. The traveler is now %s. The swamp reclaiming its own." % [r["old_name"], r["frog_name"]])
	for p in _peers_in_zone(zone):
		_send_to(p, "rpc_frog_state", [target, true])
	if bool(r["claimed"]):
		_fire_says(zone, "%s has been claimed by the swamp. The traveler is gone. The fire burns low." % r["frog_name"])
		_send_to(target, "rpc_claimed", [])
		players[target]["zone"] = ""
		get_tree().create_timer(0.6).timeout.connect(func() -> void:
			if multiplayer.multiplayer_peer is ENetMultiplayerPeer and target != 1:
				(multiplayer.multiplayer_peer as ENetMultiplayerPeer).disconnect_peer(target))


## A line in the fire's own hand (gold ink). except: a peer not to send it to.
func _fire_says(zone: String, text: String, except := 0) -> void:
	if text.is_empty():
		return
	var line := { "from": 0, "name": "The Fire", "text": text, "frog": false, "ink": "gold", "zone": zone }
	for p in _peers_in_zone(zone):
		if p != except:
			_send_to(p, "rpc_chat_line", [line])


@rpc("any_peer", "call_remote", "unreliable_ordered")
func rpc_tap(zone: String, pos: Vector3, surface: String) -> void:
	if not is_server():
		return
	var peer := _sender()
	if not players.has(peer):
		return
	for p in _peers_in_zone(zone):
		if p != peer:
			_send_to(p, "rpc_tap_heard", [peer, pos, surface.substr(0, 16)])


# ---------------------------------------------------------------- homesteads (server)

func plot_count() -> int:
	return GameData.crafting.get("plots", {}).get("ring_1", []).size()


## A traveler asks for a plot. They get it if it's free or already theirs. If
## it belongs to someone else, they keep the plot they already own here, or
## get the nearest free one.
func assign_plot(wanted: int, key: String, owner: String) -> int:
	for p in homesteads.keys():
		if String(homesteads[p]["key"]) == key:
			return int(p)
	if wanted >= 0 and wanted < plot_count() and not homesteads.has(wanted):
		homesteads[wanted] = { "key": key, "owner": owner, "tier": 0, "name": "" }
		return wanted
	for step in plot_count():
		for p in [wanted + step, wanted - step]:
			if p >= 0 and p < plot_count() and not homesteads.has(p):
				homesteads[p] = { "key": key, "owner": owner, "tier": 0, "name": "" }
				return p
	return -1


func _homestead_list() -> Array:
	var out := []
	for p in homesteads.keys():
		var h: Dictionary = homesteads[p]
		out.append({ "plot": int(p), "owner": h["owner"], "tier": int(h["tier"]), "name": h["name"] })
	return out


func _broadcast_homesteads() -> void:
	for p in _peers_in_zone("campgrounds"):
		_send_to(p, "rpc_homesteads", [_homestead_list()])


@rpc("any_peer", "call_remote", "reliable")
func rpc_claim_plot(plot: int, key: String, owner: String) -> void:
	if not is_server() or key.length() < 8:
		return
	var peer := _sender()
	var got := assign_plot(plot, key, owner.substr(0, 30))
	if got < 0:
		_send_to(peer, "rpc_plot_result", [false, -1, "The first ring is full here."])
		return
	var note := "That plot is someone else's here. Yours is close by." if plot >= 0 and got != plot else ""
	_send_to(peer, "rpc_plot_result", [true, got, note])
	_broadcast_homesteads()
	save_server_data()


@rpc("any_peer", "call_remote", "reliable")
func rpc_homestead_update(plot: int, key: String, tier: int, title: String) -> void:
	if not is_server() or not homesteads.has(plot) or String(homesteads[plot]["key"]) != key:
		return
	homesteads[plot]["tier"] = clampi(tier, 0, 5)
	homesteads[plot]["name"] = title.substr(0, 40)
	_broadcast_homesteads()
	save_server_data()


@rpc("any_peer", "call_remote", "reliable")
func rpc_request_faires() -> void:
	if not is_server():
		return
	_send_to(_sender(), "rpc_faire_list", [faires.active_faires()])


@rpc("any_peer", "call_remote", "reliable")
func rpc_save_faire(rental_key: String, config: Dictionary) -> void:
	if not is_server():
		return
	var msg := faires.save_with_key(rental_key, config)
	if msg.is_empty():
		save_server_data()
	_send_to(_sender(), "rpc_faire_saved", [msg.is_empty(), msg if not msg.is_empty() else "Saved. Your faire is open."])


func _peers_in_zone(zone: String) -> Array[int]:
	var out: Array[int] = []
	for p in players.keys():
		if String(players[p]["zone"]) == zone:
			out.append(int(p))
	return out


func _broadcast_snapshots() -> void:
	var by_zone := {}
	for p in players.keys():
		var rec: Dictionary = players[p]
		var z := String(rec["zone"])
		if z.is_empty():
			continue
		if not by_zone.has(z):
			by_zone[z] = []
		by_zone[z].append({ "id": int(p), "name": moderation.display_name(int(p)), "pos": rec["pos"], "rot_y": rec["rot_y"], "frog": moderation.is_frog(int(p)), "points": rec["points"], "look": rec.get("look", "") })
	for z in by_zone.keys():
		for p in _peers_in_zone(z):
			_send_to(p, "rpc_snapshot", [by_zone[z], SongState.world_points])


## Sends to one peer. The host's own peer (1) gets a direct call. Reliability
## comes from each receiver's @rpc annotation.
func _send_to(peer: int, method: String, args: Array) -> void:
	if peer == 1 and mode == Mode.HOST:
		callv(method, args)
	elif peer != 1:
		var call_args := [peer, method]
		call_args.append_array(args)
		callv("rpc_id", call_args)


# ---------------------------------------------------------------- client receivers

@rpc("authority", "call_remote", "reliable")
func rpc_welcome(_my_id: int, world_points: float, display_name: String, speak_wait: float, frog_wait: float) -> void:
	local_name = display_name
	SongState.set_world_points(world_points)
	welcomed.emit(display_name, speak_wait, frog_wait)


@rpc("authority", "call_remote", "unreliable_ordered")
func rpc_snapshot(list: Array, world_points: float) -> void:
	var me := local_id()
	var seen := {}
	for entry in list:
		var id := int(entry["id"])
		if id == me:
			continue
		seen[id] = true
		remote_players[id] = entry
	for id in remote_players.keys():
		if not seen.has(id):
			remote_players.erase(id)
	if absf(world_points - SongState.world_points) > 0.0001:
		SongState.set_world_points(world_points)
	snapshot_received.emit(list)


@rpc("authority", "call_remote", "reliable")
func rpc_chat_line(entry: Dictionary) -> void:
	EventBus.chat_received.emit(entry)


@rpc("authority", "call_remote", "reliable")
func rpc_chat_refused(message: String) -> void:
	chat_refused.emit(message)


@rpc("authority", "call_remote", "reliable")
func rpc_frog_state(peer: int, is_frog: bool) -> void:
	EventBus.player_frog_changed.emit(peer, is_frog)


@rpc("authority", "call_remote", "reliable")
func rpc_vote_result(message: String) -> void:
	vote_result.emit(message)


@rpc("authority", "call_remote", "reliable")
func rpc_claimed() -> void:
	claimed_by_swamp.emit()


@rpc("authority", "call_remote", "unreliable_ordered")
func rpc_tap_heard(peer: int, pos: Vector3, surface: String) -> void:
	tap_heard.emit(peer, pos, surface)


@rpc("authority", "call_remote", "reliable")
func rpc_homesteads(list: Array) -> void:
	homesteads_received.emit(list)


@rpc("authority", "call_remote", "reliable")
func rpc_plot_result(ok: bool, plot: int, message: String) -> void:
	if ok:
		PlayerState.claim_plot(plot)
	plot_result.emit(ok, plot, message)


@rpc("authority", "call_remote", "reliable")
func rpc_faire_list(list: Array) -> void:
	faire_list_received.emit(list)


@rpc("authority", "call_remote", "reliable")
func rpc_faire_saved(ok: bool, message: String) -> void:
	faire_save_result.emit(ok, message)


# ---------------------------------------------------------------- persistence

## The world's lasting state: the Song, faires, homestead plots. Never chat.
func load_server_data() -> void:
	var path := data_dir + "world.json"
	if FileAccess.file_exists(path):
		var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
		if typeof(parsed) == TYPE_DICTIONARY:
			SongState.world_points = float(parsed.get("world_points", 0.0))
			faires.from_dict(parsed.get("faires", {}))
			homesteads.clear()
			var hs: Dictionary = parsed.get("homesteads", {})
			for k in hs.keys():
				homesteads[int(k)] = hs[k]
	if faires.faires.is_empty():
		faires.load_samples()


## A server told to stop (Ctrl+C, systemctl stop, closing the window) keeps
## the world it had, not just the last 30-second save.
func _notification(what: int) -> void:
	if (what == NOTIFICATION_WM_CLOSE_REQUEST or what == NOTIFICATION_EXIT_TREE) and is_server():
		save_server_data()


func save_server_data() -> void:
	if not is_server():
		return
	DirAccess.make_dir_recursive_absolute(data_dir)
	var f := FileAccess.open(data_dir + "world.json", FileAccess.WRITE)
	if f == null:
		return
	var hs := {}
	for p in homesteads.keys():
		hs[str(p)] = homesteads[p]
	f.store_string(JSON.stringify({ "world_points": SongState.world_points, "faires": faires.to_dict(), "homesteads": hs }, "  "))
	f.close()


static func _arg_int(args: PackedStringArray, flag: String, fallback: int) -> int:
	var i := args.find(flag)
	if i != -1 and i + 1 < args.size() and args[i + 1].is_valid_int():
		return int(args[i + 1])
	return fallback
