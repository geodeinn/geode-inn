class_name PausePanel
extends GamePanel
## Escape menu. The world keeps breathing; nothing is lost by stepping away.

signal journal_requested
signal settings_requested


func _init() -> void:
	super._init("The Inn waits", Vector2(420, 420))


func refresh() -> void:
	clear_body()
	body.add_child(UITheme.text("No hurry. The Inn will be here when you're ready.", 16, UITheme.MUTED))
	body.add_child(UITheme.button("Back to the Inn", close))
	body.add_child(UITheme.button("Journal", func() -> void: journal_requested.emit()))
	body.add_child(UITheme.button("Settings", func() -> void: settings_requested.emit()))
	body.add_child(UITheme.button("Save", func() -> void:
		PlayerState.save_profile()
		EventBus.toast.emit("Saved.")))
	body.add_child(UITheme.button("Save and go to the title screen", func() -> void:
		PlayerState.save_profile()
		Net.leave()
		close()
		SceneRouter.goto("main_menu")))
