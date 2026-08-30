extends Node
## APIManager.gd (Autoload Singleton)
## Handles all communication between the Godot game client and the Base44 backend.
## This script is set as an Autoload in Project Settings > AutoLoad.

# === Configuration ===
const BASE_URL: String = "https://base44.app/api/apps/{APP_ID}/entities"
# TODO: Replace {APP_ID} with the Geode Inn app ID: 6a60f218b0c6605c92fa35c4
# TODO: Set the auth token securely — do NOT hardcode in production.
#       For Steam, generate tokens server-side or use a signed Steam ID.
const APP_ID: String = "6a60f218b0c6605c92fa35c4"

var auth_token: String = ""  # Set this before making API calls

signal stones_loaded(stones: Array)
signal lore_loaded(lore: Array)
signal progress_saved(success: bool)
signal progress_loaded(progress: Dictionary)

func _ready() -> void:
	# Attempt to load token from user config
	auth_token = _load_token()

## Load the auth token from a local config file (placeholder — replace with secure method)
func _load_token() -> String:
	var config := ConfigFile.new()
	var err := config.load("user://geode_settings.cfg")
	if err == OK:
		return config.get_value("api", "token", "")
	return ""

## Save the auth token locally (placeholder)
func save_token(token: String) -> void:
	auth_token = token
	var config := ConfigFile.new()
	config.set_value("api", "token", token)
	config.save("user://geode_settings.cfg")

## Generic HTTP request helper
func _make_request(url: String, method: int, body: String = "") -> Dictionary:
	var http := HTTPRequest.new()
	add_child(http)
	
	var headers := PackedStringArray([
		"Authorization: Bearer " + auth_token,
		"Content-Type: application/json"
	])
	
	var err := http.request(url, headers, method, body)
	if err != OK:
		push_error("HTTP request failed to start: " + str(err))
		http.queue_free()
		return {"error": "request_failed"}
	
	var response: Array = await http.request_completed
	http.queue_free()
	
	var result_code: int = response[0]
	var response_code: int = response[1]
	var response_body: PackedByteArray = response[3]
	
	if result_code != HTTPRequest.RESULT_SUCCESS:
		push_error("HTTP request error: " + str(result_code))
		return {"error": "http_error", "code": result_code}
	
	var json := JSON.new()
	var parse_err := json.parse(response_body.get_string_from_utf8())
	if parse_err != OK:
		push_error("JSON parse error: " + json.get_error_message())
		return {"error": "json_parse_error"}
	
	return json.data if json.data is Dictionary else {"data": json.data}

# === Stone Entity ===

## Fetch all stones from the database (for geode cave, world map)
func get_stones(limit: int = 500) -> void:
	var url := BASE_URL.replace("{APP_ID}", APP_ID) + "/Stone?limit=" + str(limit)
	var result := await _make_request(url, HTTPClient.METHOD_GET)
	
	if result.has("error"):
		push_error("Failed to load stones: " + str(result))
		stones_loaded.emit([])
		return
	
	var stones: Array = result if result is Array else result.get("data", [])
	stones_loaded.emit(stones)

## Fetch a single stone by ID (when player clicks a crystal in the geode cave)
func get_stone(stone_id: String) -> Dictionary:
	var url := BASE_URL.replace("{APP_ID}", APP_ID) + "/Stone/" + stone_id
	var result := await _make_request(url, HTTPClient.METHOD_GET)
	
	if result.has("error"):
		push_error("Failed to load stone: " + str(result))
		return {}
	
	return result

# === Lore Entity ===

## Fetch all lore entries (for world map pins, creature data)
func get_lore(limit: int = 500) -> void:
	var url := BASE_URL.replace("{APP_ID}", APP_ID) + "/Lore?limit=" + str(limit)
	var result := await _make_request(url, HTTPClient.METHOD_GET)
	
	if result.has("error"):
		push_error("Failed to load lore: " + str(result))
		lore_loaded.emit([])
		return
	
	var lore: Array = result if result is Array else result.get("data", [])
	lore_loaded.emit(lore)

# === PlayerProgress Entity ===

## Save player progress after completing a game
func save_player_progress(player_id: String, stones_collected: Array, games_completed: Array, fae_reputation: Dictionary, areas_unlocked: Array) -> void:
	var url := BASE_URL.replace("{APP_ID}", APP_ID) + "/PlayerProgress"
	
	var body := JSON.stringify({
		"playerId": player_id,
		"stonesCollected": stones_collected,
		"gamesCompleted": games_completed,
		"faeReputation": fae_reputation,
		"areasUnlocked": areas_unlocked
	})
	
	var result := await _make_request(url, HTTPClient.METHOD_POST, body)
	
	if result.has("error"):
		push_error("Failed to save progress: " + str(result))
		progress_saved.emit(false)
		return
	
	progress_saved.emit(true)

## Load player progress
func load_player_progress(player_id: String) -> void:
	var url := BASE_URL.replace("{APP_ID}", APP_ID) + "/PlayerProgress?filter=playerId:" + player_id
	var result := await _make_request(url, HTTPClient.METHOD_GET)
	
	if result.has("error"):
		push_error("Failed to load progress: " + str(result))
		progress_loaded.emit({})
		return
	
	var progress: Dictionary = result if result is Dictionary else {}
	progress_loaded.emit(progress)

## Update player progress (when player wins a game and earns a new stone)
func update_player_progress(progress_id: String, update_data: Dictionary) -> void:
	var url := BASE_URL.replace("{APP_ID}", APP_ID) + "/PlayerProgress/" + progress_id
	
	var body := JSON.stringify(update_data)
	
	var result := await _make_request(url, HTTPClient.METHOD_PATCH, body)
	
	if result.has("error"):
		push_error("Failed to update progress: " + str(result))
		progress_saved.emit(false)
		return
	
	progress_saved.emit(true)
