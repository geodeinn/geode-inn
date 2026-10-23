extends Node
## Outside services behind one small interface so the game runs with or
## without them: Steam (achievements, cloud saves) through GodotSteam, and the
## client's Base44 site (market items, account linking).
##
## Steam: install the GodotSteam GDExtension (addons/godotsteam) and set
## data/platform.json steam.app_id. Without it every call is a safe no-op.

signal market_items_loaded(items: Array)
signal account_linked(ok: bool, account_id: String, display_name: String)

var platform: Dictionary = {}
var steam_ready := false
var unlocked_achievements: Dictionary = {}
var _steam: Object = null


func _ready() -> void:
	var path := "res://data/platform.json"
	if FileAccess.file_exists(path):
		var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
		if typeof(parsed) == TYPE_DICTIONARY:
			platform = parsed
	_init_steam()


func _process(_delta: float) -> void:
	if steam_ready:
		_steam.call("run_callbacks")


# ---------------------------------------------------------------- platform

func is_console() -> bool:
	return OS.has_feature("ps5") or OS.has_feature("switch") or OS.has_feature("console")


## Off by default: the canon client is offline-first, and the market's phrasing
## law never names the site in-world (data/platform.json market.allow_shop_links).
## Console stores don't allow links out at all.
func can_open_shop_links() -> bool:
	if not bool(platform.get("market", {}).get("allow_shop_links", false)):
		return false
	return not is_console() and DisplayServer.get_name() != "headless"


func open_shop(url: String) -> bool:
	if not can_open_shop_links() or url.is_empty():
		return false
	OS.shell_open(url)
	return true


# ---------------------------------------------------------------- Steam

func _init_steam() -> void:
	var app_id := int(platform.get("steam", {}).get("app_id", 0))
	if app_id <= 0 or not Engine.has_singleton("Steam"):
		return
	_steam = Engine.get_singleton("Steam")
	var result: Variant = _steam.call("steamInitEx", true, app_id)
	var status := int(result.get("status", 1)) if typeof(result) == TYPE_DICTIONARY else 1
	steam_ready = status == 0
	if not steam_ready:
		push_warning("Steam did not start: %s" % str(result))


func unlock_achievement(api_name: String) -> void:
	if unlocked_achievements.has(api_name):
		return
	unlocked_achievements[api_name] = true
	PlayerState.set_flag("achievement:" + api_name)
	var info: Dictionary = GameData.world.get("achievements", {}).get(api_name, {})
	# Silent achievements (INN_HOME) show nothing in game; only Steam records them.
	if not bool(info.get("silent", false)):
		EventBus.toast.emit("Achievement: " + String(info.get("name", api_name)))
	if steam_ready:
		_steam.call("setAchievement", api_name)
		_steam.call("storeStats")


func cloud_write(file_name: String, text: String) -> bool:
	if not steam_ready:
		return false
	return bool(_steam.call("fileWrite", file_name, text.to_utf8_buffer()))


func cloud_read(file_name: String) -> String:
	if not steam_ready or not bool(_steam.call("fileExists", file_name)):
		return ""
	var size := int(_steam.call("getFileSize", file_name))
	var result: Variant = _steam.call("fileRead", file_name, size)
	if typeof(result) == TYPE_DICTIONARY and result.has("buf"):
		return PackedByteArray(result["buf"]).get_string_from_utf8()
	return ""


# ---------------------------------------------------------------- Base44

func _functions_url(fn_key: String) -> String:
	var b: Dictionary = platform.get("base44", {})
	var base := String(b.get("functions_base_url", ""))
	if base.is_empty():
		return ""
	return base.trim_suffix("/") + "/" + String(b.get(fn_key, ""))


## Loads the artisan market. Falls back to the bundled sample when the site
## function isn't configured or can't be reached.
func fetch_market_items() -> void:
	var url := _functions_url("market_function")
	if url.is_empty():
		market_items_loaded.emit.call_deferred(GameData.market.get("items", []))
		return
	var req := HTTPRequest.new()
	req.timeout = 10.0
	add_child(req)
	req.request_completed.connect(func(result: int, code: int, _h: PackedStringArray, body: PackedByteArray) -> void:
		req.queue_free()
		var items: Array = GameData.market.get("items", [])
		if result == HTTPRequest.RESULT_SUCCESS and code == 200:
			var parsed: Variant = JSON.parse_string(body.get_string_from_utf8())
			if typeof(parsed) == TYPE_ARRAY:
				items = normalize_market_items(parsed)
		market_items_loaded.emit(items))
	if req.request(url) != OK:
		req.queue_free()
		market_items_loaded.emit.call_deferred(GameData.market.get("items", []))


## Base44 MarketItem rows to the game's item shape.
static func normalize_market_items(rows: Array) -> Array:
	var out: Array = []
	for r in rows:
		if typeof(r) != TYPE_DICTIONARY:
			continue
		out.append({
			"id": String(r.get("id", r.get("_id", ""))),
			"title": String(r.get("title", r.get("name", "Untitled"))),
			"stones": String(r.get("stones", r.get("materials", ""))),
			"price_usd": float(r.get("price_usd", r.get("price", 0.0))),
			"artisan": String(r.get("artisan", r.get("vendor", ""))),
			"category": String(r.get("category", "")),
			"url": String(r.get("url", r.get("shop_url", ""))),
		})
	return out


## Server side: checks a one-time code the player got on geodeinn.com.
## Offline (no function configured) any code becomes a local guest account.
func link_account(code: String) -> void:
	var url := _functions_url("link_function")
	if url.is_empty():
		var guest := "guest-" + str(abs(code.hash()) % 1000000)
		account_linked.emit.call_deferred(not code.strip_edges().is_empty(), guest, "")
		return
	var req := HTTPRequest.new()
	req.timeout = 10.0
	add_child(req)
	req.request_completed.connect(func(result: int, http_code: int, _h: PackedStringArray, body: PackedByteArray) -> void:
		req.queue_free()
		var parsed: Variant = JSON.parse_string(body.get_string_from_utf8()) if result == HTTPRequest.RESULT_SUCCESS else null
		if http_code == 200 and typeof(parsed) == TYPE_DICTIONARY and parsed.has("account_id"):
			account_linked.emit(true, String(parsed["account_id"]), String(parsed.get("name", "")))
		else:
			account_linked.emit(false, "", ""))
	var body := JSON.stringify({ "code": code })
	if req.request(url, ["Content-Type: application/json"], HTTPClient.METHOD_POST, body) != OK:
		req.queue_free()
		account_linked.emit.call_deferred(false, "", "")
