## StoneLoader.gd — Offline-first stone asset loader for Geode Inn Steam apps
## All stone images are bundled locally in res://assets/stones/
## No external URLs. No network dependency. Full offline play.
extends Node

# Signal emitted when all stones are loaded
signal stones_loaded(stone_count: int)
signal stone_texture_loaded(stone_name: String, texture: Texture2D)

# Cache: stone_name -> Texture2D
var _stone_cache: Dictionary = {}
var _stone_manifest: Dictionary = {}
var _loaded_count: int = 0

func _ready() -> void:
	load_stone_manifest()

## Load the stone_local_paths.json manifest from local resources
func load_stone_manifest() -> void:
	var manifest_path := "res://assets/stones/stone_local_paths.json"
	if not ResourceLoader.exists(manifest_path):
		push_error("StoneLoader: Manifest not found at " + manifest_path)
		return
	
	var file := FileAccess.open(manifest_path, FileAccess.READ)
	if file == null:
		push_error("StoneLoader: Could not open manifest file")
		return
	
	var json_text := file.get_as_text()
	file.close()
	
	var json := JSON.new()
	var err := json.parse(json_text)
	if err != OK:
		push_error("StoneLoader: Failed to parse manifest JSON: " + json.get_error_message())
		return
	
	_stone_manifest = json.data
	print("StoneLoader: Manifest loaded with %d stones" % _stone_manifest.size())
	stones_loaded.emit(_stone_manifest.size())

## Get the local resource path for a stone by name
func get_stone_path(stone_name: String) -> String:
	return _stone_manifest.get(stone_name, "")

## Load a stone texture by name. Returns cached texture if available.
func load_stone_texture(stone_name: String) -> Texture2D:
	# Check cache first
	if _stone_cache.has(stone_name):
		return _stone_cache[stone_name]
	
	var path := get_stone_path(stone_name)
	if path.is_empty():
		push_warning("StoneLoader: No local path for stone '%s'" % stone_name)
		return null
	
	# Load the texture from local resources
	var texture := load(path) as Texture2D
	if texture == null:
		push_error("StoneLoader: Failed to load texture at '%s'" % path)
		return null
	
	# Cache it
	_stone_cache[stone_name] = texture
	_loaded_count += 1
	stone_texture_loaded.emit(stone_name, texture)
	return texture

## Preload all stone textures (call during loading screen)
func preload_all_stones() -> void:
	_loaded_count = 0
	for stone_name in _stone_manifest.keys():
		load_stone_texture(stone_name)
	print("StoneLoader: Preloaded %d/%d stone textures" % [_loaded_count, _stone_manifest.size()])

## Get all stone names
func get_all_stone_names() -> Array:
	return _stone_manifest.keys()

## Get loaded count
func get_loaded_count() -> int:
	return _loaded_count

## Check if a stone image exists locally
func has_stone_image(stone_name: String) -> bool:
	return _stone_manifest.has(stone_name) and not _stone_manifest[stone_name].is_empty()

## Clear the texture cache (useful for memory management)
func clear_cache() -> void:
	_stone_cache.clear()
	_loaded_count = 0
