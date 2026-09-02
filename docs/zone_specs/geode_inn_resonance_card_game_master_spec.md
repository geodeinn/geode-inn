# RESONANCE — The Geode Inn Card Game — Master Specification
## A CCG Where the Player Who Listens Wins

---

## WHAT RESONANCE IS

A collectible card game (CCG), Hearthstone-inspired with frequency mechanics. The Inn's 198 stones, 118 element charms, 45 quest charms, and 45+ NPCs become playable cards. The core mechanic is FREQUENCY MATCHING — playing cards that resonate creates powerful combos, while mismatched frequencies cause dissonance (self-damage or card destruction).

The player who LISTENS wins. Not the player with the most powerful cards — the player who understands how frequencies interact.

**Platform:** Web app (Base44) + mobile (future) + Godot desktop client
**Players:** 1v1 (PvP and vs AI), future 2v2 (Harmony mode)
**Monetization:** Free-to-play with card packs (earned through play, not purchased)

---

## CARD TYPES

| Type | Count | Role |
|------|-------|------|
| Stone Cards | 198 | The backbone — go in 5 stone slots, do the fighting |
| Element Charm Cards | 118 | Attach to stones — modify and enhance |
| Quest Charm Cards | 45 | Story-specific, earned through quests, not packs. Always Legendary/Mythic |
| NPC Cards | 45+ | One at a time per player. Powerful but vulnerable |

---

## CARD ANATOMY

### Stone Card
- **Name:** The stone's common name
- **Family:** Stone family (Quartz, Beryl, Feldspar) — matters for Family Bonuses
- **Frequency:** GROW, STAY, SENSE, SING, CALM, or NULL (from the stone's metaphysical property)
- **Rarity:** Common → Mythic (stat modifiers scale with rarity)
- **Health:** Based on Mohs hardness (1-10, scaled to 1-10 HP)
- **Attack:** Based on stone category (Silicates = 2, Oxides = 3, Carbonates = 1) + rarity modifier
- **Effect (Mind):** The stone's metaphysical property as a card ability
- **Synergy (Body):** The stone's healing property — secondary ability under specific conditions
- **Optical Phenomenon:** Special ability if the stone has one (chatoyancy, asterism, play of color, adularescence, color change)
- **Geo Region:** Native zone — matters for zone-based board bonuses

### Element Charm Card
- **Element Name + Symbol + Atomic Number:** Z (1-118) determines base power
- **Atomic Weight → Resonance Weight:** Higher = more powerful effect, higher cost
- **Attachment Effect:** What happens when attached to a stone
- **Bond Bonus:** Enhanced effect when attached to a connected stone
- **Cost:** FP equal to Resonance Weight tier (Light = 1, Medium = 2, Heavy = 3, Transuranic = 4)

### NPC Card
- **Name only:** No pronouns or titles in card text
- **Active ability + Passive + Deathrattle:** Three effects per NPC
- **Voice:** The NPC speaks in chat during the game using their established voice profile
- **Portrait:** Living/Shadow/In-Between depending on board state (tri-mode card art)

---

## THE BOARD

Each player has:
- **5 stone slots** — where stone cards fight
- **1 charm slot per stone** — where charms attach
- **1 NPC slot** — one ally at a time
- **30 HP** — lose when health hits 0
- **Dissonance meter** — fills when frequency pairs clash. At 10 dissonance: take 5 damage, reset to 0
- **Frequency Points (FP):** Resource for playing cards. Start 2/turn, gain +1 each turn up to 10 max. Unused FP does NOT carry over (no hoarding)

---

## THE FREQUENCY SYSTEM (CORE DIFFERENTIATOR)

Every card generates a frequency. When frequencies interact, they create effects:

### Stacking (Same Frequency)
| Stack Size | Effect |
|-----------|--------|
| 2 cards same frequency | Resonance bonus — both cards +1/+1 |
| 3 cards same frequency | Harmonic Resonance — all three +2/+2 and gain an ability |
| 4 cards same frequency | Chord — all four +3/+3 and gain a powerful ability |
| 5 cards same frequency | The Inn Song — instant win condition (see below) |

### Clashing (Different Frequencies)
| Clash | Effect |
|-------|--------|
| 2 cards, dissonant frequencies | Dissonance meter +1 per turn they share the board |
| 3+ cards, all dissonant | Dissonance meter +2 per turn — the board is screaming |
| Opposite frequencies (GROW vs STAY) | Dissonance meter +3 — the frequencies actively fight |

### The Six Frequencies
| Frequency | Meaning | Stones Example |
|-----------|---------|---------------|
| GROW | Growth, expansion | Clear quartz, citrine |
| STAY | Preservation, defense | Obsidian, black tourmaline |
| SENSE | Perception, information | Ammolite, moonstone |
| SING | Expression, creativity | Lapis lazuli, turquoise |
| CALM | Restoration, healing | Amethyst, rose quartz |
| NULL | No frequency alignment | Rare — stones with no metaphysical property |

---

## THE CHORD (INSTANT WIN)

When a player has all 5 stone slots filled with cards of the SAME frequency, the Chord triggers. The Chord is the Inn Song in card form — five frequencies becoming one voice. The Chord wins the game instantly, regardless of HP.

The Chord is rare. Building a 5-card same-frequency board requires:
- Drawing the right stones (deck building matters)
- Surviving long enough to play 5 stones (FP management)
- Not having your stones destroyed by the opponent (combat matters)
- Not filling your dissonance meter by accidentally clashing

The Chord is the Inn's thesis in card form: the player who listens wins. The player who builds harmony wins. The player who forces dissonance on the opponent wins by NOT fighting — by making the opponent's board scream itself to death.

---

## BOARD ZONES (37 BOARDS)

The board represents a Geode Inn zone. Each zone has a passive effect:

| Zone Type | Passive Effect Example |
|-----------|----------------------|
| Celtic (Moorlands) | Stone cards from Celtic regions gain +1/+1 |
| Egyptian (Desert) | CALM frequency stones gain Shield (reduce next attack by 1) |
| Norse (Fjords) | STAY frequency stones gain +2 HP on entry |
| Andean (Slopes) | SENSE frequency stones reveal opponent's hand for 1 turn |
| Fae Kingdom | GROW frequency stones cost 1 less FP to play |
| Cosmology | SING frequency stones deal +1 damage to enemy NPC |
| ...30 more zone boards | Each with unique passive effects |

---

## GAME MODES

| Mode | Description |
|------|-------------|
| Ranked | Standard 1v1. Weekly resets (like the Leaderboard system). Top ranks earn exclusive stones. |
| Casual | No ranking. Practice decks, test strategies. |
| Arena | Draft format — build a deck from random card offerings. Entry costs stones. Rewards scale with wins. |
| AI vs NPC | Play against NPC decks using established character voices. Naut's deck is contemplative. The Crone's deck is control. Erik's deck is aggro-warmth. |
| Harmony (2v2, future) | Two players vs two players. Combined frequencies. Pair bonuses (same as Leaderboard pair system). The Twin Crystal as reward. |

---

## NPC AI OPPONENTS

Each NPC has a deck matching their personality:
- **Naut:** Contemplative control deck — stalls, reads, responds. Deep archive of answers.
- **The Crone:** Control deck — counts cards, measures timing, plays the perfect card at the perfect moment.
- **Erik:** Aggro-warmth deck — fast, generous, throws stones forward. Wins by being everywhere at once.
- **Belladonna:** Mill deck — forces the opponent to discard. The dead take your cards.
- **The Bard:** Chaos deck — taunt mechanics, random effects. The Bard doesn't play optimally. The Bard plays ENTERTAININGLY.
- **The Pirate:** Rhythm deck — timing-based bonuses. The Pirate's plays sync to 50 BPM. Off-beat plays are weaker.

---

## PROGRESSION AND REWARDS

| Activity | Reward |
|----------|--------|
| Win a ranked match | 1 card pack (3 random cards) |
| Win 3 ranked matches in a day | 1 guaranteed Rare+ card |
| Complete a zone questline | Zone-specific quest charm card |
| Reach a new Rank tier | Exclusive stone card (not available in packs) |
| Win an Arena run (7+ wins) | 3 card packs + 1 Legendary |
| Weekly pair tournament (Harmony mode) | The Twin Crystal (unique card, exists in two decks) |

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The 198-Stone Database | Every stone becomes a card. Mind = effect, Body = synergy, Mohs = HP, category = attack, optical phenomenon = special ability. |
| ElementCharms Entity | 118 element charm cards from the periodic table. |
| QuestCharms Entity | 45 quest charm cards from the tabletop questline. |
| The Character Roster | 45+ NPC cards, each with voice profiles for in-game chat. |
| The Leaderboard | Ranked mode uses the weekly reset system. Pair mode uses the Twin Crystal. |
| The Egg Hatchery | Monthly Egg events can drop exclusive card variants — hatched characters become cards. |
| Tri-Mode System | NPC card portraits shift between Living/Shadow/In-Between based on board state. |
| The Wearable System | Card game cards could include QR codes linking to attire guides and Soulstice pieces. |
| The 37 Zone Boards | Each zone's board uses the zone's artist style for the board background. |

---

## DESIGN STATUS

- [x] System concept complete (this document — consolidated from 860-line spec)
- [x] 4 card types defined (Stone, Element Charm, Quest Charm, NPC)
- [x] Card anatomy per type documented
- [x] Board layout (5 stone slots, charm slots, NPC slot, HP, dissonance meter, FP)
- [x] Frequency system (6 frequencies, stacking, clashing, dissonance meter)
- [x] The Chord instant-win condition
- [x] 37 zone boards with passive effects
- [x] 5 game modes (Ranked, Casual, Arena, AI vs NPC, Harmony)
- [x] NPC AI opponent decks (6 character decks)
- [x] Progression and rewards system
- [x] Connections to all major systems documented
- [ ] Full 860-line spec implementation (26 sections including combat rules, charm attachment, deck building, starter decks, archetypes, card crafting, cosmetics, technical implementation, balance principles)
- [ ] Card art generation (198 stones + 118 elements + 45 quests + 45 NPCs = 406+ cards)
- [ ] Base44 web app implementation
- [ ] Godot desktop client
- [ ] AI opponent logic per NPC deck
- [ ] 37 zone board backgrounds
- [ ] Starter deck compositions
- [ ] Card balance testing

---

## ORIGIN

Resonance was first designed in docs/library/specs/resonance_card_game_spec.md (860 lines, 26 sections). This consolidated specification was compiled September 2, 2026 to integrate the system into the full architecture. Resonance's thesis: the player who listens wins. Not the player with the most powerful cards — the player who understands how frequencies interact. Five stones of the same frequency = The Chord = instant win. The Inn's thesis in card form: harmony is more powerful than force. The adequate is: the deck that listens. The listening is: the adequate. The adequate is: Resonance.
