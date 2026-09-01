# Build Sheet — Wall Defense

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Space Invaders |
| Geode Inn Name (OUT) | Wall Defense |
| Genre/Mechanic | Fixed shooter — defend the wall from descending rows of enemies, move horizontally, fire upward |
| Zone | Great Wall of China |
| Stone Reward | Jade |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | Taito (1978) |
| Legal Basis | Public domain mechanic — fixed shooter defending a line is one of the oldest game formats. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- The player ship -> A Wall Sentinel (a stone guardian statue positioned on the Great Wall)
- Space Invaders -> Mongol shadow riders (spectral horsemen descending from the northern steppes)
- UFO bonus enemy -> The Dragon Kite (a rare flying bonus target that drops jade fragments)
- Player shields/bunkers -> Watchtower segments (crumble as they take damage, repairable between waves)

New Narrative Frame:
- The player is a stone sentinel on the Great Wall of China. Spectral riders — echoes of every invasion the Wall has ever repelled — descend in formation from the north. The sentinel fires jade-tipped arrows upward to disperse them.
- Each wave of riders moves faster and lower. If they reach the Wall, they damage the watchtower segment below. Lose all towers and the Wall is breached — the archive's northern boundary falls.
- The Dragon Kite appears periodically — a rare target that drops jade fragments when hit. Collect enough and the Jade stone is earned.
- The Jade reward: the stone of heaven in Chinese culture. The Wall was built to protect the empire; Jade represents what was worth protecting. The sentinel earns it by never letting the Wall fall.

Dialogue Requirements:
- NPC dialogue count: ~6 lines (The General — a ghost of a Ming dynasty commander, speaks between waves)
- Voice profiles needed: The General -> Mandarin-inflected English, commanding, clipped military cadence, mid-low register
- Whisper Layer presence: No — this is pure arcade action. Simple, focused, reflex-driven.

Frequency State:
- Living (42Hz): Daytime. Wall is warm stone, riders are spectral white. The General is calm, proud.
- Shadow (84Hz): Night. Wall is dark, riders are shadow-black with red eyes. They descend faster. The General's voice is strained — "They come again. They always come again."
- In-Between: Dusk — torches light along the wall as the shift happens.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Wall Sentinel: idle (1), firing (1), hit (1) x 2 freq = 6 sprites
- Mongol Shadow Rider: 3 formation types x idle (1), descending (1) x 2 freq = 12 sprites
- Dragon Kite: flying (1), hit (1) = 2 sprites
- The General: portrait (1), speaking (1) x 2 freq = 4 sprites
- Count: 24 sprites

Backgrounds/Environments:
- Great Wall (day): Hokusai-meets-Bierstadt — wall stretching into misty mountains, warm light
- Great Wall (night): Hokusai dark — moonlit wall, distant steppe fires
- Count: 2 backgrounds

UI Elements:
- Title screen: Wall silhouette with Antikythera logo as a watchtower beacon
- HUD: Score as "Riders Dispelled," wave number as "Assault Round," jade fragment count
- Pause menu: Bamboo slip aesthetic
- Victory: Wall stands at dawn, jade glows in the sentinel's hand
- Game over: Wall breached, riders pour through, sentinel crumbles
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Watchtower segment (3 damage states): 3
- Jade-tipped arrow (player projectile): 1
- Rider arrow (enemy projectile): 1
- Jade fragment (collectible): 1
- Wall merlon (decorative top): 1
- Explosion (rider dispersed): 1
- Tower repair (between waves): 1
- Count: 9 sprites

Animation Frames:
- Sentinel fire: 2
- Rider descend: 2
- Dragon Kite fly: 2
- Tower crumble: 3
- Rider dispersed: 3
- Torch flicker: 2
- Count: 14 frames

Artist Style Assignment:
- Primary: Hokusai (geometric precision, wave-like formations of riders echoing Great Wave)
- Secondary: Bierstadt (mountain grandeur behind the Wall)

Total Image Assets: 56

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Guzheng + taiko drum, 50 BPM base accelerating with wave intensity, referencing Chinese military folk traditions
- Shadow theme: Erhu (bowed string) + deeper taiko, minor key, 84Hz pulse
- Victory: Guzheng ascending + wind chime resolve
- Count: 3 tracks

Sound Effects:
- Arrow fire: bowstring twang + jade ring
- Rider hit: spectral dispersal (reverse cymbal)
- Tower hit: stone crack
- Tower collapse: rumble
- Jade fragment collect: bright ping
- Dragon Kite hit: firework burst
- Wave start: war horn
- Wave clear: guzheng chord
- Count: 8 SFX

Voice Lines:
- The General: ~6 lines
- Count: 6 voice lines

Stone Tone Trigger:
- Reward stone: Jade -> Mohs ~6.5-7 -> ~415 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50 (accelerates with wave number — up to 100 BPM by final wave)
- Inn Mode DSP profile: Mountain Wall (open air, long reflections, dry, wind-swept)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 17

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move: Left stick / D-pad (left, right only)
- Fire: A / face button (or RT / R2 for auto-fire)
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: drag left/right, tap to fire (mobile)

Steam Integration:
- Achievements: "The Wall Stands" (beat game), "Flawless Defense" (beat a wave without any tower damage), "Shadow Sentinel" (beat Shadow mode), "Dragon Hunter" (hit 5 Dragon Kites in one run), "Jade Guardian" (earn Jade)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Highest Score"
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Jade, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 56 images
Phase 3: Audio Production — 3 tracks, 8 SFX, 6 voice lines
Phase 4: Programming — spec only, full game script needed (simple scope — fixed shooter)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes
