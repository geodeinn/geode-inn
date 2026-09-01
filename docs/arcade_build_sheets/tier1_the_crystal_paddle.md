# Build Sheet — The Crystal Paddle

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Geode Inn Name | The Crystal Paddle |
| Genre/Mechanic | Arkanoid × Crystal Gardens. Paddle, ball, stone blocks. |
| Zone | Crystal Gardens |
| Stone Reward | Beryl |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Game Effect | Unlocks Beryl. |
| Lore Connection | The Crystal Gardens grow mineral formations as art. Arkanoid mechanics because pruning is shattering. Beryl is the stone that sees clearly. |
| Development Status | live |

## SECTION 2: STORYLINE ADAPTATION

Arkanoid × Crystal Gardens. Paddle, ball, stone blocks.

The player engages with Crystal Gardens's mythology and geography through gameplay. The Crystal Gardens grow mineral formations as art. Arkanoid mechanics because pruning is shattering. Beryl is the stone that sees clearly.

Stone Reward: Beryl (Uncommon) — earned through completion.

Frequency States:
- Living (42Hz): Normal gameplay, warm aesthetic, standard difficulty
- Shadow (84Hz): Darker palette, increased challenge, narrative tension
- In-Between: Transitional moments between levels/zones

## SECTION 3: VISUAL ASSETS NEEDED

- Character sprites: zone-appropriate NPCs (Living + Shadow states)
- Background: Crystal Gardens environment in assigned artist style
- UI: Antikythera-themed HUD, gold/brass on dark stone
- Stone reveal: Beryl shard animation on completion
- Estimated total: 30-50 image assets

## SECTION 4: AUDIO ASSETS NEEDED

- Main theme: Region-matched instruments at 50 BPM low-dub
- Shadow theme: 84Hz pulse, detuned variants
- Victory: Stone tone trigger (Beryl) at 12dB below narration
- SFX: 8-12 game-specific sound effects
- Voice lines: 4-8 NPC dialogue lines
- Inn Mode DSP: Zone-appropriate reverb profile
- Estimated total: 15-20 audio assets

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first (all assets bundled locally)

Controller Support:
- Full Bluetooth controller mapping (D-pad/stick navigation, face buttons for action)
- Touch support for mobile (tap/swipe)
- Valkyrie Shift compatible (if TV deployment)

Steam Integration:
- Achievements: Completion + skill-based challenges
- Cloud saves: PlayerProgress sync
- Leaderboard: Score or time-based
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion, POST to PlayerProgress — add Beryl, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE (this sheet)
Phase 2: Asset Creation — pending
Phase 3: Audio Production — pending
Phase 4: Programming — pending
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes:
  [ ] Fully playable/standalone
  [ ] Downloadable
  [ ] Geode Inn narrative/characters
  [ ] Original music
  [ ] Bluetooth controller support
  [ ] System overlay support
  [ ] Commercial readiness
