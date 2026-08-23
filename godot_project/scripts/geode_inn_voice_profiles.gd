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
		"erik", "uhtred", "one_who_is_awake", "zorya", "kali",
		"pirate", "siren_outer", "siren_inner", "shifting_man",
		"peruvian_guide", "radagast", "beorn", "medusa",
		"host", "anubis", "crone", "charon", "catalyst",
		"cartographer", "examiner",
		"astronomer_deduction", "astronomer_contemplation", "nyx_purge", "nyx_wisdom", "guest", "keeper", "constant"
	]
