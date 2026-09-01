# FrequencyShift.gd — Tri-Mode Frequency State Manager (Autoload)
# Manages the 42Hz/84Hz/In-Between frequency system across all games
# Implements the tri-mode design: Living (42Hz), Shadow (84Hz), In-Between (transitional)
# Works alongside AudioManager which handles the actual audio rendering

extends Node

# === SIGNALS ===
signal frequency_changed(new_state: int, old_state: int)
signal frequency_shift_started(new_state: int)
signal frequency_shift_completed(new_state: int)
signal visual_state_changed(state_name: String)

# === FREQUENCY STATES ===
enum FreqState {
	LIVING,      # 42Hz — The Song of Making — normal world
	SHADOW,      # 84Hz — Shadow Inn inverse — dark reflection
	IN_BETWEEN   # Transitional — the liminal space between frequencies
}

const STATE_NAMES: Dictionary = {
	FreqState.LIVING: "Living",
	FreqState.SHADOW: "Shadow",
	FreqState.IN_BETWEEN: "In-Between"
}

const STATE_FREQUENCIES: Dictionary = {
	FreqState.LIVING: 42,
	FreqState.SHADOW: 84,
	FreqState.IN_BETWEEN: 63   # Midpoint between 42 and 84
}

# === STATE ===
var _current_state: int = FreqState.LIVING
var _previous_state: int = FreqState.LIVING
var _shift_duration: float = 2.0  # Seconds for smooth transition
var _shift_progress: float = 1.0  # 0.0 = just started, 1.0 = complete
var _is_shifting: bool = false
var _auto_shift_enabled: bool = true
var _shift_count: int = 0  # How many times the player has experienced a shift

# Visual modulation values (games can read these for shader/color adjustments)
var _visual_intensity: float = 0.0  # 0.0 = Living, 1.0 = Shadow, 0.5 = In-Between
var _audio_modulation: float = 0.0  # Same range, used for audio filter sweeps

# === ZONE DEFAULT FREQUENCIES ===
# Some zones have a default frequency that applies on entry
const ZONE_DEFAULTS: Dictionary = {
	"hub": FreqState.LIVING,
	"cosmology": FreqState.LIVING,
	"main_floor": FreqState.LIVING,
	"campgrounds": FreqState.LIVING,
	"catacombs": FreqState.LIVING,
	"archive": FreqState.LIVING,
	"market": FreqState.LIVING,
	"water_zones": FreqState.LIVING,
	"staircase": FreqState.LIVING,
	"gorgons_garden": FreqState.SHADOW,
	"undercity": FreqState.SHADOW,
	"shadow_inn": FreqState.SHADOW,
	"fae_seelie": FreqState.LIVING,
	"fae_unseelie": FreqState.SHADOW,
}

func _ready() -> void:
	set_process(true)
	# Sync with AudioManager on startup
	if AudioManager:
		AudioManager.set_frequency(STATE_FREQUENCIES[_current_state])

func _process(delta: float) -> void:
	if _is_shifting:
		_update_shift(delta)

func _update_shift(delta: float) -> void:
	_shift_progress += delta / _shift_duration
	
	if _shift_progress >= 1.0:
		_shift_progress = 1.0
		_is_shifting = false
		_shift_count += 1
		frequency_shift_completed.emit(_current_state)
		print("[FrequencyShift] Shift complete: %s" % STATE_NAMES[_current_state])
	
	# Update modulation values
	var start_val: float = _state_to_visual(_previous_state)
	var end_val: float = _state_to_visual(_current_state)
	_visual_intensity = lerp(start_val, end_val, _shift_progress)
	_audio_modulation = _visual_intensity
	
	# Update AudioManager frequency in real-time during shift
	if AudioManager:
		var target_hz: int = STATE_FREQUENCIES[_current_state]
		var prev_hz: int = STATE_FREQUENCIES[_previous_state]
		var current_hz: int = int(lerp(prev_hz, target_hz, _shift_progress))
		AudioManager.set_frequency(current_hz)
	
	# Emit visual state for games to update shaders/colors
	visual_state_changed.emit(STATE_NAMES[_current_state] if _shift_progress > 0.5 else STATE_NAMES[_previous_state])

func _state_to_visual(state: int) -> float:
	match state:
		FreqState.LIVING: return 0.0
		FreqState.SHADOW: return 1.0
		FreqState.IN_BETWEEN: return 0.5
	return 0.0

# === PUBLIC API ===

func get_current_state() -> int:
	return _current_state

func get_current_state_name() -> String:
	return STATE_NAMES[_current_state]

func get_current_frequency() -> int:
	return STATE_FREQUENCIES[_current_state]

func is_living() -> bool:
	return _current_state == FreqState.LIVING

func is_shadow() -> bool:
	return _current_state == FreqState.SHADOW

func is_in_between() -> bool:
	return _current_state == FreqState.IN_BETWEEN

func is_shifting() -> bool:
	return _is_shifting

func get_shift_progress() -> float:
	return _shift_progress

func get_visual_intensity() -> float:
	return _visual_intensity

func get_audio_modulation() -> float:
	return _audio_modulation

func get_shift_count() -> int:
	return _shift_count

# === STATE TRANSITIONS ===

func shift_to(state: int, instant: bool = false) -> void:
	if state == _current_state and not _is_shifting:
		return
	
	_previous_state = _current_state
	_current_state = state
	_shift_count += 1
	
	if instant:
		_shift_progress = 1.0
		_is_shifting = false
		_visual_intensity = _state_to_visual(state)
		_audio_modulation = _visual_intensity
		if AudioManager:
			AudioManager.set_frequency(STATE_FREQUENCIES[state])
		frequency_changed.emit(state, _previous_state)
		frequency_shift_completed.emit(state)
		print("[FrequencyShift] Instant shift to %s" % STATE_NAMES[state])
	else:
		_shift_progress = 0.0
		_is_shifting = true
		frequency_shift_started.emit(state)
		frequency_changed.emit(state, _previous_state)
		print("[FrequencyShift] Starting shift to %s (duration: %.1fs)" % [STATE_NAMES[state], _shift_duration])

func shift_to_living(instant: bool = false) -> void:
	shift_to(FreqState.LIVING, instant)

func shift_to_shadow(instant: bool = false) -> void:
	shift_to(FreqState.SHADOW, instant)

func shift_to_in_between(instant: bool = false) -> void:
	shift_to(FreqState.IN_BETWEEN, instant)

func toggle_living_shadow() -> void:
	if _current_state == FreqState.LIVING:
		shift_to_shadow()
	elif _current_state == FreqState.SHADOW:
		shift_to_living()
	else:
		# If in-between, go to whichever was previous
		shift_to(_previous_state)

func set_zone(zone_name: String) -> void:
	if not _auto_shift_enabled:
		return
	var default_state: int = ZONE_DEFAULTS.get(zone_name, FreqState.LIVING)
	if default_state != _current_state:
		shift_to(default_state)

# === CONFIGURATION ===

func set_shift_duration(seconds: float) -> void:
	_shift_duration = max(0.1, seconds)

func set_auto_shift(enabled: bool) -> void:
	_auto_shift_enabled = enabled

func get_auto_shift() -> bool:
	return _auto_shift_enabled

# === VISUAL HELPERS ===
# Games use these to adjust rendering based on frequency state

func get_color_modifier() -> Color:
	# Returns a color tint based on current state
	# Living: warm amber (no tint modification)
	# Shadow: cool blue desaturation
	# In-Between: purple transitional
	match _current_state:
		FreqState.LIVING:
			return Color(1.0, 0.95, 0.85, 1.0)  # Warm amber
		FreqState.SHADOW:
			return Color(0.6, 0.65, 0.85, 1.0)  # Cool blue
		FreqState.IN_BETWEEN:
			return Color(0.75, 0.65, 0.9, 1.0)  # Purple transitional
	return Color.WHITE

func get_saturation_multiplier() -> float:
	# Living: full saturation, Shadow: desaturated, In-Between: half
	match _current_state:
		FreqState.LIVING: return 1.0
		FreqState.SHADOW: return 0.5
		FreqState.IN_BETWEEN: return 0.75
	return 1.0

func get_brightness_multiplier() -> float:
	# Living: full bright, Shadow: darker, In-Between: mid
	match _current_state:
		FreqState.LIVING: return 1.0
		FreqState.SHADOW: return 0.7
		FreqState.IN_BETWEEN: return 0.85
	return 1.0

func get_particle_density() -> float:
	# Visual particle effects density by state
	# Living: ambient dust motes, Shadow: shadow wisps, In-Between: both
	match _current_state:
		FreqState.LIVING: return 0.3
		FreqState.SHADOW: return 0.6
		FreqState.IN_BETWEEN: return 1.0
	return 0.3

# === WHISPER LAYER INTEGRATION ===
# The Whisper Layer manifests differently in each frequency state
func get_whisper_intensity() -> float:
	# Whisper Layer is subtle in Living, stronger in Shadow, peak in In-Between
	match _current_state:
		FreqState.LIVING: return 0.2
		FreqState.SHADOW: return 0.6
		FreqState.IN_BETWEEN: return 1.0
	return 0.2

func get_whisper_text_opacity() -> float:
	# How visible whisper text is
	match _current_state:
		FreqState.LIVING: return 0.0  # Not visible — only heard
		FreqState.SHADOW: return 0.3  # Partially visible
		FreqState.IN_BETWEEN: return 0.7  # Most visible
	return 0.0

# === GAMEPLAY IMPACT ===
# Games can query these to modify gameplay based on frequency

func get_difficulty_multiplier() -> float:
	# Shadow is harder, In-Between is unpredictable
	match _current_state:
		FreqState.LIVING: return 1.0
		FreqState.SHADOW: return 1.5
		FreqState.IN_BETWEEN: return 1.25
	return 1.0

func get_enemy_aggression() -> float:
	match _current_state:
		FreqState.LIVING: return 0.5
		FreqState.SHADOW: return 1.0
		FreqState.IN_BETWEEN: return 0.75
	return 0.5

func get_stone_rarity_bonus() -> float:
	# Shadow mode gives rarer stones
	match _current_state:
		FreqState.LIVING: return 0.0
		FreqState.SHADOW: return 0.15   # 15% better drop rates
		FreqState.IN_BETWEEN: return 0.08
	return 0.0

# === SAVE STATE ===
func get_save_data() -> Dictionary:
	return {
		"current_state": _current_state,
		"shift_count": _shift_count,
		"auto_shift": _auto_shift_enabled
	}

func load_save_data(data: Dictionary) -> void:
	_current_state = data.get("current_state", FreqState.LIVING)
	_shift_count = data.get("shift_count", 0)
	_auto_shift_enabled = data.get("auto_shift", true)
	_visual_intensity = _state_to_visual(_current_state)
	_audio_modulation = _visual_intensity
	if AudioManager:
		AudioManager.set_frequency(STATE_FREQUENCIES[_current_state])
	print("[FrequencyShift] Loaded: state=%s, shifts=%d" % [STATE_NAMES[_current_state], _shift_count])
