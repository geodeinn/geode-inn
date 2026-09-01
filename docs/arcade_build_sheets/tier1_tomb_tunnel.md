# Build Sheet — Tomb Tunnel

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Dig Dug |
| Geode Inn Name (OUT) | Tomb Tunnel |
| Genre/Mechanic | Subterranean dig-and-inflate — dig through earth, inflate enemies until they burst |
| Zone | Egypt (Catacombs/Undercity entrance) |
| Stone Reward | Lapis Lazuli |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | Namco (1982) |
| Legal Basis | Mechanic only — tunnel-dig + enemy-inflation is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Dig Dug's Taizo Hori -> An unnamed Egyptian tomb excavator (player avatar)
- Pookas (red round enemies) -> Scarab Swarmers (chitinous beetles that burrow through sand)
- Fygars (green dragons that breathe fire) -> Cobra Wardens (serpentine guardians that spit venom)

New Narrative Frame:
- The player excavates a forgotten tomb complex beneath the Valley of the Kings. Each level descends deeper. The tomb was sealed because it guards a chamber of Lapis Lazuli — the stone of the night sky, sacred to Isis.
- Enemies are tomb guardians that have awoken. Scarab Swarmers chase through the sand. Cobra Wardens patrol established tunnels and spit venom down corridors.
- The inflation mechanic becomes "sand burial" — the player pumps sand into enemies until they're entombed. Alternatively, dropping carved stone blocks crushes enemies in tunnels below.
- The Lapis Lazuli reward unlocks when the player reaches the deepest chamber and finds the "night sky ceiling" — a tomb painted ceiling of lapis-ground pigment, stars made of gold leaf.

Dialogue Requirements:
- NPC dialogue count: ~12 lines (Isis priestess hologram — appears at level milestones)
- Voice profiles needed: Isis Priestess -> Egyptian-accented English, hushed reverent cadence, mid register
- Whisper Layer presence: Yes — faint. At the deepest level, the Whisper Layer manifests as whispering hieroglyphs that glow briefly on the walls. Not hostile — curious. The archive is aware of the player.

Frequency State:
- Living (42Hz): Standard gameplay. Sand is warm gold. Tomb walls have painted decoration. Isis priestess is encouraging.
- Shadow (84Hz): Sand turns to black silt. Walls become bare stone. Cobra Wardens move faster. Isis priestess's tone becomes warning. The inflation mechanic takes longer — enemies resist burial.
- In-Between: Lantern flicker. Painted decorations fade and return.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Player (Excavator): idle (1), digging (2), pumping sand (2) x 2 freq states = 10 sprites
- Isis Priestess: portrait (1), manifesting (1) x 2 freq states = 4 sprites
- Scarab Swarmer: idle (1), burrowing (1), inflated (1) x 2 freq = 6 sprites
- Cobra Warden: idle (1), spitting venom (1), inflated (1) x 2 freq = 6 sprites
- Count: 26 sprites

Backgrounds/Environments:
- Level 1 (shallow sand, sunlit shafts above): Bierstadt-meets-Dont-Starve
- Level 5 (painted tomb corridors): Klimt decorative patterns on walls
- Level 10 (deepest chamber, lapis ceiling): Klimt Death-and-Life palette, deep blue gold
- Shadow version of each (3 darker variants)
- Count: 6 backgrounds

UI Elements:
- Title screen: Sarcophagus lid with Antikythera logo carved into it
- HUD: Score as "Tombs Cleared," level as "Depth in Cubits"
- Pause menu: Papyrus scroll aesthetic
- Victory: Lapis chamber revealed — ceiling of stars
- Game over: Collapsed tunnel, darkness
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Sand block (diggable), Stone block (non-diggable), Carved block (drop weapon), Sand-pump harpoon, Venom projectile, Sand particle burst, Falling rock particle
- Count: 7 sprites

Animation Frames:
- Excavator: 3 dig, 3 pump = 6
- Scarab: 2 burrow, 3 inflate = 5
- Cobra: 2 spit, 3 inflate = 5
- Isis: 2 manifest = 2
- Count: 18 frames

Artist Style Assignment:
- Primary: Klimt (decorative tomb walls, gold-on-dark weight)
- Secondary: Dont Starve (excavation atmosphere, Burtonesque character proportions)

Total Image Assets: 62

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Sistrum percussion + low drone, 50 BPM, Nile-scale grandeur
- Deep descent theme: Oud + frame drum, slower, heavier as depth increases
- Shadow theme: Detuned sistrum, minor key, 84Hz pulse
- Victory: Lapis chamber — harp glissando + sistrum cascade
- Count: 4 tracks

Sound Effects:
- Sand dig (soft crunch), sand pump (rhythmic hiss), enemy burst (muffled pop), block drop (stone thud), venom spit (wet hiss), level descend (echo boom), Isis manifest (chime + reverb), game over (cave-in rumble)
- Count: 8 SFX

Voice Lines:
- Isis Priestess: ~12 lines
- Count: 12 voice lines

Stone Tone Trigger:
- Reward stone: Lapis Lazuli -> Mohs ~5.5 -> ~330 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Catacombs (deep reverb, stone reflections, long decay)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 24

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move: D-pad/stick (4 directions) | Dig: automatic on movement into sand
- Pump sand: hold A/face button | Drop block: B/face button | Pause: Start
- Bluetooth: auto-detect, prompt if no controller

Steam Integration:
- Achievements: "Tomb Raider" (beat game), "Sand Mason" (100 burials), "Night Sky" (Shadow mode lapis), "Quiet Excavator" (level 5 no alerts)
- Cloud saves: Sync PlayerProgress | Leaderboard: "Deepest Descent" | Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Lapis Lazuli, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 62 images
Phase 3: Audio Production — 4 tracks, 8 SFX, 12 voice lines
Phase 4: Programming — TombTunnel.gd written, needs controller + Steam + FrequencyShift wiring
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes
