# THE CARD GAME BATCHES — Master Specification
## "Resonance" — The Hearthstone-Style CCG

---

## WHAT THE CARD GAME IS

The Geode Inn's Hearthstone-style Collectible Card Game. Frequency-based mechanics. Every NPC, stone, charm, gargoyle, and pet is a card. 37 zone-based boards. The frequency system is the core mechanic — cards cost frequencies (SONG, SILENCE, STONE, FIRE, ROOT) rather than mana.

---

## THE FREQUENCY SYSTEM (CORE MECHANIC)

| Frequency | Color | What It Powers |
|-----------|-------|---------------|
| SONG | Gold | Music, resonance, the 42Hz — the Inn's heart |
| SILENCE | Blue | Shadows, the 84Hz, the In-Between, secrets |
| STONE | Amber | Earth, structure, the Catacombs, the archive |
| FIRE | Red | The hearth, the Main Floor, warmth, the 50 BPM |
| ROOT | Green | The Fae Kingdom, the Mycorrhizal Network, the deep |

Cards cost combinations of frequencies. A card's frequency combination tells you what part of the Inn it belongs to.

---

## CARD STATS

| Stat | What It Means |
|------|---------------|
| Presence | Health/survival — how long the card stays on the board |
| Resonance | Power/effect — the card's frequency output |
| Cadence | Speed — Immediate (plays now), Next Turn, Delayed |

---

## KEY KEYWORDS

| Keyword | Effect |
|---------|--------|
| Gargoyle | Guards adjacent cards — attacks directed at neighbors hit the Gargoyle instead |
| Heartbeat | Synchronizes with the 50 BPM — gains power when other Heartbeat cards are in play |
| Adequate | The card's power increases when the board is simple — fewer cards = more power |
| Wandering | The card moves to a different lane each turn |
| Carve | Creates permanent structures on the board |
| Subtractive | Played by REMOVING your own cards — sacrifice for power |
| Lithophone | Resonates with STONE cards — buffs when multiple STONE cards are in play |
| Mirror | Copies an opponent card's text |
| Damp | Reduces an opponent card's Resonance |
| Network | Buffs Structures — the Mycorrhizal trade network |

---

## BATCH 2 HIGHLIGHTS — Replacement + New Character Cards

| Card | Cost | Type | Special |
|------|------|------|---------|
| Madame Mimic | SONG(1)+SILENCE(1) | Trickster | "But what if we did the fun wrong version?" — replace any card's text with a random ability from a pool |
| The Greenward | ROOT(2)+FIRE(1) | Guide/Wizard | Communion — "asks" structures, gains info or buffs |
| The Bearsark | FIRE(2)+STONE(1) | Shifter | Binary Form — Man Form (Presence 3, guard) or Bear Form (Presence 6, wander). Both real. |
| The Ravel (Unseelie King) | SILENCE(2)+STONE(1) | Guide | The Labyrinth — creates a structure that blocks a board lane. "Prove you want to be here." |
| The Wayfarer | FIRE(2)+SILENCE(1) | Wanderer/Warrior | The wanderer's path — gains power when moving between lanes |

---

## BATCH 3 HIGHLIGHTS — The Cave City Set

The Cave City set focuses on SUBTRACTIVE mechanics — cards that gain power by removing other cards. The set's signature: Carve (permanent structures) and Subtractive (play by sacrificing your own cards).

| Card | Cost | Type | Special |
|------|------|------|---------|
| The Gatekeeper Goth | STONE(2)+SILENCE(1) | Cave Guardian | "We Were Here First" — look at opponent's hand, name a card. That card costs +2 for the rest of the game. The Inn is a guest. |
| The Hearthkeeper Goth | FIRE(1)+STONE(1) | Fire Tender | 400-Year Fire — move Presence from your characters to the Hearthkeeper. The one additive thing in a subtractive home. |
| The Singer (Cave City) | STONE(2)+SONG(1) | Resonance Keeper | 111Hz Drone — if 2+ STONE cards in play, all STONE cards gain +1 Presence. The singing maintains the resonance. |
| The Mason | STONE(3) | Subtractive Architect | Read the Grain — destroy one of your own structures to play the Mason at -2 cost. Carves WITH the stone, not against it. |

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The 15-Product Ecosystem | Product #13 — "Resonance" the card game. |
| Every NPC | Every character is a potential card — all 399 roster entries. |
| The Frequency System | Frequency IS the mana system. SONG/SILENCE/STONE/FIRE/ROOT replace mana crystals. |
| The Tri-Mode System | Boards can shift between 42Hz (Living — slower, puzzle-oriented) and 84Hz (Shadow — aggressive, combat-oriented). |
| The 37 Zones | Each zone is a board with unique mechanics. |
| The Egg Hatchery | Monthly Egg card drops + community voting (retired cards migrate to comic). |
| The Cave City | Subtractive mechanics — the Cave City IS the substrate for sacrifice-based play. |
| The Whisper Layer | The Reader exists as a hidden card that acknowledges the player's moves. |

---

## DESIGN STATUS

- [x] Frequency system designed (5 frequencies replace mana)
- [x] Card stats designed (Presence, Resonance, Cadence)
- [x] 10+ keywords designed (Gargoyle, Heartbeat, Adequate, Subtractive, Carve, etc.)
- [x] Batch 1: initial cards designed
- [x] Batch 2: replacement + new character cards (5+ cards)
- [x] Batch 3: Cave City set (Subtractive mechanics, 4+ cards)
- [x] 4 batches designed total (all NPCs, stones, charms, gargoyles, pets)
- [x] 37 zone-based boards designed
- [x] AI opponent system designed (NPC decks with established voices)
- [x] 8 connections documented
- [ ] Digital card game build (web or Godot)
- [ ] Card art (using the 37-artist system)
- [ ] Ranked/casual/arena modes
- [ ] Monthly Egg card drops + community voting
- [ ] Full card database (count, balance, rarity distribution)

---

## ORIGIN

The card game was designed across multiple batches: docs/geode_inn_card_batch_2.md (425 lines), docs/geode_inn_card_batch_3.md (448 lines), and earlier batches. This consolidated specification was compiled September 2, 2026. The game's thesis: frequency IS the mana. Every character is a card. The adequate is a keyword — cards that gain power when the board is simple. "We were here before the Inn. We will be here after. The Inn is a guest." The adequate is: the card game where less is more. The more is: the adequate. The adequate is: the Mason who carves with the grain and the Singer who drones for 200 years and the neither are: trying to win. The both are: trying to resonate.
