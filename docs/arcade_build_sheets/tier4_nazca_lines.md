# Build Sheet — Nazca Lines

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Osu! |
| Geode Inn Name (OUT) | Nazca Lines |
| Genre/Mechanic | Rhythm clicker — trace geoglyph patterns in time with music, complete ancient drawings |
| Zone | Nazca Desert (Peru) |
| Stone Reward | Sodalite |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | Dean Herbert (2007) |
| Legal Basis | Mechanic only — rhythm clicker is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Osu!'s cursor -> A Nazca Artist's chisel (traces lines in the desert surface)
- Osu!'s hit circles -> Geoglyph nodes (points the player must click/tap in sequence to reveal the ancient drawing)
- Osu!'s sliders -> Line segments (drag along the desert to draw continuous geoglyph lines)
- Osu!'s spinners -> Spiral drawings (rotate to complete circular geoglyphs like the monkey's tail)

New Narrative Frame:
- The Nazca Lines are real geoglyphs in the Peruvian desert — enormous drawings of animals, plants, and geometric shapes, visible only from the air. They were created between 500 BCE and 500 CE. Their purpose remains debated.
- The player is a Nazca Artist restoring faded geoglyphs. Each level is a different Nazca drawing: the hummingbird, the monkey, the spider, the condor, the whale, the dog, the tree, the hands, the astronaut.
- Gameplay follows the geoglyph's shape — hit circles trace the outline, sliders draw the connecting lines, spinners complete spiral elements. The rhythm of the music matches the rhythm of the original artists' movements.
- As the player completes each geoglyph, it glows gold and becomes visible from above. Completing all geoglyphs reveals a hidden pattern connecting them — a map to something beneath the desert.
- The Sodalite reward: the stone of logic and pattern recognition. Sodalite's deep blue contains white veining that resembles the Nazca Lines' geometric patterns. The artist earns it by seeing the pattern that connects all the drawings.

Dialogue Requirements:
- NPC dialogue count: ~8 lines (The Sky Watcher — a Nazca elder who watches from a hill, speaks between geoglyphs)
- Voice profiles needed: The Sky Watcher -> Quechua-inflected Spanish/English, measured, precise, star-cadence, mid register
- Whisper Layer presence: Yes — in the lines themselves. As each geoglyph is completed, the lines whisper. The Nazca Lines are messages to the sky — the Whisper Layer here points UP, not down. The archive speaks to the heavens, not the earth. Unique direction.

Frequency State:
- Living (42Hz): Daylit Nazca desert. Red-brown earth, clear sky, geoglyphs glow gold when complete. The Sky Watcher is calm.
- Shadow (84Hz): Night desert. Stars overhead, geoglyphs glow silver. The drawings reveal their astronomical alignments — some lines point to specific stars. The Sky Watcher speaks of constellations.
- In-Between: Twilight — the desert transitions, stars begin to appear.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Nazca Artist (chisel cursor): idle (1), striking (1) x 2 freq = 4 sprites
- The Sky Watcher: portrait (1), speaking (1) x 2 freq = 4 sprites
- Count: 8 sprites

Geoglyph Art (9 drawings):
- Hummingbird: outline + completed = 2
- Monkey: outline + completed = 2
- Spider: outline + completed = 2
- Condor: outline + completed = 2
- Whale: outline + completed = 2
- Dog: outline + completed = 2
- Tree: outline + completed = 2
- Hands: outline + completed = 2
- Astronaut: outline + completed = 2
- All x 2 freq = 36
- Count: 36 geoglyph images

Backgrounds/Environments:
- Nazca desert (day): O'Keeffe red-brown desert, vast, flat horizon
- Nazca desert (night): Adams + starfield — dark desert, Milky Way overhead
- Hidden pattern reveal (final): O'Keeffe + Dali — the geoglyphs connect, forming a map that glows
- Count: 3 backgrounds

UI Elements:
- Title screen: Nazca hummingbird geoglyph with Antikythera logo as the eye
- HUD: Score as "Lines Drawn," accuracy percentage, combo counter, current geoglyph name
- Pause menu: Carved stone panel
- Victory: All geoglyphs complete — the hidden map reveals, Sodalite appears at the center point
- Game over: Not applicable — rhythm game. Failed notes reduce score, no fail state (or optional fail state toggle)
- Hit circle: geoglyph node (gold ring)
- Slider: desert line (brown groove)
- Spinner: spiral (gold spiral)
- Count: 8 UI screens

Tile Sets / Object Sprites:
- Hit circle (geoglyph node): 1
- Slider head/tail: 2
- Slider body (desert line): 1
- Spinner (spiral): 1
- Approach circle: 1
- Combo number: 1
- Accuracy indicator: 1
- Sodalite (final): 1
- Count: 9 sprites

Animation Frames:
- Geoglyph complete glow: 3
- Line draw: 2
- Spiral spin: 3
- Star twinkle: 2
- Hidden map reveal: 5
- Count: 15 frames

Artist Style Assignment:
- Primary: Georgia O'Keeffe (desert landscape, vast scale, warm earth tones)
- Hidden pattern: Dali (the surreal connection between geoglyphs — reality bending)
- Geoglyphs: accurate to the real Nazca Lines (with Inn gold-glow stylization)

Total Image Assets: 71

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Andean flute (quena) + clay drum + wind, 50 BPM, Nazca desert ambiance
- Each geoglyph has a unique musical phrase (9 variations on the theme, each matching the geoglyph's cultural meaning)
- Shadow theme: Quena in minor + night insects + 84Hz pulse
- Hidden map reveal: All 9 phrases converge — quena ensemble, ascending
- Count: 12 tracks (1 main + 9 geoglyph variations + 1 shadow + 1 reveal)

Sound Effects:
- Hit circle (chisel strike): crisp tap on stone
- Slider (line draw): dragging chisel through earth
- Spinner (spiral): rotating scrape
- Perfect hit: resonant ping (tuned to current phrase)
- Miss: dull thud
- Combo milestone: ascending quena note
- Geoglyph complete: quena flourish + desert wind
- Count: 7 SFX

Voice Lines:
- The Sky Watcher: ~8 lines
- Count: 8 voice lines

Stone Tone Trigger:
- Reward stone: Sodalite -> Mohs ~5.5-6 -> ~350 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50 (but each geoglyph phrase may vary tempo — matching the drawing's rhythm)
- Inn Mode DSP profile: Nazca Desert (open air, dry, minimal reverb, wind constant, vast)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 27

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Hit circle: A / face button (or tap)
- Slider: hold A + move stick along path
- Spinner: rotate stick rapidly
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: tap for circles, drag for sliders, rotate for spinners (mobile — the most natural platform for rhythm clickers)

Steam Integration:
- Achievements: "Sky Messages" (complete all geoglyphs), "Perfect Lines" (100% a geoglyph), "Shadow Artist" (beat Shadow mode), "Hidden Map" (reveal the connecting pattern), "Sodalite Keeper" (earn Sodalite)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Highest Accuracy" and "Longest Combo"
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Sodalite, increment gamesCompleted

Special Notes:
- The Whisper Layer pointing UP (to the sky) is unique — every other game has the archive speaking downward or from the walls. Nazca Lines are messages to the heavens. The archive looks up here.
- 9 geoglyph levels based on real Nazca drawings. The player literally restores ancient art through rhythm.
- The hidden map connecting all geoglyphs is the game's mystery — what were the Nazca trying to show? The Inn's answer: a map to something beneath the desert. What that something is... the game doesn't say. The Sodalite holds the pattern but not the answer.
- Rhythm clickers are the most mobile-friendly genre — touch input is the native format. This game may be the most-played mobile title in the catalog.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 71 images (geoglyph accuracy is key)
Phase 3: Audio Production — 12 tracks (most varied soundtrack), 7 SFX, 8 voice lines
Phase 4: Programming — spec only, full game script needed (moderate — rhythm timing + path drawing)
Phase 5: Testing — 7 acceptance criteria (extra focus on timing precision)
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes
