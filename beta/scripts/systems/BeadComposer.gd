###
# Geode Inn — Bead Composer
# The creative tool where players design jewelry from collected stones.
# Frequencies as creative medium: each stone's frequency shapes the piece.
#
# Faceting rules (from the master design doc):
#   - Opaque stones → smooth beads (no faceting)
#   - EXCEPTION: Black onyx and all tourmalines CAN be faceted despite being opaque
#   - Translucent stones → faceted (light interaction)
#   - EXCEPTION: Opals are NOT faceted (except Fire Opal)
#   - Three cut types: beads strung, cabochons set, faceted light
#
# The composer outputs a "resonance signature" — the combined frequencies
# of the stones in the piece. This signature determines the piece's
# in-game effect and can be exported to the Soulstice workshop.
###

extends Node2D
signal composition_created(composition: Dictionary)
signal bead_added(stone_name: String, position: Vector2)
signal bead_removed(stone_name: String)

# === Bead Types ===
enum CutType { SMOOTH_BEAD, CABOCHON, FACETED, RAW }
enum StringPattern { SINGLE, DOUBLE, TRIPLE, KNOTTED, GRADUATED }

# === State ===
var composition_name: String = "Untitled Piece"
var beads: Array[Dictionary] = []  # Each: {stone, position, cut, size, rotation}
var selected_stone: String = ""
var string_pattern: StringPattern = StringPattern.SINGLE
var wire_material: String = "silver"  # silver, gold, copper
var bead_size: float = 8.0  # mm
var export_ready: bool = false

# === Faceting Rules ===

func get_available_cuts(stone_name: String, opacity: String, stone_family: String) -> Array[CutType]:
	var cuts: Array[CutType] = []
	
	# Rule: Opaque → smooth (except black onyx and tourmalines)
	if opacity == "opaque":
		cuts.append(CutType.SMOOTH_BEAD)
		cuts.append(CutType.CABOCHON)
		
		# Exception: black onyx and tourmalines can be faceted
		if stone_name.to_lower() == "black onyx" or stone_family.to_lower() == "tourmaline":
			cuts.append(CutType.FACETED)
	
	# Rule: Translucent → faceted (except opals)
	elif opacity == "translucent":
		cuts.append(CutType.FACETED)
		cuts.append(CutType.CABOCHON)
		
		# Exception: opals are NOT faceted (except Fire Opal)
		if stone_family.to_lower() == "opal" and stone_name.to_lower() != "fire opal":
			cuts.remove_at(0)  # Remove faceted
			cuts.append(CutType.SMOOTH_BEAD)
	
	# Rule: Transparent → faceted
	elif opacity == "transparent":
		cuts.append(CutType.FACETED)
		cuts.append(CutType.SMOOTH_BEAD)
	
	# Raw is always available
	cuts.append(CutType.RAW)
	
	return cuts

# === Bead Placement ===

func add_bead(stone_name: String, position: Vector2, cut: CutType, size: float = 8.0) -> void:
	var bead = {
		"stone": stone_name,
		"position": position,
		"cut": cut,
		"size": size,
		"rotation": 0.0,
		"frequency": _get_stone_frequency(stone_name),
		"index": beads.size(),
	}
	beads.append(bead)
	bead_added.emit(stone_name, position)
	
	# Audio: play the stone's chime
	if AudioManager:
		AudioManager.play_stone_chime(stone_name.to_lower().replace(" ", "_"))
	
	print("[BeadComposer] Added %s bead at %s (cut: %s, size: %.1fmm)" % [stone_name, position, cut, size])

func remove_bead(index: int) -> void:
	if index < 0 or index >= beads.size():
		return
	
	var stone_name = beads[index].stone
	beads.remove_at(index)
	bead_removed.emit(stone_name)
	
	# Re-index
	for i in range(beads.size()):
		beads[i].index = i

func move_bead(index: int, new_position: Vector2) -> void:
	if index < 0 or index >= beads.size():
		return
	beads[index].position = new_position

func set_bead_cut(index: int, cut: CutType) -> void:
	if index < 0 or index >= beads.size():
		return
	beads[index].cut = cut

# === Resonance Signature ===

func compute_resonance_signature() -> Dictionary:
	if beads.is_empty():
		return {"valid": false, "reason": "No beads placed"}
	
	var total_freq: float = 0.0
	var frequencies: Array[float] = []
	var elements: Dictionary = {}
	var dominant_freq: int = 42
	
	for bead in beads:
		var freq = bead.get("frequency", 42)
		frequencies.append(freq)
		total_freq += freq
		
		# Track frequency distribution
		var key = str(freq) + "Hz"
		elements[key] = elements.get(key, 0) + 1
	
	# Average frequency
	var avg_freq = total_freq / beads.size()
	
	# Determine dominant frequency
	var count_42 = elements.get("42Hz", 0)
	var count_84 = elements.get("84Hz", 0)
	var count_111 = elements.get("111Hz", 0)
	
	if count_42 >= count_84 and count_42 >= count_111:
		dominant_freq = 42
	elif count_84 >= count_111:
		dominant_freq = 84
	else:
		dominant_freq = 111
	
	# Compute harmonic value (how well the frequencies blend)
	var harmony = _compute_harmony(frequencies)
	
	# Determine effect based on dominant frequency
	var effect = _get_frequency_effect(dominant_freq, harmony)
	
	return {
		"valid": true,
		"stone_count": beads.size(),
		"average_frequency": avg_freq,
		"dominant_frequency": dominant_freq,
		"frequency_distribution": elements,
		"harmony_score": harmony,
		"effect": effect,
		"wire_material": wire_material,
		"string_pattern": string_pattern,
		"composition_name": composition_name,
	}

func _compute_harmony(frequencies: Array[float]) -> float:
	# Harmony = how close the frequencies are to musical intervals
	# 42 and 84 are an octave apart (harmonious)
	# 42 and 111 are a perfect fifth-ish (harmonious)
	# 84 and 111 are close but dissonant
	var harmony_score = 0.0
	var pairs = 0
	
	for i in range(frequencies.size()):
		for j in range(i + 1, frequencies.size()):
			var ratio = frequencies[j] / frequencies[i]
			# Octave (2:1) = perfect
			if abs(ratio - 2.0) < 0.1:
				harmony_score += 1.0
			# Fifth (3:2) = strong
			elif abs(ratio - 1.5) < 0.15:
				harmony_score += 0.8
			# Fourth (4:3) = good
			elif abs(ratio - 1.33) < 0.1:
				harmony_score += 0.6
			# Unison = neutral
			elif abs(ratio - 1.0) < 0.05:
				harmony_score += 0.5
			# Dissonant
			else:
				harmony_score += 0.2
			pairs += 1
	
	return harmony_score / max(pairs, 1)

func _get_frequency_effect(freq: int, harmony: float) -> String:
	match freq:
		42:
			if harmony > 0.7:
				return "Growth: Wearer gains +10% experience in all games for 24 hours"
			elif harmony > 0.4:
				return "Warmth: Wearer gains +5% experience in Living-mode games"
			else:
				return "Hum: Wearer hears the 42Hz Song faintly in all zones"
		84:
			if harmony > 0.7:
				return "Petrify: Wearer gains +15% defense in Shadow Inn encounters"
			elif harmony > 0.4:
				return "Shadow: Wearer can enter the Shadow Inn without mode shift"
			else:
				return "Chill: Wearer resists fear effects in underground zones"
		111:
			if harmony > 0.7:
				return "Awareness: Wearer sees all hidden passages and secret doors"
			elif harmony > 0.4:
				return "Insight: Wearer sees one hidden detail per zone visit"
			else:
				return "Vigil: Wearer senses gargoyle proximity before encounter"
		_:
			return "Resonance: Wearer feels the stones' combined frequency"

func _get_stone_frequency(stone_name: String) -> int:
	# Simplified — in production, load from Stone entity data
	# Opaque high-hardness → 84Hz
	# With optical phenomenon → 111Hz
	# Default → 42Hz
	return 42

# === Export ===

func export_composition() -> Dictionary:
	var signature = compute_resonance_signature()
	if not signature.valid:
		return {"success": false, "error": "Invalid composition"}
	
	var export_data = {
		"name": composition_name,
		"beads": [],
		"signature": signature,
		"created_date": Time.get_datetime_string_from_system(false, true),
		"creator": GameManager.player_name if GameManager else "Traveler",
	}
	
	for bead in beads:
		export_data.beads.append({
			"stone": bead.stone,
			"position_x": bead.position.x,
			"position_y": bead.position.y,
			"cut": bead.cut,
			"size_mm": bead.size,
			"frequency": bead.frequency,
		})
	
	export_ready = true
	composition_created.emit(export_data)
	
	# Audio: Nine Songs chord on successful export
	if AudioManager:
		AudioManager.play_nine_songs_chord()
	
	# Steam achievement
	if SteamManager:
		SteamManager.unlock_achievement("bead_composer_first")
	
	print("[BeadComposer] Exported: %s (%d beads, %dHz dominant, harmony: %.2f)" % [
		composition_name, beads.size(), signature.dominant_frequency, signature.harmony_score
	])
	
	return {"success": true, "data": export_data}

# === UI Helpers ===

func get_cut_name(cut: CutType) -> String:
	match cut:
		CutType.SMOOTH_BEAD: return "Smooth Bead"
		CutType.CABOCHON: return "Cabochon"
		CutType.FACETED: return "Faceted"
		CutType.RAW: return "Raw Stone"
		_: return "Unknown"

func get_pattern_name(pattern: StringPattern) -> String:
	match pattern:
		StringPattern.SINGLE: return "Single Strand"
		StringPattern.DOUBLE: return "Double Strand"
		StringPattern.TRIPLE: return "Triple Strand"
		StringPattern.KNOTTED: return "Knotted"
		StringPattern.GRADUATED: return "Graduated"
		_: return "Single Strand"
