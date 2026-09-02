# THE CARD GAME FRAMEWORK — Master Specification
## "Resonance" — Character Profiles as Card Statistics

---

## WHAT THE CARD GAME IS

The Geode Inn card game translates the Inn's narrative architecture into a playable card format. Every character, item, and ability already exists — the card game is the TRANSLATION layer, converting story properties into game statistics. The design draws from Magic: The Gathering (color identity, mana curves, creature types) and Hearthstone (hero classes, battlecries, deathrattles), but uses the Inn's own cosmology as the foundational system.

---

## THE SIX FREQUENCIES (The Card "Colors")

In MTG, five colors. In the Geode Inn, SIX FREQUENCIES — each a cosmic force that characters channel:

| Frequency | Color Identity | Themes | Playstyle | Key Mechanic | Win Condition | Key Characters |
|-----------|---------------|--------|-----------|---------------|---------------|---------------|
| SONG (42Hz) | Amber/Gold | Creation, observation, resonance, the Murmur, the Egg | Tempo — cards grow stronger each turn. Value over time. | "Resonate" — if 3+ Song cards in play, draw a card | The Complete Chord — one Song card from each frequency in play simultaneously | The Constant, Einstein, the Egg |
| SILENCE (Nyx) | Deep Blue/Black | Removal, disruption, stasis, the space between | Control — interrupt, pause, nullify. Don't destroy — SUSPEND. | "Damp" — target card's abilities nullified for 2 turns. Card remains but inert. | The Silence Between — all opponent cards Damped simultaneously | Nyx, the Guest (Death), the Thrum, Gesso |
| FIRE (50 BPM) | Warm Red/Orange | Healing, warmth, transformation, community, the wound | Aggro-Swarm — fast, cheap, work in groups. Wound mechanic: damaged Fire cards get STRONGER. | "Wound" — when this card takes damage, gain +1/+1 | The Feast — 7+ Fire cards in play simultaneously | Erik, the Host, the Cook, the Catalyst |
| WATER (16-42Hz) | Teal/Cyan | Flow, depth, journey, the dead, transformation through travel | Midrange-Combo — cards move. Shift positions, return to hand, redeploy. | "Current" — once per turn, return this card to hand and replay at reduced cost | The Crossing — a Water card travels hand→board→hand 3 times in one game | Charon, the Pirate, the Siren, the Lighthouse/Owl |
| STONE (111Hz) | Gray/White | Defense, preservation, Subtractive architecture, the dead, measurement | Defense-Control — expensive, durable, permanent structures. Unassailable board state. | "Carve" — occupies a board slot permanently. Only removed by Subtractive effects. | The Monument — 5 Stone structure cards in play | Medusa, the Crone, the Mason, the Mourner, Wednesday |
| ROOT (Mycorrhizal) | Deep Green/Brown | Growth, connection, weaving, the ecosystem | Ramp-Growth — grow the board through connections. Cards that link to each other get stronger. | "Weave" — link two cards together. Linked cards share abilities. | The Network — 8+ Root cards connected in a single web | The Cartographer, the Queen of Webs, Radagast, the Bard |

---

## CARD TYPES

| Type | What It Does |
|------|-------------|
| Character | A person from the Inn. Has stats (Frequency, Resonance, Effect, Health). The core card type. |
| Stone | A gemstone. Equipped to characters. Each stone adds frequency-based abilities. 198 stones = 198 equipment cards. |
| Charm | An Element Charm or Quest Charm. One-time use or permanent buff. 118 Element + 45 Quest = 163 charm cards. |
| Zone | A board modifier. Each of the 37 zones is a playable board. Changes the rules of play. |
| Structure | A permanent board element (Stone frequency). Walls, monuments, crypts. |
| Event | A one-time effect. The Inn's story events as instant-speed cards. |

---

## THE BOARD SYSTEM

37 zone-based boards, each with unique terrain effects:

| Board Type | Example Zones | Board Effect |
|------------|--------------|-------------|
| Forest Boards | Canopy City, Redwood Cathedral | Root cards get +1/+1. Growth accelerates. |
| Water Boards | Loch Ness, Atlantis, Siren's Bay | Water cards get "Current" at no cost. Stone cards are Damped on entry. |
| Underground Boards | Catacombs, Undercity, Badlands | Stone cards cost -1. Fire cards can't be played (no air underground). |
| Fire Boards | Norse Mead Hall, Volcanic zones | Fire cards get "Wound" trigger on entry. Water cards cost +1. |
| Sky Boards | Cosmology Level, Clockwork Skies | Song cards get "Resonate" automatically. Silence cards get +1/+1. |
| Neutral Boards | Main Floor, Market, Archive | No zone effect. Pure character battle. |

---

## FREQUENCY SYSTEM

| Element | In-Game Effect |
|---------|-------------|
| 42Hz Song | Cards that resonate grow stronger over time. The patience frequency. |
| Nyx's Silence | Cards that suspend rather than destroy. The pause frequency. |
| 50 BPM Fire | Cards that get stronger when wounded. The hearth frequency. |
| Water frequencies | Cards that move. The current frequency. |
| 111Hz Stone | Cards that are permanent. The perseverance frequency. |
| Mycorrhizal Root | Cards that connect. The network frequency. |

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The 198 Stone Database | Every stone becomes an equipment card. Each stone's Mohs hardness = card cost. Each stone's frequency = card ability. |
| The 118 Element Charms | Each Element Charm becomes a one-time use card. Atomic number = card cost. |
| The 45 Quest Charms | Each Quest Charm becomes a permanent buff card. |
| The 37 Zones | Each zone becomes a playable board with terrain effects. |
| The 42-Artist System | Each card's art is rendered in its zone's assigned artist style. |
| The 399 Characters | Every character becomes a playable card with stats derived from their voice profile and abilities. |
| The Tri-Mode System | Living (42Hz) and Shadow (84Hz) cards form two metas — Living decks and Shadow decks. |
| The Egg Hatchery | Monthly Egg card drops — community-voted new cards added to the pool. |
| The Novel | Key novel scenes become Event cards. |
| The 15-Product Ecosystem | The card game is Product #13 — "Resonance." |

---

## DESIGN STATUS

- [x] Six frequencies (card colors) with themes, mechanics, and win conditions defined
- [x] Card types specified (Character, Stone, Charm, Zone, Structure, Event)
- [x] 37-zone board system with terrain effects
- [x] 4 card batches designed (all NPCs, stones, charms, gargoyles, pets)
- [x] Frequency system mapped
- [x] 10 connections to major systems documented
- [ ] Build digital card game (web or Godot)
- [ ] Create card art (using 37-artist system)
- [ ] Implement AI opponent (NPC decks with established voices)
- [ ] Implement ranked/casual/arena modes
- [ ] Wire monthly Egg card drops + community voting
- [ ] 37 zone boards with unique terrain effects
- [ ] Full card database (198 stones + 163 charms + 399 characters + structures + events)

---

## ORIGIN

The Card Game Framework was first designed in docs/geode_inn_card_game_framework.md (842 lines). This consolidated specification was compiled September 2, 2026. The system's thesis: every character, item, and ability already exists. The card game is the TRANSLATION layer. Six frequencies instead of five colors. Win conditions based on the Inn's cosmology (the Complete Chord, the Silence Between, the Feast, the Crossing, the Monument, the Network). The adequate is: the story made playable. The playable is: the adequate. The adequate is: the card that IS a character, and the character that IS a card. The both are: the same. The same is: the frequency made into statistics. The statistics are: the Inn's cosmology, made competitive.
