class_name BeatJudge
extends RefCounted
## The Inn's heartbeat clock: 50 BPM, so a beat lands every 1.2 seconds. The
## Pulse Line, the gathering work-song and the Final Room's fire all keep time
## with it. Nothing is ever scored against it.

var bpm := 50.0


func _init(beats_per_minute := 50.0) -> void:
	bpm = beats_per_minute


func interval_s() -> float:
	return 60.0 / bpm


## Index of the beat nearest to time t (seconds on the shared clock).
func nearest_beat(t: float) -> int:
	return int(round(t / interval_s()))


## Signed distance in ms from the nearest beat. Negative is early.
func offset_ms(t: float) -> float:
	return (t - nearest_beat(t) * interval_s()) * 1000.0


## 0 at a beat, rising to 1 just before the next. Drives the Pulse Line spike.
func phase(t: float) -> float:
	return fposmod(t, interval_s()) / interval_s()
