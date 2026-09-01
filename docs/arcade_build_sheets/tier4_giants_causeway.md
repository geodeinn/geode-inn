# Build Sheet — Giant's Causeway

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Q*bert |
| Geode Inn Name (OUT) | Giant's Causeway |
| Genre/Mechanic | Isometric hop-and-change — jump between hexagonal columns, change their color, avoid enemies |
| Zone | Giant's Causeway (Northern Ireland) |
| Stone Reward | Basalt Column |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | Gottlieb (1982) |
| Legal Basis | Mechanic only — isometric hop-and-change is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Q*bert -> Finn (a giant's apprentice — small, nimble, hops between the basalt columns)
- Coily the snake -> The Boundary Warden (a serpent that slides down columns chasing Finn)
- Red balls -> Falling stones (drop from above, must be dodged)
- Green balls -> Sliding boulders (move diagonally across the formation)
- Slick and Sam (characters that undo color changes) -> The Undoers (shadow sprites that revert columns to their original color)

New Narrative Frame:
- The Giant's Causeway is a real geological formation in Northern Ireland — 40,000 interlocking basalt columns created by volcanic cooling. Legend says the giant Finn McCool built it as a bridge to Scotland.
- Finn's task: hop across every column and activate it (change its color from dormant grey to glowing amber). When all columns are activated, the Causeway resonates — the basalt hums at 42Hz, and the bridge to the other side opens.
- The Boundary Warden tries to stop Finn — if it catches Finn, the apprentice falls off the columns. Finn can ride a floating disk (a small basalt raft) to escape to the top.
- The Undoers revert activated columns back to dormant. Finn must re-activate them.
- The Basalt Column reward: a piece of the Causeway itself. Basalt columns are hexagonal — the most efficient natural packing geometry. The stone represents the Inn's architectural foundation: nature's own building blocks.

Dialogue Requirements:
- NPC dialogue count: ~6 lines (Finn's Grandmother — an ancient giantess who speaks from the cliff above)
- Voice profiles needed: Finn's Grandmother -> Northern Irish English, booming but warm, giant cadence, low register
- Whisper Layer presence: Yes — in the basalt. When all columns are activated, the Causeway hums. The hum is the archive speaking through stone — the oldest sound in the British Isles. The columns remember Finn McCool.

Frequency State:
- Living (42Hz): Daylit Causeway. Grey basalt turns warm amber when activated. Ocean sparkles. The Grandmother is proud.
- Shadow (84Hz): Stormy Causeway. Columns turn to black glass when activated. Waves crash harder. The Boundary Warden is faster. The Grandmother's tone warns of the sea.
- In-Between: Wave crash between levels — spray covers the formation briefly.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Finn: idle (1), hop (2), falling (1) x 2 freq = 8 sprites
- The Boundary Warden: slide (2), coil (1) x 2 freq = 6 sprites
- The Undoers: revert (1) x 2 freq = 2 sprites
- Finn's Grandmother: portrait (1), speaking (1) x 2 freq = 4 sprites
- Count: 20 sprites

Backgrounds/Environments:
- Causeway (day): Carr coastal — basalt columns, green cliffs, Atlantic ocean
- Causeway (storm): Carr dark — grey columns, crashing waves, storm clouds
- Activated Causeway (all glowing): Klimt amber — the columns glow gold, the bridge reveals
- Count: 3 backgrounds

UI Elements:
- Title screen: Hexagonal column arrangement with Antikythera logo carved into the central column
- HUD: Columns activated count, level number, lives (Finn silhouettes)
- Pause menu: Stone tablet with Ogham
- Victory: All columns glow — the Causeway resonates, Basalt Column appears in the center
- Game over: Finn falls into the sea, columns go dark
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Column (dormant grey): 1
- Column (activated amber): 1
- Column (activated black glass — shadow): 1
- Column top (landing surface): 1
- Floating disk (escape raft): 1
- Falling stone (hazard): 1
- Sliding boulder (hazard): 1
- Basalt Column (final stone): 1
- Count: 8 sprites

Animation Frames:
- Finn hop: 3
- Boundary Warden slide: 2
- Column activate glow: 2
- Column revert: 2
- Stone fall: 2
- Wave crash: 3
- Causeway resonate: 4
- Count: 18 frames

Artist Style Assignment:
- Primary: Emily Carr (coastal rock formations, monumental natural geometry)
- Secondary: Book of Kells (Celtic patterns in the activated column glow)

Total Image Assets: 54

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Bodhran + whistle + ocean sounds, 50 BPM, Irish folk minimal
- Shadow theme: Minor key whistle + heavier bodhran + 84Hz pulse + storm sounds
- Victory: Causeway resonates — deep bass hum (42Hz) + whistle triumph
- Count: 3 tracks

Sound Effects:
- Hop: boot on stone
- Column activate: bass hum (short)
- Column revert: stone scraping (reverse)
- Boundary Warden approach: sliding hiss
- Stone fall: crash
- Disk ride: whoosh
- Finn falls: splash
- Level complete: causeway chord
- Count: 8 SFX

Voice Lines:
- Finn's Grandmother: ~6 lines
- Count: 6 voice lines

Stone Tone Trigger:
- Reward stone: Basalt Column -> Mohs ~6 -> ~380 Hz at 12dB below narration
- Special: The Basalt Column also triggers a 42Hz undertone — the Causeway's own resonant frequency

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Coastal Stone (open air, ocean reflections, moderate reverb, salt-wind)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 17

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Hop: D-pad / left stick (diagonal directions — up-left, up-right, down-left, down-right)
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: swipe diagonal to hop (mobile — natural for isometric)

Steam Integration:
- Achievements: "Bridge Builder" (beat game), "Flawless Causeway" (beat a level without falling), "Shadow Giant" (beat Shadow mode), "Speed Runner" (activate all columns in under 60 seconds), "Basalt Keeper" (earn Basalt Column)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Fastest Completion"
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Basalt Column, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 54 images
Phase 3: Audio Production — 3 tracks, 8 SFX, 6 voice lines
Phase 4: Programming — spec only, full game script needed (isometric grid + enemy AI)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes
