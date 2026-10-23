class_name JournalPanel
extends GamePanel
## Quests, the Ragana's notebook (observations) and the Player Chronicle.


func _init() -> void:
	super._init("Journal", Vector2(720, 540))


func refresh() -> void:
	clear_body()
	body.add_child(UITheme.title("Quests", 20))
	var any := false
	for qid in GameData.quests.keys():
		var st := QuestManager.state(qid)
		if st == QuestManager.NOT_STARTED:
			continue
		any = true
		var q: Dictionary = GameData.quests[qid]
		if st == QuestManager.DONE:
			body.add_child(UITheme.text("%s  (done)" % q["name"], 16, UITheme.MUTED))
		else:
			var step := QuestManager.current_step(qid)
			body.add_child(UITheme.text("%s: %s" % [q["name"], step.get("text", "")], 17, UITheme.AMBER))
	if not any:
		body.add_child(UITheme.text("Nothing yet. The Host is by the door.", 16, UITheme.MUTED))
	body.add_child(HSeparator.new())
	body.add_child(UITheme.title("Notebook", 20))
	var obs_all: Dictionary = GameData.world.get("journal_observations", {})
	var wrote := false
	for zone in obs_all.keys():
		for obs_id in PlayerState.observations(zone):
			for o in obs_all[zone]:
				if o["id"] == obs_id:
					body.add_child(UITheme.text("%s: %s" % [String(zone).capitalize(), o["text"]], 16))
					wrote = true
	if not wrote:
		body.add_child(UITheme.text("Blank pages. Look closely at things and press E to note them.", 16, UITheme.MUTED))
	body.add_child(HSeparator.new())
	body.add_child(UITheme.title("Chronicle", 20))
	var entries: Array = PlayerState.chronicle()
	if entries.is_empty():
		body.add_child(UITheme.text("Your story starts when you do something.", 16, UITheme.MUTED))
	for i in range(entries.size() - 1, maxi(entries.size() - 15, 0) - 1, -1):
		var e: Dictionary = entries[i]
		body.add_child(UITheme.text(Time.get_datetime_string_from_unix_time(int(e["t"])).substr(0, 10) + "  " + String(e["text"]), 15))
