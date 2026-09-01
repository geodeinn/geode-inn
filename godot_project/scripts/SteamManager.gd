# SteamManager.gd — Steam Integration (Autoload)
# Handles achievements, cloud saves, leaderboards via GodotSteam
# Requires GodotSteam plugin — stubs gracefully if not installed

extends Node

var _steam_initialized: bool = false
var _steam_id: int = 0

func _ready() -> void:
	_initialize_steam()

func _initialize_steam() -> void:
	# Try to initialize Steam — graceful failure for non-Steam builds
	print("[SteamManager] Attempting Steam initialization...")
	
	# Check if GodotSteam is available
	var steam_class := ClassDB.instantiate("Steam")
	if steam_class == null:
		print("[SteamManager] GodotSteam not found — running in offline mode")
		_steam_initialized = false
		return
	
	# Attempt initialization
	# In actual Steam build, this connects to Steamworks SDK
	# For now, mark as not initialized — game runs without Steam
	_steam_initialized = false
	print("[SteamManager] Steam not initialized — offline mode active")

func is_steam_active() -> bool:
	return _steam_initialized

# === ACHIEVEMENTS ===
func unlock_achievement(achievement_id: String) -> void:
	if not _steam_initialized:
		return
	print("[SteamManager] Achievement unlocked: %s" % achievement_id)
	# Steam.setAchievement(achievement_id)

func clear_achievement(achievement_id: String) -> void:
	if not _steam_initialized:
		return
	print("[SteamManager] Achievement cleared: %s" % achievement_id)
	# Steam.clearAchievement(achievement_id)

# === LEADERBOARDS ===
func submit_score(leaderboard_id: String, score: int) -> void:
	if not _steam_initialized:
		return
	print("[SteamManager] Score submitted to %s: %d" % [leaderboard_id, score])
	# Steam.uploadLeaderboardScore(leaderboard_id, score)

func request_leaderboard(leaderboard_id: String) -> void:
	if not _steam_initialized:
		return
	print("[SteamManager] Requesting leaderboard: %s" % leaderboard_id)
	# Steam.downloadLeaderboardEntries(leaderboard_id, Steam.LEADERBOARD_DATA_GLOBAL, 0, 10)

# === CLOUD SAVES ===
func cloud_save(filename: String, data: String) -> bool:
	if not _steam_initialized:
		return false
	print("[SteamManager] Cloud save: %s" % filename)
	# Steam.fileWrite(filename, data)
	return true

func cloud_load(filename: String) -> String:
	if not _steam_initialized:
		return ""
	print("[SteamManager] Cloud load: %s" % filename)
	# return Steam.fileRead(filename)
	return ""

# === RICH PRESENCE ===
func set_rich_presence(key: String, value: String) -> void:
	if not _steam_initialized:
		return
	# Steam.setRichPresence(key, value)

# === OVERLAY ===
# Called by OverlayManager to activate Steam overlay

func open_overlay() -> void:
	if not _steam_initialized:
		print("[SteamManager] open_overlay: Steam not initialized")
		return
	# Steam.activateGameOverlay(Steam.OVERLAY_FRIENDS)
	print("[SteamManager] Steam overlay activated")

func open_overlay_store_page() -> void:
	if not _steam_initialized:
		print("[SteamManager] open_overlay_store_page: Steam not initialized")
		return
	# Steam.activateGameOverlayToStore(app_id, Steam.OVERLAY_TO_STORE_FLAG_NONE)
	print("[SteamManager] Steam overlay: store page")

func open_overlay_friends() -> void:
	if not _steam_initialized:
		print("[SteamManager] open_overlay_friends: Steam not initialized")
		return
	# Steam.activateGameOverlay(Steam.OVERLAY_FRIENDS)
	print("[SteamManager] Steam overlay: friends")

func open_overlay_community() -> void:
	if not _steam_initialized:
		print("[SteamManager] open_overlay_community: Steam not initialized")
		return
	# Steam.activateGameOverlay(Steam.OVERLAY_COMMUNITY)
	print("[SteamManager] Steam overlay: community")

func open_overlay_achievements() -> void:
	if not _steam_initialized:
		print("[SteamManager] open_overlay_achievements: Steam not initialized")
		return
	# Steam.activateGameOverlay(Steam.OVERLAY_ACHIEVEMENTS)
	print("[SteamManager] Steam overlay: achievements")

func is_overlay_enabled() -> bool:
	if not _steam_initialized:
		return false
	# return Steam.isOverlayEnabled()
	return false

func get_app_id() -> int:
	if not _steam_initialized:
		return 0
	# return Steam.getAppID()
	return 0
