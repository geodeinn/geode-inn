extends RefCounted
## Elio's account: the name is held open for its keyholder only.


func test_reserved_name_needs_its_key(t) -> void:
	var keys := { "Elio": "secret-key" }
	t.eq(Net.allowed_name("Elio", "", keys), "", "no key, no Elio")
	t.eq(Net.allowed_name("elio", "", keys), "", "any letter case is protected")
	t.eq(Net.allowed_name("  ELIO ", "wrong", keys), "", "a wrong key doesn't work")
	t.eq(Net.allowed_name("elio", "secret-key", keys), "Elio", "the right key gets the name")
	t.eq(Net.allowed_name("Marigold", "", keys), "Marigold", "other names are fine")
	t.eq(Net.allowed_name("   ", "", keys), "", "blank stays blank")


func test_blank_or_refused_names_become_stone_names(t) -> void:
	var m := Moderation.new()
	var rec := m.join(4242, Net.allowed_name("Elio", "", { "Elio": "k" }), 0.0)
	var stones: Array = GameData.world["moderation"]["stone_names"]
	t.check(String(rec["name"]).split("-")[0] in stones, "the Common Room gives a stone name: " + String(rec["name"]))


func test_server_creates_a_key_for_elio(t) -> void:
	var path := Net.SERVER_DATA_DIR + "reserved_keys.json"
	if FileAccess.file_exists(path):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(path))
	Net.load_reserved_keys()
	t.check(Net.reserved_keys.has("Elio"), "a key exists for Elio")
	var key := String(Net.reserved_keys.get("Elio", ""))
	t.check(key.length() >= 32, "the key is long and random")
	var first := key
	Net.load_reserved_keys()
	t.eq(String(Net.reserved_keys["Elio"]), first, "the key stays the same across restarts")
	DirAccess.remove_absolute(ProjectSettings.globalize_path(path))
	Net.reserved_keys = {}
