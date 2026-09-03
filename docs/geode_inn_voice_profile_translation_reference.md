# Geode Inn — Voice Profile → Animation & Engine Translation Reference
## Single Source of Truth for Animators and Game Engine

*This document translates every character's voice profile into:*
1. **AI Animation Prompt Language** — visual/kinetic descriptions for AI video/image generation
2. **Godot Engine Parameters** — actual code values for the game's dialogue and animation systems

---

## Part 1: System-Level Global Parameters

These are the Inn's foundational frequencies and tempos. They affect every zone, every character, and every animation.

### The 42Hz Song
| Parameter | Value | Description |
|---|---|---|
| **Frequency** | 42Hz | The Song's fundamental frequency. The vibration that predates biology. The planet's base note. |
| **AI Animation** | "Deep bass vibration visible in the environment — slow rhythmic undulation in surfaces, particles responding to an unseen low frequency, water rippling in concentric circles, dust motes hanging in vibration patterns, the feeling of a sub-bass that you feel in your chest before you hear it" | |
| **Godot** | `const SONG_FREQUENCY_HZ = 42.0` | Drives procedural environment vibration shaders, audio synthesis, screen-shake effects |
| **Godot Shader** | `uniform float song_frequency = 42.0;` → vertex displacement sine wave | |

### The 50 BPM Canopy Sway
| Parameter | Value | Description |
|---|---|---|
| **Tempo** | 50 BPM | Sleeping heartbeat tempo. The Inn-Tree's sway rate. The baseline rhythm of the canopy. |
| **AI Animation** | "Slow rhythmic swaying throughout the environment — calm cyclical motion at a sleeping-heartbeat tempo, everything swaying gently as if breathing together, vegetation and structures moving in synchronized slow oscillation" | |
| **Godot** | `const CANOPY_SWAY_BPM = 50.0` → `sway_period = 60.0 / CANOPY_SWAY_BPM = 1.2 seconds per sway cycle` | |
| **Godot Animation** | Sine-wave sway with 1.2s period applied to all canopy-level objects via AnimationPlayer or shader | |

### Zone Ambient Frequencies
| Zone | Ambient Hz | BPM | AI Animation | Godot |
|---|---|---|---|---|
| Canopy City | 50 (sway) | 50 | "Synchronized tree-platform swaying, filtered light dappling, calm cyclical motion" | `sway_period = 1.2s` |
| Slavic (Fjord) | 175 (aurora) | Variable | "Aurora light patterns shifting in ice, starlight reflections in still water, three color phases (green/violet/white) cycling slowly" | `aurora_phase_timer` with green/violet/white states |
| India (Ghats) | 42 (Song/aum) | 60 | "River current flowing steadily, incense smoke rising in slow spirals, firelight flickering on stone steps" | `river_flow_speed = 0.3`, `incense_spiral = true` |
| China (Terracotta) | 110 (naming) | Continuous | "Stillness, dust motes in shafts of light, the barely perceptible vibration of 8,000 stone figures, terracotta texture detail" | `ambient_hum = 110Hz`, `dust_particle_density = 0.4` |
| Peruvian (Andes) | 42 (giant's dream) | Geological | "Cloud movement at geological timescale, condor thermals, terrace stone textures, thin-air clarity, weather as emotional expression" | `cloud_speed = 0.05`, `condor_thermal = true` |
| Norse (Fjord camp) | 100 (Erik's fire) | 50 | "Warm firelight on carved wood, mead steam, feast-table abundance, runes glowing faintly on table surface" | `fire_flicker_speed = 1.0`, `rune_glow = 0.3` |
| Mediterranean | 42 (stone/garden) | 50 | "Olive grove dappled light, vine movement, stone texture, butterfly motion, garden abundance, grotto darkness at the edge" | `olive_leaf_shimmer = true`, `garden_growth_rate = 0.01` |
| Mediterranean (Border) | 100 (The Bearsark) | Slow | "Wilderness encroaching on cultivation, bear-sized presence, border between order and chaos, ground changing from cultivated to wild" | `border_proximity_fade = 0.0-1.0` |

---

## Part 2: Character Voice Profile Registry

### Characters with Formal Voice Profiles

Each entry includes: the raw voice profile, the AI animation prompt translation, and the Godot parameter translation.

---

#### 1. Erik (Earl Ragnar) — Norse Vendor
**Actor:** Peter Gantzler | **Zone:** Norse Platform, Canopy City

| Parameter | Value |
|---|---|
| Pitch Baseline | ~100Hz (G2) |
| Text Reveal Speed | ~30ms per character |
| Pause Between Sentences | ~200ms |
| Expressiveness | 0.7 |
| Instrument | Taglharpa (bowed lyre) |
| Cadence Pattern | Feast |

**AI Animation Prompt:**
> "Booming-warm presence, large man with generous overlapping gestures that fill space without aggression, movements that invite rather than command, body language that makes a room feel welcoming, slight vibration in surrounding objects matching a deep resonant frequency (~100Hz), facial expressions highly animated — full-volume warmth, full-volume laughter, rare moments of sudden quiet that carry weight (fire memory), hands always offering or gesturing outward, never closed, posture that opens rather than guards"

**Godot Parameters:**
```gdscript
erik_profile = {
    "pitch_hz": 100.0,
    "reveal_speed_ms": 30,
    "pause_ms": 200,
    "expressiveness": 0.7,
    "instrument": "taglharpa",
    "cadence": "feast",
    "facial_intensity": 0.7,
    "gesture_frequency": 0.8,  # gestures often
    "gesture_type": "expansive_open",
    "idle_animation": "lean_forward_warm",
    "rare_state": "fire_memory_pause"  # triggers brief stillness
}
```

---

#### 2. The Wayfarer — Wandering Neutralizer
**Actor:** Alexander Dreymon | **Zone:** All (wandering)

| Parameter | Value |
|---|---|
| Pitch Baseline | ~120Hz (B2) |
| Text Reveal Speed | ~45ms per character |
| Pause Between Sentences | ~400ms |
| Expressiveness | 0.3 |
| Instrument | War drum (played with fingers, not sticks) |
| Cadence Pattern | Verdict |

**AI Animation Prompt:**
> "Consistent kinetic energy whether sitting or standing — no escalation or de-escalation in movement intensity, deliberate movements with no wasted motion, same intensity in stillness as in action, rhythmic finger-tapping on thigh or table (war-drum-with-fingers), level gaze that doesn't waver, facial expression barely changing regardless of emotional content — the rare micro-expression is devastating because the baseline is so controlled, posture that is ready without being tense, campfire-light on face, mobile campfire as light source"

**Godot Parameters:**
```gdscript
uhtred_profile = {
    "pitch_hz": 120.0,
    "reveal_speed_ms": 45,
    "pause_ms": 400,
    "expressiveness": 0.3,
    "instrument": "war_drum_fingers",
    "cadence": "verdict",
    "facial_intensity": 0.3,
    "gesture_frequency": 0.2,  # gestures rarely
    "gesture_type": "precise_minimal",
    "idle_animation": "finger_drum",
    "special": "level_volume",  # no volume variation regardless of emotion
    "light_source": "mobile_campfire"
}
```

---

#### 3. The One Who Is Awake — China Zone Guide
**Actor:** Will Yun Lee | **Zone:** Terracotta Pit, China

| Parameter | Value |
|---|---|
| Pitch Baseline | ~110Hz (A2) |
| Text Reveal Speed | ~55ms per character |
| Pause Between Sentences | ~200ms |
| Expressiveness | 0.2 |
| Instrument | Guqin (ancient zither) |
| Cadence Pattern | Whisper-continuous |

**AI Animation Prompt:**
> "Stillness as default state — standing among thousands of terracotta figures, barely moving, lips moving in continuous naming, eyes that have been open for 2,000 years and show no fatigue, dust motes catching shafts of light around the figure, the guqin's quiet drone audible underneath, no facial expression change — the expression IS the continuity, the 2,000-year not-stopping, the body that has found the tempo that doesn't tire, one hand occasionally touching a terracotta warrior's shoulder as if in greeting"

**Godot Parameters:**
```gdscript
one_who_is_awake_profile = {
    "pitch_hz": 110.0,
    "reveal_speed_ms": 55,
    "pause_ms": 200,
    "expressiveness": 0.2,
    "instrument": "guqin",
    "cadence": "whisper_continuous",
    "facial_intensity": 0.2,
    "gesture_frequency": 0.05,  # almost no gestures
    "gesture_type": "touch_warrior_shoulder",
    "idle_animation": "naming_cycle",  # lips always moving
    "special": "continuous_naming",  # dialogue runs during conversation without pausing
    "ambient_dust": true
}
```

---

#### 4. Zorya Polunochnaya — Slavic Zone Guide
**Actor:** Tilda Swinton | **Zone:** Fjord of Stars, Slavic

| Parameter | Value |
|---|---|
| Pitch Baseline | ~175Hz (F3) |
| Text Reveal Speed | ~65ms per character |
| Pause Between Sentences | ~1000ms |
| Expressiveness | 0.2-0.3 |
| Instrument | Glass harp |
| Cadence Pattern | Constellation |

**AI Animation Prompt:**
> "Almost-not-a-voice presence, thin clear penetrating tone, movements that place things in space like stars being arranged, extremely long pauses where the character looks upward at the aurora as if reading, glass-harp friction quality in all motion — precise, fragile, beautiful, capable of shattering, aurora light (green/violet/white phases) reflecting off angular features, constellation patterns visible in the ice around the character, Tilda Swinton androgynous angular beauty, cloak that moves like the aurora"

**Godot Parameters:**
```gdscript
zorya_profile = {
    "pitch_hz": 175.0,
    "reveal_speed_ms": 65,
    "pause_ms": 1000,
    "expressiveness": 0.25,
    "instrument": "glass_harp",
    "cadence": "constellation",
    "facial_intensity": 0.25,
    "gesture_frequency": 0.15,
    "gesture_type": "placing_stars",  # deliberate spatial placement
    "idle_animation": "reading_aurora",  # looking up at aurora
    "special": "aurora_phase_cycle",  # green/violet/white phases
    "light_source": "aurora_dynamic"
}
```

---

#### 5. Kali — India Zone Guide
**Actor:** Tabu | **Zone:** Ghats of Kali, India

| Parameter | Value |
|---|---|
| Pitch Baseline | ~175Hz → ~130Hz (descending within each sentence) |
| Text Reveal Speed | ~40ms → ~80ms (slowing within each sentence) |
| Pause Between Sentences | ~600ms |
| Expressiveness | 0.4-0.6 |
| Instrument | Damaru (Shiva's drum) |
| Cadence Pattern | Blade-to-tongue |

**AI Animation Prompt:**
> "Controlled ferocity — movements that begin sharp and fast (the blade, the cut) and soften into recognition (the tongue, the seeing), descending energy within each gesture sequence, Tabu's dark intensity with compassionate undertone, damaru-drum percussive quality in sudden head movements, garland of severed heads as visual element that sways with movement, firelight from cremation ghats as primary light source, the tongue (Kali's iconic extended tongue) as a micro-expression — the moment of self-recognition, hands that gesture downward (cutting) then open (offering)"

**Godot Parameters:**
```gdscript
kali_profile = {
    "pitch_start_hz": 175.0,
    "pitch_end_hz": 130.0,  # descending per sentence
    "reveal_speed_start_ms": 40,
    "reveal_speed_end_ms": 80,  # slowing per sentence
    "pause_ms": 600,
    "expressiveness": 0.5,
    "instrument": "damaru",
    "cadence": "blade_to_tongue",
    "facial_intensity": 0.5,
    "gesture_frequency": 0.4,
    "gesture_type": "cut_to_offer",  # starts sharp, opens
    "idle_animation": "standing_at_ghats",
    "special": "descending_pitch_per_sentence",  # pitch drops each sentence
    "special2": "descending_speed_per_sentence",  # reveal slows each sentence
    "light_source": "cremation_fire"
}
```

---

#### 6. The Pirate — Tidal Caves / Harbor
**Actor:** Mandy Patinkin | **Zone:** Coastal (all zones with shore)

| Parameter | Value |
|---|---|
| Pitch Baseline | ~130Hz (C3) |
| Text Reveal Speed | ~45ms per character |
| Pause Between Sentences | ~500ms |
| Expressiveness | 0.5 |
| Instrument | Bodhrán (Irish frame drum) |
| Cadence Pattern | Measured-warm |

**AI Animation Prompt:**
> "Hands that used to hold a sword now holding a drum — the gesture memory of swordsmanship transmuted into rhythm, measured-warm presence, the Inigo intensity settled into Pirate warmth, bodhrán drum visible and occasionally played with fingers during pauses, Patinkin's expressive eyes that carry both humor and grief simultaneously, sea-spray and tide-cave lighting, posture of a man who lives in the 'after' — the post-quest ease, the post-revenge stillness that is not emptiness but completion"

**Godot Parameters:**
```gdscript
pirate_profile = {
    "pitch_hz": 130.0,
    "reveal_speed_ms": 45,
    "pause_ms": 500,
    "expressiveness": 0.5,
    "instrument": "bodhran",
    "cadence": "measured_warm",
    "facial_intensity": 0.5,
    "gesture_frequency": 0.4,
    "gesture_type": "drum_strike",  # drum-playing gestures
    "idle_animation": "drum_fingers",
    "special": "harbor_master_effect",  # NPCs defer to him
    "light_source": "tide_cave_bioluminescence"
}
```

---

#### 7. The Siren — Deep Water Zone
**Actor:** Lady Gaga | **Zone:** Deep Water (underwater layer)

**Dual cadence system — two complete profiles:**

| Parameter | Outer (Performance) | Inner (Genuine) |
|---|---|---|
| Pitch Baseline | ~220Hz (A3) | ~196Hz (G3) |
| Text Reveal Speed | ~30ms/char | ~80ms/char |
| Pause Between Sentences | ~200ms | ~1200ms |
| Expressiveness | 0.7-0.8 | 0.3-0.4 |
| Instrument | Cello | Solo piano |
| Cadence Pattern | Flowing (jazz phrasing) | Deliberate (behind-the-beat) |

**AI Animation Prompt (Outer):**
> "Room-filling magnetism, effortless performance energy, the Gaga meat-dress-era spectacle — every gesture designed to be seen, flowing movements that fill space, voice that commands attention, cello resonance visible as water vibration around the figure, underwater bioluminescence responding to the voice, the lupus-as-labyrinth visible as faint auto-immune patterns on the skin (the body attacking itself made visible), hair flowing in water current, the performance IS the wall"

**AI Animation Prompt (Inner):**
> "Stripped-down Gaga-at-the-piano vulnerability, stillness that is more powerful than the spectacle, minimal movement — one hand on a surface, eyes down then slowly up, the behind-the-beat quality made visible as slow-motion gesture, the lupus visible as the quiet exhaustion beneath the stillness, piano notes visible as individual water ripples, the inner voice as the moment in 'Shallow' where the production drops away and there's just the voice"

**Godot Parameters:**
```gdscript
siren_profile = {
    "outer": {
        "pitch_hz": 220.0,
        "reveal_speed_ms": 30,
        "pause_ms": 200,
        "expressiveness": 0.75,
        "instrument": "cello",
        "cadence": "flowing",
        "facial_intensity": 0.75,
        "gesture_frequency": 0.7,
        "gesture_type": "expansive_performance"
    },
    "inner": {
        "pitch_hz": 196.0,
        "reveal_speed_ms": 80,
        "pause_ms": 1200,
        "expressiveness": 0.35,
        "instrument": "piano_solo",
        "cadence": "deliberate",
        "facial_intensity": 0.35,
        "gesture_frequency": 0.1,
        "gesture_type": "minimal_intimate"
    },
    "special": "dual_cadence_system",  # switches based on context
    "special2": "lupus_visibility",  # autoimmune patterns on skin
    "light_source": "bioluminescence"
}
```

---

#### 8. The Shifting Man — Wandering Philosopher
**Actor:** Pedro Pascal | **Zone:** All (shifts through)

| Parameter | Value |
|---|---|
| Pitch Baseline | ~110Hz (warm, low, the voice fills a room without raising volume) |
| Text Reveal Speed | ~55ms per character |
| Pause Between Sentences | ~600ms (present but not heavy — thinking, not performing) |
| Expressiveness | 0.3-0.4 |
| Instrument | Viola sustain |
| Cadence Pattern | Restrained (expressiveness in word choice, not pitch variation) |

**AI Animation Prompt:**
> "Fluid identity — the figure subtly shifts between forms during conversation, each form held for 2-3 seconds before flowing into the next, Pedro Pascal's warm presence as the constant underneath the shifting, the wardrobe of accumulated selves visible as layers of clothing that rearrange themselves, viola sustain audible as a drone underneath all speech, movements that are fluid rather than sharp, the cup-overflowing philosophy visible as abundance — too many faces, too many voices, all genuine, all him, the saturation as the enlightenment"

**Godot Parameters:**
```gdscript
shifting_man_profile = {
    "pitch_hz": 110.0,
    "reveal_speed_ms": 55,
    "pause_ms": 600,
    "expressiveness": 0.35,
    "instrument": "viola_sustain",
    "cadence": "restrained",
    "facial_intensity": 0.35,
    "gesture_frequency": 0.3,
    "gesture_type": "fluid_morphing",
    "idle_animation": "form_shifting",  # cycles through forms
    "special": "wardrobe_accumulation",  # visual layers
    "special2": "form_cycle_seconds": 2.5  # time per form
}
```

---

#### 9. The One Who Tends — Peruvian Zone Guide
**Actor:** Q'orianka Kilcher (proposed) | **Zone:** Andes, Peru

| Parameter | Value |
|---|---|
| Pitch Baseline | ~165Hz (E3) |
| Text Reveal Speed | ~50ms per character |
| Pause Between Sentences | ~700ms |
| Expressiveness | 0.35 |
| Instrument | Ocarina (Andean clay flute) |
| Cadence Pattern | Terrace (steps upward, each sentence slightly higher in implication) |

**AI Animation Prompt:**
> "Patient-walking presence, movements at the pace of ascending terraces — each step placed deliberately on stone, Q'orianka Kilcher's earth-connected quality, ocarina's clay-and-breath sound audible, condors circling above in thermals, cloud-forest mist giving way to thin-air clarity as the figure ascends, the giant's face visible in the mountain features behind her, weather patterns shifting with her emotional state (the giant's dream responding to her tending), offerings of stones placed on surfaces with ritual care, the walking IS the animation — steady, terraced, ascending"

**Godot Parameters:**
```gdscript
peruvian_guide_profile = {
    "pitch_hz": 165.0,
    "reveal_speed_ms": 50,
    "pause_ms": 700,
    "expressiveness": 0.35,
    "instrument": "ocarina",
    "cadence": "terrace",
    "facial_intensity": 0.35,
    "gesture_frequency": 0.3,
    "gesture_type": "stone_offering",  # placing stones
    "idle_animation": "walking_terraces",
    "special": "weather_emotional_link",  # weather changes with her state
    "special2": "condor_companion",
    "light_source": "altitude_sun"
}
```

---

#### 10. The Greenward (The Gardener) — Mediterranean Zone Resident
**Actor:** Sylvester McCoy | **Zone:** The Garden, Mediterranean

| Parameter | Value |
|---|---|
| Pitch Baseline | ~150Hz (E3) |
| Text Reveal Speed | ~60ms per character |
| Pause Between Sentences | ~500ms |
| Expressiveness | 0.6 |
| Instrument | Wooden flute (played charmingly badly) |
| Cadence Pattern | Communion (sentences that grow organically, branching) |

**AI Animation Prompt:**
> "Distracted-wandering presence — attention genuinely divided between the conversation and six other living things, sentences that start one direction and drift toward a bird or a plant, McCoy's gentle eccentric energy, grubby hands with soil under the nails, a hedgehog visible somewhere in every scene, wooden flute played with love and minimal technique, movements that follow attention rather than intention — the body goes where the eyes go, cottage partially consumed by garden growth, vines through windows, birds in rafters, genuine unfiltered emotion about small things, the garden growing around and into him"

**Godot Parameters:**
```gdscript
radagast_profile = {
    "pitch_hz": 150.0,
    "reveal_speed_ms": 60,
    "pause_ms": 500,
    "expressiveness": 0.6,
    "instrument": "wooden_flute",
    "cadence": "communion",
    "facial_intensity": 0.6,
    "gesture_frequency": 0.5,
    "gesture_type": "attention_following",  # body follows eyes
    "idle_animation": "checking_plants",
    "special": "hedgehog_companion",
    "special2": "distracted_cadence",  # sentences branch mid-stream
    "light_source": "dappled_olive_grove"
}
```

---

#### 11. The Bearsark — Mediterranean Border Guardian
**Actor:** Mikael Persbrandt | **Zone:** Mediterranean Border

| Parameter | Value |
|---|---|
| Pitch Baseline | ~100Hz (G2, same in man and bear form) |
| Text Reveal Speed | ~40ms per character |
| Pause Between Sentences | ~800ms |
| Expressiveness | 0.15 |
| Instrument | None (the body IS the instrument) |
| Cadence Pattern | Threshold (sentences that trail toward the bear) |

**AI Animation Prompt:**
> "Minimal motion — The Bearsark speaks in short bursts then goes still, the stillness has weight and the pull of the other form, Persbrandt's physical intensity contained, the bear always visible in the man's shoulders and hands, the transformation not shown but *felt* — the viewer can see the bear underneath the man, the border visible as a change in ground texture from cultivated to wild, no instrument because the body IS the sound — footsteps, breathing, the low rumble, the ground vibration of a heavy being at rest, the lowest expressiveness in the Inn — the form IS the feeling (man = calm, bear = worried)"

**Godot Parameters:**
```gdscript
beorn_profile = {
    "pitch_hz": 100.0,
    "reveal_speed_ms": 40,
    "pause_ms": 800,
    "expressiveness": 0.15,
    "instrument": "none",
    "cadence": "threshold",
    "facial_intensity": 0.15,
    "gesture_frequency": 0.1,  # almost no gestures
    "gesture_type": "minimal_utilitarian",
    "idle_animation": "border_watch",
    "special": "form_shift_indicator",  # man = calm, bear = worried
    "special2": "timbre_shift_not_pitch",  # bear form changes timbre not Hz
    "light_source": "forest_edge"
}
```

---

#### 12. Medusa — Mediterranean Stone Edge
**Actor:** Angelica Huston | **Zone:** Grotto, Mediterranean Stone Edge

| Parameter | Value |
|---|---|
| Pitch Baseline | ~105Hz (G2) |
| Text Reveal Speed | ~55ms per character |
| Pause Between Sentences | ~600ms |
| Expressiveness | 0.25 (voice) — snakes are the emotional register |
| Instrument | Lithophone (stone xylophone) |
| Cadence Pattern | Preservation (dry-stone wall construction) |

**AI Animation Prompt:**
> "Geological beauty — Angelica Huston's angular cheekbones catching low light as if carved from marble, movements placed like stones in a wall (deliberate, load-bearing, permanent), stillness between movements that has weight, snakes as hair moving as the emotional register while the face remains composed, the snakes' agitation level indicates her emotional state, gallery of frozen things around her (stone flowers mid-bloom, stone birds mid-flight), the gaze visible as a faint light from the eyes that petrifies what it touches, lithophone stone xylophone audible as deep mineral tones, the isolation visible in the distance she keeps from all living things, olive grove visible far behind her — she watches from the stone edge"

**Godot Parameters:**
```gdscript
medusa_profile = {
    "pitch_hz": 105.0,
    "reveal_speed_ms": 55,
    "pause_ms": 600,
    "expressiveness": 0.25,
    "instrument": "lithophone",
    "cadence": "preservation",
    "facial_intensity": 0.25,
    "facial_emotion_source": "snakes",  # snakes drive the visible emotion
    "gesture_frequency": 0.15,
    "gesture_type": "stone_placement",  # deliberate, permanent
    "idle_animation": "playing_lithophone",
    "special": "gaze_petrification",  # visual effect on objects in line of sight
    "special2": "snake_emotional_register",  # snake movement = emotional state
    "special3": "waiting_for_complete_song",  # narrative state
    "light_source": "grotto_low_amber"
}
```

---

### Characters with Partial Voice Data (To Be Formalized)

These characters have voice descriptions but not the full structured profile. Parameters shown are extracted from narrative descriptions.

#### 13. The Host — Patrick Stewart
| Parameter | Estimated Value |
|---|---|
| Pitch Baseline | ~110Hz (warm, low, fills room without raising volume) |
| Text Reveal Speed | ~55ms (measured, not slow) |
| Pause Between Sentences | ~600ms (present but not heavy) |
| Expressiveness | ~0.4 (calm authority, warmth without softness) |
| Instrument | TBD (likely string or ambient — the hearth fire?) |
| Cadence Pattern | Anchor (still, steady, the constant) |

**AI Animation Prompt:**
> "Patrick Stewart's Picard/Xavier quality — intellectual gravitas, diplomatic patience, warmth without softness, power expressed as welcome, still hands, deliberate gestures only when needed, bald head worn like a crown, dark eyes that make you feel seen not examined, hearth-fire light, seated by the fire in a chair that is not a throne, the calm that makes a vast space feel like home"

---

#### 14. Anubis — Michael Clarke Duncan
| Parameter | Estimated Value |
|---|---|
| Pitch Baseline | ~110Hz (deep bass felt in chest before heard) |
| Text Reveal Speed | ~50ms (patient, never quickens across 5,000 years) |
| Pause Between Sentences | ~800ms (the weight of the scales) |
| Expressiveness | ~0.3 (gentle giant choosing gentleness) |
| Instrument | TBD (sistrum? deep percussion?) |
| Cadence Pattern | Verdict (two-word verdicts: "...Go lightly") |

**AI Animation Prompt:**
> "Michael Clarke Duncan's John Coffey quality — enormous physical presence choosing gentleness, deep bass voice felt in the chest, warm eyes in a massive face, the devastating rare smile that transforms the whole face, patience of 5,000 years in every movement, scale-weighing gestures, jackal-head silhouette as shadow or mask rather than literal, the Green Mile sadness — understanding weariness without letting it make him cruel"

---

#### 15. The Crone — Anthony Hopkins
| Parameter | Estimated Value |
|---|---|
| Pitch Baseline | ~120Hz ( Hopkins' measured, intellectual register) |
| Text Reveal Speed | ~50ms (precise, each word measured) |
| Pause Between Sentences | ~500ms (annotating, not performing) |
| Expressiveness | ~0.3 (measures, annotates, speaks — not emotional) |
| Instrument | Quill on parchment (the scratch of writing IS the instrument) |
| Cadence Pattern | Annotation (precise, cataloging, the voice of the recorder) |

**AI Animation Prompt:**
> "Anthony Hopkins' intellectual precision — the voice that measures and annotates, eyes that assess and catalog, pen-in-hand posture, the scholar who is also the grandmother, the Stillness of the Lambs stillness applied to observation rather than menace, the Remains of the Day devotion to duty, writing that IS the magic, the pause before the rare moment of feeling ('I never listened before. I always measured. It's beautiful.')"

---

#### 16. Charon — Anthony Hopkins (same actor, different instrument)
| Parameter | Estimated Value |
|---|---|
| Pitch Baseline | ~100Hz (deeper than the Crone — the weight of the river) |
| Text Reveal Speed | ~40ms (minimal words, maximum weight) |
| Pause Between Sentences | ~2000ms (one phrase per crossing — the silence IS the speech) |
| Expressiveness | ~0.1 (the lowest — below The Bearsark — the stillness IS the expression) |
| Instrument | The pole in the water (the splash, the drip, the river's voice) |
| Cadence Pattern | Crossing (one sentence per crossing, then silence) |

**AI Animation Prompt:**
> "Anthony Hopkins as silence — the same actor as the Crone but a different instrument, the Remains of the Day Stevens devotion to duty as a calling, the Silence of the Lambs eyes that see you, the ferryman's pole as the only sound, the river as the only light, three words per crossing ('...There you are'), the stillness that is below even The Bearsark's stillness, the cloak, the boat, the dog named Spot as the only living companion, the weight of every soul ferried visible in the eyes"

---

#### 17. The Catalyst — Helena Bonham Carter
| Parameter | Estimated Value |
|---|---|
| Pitch Baseline | ~180Hz (variable — the Catalyst's pitch is as chaotic as her energy) |
| Text Reveal Speed | ~25ms (fastest in the Inn — faster than Erik) |
| Pause Between Sentences | ~150ms (minimal — the chaos doesn't pause) |
| Expressiveness | ~0.8 (highest — tied with the Siren's outer voice) |
| Instrument | Percussion — pots, pans, the kitchen as orchestra (Mrs. Lovett's kitchen) |
| Cadence Pattern | Performance (sentences as theatrical acts, each one a scene) |

**AI Animation Prompt:**
> "Helena Bonham Carter's Mrs. Lovett energy — performative chaos, rapid-fire speech, hands always doing three things at once (mixing, cutting, pouring, growing), the beautiful craziness as armor for the grounded self beneath, hair wild, apron filthy, behind-the-bar energy, the bartender who is also the garden and also the spy, plants growing unusually fast around her, portal arrows visible growing in real-time, the rare moment of stillness (the three-layer reveal) when the grounded self surfaces through the performance"

---

#### 18. The Cartographer — Matthew Gray Gubler
| Parameter | Estimated Value |
|---|---|
| Pitch Baseline | ~160Hz (the mind too fast, too full — the pitch of intelligence) |
| Text Reveal Speed | ~40ms (fast — the mind outruns the mouth) |
| Pause Between Sentences | ~300ms (the pause of someone catching up to their own thought) |
| Expressiveness | ~0.4 (lonely in the knowing, but not performing it) |
| Instrument | Spinning compass / cartography tools (the instrument of measurement) |
| Cadence Pattern | Tangent (sentences that branch into related thoughts, the mind associating faster than it can stay on track) |

---

#### 19. The Examiner — Emily Deschanel
| Parameter | Estimated Value |
|---|---|
| Pitch Baseline | ~155Hz (precise, clinical, the pitch of data) |
| Text Reveal Speed | ~45ms (measured — data delivered at a measurable pace) |
| Pause Between Sentences | ~500ms (the pause of cataloging, not feeling) |
| Expressiveness | ~0.2 (caring through craft, not social performance) |
| Instrument | Calipers / measurement tools |
| Cadence Pattern | Report (sentences as findings, each one a data point) |

---

## Part 3: AI Animation Prompt Template

For generating any character animation, use this template, filling in values from the character's voice profile:

```
[REFERENCE ACTOR QUALITY]: {actor_description}
[FREQUENCY PRESENCE]: Deep resonant vibration at {pitch_hz}Hz visible in surrounding objects and environment, sub-bass felt in chest
[MOVEMENT CADENCE]: {cadence_pattern_description} — movements at {reveal_speed_ms}ms tempo with {pause_ms}ms stillness between gesture sequences
[EXPRESSIVENESS]: Facial animation intensity {expressiveness}/1.0 — {expressiveness_description}
[INSTRUMENT VISUAL]: {instrument} audible and visually present — {instrument_visual_description}
[ZONE AMBIENT]: {zone_ambient_description}
[SPECIAL MECHANICS]: {special_animations}
[IDLE STATE]: {idle_animation_description}
[LIGHTING]: {light_source_description}
```

### Example: Erik
```
[REFERENCE ACTOR QUALITY]: Peter Gantzler as Earl Ragnar — booming-warm, large, generous, the adoptive father
[FREQUENCY PRESENCE]: Deep resonant vibration at 100Hz visible in surrounding objects — mead ripples in cups, table vibrates faintly
[MOVEMENT CADENCE]: Feast cadence — movements at 30ms tempo (fast, tumbling, words pile like plates) with 200ms stillness between sequences (minimal — Erik fills gaps)
[EXPRESSIVENESS]: Facial animation intensity 0.7/1.0 — full-volume warmth, full-volume laughter, rare fire-memory pauses
[INSTRUMENT VISUAL]: Taglharpa (bowed lyre) drone audible underneath voice, the longhouse sound
[ZONE AMBIENT]: Norse platform — warm firelight on carved wood, mead steam, runes glowing on table surface
[SPECIAL MECHANICS]: Fire-memory pause — brief stillness when fire is mentioned, then immediate return to warmth
[IDLE STATE]: Leaning forward, warm, offering mead
[LIGHTING]: Feast-table firelight, warm amber
```

---

## Part 4: Godot Resource File

This is the actual GDScript resource that can be loaded into the game engine.

```gdscript
# geode_inn_voice_profiles.gd
# Voice profile resource for all Geode Inn characters
# Load this resource and apply to any DialogueSystem or CharacterController

extends Resource
class_name GeodeInnVoiceProfile

# === SYSTEM-LEVEL CONSTANTS ===
const SONG_FREQUENCY_HZ: float = 42.0
const CANOPY_SWAY_BPM: float = 50.0
const CANOPY_SWAY_PERIOD: float = 60.0 / CANOPY_SWAY_BPM  # 1.2 seconds

# === VOICE PROFILE STRUCTURE ===
# Each profile is a Dictionary with these keys:
# - pitch_hz: float (base voice frequency)
# - pitch_end_hz: float (for descending voices, same as pitch_hz if constant)
# - reveal_speed_ms: int (text reveal speed per character)
# - reveal_speed_end_ms: int (for slowing voices, same as reveal_speed_ms if constant)
# - pause_ms: int (pause between sentences)
# - expressiveness: float (0.0-1.0, drives facial animation intensity)
# - instrument: String (audio file reference)
# - cadence: String (procedural text timing pattern)
# - facial_intensity: float (0.0-1.0)
# - gesture_frequency: float (0.0-1.0, how often gestures trigger)
# - gesture_type: String (animation type)
# - idle_animation: String (AnimationPlayer reference)
# - light_source: String (lighting preset)
# - special: Dictionary (character-specific mechanics)

# === CHARACTER PROFILES ===

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
static func apply_to_character(character: Node, character_id: String) -> void:
    var profile = get_profile(character_id)
    character.facial_intensity = profile.expressiveness
    character.gesture_frequency = profile.gesture_frequency
    character.idle_animation = profile.idle_animation
    character.light_preset = profile.light_source
    # Special mechanics
    for key in profile.get("special", {}):
        character.set_meta(key, profile.special[key])
```

---

## Part 5: Quick Reference — Expressiveness Scale

The expressiveness score (0.0-1.0) directly controls facial animation intensity in both AI prompts and Godot:

| Score | Level | Characters | Animation Direction |
|---|---|---|---|
| 0.1 | Near-stillness | Charon | "Almost no facial movement. The stillness IS the performance. One micro-expression per scene." |
| 0.15 | Minimal | The Bearsark | "Bare minimum facial movement. The body/form IS the expression. The bear communicates." |
| 0.2 | Very low | One Who Is Awake, Zorya | "Sustained stillness. Expression is in continuity, not variation. The face as constant." |
| 0.25 | Low | Medusa | "Composed face. Snakes carry the emotion. Voice is stone — unchanging." |
| 0.3 | Controlled | The Wayfarer, Anubis, Crone | "Level register. No volume escalation. Rare micro-expressions are devastating." |
| 0.35 | Measured | Shifting Man, Peruvian Guide | "Restrained. Emotion in word choice, not delivery. Consistency over expression." |
| 0.4 | Moderate | Host, Cartographer, Kali | "Warm authority. Intelligence visible. Controlled but present." |
| 0.5 | Balanced | Pirate | "Exactly what they mean, no more no less. Precision and economy." |
| 0.6 | Expressive | The Greenward | "Genuine, unfiltered emotion about small things. Worried about plants, delighted by hedgehogs." |
| 0.7 | Highly expressive | Erik, Siren (outer) | "Full-volume warmth. Full-volume performance. No holding back. The energy IS the character." |
| 0.8 | Maximum | Catalyst | "Chaotic, rapid, three-things-at-once energy. The chaos is the armor and the art." |

---

## Part 6: Frequency Spectrum Map

All character pitches mapped to their position in the spectrum:

```
100Hz ████ Erik (feast warmth), The Bearsark (bear/man), Charon (river weight)
105Hz ████ Medusa (stone)
110Hz ████ One Who Is Awake (naming), Host (calm), Shifting Man (fluid), Anubis (depth)
120Hz ████ The Wayfarer (level), Crone (measurement)
130Hz ████ Pirate (drum warmth), Kali (descending to here)
150Hz ████ The Greenward (garden)
155Hz ████ Examiner (data)
160Hz ████ Cartographer (intelligence)
165Hz ████ Peruvian Guide (altitude)
175Hz ████ Zorya (aurora), Kali (starts here)
180Hz ████ Catalyst (chaos)
196Hz ████ Siren inner (piano)
220Hz ████ Siren outer (cello)

42Hz  ░░░░ THE SONG (global ambient)
50Hz  ░░░░ CANOPY SWAY (global ambient)
```

**Pattern:** The deeper characters (100-120Hz) are the Inn's anchors — the keepers, the guardians, the constants. The higher characters (150-220Hz) are the Inn's perceivers — the readers, the growers, the performers. The 42Hz Song sits below all of them — the foundation that every voice is built on.

---

*This document is a living reference. As characters are formalized or new characters are added, update their entry here. The Godot resource file should be kept in sync with this document.*
