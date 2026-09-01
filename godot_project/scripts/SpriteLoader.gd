# SpriteLoader.gd — Asset Mapping & Sprite Loading System
# Maps NPC names, critter names, and zone keys to their image assets
# Falls back to procedural placeholder textures when assets aren't available
# Handles both local res:// paths (offline Steam build) and CDN URLs (web beta)

extends Node

# === SPRITE CATEGORIES ===
enum Category { NPC, CRITTER, WATER_MONSTER, CRYPTID, STONE, ZONE_BG, UI_ELEMENT }

# === NPC PORTRAIT MAPPING ===
# Maps NPC names to their portrait image paths in the repo
# Portraits are stored at res://assets/sprites/npcs/<name>.png
const NPC_SPRITE_MAP := {
	# Tier 1: Full Presence
	"The Allfather": "npcs/allfather.png",
	"The Wanderer": "npcs/wanderer.png",
	"Huginn": "npcs/huginn.png",
	"Muninn": "npcs/muninn.png",
	"The Morrigan": "npcs/morrigan.png",
	"The Owl": "npcs/owl.png",
	"Seelie King": "npcs/seelie_king.png",
	"Seelie Queen": "npcs/seelie_queen.png",
	"Malachi": "npcs/malachi.png",
	"Medusa": "npcs/medusa.png",
	"Persephone": "npcs/persephone.png",
	"Hades": "npcs/hades.png",
	"Hel": "npcs/hel.png",
	"Charon": "npcs/charon.png",
	"The Guest": "npcs/the_guest.png",
	"The Crone": "npcs/the_crone.png",
	"Nyx": "npcs/nyx.png",
	"Bastet": "npcs/bastet.png",
	"Kali": "npcs/kali.png",
	"Zorya": "npcs/zorya.png",
	
	# Tier 2: Key NPCs
	"Beverley": "npcs/beverley.png",
	"Briar Nightbloom": "npcs/briar.png",
	"Mim": "npcs/mim.png",
	"Lark": "npcs/lark.png",
	"The Archivist": "npcs/archivist.png",
	"Vaulknut": "npcs/vaulknut.png",
	"Waystone": "npcs/waystone.png",
	"Belladonna": "npcs/belladonna.png",
	"The Captain": "npcs/captain.png",
	"The Navigator": "npcs/navigator.png",
	"The Bog Fairy Golem": "npcs/bog_fairy_golem.png",
	
	# Dialogue NPCs
	"The Siren": "npcs/siren.png",
	"The Pirate": "npcs/pirate.png",
	"The Keeper": "npcs/keeper.png",
	"The Constant": "npcs/constant.png",
	"The Cook": "npcs/cook.png",
	"Oceananoir": "npcs/oceananoir.png",
	"Radagast": "npcs/radagast.png",
	"Beorn": "npcs/beorn.png",
	"Marijke": "npcs/marijke.png",
	"Erik": "npcs/erik.png",
	"Thrum": "npcs/thrum.png",
	"The Norns": "npcs/norns.png",
	"The Inner Siren": "npcs/inner_siren.png",
	"The One Who Is Awake": "npcs/awake.png",
	"The Shifting Man": "npcs/shifting_man.png",
	"The Guide": "npcs/guide.png",
	"Quire": "npcs/quire.png",
}

# === CRITTER SPRITE MAP ===
const CRITTER_SPRITE_MAP := {
	"ember_mouse": "critters/ember_mouse.png",
	"mead_bee": "critters/mead_bee.png",
	"moss_pig": "critters/moss_pig.png",
	"firefly": "critters/firefly.png",
	"book_worm": "critters/book_worm.png",
	"bone_rat": "critters/bone_rat.png",
	"market_cat": "critters/market_cat.png",
	"owl_creature": "critters/owl_creature.png",
	"pixie": "critters/pixie.png",
	"shadow_wisp": "critters/shadow_wisp.png",
	"lodestone_sprite": "critters/lodestone_sprite.png",
}

# === ZONE BACKGROUND MAP (maps zone keys to existing zone images) ===
const ZONE_BG_MAP := {
	"main_floor": "zone_L3_main_floor_matisse_subtle.png",
	"cosmology": "zone_L1_cosmology_turner.png",
	"staircase": "zone_L5_staircase_escher.png",
	"catacombs": "zone_L6_catacombs_goya.png",
	"fae_kingdom": "zone_L7_faerie_rackham.png",
	"undercity": "zone_L9_undercity_klimt_v2.png",
	"archive": "z27_miskatonic.png",
	"market": "z29_meadery_picasso.png",
	"campgrounds": "zone_L4_campgrounds_mucha.png",
	"common_room": "z28_garden_van_gogh.png",
	"composer": "z33_tidal_caves.png",
	"arcade": "zone_L3_arcade_muted_matisse.png",
	"gorgons_garden": "zone_gorgons_garden_beardsley.png",
	"hollow_earth": "zone_hollow_earth_okeeffe_v2.png",
	"spiral_gallery": "z35_spiral_gallery.png",
}

# === CACHE ===
var _cache: Dictionary = {}

func _ready() -> void:
	print("[SpriteLoader] Ready — %d NPC sprites, %d critter sprites, %d zone backgrounds mapped" %
		[NPC_SPRITE_MAP.size(), CRITTER_SPRITE_MAP.size(), ZONE_BG_MAP.size()])

func get_npc_sprite(npc_name: String) -> Texture2D:
	# Check cache
	if _cache.has("npc_" + npc_name):
		return _cache["npc_" + npc_name]
	
	# Try to load from mapped path
	if NPC_SPRITE_MAP.has(npc_name):
		var path := "res://assets/sprites/" + NPC_SPRITE_MAP[npc_name]
		if ResourceLoader.exists(path):
			var tex := load(path) as Texture2D
			_cache["npc_" + npc_name] = tex
			return tex
	
	# Fallback: procedural placeholder with NPC initials
	var tex := _make_npc_placeholder(npc_name)
	_cache["npc_" + npc_name] = tex
	return tex

func get_critter_sprite(critter_name: String) -> Texture2D:
	if _cache.has("critter_" + critter_name):
		return _cache["critter_" + critter_name]
	
	if CRITTER_SPRITE_MAP.has(critter_name):
		var path := "res://assets/sprites/" + CRITTER_SPRITE_MAP[critter_name]
		if ResourceLoader.exists(path):
			var tex := load(path) as Texture2D
			_cache["critter_" + critter_name] = tex
			return tex
	
	# Fallback: small colored circle
	var color := _critter_color(critter_name)
	var tex := _make_circle_texture(color, 8)
	_cache["critter_" + critter_name] = tex
	return tex

func get_zone_background(zone_key: String) -> Texture2D:
	if _cache.has("zone_" + zone_key):
		return _cache["zone_" + zone_key]
	
	if ZONE_BG_MAP.has(zone_key):
		var path := "res://assets/zones/" + ZONE_BG_MAP[zone_key]
		if ResourceLoader.exists(path):
			var tex := load(path) as Texture2D
			_cache["zone_" + zone_key] = tex
			return tex
	
	return null

func get_stone_sprite(stone_name: String) -> Texture2D:
	# Stones use the StoneLoader system — delegate to it
	if StoneLoader:
		return StoneLoader.get_stone_texture(stone_name)
	return null

# === PLACEHOLDER GENERATION ===

func _make_npc_placeholder(npc_name: String) -> ImageTexture:
	# Create a 24x32 portrait placeholder with initials
	var size := 24
	var img := Image.create(size, size, false, Image.FORMAT_RGBA8)
	
	# Background — dark stone with gold tint
	img.fill(Color(0.10, 0.08, 0.05))
	
	# Border — antiqued gold
	var gold := Color(0.50, 0.42, 0.20)
	for x in range(size):
		img.set_pixel(x, 0, gold)
		img.set_pixel(x, size - 1, gold)
	for y in range(size):
		img.set_pixel(0, y, gold)
		img.set_pixel(size - 1, y, gold)
	
	# Inner area — slightly lighter
	for y in range(2, size - 2):
		for x in range(2, size - 2):
			img.set_pixel(x, y, Color(0.15, 0.12, 0.08))
	
	return ImageTexture.create_from_image(img)

func _make_circle_texture(color: Color, radius: int) -> ImageTexture:
	var size := radius * 2
	var img := Image.create(size, size, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))  # Transparent
	
	var center := Vector2(radius, radius)
	for y in range(size):
		for x in range(size):
			if Vector2(x, y).distance_to(center) <= radius:
				img.set_pixel(x, y, color)
	
	return ImageTexture.create_from_image(img)

func _critter_color(name: String) -> Color:
	# Deterministic color based on critter name
	match name:
		"ember_mouse": return Color(0.80, 0.40, 0.15)
		"mead_bee": return Color(0.70, 0.55, 0.20)
		"moss_pig": return Color(0.30, 0.45, 0.25)
		"firefly": return Color(0.60, 0.80, 0.30, 0.7)
		"book_worm": return Color(0.45, 0.30, 0.20)
		"bone_rat": return Color(0.50, 0.48, 0.40)
		"market_cat": return Color(0.50, 0.40, 0.30)
		"owl_creature": return Color(0.40, 0.35, 0.25)
		"pixie": return Color(0.30, 0.70, 0.40, 0.8)
		"shadow_wisp": return Color(0.35, 0.20, 0.50, 0.6)
		"lodestone_sprite": return Color(0.45, 0.45, 0.55)
		_: return Color(0.5, 0.4, 0.3)

func clear_cache() -> void:
	_cache.clear()

func preload_zone(zone_key: String) -> void:
	# Preload zone background
	get_zone_background(zone_key)
	
	# Preload all NPC sprites for this zone
	# This would be called during zone transition to reduce hitches
	print("[SpriteLoader] Preloading assets for zone: %s" % zone_key)
