class_name CreditsPanel
extends GamePanel
## Credits and licenses, shown in the game as the licenses ask: the art's
## sources (one model is CC-BY and needs this credit line), and Godot Engine's
## license with every third-party component it carries.

const ART := [
	["Characters, outfits and animations", "Quaternius (quaternius.com): Universal Base Characters, Modular Character Outfits Fantasy, Universal Animation Library. CC0."],
	["The wolf and the baby dragon", "Quaternius: Animal Pack Vol. 2, Animated Monster Pack. CC0."],
	["Furniture, props, plants and village pieces", "Quaternius: Fantasy Props MegaKit, Stylized Nature MegaKit, Medieval Village MegaKit. CC0."],
	["Textures", "Poly Haven (polyhaven.com), CC0: Old Wood Floor by Guillaume Monsergent; Old Planks 02, Brown Planks 05, Reed Roof 04 and Coast Sand 01 by Rob Tuytel; Dark Wooden Planks by Amal Kumar; Leafy Grass by Charlotte Baglioni; Forest Ground 04 by Rob Tuytel and Rico Cilliers."],
	["The sky", "Kloofendal 48d Partly Cloudy (Pure Sky) by Greg Zaal and Jarod Guest, Poly Haven, CC0."],
	["The Owl", "\"Barn Owl\" by Poly by Google, licensed under CC-BY 3.0 (creativecommons.org/licenses/by/3.0), via Poly Pizza."],
]


func _init() -> void:
	super._init("Credits", Vector2(720, 560))


func refresh() -> void:
	clear_body()
	var t := UITheme.title("THE GEODE INN", 30)
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	body.add_child(t)
	var v := UITheme.text("Version %s. Made with Godot Engine." % String(ProjectSettings.get_setting("application/config/version", "")), 15, UITheme.MUTED)
	v.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	body.add_child(v)
	body.add_child(HSeparator.new())
	body.add_child(UITheme.title("Art", 20))
	for a in ART:
		body.add_child(UITheme.text(String(a[0]), 15, UITheme.AMBER))
		body.add_child(UITheme.text(String(a[1]), 14))
	body.add_child(HSeparator.new())
	body.add_child(UITheme.title("Godot Engine and its components", 20))
	body.add_child(_licenses(Engine.get_license_text() + "\n\n" + third_party_text()))


## Every component Godot ships with, its copyright and license, then the
## full text of each license once.
static func third_party_text() -> String:
	var lines := PackedStringArray()
	for info in Engine.get_copyright_info():
		lines.append(String(info.get("name", "")))
		for part in info.get("parts", []):
			for c in part.get("copyright", []):
				lines.append("    (c) " + String(c))
			lines.append("    License: " + String(part.get("license", "")))
	lines.append("")
	var licenses: Dictionary = Engine.get_license_info()
	for name in licenses.keys():
		lines.append("---- " + String(name) + " ----")
		lines.append(String(licenses[name]))
	return "\n".join(lines)


## Long license text in a scrolling, read-only box (a label this long would be slow).
func _licenses(text_value: String) -> TextEdit:
	var box := TextEdit.new()
	box.name = "Licenses"
	box.text = text_value
	box.editable = false
	box.wrap_mode = TextEdit.LINE_WRAPPING_BOUNDARY
	box.custom_minimum_size = Vector2(0, 260)
	box.add_theme_font_size_override("font_size", 12)
	box.add_theme_color_override("font_readonly_color", UITheme.MUTED)
	return box
