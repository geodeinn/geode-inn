class_name CharacterModel
extends Node3D
## A dressed, animated person built from the CC0 character kit in
## assets/characters (Quaternius: Universal Base Characters, Modular Character
## Outfits - Fantasy, Universal Animation Library). Every part is retargeted on
## import to Godot's humanoid skeleton (tools/setup_character_imports.py), so
## any outfit plays any animation in the library.
##
## A look is a small dictionary (characters.json "look"):
##   body       "male" | "female"
##   outfit     "peasant" | "ranger"; "parts" can mix slots: { "legs": "ranger" }
##   hood, pauldron   ranger pieces on top
##   hair       "long" | "buns" | "parted" | "buzzed" | "" (none)
##   beard      true for a beard (male)
##   skin, hair_color, cloth   hex tints (cloth multiplies the outfit texture)
##   cloth_variant   "2" for the second outfit texture (Peasant_2 / Ranger_3)
##   height     uniform scale, 1.0 is about 1.8 m
##   head       "" for the human head, "none" to leave it off (Naut wears his own)
##   idle       the resting animation ("Idle", "Sitting_Idle", "Idle_Torch"...)

const ROOT := "res://assets/characters/"
const LIBRARY := ROOT + "anim/AnimationLibrary_Godot_Standard.glb"
const LOOPING := ["Idle", "Idle_Talking", "Idle_Torch", "Walk", "Walk_Formal", "Jog_Fwd", "Sprint",
	"Sitting_Idle", "Sitting_Talking", "Dance", "Crouch_Idle", "Crouch_Fwd", "Fixing_Kneeling",
	"Swim_Idle", "Swim_Fwd", "Spell_Simple_Idle", "Sword_Idle", "Driving"]
const HAIR := { "long": "Hair_Long", "buns": "Hair_Buns", "parted": "Hair_SimpleParted", "buzzed": "Hair_Buzzed" }

## Players' looks until there's a character creator: picked by name, so every
## client draws the same person for the same name.
const PLAYER_LOOKS := [
	{ "body": "female", "outfit": "peasant", "cloth_variant": "indigo", "hair": "long", "hair_color": "#1e1814" },
	{ "body": "male", "outfit": "ranger", "cloth_variant": "2", "hair": "parted", "beard": true, "hair_color": "#3a2618" },
	{ "body": "female", "outfit": "ranger", "cloth_variant": "teal", "hair": "buns", "hair_color": "#5a2c1c" },
	{ "body": "male", "outfit": "peasant", "cloth_variant": "wine", "hair": "buzzed", "hair_color": "#141210", "skin": "#a87858" },
	{ "body": "female", "outfit": "peasant", "cloth_variant": "moss", "hair": "buns", "hair_color": "#9a7a48" },
	{ "body": "male", "outfit": "ranger", "cloth_variant": "slate", "hair": "long", "hair_color": "#4a3020" },
	{ "body": "female", "outfit": "ranger", "cloth_variant": "crimson", "hair": "long", "hair_color": "#241a14", "skin": "#c89a78" },
	{ "body": "male", "outfit": "peasant", "cloth_variant": "saffron", "hair": "parted", "beard": true, "hair_color": "#6e4a32" },
]

static var _library: AnimationLibrary
static var _heads: Dictionary = {}       # body -> ArrayMesh (head and neck only)
static var _materials: Dictionary = {}   # tint key -> material

var look: Dictionary = {}
var skeleton: Skeleton3D
var anim: AnimationPlayer
var idle_anim := "Idle"
## Seconds between animation updates; 0 updates every frame. Lighter graphics
## set this for the cast, so a room of people costs less to keep moving.
var update_every := 0.0:
	set(v):
		update_every = v
		_since_update = randf() * v   # people don't all move on the same frame
		if anim:
			anim.callback_mode_process = AnimationMixer.ANIMATION_CALLBACK_MODE_PROCESS_MANUAL if v > 0.0 else AnimationMixer.ANIMATION_CALLBACK_MODE_PROCESS_IDLE
var _rig: Node3D
var _since_update := 0.0


static func clear_cache() -> void:
	_library = null
	_heads.clear()
	_materials.clear()


static func make(parent: Node, look_dict: Dictionary, node_name := "Model") -> CharacterModel:
	var m := CharacterModel.new()
	m.name = node_name
	m.look = look_dict
	parent.add_child(m)
	return m


static func player_look(player_name: String) -> Dictionary:
	return PLAYER_LOOKS[absi(player_name.strip_edges().to_lower().hash()) % PLAYER_LOOKS.size()]


## True when the kit is in the project (tests and builds without the art
## still run on the plain shapes).
static func available() -> bool:
	return ResourceLoader.exists(LIBRARY) and ResourceLoader.exists(ROOT + "outfits/Male_Peasant_Body.gltf")


func _ready() -> void:
	_build()


func _build() -> void:
	var female := String(look.get("body", "male")) == "female"
	var sex := "Female" if female else "Male"
	var outfit := String(look.get("outfit", "peasant")).capitalize()
	var parts: Dictionary = look.get("parts", {})
	var slot_outfit := func(slot: String) -> String: return String(parts.get(slot, outfit)).capitalize()
	_rig = _instance(ROOT + "outfits/%s_%s_Body.gltf" % [sex, slot_outfit.call("body")])
	_rig.name = "Rig"
	_rig.rotation.y = PI   # the kit faces +Z, the game's characters face -Z
	add_child(_rig)
	skeleton = _rig.find_child("GeneralSkeleton", true, false) as Skeleton3D
	for ap in _rig.find_children("*", "AnimationPlayer", true, false):
		ap.free()
	_graft(ROOT + "outfits/%s_%s_Legs.gltf" % [sex, slot_outfit.call("legs")])
	_graft(ROOT + "outfits/%s_%s_Arms.gltf" % [sex, slot_outfit.call("arms")])
	var feet := String(slot_outfit.call("feet"))
	_graft(ROOT + "outfits/%s_%s_%s.gltf" % [sex, feet, "Feet_Boots" if feet == "Ranger" and not female else "Feet"])
	if bool(look.get("hood", false)):
		_graft(ROOT + "outfits/%s_Ranger_Head_Hood.gltf" % sex)
	if bool(look.get("pauldron", false)):
		_graft(ROOT + "outfits/%s_Ranger_Acc_%s.gltf" % [sex, "Pauldrons" if female else "Pauldron"])
	if String(look.get("head", "")) != "none":
		_add_head(sex)
		var hair := String(look.get("hair", ""))
		if HAIR.has(hair) and not bool(look.get("hood", false)):
			_graft(ROOT + "hair/%s.gltf" % (("Hair_BuzzedFemale" if female and hair == "buzzed" else HAIR[hair])))
		if bool(look.get("beard", false)):
			_graft(ROOT + "hair/Hair_Beard.gltf")
	_tint_all()
	if Settings.low_detail():
		for n in skeleton.find_children("*", "MeshInstance3D", true, false):
			(n as MeshInstance3D).layers = Builder.PEOPLE_LAYER
		Builder.simplify_materials(self)
	scale = Vector3.ONE * float(look.get("height", 1.0))
	anim = AnimationPlayer.new()
	anim.name = "AnimationPlayer"
	_rig.add_child(anim)
	anim.root_node = NodePath("..")
	anim.add_animation_library("", library())
	anim.root_motion_track = NodePath("%GeneralSkeleton:Root")
	idle_anim = String(look.get("idle", "Idle"))
	play(idle_anim, 0.0)
	# Start each person at a different point in their idle, so a room of
	# people never breathes in step.
	if anim.has_animation(idle_anim):
		anim.seek(randf() * anim.get_animation(idle_anim).length, true)
	update_every = update_every   # applies the process mode now that the player exists


## Lighter graphics, for people far from the player: the current pose is baked
## into plain meshes once, and the skinned ones (which cost the most to draw
## without a graphics card) are hidden until the person is near again.
var frozen := false
var _twins: Array[MeshInstance3D] = []


func set_frozen(on: bool) -> void:
	if on == frozen or skeleton == null or not can_freeze():
		return
	var skinned := _skinned_meshes()
	if on:
		skeleton.force_update_all_bone_transforms()
		var posed: Array[ArrayMesh] = []
		for i in skinned.size():
			var reuse: ArrayMesh = _twins[i].mesh as ArrayMesh if i < _twins.size() else null
			var baked := skinned[i].bake_mesh_from_current_skeleton_pose(reuse)
			if baked == null:
				return   # the renderer can't pose it (no skin registered yet): stay animated
			posed.append(baked)
		if _twins.is_empty():
			for mi in skinned:
				var twin := MeshInstance3D.new()
				twin.name = mi.name + "_Posed"
				twin.transform = mi.transform
				twin.skeleton = NodePath("")
				twin.layers = mi.layers
				skeleton.add_child(twin)
				_twins.append(twin)
		for i in skinned.size():
			_twins[i].mesh = posed[i]
			for s in posed[i].get_surface_count():
				_twins[i].set_surface_override_material(s, skinned[i].get_active_material(s))
	frozen = on
	for mi in skinned:
		mi.visible = not on
	for twin in _twins:
		twin.visible = on


## Posing needs a renderer that registers skins (not the headless one).
static func can_freeze() -> bool:
	return DisplayServer.get_name() != "headless"


func _skinned_meshes() -> Array[MeshInstance3D]:
	var out: Array[MeshInstance3D] = []
	for n in skeleton.get_children():
		if n is MeshInstance3D and (n as MeshInstance3D).skin != null:
			out.append(n as MeshInstance3D)
	return out


func _process(delta: float) -> void:
	if update_every <= 0.0 or anim == null or frozen:
		return
	_since_update += delta
	if _since_update >= update_every:
		anim.advance(_since_update)
		_since_update = 0.0


static func library() -> AnimationLibrary:
	if _library == null:
		var inst: Node = (load(LIBRARY) as PackedScene).instantiate()
		var ap := inst.find_child("AnimationPlayer", true, false) as AnimationPlayer
		_library = ap.get_animation_library("")
		for anim_name in LOOPING:
			if _library.has_animation(anim_name):
				_library.get_animation(anim_name).loop_mode = Animation.LOOP_LINEAR
		inst.free()
	return _library


func play(anim_name: String, blend := 0.3) -> void:
	if anim == null or not anim.has_animation(anim_name):
		return
	if anim.current_animation != anim_name:
		anim.play(anim_name, blend)


## Picks idle, walk or jog from how fast the owner is moving (m/s).
func move_speed(speed: float) -> void:
	if speed < 0.15:
		play(idle_anim)
	elif speed < 3.0:
		play("Walk")
		anim.speed_scale = clampf(speed / 1.6, 0.6, 1.6)
		return
	else:
		play("Jog_Fwd")
		anim.speed_scale = clampf(speed / 3.6, 0.8, 1.4)
		return
	anim.speed_scale = 1.0


## A node that follows a bone (for hats, a squid head, a raven on a shoulder).
## In the humanoid profile +Y runs along the bone and +Z faces forward.
func attach(bone: String) -> Node3D:
	var ba := BoneAttachment3D.new()
	ba.bone_name = bone
	skeleton.add_child(ba)
	return ba


# ---------------------------------------------------------------- building

func _instance(path: String) -> Node3D:
	return (load(path) as PackedScene).instantiate() as Node3D


## Moves every mesh of a part scene onto this character's skeleton. Skins bind
## by bone name, and every part shares the same retargeted bone names.
func _graft(path: String) -> void:
	if not ResourceLoader.exists(path):
		push_warning("CharacterModel: missing part " + path)
		return
	var inst := _instance(path)
	for mi in inst.find_children("*", "MeshInstance3D", true, false):
		mi.get_parent().remove_child(mi)
		mi.owner = null
		skeleton.add_child(mi)
		(mi as MeshInstance3D).skeleton = NodePath("..")
	inst.free()


## The base body's head and neck (the outfits bring their own arms and hands),
## with its eyes and brows.
func _add_head(sex: String) -> void:
	var inst := _instance(ROOT + "base/Superhero_%s_FullBody.gltf" % sex)
	for n in inst.find_children("*", "MeshInstance3D", true, false):
		var mi := n as MeshInstance3D
		mi.get_parent().remove_child(mi)
		mi.owner = null
		if mi.name.begins_with("SuperHero") or mi.name.begins_with("Superhero"):
			mi.mesh = _head_mesh(sex, mi.mesh as ArrayMesh, mi.skin, inst.find_child("GeneralSkeleton", true, false) as Skeleton3D)
			mi.name = "Head"
		skeleton.add_child(mi)
		mi.skeleton = NodePath("..")
	inst.free()


## Keeps the triangles of the base body that the neck and head carry.
static func _head_mesh(key: String, body: ArrayMesh, skin: Skin, skel: Skeleton3D) -> ArrayMesh:
	if _heads.has(key):
		return _heads[key]
	var head_bones := {}
	var stack := [skel.find_bone("Neck")]
	while not stack.is_empty():
		var b: int = stack.pop_back()
		if b < 0:
			continue
		head_bones[skel.get_bone_name(b)] = true
		stack.append_array(skel.get_bone_children(b))
	var bind_is_head := PackedByteArray()
	bind_is_head.resize(skin.get_bind_count())
	for i in skin.get_bind_count():
		var bname := String(skin.get_bind_name(i))
		if bname.is_empty():
			bname = skel.get_bone_name(skin.get_bind_bone(i))
		bind_is_head[i] = 1 if head_bones.has(bname) else 0
	var out := ArrayMesh.new()
	for s in body.get_surface_count():
		var arrays := body.surface_get_arrays(s)
		var verts: PackedVector3Array = arrays[Mesh.ARRAY_VERTEX]
		var bones: PackedInt32Array = arrays[Mesh.ARRAY_BONES]
		var weights: PackedFloat32Array = arrays[Mesh.ARRAY_WEIGHTS]
		var per := weights.size() / maxi(verts.size(), 1)
		var head_w := PackedFloat32Array()
		head_w.resize(verts.size())
		for v in verts.size():
			var w := 0.0
			for k in per:
				if bind_is_head[bones[v * per + k]] == 1:
					w += weights[v * per + k]
			head_w[v] = w
		var src: PackedInt32Array = arrays[Mesh.ARRAY_INDEX]
		var kept := PackedInt32Array()
		for t in range(0, src.size(), 3):
			if head_w[src[t]] + head_w[src[t + 1]] + head_w[src[t + 2]] >= 2.0:
				kept.append(src[t])
				kept.append(src[t + 1])
				kept.append(src[t + 2])
		for c in [Mesh.ARRAY_CUSTOM0, Mesh.ARRAY_CUSTOM1, Mesh.ARRAY_CUSTOM2, Mesh.ARRAY_CUSTOM3]:
			arrays[c] = null   # extra glTF channels the materials never read
		# Keep only the vertices the head uses, so skinning doesn't carry the whole body.
		var remap := PackedInt32Array()
		remap.resize(verts.size())
		remap.fill(-1)
		var order := PackedInt32Array()
		for i in kept.size():
			var old := kept[i]
			if remap[old] < 0:
				remap[old] = order.size()
				order.append(old)
			kept[i] = remap[old]
		for a in Mesh.ARRAY_MAX:
			if a != Mesh.ARRAY_INDEX and arrays[a] != null:
				arrays[a] = _gather(arrays[a], order, verts.size())
		arrays[Mesh.ARRAY_INDEX] = kept
		var flags := Mesh.ARRAY_FLAG_USE_8_BONE_WEIGHTS if per == 8 else 0
		out.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays, [], {}, flags)
		out.surface_set_material(out.get_surface_count() - 1, body.surface_get_material(s))
	_heads[key] = out
	return out


## The elements of a per-vertex array for the vertices in order (each vertex
## may own several elements: 4 tangent floats, 4 or 8 bone weights).
static func _gather(values: Variant, order: PackedInt32Array, vertex_count: int) -> Variant:
	var out: Variant = values.duplicate()
	out.resize(0)
	var per: int = values.size() / maxi(vertex_count, 1)
	for v in order:
		for k in per:
			out.append(values[v * per + k])
	return out


## Skin, hair and cloth tints, and the second outfit texture when asked for.
func _tint_all() -> void:
	var skin_tint := Builder.color(String(look.get("skin", "#ffffff")), Color.WHITE)
	# The hair textures are grey, made for tinting: this brings the hex out as written.
	var hair_hex := Builder.color(String(look.get("hair_color", "#4a3426")), Color(0.29, 0.2, 0.15))
	var hair_tint := Color(hair_hex.r * 1.78, hair_hex.g * 1.78, hair_hex.b * 1.78)
	var cloth_tint := Builder.color(String(look.get("cloth", "#ffffff")), Color.WHITE)
	var variant := String(look.get("cloth_variant", ""))
	for n in skeleton.find_children("*", "MeshInstance3D", true, false):
		var mi := n as MeshInstance3D
		for s in mi.mesh.get_surface_count():
			var base := mi.get_active_material(s) as BaseMaterial3D
			if base == null:
				continue
			var mname := base.resource_name.to_lower()
			var tint := cloth_tint
			var texture := ""
			if "regular" in mname or "superhero" in mname or "skin" in mname:
				tint = skin_tint
			elif "hair" in mname or "brow" in mname or "beard" in mname:
				tint = hair_tint
			elif "eye" in mname:
				continue
			elif not variant.is_empty() and ("peasant" in mname or "ranger" in mname):
				texture = _variant_texture("Peasant" if "peasant" in mname else "Ranger", variant)
			if tint == Color.WHITE and texture.is_empty():
				continue
			mi.set_surface_override_material(s, _tinted(base, tint, texture))


## "2" is the kit's own second texture (Peasant_2, Ranger_3); any other name is
## a dyed copy from tools/make_outfit_variants.py. Missing files keep the original.
static func _variant_texture(outfit: String, variant: String) -> String:
	if variant == "2":
		return ROOT + "outfits/T_%s_BaseColor.png" % ("Peasant_2" if outfit == "Peasant" else "Ranger_3")
	var path := ROOT + "outfits/variants/T_%s_%s.jpg" % [outfit, variant]
	return path if ResourceLoader.exists(path) else ""


static func _tinted(base: BaseMaterial3D, tint: Color, texture: String) -> BaseMaterial3D:
	var key := "%d|%s|%s" % [base.get_instance_id(), tint.to_html(), texture]
	if _materials.has(key):
		return _materials[key]
	var m := base.duplicate() as BaseMaterial3D
	m.albedo_color = base.albedo_color * tint
	if not texture.is_empty() and ResourceLoader.exists(texture):
		m.albedo_texture = load(texture)
	_materials[key] = m
	return m
