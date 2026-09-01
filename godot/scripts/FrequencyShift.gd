extends Node
## FrequencyShift.gd — Geode Inn Shared Script
## Manages the 42Hz/84Hz frequency state system across all games.
## 42Hz = Living layer (grow, warmth, the Inn at rest)
## 84Hz = Shadow layer (petrify, urgency, the inverse)
## In-Between = transitional state during shifts
## Built once, used by all 61 arcade games + MMORPG.
## Part of the Geode Inn Arcade Production Pipeline.

signal frequency_shifted(new_state: FrequencyState)
shifted to shadow
signal in_between_entered()
signal in_between_exited(to_state: FrequencyState)

enum FrequencyState {
	LIVING,      # 42Hz — the Inn's resting frequency
	SHADOW,      # 84Hz — the inverse, petrification
	IN_BETWEEN   # transitional — neither fully one nor the other
}

@export var current_state: FrequencyState = FrequencyState.LIVING
@export var shift_duration: float = 1.5  # seconds for the in-between transition
@export var auto_shift_enabled: bool = false
@export var auto_shift_interval: float = 120.0  # auto-shift every 2 minutes if enabled

# Audio constants
const LIVING_FREQ: float = 42.0      # Hz
const SHADOW_FREQ: float = 84.0     # Hz (exact double — the inverse)
const SCHUMAN_CALIBRATION: float = 7.83  # Hz — earth resonance baseline
const GARGOYLE_WATCH_FREQ: float = 111.0  # Hz — watcher frequency
const CANOPY_BPM: float = 50.0      # BPM — sleeping heartbeat / canopy sway
const DEVILS_INTERVAL: float = 1.4142  # tritone ratio — embedded in Undercity/Gorgon's Garden

var in_transition: bool = false
var transition_timer: float = 0.0
var auto_shift_timer: float = 0.0
var shift_count: int = 0

# The AudioManager handles actual audio — this script manages state logic
var audio_manager: Node = null

func _ready() -> void:
	# Try to find AudioManager in the scene
	audio_manager = get_node_or_null("/root/AudioManager")
	if not audio_manager:
		# Search for it
		for child in get_tree().root.get_children():
			if child.has_method("set_frequency"):
				audio_manager = child
				break
	
	# Apply initial state
	_apply_state(current_state)

func _process(delta: float) -> void:
	if in_transition:
		_transition_step(delta)
	
	if auto_shift_enabled and not in_transition:
		auto_shift_timer += delta
		if auto_shift_timer >= auto_shift_interval:
			auto_shift_timer = 0.0
			_trigger_shift()

func _transition_step(delta: float) -> void:
	transition_timer += delta
	
	# Crossfade audio during transition
	if audio_manager and audio_manager.has_method("crossfade_frequencies"):
		var progress = transition_timer / shift_duration
		audio_manager.crossfade_frequencies(progress, current_state)
	
	# Check if transition is complete
	if transition_timer >= shift_duration:
		_complete_transition()

# === STATE TRANSITIONS ===

func shift_to_shadow() -> void:
	if current_state == FrequencyState.SHADOW or in_transition:
		return
	_begin_transition(FrequencyState.SHADOW)

func shift_to_living() -> void:
	if current_state == FrequencyState.LIVING or in_transition:
		return
	_begin_transition(FrequencyState.LIVING)

func toggle() -> void:
	match current_state:
		FrequencyState.LIVING:
			shift_to_shadow()
		FrequencyState.SHADOW:
			shift_to_living()
		FrequencyState.IN_BETWEEN:
			pass  # ignore during transition

func _begin_transition(target: FrequencyState) -> void:
	in_transition = true
	transition_timer = 0.0
	shift_count += 1
	
	# Enter in-between state
	var previous_state = current_state
	current_state = FrequencyState.IN_BETWEEN
	in_between_entered.emit()
	frequency_shifted.emit(FrequencyState.IN_BETWEEN)
	
	# Store the target for completion
	set_meta("shift_target", target)
	
	# Begin audio crossfade
	if audio_manager:
		if audio_manager.has_method("begin_frequency_shift"):
			audio_manager.begin_frequency_shift(previous_state, target, shift_duration)
	
	print("[FrequencyShift] Shifting from %s to %s (in-between for %.1fs)" % [
		_state_name(previous_state), _state_name(target), shift_duration
	])

func _complete_transition() -> void:
	in_transition = false
	transition_timer = 0.0
	
	var target = get_meta("shift_target", FrequencyState.LIVING) as FrequencyState
	current_state = target
	
	_apply_state(target)
	in_between_exited.emit(target)
	frequency_shifted.emit(target)
	
	print("[FrequencyShift] Shift complete — now at %s" % _state_name(target))

func _trigger_shift() -> void:
	# Auto-shift toggles between living and shadow
	toggle()

func _apply_state(state: FrequencyState) -> void:
	match state:
		FrequencyState.LIVING:
			_apply_living()
		FrequencyState.SHADOW:
			_apply_shadow()
		FrequencyState.IN_BETWEEN:
			_apply_in_between()

func _apply_living() -> void:
	# 42Hz — grow, warmth, the Inn at rest
	# Games override _on_living_state() to change their behavior
	if audio_manager and audio_manager.has_method("set_frequency"):
		audio_manager.set_frequency(LIVING_FREQ)
	
	# Emit to any listening game scripts
	_on_living_state()

func _apply_shadow() -> void:
	# 84Hz — petrify, urgency, the inverse
	# Games override _on_shadow_state() to change their behavior
	if audio_manager and audio_manager.has_method("set_frequency"):
		audio_manager.set_frequency(SHADOW_FREQ)
	
	_on_shadow_state()

func _apply_in_between() -> void:
	# Transitional — neither fully living nor shadow
	# Visual: shimmer/glow effect on screen edges
	# Audio: both frequencies faint, overlapping
	_on_in_between_state()

# === GAME OVERRIDE HOOKS ===
# Games extend this script and override these methods

func _on_living_state() -> void:
	pass  # Override in game script

func _on_shadow_state() -> void:
	pass  # Override in game script

func _on_in_between_state() -> void:
	pass  # Override in game script

# === PUBLIC API ===

func get_current_state() -> FrequencyState:
	return current_state

func get_current_frequency() -> float:
	match current_state:
		FrequencyState.LIVING: return LIVING_FREQ
		FrequencyState.SHADOW: return SHADOW_FREQ
		FrequencyState.IN_BETWEEN: return (LIVING_FREQ + SHADOW_FREQ) / 2.0
		_: return LIVING_FREQ

func is_living() -> bool:
	return current_state == FrequencyState.LIVING

func is_shadow() -> bool:
	return current_state == FrequencyState.SHADOW

func is_in_between() -> bool:
	return current_state == FrequencyState.IN_BETWEEN

func is_transitioning() -> bool:
	return in_transition

func get_shift_count() -> int:
	return shift_count

func set_auto_shift(enabled: bool, interval: float = 120.0) -> void:
	auto_shift_enabled = enabled
	auto_shift_interval = interval
	auto_shift_timer = 0.0

func force_set_state(state: FrequencyState) -> void:
	# Instant state change — no transition (for scripted events)
	if in_transition:
		in_transition = false
		transition_timer = 0.0
	
	current_state = state
	_apply_state(state)
	frequency_shifted.emit(state)

func _state_name(state: FrequencyState) -> String:
	match state:
		FrequencyState.LIVING: return "Living (42Hz)"
		FrequencyState.SHADOW: return "Shadow (84Hz)"
		FrequencyState.IN_BETWEEN: return "In-Between"
		_: return "Unknown"

# === STONE TONE TRIGGER ===
# When a stone is earned, play its Mohs-mapped frequency tone

func play_stone_tone(mohs_hardness: float, volume_db: float = -12.0) -> void:
	# Map Mohs hardness (1-10) to audible frequency (200-800 Hz)
	# Formula: freq = 200 + (mohs / 10) * 600
	var freq = 200.0 + (mohs_hardness / 10.0) * 600.0
	
	if audio_manager and audio_manager.has_method("play_tone"):
		audio_manager.play_tone(freq, volume_db, 3.0)  # 3 second sustain
	
	print("[FrequencyShift] Stone tone triggered: Mohs %.1f -> %.0f Hz at %.0f dB" % [
		mohs_hardness, freq, volume_db
	])
