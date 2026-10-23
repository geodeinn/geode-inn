class_name WorkbenchPanel
extends GamePanel
## Where raw materials get worked: the homestead workbench (planks, blocks,
## rope, bundles, mortar, wattle-and-daub) or the forge's fire (brick, ingots,
## glass). Set station before opening.

var station := "workbench"
var _result: Label


func _init() -> void:
	super._init("The Workbench", Vector2(760, 560))


func refresh() -> void:
	clear_body()
	set_title("The Forge" if station == "forge" else "The Workbench")
	body.add_child(UITheme.text("The fire does what the hands can't: clay to brick, ore to metal, sand to glass." if station == "forge"
		else "Wood becomes planks. Stone becomes blocks. Hemp becomes rope. Thatch becomes bundles.", 16, UITheme.MUTED))
	_result = UITheme.text("", 17, UITheme.AMBER)
	body.add_child(_result)
	for rid in Crafting.recipes_at(station):
		var r := Crafting.recipe(rid)
		var needs := PackedStringArray()
		for m in r["needs"].keys():
			needs.append("%d %s (%d)" % [int(r["needs"][m]), GameData.material_name(m), PlayerState.material_count(m)])
		var row := HBoxContainer.new()
		body.add_child(row)
		var info := UITheme.text("%s   you have %d\nFrom %s" % [GameData.material_name(String(r["makes"])), PlayerState.material_count(String(r["makes"])), ", ".join(needs)], 15)
		info.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row.add_child(info)
		var can := Crafting.max_makeable(rid)
		for amount in [1, 5]:
			var b := UITheme.button("Make %d" % amount, make.bind(rid, amount))
			b.disabled = can < amount
			row.add_child(b)
		var all := UITheme.button("Make all", make.bind(rid, can))
		all.disabled = can <= 0
		row.add_child(all)
	body.add_child(HSeparator.new())
	body.add_child(UITheme.title("Raw materials", 18))
	var grid := GridContainer.new()
	grid.columns = 4
	grid.add_theme_constant_override("h_separation", 28)
	body.add_child(grid)
	for m in GameData.crafting.get("materials", []):
		if m["group"] == "base":
			grid.add_child(UITheme.cell("%s  %d" % [m["name"], PlayerState.material_count(m["id"])]))


func make(recipe_id: String, count: int) -> int:
	var made := Crafting.make(recipe_id, count)
	if made > 0:
		AudioDirector.work("smelting" if station == "forge" else "felling")
	refresh()
	_result.text = "Made %d %s." % [made, GameData.material_name(String(Crafting.recipe(recipe_id)["makes"]))] if made > 0 else "Not enough for that yet."
	return made
