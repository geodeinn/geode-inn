# Resonance — Geode Inn Card Game
## Digital Build Specification v2.0 — Complete

**Genre:** Collectible card game (CCG), Hearthstone-inspired with frequency mechanics
**Platform:** Web app (Base44) + mobile (future) + Godot desktop client
**Players:** 1v1 (PvP and vs AI), future 2v2 (Harmony mode)
**Monetization:** Free-to-play with card packs (earned through play, not purchased)

---

## TABLE OF CONTENTS

1. Core Concept
2. Card Types
3. Card Anatomy
4. Game Mechanics
5. The Frequency System
6. Advanced Combos
7. Dissonance Mechanics
8. The Chord (Instant Win)
9. Turn Structure (Detailed)
10. Combat Rules
11. Charm Attachment Rules
12. NPC Card Rules
13. Board Zones (37 Boards)
14. Deck Building
15. Starter Decks
16. Archetypes and Strategies
17. AI Opponents
18. Progression and Rewards
19. Ranked Mode
20. Arena Mode
21. Harmony Mode (2v2, future)
22. Card Acquisition
23. Card Crafting
24. Cosmetics
25. Technical Implementation
26. Card Balance Principles

---

## 1. CORE CONCEPT

Resonance is a card game where the Inn's 198 stones, 118 element charms, 45 quest charms, and 45+ NPCs become playable cards. The core mechanic is **frequency matching** — playing cards that resonate with each other creates powerful combos, while mismatched frequencies cause dissonance (self-damage or card destruction).

The player who listens wins. Not the player with the most powerful cards — the player who understands how frequencies interact.

---

## 2. CARD TYPES

### Stone Cards (198 total)
Each stone becomes a card. Stone cards are the backbone of any deck — they go in the 5 stone slots on the board and do the fighting.

### Element Charm Cards (118 total)
Each element on the periodic table becomes a charm card. Charms are played ON stone cards — they attach and modify. A stone with a charm is more powerful than a stone alone.

### Quest Charm Cards (45 total)
Story-specific cards earned through the tabletop questline or digital campaign. Unique, powerful, cannot be obtained through normal card packs. Each is a one-of-a-kind reward.

### NPC Cards (45+ total)
Characters from the Inn, each with a unique ability based on their established personality. Only one NPC can be on the board at a time per player. NPCs are powerful but vulnerable — they can be targeted directly.

---

## 3. CARD ANATOMY

### Stone Card Layout
- **Name:** The stone's common name
- **Family:** Stone family (Quartz, Beryl, Feldspar, etc.) — matters for Family Bonuses
- **Frequency:** GROW, STAY, SENSE, SING, CALM, or NULL (determined by the stone's metaphysical property)
- **Rarity:** Common, Uncommon, Rare, Legendary, Mythic
- **Health:** Based on Mohs hardness (1-10, scaled to 1-10 HP)
- **Attack:** Based on the stone's category (Silicates = 2, Oxides = 3, Carbonates = 1, etc.) + rarity modifier
- **Effect (Mind):** The stone's metaphysical property translated to a card ability
- **Synergy (Body):** The stone's healing property — a secondary ability that triggers under specific conditions
- **Optical Phenomenon:** Special ability (if the stone has one — chatoyancy, asterism, play of color, adularescence, color change)
- **Geo Region:** The stone's native zone — matters for zone-based board bonuses
- **Image:** The stone's AI-generated reference image

**Rarity modifiers:**
- Common: Base stats, simple effect
- Uncommon: +1 to either HP or Attack, slightly more complex effect
- Rare: +1 to both HP and Attack, complex effect + synergy
- Legendary: +2 to both HP and Attack, powerful unique effect + synergy
- Mythic: +3 to both HP and Attack, game-changing effect + synergy + optical phenomenon ability

### Element Charm Card Layout
- **Element Name:** Common name (Hydrogen, Carbon, Gold, etc.)
- **Symbol:** Chemical symbol (H, C, Au, etc.)
- **Atomic Number:** Z (1-118) — determines base power
- **Atomic Weight:** Converted to "Resonance Weight" (higher = more powerful effect)
- **Category:** Metal, Nonmetal, Metalloid, Noble Gas, Halogen, etc.
- **Attachment Effect:** What happens when attached to a stone
- **Connected Stones:** Which stones this element naturally bonds with (from ElementCharm entity)
- **Bond Bonus:** Enhanced effect when attached to a connected stone
- **Resonance Weight cost:** Higher-weight charms cost more Frequency Points to attach

### Quest Charm Card Layout
- **Charm Name:** The charm's name
- **Charm Type:** Token, Relic, Echo, Key, or Living
- **Frequency:** The charm's frequency alignment
- **Effect:** The charm's game effect
- **Lore:** One-line flavor text in the Inn's narrative voice
- **Earned By:** How this card is obtained (quest completion, not card packs)
- **Rarity:** Always Legendary or Mythic (these are special cards)

### NPC Card Layout
- **Name:** The NPC's name (name only — no pronouns or titles in card text)
- **Frequency:** The NPC's frequency alignment
- **Health:** NPC HP (separate from player HP)
- **Effect:** Active ability (triggered by the player)
- **Passive:** Ongoing effect while the NPC is on the board
- **Deathrattle:** Effect when the NPC is destroyed
- **Voice:** The NPC speaks in chat during the game using their established voice profile
- **Portrait:** The NPC's AI-generated portrait (Living/Shadow/In-Between depending on board state)

---

## 4. GAME MECHANICS

### The Board

Each player has:
- **5 stone slots** — where stone cards are placed
- **1 charm slot per stone** — where element/quest charms are attached
- **1 NPC slot** — where a single NPC ally resides
- **30 HP** — lose when health hits 0
- **Dissonance meter** — fills when frequency pairs clash. At 10 dissonance, take 5 damage and reset meter to 0
- **Frequency Points (FP):** Resource for playing cards. Start with 2 per turn, gain +1 each turn up to 10 max. Unused FP does not carry over (no hoarding)

### Card Costs
- **Stone cards:** Cost FP equal to their rarity tier (Common = 1, Uncommon = 2, Rare = 3, Legendary = 4, Mythic = 5)
- **Element charms:** Cost FP equal to their Resonance Weight tier (Light elements = 1, Medium = 2, Heavy = 3, Transuranic = 4)
- **Quest charms:** Cost 2 FP regardless of type (they are powerful but efficient)
- **NPC cards:** Cost 3 FP (significant investment — choose wisely)

### Board Zones
The board represents a Geode Inn zone. The zone is chosen by the hosting player or randomly selected in ranked play. Each zone has a passive effect (see Chapter 13).

---

## 5. THE FREQUENCY SYSTEM

This is the core differentiator from Hearthstone. Every card on the board generates a frequency. When frequencies interact, they create effects — both positive and negative.

### Stacking (Same Frequency)
When multiple cards of the same frequency are on your side of the board:

| Stack Size | Effect Name | Result |
|-----------|-------------|--------|
| 2 | **Duo** | +1 HP to all cards of that frequency |
| 3 | **Chord** | +1 HP and +1 Attack to all cards of that frequency |
| 4 | **Symphony** | +2 HP and +2 Attack to all cards of that frequency, and the effect cannot be silenced |
| 5 (all 5 slots) | **Crescendo** | All cards of that frequency gain Taunt and the opponent takes 1 dissonance damage per turn |

### Pairing (Opposite Frequencies)
When a card and its frequency pair are both on your board:

| Pair | Effect Name | Result |
|------|-------------|--------|
| GROW + STAY | **Dissonance** | Both cards take 1 damage. BUT: if you have 3+ of each, **Harmony** — no damage, both gain +1 HP |
| SENSE + NULL | **Revelation** | Reveal opponent's hand for 1 turn |
| SING + CALM | **Lullaby** | Opponent skips their next action phase |

### Cross-Frequency Interactions
Cards of different (non-paired) frequencies can still interact:

| Combo | Result |
|-------|--------|
| GROW + SING | **Wellspring** — Restore 2 HP to your NPC |
| GROW + SENSE | **Cultivation** — Draw 1 card |
| STAY + SENSE | **Fortification** — All STAY cards gain Shield (absorb next attack) |
| STAY + CALM | **Monument** — All STAY cards cannot be targeted by enemy effects this turn |
| SING + SENSE | **Harmonic Detection** — Reveal the top 3 cards of your deck |
| NULL + CALM | **Void Rest** — Destroy one of your own cards to heal 3 HP |
| NULL + SING | **Dischord** — Opponent's next card costs +1 FP |
| GROW + CALM | **Meditation** — Gain 1 extra FP next turn |
| GROW + NULL | **Wild Growth** — Summon a random Common stone with 1 HP |
| STAY + SING | **Anthem** — All allied cards gain +1 Attack this turn |
| SENSE + CALM | **Insight** — Look at opponent's deck, rearrange top 3 cards |
| NULL + SENSE | **Erase** — Remove one card from opponent's discard pile from the game |

### Zone Amplification
If the board zone matches a card's Geo Region, that card gains +1/+1 (HP and Attack) while on that board. This makes zone selection a strategic decision — pick a zone that amplifies your deck's stones.

---

## 6. ADVANCED COMBOS

### Family Resonance
Having 2+ stones from the same family on the board creates a Family Bonus:

| Family | 2 Stones | 3+ Stones |
|--------|----------|-----------|
| Quartz | +1 to SENSE effects | All SENSE effects trigger twice |
| Beryl | +1 HP to all allied cards | All allied cards heal 1 HP per turn |
| Feldspar | +1 to GROW effects | Summon a random Feldspar stone (1 HP) when one is destroyed |
| Tourmaline | +1 to NULL effects | NULL cards can attack twice per turn |
| Garnet | +1 to STAY effects | STAY cards gain Shield every turn |
| Corundum | +1 to SING effects | SING effects last 2 turns instead of 1 |
| Opal | +1 to optical phenomenon effects | Optical phenomena trigger on all allied cards, not just the opal |

### Charm Bonding
When an element charm is attached to one of its Connected Stones (from the ElementCharm entity):
- **Bond Bonus:** +2 HP to the stone, and the charm's effect becomes permanent (not one-time)
- **Double Bond:** If the stone's family matches the element's category (e.g., Copper charm on Malachite, which is a Copper carbonate), the effect is doubled

### NPC Synergy
NPCs interact with the frequency system:
- An NPC's frequency adds to the board's frequency count for stacking purposes
- If an NPC's frequency matches 3+ stones on the board, the NPC's effect triggers automatically each turn (no FP cost)
- If an NPC's frequency is the pair of 3+ stones, the NPC takes 1 damage per turn (dissonance) but its effect is doubled

### Quest Charm Multipliers
Quest charms modify the board state:
- **Token charms:** Provide a passive aura (+1 to a specific frequency's effects)
- **Relic charms:** Have a powerful ongoing effect (e.g., The Compass of the Navigator — once per turn, draw a card matching your most common frequency)
- **Echo charms:** Trigger a one-time dramatic effect (e.g., Echo of the First Song — heal all allied cards to full HP and clear dissonance meter)
- **Key charms:** Unlock special interactions (e.g., The Preseli Key — all STAY cards become immune to destruction for 3 turns)
- **Living charms:** Transform the board (e.g., Monsieur Sentient — all SING effects become permanent; The Hearth Ember — all CALM effects are doubled)

---

## 7. DISSONANCE MECHANICS

### Building Dissonance
Your dissonance meter fills when:
- You play a card whose frequency pairs with an opponent's card on the board (+1 dissonance)
- You destroy an opponent's card whose frequency matches your NPC's (+1 dissonance — the Inn dislikes discord)
- You roll a NULL effect that fails (+2 dissonance)
- The opponent triggers a Dischord combo against you (+1 dissonance)

### Dissonance Effects
| Meter Level | Effect |
|------------|--------|
| 1-3 | No effect — building tension |
| 4-6 | Your cards cost +1 FP to play (the noise makes concentration harder) |
| 7-9 | Your NPC's effect does not trigger (the NPC is overwhelmed by noise) |
| 10 | **Overload** — Take 5 damage, meter resets to 0 |
| 10 (3rd time) | **Total Overload** — Lose the game (alternative win condition) |

### Clearing Dissonance
- Play a CALM card: -2 dissonance
- Play a SING card: -1 dissonance
- Use a CALM charm effect: -3 dissonance
- End your turn without playing a card: -2 dissonance (meditation)
- Hearth Ember quest charm on the board: dissonance cannot exceed 5

---

## 8. THE CHORD (INSTANT WIN)

The rarest win condition: having one of each frequency (GROW, STAY, SENSE, SING, CALM, NULL) on your side of the board simultaneously.

This requires:
- 5 stone slots filled with 5 different frequencies
- An NPC card of the 6th frequency (or a charm that adds a 6th frequency to a stone)

When achieved, the Chord triggers:
- All 6 frequencies resonate in harmony
- The opponent's board is cleared
- The opponent takes 10 damage
- If this brings the opponent to 0 HP, you win by **Resonance Victory** (a special win with unique visual effects — the Inn's 42Hz tone plays)

The Chord is extremely rare and difficult to set up — it requires careful deck construction and board management. But it is the most satisfying win in the game.

**Chord Prevention:** The opponent can prevent a Chord by:
- Destroying one of the 6 frequency cards before the turn ends
- Silencing one of the cards (removing its frequency)
- Playing a NULL effect that disrupts the harmony

---

## 9. TURN STRUCTURE (DETAILED)

### Phase 1: Draw
- Draw 1 card from your deck
- Hand limit: 7 cards (if at 7, no draw)
- If your deck is empty, take 1 damage per turn (Fatigue)
- Fatigue damage increases by 1 each turn you cannot draw (1, 2, 3, 4...)

### Phase 2: Resonance (Playing Cards)
- Play stones, attach charms, play or replace your NPC
- Each action costs FP (see Card Costs in Chapter 4)
- You may play cards in any order
- Attaching a charm to a stone already on the board costs the charm's FP cost
- Replacing your NPC: The old NPC is destroyed (deathrattle triggers), and the new NPC is played in the same slot

### Phase 3: Action (Activating Effects)
- Activate stone effects, NPC abilities, and charm effects
- Each stone's Effect (Mind) can be activated once per turn unless stated otherwise
- NPC effects can be activated once per turn (unless the NPC synergy makes it automatic)
- Some effects are passive and do not need activation (Synergy/Body effects)
- You may choose NOT to activate an effect (strategic hold)

### Phase 4: Combat
- Each stone can attack once per turn
- Choose attacker and target (opponent's stone, opponent's NPC, or opponent directly)
- If attacking a stone: Compare Attack vs HP. If Attack >= HP, the stone is destroyed. Excess damage does NOT spill over.
- If attacking the opponent directly: Deal Attack damage to their HP. This only works if they have no cards with Taunt on the board.
- If attacking an NPC: NPCs can be targeted directly (they don't have Taunt by default unless their card says so)
- Defender's Shield absorbs the first attack (Shield is consumed, no damage taken)
- Armor reduces incoming damage by its value (Armor persists, Shield does not)

### Phase 5: End
- Check dissonance meter (apply effects if at threshold)
- Check for Chord (if all 6 frequencies present)
- Check for game end (either player at 0 HP, or Total Overload)
- Pass turn to opponent

---

## 10. COMBAT RULES

### Taunt
Cards with Taunt must be attacked before the opponent's other cards or HP. Multiple Taunt cards can be attacked in any order.

### Shield
Shield absorbs one attack completely. The Shield is consumed after the first attack, regardless of the attacker's power. Shield does not protect against effects — only against combat attacks.

### Armor
Armor reduces incoming attack damage by its value. Armor persists between attacks and turns. Armor does NOT protect against effect damage (dissonance, direct damage effects).

### Lifesteal
Cards with Lifesteal heal their controller for the amount of damage dealt. Healing goes to player HP, not card HP.

### Piercing
Cards with Piercing deal excess damage to the next target (if a stone is destroyed, leftover damage hits the opponent's HP). Rare ability — only on Mythic cards and specific Quest Charms.

### Petrify (STAY special)
Some STAY cards can Petrify an enemy card — the card is not destroyed but becomes unable to act, attack, or use effects for 2 turns. The petrified card still occupies a board slot. Petrify can be cleansed by a GROW effect.

### Silence
Some SENSE cards can Silence an enemy card — removing all effects, synergies, and special abilities. The card retains its base HP and Attack but becomes a vanilla card. Silence is permanent.

---

## 11. CHARM ATTACHMENT RULES

### Attachment Basics
- Each stone can have ONE charm attached at a time
- Attaching a new charm destroys the old one (no refunding FP)
- Charms cannot be attached to destroyed stones
- Charms are destroyed when their stone is destroyed (unless the charm says otherwise)

### Bond Rules
- When a charm is attached to one of its Connected Stones, the Bond Bonus activates (+2 HP, permanent effect)
- Bond Bonuses are visible on the board — the stone and charm glow with a shared resonance
- The opponent can see Bond Bonuses (no hidden information in Resonance)

### Charm Removal
- Some SENSE effects can detach charms (return to hand or destroy)
- Some NULL effects can corrupt charms (reverse their effect — a healing charm becomes a damage charm)
- Quest Charms cannot be removed or corrupted (they are permanent attachments)

### Multi-Element Bonding
- If a stone is connected to multiple elements (e.g., Malachite connects to Copper AND Carbon), attaching either charm grants the Bond Bonus
- Attaching both charms to the same stone is not possible (one charm per stone), but having both charms on different connected stones creates a **Mineral Bond** — both stones gain +1/+1

---

## 12. NPC CARD RULES

### NPC Basics
- Only one NPC per player on the board at a time
- NPCs have their own HP (separate from player HP and stone HP)
- NPCs can be attacked directly (they do not have Taunt unless their card says so)
- When an NPC is destroyed, its Deathrattle triggers
- NPCs cannot have charms attached (they are characters, not stones)

### NPC Abilities
Each NPC has three types of abilities:
- **Effect (Active):** Triggered by the player during the Action phase. Costs 0 FP but can only be used once per turn.
- **Passive:** Ongoing while the NPC is on the board. Always active.
- **Deathrattle:** Triggers when the NPC is destroyed.

### NPC Frequency Contribution
- An NPC's frequency counts toward board stacking (for Duo, Chord, Symphony, Crescendo)
- An NPC's frequency counts toward the Chord instant win condition
- An NPC's frequency can trigger pair effects (Dissonance, Revelation, Lullaby) if paired with a stone

### NPC Voice
During the game, NPCs speak in chat using their established voice profiles:
- Beverley: Clipped, dismissive, Australian accent. "I fail to see how that was necessary."
- The Crone: Cryptic, riddle-like. "What you seek is what you fear."
- Naut: Hushed, careful. "I found something in the restricted section. You didn't see me."
- Lozen: Direct, protective. "The Inn holds. I hold the Inn."
- Joe: Warm, encouraging. "Oh, that was lovely! Try again!"
- The Wanderer: Vague, testing. "You're learning. Or perhaps you're forgetting. Same thing, really."
- Medusa: Still, patient. "You move so much. Why not try staying?"
- Lark: Cheerful, helpful. "Welcome back! The Inn missed you."
- Mim: Mysterious, knowing. "Smoke reveals what fire hides."
- Briar Nightbloom: Professional, efficient. "New stock arrived. Try not to break this one."
- Quire: Nervous, hushed. "You shouldn't be here. But since you are..."
- The Allfather: Rare, weighted. "..."

---

## 13. BOARD ZONES (37 BOARDS)

Each of the 37 Geode Inn zones is a playable board with a unique passive effect:

| Zone | Board Effect | Visual Style |
|------|-------------|--------------|
| The Hearth | Both players gain +1 HP per turn | Van Gogh warm firelight |
| The Archive | Both players draw an extra card each turn | Klimt golden library |
| The Marketplace | Stones played from hand cost -1 FP (min 1) | Matisse spiral stalls |
| The Common Room | NPC effects trigger twice per turn | Matisse campfire glow |
| The Composer's Bench | Stone cards drawn are revealed to both players | Workshop amber light |
| The Modern Legends Nook | NULL effects have a 50% chance to fail | Magritte surreal shadows |
| The Campgrounds | Critter cards (special subset) gain +2/+2 | Rackham twisted roots |
| The Canopy | GROW cards gain +1/+1 on entry | Rackcanopy living wood |
| The Creature Ponds | When a stone is destroyed, summon a random Common critter (1 HP, 1 ATK) | Rousseau jungle pools |
| The Woodland Path | The Wanderer NPC costs 1 FP less | Rousseau forest path |
| The Observatory | All SENSE effects reveal 1 additional card | Dalí melting cosmos |
| The Celestial Garden | All frequency effects are doubled | Klimt golden gods |
| The Clockwork Vault | Turn timer reduced to 20 seconds. SING effects cost +1 FP | Escher recursive gears |
| The Navigator's Chart Room | Stones with Geo Region matching the board gain +2/+2 | Escher star charts |
| The Orrery | At turn 5, all stone positions are shuffled | Escher planetary gears |
| The Sky Bridge | Stones can attack from any slot (no adjacency rules) | O'Keeffe open sky |
| The Staircase | Every 3 turns, all cards' frequencies shift one step (GROW→STAY→SENSE→SING→CALM→NULL→GROW) | Klimt ascending corridor |
| Gorgon's Garden | STAY cards gain +2 HP. GROW cards take 1 damage on entry | Klimt stone garden |
| The Catacombs | Destroyed cards return with 1 HP 50% of the time | Doré cathedral shadows |
| The Undercity | STAY cards gain +1/+1. GROW effects are halved | Klimt Death+Life |
| The Bone Chess Room | When a stone is destroyed, the destroyer gains its Attack | Gorey bone board |
| The Dust Library | SENSE effects cost 0 FP. NULL effects cost +2 FP | Gorey dusty shelves |
| The Tidal Caves | Water-type stones gain +2/+2. Non-water stones take 1 damage per turn | Royo cave waters |
| The Loch Zone | Every 4 turns, a random water monster card is summoned for the player with fewer board cards | Gothic anime dark waters |
| The Whisper Mines | Both players' hands are visible to each other at all times | Doré mine echoes |
| The Forge Ruins | Playing a charm costs 0 FP (charms are forged here) | Klimt ruined forge |
| The Mirror Market | All card effects are mirrored — healing becomes damage, damage becomes healing | Magritte mirrors |
| The Threshold | No passive effect — neutral ground | Lee/Bauer misty border |
| The Summerlands | SING effects are doubled. SING cards gain +1/+1 | Lee golden green light |
| The Hollow | STAY effects are doubled. STAY cards gain +1/+1 | Bauer dark ice |
| The Between | Board effect changes randomly each turn (roll 1d6 for which zone effect applies) | Shifting landscape |
| The Crystal Gardens | NPC cards gain +3/+3. The Griffin NPC can be played here regardless of deck rules | O'Keeffe × Klimt crystal |
| The Stone Circle Chamber | All cards cost +1 FP. The Preseli Blue Stone card gains +5/+5 and Taunt | Book of Kells deep stone |
| The Water Zone | Water monsters can be played as stone cards (filling stone slots) | Gothic anime ocean |
| The Deep Trench | NULL cards gain +2/+2. All other cards take 1 damage per turn | Gothic anime abyss |
| The Coral Shelf | At turn 3, both players summon a random Rare coral-type stone (2 HP, 2 ATK) | Gothic anime reef |

---

## 14. DECK BUILDING

### Rules
- **Deck size:** 30 cards
- **Stone limit:** Max 2 of each stone
- **Charm limit:** Max 2 of each charm
- **Quest charm limit:** Max 1 of each (unique)
- **NPC limit:** Max 1 of each NPC
- **Frequency cap:** No more than 8 cards of any single frequency (prevents mono-frequency dominance)
- **Minimum rarity:** At least 10 cards must be Common or Uncommon (prevents all-Legendary decks)

### Deck Composition Guidelines
A balanced deck typically contains:
- 12-16 stone cards (the fighting force)
- 6-8 element charms (modifiers and bond bonuses)
- 2-4 quest charms (if owned — powerful but limited)
- 2-3 NPC cards (choose which one to play based on matchup)
- 4-6 flex slots (tech cards, reactive cards, or additional stones)

### Frequency Distribution
- **Mono-frequency (6-8 cards of one type):** Strong stacking bonuses but vulnerable to pair disruption and dissonance. High risk, high reward.
- **Duo-frequency (two main types, 5-8 each):** Balanced. Can trigger cross-frequency combos. Moderate dissonance risk.
- **Balanced (3-4 of each type):** Can attempt the Chord. No stacking bonuses. Low dissonance. High skill ceiling.
- **Chord deck (exactly 5 of each type):** Specifically built for the instant win. Extremely difficult to play. The ultimate flex.

---

## 15. STARTER DECKS

Three starter decks for new players:

### 1. The Builder's Hand (GROW-focused)
- 16 stones (10 GROW, 3 CALM, 3 SENSE)
- 6 charms (4 GROW-element, 2 CALM-element)
- 2 NPCs (Joe — GROW, Lark — SING)
- 6 flex stones (mix of Common/Uncommon)
- Strategy: Flood the board with GROW stones, stack for Bloom bonuses, heal with CALM support
- Key card: Moss Agate (Common, GROW, 7 HP) — "Green Thumb: Summon a random Common GROW stone (1 HP)"

### 2. The Sentinel's Watch (STAY-focused)
- 16 stones (10 STAY, 3 SENSE, 3 SING)
- 6 charms (4 STAY-element, 2 SENSE-element)
- 2 NPCs (Lozen — STAY, Beverley — SENSE)
- 6 flex stones
- Strategy: Build a wall of STAY stones with high HP and armor, wear down the opponent over time
- Key card: Black Onyx (Rare, STAY, 10 HP) — "Absorb: Take half damage from all sources. Cannot be Silenced."

### 3. The Scholar's Eye (SENSE-focused)
- 16 stones (10 SENSE, 3 NULL, 3 CALM)
- 6 charms (4 SENSE-element, 2 NULL-element)
- 2 NPCs (Beverley — SENSE, Naut — NULL)
- 6 flex stones
- Strategy: Control the board through information — reveal opponent's hand, silence key cards, disrupt their strategy
- Key card: Lapis Lazuli (Uncommon, SENSE, 5 HP) — "Insight: Reveal opponent's hand. Costs 0 FP if you have 3+ SENSE cards on board."

---

## 16. ARCHETYPES AND STRATEGIES

### Aggro: "The Wild Growth"
- Play low-cost GROW stones fast, flood the board, win before the opponent stabilizes
- Weak against: AoE clears, Taunt walls, dissonance disruption
- Strong against: Slow control decks, healing decks that can't keep up
- Key cards: Moss Agate, Bloodstone, Sunstone, Prasiolite

### Control: "The Sentinel's Patience"
- Survive early game with STAY walls and CALM healing, win late game with powerful Legendary drops
- Weak against: Fast aggro if it can't stabilize, mill decks
- Strong against: Aggro (once stabilized), combo decks that need time
- Key cards: Black Onyx, Garnet, Hematite, Jade

### Combo: "The Chord Seeker"
- Build toward the Chord instant win by carefully managing all 6 frequencies
- Weak against: Aggro (dies before assembling the Chord), disruption (losing one frequency breaks the combo)
- Strong against: Control (control decks give time to assemble), decks without removal
- Key cards: One strong card of each frequency, The Preseli Key (quest charm), Monsieur Sentient

### Midrange: "The Harmonic Path"
- Balanced deck that adapts to the opponent — aggressive against control, controlling against aggro
- Weak against: Nothing specifically, but master of nothing either
- Strong against: Predictable decks (can adapt)
- Key cards: Labradorite, Amethyst, Citrine, Aquamarine

### Mill: "The Whisper Layer"
- Force the opponent to draw cards rapidly, causing Fatigue damage when their deck empties
- Weak against: Aggro (dies before mill works), decks with few draw effects
- Strong against: Control (control decks draw a lot, so mill accelerates), decks that rely on specific cards (mill destroys their deck order)
- Key cards: Selenite (draw effects), Quire NPC (restricted knowledge — draw 2, take 1 dissonance), The Dust Library board

### Dissonance: "The Shadow Pressure"
- Force the opponent's dissonance meter to 10 three times for the Total Overload alternative win
- Weak against: CALM-heavy decks (they clear dissonance easily), aggro (dies before dissonance builds)
- Strong against: Control (slow games give time to build dissonance), decks that play many paired frequencies
- Key cards: NULL stones with Dischord effects, The Allfather NPC, The Mirror Market board

---

## 17. AI OPPONENTS

Each NPC in the Geode Inn can be an AI opponent with their own deck and playstyle:

| NPC | Deck Type | Playstyle | Difficulty |
|-----|-----------|-----------|------------|
| Beverley | Control | Silences player cards, reshuffles discard, wins by attrition | Medium |
| The Crone | Mirror | Copies player's moves, adapts to their strategy | Hard |
| Naut | Combo | Self-damages to draw cards, wins with explosive combos | Medium |
| Lozen | Defense | Heavy STAY cards, armored walls, wins by surviving | Medium |
| Joe | Aggro/Swarm | Low-cost GROW cards, floods the board, wins with numbers | Easy |
| The Wanderer | Balanced | Uses all six frequencies, unpredictable | Hard |
| Medusa | Lockdown | Petrifies player's cards (makes them unable to act), wins by stalling | Hard |
| Lark | Tutorial | Simple deck, teaches mechanics, always goes easy on new players | Easy |
| Mim | Disruption | Reverses effects, tricks with smoke and mirrors, unpredictable | Hard |
| Briar | Economy | Trades efficiently, always has the right charm for the situation | Medium |
| Quire | Mill | Draws rapidly, forces player to draw, causes Fatigue | Hard |
| The Allfather | Dissonance | Builds dissonance pressure, wins by Total Overload | Very Hard |
| The Griffin | Boss | Only appears in the Crystal Gardens board. Has +3/+3 on all cards. Must be harmonized with (reduced to 0 HP through SING attacks, not destroyed) | Boss |
| Malachi | Shadow | Plays in Shadow Mode rules (GROW cards debuffed, STAY cards buffed). Aggressive and punishing | Very Hard |
| The Morrigan | Mythic | Random deck each game. All cards are Mythic rarity. The ultimate challenge | Legendary |

### AI Difficulty Scaling
- **Easy:** AI makes suboptimal plays, does not use combos, plays cards in simple order
- **Medium:** AI uses basic combos, prioritizes board presence, plays charms on connected stones
- **Hard:** AI uses advanced combos, manages dissonance, targets key cards, adapts to player's deck type
- **Very Hard:** AI plays optimally, predicts player moves, uses all mechanics including Chord attempts
- **Legendary:** AI plays perfectly, uses zone effects strategically, never makes mistakes

### AI Implementation
The AI is a heuristic-based scoring system (not LLM — for speed and reliability):
1. Evaluate all possible plays this turn
2. Score each play based on: board impact, card advantage, dissonance management, combo potential
3. Execute the highest-scoring play sequence
4. Adjust scoring weights based on difficulty level
5. Higher difficulties consider opponent's likely responses

---

## 18. PROGRESSION AND REWARDS

### Level System
Players earn XP through playing games (win or lose):
- **Win:** 100 XP
- **Loss:** 30 XP
- **First win of the day:** +50 XP bonus
- **Completing a daily challenge:** 75 XP
- **Winning in Arena:** 150 XP per win

**Level Rewards:**
- Level 5: Free Uncommon card pack
- Level 10: Free Rare card pack + unlock Ranked mode
- Level 20: Free Legendary card + board skin
- Level 30: Free Mythic card
- Every 10 levels after: Choice of 1 Legendary card, 1 board skin, or 3 Rare packs

### Daily Challenges
- 3 challenges per day, rotating from a pool of 50+
- Examples:
  - "Win 2 games with a GROW-focused deck"
  - "Trigger 3 Chord combos in a single game"
  - "Win without playing any NPC cards"
  - "Clear your opponent's dissonance meter to 0 and win"
  - "Win a game in The Catacombs zone"
- Completing all 3 daily challenges: +1 card pack

### Weekly Events
- **The Resonance Festival:** All SING effects are doubled for the week. SING-focused decks dominate.
- **The Shadow Inn Week:** All games are played in Shadow Mode rules. STAY-focused decks dominate.
- **The Whisper Games:** Both players' hands are visible. Pure strategy, no hidden information.
- **The Chord Chase:** First player to achieve a Chord win each day gets a Mythic card pack.
- **The Fae Tournament:** Only Fae Kingdom boards are in rotation. Seelie and Unseelie decks clash.

---

## 19. RANKED MODE

### Ranks
| Rank | Tier | Stars to Advance | Reward |
|------|------|-----------------|--------|
| Bronze | I, II, III | 3 stars per tier | Basic card pack |
| Silver | I, II, III | 3 stars per tier | Uncommon card pack |
| Gold | I, II, III | 4 stars per tier | Rare card pack |
| Crystal | I, II, III | 4 stars per tier | Rare pack + board skin |
| Diamond | I, II, III | 5 stars per tier | Legendary card pack + exclusive Quest Charm |
| Geode | I (single tier) | 10 stars | Mythic card + exclusive cosmetic + title "Innkeeper" |

### Star System
- Win: +1 star (or +2 if on a 3+ win streak)
- Loss: -1 star (no star loss at Bronze I, the floor)
- At Crystal and above: Loss can cause demotion to previous tier
- At Geode: No demotion within the season, but stars reset at season end

### Season Structure
- Each season is 28 days (matching the Egg Hatchery cycle)
- At season end: Rewards based on highest rank achieved
- Rank reset: Drop 4 tiers from end-of-season rank (a Diamond I player resets to Crystal I)
- Top 100 Geode rank players: Featured on the Leaderboard entity and the Inn's "Wall of Keepers"

### Ranked Rewards
| End-of-Season Rank | Reward |
|--------------------|--------|
| Bronze | 1 Basic pack |
| Silver | 2 Uncommon packs |
| Gold | 3 Rare packs + 1 board skin |
| Crystal | 3 Rare packs + 1 Legendary card + board skin |
| Diamond | 2 Legendary packs + exclusive Quest Charm + board skin |
| Geode | 1 Mythic card + exclusive Quest Charm + exclusive board skin + "Innkeeper" title |

---

## 20. ARENA MODE

### How It Works
1. **Entry:** Free (1 entry per day) or 2 Rare card packs (additional entries)
2. **Draft:** Choose 1 of 3 cards, 30 times, to build a deck
   - Draft pool: All stones, charms, and NPCs (no Quest Charms in Arena)
   - Rarity distribution: 60% Common, 25% Uncommon, 12% Rare, 3% Legendary
3. **Play:** Match against other Arena players with similar records
4. **End:** Run ends at 3 losses or 12 wins
5. **Rewards:** Scale with wins

### Arena Rewards
| Wins | Reward |
|------|--------|
| 0-2 | 1 Basic card pack |
| 3-5 | 1 Uncommon pack + 1 Basic pack |
| 6-8 | 1 Rare pack + 1 Uncommon pack + 50 dust |
| 9-11 | 2 Rare packs + 1 Legendary card + 100 dust |
| 12 | 1 Mythic card + 1 Legendary pack + 200 dust + exclusive Arena board skin |

### Arena-Specific Rules
- No deck building — you draft what you get
- No Quest Charms (they are quest-earned only)
- Zone is randomly selected each game
- NPC cards appear in the draft but are less common (10% chance per pick)

---

## 21. HARMONY MODE (2v2, FUTURE)

### Concept
Two players team up against two opponents. Each player has their own board (5 stones, 1 NPC, 30 HP), but they share a dissonance meter and can trigger cross-board combos.

### Shared Elements
- **Dissonance meter:** Shared between teammates. Both contribute, both suffer.
- **Frequency stacking:** Counts across both boards (a Duo on board A + 1 matching frequency on board B = a Chord across the team)
- **Cross-board combos:** Teammates can trigger combos using cards on both boards
- **Shared FP:** Each player has their own FP, but they can gift 1 FP per turn to their partner

### Team Combos
- **Duet:** Both teammates play the same frequency card in the same turn — both cards gain +1/+1
- **Harmony Bridge:** If teammate A has a GROW card and teammate B has a STAY card, and both are on boards with the same zone, Harmony triggers (no dissonance, both gain +1 HP)
- **Chord of Six:** The team Chord requires all 6 frequencies across BOTH boards (easier than solo Chord, but requires coordination)

### Release Status
Harmony Mode is a planned post-launch feature. The core 1v1 game ships first.

---

## 22. CARD ACQUISITION

### Card Packs
- **Basic Pack (5 cards):** 4 Common, 1 Uncommon. Cost: 50 dust or earned through play.
- **Uncommon Pack (5 cards):** 3 Common, 1 Uncommon, 1 Rare (guaranteed). Cost: 100 dust.
- **Rare Pack (5 cards):** 2 Common, 1 Uncommon, 1 Rare, 1 Legendary (guaranteed). Cost: 300 dust.
- **Legendary Pack (5 cards):** 1 Common, 1 Uncommon, 1 Rare, 1 Legendary, 1 Mythic (guaranteed). Cost: 800 dust.
- **Mythic Pack (3 cards):** 3 Mythic cards. Cost: 2000 dust. Rarely available — appears during special events only.

### Earning Packs
- 1 pack per 3 wins (max 3 packs per day from wins)
- 1 pack per daily challenge completed (max 3 per day)
- 1 pack per Arena entry completion
- 1 pack per weekly event participation
- 1 pack per quest completed in the tabletop questline (cross-game reward)

### Quest Charms
Quest Charms are NOT in card packs. They are earned by:
- Completing tabletop questline chapters
- Reaching Diamond rank or higher in Ranked mode (one exclusive charm per season)
- Completing special event challenges
- Achieving specific milestones (e.g., "Win 100 games" grants a specific charm)

---

## 23. CARD CRAFTING

### Dust System
- **Dusting a card:** Destroys it for dust
  - Common: 5 dust
  - Uncommon: 20 dust
  - Rare: 50 dust
  - Legendary: 200 dust
  - Mythic: 800 dust
  - Quest Charm: Cannot be dusted (unique)

- **Crafting a card:**
  - Common: 25 dust
  - Uncommon: 75 dust
  - Rare: 200 dust
  - Legendary: 600 dust
  - Mythic: 2400 dust
  - Quest Charm: Cannot be crafted (quest-earned only)

### Golden Cards
- Golden cards are cosmetic variants with animated art (the stone's frequency visually pulses)
- Golden cards cost 2× the normal crafting cost
- Dusting a Golden card gives 2× the normal dust
- Golden cards have no gameplay advantage — they are purely cosmetic
- A full Golden deck is a significant status symbol

---

## 24. COSMETICS

### Board Skins (from BoardSkin entity)
- Each board skin changes the visual appearance of the game board
- Board skins do NOT change the zone effect (that's determined by the zone, not the skin)
- Default skin: "The Hearth" (warm amber, simple wood grain)
- Unlockable skins: Stone textures, metal textures, fae crystal textures, shadow ice textures
- Seasonal skins: Released during weekly events
- Geode rank exclusive: "The Geode" — crystalline purple with pulsing golden veins

### Tray Templates (from TrayTemplate entity)
- The "tray" is the area where your hand of cards is displayed
- Different tray templates change the visual style of the card backs and hand area
- Default: Simple dark wood with gold trim
- Unlockable: Stone-carved, crystal-embedded, fae-woven, shadow-frosted

### Card Backs
- Earned through achievements, ranks, and events
- Visual flair on the back of your cards (visible to your opponent)
- Examples: Antikythera mechanism, Celtic knotwork, Fae sigil, Shadow Inn crest, Geode crystal

### Emotes
- Each NPC has a set of emotes that can be used during games
- Beverley: *rolls eyes*, *shushes*, *reshuffles dismissively*
- The Crone: *winks*, *speaks in riddle*, *vanishes*
- Lozen: *stands ground*, *guards*, *nods respectfully*
- Joe: *waves enthusiastically*, *shows off creation*, *offers tea*
- No emote spam — 3-second cooldown between emotes to prevent harassment

---

## 25. TECHNICAL IMPLEMENTATION

### Platform
- **Primary:** Base44 web app with real-time backend functions
- **Future:** Godot desktop client for offline play vs AI
- **Future:** Mobile app (React Native or Godot mobile export)

### Data Sources (all entities already exist)
- **Stone entity (198 cards):** Name, Family, Category, Hardness, Mind, Body, OpticalPhenomenon, GeoRegion, ImageFile — all mapped directly to card fields
- **ElementCharm entity (118 cards):** ElementName, Symbol, AtomicNumber, AtomicWeight, ElementCategory, CharmDescription, ConnectedStones — all mapped to charm card fields
- **QuestCharm entity (45 cards):** CharmName, CharmType, Description, EarnedFrom, NPCConnection, RewardEffect, Rarity — all mapped to quest charm fields
- **Dialogue entity (NPC flavor):** NPC lines used for card text and in-game chat
- **BoardSkin entity:** Cosmetic board appearances
- **TrayTemplate entity:** Cosmetic hand area appearances
- **Leaderboard entity:** Ranked scores and Arena records
- **EggHatch entity:** Retired characters can become special NPC cards in Resonance

### Real-Time Multiplayer
- Backend functions handle matchmaking and game state
- Each turn is a backend function call that validates the move and updates game state
- Game state stored in a temporary record (not the main database — games are ephemeral)
- Disconnection handling: If a player disconnects, they have 60 seconds to reconnect. After that, the opponent can claim victory.

### AI Implementation
- Heuristic-based scoring system (not LLM)
- Evaluates: board state, card advantage, dissonance level, combo potential, opponent's likely response
- Difficulty levels adjust the scoring weights and look-ahead depth
- AI responds within 2 seconds for smooth gameplay
- AI uses NPC voice profiles for chat messages (pre-written lines, not generated)

### Art Assets (all exist)
- Stone card art: 198 AI-generated stone images (in the database)
- NPC card art: 142 NPC portraits (Living/Shadow/In-Between variants for visual variety)
- Board art: 37 zone images
- Charm card art: 5 alchemical emblems + element-specific designs needed
- Card frames: Gold/brass frames matching the Inn's aesthetic (need design)

---

## 26. CARD BALANCE PRINCIPLES

### Design Philosophy
1. **No card is strictly better than another at the same cost.** Every card has strengths and weaknesses.
2. **Frequency interactions matter more than raw stats.** A well-played combo beats a pile of expensive cards.
3. **The Chord is rare but achievable.** It should happen in roughly 1 in 100 games. When it does, it's a story.
4. **Dissonance is a real threat.** Players cannot ignore it. A deck that ignores dissonance management will lose.
5. **Quest Charms are powerful but fair.** They are earned through effort, not luck, and they have counters.
6. **The Inn respects the player.** No mindless RNG. Random effects are limited and always have a logic (e.g., "random GROW stone" pulls from GROW-frequency stones, not all stones).

### Balance Testing
- **Internal playtesting:** 50 games per matchup combination before launch
- **Automated testing:** AI vs AI simulation (1000 games per patch) to detect win rate outliers
- **Community feedback:** Post-launch balance council (top 100 Geode rank players get a balance feedback channel)
- **Patch cadence:** Monthly balance patches, emergency patches for game-breaking issues

### Banned and Restricted List
- No bans at launch — the card pool is new
- If a card proves problematic: First, adjust its stats. Second, restrict it (1 per deck instead of 2). Third, ban it from Ranked (still playable in Casual).
- Quest Charms are never banned (they are earned, not pulled from packs — banning them would punish effort)

### Power Level by Rarity
| Rarity | Stat Total (HP + ATK) | Effect Complexity | Expected Impact |
|--------|----------------------|-------------------|-----------------|
| Common | 3-5 | Simple (1 sentence) | Filler / utility |
| Uncommon | 4-7 | Moderate (1-2 sentences) | Solid role player |
| Rare | 6-9 | Complex (2-3 sentences + synergy) | Deck centerpiece |
| Legendary | 8-12 | Very complex (unique effect + synergy) | Win condition |
| Mythic | 10-15 | Game-changing (unique + optical phenomenon) | Format-defining |

---

*"Every stone has a frequency. Every frequency has a pair. The game is not about having the most powerful cards — it's about understanding how frequencies interact. The player who listens wins."*

**— Resonance, v2.0 Complete Spec**
*Written in the voice of six: Rothfuss (precision), Pratchett (warmth), Gaiman (mythic weight), Asimov (structural logic), Bradbury (the fire that doesn't burn), and Weir (the math that proves the fire was never going to go out).*
