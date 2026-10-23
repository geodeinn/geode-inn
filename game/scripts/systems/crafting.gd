class_name Crafting
extends RefCounted
## The homestead's rules (dissection 14 option 7, the building system doc):
## raw materials are worked at the workbench or fired at the forge, and the
## homestead grows one tier at a time on the player's own plot. Nothing fails
## and nothing expires; the plot keeps whatever was built.


static func recipe(recipe_id: String) -> Dictionary:
	return GameData.recipes.get(recipe_id, {})


static func recipes_at(station: String) -> Array[String]:
	var out: Array[String] = []
	for id in GameData.recipes.keys():
		if String(GameData.recipes[id]["station"]) == station:
			out.append(String(id))
	return out


static func _scaled(needs: Dictionary, count: int) -> Dictionary:
	var cost := {}
	for m in needs.keys():
		cost[m] = int(needs[m]) * count
	return cost


## How many times the player could make this right now.
static func max_makeable(recipe_id: String) -> int:
	var r := recipe(recipe_id)
	if r.is_empty():
		return 0
	var best := 1 << 30
	for m in r["needs"].keys():
		best = mini(best, PlayerState.material_count(m) / maxi(int(r["needs"][m]), 1))
	return best


## Makes up to count of a recipe. Returns how many were made.
static func make(recipe_id: String, count := 1) -> int:
	var r := recipe(recipe_id)
	var n := mini(count, max_makeable(recipe_id))
	if n <= 0:
		return 0
	PlayerState.spend_materials(_scaled(r["needs"], n))
	PlayerState.add_material(String(r["makes"]), n)
	EventBus.emit_event("crafted:" + String(r["makes"]), { "amount": n })
	return n


static func next_tier() -> Dictionary:
	return GameData.tier(PlayerState.homestead_tier() + 1)


## What's still missing for a tier, material -> how many more.
static func missing_for(t: Dictionary) -> Dictionary:
	var out := {}
	var req: Dictionary = t.get("requires", {})
	for m in req.keys():
		var short := int(req[m]) - PlayerState.material_count(m)
		if short > 0:
			out[m] = short
	return out


static func locked_by(t: Dictionary) -> Array[String]:
	var out: Array[String] = []
	for u in t.get("requires_unlocks", []):
		if not PlayerState.is_unlocked(String(u)):
			out.append(String(u))
	return out


static func can_build_next() -> bool:
	var t := next_tier()
	return not t.is_empty() and PlayerState.homestead()["plot"] >= 0 and missing_for(t).is_empty() and locked_by(t).is_empty()


## Builds the next tier on the player's plot. The name is what goes on the map.
static func build_next(title := "") -> bool:
	if not can_build_next():
		return false
	var t := next_tier()
	PlayerState.spend_materials(t["requires"])
	var h := PlayerState.homestead()
	h["tier"] = int(t["tier"])
	if not title.strip_edges().is_empty():
		h["name"] = title.strip_edges().substr(0, 40)
	var what := String(t["name"]).to_lower()
	var article := "an" if what.substr(0, 1) in ["a", "e", "i", "o", "u"] else "a"
	var named := "" if String(h["name"]).is_empty() else ", named " + String(h["name"])
	PlayerState.add_chronicle("Built %s %s%s." % [article, what, named], "build", { "tier": int(t["tier"]) })
	EventBus.emit_event("built:" + String(t["id"]))
	return true
