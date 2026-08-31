extends Node
## GameManager.gd (Autoload Singleton)
## Tracks the player's overall game state across all mini-games.
## Handles stone rewards, game completion, Fae Kingdom access.
## Routes audio and Steam achievements through AudioManager and SteamManager.

# === Player State ===
var player_id: String = ""  # Set when Steam initializes
var player_name: String = "Traveler"

var stones_collected: Array[String] = []
var games_completed: Array[String] = []
var fae_reputation: Dictionary = {
	"seelie": 0,
	"unseelie": 0
}
var areas_unlocked: Array[String] = ["main_floor"]
var visited_zones: Array[String] = []
var current_zone: String = "main_floor"

# === Game Registry ===
const GAME_REWARDS := {
	"standing_stones": {
		"stone_name": "Preseli Blue Stone",
		"stone_id": "",
		"unlocks": "fae_kingdom_portal",
		"achievement": "standing_stones_master",
		"leaderboard": "standing_stones",
		"description": "The bluestones of Stonehenge, carried from the Preseli Hills of Wales. Completing this game ignites the Fae Kingdom portal."
	},
	"tomb_tunnel": {
		"stone_name": "Lapis Lazuli",
		"stone_id": "",
		"unlocks": "",
		"achievement": "tomb_tunnel_master",
		"leaderboard": "tomb_tunnel",
		"description": "The stone of Egyptian royalty, won by excavating the tombs of pharaohs."
	},
	"andean_run": {
		"stone_name": "Blue Opal",
		"stone_id": "",
		"unlocks": "",
		"achievement": "andean_run_master",
		"leaderboard": "andean_run",
		"description": "Andean blue opal, earned by outrunning the spirits of the Sacred Valley."
	},
	"monster_of_the_deep": {
		"stone_name": "Freshwater Pearl",
		"stone_id": "",
		"unlocks": "water_monster_select",
		"achievement": "monster_deep_survivor",
		"leaderboard": "monster_deep",
		"description": "A pearl from the depths, earned by becoming the monster of the loch."
	},
	"hollow_men": {
		"stone_name": "Obsidian",
		"stone_id": "",
		"unlocks": "shadow_inn",
		"achievement": "hollow_men_complete",
		"leaderboard": "hollow_men",
		"description": "Volcanic glass from the deepest mines, earned by facing the Hollow Men."
	},
	"sandfall": {
		"stone_name": "Desert Rose Selenite",
		"stone_id": "",
		"unlocks": "bone_room_access",
		"achievement": "",
		"leaderboard": "",
		"description": "The stone that blooms in sand. Earned by descending through seven levels of simplification into the geode."
	},
	"tumble_run": {
		"stone_name": "Crystal Note",
		"stone_id": "",
		"unlocks": "",
		"achievement": "",
		"leaderboard": "tumble_run",
		"description": "A living crystal note from the Song, earned by tumbling through the Inn."
	}
}

# === Signals ===
signal stone_earned(stone_name: String)
signal game_completed(game_id: String)
signal fae_kingdom_unlocked()
signal area_unlocked(area_name: String)
signal zone_entered(zone_name: String)
signal achievement_unlocked(achievement_id: String)

func _ready() -> void:
	# Connect to APIManager signals
	APIManager.progress_loaded.connect(_on_progress_loaded)
	print("[GameManager] Initialized — player: %s" % player_name)

## Called when a game is completed
func complete_game(game_id: String, score: int) -> void:
	var was_first_completion = not game_id in games_completed
	
	if was_first_completion:
		games_completed.append(game_id)
	
	# === Stone Reward ===
	var reward = GAME_REWARDS.get(game_id, {})
	if was_first_completion and reward.has("stone_name") and not reward["stone_name"] in stones_collected:
		stones_collected.append(reward["stone_name"])
		stone_earned.emit(reward["stone_name"])
		
		# Audio: achievement stinger + stone chime
		if AudioManager:
			AudioManager.play_stinger("standing_stones_level_up")
			await get_tree().create_timer(0.3).timeout
			AudioManager.play_stone_chime(reward["stone_name"].to_lower().replace(" ", "_"))
		
		# Steam: first stone achievement
		if stones_collected.size() == 1 and SteamManager:
			SteamManager.unlock_achievement("first_stone")
		elif stones_collected.size() == 10 and SteamManager:
			SteamManager.unlock_achievement("stone_collector_10")
		elif stones_collected.size() == 50 and SteamManager:
			SteamManager.unlock_achievement("stone_collector_50")
		elif stones_collected.size() == 100 and SteamManager:
			SteamManager.unlock_achievement("stone_collector_100")
		elif stones_collected.size() == 198 and SteamManager:
			SteamManager.unlock_achievement("stone_collector_all")
	
	# === Area Unlock ===
	if was_first_completion and reward.has("unlocks") and reward["unlocks"] != "":
		if not reward["unlocks"] in areas_unlocked:
			areas_unlocked.append(reward["unlocks"])
			area_unlocked.emit(reward["unlocks"])
			
			# Audio: portal ignition sound
			if AudioManager:
				AudioManager.play_stinger("fae_portal_ignition")
			
			# Special: Fae Kingdom portal unlock
			if reward["unlocks"] == "fae_kingdom_portal":
				fae_kingdom_unlocked.emit()
				if SteamManager:
					SteamManager.unlock_achievement("fae_portal_opened")
	
	# === Steam Achievement ===
	if was_first_completion and reward.has("achievement") and reward["achievement"] != "" and SteamManager:
		SteamManager.unlock_achievement(reward["achievement"])
		achievement_unlocked.emit(reward["achievement"])
	
	# === Steam Leaderboard ===
	if reward.has("leaderboard") and reward["leaderboard"] != "" and SteamManager:
		SteamManager.submit_score(score, reward["leaderboard"])
	
	# === First game achievement ===
	if was_first_completion and games_completed.size() == 1 and SteamManager:
		SteamManager.unlock_achievement("first_game")
	
	# === Save to Base44 ===
	APIManager.save_player_progress(
		player_id,
		stones_collected,
		games_completed,
		fae_reputation,
		areas_unlocked
	)
	
	# === Save locally ===
	if SaveManager:
		SaveManager.complete_game(game_id)
	
	# === Audio: game completion UI sound ===
	if AudioManager and not was_first_completion:
		AudioManager.play_ui_sound("achievement")
	
	game_completed.emit(game_id)

## Called when the player enters a new zone
func enter_zone(zone_name: String) -> void:
	if current_zone == zone_name:
		return
	
	current_zone = zone_name
	
	if not zone_name in visited_zones:
		visited_zones.append(zone_name)
		
		# Audio: zone transition (crossfade ambient)
		if AudioManager:
			AudioManager.play_zone_ambient(zone_name)
			AudioManager.play_ui_sound("portal")
		
		# Steam: all zones achievement
		if visited_zones.size() >= 37 and SteamManager:
			SteamManager.unlock_achievement("all_zones_unlocked")
		
		if SaveManager:
			SaveManager.visit_zone(zone_name)
	
	zone_entered.emit(zone_name)

## Adjust Fae reputation
func adjust_fae_reputation(court: String, amount: int) -> void:
	if fae_reputation.has(court):
		fae_reputation[court] += amount
		fae_reputation[court] = max(fae_reputation[court], 0)
		
		# Audio: subtle chime for reputation gain
		if AudioManager and amount > 0:
			AudioManager.play_stone_chime("labradorite", -12.0)
		
		# Steam: reputation achievements
		if fae_reputation["seelie"] >= 100 and SteamManager:
			SteamManager.unlock_achievement("seelie_ally")
		if fae_reputation["unseelie"] >= 100 and SteamManager:
			SteamManager.unlock_achievement("unseelie_ally")

## Has the player unlocked the Fae Kingdom?
func is_fae_kingdom_unlocked() -> bool:
	return "fae_kingdom_portal" in areas_unlocked

## Has the player completed a specific game?
func has_completed_game(game_id: String) -> bool:
	return game_id in games_completed

## Add a stone directly (from exploration, not games)
func add_stone(stone_name: String) -> void:
	if not stone_name in stones_collected:
		stones_collected.append(stone_name)
		stone_earned.emit(stone_name)
		
		if AudioManager:
			AudioManager.play_stone_chime(stone_name.to_lower().replace(" ", "_"))
		
		if SaveManager:
			SaveManager.add_stone(stone_name)
		
		# Stone count achievements
		if SteamManager:
			match stones_collected.size():
				1: SteamManager.unlock_achievement("first_stone")
				10: SteamManager.unlock_achievement("stone_collector_10")
				50: SteamManager.unlock_achievement("stone_collector_50")
				100: SteamManager.unlock_achievement("stone_collector_100")
				198: SteamManager.unlock_achievement("stone_collector_all")

## Load progress from Base44
func load_progress() -> void:
	if player_id == "":
		return
	APIManager.load_player_progress(player_id)

func _on_progress_loaded(progress: Dictionary) -> void:
	if progress.is_empty():
		return
	
	if progress.has("stonesCollected"):
		stones_collected = progress["stonesCollected"]
	if progress.has("gamesCompleted"):
		games_completed = progress["gamesCompleted"]
	if progress.has("faeReputation"):
		fae_reputation = progress["faeReputation"]
	if progress.has("areasUnlocked"):
		areas_unlocked = progress["areasUnlocked"]
	if progress.has("visitedZones"):
		visited_zones = progress["visitedZones"]
	
	print("[GameManager] Progress loaded: %d stones, %d games, %d zones" % [stones_collected.size(), games_completed.size(), visited_zones.size()])
