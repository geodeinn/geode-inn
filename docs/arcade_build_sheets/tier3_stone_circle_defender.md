# Build Sheet — Stone Circle Defender

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Galaga |
| Geode Inn Name (OUT) | Stone Circle Defender |
| Genre/Mechanic | Fixed shooter with formation diving — enemies descend in formations, some dive-bomb the player, capture/retake mechanic |
| Zone | Stonehenge (British Isles) |
| Stone Reward | Preseli Blue Stone |
| Rarity Tier | Rare |
| Price | $4.99 |
| Original Developer | Namco (1981) |
| Legal Basis | Mechanic only — formation shooter is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Galaga's player ship -> The Druid Warden (a robed figure standing at the center of Stonehenge, wielding a staff that fires moonlight bolts)
- Galaga's bee enemies -> Shadow Wraiths (spectral invaders trying to corrupt the stone circle)
- Galaga's butterfly enemies -> Gloom Moths (larger, tougher enemies that dive-bomb in patterns)
- Galaga's boss galaga -> The Void Herald (a large enemy that attempts to capture the Warden)
- Galaga's capture mechanic -> The Warden can be seized by the Void Herald and held in a shadow crystal. A second Warden (reinforcement) must free the captured one — freeing doubles the Warden's firepower (dual staffs)

New Narrative Frame:
- The player defends Stonehenge at the center of the stone circle. Shadow Wraiths and Gloom Moths descend in formation from above, attempting to breach the circle's protective frequency. The Druid Warden fires moonlight bolts upward to disperse them.
- The Void Herald periodically swoops down and attempts to capture the Warden in a shadow crystal. If captured, the player loses control temporarily. A reinforcement Warden appears — freeing the captured Warden merges them into a dual-staff configuration with double firepower.
- The Preseli Blue Stone reward: the actual stone that Stonehenge's inner ring is made from. The bluestones were carried 140 miles from the Preseli Hills in Wales to Salisbury Plain. The Defender earns it by holding the circle through all waves — proving the stones' protective power.

Dialogue Requirements:
- NPC dialogue count: ~8 lines (The Archdruid — speaks from the circle's center between waves)
- Voice profiles needed: The Archdruid -> Welsh-accented English, deep, resonant, ancient cadence, low register
- Whisper Layer presence: Yes — the stones themselves. Stonehenge IS the Inn's Whisper Layer origin point in the British Isles. The stones hum between waves. The hum is the archive's oldest song — older than the Inn, older than the stones' placement. The earth remembers.

Frequency State:
- Living (42Hz): Moonlit Stonehenge. Stones glow warm amber. Wraiths are translucent, slow. The Archdruid is calm.
- Shadow (84Hz): Eclipse. Stones turn cold grey. Wraiths are solid black, fast. Gloom Moths dive more aggressively. The Void Herald captures more often. The Archdruid's voice is strained — "The circle holds. It must hold."
- In-Between: Moon phase shift between waves — waxing/waning transition.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Druid Warden (single): idle (1), firing (1), captured (1) x 2 freq = 6 sprites
- Druid Warden (dual/freed): idle (1), firing (2) x 2 freq = 6 sprites
- Shadow Wraith: formation (1), diving (2), destroyed (1) x 2 freq = 8 sprites
- Gloom Moth: formation (1), diving (2), destroyed (1) x 2 freq = 8 sprites
- Void Herald: swooping (2), capturing (1), retreating (1) x 2 freq = 8 sprites
- The Archdruid: portrait (1), speaking (1) x 2 freq = 4 sprites
- Count: 40 sprites

Backgrounds/Environments:
- Stonehenge (moonlit): Book of Kells meets Carr — stone circle, rolling English landscape, moon
- Stonehenge (eclipsed): Carr dark — stones in shadow, eclipse corona
- Stonehenge interior (between waves): Klimt decorative stone patterns, glyphs on the stones
- Count: 3 backgrounds

UI Elements:
- Title screen: Stone circle viewed from above with Antikythera logo as the full moon at center
- HUD: Score as "Wraiths Dispersed," wave number as "Assault," dual-staff indicator, captured status
- Pause menu: Stone tablet with Ogham script
- Victory: Circle holds at dawn, Preseli Blue Stone revealed at the circle's center
- Game over: Circle breached, stones crack, shadow pours in
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Moonlight bolt (player projectile): 1
- Shadow bolt (enemy projectile): 1
- Shadow crystal (capture device): 1
- Stone pillar (decorative + structural): 2 sizes
- Stone lintel (horizontal top): 1
- Explosion (enemy destroyed): 1
- Dual-staff beam: 1
- Preseli Blue Stone (final): 1
- Count: 9 sprites

Animation Frames:
- Warden fire: 2
- Wraith dive: 3
- Gloom Moth dive: 3
- Void Herald swoop: 2
- Capture sequence: 4
- Free sequence: 3
- Stone hum (Whisper Layer): 3
- Explosion: 3
- Count: 23 frames

Artist Style Assignment:
- Primary: Book of Kells (Celtic knotwork, stone-carved patterns, the Inn's ambient texture made game art)
- Secondary: Emily Carr (the landscape's spiritual weight, the stones as living presences)

Total Image Assets: 80

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Frame drum + drone + vocal chant (Heilung/Wardruna style), 50 BPM, ancient British ritual
- Wave tension: Adds building drone + faster drum, pressure increases
- Shadow theme: Minor key chant + 84Hz pulse + wind, eclipsed
- Capture sequence: Dissonant build — the Herald's theme
- Free sequence: Triumphant chant return + drum roll
- Victory: Circle holds — chant resolves to single sustained note, stone hum
- Count: 6 tracks

Sound Effects:
- Moonlight bolt fire: crystalline ping
- Enemy hit: spectral dispersal
- Enemy destroyed: stone chime
- Capture beam: dissonant hum
- Capture success: shadow crack
- Free bolt: resonant gong
- Dual staff activate: harmonic chord (two staffs harmonizing)
- Wave start: war drum
- Wave clear: chant resolve + single stone hum
- Count: 9 SFX

Voice Lines:
- The Archdruid: ~8 lines
- Count: 8 voice lines

Stone Tone Trigger:
- Reward stone: Preseli Blue Stone -> Mohs ~6-7 -> ~400 Hz at 12dB below narration
- Special: Preseli Blue Stone is the only stone that triggers a 42Hz undertone alongside its Mohs-mapped frequency — the stone circle's own frequency

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Stone Circle (open air, ancient stone reflections, long natural reverb, earth resonance)
- Frequency layer: 42Hz base with 84Hz Shadow shift
- Special: The stone circle's 42Hz hum is the Inn's foundational frequency — this game is where it originates

Total Audio Assets: 23

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move: Left stick / D-pad (left, right only — fixed position)
- Fire: A / face button (or hold for auto-fire)
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: drag left/right, tap to fire (mobile)

Steam Integration:
- Achievements: "The Circle Holds" (beat game), "Dual Warden" (free a captured Warden and finish the wave with dual staffs), "Shadow Defender" (beat Shadow mode), "Perfect Circle" (beat a wave without any wraith reaching the stones), "Preseli Keeper" (earn Preseli Blue Stone)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Highest Score"
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Preseli Blue Stone, increment gamesCompleted

Special Notes:
- The capture/free mechanic is the game's signature. Being captured and then freed to get dual staffs is the most satisfying moment — it turns a setback into a power-up.
- Stonehenge is the Inn's 42Hz origin point. The stone hum between waves IS the Song. This game is where the Inn's entire frequency system begins, narratively.
- The Preseli Blue Stone is the only stone that plays its Mohs-mapped frequency AND the 42Hz base — because it IS the 42Hz stone. The bluestones of Stonehenge are the Inn's tuning fork.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 80 images
Phase 3: Audio Production — 6 tracks, 9 SFX, 8 voice lines
Phase 4: Programming — spec only, full game script needed (formation AI + capture mechanic)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes
