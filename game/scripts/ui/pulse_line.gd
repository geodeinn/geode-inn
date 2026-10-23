class_name PulseLine
extends Control
## The Pulse Line (walk-through 1.5): a thin amber ECG line at the bottom of
## every screen, beating at 50 BPM. It is the Inn's vital sign, not a score.
## It also drives the other two modalities so all three stay in sync: on every
## beat it plays the heartbeat sound (audio) and a short rumble (haptic).
##
## Modes: baseline, nook, combat (harmonization). Warmth -1..1 shows how close
## the player is to a frequency node (warmer = taller spikes, tighter spacing).

signal beat(index: int)

const BASE_COLOR := Color(0.91, 0.69, 0.29)
const WARM_COLOR := Color(1.0, 0.62, 0.2)
const COLD_COLOR := Color(0.62, 0.7, 0.78)
const NOOK_COLOR := Color(0.85, 0.5, 0.18)

var mode := "baseline"
var warmth := 0.0           # -1 cold .. 1 warm
var alignment := 0.0        # combat: 0 discordant .. 1 merged
var merged := false
var speaker_muted := false  # Final Room: the heartbeat is felt, never heard
var second_offset := -1.0   # Final Room presence: second heartbeat, as a fraction of a beat (-1 = none)
var judge := BeatJudge.new(50.0)
var _last_beat := -1
var _flash := 0.0


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	judge = BeatJudge.new(GameData.heartbeat_bpm())
	_fit()


## Spans the bottom of the screen. Sized from the viewport each frame so it
## stays right through window resizes and any parent layout.
func _fit() -> void:
	var vp := get_viewport_rect().size
	position = Vector2(0.0, vp.y - 70.0)
	size = Vector2(vp.x, 62.0)


func _process(delta: float) -> void:
	_fit()
	var t := Net.clock()
	var b := judge.nearest_beat(t)
	if judge.phase(t) < 0.5 and b != _last_beat:
		_last_beat = b
		_on_beat(b)
	_flash = maxf(_flash - delta * 3.0, 0.0)
	queue_redraw()


func _on_beat(index: int) -> void:
	_flash = 1.0
	# In a nook the heartbeat comes forward (the SIT mechanic), never back.
	var strength := 1.35 if mode == "nook" else 1.0
	if not speaker_muted:
		AudioDirector.heartbeat_tick(strength)
	if Settings.effective_pulse_haptic():
		for pad in Input.get_connected_joypads():
			Input.start_joy_vibration(pad, 0.25 * strength, 0.0, 0.09)
	beat.emit(index)


func _draw() -> void:
	if not Settings.effective_pulse_visual():
		return
	var w := size.x
	var h := size.y
	var base_y := h * 0.7
	var t := Net.clock()
	var silent := Settings.silent_mode
	var minimal := Settings.minimal_mode
	var warm01 := (warmth + 1.0) * 0.5
	var color := BASE_COLOR
	var alpha := 0.65
	var width := 1.6
	var amp := h * 0.55
	var window := 4.8   # seconds across the screen = 4 beats
	match mode:
		"nook":
			color = NOOK_COLOR
			alpha = 0.85
			width = 2.0
		"combat":
			alpha = 0.75
		_:
			if warmth > 0.0:
				color = BASE_COLOR.lerp(WARM_COLOR, warmth)
			elif warmth < 0.0:
				color = BASE_COLOR.lerp(COLD_COLOR, -warmth)
			amp *= lerpf(0.65, 1.3, warm01)
			window = lerpf(6.0, 3.6, warm01)
	if silent:
		alpha = 0.88
		width = 2.6
	alpha = minf(1.0, alpha + _flash * 0.2)
	_draw_trace(w, base_y, amp, window, t, 0.0, Color(color, alpha), width, minimal or mode == "nook")
	# The second heartbeat in the Final Room. The spec gives it as a haptic only;
	# players without a controller see it here instead, faint, until it lands in step.
	if second_offset > 0.001 and Input.get_connected_joypads().is_empty():
		_draw_trace(w, base_y, amp * 0.8, window, t, -second_offset, Color(color, alpha * 0.35), width, minimal or mode == "nook")
	if mode == "combat" and not merged:
		# The being's line: off-tempo and out of phase, pulled in as alignment rises.
		var detune := lerpf(0.37, 0.0, alignment)
		var shift := lerpf(0.5, 0.0, alignment)
		var discord := Color(0.62, 0.78, 0.95, lerpf(0.75, 0.35, alignment))
		_draw_trace(w, base_y, amp * lerpf(0.8, 1.0, alignment), window * (1.0 + detune), t, shift, discord, width, minimal)


func _draw_trace(w: float, base_y: float, amp: float, window: float, t: float, phase_shift: float, color: Color, width: float, spike_only: bool) -> void:
	var points := PackedVector2Array()
	var steps := int(clampf(w / 3.0, 60.0, 700.0))
	for i in steps + 1:
		var x := w * float(i) / float(steps)
		# Newest time on the right, scrolling left like a monitor.
		var sample_t := t - window * (1.0 - float(i) / float(steps))
		# +0.19 puts the QRS spike exactly on the beat, so "hit when it spikes" is on time.
		var ph := fposmod(sample_t / judge.interval_s() + phase_shift + 0.19, 1.0)
		points.append(Vector2(x, base_y - ecg(ph, spike_only) * amp))
	draw_polyline(points, color, width, true)


## One heartbeat: small P wave, the sharp QRS spike, a rounded T wave.
static func ecg(ph: float, spike_only := false) -> float:
	var y := 0.0
	if not spike_only:
		y += 0.1 * exp(-pow((ph - 0.1) / 0.025, 2.0))
		y += 0.18 * exp(-pow((ph - 0.32) / 0.045, 2.0))
	y += -0.12 * exp(-pow((ph - 0.175) / 0.008, 2.0))
	y += 1.0 * exp(-pow((ph - 0.19) / 0.009, 2.0))
	y += -0.22 * exp(-pow((ph - 0.205) / 0.009, 2.0))
	return y
