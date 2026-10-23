extends Node
## All game sound is synthesized from the client's audio engine settings
## (data/audio_profiles.json), so the game rings the same notes as geodeinn.com.
##
## Bus layout, built at startup:
##   Master <- Soulstice (client's EQ curve) <- Music, Voices, Effects, Pulse
##   Effects <- Drv_<driver> (one bus per driver profile: its filter lives there)

const MIX_RATE := 22050
const POOL_SIZE := 24
const DRIVER_PREFIX := "Drv_"
const STONE_LIFT_DB := 15.0

var current_room := "Main Floor"
var _players: Array[AudioStreamPlayer] = []
var _next_player := 0
var _cache: Dictionary = {}
var _rng := RandomNumberGenerator.new()


func _ready() -> void:
	_rng.seed = 4242
	_build_buses()
	for i in POOL_SIZE:
		var p := AudioStreamPlayer.new()
		p.name = "Voice%d" % i
		add_child(p)
		_players.append(p)
	EventBus.settings_changed.connect(apply_volumes)
	apply_volumes()


# ---------------------------------------------------------------- buses

func _build_buses() -> void:
	_ensure_bus("Soulstice", "Master")
	for b in ["Music", "Voices", "Effects", "Pulse"]:
		_ensure_bus(b, "Soulstice")
	var profiles: Dictionary = GameData.audio.get("driver_profiles", {})
	for driver in profiles.keys():
		var bus := _ensure_bus(DRIVER_PREFIX + driver, "Effects")
		_apply_driver_filter(bus, profiles[driver])
		# The site's stone gains are quiet (measured -38 dBFS through the band-pass).
		# Same timbre and balance between drivers, lifted to sit with the voices.
		AudioServer.set_bus_volume_db(bus, STONE_LIFT_DB)
	apply_eq(GameData.eq_preset)


func _ensure_bus(bus_name: String, send_to: String) -> int:
	var idx := AudioServer.get_bus_index(bus_name)
	if idx == -1:
		AudioServer.add_bus()
		idx = AudioServer.bus_count - 1
		AudioServer.set_bus_name(idx, bus_name)
	AudioServer.set_bus_send(idx, send_to)
	return idx


func _apply_driver_filter(bus: int, profile: Dictionary) -> void:
	while AudioServer.get_bus_effect_count(bus) > 0:
		AudioServer.remove_bus_effect(bus, 0)
	var f: Dictionary = profile.get("filter", {})
	var freq := float(f.get("freq", 1000.0))
	var q := float(f.get("q", 0.7))
	var effect: AudioEffect = null
	match String(f.get("type", "")):
		"lowpass":
			effect = AudioEffectLowPassFilter.new()
		"highpass":
			effect = AudioEffectHighPassFilter.new()
		"bandpass":
			effect = AudioEffectBandPassFilter.new()
		"peaking":
			var eq := AudioEffectEQ6.new()
			# EQ6 bands: 32, 100, 320, 1000, 3200, 10000 Hz. Boost the band nearest freq.
			var bands := [32.0, 100.0, 320.0, 1000.0, 3200.0, 10000.0]
			var best := 0
			for i in bands.size():
				if absf(log(bands[i] / freq)) < absf(log(bands[best] / freq)):
					best = i
			eq.set_band_gain_db(best, 4.0)
			effect = eq
		_:
			effect = null  # allpass changes phase only, so no magnitude effect is needed
	if effect is AudioEffectFilter:
		var flt := effect as AudioEffectFilter
		flt.cutoff_hz = freq
		flt.resonance = clampf(q / 2.0, 0.05, 1.0)
	if effect != null:
		AudioServer.add_bus_effect(bus, effect)


## Loads the client's EQ curve onto the Soulstice bus.
func apply_eq(preset: Dictionary) -> void:
	var bus := AudioServer.get_bus_index("Soulstice")
	if bus == -1:
		return
	while AudioServer.get_bus_effect_count(bus) > 0:
		AudioServer.remove_bus_effect(bus, 0)
	if not bool(preset.get("enabled", false)):
		return
	var eq := AudioEffectEQ10.new()
	var gains: Array = preset.get("gain_db", [])
	for i in mini(gains.size(), eq.get_band_count()):
		eq.set_band_gain_db(i, float(gains[i]))
	AudioServer.add_bus_effect(bus, eq)


func apply_volumes() -> void:
	_set_volume("Master", Settings.master_volume)
	_set_volume("Music", Settings.music_volume)
	_set_volume("Voices", Settings.voices_volume)
	_set_volume("Effects", Settings.effects_volume)
	_set_volume("Pulse", Settings.effects_volume if Settings.effective_pulse_audio() else 0.0)


func _set_volume(bus_name: String, linear: float) -> void:
	var idx := AudioServer.get_bus_index(bus_name)
	if idx != -1:
		AudioServer.set_bus_volume_db(idx, linear_to_db(maxf(linear, 0.0001)))
		AudioServer.set_bus_mute(idx, linear <= 0.0001)


func set_room(room: String) -> void:
	current_room = room


# ---------------------------------------------------------------- playback

## Same as the site's playStoneTone: the stone's note through the room's
## driver profile, at a quarter of the driver gain, over a quiet 42Hz drone.
func play_stone(stone_id: String, duration := 2.0, with_drone := true) -> void:
	var hz := GameData.stone_hz(stone_id)
	if hz < 100.0:
		hz *= 8.0  # sub-audio stones (the 41.7Hz Self Stone) ring three octaves up so speakers can play them
	var driver := GameData.room_driver(current_room)
	var profile := GameData.driver_profile(driver)
	play_shaped(hz, duration, driver, float(profile.get("gain", 0.18)) * 0.25)
	if with_drone:
		play_freq(GameData.song_root_hz(), duration, "sine", 0.04, "Music")


## Port of the site's shapeTone: oscillator, driver filter (on the bus),
## exponential attack and release, plus sub-bass and shimmer layers.
func play_shaped(hz: float, duration: float, driver: String, gain: float) -> void:
	var profile := GameData.driver_profile(driver)
	var key := "shape|%s|%d|%d|%d" % [driver, int(hz * 10.0), int(duration * 100.0), int(gain * 1000.0)]
	var stream: AudioStreamWAV = _cache.get(key)
	if stream == null:
		var layers := [{ "hz": hz, "wave": String(profile.get("osc", "sine")), "gain": gain, "attack": 0.05 }]
		if bool(profile.get("sub_bass", false)):
			layers.append({ "hz": hz / 2.0, "wave": "sine", "gain": gain * 0.6, "attack": 0.08 })
		if bool(profile.get("shimmer", false)):
			layers.append({ "hz": hz * 2.0, "wave": "sine", "gain": gain * 0.3, "attack": 0.1 })
		stream = synth_layers(layers, duration)
		_cache[key] = stream
	_play(stream, DRIVER_PREFIX + driver)


func play_freq(hz: float, duration := 0.5, wave := "sine", gain := 0.18, bus := "Effects") -> void:
	var key := "freq|%s|%d|%d|%d" % [wave, int(hz * 10.0), int(duration * 100.0), int(gain * 1000.0)]
	var stream: AudioStreamWAV = _cache.get(key)
	if stream == null:
		stream = synth_layers([{ "hz": hz, "wave": wave, "gain": gain, "attack": 0.03 }], duration)
		_cache[key] = stream
	_play(stream, bus)


func play_chord(freqs: Array, duration := 1.4) -> void:
	for i in freqs.size():
		play_freq(float(freqs[i]), duration, "sine", maxf(0.06, 0.14 - i * 0.015))


## One tick of the Inn's heartbeat. The site plays the 42Hz root for 0.18s at
## gain 0.06; laptop speakers can't reproduce 42Hz, so a soft two-octave-up
## layer is added to keep the audio modality usable without headphones.
func heartbeat_tick(strength := 1.0) -> void:
	if not Settings.effective_pulse_audio():
		return
	var root := GameData.song_root_hz()
	play_freq(root, 0.2, "sine", 0.06 * strength, "Pulse")
	play_freq(root * 4.0, 0.14, "sine", 0.08 * strength, "Pulse")


## A letter of dialogue in a character's instrument voice.
func voice_blip(voice: Dictionary, letter_index: int) -> void:
	var instrument := String(voice.get("instrument", "lute"))
	var base := float(voice.get("base_hz", 160.0))
	var expressiveness := float(voice.get("expressiveness", 0.3))
	var semis := _rng.randf_range(-4.0, 4.0) * expressiveness
	if letter_index % 7 == 0:
		semis += 2.0 * expressiveness
	var hz := base * pow(2.0, roundf(semis) / 12.0)
	# Speak an octave up so low voices stay audible on small speakers.
	if hz < 160.0:
		hz *= 2.0
	var dur := clampf(float(voice.get("reveal_ms", 45.0)) / 1000.0 * 2.2, 0.06, 0.18)
	var key := "voice|%s|%d|%d" % [instrument, int(hz), int(dur * 1000.0)]
	var stream: AudioStreamWAV = _cache.get(key)
	if stream == null:
		stream = synth_instrument(instrument, hz, dur, 0.22)
		_cache[key] = stream
	_play(stream, "Voices")


## One crack of a real fire: a short burst of filtered noise. Each call picks one
## of a few cached variants so no two crackles in a row sound the same.
func crackle(variant: int) -> void:
	var v := posmod(variant, 6)
	var key := "crackle|%d" % v
	var stream: AudioStreamWAV = _cache.get(key)
	if stream == null:
		var n := int(MIX_RATE * (0.03 + v * 0.012))
		var data := PackedFloat32Array()
		data.resize(n)
		var s := 1013904223 + v * 7919
		var lp := 0.0
		for i in n:
			s = (s * 1664525 + 1013904223) & 0x7fffffff
			var r := float(s) / float(0x7fffffff) * 2.0 - 1.0
			lp += (r - lp) * (0.35 + v * 0.06)
			data[i] = lp * pow(1.0 - float(i) / n, 3.0) * (0.25 + v * 0.03)
		stream = _to_wav(data)
		_cache[key] = stream
	_play(stream, "Effects")


func ui_tick() -> void:
	play_freq(880.0, 0.05, "triangle", 0.06, "Effects")


## A tap on a surface, in that material's own voice (drum circle, Seven Sisters).
func tap(instrument: String, hz: float, gain := 0.5) -> void:
	var key := "tap|%s|%d|%d" % [instrument, int(hz), int(gain * 100.0)]
	var stream: AudioStreamWAV = _cache.get(key)
	if stream == null:
		var dur := 0.6 if instrument in ["tap_metal", "chime"] else 0.22
		stream = synth_instrument(instrument, hz, dur, gain)
		_cache[key] = stream
	_play(stream, "Effects")


## One beat of the gathering work-song: felling, quarrying, digging, panning,
## smelting, spinning, thatching. Seven gathers, one rhythm.
func work(kind: String) -> void:
	match kind:
		"felling":
			tap("tap_wood", 180.0, 0.45)
		"quarrying":
			tap("tap_stone", 300.0, 0.4)
		"digging":
			tap("tap_earth", 85.0, 0.5)
		"panning":
			tap("tap_soft", 520.0, 0.3)
		"smelting":
			tap("tap_metal", 440.0, 0.25)
		"spinning":
			tap("tap_soft", 260.0, 0.25)
		_:
			tap("tap_soft", 380.0, 0.3)


## Elio's motif: the 42Hz root under its harmonics, rising softly. It plays
## only when the Inn-Voice speaks.
func elio_motif() -> void:
	var notes: Array = GameData.world.get("voice_of_the_inn", {}).get("motif_hz", [42, 168, 210, 252, 336])
	for i in notes.size():
		var hz := float(notes[i])
		if i == 0:
			play_freq(hz, 3.2, "sine", 0.08, "Music")
			play_freq(hz * 4.0, 3.0, "sine", 0.03, "Music")
		else:
			get_tree().create_timer(0.35 * i).timeout.connect(play_freq.bind(hz, 2.2, "sine", 0.05, "Music"))


# ---------------------------------------------------------------- the hum

var _hum: AudioStreamPlayer


## The 42Hz hum of a nook or a home you built, heard only while sitting still.
## A faint two-octave layer rides on top so small speakers carry it.
func set_hum(on: bool) -> void:
	if _hum == null:
		_hum = AudioStreamPlayer.new()
		_hum.name = "Hum"
		add_child(_hum)
		var root := GameData.song_root_hz()
		var seconds := 1.0 / root * 42.0   # a whole number of cycles of both layers, so the loop is seamless
		var n := int(MIX_RATE * seconds)
		var data := PackedFloat32Array()
		data.resize(n)
		for i in n:
			var t := float(i) / MIX_RATE
			data[i] = sin(TAU * root * t) * 0.10 + sin(TAU * root * 4.0 * t) * 0.025
		var wav := _to_wav(data)
		wav.loop_mode = AudioStreamWAV.LOOP_FORWARD
		wav.loop_begin = 0
		wav.loop_end = n
		_hum.stream = wav
		_hum.bus = "Music" if AudioServer.get_bus_index("Music") != -1 else "Master"
	if on == _hum_wanted:
		return
	_hum_wanted = on
	if _hum_tween != null and _hum_tween.is_valid():
		_hum_tween.kill()
	_hum_tween = create_tween()
	if on:
		if not _hum.playing:
			_hum.volume_db = -80.0
			_hum.play()
		_hum_tween.tween_property(_hum, "volume_db", 0.0, 2.5)
	else:
		_hum_tween.tween_property(_hum, "volume_db", -80.0, 1.2)
		_hum_tween.tween_callback(_hum.stop)


var _hum_wanted := false
var _hum_tween: Tween


func hum_on() -> bool:
	return _hum_wanted


func _play(stream: AudioStream, bus: String) -> void:
	var p := _players[_next_player]
	_next_player = (_next_player + 1) % _players.size()
	p.stream = stream
	p.bus = bus if AudioServer.get_bus_index(bus) != -1 else "Master"
	p.play()


# ---------------------------------------------------------------- synthesis

## Renders oscillator layers into a 16-bit mono WAV with the site's envelope:
## exponential ramp from silence to gain, then exponential release to silence.
static func synth_layers(layers: Array, duration: float) -> AudioStreamWAV:
	var n := int(MIX_RATE * duration)
	var data := PackedFloat32Array()
	data.resize(n)
	for layer in layers:
		var hz := float(layer["hz"])
		var gain := float(layer["gain"])
		var attack := maxf(float(layer.get("attack", 0.05)), 0.005)
		var wave := String(layer.get("wave", "sine"))
		var phase := 0.0
		var step := hz / MIX_RATE
		for i in n:
			var t := float(i) / MIX_RATE
			var env: float
			if t < attack:
				env = 0.0001 * pow(gain / 0.0001, t / attack)
			else:
				env = gain * pow(0.0001 / gain, (t - attack) / maxf(duration - attack, 0.001))
			data[i] += _wave(wave, phase) * env
			phase += step
			if phase >= 1.0:
				phase -= 1.0
	return _to_wav(data)


## Additive instrument for voices and drums (data/instruments.json).
func synth_instrument(instrument: String, hz: float, duration: float, gain: float) -> AudioStreamWAV:
	var spec: Dictionary = GameData.instruments.get(instrument, GameData.instruments.get("lute", {}))
	var harmonics: Array = spec.get("harmonics", [1.0])
	var attack := maxf(float(spec.get("attack", 0.005)), 0.001)
	var decay := maxf(float(spec.get("decay", 0.15)), 0.02)
	var noise := float(spec.get("noise", 0.0))
	var vibrato := float(spec.get("vibrato", 0.0))
	var pitch_drop := float(spec.get("pitch_drop", 0.0))
	var n := int(MIX_RATE * duration)
	var data := PackedFloat32Array()
	data.resize(n)
	var norm := 0.0
	for h in harmonics:
		norm += float(h)
	norm = maxf(norm, 1.0)
	var seed_state := int(hz * 1000.0) ^ instrument.hash()
	var phases := PackedFloat32Array()
	phases.resize(harmonics.size())
	for i in n:
		var t := float(i) / MIX_RATE
		var env := (t / attack) if t < attack else exp(-(t - attack) / decay)
		var f := hz * (1.0 - pitch_drop * minf(t / 0.08, 1.0) * 0.5)
		if vibrato > 0.0:
			f *= 1.0 + 0.004 * sin(TAU * vibrato * t)
		var s := 0.0
		for k in harmonics.size():
			var amp := float(harmonics[k])
			if amp <= 0.0:
				continue
			phases[k] = fmod(phases[k] + f * (k + 1) / MIX_RATE, 1.0)
			s += sin(TAU * phases[k]) * amp
		s /= norm
		if noise > 0.0:
			seed_state = (seed_state * 1103515245 + 12345) & 0x7fffffff
			var r := float(seed_state) / float(0x7fffffff) * 2.0 - 1.0
			s += r * noise * exp(-t / 0.03)
		data[i] = s * env * gain
	return _to_wav(data)


static func _wave(wave: String, phase: float) -> float:
	match wave:
		"triangle":
			return 4.0 * absf(phase - 0.5) - 1.0
		"square":
			return 1.0 if phase < 0.5 else -1.0
		"sawtooth":
			return 2.0 * phase - 1.0
		_:
			return sin(TAU * phase)


static func _to_wav(data: PackedFloat32Array) -> AudioStreamWAV:
	var bytes := PackedByteArray()
	bytes.resize(data.size() * 2)
	for i in data.size():
		bytes.encode_s16(i * 2, int(clampf(data[i], -1.0, 1.0) * 32767.0))
	var wav := AudioStreamWAV.new()
	wav.format = AudioStreamWAV.FORMAT_16_BITS
	wav.mix_rate = MIX_RATE
	wav.stereo = false
	wav.data = bytes
	return wav
