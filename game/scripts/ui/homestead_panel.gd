class_name HomesteadPanel
extends GamePanel
## A plot at the faire's edge. Claim one, then build it up a tier at a time:
## Lean-to, Cottage, Workshop Home, Estate, Ancestral Hall. Name it when it's
## done; the name is what goes on the map. Nothing fails, nothing expires.

signal claimed(plot: int)
signal built(tier: int)

var plot := -1
var owner_name := ""      # someone else's plot, when it isn't the player's
var _name_edit: LineEdit
var _status: Label


func _init() -> void:
	super._init("Your Homestead", Vector2(760, 580))


func refresh() -> void:
	clear_body()
	var h := PlayerState.homestead()
	var mine := int(h["plot"])
	_status = UITheme.text("", 16, UITheme.AMBER)
	if not owner_name.is_empty():
		set_title("%s's homestead" % owner_name)
		body.add_child(UITheme.text("Someone else's plot. You can visit. Knock if you like.", 16, UITheme.MUTED))
		return
	if mine < 0:
		set_title("An open plot")
		body.add_child(UITheme.text("A plot at the faire's edge, the first ring out from the Inn. Claim it and it's yours. It never expires.", 16))
		body.add_child(UITheme.button("Claim this plot", claim))
		body.add_child(_status)
		return
	if mine != plot:
		set_title("An open plot")
		body.add_child(UITheme.text("You already have a homestead in this ring. One plot each, so there's room for everyone.", 16, UITheme.MUTED))
		return
	var tier := PlayerState.homestead_tier()
	var cur := GameData.tier(tier)
	set_title(String(h["name"]) if not String(h["name"]).is_empty() else "Your Homestead")
	body.add_child(UITheme.text("Now: %s" % (String(cur["name"]) if not cur.is_empty() else "a cleared plot"), 18, UITheme.AMBER_BRIGHT))
	var next := Crafting.next_tier()
	if next.is_empty():
		body.add_child(UITheme.text("There's nothing left to build. Sit inside a while.", 16, UITheme.MUTED))
		return
	body.add_child(UITheme.text("Next: %s (%s)\n%s" % [next["name"], next["stage"], next["description"]], 16))
	var req: Dictionary = next["requires"]
	var grid := GridContainer.new()
	grid.columns = 2
	body.add_child(grid)
	grid.add_theme_constant_override("h_separation", 24)
	for m in req.keys():
		var have := PlayerState.material_count(m)
		grid.add_child(UITheme.cell(GameData.material_name(m)))
		grid.add_child(UITheme.cell("%d / %d" % [mini(have, int(req[m])), int(req[m])], 15, UITheme.GOOD if have >= int(req[m]) else UITheme.MUTED))
	var locked := Crafting.locked_by(next)
	if not locked.is_empty():
		body.add_child(UITheme.text("This one needs things the first release doesn't have yet: the Philosopher's Stone charm and the Silica Thread.", 15, UITheme.MUTED))
	body.add_child(UITheme.text("Name it (optional)", 15, UITheme.MUTED))
	_name_edit = LineEdit.new()
	_name_edit.max_length = 40
	_name_edit.text = String(h["name"])
	body.add_child(_name_edit)
	var b := UITheme.button("Build the %s" % String(next["name"]).to_lower(), build)
	b.disabled = not Crafting.can_build_next()
	body.add_child(b)
	body.add_child(_status)


func claim() -> void:
	if Net.is_online():
		Net.claim_plot(plot)
		_status.text = "Asking around..."
		return
	PlayerState.claim_plot(plot)
	claimed.emit(plot)
	refresh()


func build() -> bool:
	var title := _name_edit.text if _name_edit != null else ""
	if not Crafting.build_next(title):
		return false
	Net.update_homestead()
	built.emit(PlayerState.homestead_tier())
	close()
	return true
