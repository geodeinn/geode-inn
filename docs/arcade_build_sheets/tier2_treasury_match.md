# Build Sheet — Treasury Match

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Bust-A-Move / Puzzle Bobble |
| Geode Inn Name (OUT) | Treasury Match |
| Genre/Mechanic | Bubble shooter — aim and fire colored stones to make matches of 3+, clear the board |
| Zone | Petra (the Rose City) |
| Stone Reward | Banded Agate |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | Taito (1994) |
| Legal Basis | Mechanic only — color-matching shooter is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Bub/Bob (dinosaur duo) -> Two Petra Stonemasons (Nabataean artisans who carved the Treasury facade)
- Colored bubbles -> Colored stone spheres (agate, sandstone, limestone, rose quartz — each a real Petra building material)

New Narrative Frame:
- The player is a Nabataean stonemason restoring the Treasury at Petra. Earthquakes and time have shaken stone spheres loose from the facade — they've clustered overhead in precarious formations. The stonemason must fire matching stones upward to clear the clusters before they descend and crush the restoration work below.
- Each color represents a real Petra building material: rose sandstone (Petra's signature), white limestone, grey conglomerate, banded agate (decorative), and red ironstone (structural).
- The board descends as time passes — the ceiling is literally coming down. Clear all clusters and the facade is restored. Let them reach the bottom and the Treasury is buried again.
- The Banded Agate reward: found when the final cluster is cleared — the last stone the mason places is a banded agate that was the Treasury's keystone ornament, lost for centuries.

Dialogue Requirements:
- NPC dialogue count: ~6 lines (The Overseer — a Nabataean foreman who comments between levels)
- Voice profiles needed: The Overseer -> Arabic-accented English, practical, gruff but proud, mid register
- Whisper Layer presence: No — this is a craft and restoration game. Light, focused, satisfying.

Frequency State:
- Living (42Hz): Rose-gold lighting. Stones are warm. The facade looks restorable. The Overseer is encouraging.
- Shadow (84Hz): Stones turn to shadow-sandstone (dark red to black). The ceiling descends faster. The Overseer's tone shifts to urgency — "The mountain is reclaiming us."
- In-Between: Sandstorm blows across screen briefly between levels.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Stonemason (player avatar at bottom): idle (1), aiming (1), firing (1) x 2 freq = 6 sprites
- The Overseer: portrait (1), speaking (1) x 2 freq = 4 sprites
- Count: 10 sprites

Backgrounds/Environments:
- Treasury facade (level 1-5): Hokusai-meets-O'Keeffe — rose stone grandeur, architectural detail
- Monastery facade (level 6-10): O'Keeffe — larger, more weathered, deeper into Petra
- Shadow variant of each (2)
- Count: 4 backgrounds

UI Elements:
- Title screen: Treasury facade silhouette with Antikythera logo carved into the portal
- HUD: Score as "Stones Restored," level as "Section," next stone color preview
- Pause menu: Stone tablet aesthetic
- Victory: Facade fully restored, banded agate keystone placed, sunlight hits the rose stone
- Game over: Treasury buried in sand, silence
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Stone sphere — rose sandstone (red): 1
- Stone sphere — limestone (white): 1
- Stone sphere — conglomerate (grey): 1
- Stone sphere — banded agate (orange/amber): 1
- Stone sphere — ironstone (dark red): 1
- Stone sphere — shadow sandstone (black): 1 (Shadow mode)
- Cluster match burst: 1
- Falling stones (after match clears): 1
- Aiming guide line: 1
- Ceiling/wall texture: 1
- Count: 10 sprites

Animation Frames:
- Stonemason: 2 aim, 2 fire = 4
- Stone sphere spin: 2
- Match burst: 4
- Stone fall: 2
- Facade restoration (per level): 3
- Count: 15 frames

Artist Style Assignment:
- Primary: O'Keeffe (desert stone, architectural grandeur, warm palette)
- Secondary: Hokusai (geometric precision in the architectural detail)

Total Image Assets: 44

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Oud + hand drum, 50 BPM, referencing Nabataean-era desert ambiance
- Deep restoration theme (levels 6-10): Adds ney flute, slower, more reverent
- Shadow theme: Detuned oud, minor key, 84Hz pulse
- Victory: Facade complete — ney flute ascending + oud chord resolve
- Count: 4 tracks

Sound Effects:
- Stone fire: soft launch sound
- Stone stick (to cluster): gentle tap
- Match made (3+): harmonic chime cluster
- Large match (5+): resonant gong
- Stones fall (after clear): cascading pebbles
- Ceiling descend: ominous stone creak
- Game over: sand rush + silence
- Level complete: stone door seal + chime
- Count: 8 SFX

Voice Lines:
- The Overseer: ~6 lines
- Count: 6 voice lines

Stone Tone Trigger:
- Reward stone: Banded Agate -> Mohs ~6.5-7 -> ~415 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Desert Temple (warm stone reverb, moderate decay, dry air)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 18

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Aim: Left stick (360 degree rotation)
- Fire: A / face button (or RT / R2)
- Swap next stone: B / face button (if swap mechanic enabled)
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: drag to aim, tap to fire (mobile — natural fit)

Steam Integration:
- Achievements: "Restoration" (beat game), "Master Mason" (clear 10 levels without the ceiling descending once), "Shadow Builder" (beat Shadow mode), "Big Match" (clear 8+ stones in one shot), "Keystone" (earn Banded Agate)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Highest Score"
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Banded Agate, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 44 images (smallest visual budget — simple mechanic)
Phase 3: Audio Production — 4 tracks, 8 SFX, 6 voice lines
Phase 4: Programming — spec only, full game script needed
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes
