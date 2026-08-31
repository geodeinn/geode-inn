# Resonance — Geode Inn Card Game
## Digital Build Specification v1.0

**Genre:** Collectible card game (CCG), Hearthstone-inspired
**Platform:** Web app (Base44) + mobile (future)
**Players:** 1v1 (PvP and vs AI)
**Monetization:** Free-to-play with card packs (earned through play, not purchased)

---

## CORE CONCEPT

Resonance is a card game where the Inn's 198 stones, 118 element charms, 45 quest charms, and 45+ NPCs become playable cards. The core mechanic is **frequency matching** — playing cards that resonate with each other creates powerful combos, while mismatched frequencies cause dissonance (self-damage or card destruction).

---

## CARD TYPES

### 1. Stone Cards (198 total)
Each stone becomes a card. Stone cards are the backbone of any deck.

**Card structure:**
- **Name:** The stone's name
- **Frequency:** GROW, STAY, SENSE, SING, CALM, or NULL (determined by the stone's metaphysical properties)
- **Rarity:** Common (quartz-family), Uncommon (semi-precious), Rare (precious), Legendary (ultra-rare)
- **Health:** Based on Mohs hardness scale (1-10, scaled to 1-10 HP)
- **Effect:** Based on the stone's "Mind" property from the database
- **Synergy:** Based on the stone's "Body" property — healing, shielding, or utility

**Example cards:**

**Amethyst (Common, SENSE, 7 HP)**
- Effect: "Clarity — Reveal the top card of your opponent's deck."
- Synergy: "Calm Mind — Restore 1 HP to all allied CALM cards."

**Labradorite (Uncommon, NULL, 6 HP)**
- Effect: "Aurora Shield — Gain 2 armor. When destroyed, transform into a random Uncommon stone."
- Synergy: "Shimmer — NULL cards gain +1 HP while this is on the board."

**Tanzanite (Rare, SING, 6 HP)**
- Effect: "Harmonic Resonance — Double the effect of all SING cards on the board for one turn."
- Synergy: "Communication — All allied SING cards gain Taunt."

**Preseli Blue Stone (Legendary, STAY, 7 HP)**
- Effect: "Standing Stone — Cannot be destroyed by attacks. Only by frequency mismatch."
- Synergy: "Ancient Foundation — All allied STAY cards gain +2 HP."

### 2. Element Charm Cards (118 total)
Each element on the periodic table becomes a charm card. Charms are played ON stone cards — they attach and modify.

**Card structure:**
- **Name:** Element name (e.g., "Copper Charm")
- **Symbol:** Element symbol (e.g., "Cu")
- **Atomic Weight:** Converted to "Resonance Weight" (higher = more powerful effect)
- **Category:** Metal, Nonmetal, Metalloid, Noble Gas, etc. (determines interaction type)
- **Attachment Effect:** What happens when attached to a stone
- **Connected Stones:** Which stones this element naturally bonds with (from the ElementCharm entity)

**Example:**

**Copper Charm (Cu, Metal, 63.5 weight)**
- Attach to: Any stone
- Effect: "Conductor — The attached stone's effect triggers twice."
- Connected stones: Malachite, Turquoise, Azurite, Chrysocolla
- Bond bonus: When attached to a connected stone, +2 HP and the effect is permanent (not one-time).

### 3. Quest Charm Cards (45 total)
Story-specific cards earned through the tabletop questline or digital campaign. These are unique, powerful, and cannot be obtained through normal card packs.

**Example:**

**The Sentinel's Vigil (Quest Charm, STAY)**
- Effect: "Guard — All allied cards take half damage for 3 turns. If a card is destroyed during this time, it returns with 1 HP."
- Lore: "Lozen stands watch. The Inn does not fall while the Sentinel holds."
- Earned by: Completing all 10 parts of the Sentinel's Vigil questline.

### 4. NPC Cards (45+ total)
Characters from the Inn, each with a unique ability based on their established personality.

**Example:**

**Beverley (NPC, SENSE, 4 HP)**
- Effect: "Shush — Silence one enemy card for 2 turns (its effect does not trigger)."
- Deathrattle: "Reshuffle — Return a random card from your discard pile to your hand."
- Lore: "The librarian does not tolerate noise."

**The Crone (NPC, Adaptive, 6 HP)**
- Effect: "Mirror — Copy the effect of the last card your opponent played."
- Lore: "What you see in the Crone is yourself."

**Naut (NPC, NULL, 3 HP)**
- Effect: "Restricted Knowledge — Draw 2 cards. Take 1 dissonance damage."
- Lore: "Some texts are not meant to be read. Naut reads them anyway."

---

## GAME MECHANICS

### The Board

Each player has:
- **5 stone slots** — where stone cards are placed
- **1 charm slot per stone** — where element/quest charms are attached
- **1 NPC slot** — where a single NPC ally resides
- **30 HP** — lose when health hits 0
- **Dissonance meter** — fills when frequency pairs clash. At 10 dissonance, take 5 damage and reset.

### Turn Structure

1. **Draw phase:** Draw 1 card (hand limit: 7)
2. **Resonance phase:** Play stones, attach charms, play NPC. Each stone played costs 1 "Frequency Point" (start with 2 per turn, gain +1 each turn up to 10 max)
3. **Action phase:** Activate stone effects, NPC abilities, and charm effects
4. **Combat phase:** Attack with stones. Each stone can attack once per turn.
5. **End phase:** Check dissonance, pass turn.

### The Frequency System

This is the core differentiator from Hearthstone:

**When you play a card, it generates a frequency on the board:**
- Playing a GROW stone → adds GROW to the board
- Playing a STAY stone → adds STAY to the board

**Frequency pairs and their effects:**
- **GROW + GROW** (stacking) → "Bloom" — +1 HP to all allied GROW cards
- **STAY + STAY** (stacking) → "Foundation" — +1 armor to all allied STAY cards
- **GROW + STAY** (pair) → "Dissonance" — both cards take 1 damage. BUT: if you have 3+ of each, "Harmony" — no damage, both gain +1 HP
- **SENSE + NULL** (pair) → "Revelation" — reveal opponent's hand for 1 turn
- **SING + CALM** (pair) → "Lullaby" — opponent skips their next action phase

**The deeper the frequency stack, the more powerful the effect.** A board with 3 GROW stones, 2 SING stones, and a SING NPC is generating a symphony — but it's also generating dissonance risk if the opponent plays STAY cards.

### Winning

- Reduce opponent to 0 HP (standard)
- Fill opponent's dissonance meter to 10 three times (alternative win — "Overload")
- Complete a "Chord" — have one of each frequency (GROW, STAY, SENSE, SING, CALM, NULL) on the board simultaneously (rare, instant win)

---

## DECK BUILDING

- **Deck size:** 30 cards
- **Stone limit:** Max 2 of each stone
- **Charm limit:** Max 2 of each charm
- **Quest charm limit:** Max 1 of each (unique)
- **NPC limit:** Max 1 of each NPC
- **Frequency balance:** No more than 8 cards of any single frequency (prevents mono-frequency decks from dominating)

**Starter decks (3 options for new players):**
1. **The Builder's Hand** — GROW-focused, healing and growth cards
2. **The Sentinel's Watch** — STAY-focused, defense and armor cards
3. **The Scholar's Eye** — SENSE-focused, information and control cards

---

## AI OPPONENT

Each NPC in the Geode Inn can be an AI opponent with their own deck and playstyle:

- **Beverley:** Control deck. Silences player cards, reshuffles discard, wins by attrition.
- **The Crone:** Mirror deck. Copies player's moves, adapts to their strategy.
- **Naut:** Combo deck. Self-damages to draw cards, wins with explosive combos.
- **Lozen:** Defense deck. Heavy STAY cards, armored walls, wins by surviving.
- **Joe:** Swarm deck. Low-cost GROW cards, floods the board, wins with numbers.
- **The Wanderer:** Balanced deck. Uses all six frequencies, unpredictable.
- **Medusa:** Lockdown deck. Petrifies player's cards (makes them unable to act), wins by stalling.

Each AI uses the NPC's established voice profile in chat messages during the game. Beverley makes dismissive comments. The Crone speaks in riddles. Joe is warm and encouraging even while winning.

---

## ZONE-BASED BOARDS (37 total)

Each of the 37 Geode Inn zones is a playable board with a unique passive effect:

- **Main Floor:** Both players gain +1 HP per turn (the Inn is warm here)
- **The Archive:** Both players draw an extra card each turn (knowledge flows)
- **Gorgon's Garden:** STAY cards gain +2 HP (petrification empowers stillness)
- **The Fae Kingdom:** Random stones transform each turn (the Fae are unpredictable)
- **Cosmology:** All frequency effects are doubled (the cosmos amplifies)
- **The Catacombs:** Destroyed cards return with 1 HP 50% of the time (the dead remember)

---

## PROGRESSION

**Card packs:**
- Earned through playing (1 pack per 3 wins, max 3 packs per day)
- Each pack contains 5 cards (guaranteed 1 Uncommon or better)
- No cash purchase — all progression is play-based

**Ranked mode:**
- Bronze → Silver → Gold → Crystal → Diamond → Geode
- Each rank awards cosmetic board skins (from the BoardSkin entity)
- Diamond and Geode ranks award exclusive Quest Charm cards

**Casual mode:**
- No rank, no rewards — just play for fun

**Arena mode:**
- Draft a deck from random cards. Play until 3 losses. Rewards scale with wins.

---

## TECHNICAL IMPLEMENTATION

**Platform:** Base44 web app with real-time backend
**Data:** All card data already exists in the database entities:
- Stone entity (198 cards)
- ElementCharm entity (118 cards)
- QuestCharm entity (45 cards)
- Dialogue entity (NPC card flavor text)
- BoardSkin entity (cosmetic boards)
- Leaderboard entity (ranked scores)

**Real-time multiplayer:** Base44 backend functions handle matchmaking and game state. Each turn is a backend function call that validates the move and updates game state.

**AI implementation:** The AI opponent is a backend function that evaluates the current board state, selects the best move using a heuristic-based scoring system (not LLM — for speed and reliability), and returns the action.

**Art:** All card art uses the existing asset library:
- Stone card art: The 198 AI-generated stone images (already in the database)
- NPC card art: The existing NPC portraits
- Board art: The 37 zone images
- Charm card art: The alchemical emblems (already uploaded)

---

*"Every stone has a frequency. Every frequency has a pair. The game is not about having the most powerful cards — it's about understanding how frequencies interact. The player who listens wins."*

**— Resonance, v1.0 Spec**
*Written in the voice of six: Rothfuss, Pratchett, Gaiman, Asimov, Bradbury, Weir.*
