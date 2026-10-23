class_name FaireRegistry
extends RefCounted
## Faire rental. One template (data/faire.json), many faires. A faire owner
## rents time on the site; the site gives them a rental key; with that key they
## set up their faire in game (layout, colors, booth signs, vendors, performers).
## Visitors can walk any faire whose rental is active, any day of the year.

var faires: Dictionary = {}        # faire id -> config
var rental_keys: Dictionary = {}   # key -> faire id


func layouts() -> Dictionary:
	return GameData.faire.get("layouts", {})


func limits() -> Dictionary:
	return GameData.faire.get("limits", {})


## Returns a list of problems. Empty means the config is valid.
func validate(config: Dictionary) -> Array[String]:
	var problems: Array[String] = []
	var lim := limits()
	var name_str := String(config.get("faire_name", "")).strip_edges()
	if name_str.is_empty():
		problems.append("The faire needs a name.")
	elif name_str.length() > int(lim.get("faire_name_max", 48)):
		problems.append("The faire name is too long.")
	if String(config.get("owner", "")).length() > int(lim.get("owner_max", 48)):
		problems.append("The owner name is too long.")
	var layout := String(config.get("layout", ""))
	if not layouts().has(layout):
		problems.append("Pick one of the layouts.")
	if not GameData.faire.get("palettes", {}).has(String(config.get("palette", ""))):
		problems.append("Pick one of the color palettes.")
	var booths: Array = config.get("booths", [])
	if layouts().has(layout) and booths.size() > layouts()[layout]["booths"].size():
		problems.append("That layout has room for %d booths." % layouts()[layout]["booths"].size())
	for b in booths:
		if String(b.get("sign", "")).length() > int(lim.get("sign_max", 32)):
			problems.append("A booth sign is too long.")
			break
		if b.get("items", []).size() > int(lim.get("max_items_per_booth", 6)):
			problems.append("A booth has too many items.")
			break
	if config.get("performers", []).size() > int(lim.get("performers_max", 8)):
		problems.append("Too many performers.")
	if not _is_date(String(config.get("active_until", ""))):
		problems.append("The rental end date is missing.")
	return problems


func is_active(config: Dictionary, today := "") -> bool:
	var day := today if not today.is_empty() else Time.get_date_string_from_system(true)
	return String(config.get("active_until", "")) >= day


func active_faires(today := "") -> Array:
	var out: Array = []
	for id in faires.keys():
		if is_active(faires[id], today):
			out.append(faires[id])
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool: return String(a["faire_name"]) < String(b["faire_name"]))
	return out


## Owner saves their faire. Returns "" on success or the problem.
func save_with_key(key: String, config: Dictionary) -> String:
	if not rental_keys.has(key):
		return "That rental key isn't valid."
	var problems := validate(config)
	if not problems.is_empty():
		return problems[0]
	var id := String(rental_keys[key])
	var clean := config.duplicate(true)
	clean["id"] = id
	# The rental end date comes from the site's rental record, not the owner.
	clean["active_until"] = String(faires.get(id, {}).get("active_until", config.get("active_until", "")))
	faires[id] = clean
	return ""


## Called when the site confirms a rental (or by the server admin tool).
func register_rental(key: String, faire_id: String, active_until: String, owner := "") -> void:
	rental_keys[key] = faire_id
	if not faires.has(faire_id):
		faires[faire_id] = {
			"id": faire_id, "faire_name": owner + " Faire" if not owner.is_empty() else "New Faire",
			"owner": owner, "layout": "ring", "palette": "royal", "booths": [], "performers": [],
		}
	faires[faire_id]["active_until"] = active_until


func load_samples() -> void:
	for f in GameData.faire.get("sample_faires", []):
		faires[f["id"]] = f.duplicate(true)


func to_dict() -> Dictionary:
	return { "faires": faires, "rental_keys": rental_keys }


func from_dict(d: Dictionary) -> void:
	faires = d.get("faires", {})
	rental_keys = d.get("rental_keys", {})


static func _is_date(s: String) -> bool:
	if s.length() != 10:
		return false
	var parts := s.split("-")
	return parts.size() == 3 and parts[0].is_valid_int() and parts[1].is_valid_int() and parts[2].is_valid_int()
