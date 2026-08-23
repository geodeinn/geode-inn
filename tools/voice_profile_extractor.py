#!/usr/bin/env python3
"""
Geode Inn — Voice Profile Extractor
Extracts cadence and tone data from audio clips and outputs Godot-ready voice profiles.

Usage:
    python voice_profile_extractor.py <audio_file> [--name "Character Name"] [--actor "Reference Actor"]

Example:
    python voice_profile_extractor.py clips/stewart_sample.wav --name "The Host" --actor "Patrick Stewart"

Requirements:
    pip install librosa numpy scipy

Output:
    A Godot-ready voice profile (JSON + human-readable summary) with:
    - text_reveal_speed: ms per character (how fast dialogue text appears)
    - pause_between_sentences: ms (silence duration between text blocks)
    - pause_between_words: ms (intra-sentence pauses)
    - pitch_baseline: Hz (fundamental frequency — the actor's vocal range center)
    - pitch_range: Hz (variance — expressiveness of delivery)
    - pitch_min / pitch_max: Hz (vocal range bounds)
    - speaking_rate: words per minute (overall pace)
    - tempo: BPM (rhythmic quality of speech)
    - recommended_instrument: mapped from pitch and tone qualities
    - instrument_frequency: Hz (matched to pitch_baseline)
    - expressiveness: 0.0-1.0 (how varied the pitch is — monotone to dynamic)
    - cadence_pattern: description of rhythm (steady, erratic, measured, flowing)
"""

import argparse
import json
import sys
import os

try:
    import librosa
    import numpy as np
    from scipy.signal import savgol_filter
    DEPS_AVAILABLE = True
except ImportError as e:
    DEPS_AVAILABLE = False
    _IMPORT_ERROR = str(e)

def check_dependencies():
    if not DEPS_AVAILABLE:
        print(f"Missing dependency: {_IMPORT_ERROR}")
        print("\nInstall with: pip install librosa numpy scipy")
        return False
    return True

def extract_f0(y, sr):
    """Extract fundamental frequency (pitch) over time using pyin."""
    f0, voiced_flag, voiced_probs = librosa.pyin(
        y, fmin=60, fmax=400, sr=sr
    )
    # Get only voiced frames (where pitch was detected)
    voiced_f0 = f0[~np.isnan(f0)]
    return voiced_f0, f0, voiced_flag

def detect_pauses(y, sr, frame_length=2048, hop_length=512, threshold_db=-40):
    """Detect silence/pauses in the audio."""
    # Compute RMS energy
    rms = librosa.feature.rms(y=y, frame_length=frame_length, hop_length=hop_length)[0]
    # Convert to dB
    rms_db = librosa.amplitude_to_db(rms)
    # Find silent frames
    silent_frames = rms_db < threshold_db
    # Find pause segments (consecutive silent frames)
    pauses = []
    in_pause = False
    pause_start = 0
    for i, silent in enumerate(silent_frames):
        frame_time = i * hop_length / sr
        if silent and not in_pause:
            in_pause = True
            pause_start = frame_time
        elif not silent and in_pause:
            in_pause = False
            pause_duration = frame_time - pause_start
            if pause_duration > 0.1:  # Only count pauses > 100ms
                pauses.append({
                    'start': pause_start,
                    'duration': pause_duration
                })
    return pauses

def estimate_speaking_rate(y, sr, pauses):
    """Estimate words per minute based on speech segments."""
    total_duration = len(y) / sr
    # Subtract pause time
    total_pause_time = sum(p['duration'] for p in pauses)
    speech_duration = total_duration - total_pause_time
    # Rough estimate: average English speech has ~0.35 seconds per syllable
    # Average word has ~1.5 syllables, so ~0.525 seconds per word
    if speech_duration > 0:
        estimated_words = speech_duration / 0.525
        wpm = (estimated_words / total_duration) * 60
    else:
        wpm = 0
    return wpm

def map_to_text_reveal_speed(wpm):
    """Map speaking rate (WPM) to text reveal speed (ms per character)."""
    # Average English word is ~5 characters + 1 space = 6 chars
    # At 150 WPM (average), that's 900 chars/min = 15 chars/sec = 66ms per char
    # Slower speakers get higher ms (slower reveal)
    if wpm <= 0:
        return 50  # default
    chars_per_minute = wpm * 6
    chars_per_second = chars_per_minute / 60
    ms_per_char = int(1000 / chars_per_second) if chars_per_second > 0 else 50
    # Clamp to reasonable range (10ms = very fast, 120ms = very slow)
    return max(10, min(120, ms_per_char))

def map_to_pause_duration(pauses):
    """Map detected pauses to Godot pause parameters."""
    if not pauses:
        return {
            'pause_between_sentences': 800,
            'pause_between_words': 200,
            'longest_pause': 0,
            'average_pause': 0
        }
    # Sort pauses by duration
    pause_durations = [p['duration'] * 1000 for p in pauses]  # convert to ms
    # Long pauses (> 800ms) are likely sentence boundaries
    sentence_pauses = [d for d in pause_durations if d > 800]
    word_pauses = [d for d in pause_durations if d <= 800]
    avg_sentence_pause = int(sum(sentence_pauses) / len(sentence_pauses)) if sentence_pauses else 800
    avg_word_pause = int(sum(word_pauses) / len(word_pauses)) if word_pauses else 200
    return {
        'pause_between_sentences': max(200, min(3000, avg_sentence_pause)),
        'pause_between_words': max(50, min(800, avg_word_pause)),
        'longest_pause': int(max(pause_durations)),
        'average_pause': int(sum(pause_durations) / len(pause_durations))
    }

def recommend_instrument(pitch_baseline, expressiveness, tempo):
    """Recommend an instrument based on pitch and delivery qualities."""
    # Low voices (60-110 Hz) — male range
    if pitch_baseline < 110:
        if expressiveness > 0.5:
            return 'cello_sustain'  # expressive low = cello
        elif tempo < 80:
            return 'taiko_drum'  # slow, weighty = deep drum
        else:
            return 'bass_viola'  # steady low = bass
    # Medium-low (110-160 Hz)
    elif pitch_baseline < 160:
        if expressiveness > 0.6:
            return 'viola_sustain'  # expressive mid = viola
        else:
            return 'piano_single_note'  # measured mid = piano
    # Medium-high (160-220 Hz)
    elif pitch_baseline < 220:
        if expressiveness > 0.6:
            return 'violin_pizzicato'  # expressive high = violin
        elif tempo > 120:
            return 'flute_staccato'  # fast high = flute
        else:
            return 'harp_pluck'  # measured high = harp
    # High (220+ Hz)
    else:
        if expressiveness > 0.5:
            return 'flute_sustain'  # expressive very high = flute
        else:
            return 'bell_clean'  # precise very high = bell
    return 'cello_sustain'  # fallback

def classify_cadence(tempo, expressiveness, pause_variance):
    """Classify the cadence pattern for design documentation."""
    if tempo < 70 and expressiveness < 0.3:
        return 'measured'  # slow, monotone — Hopkins as the Crone
    elif tempo < 70 and expressiveness > 0.5:
        return 'deliberate'  # slow but expressive — Stewart as the Host
    elif tempo > 120 and expressiveness > 0.6:
        return 'erratic'  # fast and dynamic — Carter as the Catalyst
    elif tempo > 120 and expressiveness < 0.4:
        return 'overflow'  # fast and monotone — Gubler as the Cartographer
    elif pause_variance > 0.5:
        return 'dramatic'  # high variance in pauses — theatrical delivery
    else:
        return 'flowing'  # moderate everything — natural speech

def generate_design_notes(name, actor, pitch, expr, tempo, cadence, reveal, pauses, instrument):
    """Generate human-readable design notes for the character document."""
    notes = []

    if name:
        notes.append(f"Character: {name}")
    if actor:
        notes.append(f"Reference: {actor}")
    notes.append("")

    # Pitch description
    if pitch < 100:
        notes.append(f"Voice: Deep (F0 ~{pitch:.0f}Hz) — resonant, felt before heard.")
    elif pitch < 150:
        notes.append(f"Voice: Low-mid (F0 ~{pitch:.0f}Hz) — warm, grounded.")
    elif pitch < 200:
        notes.append(f"Voice: Mid (F0 ~{pitch:.0f}Hz) — clear, present.")
    else:
        notes.append(f"Voice: High (F0 ~{pitch:.0f}Hz) — bright, piercing or ethereal.")

    # Expressiveness
    if expr < 0.2:
        notes.append("Delivery: Monotone — controlled, measured, every word chosen.")
    elif expr < 0.4:
        notes.append("Delivery: Restrained — minimal variation, precision over emotion.")
    elif expr < 0.6:
        notes.append("Delivery: Natural — balanced expression, neither flat nor theatrical.")
    else:
        notes.append("Delivery: Dynamic — wide pitch range, emotionally expressive.")

    # Cadence
    notes.append(f"Cadence: {cadence}")
    if cadence == 'measured':
        notes.append("  Text appears slowly, each word given full weight. Long pauses between sentences. The silence IS the voice.")
    elif cadence == 'deliberate':
        notes.append("  Text appears at a measured pace. Pauses carry meaning. No rush, no waste.")
    elif cadence == 'erratic':
        notes.append("  Text appears in bursts — fast flurries, sudden stops. Unpredictable rhythm.")
    elif cadence == 'overflow':
        notes.append("  Text appears rapidly, words piling up. Occasional full stops where the mind catches the mouth.")
    elif cadence == 'dramatic':
        notes.append("  Text appears with theatrical timing — long dramatic pauses, sudden accelerations.")
    elif cadence == 'flowing':
        notes.append("  Text appears at a natural, conversational pace. Easy to follow.")

    # Tempo
    notes.append(f"Tempo: {tempo:.0f} BPM")
    if tempo < 70:
        notes.append("  Slow — the pace of someone who has time. Or someone who has too much to carry to run.")
    elif tempo < 100:
        notes.append("  Moderate — unhurried but engaged. Conversation pace.")
    elif tempo < 130:
        notes.append("  Brisk — energetic, engaged, the pace of someone whose mind is ahead of their mouth.")
    else:
        notes.append("  Fast — urgent, overflowing, the pace of someone who can't get the words out fast enough.")

    # Instrument
    notes.append(f"Instrument: {instrument} at ~{pitch:.0f}Hz")

    # Godot implementation
    notes.append("")
    notes.append("Godot Parameters:")
    notes.append(f"  text_reveal_speed: {reveal}ms per character")
    notes.append(f"  pause_between_sentences: {pauses['pause_between_sentences']}ms")
    notes.append(f"  pause_between_words: {pauses['pause_between_words']}ms")

    return '\n'.join(notes)

def extract_profile(audio_path, character_name=None, actor_name=None):
    """Main extraction function."""
    print(f"Loading: {audio_path}")
    y, sr = librosa.load(audio_path, sr=22050)
    duration = len(y) / sr
    print(f"Duration: {duration:.1f}s | Sample rate: {sr}Hz")

    # --- PITCH ANALYSIS ---
    print("Analyzing pitch (F0)...")
    voiced_f0, f0_full, voiced_flag = extract_f0(y, sr)

    if len(voiced_f0) == 0:
        print("WARNING: No voiced speech detected. Check audio quality.")
        return None

    pitch_baseline = float(np.median(voiced_f0))
    pitch_mean = float(np.mean(voiced_f0))
    pitch_std = float(np.std(voiced_f0))
    pitch_min = float(np.percentile(voiced_f0, 5))
    pitch_max = float(np.percentile(voiced_f0, 95))
    pitch_range = pitch_max - pitch_min
    # Expressiveness: normalized standard deviation (0 = monotone, 1 = very dynamic)
    expressiveness = float(min(1.0, pitch_std / pitch_baseline))

    print(f"  Baseline F0: {pitch_baseline:.1f} Hz")
    print(f"  Range: {pitch_min:.1f} - {pitch_max:.1f} Hz")
    print(f"  Expressiveness: {expressiveness:.2f}")

    # --- PAUSE ANALYSIS ---
    print("Detecting pauses...")
    pauses = detect_pauses(y, sr)
    pause_params = map_to_pause_duration(pauses)
    # Pause variance (for cadence classification)
    if len(pauses) > 1:
        pause_durations = [p['duration'] for p in pauses]
        pause_cv = float(np.std(pause_durations) / np.mean(pause_durations)) if np.mean(pause_durations) > 0 else 0
    else:
        pause_cv = 0.0
    pause_variance = float(min(1.0, pause_cv))

    print(f"  Detected {len(pauses)} pauses")
    print(f"  Avg sentence pause: {pause_params['pause_between_sentences']}ms")
    print(f"  Avg word pause: {pause_params['pause_between_words']}ms")

    # --- TEMPO ANALYSIS ---
    print("Analyzing tempo...")
    onset_env = librosa.onset.onset_strength(y=y, sr=sr)
    tempo = float(librosa.feature.tempo(onset_envelope=onset_env, sr=sr)[0])
    print(f"  Tempo: {tempo:.1f} BPM")

    # --- SPEAKING RATE ---
    wpm = estimate_speaking_rate(y, sr, pauses)
    text_reveal_speed = map_to_text_reveal_speed(wpm)
    print(f"  Estimated rate: {wpm:.0f} WPM → {text_reveal_speed}ms per character")

    # --- INSTRUMENT RECOMMENDATION ---
    instrument = recommend_instrument(pitch_baseline, expressiveness, tempo)
    print(f"  Recommended instrument: {instrument}")

    # --- CADENCE CLASSIFICATION ---
    cadence = classify_cadence(tempo, expressiveness, pause_variance)
    print(f"  Cadence pattern: {cadence}")

    # --- BUILD PROFILE ---
    profile = {
        'character_name': character_name or 'Unknown',
        'reference_actor': actor_name or 'Unknown',
        'source_file': os.path.basename(audio_path),
        'duration_seconds': round(duration, 2),
        'godot_parameters': {
            'text_reveal_speed_ms': text_reveal_speed,
            'pause_between_sentences_ms': pause_params['pause_between_sentences'],
            'pause_between_words_ms': pause_params['pause_between_words'],
            'pitch_baseline_hz': round(pitch_baseline, 1),
            'instrument': instrument,
            'instrument_frequency_hz': round(pitch_baseline, 1),
            'expressiveness': round(expressiveness, 2),
            'cadence_pattern': cadence,
        },
        'raw_analysis': {
            'f0_median_hz': round(pitch_baseline, 1),
            'f0_mean_hz': round(pitch_mean, 1),
            'f0_min_hz': round(pitch_min, 1),
            'f0_max_hz': round(pitch_max, 1),
            'f0_std_hz': round(pitch_std, 1),
            'f0_range_hz': round(pitch_range, 1),
            'tempo_bpm': round(tempo, 1),
            'speaking_rate_wpm': round(wpm, 0),
            'pause_count': len(pauses),
            'longest_pause_ms': pause_params['longest_pause'],
            'average_pause_ms': pause_params['average_pause'],
            'pause_variance': round(pause_variance, 2),
        },
        'design_notes': generate_design_notes(
            character_name, actor_name, pitch_baseline, expressiveness,
            tempo, cadence, text_reveal_speed, pause_params, instrument
        )
    }

    return profile

def main():
    parser = argparse.ArgumentParser(
        description='Geode Inn Voice Profile Extractor — extracts cadence/tone data from audio clips'
    )
    parser.add_argument('audio_file', help='Path to audio file (wav, mp3, flac, ogg)')
    parser.add_argument('--name', help='Character name', default=None)
    parser.add_argument('--actor', help='Reference actor name', default=None)
    parser.add_argument('--output', '-o', help='Output JSON file path', default=None)
    parser.add_argument('--quiet', '-q', action='store_true', help='Suppress detailed output')

    args = parser.parse_args()

    if not os.path.exists(args.audio_file):
        print(f"Error: File not found: {args.audio_file}")
        sys.exit(1)

    if not check_dependencies():
        sys.exit(1)

    profile = extract_profile(args.audio_file, args.name, args.actor)

    if profile is None:
        print("Extraction failed.")
        sys.exit(1)

    # Determine output path
    if args.output:
        output_path = args.output
    else:
        base = os.path.splitext(args.audio_file)[0]
        char_slug = (args.name or 'unknown').lower().replace(' ', '_')
        output_path = f"voice_profiles/{char_slug}_profile.json"

    # Save JSON
    os.makedirs(os.path.dirname(output_path) if os.path.dirname(output_path) else '.', exist_ok=True)
    with open(output_path, 'w') as f:
        json.dump(profile, f, indent=2)

    print(f"\n{'='*60}")
    print(f"Voice profile saved: {output_path}")
    print(f"{'='*60}")

    if not args.quiet:
        print(f"\n{profile['design_notes']}")
        print(f"\n{'='*60}")
        print("Raw JSON:")
        print(json.dumps(profile['godot_parameters'], indent=2))

if __name__ == '__main__':
    main()
