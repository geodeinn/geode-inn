# Build Sheet — Serpent Steps

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Snake |
| Geode Inn Name (OUT) | Serpent Steps |
| Genre/Mechanic | Growing snake — collect items, grow longer, don't hit yourself or walls |
| Zone | Chichen Itza (Maya) |
| Stone Reward | Fire Opal |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | Atari/Nokia (1976/1997) |
| Legal Basis | Public domain mechanic — snake game is one of the oldest game formats. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- The snake (generic) -> Kukulkan's Serpent (the feathered serpent deity of the Maya, growing as it climbs the pyramid)
- Food dots -> Solar offerings (small sun-disks the serpent collects to grow)
- Walls/playfield boundary -> The pyramid steps of El Castillo at Chichen Itza

New Narrative Frame:
- The player controls Kukulkan's serpent climbing the steps of El Castillo at Chichen Itza during the equinox. On the equinox, the sun creates a shadow pattern on the pyramid that looks like a serpent descending — the famous Kukulkan serpent of light.
- REVERSAL: In this game, the serpent is ASCENDING, not descending. The player collects solar offerings to grow the serpent strong enough to reach the temple at the top. Each offering adds length and power.
- The playfield is the pyramid's 91 steps (4 sides x 91 = 364 + 1 platform = 365, the Maya calendar). The serpent winds through the steps. If it bites its own tail, it falls. If it hits a step wall, it falls. Grow long enough and the serpent reaches the temple summit.
- The Fire Opal reward: the stone of the equinox sun. When the serpent reaches the summit, the sun aligns and the Fire Opal is revealed in the temple floor — it holds the light of the equinox, captured in stone.

Dialogue Requirements:
- NPC dialogue count: ~6 lines (The Daykeeper — a Maya priest who reads the calendar between levels)
- Voice profiles needed: The Daykeeper -> Yucatec Maya-inflected Spanish/English, rhythmic, chanting cadence, deep register
- Whisper Layer presence: Yes — subtle. The pyramid steps whisper in Mayan glyph-language. The serpent's body passing over a step briefly illuminates the glyph carved there. The archive remembers the builders.

Frequency State:
- Living (42Hz): Equinox day. Golden sunlight, green jungle visible beyond the pyramid. The serpent's scales are emerald and gold (Kukulkan's living colors). The Daykeeper chants encouragement.
- Shadow (84Hz): Night falls. The pyramid is lit by torchlight. The serpent's scales turn to obsidian and fire (Kukulkan's shadow form). The steps narrow. The Daykeeper's chanting becomes urgent — "The sun is setting. Climb before dark."
- In-Between: Twilight — the shadow-serpent of light appears on the pyramid's edge (the real equinox phenomenon), transitioning between day and night forms.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Kukulkan Serpent (Living): head (1), body segment (1), tail (1), turning (1) = 4 sprites
- Kukulkan Serpent (Shadow): head (1), body segment (1), tail (1), turning (1) = 4 sprites
- Daykeeper: portrait (1), chanting (1) x 2 freq = 4 sprites
- Count: 12 sprites

Backgrounds/Environments:
- El Castillo pyramid (day/equinox): Hokusai-meets-Moreau — geometric pyramid, jungle, golden sky
- El Castillo pyramid (night/torchlit): Moreau dark — firelit stone, jungle silhouettes
- Temple summit (victory): O'Keeffe — close-up of stone floor with Fire Opal reveal
- Count: 3 backgrounds (simple game, minimal environments)

UI Elements:
- Title screen: Pyramid silhouette with Antikythera logo as the equinox sun behind it
- HUD: Score as "Solar Offerings," serpent length as "Steps Climbed," level as "Calendar Round"
- Pause menu: Codex page aesthetic (Maya bark paper)
- Victory: Serpent reaches summit, sun aligns, Fire Opal glows in the temple floor
- Game over: Serpent falls from the pyramid, coils loosen, returns to the jungle
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Step tile (horizontal): 1
- Step tile (corner): 1
- Step tile (vertical): 1
- Solar offering (collectible): 1
- Step wall (boundary): 1
- Glyph (Whisper Layer — illuminates when serpent passes): 3 variants
- Temple door (summit goal): 1
- Serpent shadow-of-light (equinox phenomenon): 1
- Count: 10 sprites

Animation Frames:
- Serpent head: 2 (idle, open mouth eating)
- Serpent body: 2 (straight, turning)
- Solar offering: 2 (pulse)
- Glyph illuminate: 3
- Shadow-of-light descent: 4
- Fire Opal reveal: 4
- Count: 17 frames

Artist Style Assignment:
- Primary: Gustave Moreau (symbolist, mythic serpentine detail, jewel tones)
- Secondary: Hokusai (geometric precision for the pyramid architecture)

Total Image Assets: 47

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Maya clay flute + turtle shell drum, 50 BPM, referencing ancient Mesoamerican ritual music
- Shadow theme: Detuned flute + deeper drum, 84Hz pulse, torchlit urgency
- Victory (summit reached): flute ascending scale + drum crescendo + single resonant gong
- Count: 3 tracks

Sound Effects:
- Solar offering collect: warm ping (tuned to current key)
- Serpent grow: scale slide (subtle, satisfying)
- Serpent turn: soft rasp
- Wall hit (death): stone thud + feather rustle (the serpent's feathers)
- Self-collision (death): soft coil tighten + breath
- Glyph illuminate: brief whisper + chime
- Level complete: drum pattern + flute trill
- Count: 7 SFX

Voice Lines:
- The Daykeeper: ~6 lines
- Count: 6 voice lines

Stone Tone Trigger:
- Reward stone: Fire Opal -> Mohs ~5.5-6.5 -> ~370 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Pyramid (open-air stone, moderate reverb, dry acoustic, sun-warmed)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 16

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Direction: D-pad / left stick (4 directions — up, down, left, right)
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: swipe direction (mobile — most natural input for snake)

Steam Integration:
- Achievements: "Equinox" (beat game), "Long Serpent" (reach max length), "Shadow Climb" (beat Shadow mode), "Glyph Reader" (illuminate all glyphs in one run), "Perfect Climb" (beat a level without hitting any wall)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Longest Serpent" (max length achieved)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Fire Opal, increment gamesCompleted

Special Notes:
- Simplest mechanic in the catalog, but the theming elevates it. The snake IS Kukulkan. The playfield IS Chichen Itza. The equinox phenomenon is real.
- The glyph illumination system (Whisper Layer) adds a collectible layer — players who want to read all the glyphs will replay levels, trying different paths.
- The In-Between shadow-of-light phenomenon is the actual equinox visual — the real Chichen Itza serpent shadow made playable. This is the Inn turning archaeology into gameplay.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 47 images
Phase 3: Audio Production — 3 tracks, 7 SFX, 6 voice lines
Phase 4: Programming — spec only, full game script needed (simplest programming scope)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes
