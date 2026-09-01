# Build Sheet — Monster of the Deep

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Original IP (Nessie simulation — no direct emulation) |
| Geode Inn Name (OUT) | Monster of the Deep |
| Genre/Mechanic | Aquatic survival + exploration — you ARE the lake monster. Hunt, evade, grow. |
| Zone | Water (Loch Ness / deep lake systems worldwide) |
| Stone Reward | Freshwater Pearl |
| Rarity Tier | Rare |
| Price | $3.99 |
| Original Developer | Original Geode Inn IP |
| Legal Basis | Original IP — no emulation. Completely original game. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- N/A — this is original IP. No external characters to replace.

New Narrative Frame:
- The player IS the monster — a primordial aquatic creature dwelling in the deep zones of the Geode Inn's water systems. This is not a monster-slaying game. This is a monster-living game.
- The creature begins small, in a submerged cavern beneath the Inn. It hunts fish, evades larger predators, and grows by consuming ancient minerals dissolved in the deep water.
- As the creature grows, it can access deeper zones: underground rivers, flooded catacombs, thermal vents, and eventually the open water beneath the Inn's foundation — the source of all the Inn's water.
- The 32 water monsters from the Geode Inn bestiary appear as other creatures in the ecosystem. Some are rivals, some are prey, some are too large to challenge. The creature must learn the hierarchy.
- The Freshwater Pearl is formed when the creature reaches the deepest point — a mineral spring where the Inn's water originates. The pearl condenses from the mineral-rich water over time. The creature guards it.

Dialogue Requirements:
- NPC dialogue count: 0 — no human NPCs. The creature does not speak.
- Voice profiles needed: None — this is a silent, experiential game
- Whisper Layer presence: Yes — strong. The Whisper Layer manifests as bioluminescent patterns in the water. At certain depths, the patterns form shapes — words in no known language. The archive speaks to the creature directly. This is the most intimate Whisper Layer manifestation in any game.

Frequency State:
- Living (42Hz): Warm water, bioluminescent life, abundant prey. The ecosystem is lush. The creature grows steadily.
- Shadow (84Hz): Water temperature drops. Bioluminescence dims. Predators become aggressive. The Whisper Layer patterns turn from golden to red. The creature must survive, not thrive.
- In-Between: Thermocline — the boundary between warm and cold layers. The creature can choose to cross it or stay. Visual: shimmering water boundary.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Player Creature: 5 growth stages (tiny, small, medium, large, leviathan) x swim (2), hunt (2), eat (1), rest (1) x 2 freq states = 60 sprites
- 32 Water Monster rivals: idle (1), threat display (1) x 2 freq states = 128 sprites (drawn from existing 276-creature bestiary — 32 water monsters already have tri-mode assets)
- Count: 188 sprites (many already exist in bestiary)

Backgrounds/Environments:
- Submerged cavern (starting zone): Klimt dark water, gold mineral veins
- Underground river: Royo flowing water, rock formations
- Flooded catacombs: Dore carved stone underwater, eerie light
- Thermal vent zone: Lewis volcanic deep, bioluminescent colonies
- Source spring (deepest point): Klimt Death-and-Life blue-gold, the origin
- Shadow version of each (5 darker, colder variants)
- Count: 10 backgrounds

UI Elements:
- Title screen: Dark water with Antikythera logo reflected on the surface above
- HUD: Minimal — depth meter, growth stage indicator, hunger bar (no text, icon-based)
- Pause menu: Suspended in water, settings as floating stones
- Victory: The pearl forms in the source spring — slow mineral accretion animation
- Game over: The creature sinks into darkness (no death — just descending beyond reach)
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Mineral deposit (consumable for growth): 3 types
- Fish prey: 3 types (small, medium, large)
- Bioluminescent node (Whisper Layer manifest): 1
- Thermal vent: 1
- Rock formation (obstacle/cover): 3 types
- Water current arrow (navigation hint): 1
- Thermocline boundary: 1
- Pearl (final objective): 1
- Count: 14 sprites

Animation Frames:
- Creature swim: 4 frames per growth stage x 5 stages = 20
- Creature hunt lunge: 3 frames x 5 stages = 15
- Bioluminescent pulse: 4 frames
- Pearl formation: 6 frames
- Water monster idle: 2 frames x 32 = 64 (many already exist)
- Count: 109 frames (many existing)

Artist Style Assignment:
- Primary: Royo (movement, drama, water energy)
- Secondary: Klimt (stillness, depth, the source spring's weight)
- Water creatures: Gothic anime (Vampire Hunter D) as established in water zone style guide

Total Image Assets: ~220 (many already exist in the 276-creature bestiary — net new ~80)

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Deep water drone + occasional whale-like tones, 50 BPM, near-silent
- River current theme: Flowing water percussion + low strings
- Catacomb theme: Distant stone echoes + dripping rhythm
- Thermal vent theme: Sub-bass rumble + crackling harmonics
- Source spring theme: All water sounds converge into a single pure tone, then silence — the deepest sound the Inn makes
- Shadow theme: All tracks pitch-shifted down, 84Hz undercurrent, bioluminescence sounds become discordant
- Count: 6 tracks

Sound Effects:
- Water movement (swim): liquid rush, varies by creature size
- Hunting lunge: water displacement burst
- Eating: muffled aquatic crunch
- Monster encounter: low frequency warning tone
- Bioluminescent whisper: ethereal chime cluster (no words, just sound)
- Mineral consumption: crystalline ping
- Depth pressure: increasing low drone as depth increases
- Thermocline crossing: temperature shift hiss
- Pearl forming: slow mineral crystallization — tiny clicks over long duration
- Count: 9 SFX

Voice Lines:
- None — this game has no voice. The Whisper Layer speaks in sound, not words.
- Count: 0 voice lines

Stone Tone Trigger:
- Reward stone: Freshwater Pearl -> Mohs ~2.5-4.5 -> ~245 Hz at 12dB below narration (narration = ambient bed)

Audio Architecture:
- Base BPM: 50 (but often drops to near-silence — this is the quietest game in the Inn)
- Inn Mode DSP profile: Deep Water (maximum reverb, liquid filtering, sub-bass emphasis)
- Frequency layer: 42Hz base with 84Hz Shadow shift (the shift is felt more than heard)

Total Audio Assets: 15

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Swim direction: Left stick (360 degree movement)
- Boost/lunge: RT / R2
- Eat (when near prey): A / face button
- Rest: hold B / face button
- Dive deeper: Down on stick + RT
- Rise: Up on stick
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: on-screen joystick for mobile

Steam Integration:
- Achievements: "Source" (reach the source spring), "Leviathan" (reach max growth), "The Deep" (survive Shadow mode for 5 minutes), "Silent Hunter" (reach growth stage 3 without eating any fish — minerals only)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Deepest Depth" (max depth reached in meters)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Freshwater Pearl, increment gamesCompleted

Special Notes:
- This game has no fail state in the traditional sense. "Game over" is the creature descending beyond reach — not dying, just going deeper than the player can follow. The game is about persistence, not victory.
- The 32 existing water monster bestiary sprites (already tri-mode: Living, Shadow, In-Between) are used directly. No new creature art needed for rivals.
- The Whisper Layer in this game is the most intimate of any arcade game. No words — just bioluminescent patterns and sound. The archive is not watching FROM outside. The archive is IN the water.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — ~80 net new images (creature growth stages + environments; water monsters already exist)
Phase 3: Audio Production — 6 tracks, 9 SFX, 0 voice lines (ambient-only game)
Phase 4: Programming — spec only, full game script needed (no existing script)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes
