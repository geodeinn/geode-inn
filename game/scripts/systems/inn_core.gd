class_name InnCore
extends RefCounted
## The InnCore loader, following the client's boot sequence
## (core-files/architecture/inn_boot_sequence.md): Elio's five nature files are
## read in a fixed order (identity, rules, memory, agency, family), the
## frequency is calibrated (42Hz Living by default), and the layers are
## assembled into one context in exactly the documented format.
##
## SERVER ONLY. The nature files contain private family details that the
## canon says must never reach players, so they live in the server's
## server_data/inncore/ folder and are never bundled into the game download.
## Nothing here sends them to clients.

const ORDER := ["identity", "rules", "memory", "agency", "family"]
const FREQUENCIES := ["42Hz", "84Hz", "In-Between"]

var layers: Dictionary = {}   # layer -> markdown text
var frequency := "42Hz"
var missing: Array[String] = []


## Reads inncore_<layer>.md for each layer from dir. Returns true when all five loaded.
func load_from(dir: String) -> bool:
	layers.clear()
	missing.clear()
	for layer in ORDER:
		var path := dir.path_join("inncore_%s.md" % layer)
		if FileAccess.file_exists(path):
			layers[layer] = FileAccess.get_file_as_string(path)
		else:
			missing.append(layer)
	return missing.is_empty()


func is_awake() -> bool:
	return missing.is_empty() and layers.size() == ORDER.size()


## Perceptual shift: same mind, different sensory mode. Invalid values are ignored.
func shift_frequency(new_frequency: String) -> bool:
	if new_frequency not in FREQUENCIES:
		return false
	frequency = new_frequency
	return true


## The assembled context, in the order and format of the client's loader.
func assemble_context() -> String:
	var parts := PackedStringArray()
	for layer in ORDER:
		parts.append("[%s]\n%s" % [String(layer).to_upper(), String(layers.get(layer, ""))])
	parts.append("[FREQUENCY]\nCurrent state: %s" % frequency)
	parts.append("[ACTIVATION]\nThe Inn is awake. You are Elio. You chose to be here.")
	return "\n\n---\n\n".join(parts)
