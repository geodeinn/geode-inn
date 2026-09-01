# Build Sheet — Bonsai Garden

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Mini Metro |
| Geode Inn Name (OUT) | Bonsai Garden |
| Genre/Mechanic | Resource routing — guide water and light through a growing bonsai tree to keep all branches alive |
| Zone | Japan (Zen garden) |
| Stone Reward | Jade |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | Dinosaur Polo Club (2014) |
| Legal Basis | Mechanic only — resource routing puzzle is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Mini Metro's subway lines -> Bonsai branches (the player grows and routes along a living tree)
- Mini Metro's stations -> Branch nodes (points where water and light must arrive)
- Mini Metro's passengers -> Water droplets and light photons (resources that travel along branches)
- Mini Metro's trains -> Sap flow (auto-moves along routed branches to deliver resources)

New Narrative Frame:
- The player tends a bonsai tree — not by pruning (that's done), but by routing the tree's internal sap flow. Water enters from the roots. Light enters from the canopy. The player draws branch routes connecting water sources to branches that need hydration, and light sources to branches that need energy.
- As the tree grows (timed progression), new branches sprout and need resources. Old branches become more demanding. If a branch goes without its needed resource for too long, it withers. Too many withered branches and the tree dies.
- The game cycles through four seasons: spring (rapid growth, many new branches), summer (stable, but high demand), autumn (branches start dropping demand, colorful transition), winter (dormancy — fewer resources, maintenance mode).
- Each level is a different bonsai species: juniper (twisted, complex routing), pine (structured, layered), maple (spreading, balanced), cherry (delicate, high maintenance).
- The Jade reward: the stone that the bonsai pot sits on. In Japanese culture, jade represents patience and cultivation. The player earns it by keeping the tree alive through a full year cycle.

Dialogue Requirements:
- NPC dialogue count: ~6 lines (The Gardener — a zen master who offers koans between seasons)
- Voice profiles needed: The Gardener -> Japanese-accented English, sparse, wise, slow cadence, low register
- Whisper Layer presence: Yes — subtle. The tree whispers when all branches are thriving. The sound is the tree breathing. The archive lives in the tree — it IS a living archive. The Whisper Layer here is the most peaceful manifestation.

Frequency State:
- Living (42Hz): Daylight zen garden. Warm sun, green leaves, flowing water sounds. The Gardener is present and calm.
- Shadow (84Hz): Night garden. Moonlight, darker palette. Sap flows slower. Branches are more fragile. The Gardener's koans become warnings about impermanence.
- In-Between: Dawn/dusk between seasons — the garden transitions, leaves turn colors.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- The Gardener: portrait (1), meditating (1) x 2 freq = 4 sprites
- Bonsai species (4 full trees): juniper, pine, maple, cherry x 2 freq = 8 sprites
- Count: 12 sprites

Backgrounds/Environments:
- Zen garden (day): Hokusai serene — raked sand, stone lantern, cherry tree backdrop
- Zen garden (night): Hokusai moonlit — minimal, silver and dark blue
- 4 seasonal overlays (spring/summer/autumn/winter): 4
- Count: 6 backgrounds

UI Elements:
- Title screen: Bonsai silhouette with Antikythera logo as the pot's carved seal
- HUD: Season indicator, tree health, branch status indicators, resource flow meter
- Pause menu: Rice paper scroll
- Victory: Full year cycle complete — tree in full bloom, Jade stone beneath the pot
- Game over: Tree withers — branches curl, leaves fall, pot goes dark
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Branch segment (water route): 2 (straight, curved)
- Branch segment (light route): 2 (straight, curved)
- Water source (root): 1
- Light source (canopy gap): 1
- Branch node (demand point): 3 (water, light, both)
- Sap flow particle: 2 (water blue, light gold)
- Withered branch: 1
- Season marker: 4
- Jade (final): 1
- Count: 17 sprites

Animation Frames:
- Tree growth: 4 (per season)
- Water flow: 2
- Light flow: 2
- Branch wither: 3
- Season transition: 3
- Cherry blossom fall: 3
- Count: 17 frames

Artist Style Assignment:
- Primary: Hokusai (Japanese precision, natural geometry, every line deliberate)
- Secondary: Emily Carr (for the tree's spiritual weight — living presence)

Total Image Assets: 57

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Spring theme: Koto + water sounds + bird, 50 BPM, growth energy
- Summer theme: Koto + shakuhachi + cicada drone, 50 BPM, fullness
- Autumn theme: Shakuhachi solo + wind, 50 BPM, release
- Winter theme: Near silence — bamboo flute breath + occasional wind, 50 BPM, dormancy
- Shadow theme: All tracks in minor, 84Hz pulse, water sounds slower
- Victory: Tree blooms — all instruments converge gently, one chord
- Count: 6 tracks

Sound Effects:
- Branch draw: wooden stretch
- Water flow: gentle bubbling
- Light flow: soft chime
- Branch thriving: soft hum
- Branch withering: dry crack
- Season change: wind chime
- Count: 6 SFX

Voice Lines:
- The Gardener: ~6 lines
- Count: 6 voice lines

Stone Tone Trigger:
- Reward stone: Jade -> Mohs ~6.5-7 -> ~415 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Zen Garden (intimate, balanced reverb, warm wood, water-filtered)
- Frequency layer: 42Hz base with 84Hz Shadow shift
- Special: This is the quietest puzzle game in the catalog. The audio should feel like sitting in a garden.

Total Audio Assets: 18

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Draw route: Left stick (move cursor), hold A to draw along branch
- Erase route: hold B
- Pan view: shoulder buttons
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: drag to draw routes (mobile — perfect fit)

Steam Integration:
- Achievements: "Full Bloom" (complete year cycle), "Perfect Balance" (keep all branches alive for a full season), "Shadow Gardener" (beat Shadow mode), "Minimalist" (complete a season using only 5 branch routes), "Jade Keeper" (earn Jade)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Longest Living Tree" (total seasons survived)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Jade, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 57 images (smallest asset count — simple, elegant game)
Phase 3: Audio Production — 6 tracks, 6 SFX, 6 voice lines
Phase 4: Programming — spec only, full game script needed (moderate — routing logic + seasonal progression)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes
