# Geode Inn — Audio Manifest for Godot Steam Build
# Maps every audio file to its zone, game, and trigger condition

# ============================================================
# SOULSTICE MELODIES (6 original composed tracks)
# ============================================================
[soulstice_melodies]
"Soulstice_Signature" = "res://assets/audio/music/Soulstice_Signature.wav"    # Main theme — hub, loading screen, title
"Earth_&_Sky" = "res://assets/audio/music/Earth_&_Sky.wav"                      # Cosmology level — electrostatic shimmer
"Forest_Depths" = "res://assets/audio/music/Forest_Depths.wav"                  # Exterior approach, Campgrounds — primal nature
"Midnight_Garden" = "res://assets/audio/music/Midnight_Garden.wav"              # Gorgon's Garden, Poison Garden — 84Hz dark folk
"Ocean's_Edge" = "res://assets/audio/music/Ocean's_Edge.wav"                    # Water Zones, Tidal Caves — liquid 42Hz
"Royal_Fire" = "res://assets/audio/music/Royal_Fire.wav"                        # Main Floor evening, Artisan Market — baroque warmth

# ============================================================
# LOW-DUB AMBIENT TRACKS (4 transformed PD classical)
# ============================================================
[low_dub_ambient]
"inn_campfire_baritone_resonance" = "res://assets/audio/inn_campfire_baritone_resonance.mp3"   # Campgrounds — 50 BPM drone + fire
"inn_bach_cello_lowlub" = "res://assets/audio/inn_bach_cello_lowlub.mp3"                       # Main Floor / Archive — Bach Cello Suite Prelude
"inn_vivaldi_winter_lowdub" = "res://assets/audio/inn_vivaldi_winter_lowdub_catacombs.mp3"     # Catacombs — Vivaldi Winter Largo
"inn_satie_gnossienne_lowdub" = "res://assets/audio/inn_satie_gnossienne_lowdub_archive.mp3"   # Archive / Library — Satie Gnossienne 1

# ============================================================
# CAMPFIRE LAYERS (3 stem tracks for campfire zone)
# ============================================================
[campfire_layers]
"baritone_drone" = "res://assets/audio/campfire/campfire_baritone_drone.wav"      # Base drone — 82Hz + harmonics
"crackle" = "res://assets/audio/campfire/campfire_crackle.wav"                     # Fire crackling layer
"harmony_layer" = "res://assets/audio/campfire/campfire_harmony_layer.wav"         # Harmonic sung layer

# ============================================================
# PD CLASSICAL SOURCES (3 originals — reference only, not in build)
# ============================================================
[pd_sources]
"bach_cello_prelude" = "res://assets/audio/pd_sources/bach_cello_prelude.ogg"
"satie_gnossienne_1" = "res://assets/audio/pd_sources/satie_gnossienne_1.ogg"
"vivaldi_winter_largo" = "res://assets/audio/pd_sources/vivaldi_winter_largo.ogg"

# ============================================================
# STONE VIBRATIONS (160 individual stone tones)
# ============================================================
[stone_vibrations]
# Each stone has a unique tone based on Mohs hardness → frequency mapping
# Files: res://assets/audio/stone_vibrations/{StoneName}.wav
# Directory: res://assets/audio/stone_vibrations/
# Count: 160 files
# Used by: Bead Composer (stone selection), Geode Cave (collection), World Map (pin hover)

# ============================================================
# STONE CHORDS (12 harmonic chord sets for key stones)
# ============================================================
[stone_chords]
# Major stones have full chord progressions, not just single tones
# Files: res://assets/audio/stone_chords/{StoneName}.wav
# Directory: res://assets/audio/stone_chords/
# Count: 12 files (Amber, Amethyst, Clear_Quartz, Diamond, Gold, Hematite, Jet, Malachite, Opal, Pearl, Pyrite, Ruby)
# Used by: major story moments, quest rewards, boss defeats

# ============================================================
# ZONE → AUDIO MAPPING (for GameManager/AudioManager)
# ============================================================
[zone_audio_map]
# Format: zone_name = { primary_track, ambient_track, frequency, tempo_bpm }
"hub" = { primary = "Soulstice_Signature", ambient = "inn_bach_cello_lowlub", frequency = 42, tempo = 50 }
"cosmology" = { primary = "Earth_&_Sky", ambient = "", frequency = 0, tempo = 65 }
"clockwork_skies" = { primary = "", ambient = "", frequency = 111, tempo = 78 }
"main_floor_day" = { primary = "Royal_Fire", ambient = "inn_bach_cello_lowlub", frequency = 42, tempo = 88 }
"main_floor_evening" = { primary = "Royal_Fire", ambient = "inn_satie_gnossienne_lowdub", frequency = 42, tempo = 75 }
"campgrounds" = { primary = "Forest_Depths", ambient = "inn_campfire_baritone_resonance", frequency = 42, tempo = 50 }
"staircase" = { primary = "", ambient = "", frequency = 42, tempo = 80 }  # Ascending key shift
"catacombs_egypt" = { primary = "", ambient = "inn_vivaldi_winter_lowdub", frequency = 42, tempo = 70 }
"archive" = { primary = "", ambient = "inn_satie_gnossienne_lowdub", frequency = 42, tempo = 55 }
"market_day" = { primary = "Royal_Fire", ambient = "", frequency = 42, tempo = 108 }
"water_zones" = { primary = "Ocean's_Edge", ambient = "", frequency = 42, tempo = 80 }
"gorgons_garden" = { primary = "Midnight_Garden", ambient = "", frequency = 84, tempo = 70 }
"undercity" = { primary = "Midnight_Garden", ambient = "", frequency = 84, tempo = 78 }
"shadow_inn" = { primary = "Midnight_Garden", ambient = "", frequency = 84, tempo = 75 }
"fae_seelie" = { primary = "Earth_&_Sky", ambient = "", frequency = 42, tempo = 100 }
"fae_unseelie" = { primary = "Midnight_Garden", ambient = "", frequency = 84, tempo = 78 }
"world_map" = { primary = "Soulstice_Signature", ambient = "", frequency = 42, tempo = 90 }
"whisper_layer" = { primary = "", ambient = "", frequency = 0, tempo = 0 }  # Varies by zone — subtle variant

# ============================================================
# GAME → AUDIO MAPPING
# ============================================================
[game_audio_map]
# Format: game_name = { bgm_track, zone, frequency_mode }
"Standing Stones" = { bgm = "Soulstice_Signature", zone = "catacombs_egypt", frequency = 42 }
"Tomb Tunnel" = { bgm = "inn_vivaldi_winter_lowdub", zone = "catacombs_egypt", frequency = 42 }
"Andean Run" = { bgm = "Forest_Depths", zone = "catacombs_andean", frequency = 42 }
"Monster of the Deep" = { bgm = "Ocean's_Edge", zone = "water_zones", frequency = 42 }
"Tumble Run" = { bgm = "Soulstice_Signature", zone = "canopy", frequency = 42 }

# ============================================================
# FREQUENCY TONES (generated procedurally by AudioManager)
# ============================================================
[frequency_tones]
# These are synthesized at runtime, not file-based:
# 42Hz = The Song of Making (Living) — sub-bass drone
# 84Hz = Shadow Inn inverse — dark pressure
# 111Hz = Gargoyle Watchers — resonant sentinel
# 50 BPM = Canopy Heartbeat — always present as sub-pulse
# 7.83Hz = Schumann Resonance — calibration tone (rare)
