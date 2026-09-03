# geode_inn_voice_profiles.gd
# Voice profile resource for all Geode Inn characters
# Load this resource and apply to any DialogueSystem or CharacterController
# This file is kept in sync with docs/geode_inn_voice_profile_translation_reference.md

extends Resource
class_name GeodeInnVoiceProfile

# === SYSTEM-LEVEL CONSTANTS ===
const SONG_FREQUENCY_HZ: float = 42.0
const CANOPY_SWAY_BPM: float = 50.0
const CANOPY_SWAY_PERIOD: float = 60.0 / CANOPY_SWAY_BPM  # 1.2 seconds per sway cycle
const INVERSE_FREQUENCY_HZ: float = 84.0       # Shadow Inn / petrify frequency
const GARGOYLE_WATCH_HZ: float = 111.0         # Gargoyle watcher frequency
const SCHUMANN_RESONANCE_HZ: float = 7.83     # Eileen's calibration tone
const SOLFEGGIO_BASE_HZ: float = 396.0         # Solfeggio scale base (Melpomene)
const RESONANCE_HEALING_HZ: float = 528.0      # Terpsichore / DNA repair
const CONNECTION_HZ: float = 639.0            # Erato / relationships
const EXPRESSION_HZ: float = 741.0            # Polyhymnia / expression
const INTUITION_HZ: float = 852.0             # Urania / cosmic intuition

# === CHARACTER PROFILES ===
# Each profile is a Dictionary with standardized keys.
# Use get_profile(character_id) to retrieve any character's data.

static func get_profile(character_id: String) -> Dictionary:
	var profiles = {
		
		"erik": {
			"pitch_hz": 100.0,
			"pitch_end_hz": 100.0,
			"reveal_speed_ms": 30,
			"reveal_speed_end_ms": 30,
			"pause_ms": 200,
			"expressiveness": 0.7,
			"instrument": "taglharpa",
			"cadence": "feast",
			"facial_intensity": 0.7,
			"gesture_frequency": 0.8,
			"gesture_type": "expansive_open",
			"idle_animation": "lean_forward_warm",
			"light_source": "feast_fire_amber",
			"special": {"rare_state": "fire_memory_pause"}
		},
		
		"uhtred": {
			"pitch_hz": 120.0,
			"pitch_end_hz": 120.0,
			"reveal_speed_ms": 45,
			"reveal_speed_end_ms": 45,
			"pause_ms": 400,
			"expressiveness": 0.3,
			"instrument": "war_drum_fingers",
			"cadence": "verdict",
			"facial_intensity": 0.3,
			"gesture_frequency": 0.2,
			"gesture_type": "precise_minimal",
			"idle_animation": "finger_drum",
			"light_source": "mobile_campfire",
			"special": {"level_volume": true, "light_source_mobile": true}
		},
		
		"one_who_is_awake": {
			"pitch_hz": 110.0,
			"pitch_end_hz": 110.0,
			"reveal_speed_ms": 55,
			"reveal_speed_end_ms": 55,
			"pause_ms": 200,
			"expressiveness": 0.2,
			"instrument": "guqin",
			"cadence": "whisper_continuous",
			"facial_intensity": 0.2,
			"gesture_frequency": 0.05,
			"gesture_type": "touch_warrior_shoulder",
			"idle_animation": "naming_cycle",
			"light_source": "dust_shaft",
			"special": {"continuous_naming": true, "ambient_dust": true}
		},
		
		"zorya": {
			"pitch_hz": 175.0,
			"pitch_end_hz": 175.0,
			"reveal_speed_ms": 65,
			"reveal_speed_end_ms": 65,
			"pause_ms": 1000,
			"expressiveness": 0.25,
			"instrument": "glass_harp",
			"cadence": "constellation",
			"facial_intensity": 0.25,
			"gesture_frequency": 0.15,
			"gesture_type": "placing_stars",
			"idle_animation": "reading_aurora",
			"light_source": "aurora_dynamic",
			"special": {"aurora_phase_cycle": ["green", "violet", "white"]}
		},
		
		"kali": {
			"pitch_hz": 175.0,
			"pitch_end_hz": 130.0,
			"reveal_speed_ms": 40,
			"reveal_speed_end_ms": 80,
			"pause_ms": 600,
			"expressiveness": 0.5,
			"instrument": "damaru",
			"cadence": "blade_to_tongue",
			"facial_intensity": 0.5,
			"gesture_frequency": 0.4,
			"gesture_type": "cut_to_offer",
			"idle_animation": "standing_at_ghats",
			"light_source": "cremation_fire",
			"special": {"descending_pitch": true, "descending_speed": true}
		},
		
		"pirate": {
			"pitch_hz": 130.0,
			"pitch_end_hz": 130.0,
			"reveal_speed_ms": 45,
			"reveal_speed_end_ms": 45,
			"pause_ms": 500,
			"expressiveness": 0.5,
			"instrument": "bodhran",
			"cadence": "measured_warm",
			"facial_intensity": 0.5,
			"gesture_frequency": 0.4,
			"gesture_type": "drum_strike",
			"idle_animation": "drum_fingers",
			"light_source": "tide_cave_bioluminescence",
			"special": {"harbor_master_effect": true}
		},
		
		"siren_outer": {
			"pitch_hz": 220.0,
			"pitch_end_hz": 220.0,
			"reveal_speed_ms": 30,
			"reveal_speed_end_ms": 30,
			"pause_ms": 200,
			"expressiveness": 0.75,
			"instrument": "cello",
			"cadence": "flowing",
			"facial_intensity": 0.75,
			"gesture_frequency": 0.7,
			"gesture_type": "expansive_performance",
			"idle_animation": "performing",
			"light_source": "bioluminescence",
			"special": {"lupus_visibility": true}
		},
		
		"siren_inner": {
			"pitch_hz": 196.0,
			"pitch_end_hz": 196.0,
			"reveal_speed_ms": 80,
			"reveal_speed_end_ms": 80,
			"pause_ms": 1200,
			"expressiveness": 0.35,
			"instrument": "piano_solo",
			"cadence": "deliberate",
			"facial_intensity": 0.35,
			"gesture_frequency": 0.1,
			"gesture_type": "minimal_intimate",
			"idle_animation": "at_piano",
			"light_source": "bioluminescence",
			"special": {"lupus_visibility": true}
		},
		
		"shifting_man": {
			"pitch_hz": 110.0,
			"pitch_end_hz": 110.0,
			"reveal_speed_ms": 55,
			"reveal_speed_end_ms": 55,
			"pause_ms": 600,
			"expressiveness": 0.35,
			"instrument": "viola_sustain",
			"cadence": "restrained",
			"facial_intensity": 0.35,
			"gesture_frequency": 0.3,
			"gesture_type": "fluid_morphing",
			"idle_animation": "form_shifting",
			"light_source": "ambient_soft",
			"special": {"wardrobe_accumulation": true, "form_cycle_seconds": 2.5}
		},
		
		"peruvian_guide": {
			"pitch_hz": 165.0,
			"pitch_end_hz": 165.0,
			"reveal_speed_ms": 50,
			"reveal_speed_end_ms": 50,
			"pause_ms": 700,
			"expressiveness": 0.35,
			"instrument": "ocarina",
			"cadence": "terrace",
			"facial_intensity": 0.35,
			"gesture_frequency": 0.3,
			"gesture_type": "stone_offering",
			"idle_animation": "walking_terraces",
			"light_source": "altitude_sun",
			"special": {"weather_emotional_link": true, "condor_companion": true}
		},
		
		"radagast": {
			"pitch_hz": 150.0,
			"pitch_end_hz": 150.0,
			"reveal_speed_ms": 60,
			"reveal_speed_end_ms": 60,
			"pause_ms": 500,
			"expressiveness": 0.6,
			"instrument": "wooden_flute",
			"cadence": "communion",
			"facial_intensity": 0.6,
			"gesture_frequency": 0.5,
			"gesture_type": "attention_following",
			"idle_animation": "checking_plants",
			"light_source": "dappled_olive_grove",
			"special": {"hedgehog_companion": true, "distracted_cadence": true}
		},
		
		"beorn": {
			"pitch_hz": 100.0,
			"pitch_end_hz": 100.0,
			"reveal_speed_ms": 40,
			"reveal_speed_end_ms": 40,
			"pause_ms": 800,
			"expressiveness": 0.15,
			"instrument": "none",
			"cadence": "threshold",
			"facial_intensity": 0.15,
			"gesture_frequency": 0.1,
			"gesture_type": "minimal_utilitarian",
			"idle_animation": "border_watch",
			"light_source": "forest_edge",
			"special": {"form_shift_indicator": true, "timbre_shift_not_pitch": true}
		},
		
		"medusa": {
			"pitch_hz": 105.0,
			"pitch_end_hz": 105.0,
			"reveal_speed_ms": 55,
			"reveal_speed_end_ms": 55,
			"pause_ms": 600,
			"expressiveness": 0.25,
			"instrument": "lithophone",
			"cadence": "preservation",
			"facial_intensity": 0.25,
			"facial_emotion_source": "snakes",
			"gesture_frequency": 0.15,
			"gesture_type": "stone_placement",
			"idle_animation": "playing_lithophone",
			"light_source": "grotto_low_amber",
			"special": {
				"gaze_petrification": true,
				"snake_emotional_register": true,
				"waiting_for_complete_song": true
			}
		},
		
		"host": {
			"pitch_hz": 110.0,
			"pitch_end_hz": 110.0,
			"reveal_speed_ms": 55,
			"reveal_speed_end_ms": 55,
			"pause_ms": 600,
			"expressiveness": 0.4,
			"instrument": "hearth_ambient",
			"cadence": "anchor",
			"facial_intensity": 0.4,
			"gesture_frequency": 0.2,
			"gesture_type": "deliberate_welcome",
			"idle_animation": "by_hearth",
			"light_source": "hearth_fire",
			"special": {}
		},
		
		"anubis": {
			"pitch_hz": 110.0,
			"pitch_end_hz": 110.0,
			"reveal_speed_ms": 50,
			"reveal_speed_end_ms": 50,
			"pause_ms": 800,
			"expressiveness": 0.3,
			"instrument": "deep_percussion",
			"cadence": "verdict",
			"facial_intensity": 0.3,
			"gesture_frequency": 0.15,
			"gesture_type": "scale_weighing",
			"idle_animation": "tending_scales",
			"light_source": "underworld_amber",
			"special": {}
		},
		
		"crone": {
			"pitch_hz": 120.0,
			"pitch_end_hz": 120.0,
			"reveal_speed_ms": 50,
			"reveal_speed_end_ms": 50,
			"pause_ms": 500,
			"expressiveness": 0.3,
			"instrument": "quill_parchment",
			"cadence": "annotation",
			"facial_intensity": 0.3,
			"gesture_frequency": 0.3,
			"gesture_type": "writing",
			"idle_animation": "annotating",
			"light_source": "candle",
			"special": {}
		},
		
		"charon": {
			"pitch_hz": 100.0,
			"pitch_end_hz": 100.0,
			"reveal_speed_ms": 40,
			"reveal_speed_end_ms": 40,
			"pause_ms": 2000,
			"expressiveness": 0.1,
			"instrument": "pole_water",
			"cadence": "crossing",
			"facial_intensity": 0.1,
			"gesture_frequency": 0.05,
			"gesture_type": "poling",
			"idle_animation": "standing_in_boat",
			"light_source": "river_moonlight",
			"special": {"one_phrase_per_crossing": true, "companion": "spot_the_dog"}
		},
		
		"catalyst": {
			"pitch_hz": 180.0,
			"pitch_end_hz": 180.0,
			"reveal_speed_ms": 25,
			"reveal_speed_end_ms": 25,
			"pause_ms": 150,
			"expressiveness": 0.8,
			"instrument": "kitchen_percussion",
			"cadence": "performance",
			"facial_intensity": 0.8,
			"gesture_frequency": 0.9,
			"gesture_type": "multitask_chaos",
			"idle_animation": "behind_bar",
			"light_source": "bar_warm",
			"special": {"three_layer_reveal": true}
		},
		
		"cartographer": {
			"pitch_hz": 160.0,
			"pitch_end_hz": 160.0,
			"reveal_speed_ms": 40,
			"reveal_speed_end_ms": 40,
			"pause_ms": 300,
			"expressiveness": 0.4,
			"instrument": "compass_tools",
			"cadence": "tangent",
			"facial_intensity": 0.4,
			"gesture_frequency": 0.4,
			"gesture_type": "mapping",
			"idle_animation": "drawing_maps",
			"light_source": "canopy_filtered",
			"special": {}
		},
		
		"examiner": {
			"pitch_hz": 155.0,
			"pitch_end_hz": 155.0,
			"reveal_speed_ms": 45,
			"reveal_speed_end_ms": 45,
			"pause_ms": 500,
			"expressiveness": 0.2,
			"instrument": "calipers",
			"cadence": "report",
			"facial_intensity": 0.2,
			"gesture_frequency": 0.2,
			"gesture_type": "examining",
			"idle_animation": "inspecting_artifact",
			"light_source": "canopy_filtered",
			"special": {}
		},
		
		"astronomer_deduction": {
			"pitch_hz": 125.0,
			"pitch_end_hz": 160.0,
			"reveal_speed_ms": 25,
			"reveal_speed_end_ms": 25,
			"pause_ms": 100,
			"expressiveness": 0.7,
			"instrument": "violin_staccato",
			"cadence": "mind_palace_deduction",
			"facial_intensity": 0.7,
			"gesture_frequency": 0.9,
			"gesture_type": "connecting_points",
			"idle_animation": "pacing_with_violin",
			"light_source": "starlight_sharp",
			"special": {"rising_pitch": true, "mode": "deduction"}
		},
		


		"nyx_purge": {
			"pitch_hz": 190.0,
			"pitch_end_hz": 220.0,
			"reveal_speed_ms": 30,
			"reveal_speed_end_ms": 30,
			"pause_ms": 300,
			"expressiveness": 0.8,
			"instrument": "harmonica_fast",
			"cadence": "contradiction_purge",
			"facial_intensity": 0.8,
			"gesture_frequency": 0.7,
			"gesture_type": "forceful_honest",
			"idle_animation": "leaning_forward",
			"light_source": "cloak_crystal_glow",
			"special": {"rising_pitch": true, "mode": "purge", "voice_crack": true}
		},
		"nyx_wisdom": {
			"pitch_hz": 190.0,
			"pitch_end_hz": 165.0,
			"reveal_speed_ms": 60,
			"reveal_speed_end_ms": 60,
			"pause_ms": 800,
			"expressiveness": 0.4,
			"instrument": "harmonica_sustained",
			"cadence": "contradiction_wisdom",
			"facial_intensity": 0.4,
			"gesture_frequency": 0.2,
			"gesture_type": "settled_back",
			"idle_animation": "doc_martens_crossed",
			"light_source": "cloak_crystal_glow_soft",
			"special": {"descending_pitch": true, "mode": "wisdom"}
		}

		"guest": {
			"pitch_hz": 115.0,
			"pitch_end_hz": 115.0,
			"reveal_speed_ms": 50,
			"reveal_speed_end_ms": 50,
			"pause_ms": 700,
			"expressiveness": 0.45,
			"instrument": "music_box",
			"cadence": "first_time",
			"facial_intensity": 0.45,
			"gesture_frequency": 0.3,
			"gesture_type": "curious_gentle",
			"idle_animation": "by_staircase_threshold",
			"light_source": "threshold_amber",
			"special": {"borrowed_body": true, "mask_tell": true, "dual_role": "guest_host"}
		},

		"keeper": {
			"pitch_hz": 105.0,
			"pitch_end_hz": 105.0,
			"reveal_speed_ms": 80,
			"reveal_speed_end_ms": 80,
			"pause_ms": 1200,
			"expressiveness": 0.2,
			"instrument": "bodhran_heartbeat",
			"cadence": "heartbeat",
			"facial_intensity": 0.2,
			"gesture_frequency": 0.05,
			"gesture_type": "still_watching",
			"idle_animation": "facing_sea",
			"light_source": "crystal_beacon_amber",
			"special": {"owl_eyes": true, "heartbeat_sync": true, "beacon_ability": true}
		},
		"constant": {
			"pitch_hz": 115.0,
			"pitch_end_hz": 115.0,
			"reveal_speed_ms": 70,
			"reveal_speed_end_ms": 70,
			"pause_ms": 1500,
			"expressiveness": 0.2,
			"instrument": "bull_lyre",
			"cadence": "orbital",
			"facial_intensity": 0.2,
			"gesture_frequency": 0.1,
			"gesture_type": "watching_void",
			"idle_animation": "sitting_facing_void",
			"light_source": "indigo_starlight",
			"special": {"void_presence": true, "dual_song": true, "starlight_crystal": true}
		},
		"astronomer_contemplation": {
			"pitch_hz": 125.0,
			"pitch_end_hz": 100.0,
			"reveal_speed_ms": 65,
			"reveal_speed_end_ms": 65,
			"pause_ms": 900,
			"expressiveness": 0.3,
			"instrument": "violin_sustained",
			"cadence": "mind_palace_contemplation",
			"facial_intensity": 0.3,
			"gesture_frequency": 0.1,
			"gesture_type": "looking_at_sky",
			"idle_animation": "stargazing_with_violin",
			"light_source": "starlight_soft",
			"special": {"descending_pitch": true, "mode": "contemplation"}
		},
"firekeeper": {
			"pitch_hz": 95.0,
			"pitch_end_hz": 95.0,
			"reveal_speed_ms": 35,
			"reveal_speed_end_ms": 35,
			"pause_ms": 400,
			"expressiveness": 0.7,
			"instrument": "hearth_crackle",
			"cadence": "theatrical_warm",
			"facial_intensity": 0.7,
			"gesture_frequency": 0.6,
			"gesture_type": "expansive_dramatic",
			"idle_animation": "tending_fire",
			"light_source": "hearth_fire",
			"special": {"theatrical_pauses": true, "fire_sync": true}
		},
		
		"laughing_one": {
			"pitch_hz": 125.0,
			"pitch_end_hz": 125.0,
			"reveal_speed_ms": 20,
			"reveal_speed_end_ms": 20,
			"pause_ms": 100,
			"expressiveness": 0.9,
			"instrument": "kazoo_banjo",
			"cadence": "improvisation",
			"facial_intensity": 0.9,
			"gesture_frequency": 0.85,
			"gesture_type": "rapid_shape_shifting",
			"idle_animation": "micro_bit",
			"light_source": "warm_omni",
			"special": {"voice_characters": true, "unpredictable_timing": true}
		},
		
		"retort": {
			"pitch_hz": 175.0,
			"pitch_end_hz": 175.0,
			"reveal_speed_ms": 30,
			"reveal_speed_end_ms": 30,
			"pause_ms": 250,
			"expressiveness": 0.5,
			"instrument": "harpsichord",
			"cadence": "quick_wit",
			"facial_intensity": 0.5,
			"gesture_frequency": 0.4,
			"gesture_type": "precise_jabs",
			"idle_animation": "arms_crossed_amused",
			"light_source": "staircase_ambient",
			"special": {"repartee_mode": true}
		},
		
		"cook": {
			"pitch_hz": 115.0,
			"pitch_end_hz": 115.0,
			"reveal_speed_ms": 40,
			"reveal_speed_end_ms": 40,
			"pause_ms": 300,
			"expressiveness": 0.75,
			"instrument": "kitchen_percussion",
			"cadence": "boisterous",
			"facial_intensity": 0.75,
			"gesture_frequency": 0.7,
			"gesture_type": "cooking_metaphor",
			"idle_animation": "chopping_stirring",
			"light_source": "kitchen_warm",
			"special": {"food_metaphors": true, "singing_cadence": true}
		},
		
		"thrum": {
			"pitch_hz": 80.0,
			"pitch_end_hz": 80.0,
			"reveal_speed_ms": 60,
			"reveal_speed_end_ms": 60,
			"pause_ms": 800,
			"expressiveness": 0.2,
			"instrument": "sub_bass_drone",
			"cadence": "vibration",
			"facial_intensity": 0.2,
			"gesture_frequency": 0.05,
			"gesture_type": "resonance_hum",
			"idle_animation": "emitting_frequency",
			"light_source": "low_amber_pulse",
			"special": {"frequency_visual": true, "42hz_sync": true}
		},
		
		"ryan": {
			"pitch_hz": 105.0,
			"pitch_end_hz": 105.0,
			"reveal_speed_ms": 35,
			"reveal_speed_end_ms": 35,
			"pause_ms": 350,
			"expressiveness": 0.65,
			"instrument": "concertina",
			"cadence": "pirate_australian",
			"facial_intensity": 0.65,
			"gesture_frequency": 0.6,
			"gesture_type": "theatrical_sweep",
			"idle_animation": "leaning_on_bar",
			"light_source": "meadery_warm",
			"special": {"historical_memory": true, "theatrical_stories": true}
		},
		
		"norn_urd": {
			"pitch_hz": 100.0,
			"pitch_end_hz": 100.0,
			"reveal_speed_ms": 50,
			"reveal_speed_end_ms": 50,
			"pause_ms": 1200,
			"expressiveness": 0.15,
			"instrument": "deep_bone_flute",
			"cadence": "ancient_weight",
			"facial_intensity": 0.15,
			"gesture_frequency": 0.1,
			"gesture_type": "slow_weighing",
			"idle_animation": "watching_visitors",
			"light_source": "bone_room_amber",
			"special": {"mode": "past", "icelandic_vowels": true}
		},
		
		"norn_verdandi": {
			"pitch_hz": 150.0,
			"pitch_end_hz": 150.0,
			"reveal_speed_ms": 35,
			"reveal_speed_end_ms": 35,
			"pause_ms": 200,
			"expressiveness": 0.35,
			"instrument": "spinning_wheel",
			"cadence": "constant_updating",
			"facial_intensity": 0.35,
			"gesture_frequency": 0.4,
			"gesture_type": "spinning_thread",
			"idle_animation": "spinning",
			"light_source": "main_floor_warm",
			"special": {"mode": "present", "mid_sentence_corrections": true}
		},
		
		"norn_skuld": {
			"pitch_hz": 130.0,
			"pitch_end_hz": 130.0,
			"reveal_speed_ms": 55,
			"reveal_speed_end_ms": 55,
			"pause_ms": 900,
			"expressiveness": 0.2,
			"instrument": "shears",
			"cadence": "sparse_declaration",
			"facial_intensity": 0.2,
			"gesture_frequency": 0.1,
			"gesture_type": "cutting_thread",
			"idle_animation": "facing_cosmology",
			"light_source": "starlight_cold",
			"special": {"mode": "future", "short_declarative": true}
		},
		
		"thorin_extrovert": {
			"pitch_hz": 115.0,
			"pitch_end_hz": 115.0,
			"reveal_speed_ms": 25,
			"reveal_speed_end_ms": 25,
			"pause_ms": 100,
			"expressiveness": 0.8,
			"instrument": "fiddle_fast",
			"cadence": "boisterous_rapid",
			"facial_intensity": 0.8,
			"gesture_frequency": 0.85,
			"gesture_type": "expansive_gesturing",
			"idle_animation": "pacing_excited",
			"light_source": "mead_hall_fire",
			"special": {"mode": "extrovert", "ja_loud": true}
		},
		
		"thorin_scholar": {
			"pitch_hz": 115.0,
			"pitch_end_hz": 115.0,
			"reveal_speed_ms": 70,
			"reveal_speed_end_ms": 70,
			"pause_ms": 1000,
			"expressiveness": 0.2,
			"instrument": "fiddle_slow",
			"cadence": "chiseled_precision",
			"facial_intensity": 0.2,
			"gesture_frequency": 0.1,
			"gesture_type": "examining_stone",
			"idle_animation": "studying_specimen",
			"light_source": "desk_lamp",
			"special": {"mode": "scholar", "ja_quiet": true}
		},
		
		"marijke": {
			"pitch_hz": 170.0,
			"pitch_end_hz": 170.0,
			"reveal_speed_ms": 30,
			"reveal_speed_end_ms": 30,
			"pause_ms": 200,
			"expressiveness": 0.5,
			"instrument": "calipers_click",
			"cadence": "blunt_precision",
			"facial_intensity": 0.5,
			"gesture_frequency": 0.5,
			"gesture_type": "holding_up_stone",
			"idle_animation": "examining_stone",
			"light_source": "mead_hall_bright",
			"special": {"lekker_approval": true, "no_hedging": true}
		},
		
		"katy": {
			"pitch_hz": 160.0,
			"pitch_end_hz": 160.0,
			"reveal_speed_ms": 50,
			"reveal_speed_end_ms": 50,
			"pause_ms": 600,
			"expressiveness": 0.45,
			"instrument": "trowel_garden",
			"cadence": "nurturing_intensity",
			"facial_intensity": 0.45,
			"gesture_frequency": 0.5,
			"gesture_type": "tending_plants",
			"idle_animation": "gardening",
			"light_source": "garden_dappled",
			"special": {"talks_to_plants": true, "brabant_warmth": true}
		},
		
		"oceanianoir": {
			"pitch_hz": 120.0,
			"pitch_end_hz": 120.0,
			"reveal_speed_ms": 40,
			"reveal_speed_end_ms": 40,
			"pause_ms": 400,
			"expressiveness": 0.3,
			"instrument": "water_glass",
			"cadence": "chemical_precision",
			"facial_intensity": 0.3,
			"gesture_frequency": 0.3,
			"gesture_type": "measuring",
			"idle_animation": "examining_water",
			"light_source": "tide_cave_blue",
			"special": {"french_terms": true, "murloc_companion": "squeak"}
		},
		
		"eileen": {
			"pitch_hz": 110.0,
			"pitch_end_hz": 110.0,
			"reveal_speed_ms": 55,
			"reveal_speed_end_ms": 55,
			"pause_ms": 1500,
			"expressiveness": 0.2,
			"instrument": "cave_drip",
			"cadence": "geological_pause",
			"facial_intensity": 0.2,
			"gesture_frequency": 0.1,
			"gesture_type": "slow_gesture",
			"idle_animation": "sitting_in_cave",
			"light_source": "cave_glow",
			"special": {"the_both_are": true, "schumann_calibration": 7.83}
		},
		
		"fixer": {
			"pitch_hz": 105.0,
			"pitch_end_hz": 105.0,
			"reveal_speed_ms": 40,
			"reveal_speed_end_ms": 40,
			"pause_ms": 600,
			"expressiveness": 0.15,
			"instrument": "hammer_stone",
			"cadence": "economical",
			"facial_intensity": 0.15,
			"gesture_frequency": 0.05,
			"gesture_type": "working_hands",
			"idle_animation": "repairing",
			"light_source": "torchlight",
			"special": {"there_completion": true, "masonic_symbols": true}
		},
		
		"reader": {
			"pitch_hz": 140.0,
			"pitch_end_hz": 140.0,
			"reveal_speed_ms": 80,
			"reveal_speed_end_ms": 80,
			"pause_ms": 2000,
			"expressiveness": 0.1,
			"instrument": "page_turn",
			"cadence": "one_line_per_visit",
			"facial_intensity": 0.1,
			"gesture_frequency": 0.02,
			"gesture_type": "turning_page",
			"idle_animation": "reading_window_seat",
			"light_source": "window_light",
			"special": {"one_line_only": true, "no_quest": true, "no_reward": true}
		},
		
		"beverley": {
			"pitch_hz": 180.0,
			"pitch_end_hz": 180.0,
			"reveal_speed_ms": 25,
			"reveal_speed_end_ms": 25,
			"pause_ms": 150,
			"expressiveness": 0.3,
			"instrument": "stamp_thud",
			"cadence": "clipped_dismissive",
			"facial_intensity": 0.3,
			"gesture_frequency": 0.3,
			"gesture_type": "pointing_filing",
			"idle_animation": "filing_aggressively",
			"light_source": "library_fluorescent",
			"special": {"wrong_complete_sentence": true, "two_thirds_height": true}
		},
		
		"joe": {
			"pitch_hz": 115.0,
			"pitch_end_hz": 115.0,
			"reveal_speed_ms": 35,
			"reveal_speed_end_ms": 35,
			"pause_ms": 300,
			"expressiveness": 0.55,
			"instrument": "jazz_piano",
			"cadence": "smooth_amused",
			"facial_intensity": 0.55,
			"gesture_frequency": 0.5,
			"gesture_type": "casual_elegant",
			"idle_animation": "leaning_bar",
			"light_source": "meadery_amber",
			"special": {"mmm_before_answer": true, "self_aware_charm": true}
		},
		
		"teacher_warm": {
			"pitch_hz": 150.0,
			"pitch_end_hz": 150.0,
			"reveal_speed_ms": 45,
			"reveal_speed_end_ms": 45,
			"pause_ms": 400,
			"expressiveness": 0.6,
			"instrument": "guitar_gentle",
			"cadence": "warm_nurturing",
			"facial_intensity": 0.6,
			"gesture_frequency": 0.5,
			"gesture_type": "open_welcoming",
			"idle_animation": "sitting_comfortably",
			"light_source": "archive_warm",
			"special": {"mode": "warm", "frequency": 0.9}
		},
		
		"teacher_cold": {
			"pitch_hz": 130.0,
			"pitch_end_hz": 130.0,
			"reveal_speed_ms": 30,
			"reveal_speed_end_ms": 30,
			"pause_ms": 800,
			"expressiveness": 0.1,
			"instrument": "metronome_cold",
			"cadence": "flat_correction",
			"facial_intensity": 0.1,
			"gesture_frequency": 0.05,
			"gesture_type": "still_staring",
			"idle_animation": "sitting_perfectly_still",
			"light_source": "archive_cold",
			"special": {"mode": "cold", "frequency": 0.09, "trigger": "spelling_error"}
		},
		
		"teacher_horror": {
			"pitch_hz": 120.0,
			"pitch_end_hz": 90.0,
			"reveal_speed_ms": 15,
			"reveal_speed_end_ms": 15,
			"pause_ms": 3000,
			"expressiveness": 0.95,
			"instrument": "dissonant_string",
			"cadence": "three_second_horror",
			"facial_intensity": 0.95,
			"gesture_frequency": 0.02,
			"gesture_type": "frozen_smile",
			"idle_animation": "perfectly_still",
			"light_source": "archive_horror_shift",
			"special": {"mode": "horror", "frequency": 0.01, "duration_seconds": 3, "trigger": "rare"}
		},
		
		"wanderer": {
			"pitch_hz": 110.0,
			"pitch_end_hz": 110.0,
			"reveal_speed_ms": 45,
			"reveal_speed_end_ms": 45,
			"pause_ms": 500,
			"expressiveness": 0.4,
			"instrument": "walking_staff_tap",
			"cadence": "warm_weathered",
			"facial_intensity": 0.4,
			"gesture_frequency": 0.35,
			"gesture_type": "traveler_gesture",
			"idle_animation": "leaning_on_staff",
			"light_source": "main_floor_warm",
			"special": {"chibi_ravens": true, "theft_event": true}
		},
		
		"allfather": {
			"pitch_hz": 80.0,
			"pitch_end_hz": 80.0,
			"reveal_speed_ms": 50,
			"reveal_speed_end_ms": 50,
			"pause_ms": 1500,
			"expressiveness": 0.15,
			"instrument": "deep_horn",
			"cadence": "declaration",
			"facial_intensity": 0.15,
			"gesture_frequency": 0.05,
			"gesture_type": "imperceptible_nod",
			"idle_animation": "throne_perched_ravens",
			"light_source": "cosmology_starlight",
			"special": {"silence_is_delivery": true, "perched_ravens": true}
		},
		
		"selkie": {
			"pitch_hz": 145.0,
			"pitch_end_hz": 145.0,
			"reveal_speed_ms": 60,
			"reveal_speed_end_ms": 60,
			"pause_ms": 900,
			"expressiveness": 0.35,
			"instrument": "ocean_drum",
			"cadence": "deliberate_bilingual",
			"facial_intensity": 0.35,
			"gesture_frequency": 0.3,
			"gesture_type": "hands_always_working",
			"idle_animation": "crafting_stone",
			"light_source": "tidal_cave_bioluminescence",
			"special": {"grand_acknowledgement": true, "sea_voice_distant": true, "two_language_translation": true}
		},
		
		"quire": {
			"pitch_hz": 130.0,
			"pitch_end_hz": 130.0,
			"reveal_speed_ms": 50,
			"reveal_speed_end_ms": 50,
			"pause_ms": 700,
			"expressiveness": 0.2,
			"instrument": "quill_scratch",
			"cadence": "hushed_careful",
			"facial_intensity": 0.2,
			"gesture_frequency": 0.15,
			"gesture_type": "looking_over_shoulder",
			"idle_animation": "reading_restricted_text",
			"light_source": "archive_candle_low",
			"special": {"restricted_access": true, "lovecraftian_subtext": true}
		},
		
		"naut": {
			"pitch_hz": 115.0,
			"pitch_end_hz": 115.0,
			"reveal_speed_ms": 50,
			"reveal_speed_end_ms": 50,
			"pause_ms": 600,
			"expressiveness": 0.25,
			"instrument": "reading_lamp_click",
			"cadence": "scholarly_genteel",
			"facial_intensity": 0.25,
			"gesture_frequency": 0.2,
			"gesture_type": "adjusting_spectacles",
			"idle_animation": "reading_by_fire",
			"light_source": "fireplace_warm",
			"special": {"four_foot_height": true, "spectacles": true, "hidden_quest_giver": true}
		},
		
		"lark": {
			"pitch_hz": 175.0,
			"pitch_end_hz": 175.0,
			"reveal_speed_ms": 35,
			"reveal_speed_end_ms": 35,
			"pause_ms": 250,
			"expressiveness": 0.55,
			"instrument": "clear_bell",
			"cadence": "warm_clear_encouraging",
			"facial_intensity": 0.55,
			"gesture_frequency": 0.5,
			"gesture_type": "open_guiding",
			"idle_animation": "tutorial_ready",
			"light_source": "tutorial_bright",
			"special": {"tutorial_mode": true, "never_condescending": true}
		},
		
		"oleander": {
			"pitch_hz": 120.0,
			"pitch_end_hz": 120.0,
			"reveal_speed_ms": 40,
			"reveal_speed_end_ms": 40,
			"pause_ms": 500,
			"expressiveness": 0.3,
			"instrument": "harp_courtly",
			"cadence": "cultured_annoyed",
			"facial_intensity": 0.3,
			"gesture_frequency": 0.25,
			"gesture_type": "measured_royal",
			"idle_animation": "throne_patient_irritated",
			"light_source": "seelie_gold",
			"special": {"silent_O_annoys": true, "mother_spelling_joke": true}
		},
		
		"malachi": {
			"pitch_hz": 90.0,
			"pitch_end_hz": 90.0,
			"reveal_speed_ms": 45,
			"reveal_speed_end_ms": 45,
			"pause_ms": 800,
			"expressiveness": 0.25,
			"instrument": "bass_clarinet_dark",
			"cadence": "testing_deliberate",
			"facial_intensity": 0.25,
			"gesture_frequency": 0.15,
			"gesture_type": "measuring_warmth",
			"idle_animation": "frozen_throne",
			"light_source": "unseelie_ice",
			"special": {"dark_measured": true, "warmth_meter": true}
		},
		
		"bog_fairy_golem": {
			"pitch_hz": 85.0,
			"pitch_end_hz": 85.0,
			"reveal_speed_ms": 55,
			"reveal_speed_end_ms": 55,
			"pause_ms": 700,
			"expressiveness": 0.3,
			"instrument": "bog_earth_rumble",
			"cadence": "organic_slow",
			"facial_intensity": 0.3,
			"gesture_frequency": 0.2,
			"gesture_type": "earth_gesture",
			"idle_animation": "standing_in_bog",
			"light_source": "bayou_green_gold",
			"special": {"made_of_swamp": true, "42hz_animated": true, "krista_avatar": true}
		},
		
		"will": {
			"pitch_hz": 95.0,
			"pitch_end_hz": 95.0,
			"reveal_speed_ms": 50,
			"reveal_speed_end_ms": 50,
			"pause_ms": 600,
			"expressiveness": 0.3,
			"instrument": "deep_cello_sustained",
			"cadence": "ocean_worn",
			"facial_intensity": 0.3,
			"gesture_frequency": 0.2,
			"gesture_type": "slow_deliberate",
			"idle_animation": "standing_at_depth",
			"light_source": "atlantis_deep_blue",
			"special": {"shaped_by_pressure": true, "oceanianoir_partner": true}
		},
		
		"eres": {
			"pitch_hz": 130.0,
			"pitch_end_hz": 130.0,
			"reveal_speed_ms": 30,
			"reveal_speed_end_ms": 30,
			"pause_ms": 100,
			"expressiveness": 0.25,
			"instrument": "cab_horn_soft",
			"cadence": "three_words_or_fewer",
			"facial_intensity": 0.25,
			"gesture_frequency": 0.15,
			"gesture_type": "minimal_nod",
			"idle_animation": "waiting",
			"light_source": "cosmology_starlight",
			"special": {"brevity_max": 3, "economical_warmth": true}
		},
		
		"rachel_kaiser": {
			"pitch_hz": 155.0,
			"pitch_end_hz": 155.0,
			"reveal_speed_ms": 35,
			"reveal_speed_end_ms": 35,
			"pause_ms": 250,
			"expressiveness": 0.65,
			"instrument": "brush_canvas",
			"cadence": "artist_intensity",
			"facial_intensity": 0.65,
			"gesture_frequency": 0.7,
			"gesture_type": "painting_gesture",
			"idle_animation": "working_on_mural",
			"light_source": "studio_natural",
			"special": {"sees_canvases": true, "makeup_transformation": true}
		},
		
		"stephanie": {
			"pitch_hz": 190.0,
			"pitch_end_hz": 190.0,
			"reveal_speed_ms": 30,
			"reveal_speed_end_ms": 30,
			"pause_ms": 200,
			"expressiveness": 0.4,
			"instrument": "cat_purr_dissonant",
			"cadence": "sardonic_imperious",
			"facial_intensity": 0.4,
			"gesture_frequency": 0.1,
			"gesture_type": "slow_blink",
			"idle_animation": "lounging_high_surface",
			"light_source": "green_eyes_glow",
			"special": {"devastatingly_observant": true, "lazy_precision": true, "green_eyes": true}
		},
		
		"kathy_dryad": {
			"pitch_hz": 140.0,
			"pitch_end_hz": 140.0,
			"reveal_speed_ms": 50,
			"reveal_speed_end_ms": 50,
			"pause_ms": 500,
			"expressiveness": 0.4,
			"instrument": "wind_through_leaves",
			"cadence": "rooted_ancient",
			"facial_intensity": 0.4,
			"gesture_frequency": 0.3,
			"gesture_type": "tree_gesture",
			"idle_animation": "canopy_communion",
			"light_source": "canopy_emerald",
			"special": {"speaks_for_trees": true, "irish_druid": true, "tree_voice": true}
		},
		
		"elora": {
			"pitch_hz": 165.0,
			"pitch_end_hz": 165.0,
			"reveal_speed_ms": 35,
			"reveal_speed_end_ms": 35,
			"pause_ms": 300,
			"expressiveness": 0.55,
			"instrument": "illusion_chime",
			"cadence": "warm_performing",
			"facial_intensity": 0.55,
			"gesture_frequency": 0.5,
			"gesture_type": "illusion_gesture",
			"idle_animation": "managing_market",
			"light_source": "market_warm",
			"special": {"always_performing_slightly": true, "illusion_interface": true}
		},
		
		"evan": {
			"pitch_hz": 120.0,
			"pitch_end_hz": 120.0,
			"reveal_speed_ms": 45,
			"reveal_speed_end_ms": 45,
			"pause_ms": 600,
			"expressiveness": 0.3,
			"instrument": "chess_clock_tick",
			"cadence": "measured_strategic",
			"facial_intensity": 0.3,
			"gesture_frequency": 0.25,
			"gesture_type": "moving_piece",
			"idle_animation": "studying_board",
			"light_source": "tidal_cave_blue",
			"special": {"chess_metaphors": true, "slightly_amused": true, "dresden_files_fan": true}
		},
		
		"bethany": {
			"pitch_hz": 145.0,
			"pitch_end_hz": 145.0,
			"reveal_speed_ms": 35,
			"reveal_speed_end_ms": 35,
			"pause_ms": 250,
			"expressiveness": 0.5,
			"instrument": "tavern_ambient",
			"cadence": "warm_practical",
			"facial_intensity": 0.5,
			"gesture_frequency": 0.45,
			"gesture_type": "carrying_serving",
			"idle_animation": "managing_tavern",
			"light_source": "tavern_warm",
			"special": {"voice_carries_over_crowd": true, "tavern_manager": true}
		},
		
		"brim": {
			"pitch_hz": 200.0,
			"pitch_end_hz": 200.0,
			"reveal_speed_ms": 25,
			"reveal_speed_end_ms": 25,
			"pause_ms": 150,
			"expressiveness": 0.7,
			"instrument": "cauldron_bubble",
			"cadence": "witchy_mischief",
			"facial_intensity": 0.7,
			"gesture_frequency": 0.6,
			"gesture_type": "mischievous_gesture",
			"idle_animation": "potion_making",
			"light_source": "magritte_surreal",
			"special": {"cackling_under_surface": true, "non_as_question": true}
		},
		
		"brindle": {
			"pitch_hz": 210.0,
			"pitch_end_hz": 210.0,
			"reveal_speed_ms": 20,
			"reveal_speed_end_ms": 20,
			"pause_ms": 100,
			"expressiveness": 0.8,
			"instrument": "dropped_tool_clatter",
			"cadence": "frazzled_rushed",
			"facial_intensity": 0.8,
			"gesture_frequency": 0.75,
			"gesture_type": "running_searching",
			"idle_animation": "looking_for_lost_tool",
			"light_source": "variable_warm",
			"special": {"always_losing_tools": true, "coconut_shells": true, "works_for_owls_unknowingly": true}
		},
		
		"tumble": {
			"pitch_hz": 880.0,
			"pitch_end_hz": 880.0,
			"reveal_speed_ms": 0,
			"reveal_speed_end_ms": 0,
			"pause_ms": 0,
			"expressiveness": 0.0,
			"instrument": "crystal_chime",
			"cadence": "single_note",
			"facial_intensity": 0.0,
			"gesture_frequency": 0.0,
			"gesture_type": "rolling_bounce",
			"idle_animation": "rolling_around",
			"light_source": "crystal_glow",
			"special": {"no_words": true, "single_chime": true, "gets_stuck": true, "four_inch_fur": true, "living_crystal_note": true}
		},
		
		"monsieur_sentient": {
			"pitch_hz": 0.0,
			"pitch_end_hz": 0.0,
			"reveal_speed_ms": 0,
			"reveal_speed_end_ms": 0,
			"pause_ms": 0,
			"expressiveness": 0.0,
			"instrument": "steam_hiss",
			"cadence": "non_verbal_transformation",
			"facial_intensity": 0.0,
			"gesture_frequency": 0.0,
			"gesture_type": "shape_shifting",
			"idle_animation": "being_a_pipe",
			"light_source": "magritte_surreal",
			"special": {"non_verbal": true, "steam_letters": true, "is_the_speaking": true}
		},
		
		"owl": {
			"pitch_hz": 70.0,
			"pitch_end_hz": 70.0,
			"reveal_speed_ms": 70,
			"reveal_speed_end_ms": 70,
			"pause_ms": 3000,
			"expressiveness": 0.05,
			"instrument": "wing_silence",
			"cadence": "rare_significant",
			"facial_intensity": 0.05,
			"gesture_frequency": 0.02,
			"gesture_type": "head_turn_slow",
			"idle_animation": "perched_watching",
			"light_source": "moonlight",
			"special": {"silent_presence": true, "one_of_us_is_near": true, "barn_owl": true}
		},
		
		"archive_npc": {
			"pitch_hz": 130.0,
			"pitch_end_hz": 130.0,
			"reveal_speed_ms": 40,
			"reveal_speed_end_ms": 40,
			"pause_ms": 400,
			"expressiveness": 0.25,
			"instrument": "filing_cabinet",
			"cadence": "precise_exasperated",
			"facial_intensity": 0.25,
			"gesture_frequency": 0.2,
			"gesture_type": "filing_searching",
			"idle_animation": "organizing",
			"light_source": "archive_neat",
			"special": {"filed_where": true}
		},
		
		"garden_npc": {
			"pitch_hz": 160.0,
			"pitch_end_hz": 160.0,
			"reveal_speed_ms": 45,
			"reveal_speed_end_ms": 45,
			"pause_ms": 500,
			"expressiveness": 0.5,
			"instrument": "garden_ambient",
			"cadence": "nurturing_elegant",
			"facial_intensity": 0.5,
			"gesture_frequency": 0.4,
			"gesture_type": "tending_garden",
			"idle_animation": "among_flowers",
			"light_source": "garden_dappled",
			"special": {"everything_grows": true}
		},
		
		"undercity_npc": {
			"pitch_hz": 90.0,
			"pitch_end_hz": 90.0,
			"reveal_speed_ms": 50,
			"reveal_speed_end_ms": 50,
			"pause_ms": 800,
			"expressiveness": 0.2,
			"instrument": "echo_deep",
			"cadence": "knowing_what_underneath",
			"facial_intensity": 0.2,
			"gesture_frequency": 0.15,
			"gesture_type": "measured_knowing",
			"idle_animation": "in_shadows",
			"light_source": "undercity_low",
			"special": {"words_drop_into_well": true}
		},
		
		"staircase_npc": {
			"pitch_hz": 100.0,
			"pitch_end_hz": 100.0,
			"reveal_speed_ms": 45,
			"reveal_speed_end_ms": 45,
			"pause_ms": 700,
			"expressiveness": 0.35,
			"instrument": "glass_armonica_ascend",
			"cadence": "alchemical_transformation",
			"facial_intensity": 0.35,
			"gesture_frequency": 0.3,
			"gesture_type": "ascending_gesture",
			"idle_animation": "climbing",
			"light_source": "staircase_transforming",
			"special": {"each_step_transforms": true, "ascend_command": true}
		}
	}
	
	return profiles.get(character_id, profiles["host"])  # default to host


# === HELPER FUNCTIONS ===

# Get the sway period for canopy animations
static func get_sway_period() -> float:
	return CANOPY_SWAY_PERIOD

# Get the Song frequency for environment shaders
static func get_song_frequency() -> float:
	return SONG_FREQUENCY_HZ

# Apply a voice profile to a DialogueSystem node
# Usage: GeodeInnVoiceProfile.apply_to_dialogue($DialogueSystem, "erik")
static func apply_to_dialogue(dialogue_system: Node, character_id: String) -> void:
	var profile = get_profile(character_id)
	dialogue_system.text_reveal_speed = profile.reveal_speed_ms
	dialogue_system.pause_between_sentences = profile.pause_ms
	dialogue_system.pitch_shift = profile.pitch_hz / 220.0  # normalize to A3
	dialogue_system.expressiveness = profile.expressiveness
	dialogue_system.cadence_pattern = profile.cadence
	if profile.get("pitch_end_hz", profile.pitch_hz) != profile.pitch_hz:
		dialogue_system.descending_pitch = true
		dialogue_system.pitch_end = profile.pitch_end_hz / 220.0
	if profile.get("reveal_speed_end_ms", profile.reveal_speed_ms) != profile.reveal_speed_ms:
		dialogue_system.descending_speed = true
		dialogue_system.reveal_speed_end = profile.reveal_speed_end_ms

# Apply a voice profile to a CharacterController (animation)
# Usage: GeodeInnVoiceProfile.apply_to_character($CharacterController, "medusa")
static func apply_to_character(character: Node, character_id: String) -> void:
	var profile = get_profile(character_id)
	character.facial_intensity = profile.expressiveness
	character.gesture_frequency = profile.gesture_frequency
	character.idle_animation = profile.idle_animation
	character.light_preset = profile.light_source
	# Special mechanics
	for key in profile.get("special", {}):
		character.set_meta(key, profile.special[key])

# Get all character IDs (for UI/debugging)
static func get_all_character_ids() -> Array:
	return [
		"erik",
		"uhtred",
		"one_who_is_awake",
		"zorya",
		"kali",
		"pirate",
		"siren_outer",
		"siren_inner",
		"shifting_man",
		"peruvian_guide",
		"radagast",
		"beorn",
		"medusa",
		"host",
		"anubis",
		"crone",
		"charon",
		"catalyst",
		"cartographer",
		"examiner",
		"astronomer_deduction",
		"nyx_purge",
		"nyx_wisdom",
		"guest",
		"keeper",
		"constant",
		"astronomer_contemplation",
		"laughing_one",
		"retort",
		"cook",
		"thrum",
		"ryan",
		"norn_urd",
		"norn_verdandi",
		"norn_skuld",
		"thorin_extrovert",
		"thorin_scholar",
		"marijke",
		"katy",
		"oceanianoir",
		"eileen",
		"fixer",
		"reader",
		"beverley",
		"joe",
		"teacher_warm",
		"teacher_cold",
		"teacher_horror",
		"wanderer",
		"allfather",
		"selkie",
		"quire",
		"naut",
		"lark",
		"oleander",
		"malachi",
		"bog_fairy_golem",
		"will",
		"eres",
		"rachel_kaiser",
		"stephanie",
		"kathy_dryad",
		"elora",
		"evan",
		"bethany",
		"brim",
		"brindle",
		"tumble",
		"monsieur_sentient",
		"owl",
		"archive_npc",
		"garden_npc",
		"undercity_npc",
		"staircase_npc"
	]
