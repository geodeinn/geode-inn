###
# Geode Inn — Steam Manager
# GodotSteam integration for Steam achievements, cloud saves, and leaderboards
# 
# Requires: GodotSteam addon (https://github.com/GodotSteam/GodotSteam)
# This is a stub — uncomment Steam calls when GodotSteam is installed
###

extends Node
signal achievement_unlocked(achievement_id: String)
signal leaderboard_score_submitted(score: int, game_id: String)

# Steam App ID — register at https://partner.steamgames.com
const STEAM_APP_ID = 0  # TODO: Register and fill in

# Achievement IDs (50+ designed — core ones here)
const ACHIEVEMENTS = {
	"first_stone": "Collected your first stone",
	"stone_collector_10": "Collected 10 stones",
	"stone_collector_50": "Collected 50 stones",
	"stone_collector_100": "Collected 100 stones",
	"stone_collector_all": "Collected all 198 stones",
	"first_game": "Played your first arcade game",
	"standing_stones_master": "Cleared level 20 in Standing Stones",
	"tomb_tunnel_master": "Reached the deepest tomb in Tomb Tunnel",
	"andean_run_master": "Ran 5000m in Andean Run",
	"monster_deep_survivor": "Survived 5 minutes against the Loch Ness creature",
	"hollow_men_complete": "Completed the Hollow Men",
	"fae_portal_opened": "Opened the first Fae Kingdom portal",
	"seelie_ally": "Reached Friendly reputation with the Seelie Court",
	"unseelie_ally": "Reached Friendly reputation with the Unseelie Court",
	"first_craft": "Crafted your first item",
	"builder_tier1": "Built a Tier 1 structure",
	"builder_tier5": "Built a Tier 5 structure",
	"song_heard": "Heard the 42Hz Song for the first time",
	"whisper_layer": "The Inn became aware of you",
	"final_room": "Reached the Final Room",
	"music_room_visited": "Visited the Music Room",
	"nine_songs_chord": "Played the Nine Songs Chord",
	"bead_composer_first": "Designed your first piece of jewelry",
	"egg_hatched": "Witnessed an Egg hatching",
	"comic_strip_featured": "Featured in the daily comic strip",
	"possum_mode": "Used Possum Mode for the first time",
	"shadow_entered": "Entered the Shadow Inn for the first time",
	"all_zones_unlocked": "Unlocked all 37 zones",
	"sentinel_vigil_complete": "Completed Lozen's Sentinel Vigil questline",
}

# Leaderboard IDs per game
const LEADERBOARDS = {
	"standing_stones": "Standing Stones High Score",
	"tomb_tunnel": "Tomb Tunnel Depth",
	"andean_run": "Andean Run Distance",
	"monster_deep": "Monster of the Deep Survival Time",
	"hollow_men": "Hollow Men Completion",
	"tumble_run": "Tumble Run High Score",
}

var _steam_initialized: bool = false

func _ready() -> void:
	# TODO: Uncomment when GodotSteam is installed
	# _steam_initialized = Steam.initialize(STEAM_APP_ID)
	# if _steam_initialized:
	#     Steam.connect("achievement_stored", _on_achievement_stored)
	#     Steam.connect("leaderboard_score_uploaded", _on_leaderboard_uploaded)
	#     print("[SteamManager] Steam initialized — App ID: %d" % STEAM_APP_ID)
	# else:
	#     print("[SteamManager] Steam not initialized — running in offline mode")
	print("[SteamManager] Stub mode — GodotSteam not yet installed")

# === Achievements ===

func unlock_achievement(achievement_id: String) -> bool:
	if not _steam_initialized:
		print("[SteamManager] Achievement unlocked (offline): %s" % achievement_id)
		achievement_unlocked.emit(achievement_id)
		return true
	
	# TODO: Uncomment when GodotSteam is installed
	# if Steam.set_achievement(achievement_id):
	#     Steam.store_stats()
	#     achievement_unlocked.emit(achievement_id)
	#     return true
	# return false
	return false

func get_achievement_progress(achievement_id: String) -> float:
	# TODO: Return progress for incremental achievements
	return 0.0

func _on_achievement_stored(achievement_id: String) -> void:
	print("[SteamManager] Achievement stored on Steam: %s" % achievement_id)

# === Leaderboards ===

func submit_score(score: int, game_id: String) -> void:
	if not LEADERBOARDS.has(game_id):
		print("[SteamManager] Unknown leaderboard: %s" % game_id)
		return
	
	if not _steam_initialized:
		print("[SteamManager] Score submitted (offline): %d for %s" % [score, game_id])
		leaderboard_score_submitted.emit(score, game_id)
		return
	
	# TODO: Uncomment when GodotSteam is installed
	# var leaderboard_name = LEADERBOARDS[game_id]
	# Steam.upload_score(leaderboard_name, score)

func _on_leaderboard_uploaded(success: bool, score: int) -> void:
	if success:
		print("[SteamManager] Leaderboard score uploaded: %d" % score)

# === Cloud Saves ===

func save_to_cloud(save_data: Dictionary) -> bool:
	if not _steam_initialized:
		return false
	
	# TODO: Uncomment when GodotSteam is installed
	# var json_string = JSON.stringify(save_data)
	# return Steam.file_write("geode_inn_save.json", json_string.to_utf8_buffer())
	return false

func load_from_cloud() -> Dictionary:
	if not _steam_initialized:
		return {}
	
	# TODO: Uncomment when GodotSteam is installed
	# if Steam.file_exists("geode_inn_save.json"):
	#     var data = Steam.file_read("geode_inn_save.json")
	#     var json_string = data.get_string_from_utf8()
	#     return JSON.parse_string(json_string)
	return {}

# === Rich Presence ===

func set_rich_presence(state: String, details: String = "") -> void:
	if not _steam_initialized:
		return
	
	# TODO: Uncomment when GodotSteam is installed
	# Steam.set_rich_presence("steam_display", state)
	# Steam.set_rich_presence("status", details)

# === Controller Haptics ===

func trigger_haptic_pulse(controller: int, duration_microseconds: int) -> void:
	if not _steam_initialized:
		return
	
	# TODO: Uncomment when GodotSteam is installed
	# Steam.trigger_haptic_pulse(controller, duration_microseconds)

func trigger_haptic_pattern(controller: int, on_ms: int, off_ms: int, repeat: int = 1) -> void:
	if not _steam_initialized:
		# Fallback to mobile vibration
		if OS.has_feature("mobile"):
			Input.vibrate_device(on_ms)
		return
	
	# TODO: Uncomment when GodotSteam is installed
	# for i in range(repeat):
	#     Steam.trigger_haptic_pulse(controller, on_ms * 1000)
	#     await get_tree().create_timer((on_ms + off_ms) / 1000.0).timeout
