extends Node
## Multiplayer integration test client. tools/run_net_test.ps1 starts a
## dedicated server and two of these (roles A and B) and checks they:
##   see each other, chat, share the Song total, hear each other's taps, get
##   different homestead plots when they ask for the same one, run a frog
##   (B frogs A), get ribbit chat from a frog, and list and save faires.
## Prints PASS/FAIL lines; exits 0 when every check passed.

var role := "A"
var checks: Dictionary = {}
var _deadline := 0.0
var _phase := 0
var _other_id := 0
var _got_ribbit := false
var _got_chat := false
var _heard_tap := false
var _frogged := false
var _faires := -1
var _my_plot := -99
var _plots: Array = []


const A_LOOK := "female|ranger|teal|buns|7a3020|c89a78|0|1"


func _ready() -> void:
	var args := OS.get_cmdline_user_args()
	var i := args.find("--role")
	if i != -1:
		role = args[i + 1]
	var port := Net._arg_int(args, "--port", 24991)
	PlayerState.slot = "net_test_" + role
	PlayerState.new_profile("Tester" + role)
	Net.connected.connect(func() -> void:
		# A comes dressed as a hooded ranger in teal; B must see exactly that.
		Net.register_self("Tester" + role, "campgrounds", "", A_LOOK if role == "A" else "")
		_pass("connected"))
	Net.connection_failed.connect(func() -> void: _fail("connection failed"))
	EventBus.chat_received.connect(_on_chat)
	EventBus.player_frog_changed.connect(func(peer: int, on: bool) -> void:
		if peer == Net.local_id() and on:
			_frogged = true)
	Net.faire_list_received.connect(func(list: Array) -> void: _faires = list.size())
	Net.faire_save_result.connect(func(ok: bool, msg: String) -> void:
		if ok:
			_pass("faire owner saved a faire online")
		else:
			print("[%s] faire save refused: %s" % [role, msg]))
	Net.tap_heard.connect(func(_peer: int, _pos: Vector3, surface: String) -> void:
		if surface == "wood":
			_heard_tap = true)
	Net.plot_result.connect(func(ok: bool, plot: int, _msg: String) -> void:
		if ok:
			_my_plot = plot)
	Net.homesteads_received.connect(func(list: Array) -> void: _plots = list)
	_deadline = Time.get_ticks_msec() / 1000.0 + 40.0
	if Net.join("127.0.0.1", port) != OK:
		_fail("join")


func _process(_delta: float) -> void:
	if Time.get_ticks_msec() / 1000.0 > _deadline:
		_finish()
		return
	if not Net.is_online() or not checks.has("connected"):
		return
	Net.send_state("campgrounds", Vector3(1 if role == "A" else -1, 0, 0), 0.0)
	match _phase:
		0:
			if Net.remote_players.size() >= 1:
				_other_id = int(Net.remote_players.keys()[0])
				_pass("sees the other player")
				if role == "B" and String(Net.remote_players[_other_id].get("look", "")) == A_LOOK:
					_pass("sees the look A chose")
				_phase = 1
				Net.claim_plot(0)
				if role == "A":
					Net.send_chat("hello from A")
					SongState.add_points(5.0, "test")
					Net.request_faires()
					Net.send_tap("campgrounds", Vector3(1, 0, 0), "wood")
				else:
					Net.save_faire("WRONG-KEY", _test_faire())
					Net.save_faire("TEST-KEY", _test_faire())
		1:
			if role == "A" and _my_plot >= 0 and not checks.has("plot"):
				checks["plot"] = true
				_pass("got a homestead plot (%d)" % _my_plot)
			if role == "B" and _got_chat and SongState.world_points >= 5.0 and _heard_tap and _my_plot >= 0 and _other_plot() >= 0:
				_pass("got A's chat")
				_pass("world Song shared (%.1f points)" % SongState.world_points)
				_pass("heard A's tap")
				if _my_plot != _other_plot():
					_pass("asked for the same plot, got a different one (%d, A has %d)" % [_my_plot, _other_plot()])
				Net.frog(_other_id)
				_phase = 2
			elif role == "A" and _faires >= 1 and SongState.world_points >= 5.0 and checks.has("plot"):
				_pass("faire list (%d)" % _faires)
				_pass("world Song shared (%.1f points)" % SongState.world_points)
				_phase = 2
		2:
			if role == "A" and _frogged:
				_pass("frogged")
				Net.send_chat("this should come out as a ribbit")
				_phase = 3
			elif role == "B" and _got_ribbit:
				_pass("frog chat arrives as a ribbit")
				_finish()
		3:
			if role == "A":
				# A is done once it has been frogged and spoken; give B a moment to read it.
				if not checks.has("waited"):
					checks["waited"] = Time.get_ticks_msec()
				elif Time.get_ticks_msec() - int(checks["waited"]) > 1500:
					checks.erase("waited")
					_finish()


func _other_plot() -> int:
	for h in _plots:
		if String(h.get("owner", "")) == ("TesterA" if role == "B" else "TesterB"):
			return int(h["plot"])
	return -1


func _test_faire() -> Dictionary:
	return { "faire_name": "Test Guild Faire", "owner": "Test Guild", "layout": "ring", "palette": "sea",
		"performers": ["Drums"], "active_until": "2000-01-01",
		"booths": [{ "sign": "Pies", "artisan": "Pie Folk", "items": [] }] }


func _on_chat(entry: Dictionary) -> void:
	var text := String(entry.get("text", ""))
	if text == "hello from A":
		_got_chat = true
	if bool(entry.get("frog", false)) and text in GameData.world["moderation"]["ribbits"]:
		_got_ribbit = true


func _pass(what: String) -> void:
	checks[what] = true
	print("[%s] PASS %s" % [role, what])


func _fail(what: String) -> void:
	print("[%s] FAIL %s" % [role, what])
	get_tree().quit(1)


func _finish() -> void:
	var want := ["connected", "sees the other player"]
	if role == "A":
		want.append_array(["frogged", "plot"])
	else:
		want.append_array(["got A's chat", "heard A's tap", "frog chat arrives as a ribbit", "faire owner saved a faire online", "sees the look A chose"])
	var ok := true
	for w in want:
		if not checks.has(w):
			print("[%s] FAIL missing: %s" % [role, w])
			ok = false
	var shared := false
	var different := role == "A"
	for k in checks.keys():
		if String(k).begins_with("world Song shared"):
			shared = true
		if String(k).begins_with("asked for the same plot"):
			different = true
	if not shared:
		print("[%s] FAIL missing: world Song shared" % role)
		ok = false
	if not different:
		print("[%s] FAIL missing: different homestead plots" % role)
		ok = false
	print("[%s] %s" % [role, "ALL PASSED" if ok else "FAILED"])
	Net.leave()
	get_tree().quit(0 if ok else 1)
