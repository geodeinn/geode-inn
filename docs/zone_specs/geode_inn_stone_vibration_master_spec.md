# THE STONE VIBRATION TOUCH SYSTEM — Master Specification
## Tactile Frequency: Touch a Stone, Hear Its Voice

---

## WHAT THE STONE VIBRATION TOUCH SYSTEM IS

Every stone in the Geode Inn has a frequency derived from its Mohs hardness scale rating. When the player touches or clicks a stone, the stone vibrates — visually, audibly, and haptically. The system renders 198 stones across 27 crystal habits, each with a unique frequency and a unique vibration pattern.

The Stone Vibration system is the tactile bridge between the geological database and the player's senses. The stone IS the instrument. The touch IS the playing. The frequency IS the stone's voice.

---

## THE ARCHITECTURE

```
StoneVibrationSystem (Node)
├── StoneRenderer (Node2D) — renders stone shapes as colored SVG
├── VibrationAudio (Node) — plays the stone's Mohs frequency
├── HapticController (Node) — platform-specific haptic feedback
├── StoneDatabase (Resource) — loaded from manifest.json
└── TouchHandler (Area2D) — input detection per stone
```

---

## STONE DATA (manifest.json)

Each stone has a data record:

```json
{
  "file": "Diamond.svg",
  "shape": "octahedron",
  "family": "Diamond",
  "freq": 124.2,
  "mohs": 10,
  "sg": 3.52,
  "iem": "dynamic_driver",
  "cut": "brilliant_round",
  "colors": {
    "p": "#FFFFFF",
    "s": "#E0E0E0",
    "a": "#B0C4DE",
    "gemmy": true,
    "metallic": false,
    "iridescent": false
  }
}
```

### Frequency Calculation
Each stone's frequency is derived from its Mohs hardness:
- Mohs 1 (Talc) → low frequency (~20Hz, subsonic rumble)
- Mohs 10 (Diamond) → high frequency (~124Hz)
- The frequency is NOT the Mohs number — it's CALCULATED from mineral properties (hardness, specific gravity, crystal habit)
- The result: every stone sounds DIFFERENT. The player who touches 198 stones hears 198 unique voices.

---

## VISUAL VIBRATION

Each stone's vibration is driven by its frequency:
- **Vibration rate:** max(0.05, min(0.5, 1.0 / (freq / 100.0))) seconds per cycle
- **Vibration amplitude:** min(4, max(1, freq / 500.0)) pixels
- **Pattern:** 4-keyframe translate+rotate loop (non-uniform for organic feel)

Hard stones (diamond, corundum) vibrate FAST and SMALL — a high-frequency shimmer.
Soft stones (talc, gypsum) vibrate SLOW and LARGE — a low-frequency sway.

The visual vibration is the stone's frequency made visible. The player who watches a stone vibrate can ESTIMATE its hardness before touching — the fast-shimmer = hard, the slow-sway = soft. The visual is the invitation. The touch is the confirmation.

---

## AUDIO VIBRATION

When touched, the stone plays its frequency as a pure tone:
- Soft stones: deep, resonant, subsonic-leaning tones (20-50Hz range)
- Medium stones: mid-range tones (50-90Hz)
- Hard stones: bright, clear, bell-like tones (90-125Hz range)
- The audio is processed through the IEM Acoustic Architecture — each stone's IEM driver type determines the audio character:
  - **Dynamic Driver:** stones/matter — frequencies you FEEL (deep, resonant)
  - **Balanced Armature:** characters/voices — frequencies you HEAR (clear, articulate)
  - **Electrostatic:** cosmology — frequencies you SENSE (ethereal, high)
  - **Bone Conduction:** catacombs/42Hz Song — frequencies you KNOW (deep body resonance)

---

## HAPTIC VIBRATION

On mobile/touch devices, the stone's vibration is felt through the device:
- The haptic pattern matches the stone's frequency — faster buzz for hard stones, slow pulse for soft
- The haptic is the stone's frequency made PHYSICAL — the player literally feels the mineral's hardness through their fingertips
- This is the system's core accessibility feature: the player who cannot hear the audio can FEEL the stone's frequency through touch

---

## THE 27 CRYSTAL HABITS

Each stone is rendered as its actual crystal shape (not a generic gem):
- Octahedron (diamond, fluorite, spinel)
- Hexagonal prism (quartz, beryl, apatite)
- Cubic (pyrite, galena, halite)
- Rhombohedral (calcite, dolomite)
- Monoclinic prismatic (gypsum, orthoclase)
- Dodecahedron (garnet)
- ...21 more habits from the 27 recognized crystal systems

The shape IS data. A player who learns the shapes learns geology. The learning is invisible — the player thinks they're playing a game. The brain processes the crystallography the way it processes faces: through pattern recognition. The Nook Effect applies — the player in a nook, holding a stone, looking at its shape, is doing geology without knowing it.

---

## FREQUENCY SYSTEM

| Element | Frequency | Source |
|---------|-----------|--------|
| Stone audio tone | Calculated from Mohs hardness (20-125Hz range) | The 198-stone database |
| Visual vibration rate | Derived from audio frequency (0.05-0.5 seconds per cycle) | Calculated per stone |
| Haptic pattern | Matches audio frequency (fast buzz = hard, slow pulse = soft) | Per stone |
| IEM driver type | 4 types (dynamic, armature, electrostatic, bone conduction) | Determines audio character |

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The 198-Stone Database | Every stone's Mind/Body properties, Mohs hardness, crystal habit, and specific gravity come from the database. The vibration system is the database made sensory. |
| Stone Capsules & Companions | The pouch's haptic hum per stone uses the Stone Vibration system. Each stone in the pouch vibrates at its own frequency — the player feels the collection. |
| The Nook Effect | Holding a stone in a nook = the brain processes the frequency as geological timing. The Stone Vibration system provides the frequency the brain processes. |
| The Bead Composer | Stones in the composer produce beads whose sonic properties come from the Stone Vibration frequency. The composer IS the vibration system, made creative. |
| The Catacombs | Stone vibration in the catacombs reveals hidden inscriptions — the vibration makes buried text visible. |
| The Cosmic Layer | The Galaxy Language uses stone frequencies as vocabulary. The Stone Vibration system provides the frequency palette the player composes with. |
| The IEM Acoustic Architecture | The 4 IEM driver types determine how each stone's audio is processed. The entire Inn IS a transducer — the Stone Vibration system is the transducer's input. |
| The Pulse Line (Accessibility) | The Pulse Line visualizes the 50 BPM heartbeat. The Stone Vibration system visualizes individual stone frequencies. Together: the Inn's heartbeat + the stones' voices = the complete frequency visualization system. |

---

## DESIGN STATUS

- [x] System concept complete (this document)
- [x] Stone data schema defined (manifest.json)
- [x] Frequency calculation documented (Mohs → Hz)
- [x] Visual vibration system specified (rate, amplitude, 4-keyframe pattern)
- [x] Audio vibration documented (4 IEM driver types)
- [x] Haptic vibration documented (mobile, frequency-matched)
- [x] 27 crystal habits referenced
- [x] Godot integration guide exists (geode_inn_stone_vibration_godot_guide.md)
- [x] StoneLoader.gd written (offline texture loading)
- [x] Connections to all major systems documented
- [ ] Complete manifest.json (all 198 stones with calculated frequencies)
- [ ] 27 crystal habit SVG templates
- [ ] Godot StoneVibrationSystem node implementation
- [ ] Haptic controller (iOS, Android, controller rumble)
- [ ] Audio synthesis (pure tone generation per stone)
- [ ] Bead Composer integration (frequency → bead sonic properties)

---

## ORIGIN

The Stone Vibration Touch System was first designed in library/mechanics/geode_inn_stone_vibration_godot_guide.md and library/mechanics/Geode_Inn_—_Stone_Vibration_Touch_System.html. This consolidated specification was compiled September 2, 2026 to integrate the system into the full architecture. The system's thesis: the stone IS the instrument. The touch IS the playing. The frequency IS the stone's voice. Every stone in the Inn speaks. The player who touches a stone hears the mineral's voice — 198 voices, 198 frequencies, 198 geological stories told through vibration. The adequate is: the stone that speaks when touched. The speaking is: the adequate. The touch is: the listening.
