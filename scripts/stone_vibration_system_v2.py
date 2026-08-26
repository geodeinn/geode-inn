#!/usr/bin/env python3
"""
Geode Inn — Mineral Vibration System v2
Maps each stone's real density to a frequency using a piecewise inverse mapping.
Dense stones = LOW frequencies (you feel them). Light stones = HIGH frequencies (you sense them).

IEM Driver → Inn Layer mapping:
  Bone Conduction (20-80Hz)  → Catacombs — the deep knowing (metals, dense stones)
  Dynamic Driver (80-250Hz)  → Matter — the stones you hold (hard gems)
  Balanced Armature (250-2kHz) → Characters — the presences you meet (medium gems)
  Electrostatic (2kHz-8kHz)  → Cosmology — the starlight you reach for (light stones)

The 42Hz Song is the baseline beneath everything — not a stone's frequency,
but the Earth's fundamental hum. Each stone is a voice within that Song.
"""

import math
import struct
import wave
import os
import json

# ============================================================
# DENSITY DATABASE (from v1)
# ============================================================

MINERAL_DENSITY = {
    "Clear Quartz": {"sg": 2.65, "mohs": 7}, "Phantom Quartz": {"sg": 2.65, "mohs": 7},
    "Rose Quartz": {"sg": 2.65, "mohs": 7}, "Rutilated Quartz": {"sg": 2.65, "mohs": 7},
    "Smoky Quartz": {"sg": 2.65, "mohs": 7}, "Solar Quartz": {"sg": 2.65, "mohs": 7},
    "Tourmalinated Quartz": {"sg": 2.65, "mohs": 7}, "Herkimer Diamond": {"sg": 2.65, "mohs": 7},
    "Amethyst": {"sg": 2.65, "mohs": 7}, "Citrine": {"sg": 2.65, "mohs": 7},
    "Ametrine": {"sg": 2.65, "mohs": 7}, "Aqua Aura": {"sg": 2.65, "mohs": 7},
    "Gem Silica": {"sg": 2.55, "mohs": 6.5},
    "Agates": {"sg": 2.60, "mohs": 6.5}, "Crazy Lace Agate": {"sg": 2.60, "mohs": 6.5},
    "Dendritic Agate": {"sg": 2.60, "mohs": 6.5}, "Fire Agate": {"sg": 2.60, "mohs": 6.5},
    "Flower Agate": {"sg": 2.60, "mohs": 6.5}, "Fossil Agate (turritella)": {"sg": 2.60, "mohs": 6.5},
    "Montana Moss Agate": {"sg": 2.60, "mohs": 6.5}, "Moss Agate": {"sg": 2.60, "mohs": 6.5},
    "Plumed Agate": {"sg": 2.60, "mohs": 6.5}, "Tree Agate": {"sg": 2.60, "mohs": 6.5},
    "Chalcedony (Blue)": {"sg": 2.60, "mohs": 6.5}, "Chalcedony (Dendritic)": {"sg": 2.60, "mohs": 6.5},
    "Bumblebee Jasper": {"sg": 2.65, "mohs": 6.5}, "Desert Jasper": {"sg": 2.65, "mohs": 6.5},
    "Leopardskin Jasper": {"sg": 2.65, "mohs": 6.5}, "Ocean Jasper": {"sg": 2.65, "mohs": 6.5},
    "Picasso Jasper": {"sg": 2.65, "mohs": 6.5}, "Picture Jasper": {"sg": 2.65, "mohs": 6.5},
    "Sunset Jasper": {"sg": 2.65, "mohs": 6.5},
    "Blue Tiger's Eye": {"sg": 2.65, "mohs": 6.5}, "Brown Tiger's Eye": {"sg": 2.65, "mohs": 6.5},
    "Red Tiger's Eye": {"sg": 2.65, "mohs": 6.5}, "Tiger Iron": {"sg": 3.30, "mohs": 6.5},
    "Hawk's Eye": {"sg": 2.65, "mohs": 6.5},
    "Grossular Garnet": {"sg": 3.60, "mohs": 7}, "Hessonite Garnet": {"sg": 3.60, "mohs": 7},
    "Mozambique Garnet": {"sg": 3.95, "mohs": 7.5}, "Spessartite Garnet": {"sg": 4.20, "mohs": 7.25},
    "Uvarovite": {"sg": 3.85, "mohs": 7.5},
    "Blue Topaz (London)": {"sg": 3.53, "mohs": 8}, "Blue Topaz (Swiss)": {"sg": 3.53, "mohs": 8},
    "Clear Topaz": {"sg": 3.53, "mohs": 8}, "Imperial (Golden) Topaz": {"sg": 3.53, "mohs": 8},
    "Black Tourmaline": {"sg": 3.10, "mohs": 7.5}, "Blue Tourmaline": {"sg": 3.05, "mohs": 7.5},
    "Green Tourmaline": {"sg": 3.05, "mohs": 7.5}, "Multi - Colored Tourmaline": {"sg": 3.05, "mohs": 7.5},
    "Rubellite Tourmaline": {"sg": 3.05, "mohs": 7.5}, "Watermelon Tourmaline": {"sg": 3.05, "mohs": 7.5},
    "Emerald": {"sg": 2.72, "mohs": 7.5}, "Morganite": {"sg": 2.72, "mohs": 7.5},
    "Aquamarine": {"sg": 2.72, "mohs": 7.5},
    "Amazonite": {"sg": 2.56, "mohs": 6}, "Green Labradorite": {"sg": 2.70, "mohs": 6},
    "Peach Moonstone": {"sg": 2.56, "mohs": 6}, "Rainbow Moonstone": {"sg": 2.56, "mohs": 6},
    "White Moonstone": {"sg": 2.56, "mohs": 6}, "Sunstone": {"sg": 2.64, "mohs": 6},
    "Gold Sheen Obsidian": {"sg": 2.40, "mohs": 5}, "Rainbow Obsidian": {"sg": 2.40, "mohs": 5},
    "Snowflake Obsidian": {"sg": 2.40, "mohs": 5},
    "Black Opal": {"sg": 2.10, "mohs": 5.5}, "Blue Opal (Peruvian)": {"sg": 2.10, "mohs": 5.5},
    "Boulder Opal": {"sg": 2.10, "mohs": 5.5}, "Fire Opal": {"sg": 2.00, "mohs": 5.5},
    "Water Opal": {"sg": 1.99, "mohs": 5.5},
    "Black Onyx": {"sg": 2.60, "mohs": 6.5}, "Green Onyx": {"sg": 2.60, "mohs": 6.5},
    "Lemurian Blue Calcite (Blue Onyx)": {"sg": 2.70, "mohs": 3.5},
    "Guatemalan Jade": {"sg": 3.30, "mohs": 7}, "Jadeite": {"sg": 3.34, "mohs": 7},
    "Nephrite Jade": {"sg": 2.95, "mohs": 6}, "White Jade": {"sg": 3.30, "mohs": 7},
    "Ruby": {"sg": 3.99, "mohs": 9}, "Ruby with kyanite": {"sg": 3.70, "mohs": 7},
    "Sapphire": {"sg": 3.99, "mohs": 9}, "Sapphire (Tundra)": {"sg": 3.99, "mohs": 9},
    "Charoite": {"sg": 2.68, "mohs": 6}, "Lapis Lazuli": {"sg": 2.70, "mohs": 5.5},
    "Larimar": {"sg": 2.80, "mohs": 4.5}, "Sodalite": {"sg": 2.30, "mohs": 5.5},
    "Sodalite (African)": {"sg": 2.30, "mohs": 5.5}, "Lepidolite": {"sg": 2.80, "mohs": 2.5},
    "Sugilite": {"sg": 2.74, "mohs": 6}, "Iolite": {"sg": 2.60, "mohs": 7},
    "Kunzite": {"sg": 3.18, "mohs": 6.5}, "Tanzanite": {"sg": 3.35, "mohs": 6.5},
    "Prehnite": {"sg": 2.88, "mohs": 6},
    "Malachite": {"sg": 3.80, "mohs": 3.5}, "Rhodochrosite": {"sg": 3.70, "mohs": 4},
    "Rhodonite": {"sg": 3.50, "mohs": 5.5}, "Aragonite": {"sg": 2.95, "mohs": 3.5},
    "Azurite": {"sg": 3.77, "mohs": 3.5}, "Chrysocolla": {"sg": 2.20, "mohs": 2.5},
    "Chrysocolla Azurite": {"sg": 2.80, "mohs": 3}, "Hematite": {"sg": 5.30, "mohs": 5.5},
    "Cuprite": {"sg": 6.14, "mohs": 3.5},
    "Green Fluorite": {"sg": 3.18, "mohs": 4}, "Purple Fluorite": {"sg": 3.18, "mohs": 4},
    "Rainbow Fluorite": {"sg": 3.18, "mohs": 4},
    "Nuummite": {"sg": 3.00, "mohs": 5.5}, "Hypersthene": {"sg": 3.40, "mohs": 5.5},
    "Bronzite": {"sg": 3.30, "mohs": 5.5},
    "Amber": {"sg": 1.08, "mohs": 2.5}, "Pearl": {"sg": 2.70, "mohs": 2.5},
    "Jet": {"sg": 1.30, "mohs": 2.5}, "Abalone": {"sg": 2.70, "mohs": 2.5},
    "Coral (black)": {"sg": 2.60, "mohs": 3.5}, "Coral (branch)": {"sg": 2.60, "mohs": 3.5},
    "Moldavite": {"sg": 2.40, "mohs": 5.5}, "Tektite": {"sg": 2.60, "mohs": 5.5},
    "Gold": {"sg": 19.30, "mohs": 2.5}, "Copper": {"sg": 8.96, "mohs": 3},
    "Platinum": {"sg": 21.45, "mohs": 4}, "Pyrite": {"sg": 5.01, "mohs": 6},
    "Petrified Wood": {"sg": 2.65, "mohs": 7}, "Ammonite": {"sg": 2.70, "mohs": 4},
    "Ammolite": {"sg": 2.80, "mohs": 4.5},
    "Alexandrite": {"sg": 3.70, "mohs": 8.5}, "Andalusite": {"sg": 3.16, "mohs": 7.5},
    "Apatite": {"sg": 3.23, "mohs": 5}, "Aquaprase": {"sg": 2.60, "mohs": 6.5},
    "Bloodstone": {"sg": 2.65, "mohs": 6.5}, "Carnelian": {"sg": 2.60, "mohs": 6.5},
    "Cat's Eye": {"sg": 3.72, "mohs": 8.5}, "Chrome Diopside": {"sg": 3.30, "mohs": 5.5},
    "Chrysoprase": {"sg": 2.60, "mohs": 6.5}, "Chinese Writing Stone": {"sg": 2.80, "mohs": 4},
    "Chrysanthemum Stone": {"sg": 2.80, "mohs": 4}, "Covellite": {"sg": 4.80, "mohs": 2.5},
    "Dumortierite": {"sg": 3.30, "mohs": 7}, "Epidote": {"sg": 3.45, "mohs": 7},
    "Eudialyte": {"sg": 2.90, "mohs": 5.5}, "Hackmanite": {"sg": 2.30, "mohs": 5.5},
    "Kammererite": {"sg": 2.80, "mohs": 2.5}, "Kyanite (blue)": {"sg": 3.60, "mohs": 4.5},
    "Kyanite (orange)": {"sg": 3.60, "mohs": 4.5}, "Kyanite (Moss)": {"sg": 3.60, "mohs": 4.5},
    "Lepidocrocite": {"sg": 4.00, "mohs": 5}, "Moukaite": {"sg": 2.65, "mohs": 6.5},
    "Pietersite": {"sg": 2.65, "mohs": 6.5}, "Preseli Blue Stone": {"sg": 2.70, "mohs": 7},
    "Septarian": {"sg": 2.70, "mohs": 3.5}, "Shungite": {"sg": 2.10, "mohs": 3.5},
    "Spinel": {"sg": 3.60, "mohs": 8}, "Staurolite (fairy cross stone)": {"sg": 3.70, "mohs": 7.5},
    "Unakite": {"sg": 2.85, "mohs": 6.5}, "Zoisite (with ruby inclusions)": {"sg": 3.30, "mohs": 6.5},
    "Zultanite": {"sg": 3.35, "mohs": 6.5}, "Sard": {"sg": 2.60, "mohs": 6.5},
    "Sardonyx": {"sg": 2.60, "mohs": 6.5}, "Diamond": {"sg": 3.52, "mohs": 10},
    "Angelite": {"sg": 2.30, "mohs": 3.5}, "Green Aventurine": {"sg": 2.65, "mohs": 6.5},
    "Red Aventurine": {"sg": 2.65, "mohs": 6.5},
    "Turquoise (types found in the Americas)": {"sg": 2.70, "mohs": 6},
    "Turquoise (Tibetan)": {"sg": 2.70, "mohs": 6},
}


# ============================================================
# FREQUENCY MAPPING (inverse: dense = low, light = high)
# ============================================================

def sg_to_frequency(sg):
    """
    Piecewise mapping: specific gravity → frequency.
    
    SG > 5.0:  Bone Conduction  (20-80Hz)  — metals, very dense
    SG 3.0-5.0: Dynamic Driver  (80-250Hz) — hard gems
    SG 2.0-3.0: Balanced Armature (250-2000Hz) — medium gems
    SG < 2.0:  Electrostatic    (2000-8000Hz) — light/ethereal
    """
    if sg >= 5.0:
        return 80.0 - (sg - 5.0) / (21.45 - 5.0) * 60.0
    elif sg >= 3.0:
        return 80.0 + (sg - 3.0) / (5.0 - 3.0) * 170.0
    elif sg >= 2.0:
        return 250.0 + (sg - 2.0) / (3.0 - 2.0) * 1750.0
    else:
        return 2000.0 + (2.0 - sg) / (2.0 - 1.0) * 6000.0


def get_iem_driver(frequency):
    if frequency < 80:
        return {
            "type": "bone_conduction",
            "name": "Bone Conduction",
            "sensation": "You feel this stone in your body before you hear it. The vibration settles in your chest and hands, like standing near something massive that is breathing slowly.",
            "inn_layer": "Catacombs — the deep knowing",
            "inn_driver": "DD (Dynamic Driver) — frequencies you FEEL",
        }
    elif frequency < 250:
        return {
            "type": "dynamic_driver",
            "name": "Dynamic Driver",
            "sensation": "A warm tone you both hear and feel. It resonates in the throat and sternum, the way a low bell carries through a stone wall.",
            "inn_layer": "Matter — the stones you hold",
            "inn_driver": "DD (Dynamic Driver) — frequencies you HEAR and FEEL",
        }
    elif frequency < 2000:
        return {
            "type": "balanced_armature",
            "name": "Balanced Armature",
            "sensation": "A clear, precise tone. You hear this stone the way you hear a voice in a quiet room — present, distinct, intimate.",
            "inn_layer": "Characters — the presences you meet",
            "inn_driver": "BA (Balanced Armature) — frequencies you HEAR clearly",
        }
    else:
        return {
            "type": "electrostatic",
            "name": "Electrostatic",
            "sensation": "A high, thin presence at the edge of perception. You sense this stone more than hear it, the way you sense someone watching you from far away.",
            "inn_layer": "Cosmology — the starlight you reach for",
            "inn_driver": "EST (Electrostatic) — frequencies you SENSE",
        }


# ============================================================
# AUDIO GENERATION
# ============================================================

def generate_tone_wav(frequency, duration_ms, output_path, sample_rate=44100, amplitude=0.3):
    """
    Generate a WAV file at the given frequency.
    The tone has a gentle envelope — it fades in like a breath and out like a memory.
    Includes subtle harmonics for warmth, like a real crystal resonating.
    """
    num_samples = int(sample_rate * duration_ms / 1000)
    fade_in = int(num_samples * 0.20)
    fade_out = int(num_samples * 0.30)
    
    frames = []
    for i in range(num_samples):
        t = i / sample_rate
        # Fundamental + harmonics for richness
        sample = math.sin(2 * math.pi * frequency * t)
        sample += 0.15 * math.sin(2 * math.pi * frequency * 2 * t)
        sample += 0.05 * math.sin(2 * math.pi * frequency * 3 * t)
        
        # Envelope (smooth ease-in-out)
        if i < fade_in:
            env = i / fade_in
            env = env * env * (3 - 2 * env)
        elif i > num_samples - fade_out:
            env = (num_samples - i) / fade_out
            env = env * env * (3 - 2 * env)
        else:
            env = 1.0
        
        sample = sample * amplitude * env
        sample_int = max(-32768, min(32767, int(sample * 32767)))
        frames.append(struct.pack('<h', sample_int))
    
    with wave.open(output_path, 'w') as wav_file:
        wav_file.setnchannels(1)
        wav_file.setsampwidth(2)
        wav_file.setframerate(sample_rate)
        wav_file.writeframes(b''.join(frames))


# ============================================================
# HAPTIC PATTERN
# ============================================================

def generate_haptic_data(frequency, duration_ms):
    """
    Generate haptic feedback pattern for controllers/phones.
    Dense stones (low freq) = long, deep pulses.
    Light stones (high freq) = short, light taps.
    """
    pulse_interval = max(40, int(60000 / max(frequency, 1)))
    intensity = min(1.0, max(0.2, 1.0 - (frequency / 8000)))
    
    pulses = []
    t = 0
    while t < duration_ms:
        pulses.append({
            "time_ms": t,
            "intensity": round(intensity, 3),
            "duration_ms": min(pulse_interval, duration_ms - t),
        })
        t += pulse_interval
    return pulses


# ============================================================
# MAIN
# ============================================================

if __name__ == "__main__":
    output_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "stone_vibrations")
    audio_dir = os.path.join(output_dir, "audio")
    os.makedirs(audio_dir, exist_ok=True)
    
    all_profiles = []
    driver_counts = {"bone_conduction": 0, "dynamic_driver": 0, "balanced_armature": 0, "electrostatic": 0}
    
    for stone_name, density_data in MINERAL_DENSITY.items():
        sg = density_data["sg"]
        mohs = density_data["mohs"]
        freq = sg_to_frequency(sg)
        driver = get_iem_driver(freq)
        
        safe_name = stone_name.replace(" ", "_").replace("/", "_").replace("(", "").replace(")", "")
        audio_path = os.path.join(audio_dir, f"{safe_name}.wav")
        
        # Generate audio
        generate_tone_wav(freq, 2000, audio_path)
        
        # Generate haptic
        haptic = generate_haptic_data(freq, 2000)
        
        profile = {
            "stone": stone_name,
            "specific_gravity": sg,
            "mohs_hardness": mohs,
            "frequency_hz": round(freq, 2),
            "iem_driver": driver["type"],
            "driver_name": driver["name"],
            "inn_layer": driver["inn_layer"],
            "inn_driver": driver["inn_driver"],
            "sensation": driver["sensation"],
            "audio_file": f"{safe_name}.wav",
            "haptic_pattern": haptic,
        }
        all_profiles.append(profile)
        driver_counts[driver["type"]] += 1
    
    # Save index
    index_path = os.path.join(output_dir, "vibration_index.json")
    with open(index_path, 'w') as f:
        json.dump(all_profiles, f, indent=2)
    
    # Print summary
    print(f"Stone Vibration System v2 — {len(all_profiles)} stones mapped")
    print(f"")
    print(f"IEM Driver Distribution:")
    print(f"  Bone Conduction (20-80Hz, FEEL):     {driver_counts['bone_conduction']} stones")
    print(f"  Dynamic Driver (80-250Hz, HEAR+FEEL): {driver_counts['dynamic_driver']} stones")
    print(f"  Balanced Armature (250-2kHz, HEAR):    {driver_counts['balanced_armature']} stones")
    print(f"  Electrostatic (2-8kHz, SENSE):         {driver_counts['electrostatic']} stones")
    print(f"")
    print(f"Sample stones across the spectrum:")
    
    # Sort by frequency and show key stones
    sorted_profiles = sorted(all_profiles, key=lambda p: p["frequency_hz"])
    
    # Show one from each extreme and a few in between
    showcase = [
        "Platinum", "Gold", "Hematite", "Pyrite",
        "Cuprite", "Covellite", "Ruby", "Diamond",
        "Malachite", "Topaz", "Tourmaline",
        "Quartz", "Emerald", "Opal",
        "Amber", "Jet",
    ]
    
    for name in showcase:
        for p in sorted_profiles:
            if p["stone"] == name:
                print(f"  {name:30s}  SG={p['specific_gravity']:6.2f}  f={p['frequency_hz']:8.1f}Hz  [{p['driver_name']}]")
                break
    
    print(f"")
    print(f"Lowest:  {sorted_profiles[0]['stone']} ({sorted_profiles[0]['frequency_hz']}Hz)")
    print(f"Highest: {sorted_profiles[-1]['stone']} ({sorted_profiles[-1]['frequency_hz']}Hz)")
    print(f"")
    print(f"Audio files: {len(os.listdir(audio_dir))} WAV files in {audio_dir}/")
    print(f"Vibration index: {index_path}")
