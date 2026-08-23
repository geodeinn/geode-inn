# Geode Inn — Voice Profile Extractor

Extracts cadence and tone data from audio reference clips and outputs Godot-ready voice profiles for the Geode Inn's dialogue system.

## The System

The Geode Inn uses a **text-and-tone** dialogue system instead of voice acting. Each character's dialogue is displayed as text that appears at a specific speed, with specific pauses, accompanied by a specific instrument playing at a specific frequency. The parameters are extracted from reference audio clips of actors whose delivery patterns inspire each character.

**This is NOT voice cloning.** The tool extracts measurable data points (pitch, tempo, pause duration) from public performances and translates them into text timing parameters and instrument selections. No synthetic voices are generated. The actor's name appears in the design document as a direction reference only.

## Setup

```bash
cd geode-inn/tools
pip install librosa numpy scipy
```

## Usage

### Single clip

```bash
python voice_profile_extractor.py clips/stewart_sample.wav --name "The Host" --actor "Patrick Stewart"
```

Output: `voice_profiles/the_host_profile.json`

### Batch processing

Create a `clips/` directory with your reference audio files. Optionally include a `manifest.json`:

```json
[
    {"file": "stewart.wav", "name": "The Host", "actor": "Patrick Stewart"},
    {"file": "hopkins.wav", "name": "The Crone", "actor": "Anthony Hopkins"},
    {"file": "carter.wav", "name": "The Catalyst", "actor": "Helena Bonham Carter"},
    {"file": "gubler.wav", "name": "The Cartographer", "actor": "Matthew Gray Gubler"},
    {"file": "deschanel.wav", "name": "The Examiner", "actor": "Emily Deschanel"}
]
```

Then run:

```bash
python batch_extract.py clips/
```

Output: `voice_profiles/all_profiles.json` (consolidated, Godot-import-ready) + individual profile files.

## What It Extracts

| Parameter | Description |
|---|---|
| `text_reveal_speed_ms` | How fast dialogue text appears (ms per character) |
| `pause_between_sentences_ms` | Silence between text blocks |
| `pause_between_words_ms` | Intra-sentence pauses |
| `pitch_baseline_hz` | Fundamental frequency — the vocal range center |
| `instrument` | Recommended instrument based on pitch + delivery |
| `instrument_frequency_hz` | Matched to pitch baseline |
| `expressiveness` | 0.0-1.0 (monotone to dynamic) |
| `cadence_pattern` | measured, deliberate, erratic, overflow, dramatic, flowing |

## Godot Integration

The output `all_profiles.json` can be loaded directly into Godot as a resource. In your dialogue system:

```gdscript
# Load profiles
var profiles = load("res://data/voice_profiles.json").data

# Apply a profile to dialogue
func show_dialogue(character_slug: String, text: String):
    var profile = profiles[character_slug]
    var reveal_speed = profile.text_reveal_speed_ms
    var sentence_pause = profile.pause_between_sentences_ms
    var instrument = profile.instrument
    var freq = profile.instrument_frequency_hz
    
    # Reveal text character by character at the profile's speed
    for char in text:
        reveal_character(char)
        await get_tree().create_timer(reveal_speed / 1000.0).timeout
    
    # Play the character's instrument at their frequency
    play_instrument(instrument, freq)
```

## Legal Notes

- The tool performs **acoustic analysis** of public performances, extracting measurable data (tempo, pitch, pause duration)
- The output is **text timing parameters and instrument selections** — not synthetic audio
- Actor names in design documents serve as **direction references**, not voice reproductions
- No voice cloning, no AI-generated speech, no likeness reproduction
- The system is inspired by actors' delivery styles, the same way a casting director writes "looking for a Patrick Stewart type"
