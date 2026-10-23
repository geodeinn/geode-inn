class_name Harmonizer
extends RefCounted
## Harmonization (walk-through 2.3): a dissonant being hums a set of tones.
## The player matches them with stones from their geode cave. No damage, no
## death: when every tone is matched, the being shows its true form and joins
## as a companion. Matching ignores octaves by default, so a stone that rings
## the same note an octave away still counts.

var target_hz: Array[float] = []
var tolerance_cents := 35.0
var octave_equivalent := true
var chosen: Array[String] = []   # stone ids, one per target slot ("" = empty)


func _init(targets: Array = [], tolerance := 35.0, octaves := true) -> void:
	for t in targets:
		target_hz.append(float(t))
	tolerance_cents = tolerance
	octave_equivalent = octaves
	chosen.resize(target_hz.size())
	chosen.fill("")


static func cents_between(a_hz: float, b_hz: float, octaves := true) -> float:
	if a_hz <= 0.0 or b_hz <= 0.0:
		return 1200.0
	var cents := 1200.0 * log(b_hz / a_hz) / log(2.0)
	if octaves:
		cents = fposmod(cents + 600.0, 1200.0) - 600.0
	return absf(cents)


## How close one stone is to one target tone, 0 (far) to 1 (exact).
func slot_alignment(slot: int, stone_id: String) -> float:
	if stone_id.is_empty() or slot < 0 or slot >= target_hz.size():
		return 0.0
	var c := cents_between(target_hz[slot], GameData.stone_hz(stone_id), octave_equivalent)
	return clampf(1.0 - c / 600.0, 0.0, 1.0)


func is_slot_matched(slot: int) -> bool:
	if chosen[slot].is_empty():
		return false
	return cents_between(target_hz[slot], GameData.stone_hz(chosen[slot]), octave_equivalent) <= tolerance_cents


func set_slot(slot: int, stone_id: String) -> void:
	if slot >= 0 and slot < chosen.size():
		chosen[slot] = stone_id


## Overall alignment 0 to 1. Drives how close the second Pulse Line is to the first.
func alignment() -> float:
	if target_hz.is_empty():
		return 1.0
	var total := 0.0
	for i in target_hz.size():
		total += slot_alignment(i, chosen[i])
	return total / target_hz.size()


func is_complete() -> bool:
	for i in target_hz.size():
		if not is_slot_matched(i):
			return false
	return true


## Which of the given stones would match each slot. Used for hints and tests.
func matching_stones(slot: int, stone_ids: Array) -> Array[String]:
	var out: Array[String] = []
	for id in stone_ids:
		if cents_between(target_hz[slot], GameData.stone_hz(id), octave_equivalent) <= tolerance_cents:
			out.append(String(id))
	return out
