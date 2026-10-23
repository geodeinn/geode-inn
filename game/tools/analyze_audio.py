"""Checks the recorded game audio (Movie Maker WAV) rings the expected notes.

Usage: python -I tools/analyze_audio.py test_output/audio/frame.wav
Prints the strongest frequency in each window and PASS/FAIL per expected note.

The site's "dynamic" driver adds a sub-bass layer an octave below the note
(audio_profiles.json, sub_bass: true), so through that driver the strongest
peak can be the sub-octave. Those windows pass when the strongest peak is the
note or its sub-octave AND the note itself is within 12 dB of the strongest.
"""
import sys
import wave

import numpy as np

EXPECTED = [
    # (start s, end s, expected Hz, label, through the dynamic driver)
    (0.65, 1.6, 493.9, "Clear Quartz in the Main Floor (B4)", False),
    (2.65, 3.6, 349.2, "Malachite in the Catacombs (F4)", True),
    (4.6, 5.4, 329.6, "The third sister, tapped (E4)", True),
    (8.0, 9.6, 168.0, "The nook's 42Hz hum, its 168 Hz layer", False),
]


def level_at(freqs, spec, hz):
    near = (freqs > hz - 4.0) & (freqs < hz + 4.0)
    return spec[near].max() if near.any() else 0.0


def main(path: str) -> int:
    with wave.open(path, "rb") as w:
        rate = w.getframerate()
        channels = w.getnchannels()
        width = w.getsampwidth()
        raw = w.readframes(w.getnframes())
    dtype = {2: np.int16, 4: np.int32}[width]
    data = np.frombuffer(raw, dtype=dtype).astype(np.float64)
    if channels > 1:
        data = data.reshape(-1, channels).mean(axis=1)
    print(f"{path}: {rate} Hz, {channels} ch, {len(data) / rate:.2f} s, peak {np.abs(data).max():.0f}")
    ok = True
    for start, end, want, label, sub in EXPECTED:
        seg = data[int(start * rate):int(end * rate)]
        seg = seg * np.hanning(len(seg))
        spec = np.abs(np.fft.rfft(seg))
        freqs = np.fft.rfftfreq(len(seg), 1.0 / rate)
        band = (freqs > 120) & (freqs < 2000)
        peak = freqs[band][np.argmax(spec[band])]
        top = spec[band].max()
        note_db = 20 * np.log10(level_at(freqs, spec, want) / top + 1e-12)
        full_scale = float(2 ** (8 * width - 1))
        level = 20 * np.log10(np.abs(data[int(start * rate):int(end * rate)]).max() / full_scale + 1e-12)
        if sub:
            good = (abs(peak - want) < 4.0 or abs(peak - want / 2.0) < 4.0) and note_db > -12.0
        else:
            good = abs(peak - want) < 4.0
        ok = ok and good
        print(f"{'PASS' if good else 'FAIL'} {label}: strongest {peak:.1f} Hz, the note {want} Hz at {note_db:.1f} dB of it, level {level:.1f} dBFS")
    print("AUDIO CHECK PASSED" if ok else "AUDIO CHECK FAILED")
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1]))
