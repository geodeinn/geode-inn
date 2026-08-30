extends Node
## GameManager.gd (Autoload Singleton)
## Tracks the player's overall game state across all mini-games.
## Handles stone rewards, game completion, and Fae Kingdom access.

# === Player State ===
var player_id: String = ""  # Set when Steam initializes (e.g., "steam_76561198...")
var player_name: String = "Traveler"

var stones_collected: Array[String] = []      # Stone entity IDs
var games_completed: Array[String] = []         # Game identifiers (e.g., "standing_stones")
var fae_reputation: Dictionary = {
	"seelie": 0,
	"unseelie": 0
}
var areas_unlocked: Array[String] = ["main_floor"]

# === Game Registry ===
# Maps game IDs to their reward stones and unlock requirements
const GAME_REWARDS := {
	"standing_stones": {
		"stone_name": "Preseli Blue Stone",
		"stone_id": "",  # Will be populated from API
		"unlocks": "fae_kingdom_portal",
		"description": "The bluestones of Stonehenge, carried from the Preseli Hills of Wales. Completing this game ignites the Fae Kingdom portal."
	},
	"tomb_tunnel": {
		"stone_name": "Lapis Lazuli",
		"stone_id": "",
		"unlocks": "",
		"description": "The stone of Egyptian royalty, won by excavating the tombs of pharaohs."
	},
	"andean_run": {
		"stone_name": "Blue Opal",
		"stone_id": "",
		"unlocks": "",
		"description": "Andean blue opal, earned by outrunning the spirits of the Sacred Valley."
	},
	"monster_of_the_deep": {
		"stone_name": "Freshwater Pearl",
		"stone_id": "",
		"unlocks": "water_monster_select",
		"description": "A pearl from the depths, earned by becoming the monster of the loch."
	},
	"sandfall": {
		"stone_name": "Desert Rose Selenite",
		"stone_id": "",
		"unlocks": "bone_room_access",
		"description": "The stone that blooms in sand. Earned by descending through seven levels of simplification into the geode."
	}
}

signal stone_earned(stone_name: String)
signal game_completed(game_id: String)
signal fae_kingdom_unlocked()
signal area_unlocked(area_name: String)

func _ready() -> void:
	# Connect to APIManager signals
	APIManager.progress_loaded.connect(_on_progress_loaded)

## Called when a game is completed
func complete_game(game_id: String, score: int) -> void:
	if game_id in games_completed:
		# Already completed — just update score if needed
		return
	
	games_completed.append(game_id)
	
	# Check for stone reward
	var reward = GAME_REWARDS.get(game_id, {})
	if reward.has("stone_name") and not reward["stone_name"] in stones_collected:
		stones_collected.append(reward["stone_name"])
		stone_earned.emit(reward["stone_name"])
	
	# Check for area unlock
	if reward.has("unlocks") and reward["unlocks"] != "":
		if not reward["unlocks"] in areas_unlocked:
			areas_unlocked.append(reward["unlocks"])
			area_unlocked.emit(reward["unlocks"])
			
			# Special: Fae Kingdom portal unlock
			if reward["unlocks"] == "fae_kingdom_portal":
				fae_kingdom_unlocked.emit()
	
	# Save to Base44
	APIManager.save_player_progress(
		player_id,
		stones_collected,
		games_completed,
		fae_reputation,
		areas_unlocked
	)
	
	game_completed.emit(game_id)

## Adjust Fae reputation (gained in Fae Kingdom quests)
func adjust_fae_reputation(court: String, amount: int) -> void:
	if fae_reputation.has(court):
		fae_reputation[court] += amount
		fae_reputation[court] = max(fae_reputation[court], 0)  # Can't go below 0

## Has the player unlocked the Fae Kingdom?
func is_fae_kingdom_unlocked() -> bool:
	return "fae_kingdom_portal" in areas_unlocked

## Has the player completed a specific game?
func has_completed_game(game_id: String) -> bool:
	return game_id in games_completed

## Load progress from Base44 (called on startup)
func load_progress() -> void:
	if player_id == "":
		return
	APIManager.load_player_progress(player_id)

func _on_progress_loaded(progress: Dictionary) -> void:
	if progress.is_empty():
		return
	
	# Restore state from database
	if progress.has("stonesCollected"):
		stones_collected = progress["stonesCollected"]
	if progress.has("gamesCompleted"):
		games_completed = progress["gamesCompleted"]
	if progress.has("faeReputation"):
		fae_reputation = progress["faeReputation"]
	if progress.has("areasUnlocked"):
		areas_unlocked = progress["areasUnlocked"]
