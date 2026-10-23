extends RefCounted
## Release pieces: the character creator and its look line, the credits and
## licenses screen.


func test_look_line_round_trip(t) -> void:
	var look := { "body": "female", "outfit": "ranger", "cloth_variant": "teal", "hair": "buns", "hair_color": "#7a3020",
		"skin": "#c89a78", "beard": false, "hood": true }
	var code := CharacterModel.encode_look(look)
	t.eq(code, "female|ranger|teal|buns|7a3020|c89a78|0|1", "a look is one short line")
	t.eq(CharacterModel.decode_look(code), CharacterModel.sanitize_look(look), "and reads back the same")
	for i in CharacterModel.PLAYER_LOOKS.size():
		var l: Dictionary = CharacterModel.PLAYER_LOOKS[i]
		var clean := CharacterModel.sanitize_look(l)
		t.eq(clean["hair_color"], String(l.get("hair_color", clean["hair_color"])), "picked look %d uses the creator's own colours" % i)
		t.eq(clean["cloth_variant"], String(l.get("cloth_variant", "")), "picked look %d uses a colour the creator offers" % i)


func test_look_line_refuses_junk(t) -> void:
	t.check(CharacterModel.decode_look("").is_empty(), "an empty line is no look")
	t.check(CharacterModel.decode_look("male|peasant").is_empty(), "a short line is no look")
	var odd := CharacterModel.decode_look("dragon|wizard|../../x|mohawk|zzzzzz|000000|1|1")
	t.eq(odd["body"], "male", "unknown body falls back")
	t.eq(odd["outfit"], "peasant", "unknown outfit falls back")
	t.eq(odd["cloth_variant"], "", "unknown colour falls back (no paths get through)")
	t.eq(odd["hair"], "", "unknown hair falls back")
	t.eq(odd["hair_color"], CharacterModel.HAIR_COLORS[2], "unknown hair colour falls back")
	t.eq(odd["skin"], CharacterModel.SKIN_TINTS[0], "unknown skin falls back")
	t.check(not odd["hood"], "no hood on peasant clothes")
	var woman := CharacterModel.decode_look("female|peasant|wine|long|141210|ffffff|1|0")
	t.check(not woman["beard"], "beards only where the creator offers them")
	t.eq(Net.clean_look("male|ranger|slate|long|4a3020|e0bea0|1|1"), "male|ranger|slate|long|4a3020|e0bea0|1|1", "the server passes a good look through")
	t.eq(Net.clean_look("x" .repeat(5000)), "", "and drops a junk one")


func test_look_of_profile(t) -> void:
	PlayerState.new_profile("Quartz-K")
	t.eq(CharacterModel.look_of(PlayerState.profile), CharacterModel.sanitize_look(CharacterModel.player_look("Quartz-K")), "no choice yet: one is picked from the name")
	PlayerState.profile["look"] = { "body": "male", "outfit": "ranger", "cloth_variant": "plum", "hair": "long", "hair_color": "#9a7a48" }
	t.eq(CharacterModel.look_of(PlayerState.profile)["cloth_variant"], "plum", "the chosen look wins")


func test_creator_panel(t) -> void:
	var p := LookPanel.new()
	t.add_child(p)
	var got := []
	p.look_chosen.connect(func(l: Dictionary) -> void: got.append(l))
	p.edit({ "body": "female", "outfit": "peasant", "cloth_variant": "wine", "hair": "long", "hair_color": "#141210" })
	await t.get_tree().process_frame
	t.check(p.visible, "the creator opens")
	t.check(p.find_children("*", "SubViewport", true, false).size() == 1, "with a turning preview")
	t.check(p.find_children("Preview", "", true, false).size() == 1, "of the person being made")
	var me: Button = null
	for b in p.find_children("*", "Button", true, false):
		if (b as Button).text == "This is me":
			me = b
	t.check(me != null, "and a button to keep it")
	if me:
		me.pressed.emit()
	t.check(got.size() == 1 and String(got[0]["cloth_variant"]) == "wine", "keeping it hands the look back")
	t.check(not p.visible, "and closes")
	p.queue_free()
	await t.get_tree().process_frame


func test_credits_and_licenses(t) -> void:
	var c := CreditsPanel.new()
	t.add_child(c)
	c.open()
	await t.get_tree().process_frame
	var shown := ""
	for l in c.find_children("*", "Label", true, false):
		shown += (l as Label).text + "\n"
	var licenses := c.find_child("Licenses", true, false) as TextEdit
	t.check("Barn Owl" in shown and "CC-BY 3.0" in shown and "Poly by Google" in shown, "the owl's CC-BY credit line is in the game")
	t.check("Quaternius" in shown and "Poly Haven" in shown, "the CC0 sources are credited too")
	t.check(licenses != null and "Godot Engine contributors" in licenses.text, "Godot's own license notice is shown")
	t.check(licenses != null and "FreeType" in licenses.text, "and the components Godot carries, with their licenses")
	c.queue_free()
	await t.get_tree().process_frame
