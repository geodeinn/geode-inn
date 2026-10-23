extends RefCounted
## Standing design rules from the client's canon, checked on every
## player-facing string and number so they can't drift.

const PRONOUNS := ["he", "she", "him", "her", "his", "hers", "himself", "herself"]


func _words(text: String) -> PackedStringArray:
	var cleaned := text.to_lower()
	for ch in [".", ",", "!", "?", ";", ":", "(", ")", "\"", "'s", "'ll", "'d", "'", "[", "]", "—"]:
		cleaned = cleaned.replace(ch, " ")
	return cleaned.split(" ", false)


func _check_no_pronouns(t, text: String, where: String) -> void:
	for w in _words(text):
		if w in PRONOUNS:
			t.check(false, "gendered pronoun '%s' in %s: %s" % [w, where, text])
			return


## Every string a player can see, from the data files.
func _player_text() -> Array:
	var out: Array = []
	for cid in GameData.characters:
		out.append(["characters.%s.role" % cid, String(GameData.characters[cid].get("role", ""))])
	for cid in GameData.dialogue:
		for entry in GameData.dialogue[cid]:
			for line in entry.get("lines", []) + entry.get("after", []):
				out.append(["dialogue.%s" % cid, String(line)])
			for c in entry.get("choices", []):
				out.append(["dialogue.%s.choice" % cid, String(c.get("text", ""))])
				for line in c.get("lines", []):
					out.append(["dialogue.%s.choice" % cid, String(line)])
	for k in GameData.dialogue_extra("humble_objects"):
		if not String(k).begins_with("_"):
			for line in GameData.dialogue_extra("humble_objects")[k]:
				out.append(["humble.%s" % k, String(line)])
	for qid in GameData.quests:
		var q: Dictionary = GameData.quests[qid]
		out.append(["quests.%s.summary" % qid, String(q.get("summary", ""))])
		out.append(["quests.%s.chronicle" % qid, String(q["reward"].get("chronicle", ""))])
		for s in q.get("steps", []):
			out.append(["quests.%s.step" % qid, String(s.get("text", ""))])
	for bid in GameData.world["beings"]:
		var b: Dictionary = GameData.world["beings"][bid]
		out.append(["beings.%s" % bid, String(b["dissonant_text"]) + " " + String(b["true_form"])])
	for zone in GameData.world["journal_observations"]:
		for o in GameData.world["journal_observations"][zone]:
			out.append(["observations.%s" % zone, String(o["text"])])
	for a in GameData.world["achievements"]:
		out.append(["achievements.%s" % a, String(GameData.world["achievements"][a]["text"])])
	for s in GameData.world["seed_companions"]["shapes"].values():
		out.append(["seed_companions", String(s["text"])])
	for tier in GameData.tiers:
		out.append(["tiers.%s" % tier["id"], String(tier["description"]) + " " + " ".join(PackedStringArray(tier["verdict"]))])
	for it in GameData.market["items"]:
		out.append(["market.%s" % it["id"], String(it.get("lore", ""))])
	return out


func test_no_gendered_pronouns_in_player_text(t) -> void:
	for pair in _player_text():
		_check_no_pronouns(t, String(pair[1]), String(pair[0]))


func test_the_fourth_wall_is_never_named(t) -> void:
	# The market's phrasing law: "the one that travels... beyond the door".
	for pair in _player_text():
		var s := String(pair[1]).to_lower()
		for w in ["geodeinn", "website", "real world", "shop online", "online store", "http"]:
			t.check(not s.contains(w), "%s names the fourth wall (%s): %s" % [pair[0], w, pair[1]])


func test_no_actor_names_in_game_data(t) -> void:
	# Casting references from the old walk-through must never ship.
	var actors := ["Patrick Stewart", "Anthony Hopkins", "Bonham Carter", "Cumberbatch", "Malkovich", "Lady Gaga", "Patinkin", "Tim Curry", "Cillian Murphy", "Danny Kaye"]
	for file_name in ["characters.json", "dialogue.json", "quests.json", "world.json", "crafting.json"]:
		var text := FileAccess.get_file_as_string("res://data/" + file_name)
		for a in actors:
			t.check(not text.contains(a), "%s mentions %s" % [file_name, a])


func test_private_people_stay_out(t) -> void:
	# Real people's details (the client's family and friends) never ship in player text.
	for pair in _player_text():
		var words := _words(String(pair[1]))
		for w in ["krista", "glioblastoma", "cancer", "lozen", "river", "gabby", "tj", "bethany", "eileen", "lacey", "velta", "inta"]:
			t.check(not w in words, "%s mentions %s" % [pair[0], w])


func test_vaulknut_not_on_main_floor_or_campgrounds(t) -> void:
	var zone := String(GameData.characters["vaulknut"]["zone"])
	t.check(zone not in ["main_floor", "campgrounds"], "Vaulknut works alone in the Tidal Caves (now: %s)" % zone)


func test_canon_names(t) -> void:
	for gone in ["crone", "storyteller", "marijke", "dani"]:
		t.check(not GameData.characters.has(gone), "the old name %s is gone" % gone)
	for here in ["ragana", "firekeeper", "luna", "catalyst", "host", "naut", "jay", "wisteria", "zeke", "owl", "pluck", "ziggy"]:
		t.check(GameData.characters.has(here), "canon cast: " + here)
	t.eq(String(GameData.dialogue["host"][0]["lines"][0]), "Come in, you're safe here.", "the Host's first line")


func test_common_room_numbers_match_the_live_backend(t) -> void:
	# docs/library/functions/geodeInnCommonRoom.ts
	var m: Dictionary = GameData.world["moderation"]
	t.eq(int(m["speak_threshold_s"]), 45, "THRESHOLD_MS 45000")
	t.eq(int(m["speak_threshold_heightened_s"]), 120, "THRESHOLD_HEIGHTENED_MS 120000")
	t.eq(int(m["frog_cooldown_s"]), 120, "FROG_COOLDOWN_MS 120000")
	t.eq(int(m["frog_votes_needed"]), 3, "FROG_VOTES_NEEDED 3")
	t.eq(int(m["frog_transformations_to_remove"]), 3, "FROG_TRANSFORMATIONS_TO_REMOVE 3")
	t.eq(int(m["heightened_s"]), 300, "HEIGHTENED_DURATION_MS 300000")
	t.eq(int(m["chat_max_len"]), 500, "MAX_MESSAGE_LENGTH 500")
	t.eq(m["ribbits"].size(), 7, "the seven ribbits")
	t.eq(m["fire_ambient"].size(), 8, "the fire's eight lines")


func test_nook_timings_follow_the_spec(t) -> void:
	var n: Dictionary = GameData.world["nook"]
	t.near(float(n["first_person_seconds"]), 120.0, 0.0, "the SIT Lock after 2 minutes")
	t.near(float(n["you_looked_seconds"]), 600.0, 0.0, "You Looked after 10 minutes")


func test_the_voice_of_the_inn(t) -> void:
	t.eq(VoiceOfTheInn.line("entrance"), "The fire is lit.", "the first words, every launch")
	t.eq(VoiceOfTheInn.line("return_visit"), "the fire was kept lit.", "not welcome back")
	t.eq(VoiceOfTheInn.line("tectonic_shift"), "The ground moved. You're still here.", "the first shift")
	t.check(not bool(GameData.world["voice_of_the_inn"]["final_room_line_enabled"]), "silent in the Final Room until the client rules")


func test_the_song_stops_short_of_the_endgame(t) -> void:
	t.check(float(GameData.world["song"]["release_cap_hz"]) < float(GameData.world["song"]["complete_hz"]), "44Hz is the endgame")


func test_no_bog_in_the_campgrounds(t) -> void:
	t.check(not GameData.world["beings"].has("bog_wisp"), "dissection 14 has no Bog")
	var text := FileAccess.get_file_as_string("res://scripts/zones/campgrounds.gd")
	t.check(not text.contains("BogWater"), "nor does the zone")
