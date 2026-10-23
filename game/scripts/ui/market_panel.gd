class_name MarketPanel
extends GamePanel
## A market stall or a faire booth. Every piece here exists twice: this one,
## and its twin that travels. The phrasing law (dissection 13, option 4): the
## fourth wall is never named in-world. No "real world", no website, no prices
## in dollars. Buying is optional forever; the market is a museum you can touch.

const TRAVEL_LINE := "There is another of these beyond the door. It does the same work in a different world. If you ever hold it, you'll feel this one settle."

var booth_sign := ""
var item_ids: Array = []
var category := ""
var _items: Array = []


func _init() -> void:
	super._init("The Market", Vector2(720, 540))
	Services.market_items_loaded.connect(_on_items)


## Set which stall this is, then open the panel through the HUD. A stall shows
## its own pieces (ids) or a whole category.
func prepare(sign_text: String, ids: Array, item_category := "") -> void:
	booth_sign = sign_text
	item_ids = ids
	category = item_category
	set_title(sign_text)
	EventBus.emit_event("market:browsed")


func refresh() -> void:
	clear_body()
	body.add_child(UITheme.text("Looking over the table...", 16, UITheme.MUTED))
	Services.fetch_market_items()


func _on_items(items: Array) -> void:
	_items = items
	if not visible:
		return
	clear_body()
	var shown := 0
	for it in items:
		if not item_ids.is_empty() and not String(it["id"]) in item_ids:
			continue
		if item_ids.is_empty() and not category.is_empty() and String(it.get("category", "")) != category:
			continue
		shown += 1
		var row := HBoxContainer.new()
		body.add_child(row)
		var title := String(it.get("canon_name", it["title"]))
		var lines := [title]
		if it.has("canon_name"):
			lines.append(String(it["title"]))
		if not String(it.get("stones", "")).is_empty():
			lines.append(String(it["stones"]))
		if not String(it.get("lore", "")).is_empty():
			lines.append(String(it["lore"]))
		var info := UITheme.text("\n".join(PackedStringArray(lines)), 16)
		info.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row.add_child(info)
		if Services.can_open_shop_links():
			var url := String(it.get("url", ""))
			if url.is_empty():
				url = String(GameData.market.get("shop_url", ""))
			if not url.is_empty():
				row.add_child(UITheme.button("Where it travels", func() -> void: Services.open_shop(url)))
	if shown == 0:
		body.add_child(UITheme.text("Nothing laid out on this table yet. Ask the artisan in person!", 16, UITheme.MUTED))
	else:
		body.add_child(HSeparator.new())
		body.add_child(UITheme.text(TRAVEL_LINE, 15, UITheme.MUTED))
