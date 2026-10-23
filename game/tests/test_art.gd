extends RefCounted
## The CC0 art: people built from the character kit, the creatures, real
## surfaces for the palette colours, and the kits' props in the zones.


func test_character_kit_builds_a_person(t) -> void:
	t.check(CharacterModel.available(), "the character kit is installed")
	var holder := Node3D.new()
	t.add_child(holder)
	var person := CharacterModel.make(holder, { "body": "female", "outfit": "ranger", "hair": "buns", "cloth_variant": "teal" })
	await t.get_tree().process_frame
	t.check(person.skeleton != null and person.skeleton.find_bone("Head") >= 0, "one humanoid skeleton carries every part")
	for anim_name in ["Idle", "Walk", "Jog_Fwd", "Sitting_Idle", "Idle_Talking", "Dance"]:
		t.check(person.anim.has_animation(anim_name), "the library has " + anim_name)
	t.eq(person.anim.current_animation, "Idle", "a person idles")
	var meshes := person.skeleton.find_children("*", "MeshInstance3D", true, false)
	t.check(meshes.size() >= 7, "body, legs, arms, feet, head, eyes, brows and hair (%d meshes)" % meshes.size())
	var head := person.skeleton.find_child("Head", false, false) as MeshInstance3D
	t.check(head != null, "the base body's head is there")
	if head:
		var full := 0
		var base: PackedScene = load(CharacterModel.ROOT + "base/Superhero_Female_FullBody.gltf")
		var inst := base.instantiate()
		for n in inst.find_children("Super*", "MeshInstance3D", true, false):
			full += (n as MeshInstance3D).mesh.surface_get_array_index_len(0)
		inst.free()
		var kept: int = head.mesh.surface_get_array_index_len(0)
		t.check(kept > 0 and kept < full / 3, "only the head and neck are kept from the full body (%d of %d)" % [kept, full])
	person.move_speed(1.6)
	t.eq(person.anim.current_animation, "Walk", "walking pace plays the walk")
	person.move_speed(0.0)
	t.eq(person.anim.current_animation, "Idle", "standing still goes back to idle")
	holder.queue_free()
	await t.get_tree().process_frame


func test_every_cast_look_builds(t) -> void:
	var holder := Node3D.new()
	t.add_child(holder)
	for cid in GameData.characters:
		var ch: Dictionary = GameData.characters[cid]
		if ch.has("look"):
			var p := CharacterModel.make(holder, ch["look"], "Model_" + cid)
			t.check(p.skeleton != null and p.anim.has_animation(p.idle_anim), cid + " builds and has its idle")
		else:
			t.check(ch.has("creature"), cid + " is either dressed or a creature")
	holder.queue_free()
	await t.get_tree().process_frame


func test_player_look_is_stable_per_name(t) -> void:
	t.eq(CharacterModel.player_look("Quartz-K"), CharacterModel.player_look("quartz-k "), "same name, same person on every client")
	var looks := {}
	for n in ["Ada", "Bram", "Cora", "Dain", "Esme", "Fen", "Gil", "Hollis", "Ivy", "Jem"]:
		looks[str(CharacterModel.player_look(n))] = true
	t.check(looks.size() >= 4, "different names get different looks (%d of 10)" % looks.size())


func test_creatures(t) -> void:
	var holder := Node3D.new()
	t.add_child(holder)
	for kind in ["wolf", "dragon", "owl", "gecko", "fossil_rat"]:
		var c := Creatures.build(kind, holder, Color(0.8, 0.5, 0.2))
		t.check(c != null and not c.find_children("*", "MeshInstance3D", true, false).is_empty(), kind + " has a body")
	var dragon := holder.find_child("Dragon", false, false)
	var eyes := dragon.find_child("EyeArmature", true, false) as Node3D if dragon else null
	t.check(eyes != null and not eyes.visible, "the baby dragon sleeps with its eyes closed")
	var skel := dragon.find_child("Skeleton3D", true, false) as Skeleton3D if dragon else null
	if skel:
		var head := skel.find_bone("Head")
		var tail := skel.find_bone("Tail4")
		var hy := (skel.global_transform * skel.get_bone_global_pose(head).origin).y
		var ty := (skel.global_transform * skel.get_bone_global_pose(tail).origin).y
		t.check(hy < 0.6 and ty < 0.6, "it lies down: head and tail near the floor (%.2f, %.2f)" % [hy, ty])
	holder.queue_free()
	await t.get_tree().process_frame


func test_surfaces_follow_the_palette(t) -> void:
	Builder.clear_skins()
	var wood := Color(0.36, 0.24, 0.15)
	Builder.skin(wood, "floor")
	Builder.skin(Color(0.5, 0.2, 0.15), "tiles", false)
	t.eq(Builder.surface_for(wood)[0], "floor", "the palette colour takes its surface")
	t.eq(Builder.surface_for(wood.darkened(0.2))[0], "floor", "so does a darker shade of it")
	t.eq(Builder.surface_for(wood.lightened(0.1))[0], "floor", "and a lighter one")
	t.check(Builder.surface_for(Color(0.45, 0.36, 0.24)).is_empty(), "a near colour that isn't a shade stays plain")
	t.check(Builder.surface_for(Color(0.5, 0.2, 0.15).darkened(0.1)).is_empty(), "exact-only surfaces don't spread to shades")
	t.check(Builder.surface_for(Color(0.36, 0.24, 0.15, 0.5)).is_empty(), "see-through colours stay plain")
	var tint: Color = Builder.surface_for(wood)[1]
	var avg: Color = Builder.SURFACES["floor"]["avg"]
	t.check(absf(avg.r * tint.r - wood.r) < 0.001 and absf(avg.b * tint.b - wood.b) < 0.001, "the tint brings the texture to the palette colour")
	var box := Builder.box(t, Vector3(4, 1, 2), Vector3.ZERO, wood, false) as MeshInstance3D
	var uv_max := Vector2.ZERO
	var uvs: PackedVector2Array = box.mesh.surface_get_arrays(0)[Mesh.ARRAY_TEX_UV]
	for uv in uvs:
		uv_max = Vector2(maxf(uv_max.x, absf(uv.x)), maxf(uv_max.y, absf(uv.y)))
	t.check(uv_max.is_equal_approx(Vector2(2, 1)), "box UVs are in metres, so textures tile and never stretch (%s)" % uv_max)
	t.check(box.material_override is StandardMaterial3D and (box.material_override as StandardMaterial3D).albedo_texture != null, "the box is textured")
	box.queue_free()
	Builder.clear_skins()


func test_kit_props_load(t) -> void:
	for n in ["Barrel", "Chandelier", "Bookcase_2", "Stall_Empty", "Stall_Cart_Empty", "Anvil_Log", "Lantern_Wall", "Pine_1", "TwistedTree_1", "Rock_Medium_1", "Prop_Wagon"]:
		var p := Builder.prop(t, n, Vector3.ZERO)
		t.check(p != null, n + " loads")
		if p:
			p.queue_free()
	t.check(Builder.prop(t, "No_Such_Prop", Vector3.ZERO) == null, "a missing prop is null, so callers keep their shapes")


func test_zones_are_furnished(t) -> void:
	SceneRouter.spawn_point = "door"
	var zone: Node = (load("res://scenes/zones/main_floor.tscn") as PackedScene).instantiate()
	t.add_child(zone)
	await t.get_tree().process_frame
	var named := func(prefix: String) -> int:
		var n := 0
		for c in zone.find_children(prefix + "*", "", true, false):
			n += 1
		return n
	t.check(named.call("Chandelier") >= 3, "chandeliers hang from the beams")
	t.check(named.call("Bookcase_2") >= 4, "the library has its bookcases")
	t.check(zone.find_children("*Lantern*", "", true, false).size() >= 6, "lanterns light the walls")
	t.check(zone.get_node("NPC_host").get_node_or_null("Model") is CharacterModel, "the Host is a dressed person")
	t.check(zone.find_child("Dragon", true, false) != null, "the dragon sleeps in the geode")
	zone.queue_free()
	await t.get_tree().process_frame
	SceneRouter.spawn_point = "porch"
	var camp: Node = (load("res://scenes/zones/campgrounds.tscn") as PackedScene).instantiate()
	t.add_child(camp)
	await t.get_tree().process_frame
	t.check(camp.find_children("Pine_*", "", true, false).size() >= 5, "pines ring the field")
	t.check(camp.find_children("TwistedTree_*", "", true, false).size() >= 5, "twisted trees fill the woods")
	t.check(camp.find_children("*", "MultiMeshInstance3D", true, false).size() >= 5, "grass, flowers and stones are scattered")
	t.check(camp.find_child("Wolf", true, false) != null, "Jay's wolf is by the tavern")
	camp.queue_free()
	await t.get_tree().process_frame


func test_lighter_graphics(t) -> void:
	var was := Settings.graphics_quality
	Settings.graphics_quality = "low"
	t.check(Settings.low_detail(), "the setting turns lighter graphics on")
	var m := Builder.surface_material("brick", Color.WHITE)
	t.check(m.albedo_texture != null and not m.normal_enabled and m.roughness_texture == null, "lighter surfaces keep only the colour texture")
	var holder := Node3D.new()
	t.add_child(holder)
	var p := CharacterModel.make(holder, { "body": "male", "outfit": "peasant", "hair": "parted" })
	await t.get_tree().process_frame
	t.check(p.update_every == 0.0, "the player and anyone made by hand still animate every frame")
	p.set_frozen(true)
	if not CharacterModel.can_freeze():
		# Headless has no skins to pose: the person simply stays animated.
		t.check(not p.frozen and p.skeleton.find_children("*_Posed", "", false, false).is_empty(), "without a renderer, nobody is posed")
		holder.queue_free()
		await t.get_tree().process_frame
		Settings.graphics_quality = was
		return
	var twins := p.skeleton.find_children("*_Posed", "MeshInstance3D", false, false)
	var shown := twins.filter(func(n: Node) -> bool: return (n as MeshInstance3D).visible and (n as MeshInstance3D).mesh != null)
	t.check(twins.size() >= 6 and shown.size() == twins.size(), "far away, a person is posed into plain meshes (%d)" % twins.size())
	var skinned_shown := p.skeleton.get_children().filter(func(n: Node) -> bool: return n is MeshInstance3D and (n as MeshInstance3D).skin != null and (n as MeshInstance3D).visible)
	t.check(skinned_shown.is_empty(), "and the skinned meshes rest until they're near again")
	p.set_frozen(false)
	skinned_shown = p.skeleton.get_children().filter(func(n: Node) -> bool: return n is MeshInstance3D and (n as MeshInstance3D).skin != null and (n as MeshInstance3D).visible)
	t.check(skinned_shown.size() >= 6, "near again, they move")
	holder.queue_free()
	await t.get_tree().process_frame
	Settings.graphics_quality = was