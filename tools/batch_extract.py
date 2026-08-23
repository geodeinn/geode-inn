#!/usr/bin/env python3
"""
Geode Inn — Batch Voice Profile Extractor
Processes multiple audio clips and generates a consolidated voice_profiles.json
for direct import into the Godot project.

Usage:
    python batch_extract.py clips/

Expects a directory structure like:
    clips/
        the_host_stewart.wav
        the_crone_hopkins.wav
        the_carter_catalyst.wav
        the_cartographer_gubler.wav
        ...

File naming convention: <character_slug>_<actor_surname>.wav
The character name and actor are auto-parsed from the filename.
You can also provide a manifest JSON for explicit mapping.

Manifest format (manifest.json):
    [
        {"file": "stewart.wav", "name": "The Host", "actor": "Patrick Stewart"},
        {"file": "hopkins.wav", "name": "The Crone", "actor": "Anthony Hopkins"}
    ]

Output:
    voice_profiles/all_profiles.json — consolidated, Godot-import-ready
    voice_profiles/<slug>_profile.json — individual files for reference
"""

import os
import sys
import json
import glob
from voice_profile_extractor import extract_profile, check_dependencies

def parse_filename(filename):
    """Parse character name and actor from filename."""
    base = os.path.splitext(filename)[0]
    parts = base.split('_')
    if len(parts) >= 2:
        # Assume last part is actor surname, rest is character
        actor_surname = parts[-1].title()
        character = ' '.join(word.title() for word in parts[:-1])
        return character, actor_surname
    return base.title(), 'Unknown'

def find_audio_files(clip_dir):
    """Find all audio files in the directory."""
    extensions = ['*.wav', '*.mp3', '*.flac', '*.ogg', '*.m4a']
    files = []
    for ext in extensions:
        files.extend(glob.glob(os.path.join(clip_dir, ext)))
        files.extend(glob.glob(os.path.join(clip_dir, '**', ext), recursive=True))
    return sorted(set(files))

def main():
    if not check_dependencies():
        sys.exit(1)

    clip_dir = sys.argv[1] if len(sys.argv) > 1 else 'clips'
    output_file = sys.argv[2] if len(sys.argv) > 2 else 'voice_profiles/all_profiles.json'

    if not os.path.isdir(clip_dir):
        print(f"Error: Directory not found: {clip_dir}")
        print("Usage: python batch_extract.py <clips_directory> [output_file]")
        sys.exit(1)

    # Check for manifest
    manifest_path = os.path.join(clip_dir, 'manifest.json')
    manifest = None
    if os.path.exists(manifest_path):
        with open(manifest_path, 'r') as f:
            manifest = json.load(f)
        print(f"Found manifest: {manifest_path} ({len(manifest)} entries)")

    # Collect files
    if manifest:
        audio_files = []
        for entry in manifest:
            filepath = os.path.join(clip_dir, entry['file'])
            if os.path.exists(filepath):
                audio_files.append((filepath, entry.get('name'), entry.get('actor')))
            else:
                print(f"  WARNING: Manifest file not found: {entry['file']}")
    else:
        raw_files = find_audio_files(clip_dir)
        audio_files = []
        for f in raw_files:
            name, actor = parse_filename(os.path.basename(f))
            audio_files.append((f, name, actor))

    if not audio_files:
        print(f"No audio files found in {clip_dir}")
        print("Supported formats: wav, mp3, flac, ogg, m4a")
        sys.exit(1)

    print(f"\nProcessing {len(audio_files)} clips...")
    print(f"{'='*60}")

    all_profiles = {}
    success_count = 0
    fail_count = 0

    for filepath, name, actor in audio_files:
        print(f"\n--- {name} ({actor}) ---")
        print(f"  File: {os.path.basename(filepath)}")

        profile = extract_profile(filepath, name, actor)

        if profile is None:
            print(f"  FAILED — skipping")
            fail_count += 1
            continue

        # Save individual profile
        slug = (name or 'unknown').lower().replace(' ', '_')
        os.makedirs('voice_profiles', exist_ok=True)
        individual_path = f"voice_profiles/{slug}_profile.json"
        with open(individual_path, 'w') as f:
            json.dump(profile, f, indent=2)

        # Add to consolidated profiles
        all_profiles[slug] = profile['godot_parameters']
        success_count += 1
        print(f"  Saved: {individual_path}")

    # Save consolidated file
    os.makedirs(os.path.dirname(output_file) if os.path.dirname(output_file) else '.', exist_ok=True)
    with open(output_file, 'w') as f:
        json.dump(all_profiles, f, indent=2)

    print(f"\n{'='*60}")
    print(f"Batch complete: {success_count} succeeded, {fail_count} failed")
    print(f"Consolidated profiles: {output_file}")
    print(f"Individual profiles: voice_profiles/")
    print(f"{'='*60}")

    # Print summary table
    print(f"\n{'Character':<25} {'F0 (Hz)':<10} {'Tempo':<10} {'Reveal':<10} {'Sent Pause':<12} {'Instrument':<20} {'Cadence'}")
    print(f"{'-'*25} {'-'*10} {'-'*10} {'-'*10} {'-'*12} {'-'*20} {'-'*10}")
    for slug, params in all_profiles.items():
        name = slug.replace('_', ' ').title()
        print(f"{name:<25} {params['pitch_baseline_hz']:<10} {params.get('tempo_bpm', 'N/A'):<10} "
              f"{params['text_reveal_speed_ms']:<10} {params['pause_between_sentences_ms']:<12} "
              f"{params['instrument']:<20} {params['cadence_pattern']}")

if __name__ == '__main__':
    main()
