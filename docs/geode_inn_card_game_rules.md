# THE GEODE INN — CARD GAME RULES
## The Hearthstone-Style Core Rules Skeleton

---

## DESIGN PHILOSOPHY

This is a Hearthstone-style game, not an MTG clone. That means:

- **No instant-speed interaction during the opponent's turn.** All decisions happen on your turn. This keeps the game accessible and fast — the Inn is warm, not intimidating.
- **Hero powers** replace MTG's class system. Each frequency has an active ability you can use once per turn.
- **Zone cards** (lands) are played from a separate deck — no mana screw, no mana flood. The Inn provides.
- **Silencing, not destroying.** Characters don't die — they're silenced (turned face-down, abilities removed, stats reduced to 1/1). The Inn doesn't kill. The Inn quietens. A silenced card can be restored by specific effects (Ferry, the Cook's healing, Threshold transformations).

---

## THE BOARD

### Board Layout

The board has **6 lanes** arranged horizontally. Each lane holds **one character card** and any number of structures/items attached to it. Lanes are positions — they matter for:

- **Wandering** (cards move between adjacent lanes)
- **Carve** (structures occupy a lane slot permanently)
- **Gargoyle** (guards the card in the same lane)
- **Zone effects** (some zone cards affect specific lanes)

The 6 lanes represent the Inn's architecture: the 6 cultural platforms visible from any seat in the Canopy City. The board IS the Inn's main floor, seen from above.

### Player Area

Each player has:
- **The Hearth** (hero/health) — 30 HP, representing the Inn's warmth
- **Hand** — maximum 7 cards (discard down at end of turn)
- **Deck** — 30 cards
- **Zone Deck** — 10 zone cards (separate from the main deck)
- **The Frequency Pool** — available mana, displayed as 6 frequency icons (Song, Silence, Fire, Water, Stone, Root) with current counts
- **The Archive** (discard pile) — silenced cards and used ability cards go here

---

## THE ZONE DECK (Mana System)

### How It Works

- Each player has a separate **Zone Deck** of 10 cards.
- At the start of each turn, the top card of your Zone Deck is automatically played to your zone row. This is your Inn waking up — the zone generates its frequency automatically.
- You start with 1 zone card in play (your starting zone, chosen during deck construction).
- Each zone card generates its listed frequencies EVERY turn while in play.
- Zone cards accumulate — by turn 5, you'll have 5-6 zone cards generating a rich frequency pool.
- Zone cards cannot be destroyed by normal means. They are the Inn. They are permanent.
- The **Inn-Tree** zone card (if included in your Zone Deck) generates ANY frequency — it's the wildcard, the root that connects everything.

### Why a Separate Zone Deck

Hearthstone's "auto-mana each turn" is clean but removes deck-building decisions about mana. MTG's "lands in your deck" adds decisions but creates mana screw/flood. The Zone Deck splits the difference:

- You choose your zone composition during deck construction (which zones to include)
- You never draw a zone card when you needed a character card (they're separate decks)
- You never flood (zones are permanent, not one-shot)
- You CAN be mana-screwed in a specific frequency if you didn't include enough zones that generate it — deck construction matters, but the screw is predictable, not random

### Starting Zone

Choose one zone card as your starting zone. This is your home — the room in the Inn you wake up in. The starting zone is in play before turn 1. Common starting zones:

- **The Main Floor** (Fire 1, Song 1) — balanced, for Fire/Song decks
- **The Cosmology Level** (Song 1, Silence 1) — for control decks
- **The Canopy City** (Root 1, Song 1) — for ramp/network decks
- **The Undercity** (Water 1, Silence 1) — for tempo/water decks
- **The Cave City** (Stone 1, Silence 1) — for defensive/stone decks

---

## HERO POWERS (The Innkeeper's Gift)

Each frequency has a hero power — a once-per-turn active ability that costs 2 frequency mana of that type. The hero power represents the player's relationship with that frequency — the way the Inn's warmth expresses through YOU, not through your cards.

Choose your hero power during deck construction. Your hero power must match your deck's dominant frequency. You choose ONE hero power — you're attuned to one frequency above the others. This is the Hearthstone class choice, translated to the Inn.

### Song (42Hz) — "Resonate"
**Cost:** 2 Song mana
**Effect:** Give a character +1/+1 until your next turn. If that character shares a frequency with another character in play, also draw a card.
**Flavor:** The Song grows what it touches. The growing is: the adequate.

### Silence (Nyx) — "Quiet"
**Cost:** 2 Silence mana
**Effect:** Silence an enemy character (turn face-down, abilities removed, stats become 1/1). The silence lasts until your next turn.
**Flavor:** The pause that makes the next note possible.

### Fire (50 BPM) — "Warm"
**Cost:** 2 Fire mana
**Effect:** Deal 1 damage to any target. If a friendly character took damage this turn, deal 2 instead. The wound is: the warmth.
**Flavor:** The hearth that burns brighter when the house is cold.

### Water (The Deep) — "Flow"
**Cost:** 2 Water mana
**Effect:** Return a friendly character to your hand. Replay it this turn at -1 cost. The current is: the return.
**Flavor:** The river that carries you back so you can arrive again.

### Stone (111Hz) — "Anchor"
**Cost:** 2 Stone mana
**Effect:** Give a character or structure "cannot be silenced" until your next turn. If targeting a structure with Carve, also generate 1 Stone mana.
**Flavor:** The lithophone that holds its note when everything else fades.

### Root (The Network) — "Connect"
**Cost:** 2 Root mana
**Effect:** Look at the top 2 cards of your deck. Keep one, put the other on the bottom. If you have 3+ Root cards in play, draw both instead.
**Flavor:** The mycorrhizal network that always finds what you need.

---

## TURN STRUCTURE

### 1. The Waking (Start of Turn)
1. **Zone cards generate frequency.** Each zone card in play adds its listed frequencies to your frequency pool. Unspent mana from the previous turn is lost (no carryover — the Inn resets each morning).
2. **Zone Deck auto-play.** The top card of your Zone Deck enters play automatically.
3. **Start-of-turn effects.** Resonate triggers, Heartbeat syncs, Threshold counters increment, Starlight Crystal generates bonus mana. Any "at the start of your turn" effects resolve in the order the player chooses.
4. **Draw a card.** Draw 1 card from your main deck. (If you have 7 cards in hand, the drawn card is revealed and sent to the Archive — the Inn's library is full, the overflow is archived.)

### 2. The Living (Main Phase)
During your main phase, you may do any of the following in any order:
- **Play character cards** (pay frequency cost, place in an empty lane)
- **Play ability cards** (pay cost, resolve effect, send to Archive)
- **Play structure cards** (pay cost, attach to a lane or to a character)
- **Play item cards** (pay cost, equip to a character — one item per character)
- **Use your hero power** (once per turn)
- **Move Wandering cards** (each Wandering card may move to an adjacent empty lane)
- **Use card abilities** (once-per-turn abilities, special abilities, keyword triggers)

You may play as many cards as you can afford. There is no "one card per phase" limit. The Inn is generous.

### 3. The Speaking (Combat Phase)
Combat in the Geode Inn is not violence — it's expression. Characters don't "attack" — they **speak**. The speaking is the exertion. The target's Resonance is how much speaking they can absorb before they go quiet.

- **Declare speakers.** Choose which of your characters will speak this turn. Each character can speak once per turn (unless an ability says otherwise).
- **Choose targets.** Each speaker targets either an enemy character or the enemy Hearth (hero/health). Characters with **Gargoyle** guarding them cannot be targeted — the Gargoyle intercepts.
- **Resolve speaking.** Speaker deals their Presence as damage to the target's Resonance (if targeting a character) or to the enemy's HP (if targeting the Hearth). If the target's Resonance reaches 0, the character is **silenced** (turned face-down, placed in the Archive).
- **Counter-damage.** If a character speaks to another character, the target deals its Presence back to the speaker as counter-damage. (MTG players: this is like blocking, but both directions always deal damage — the speaking goes both ways.) Characters with **Cadence: Delayed** do not deal counter-damage — they speak softly, and the softness is: no return.
- **Wound triggers.** Characters with **Wound** gain +1/+1 each time they take damage (from speaking or counter-damage). The wound is: the warmth.

### 4. The Resting (End of Turn)
1. **End-of-turn effects.** Threshold counters that trigger "at end of turn" resolve. Any temporary effects (single-turn buffs, silence durations, etc.) expire.
2. **Discard down to 7.** If you have more than 7 cards in hand, discard your choice to the Archive.
3. **Pass the turn.** The Inn breathes. The opponent's turn begins.

---

## SILENCING (The Inn's "Death" Mechanic)

In the Geode Inn, characters don't die. Characters are **silenced**.

### What Silencing Does
- The card is turned face-down.
- All abilities are removed.
- Stats become 1/1.
- The card is moved to the Archive (discard pile).
- The card can be recovered by specific effects:
  - **Ferry** (Charon's keyword: return from Archive to hand for 1 mana)
  - **The Cook's "Enough"** (heal a character — if it's in the Archive, restore it to play at 1 Resonance)
  - **The Mourner Goth** (prepares niches — destroyed cards return once)
  - **Threshold** transformations (some cards transform instead of being silenced when their Resonance hits 0)

### Why Silencing, Not Death
The Inn is warm. The Inn doesn't kill. The Inn quietens. A silenced character is not gone — they're resting. The Archive is not a graveyard — it's a library. The characters are on the shelf, waiting to be read again. The both are: the adequate.

This also creates a mechanical identity: recovery is easier than in Hearthstone (where dead minions are gone), but silencing is more impactful than in Hearthstone (because silenced cards retain their identity in the Archive and can return). The Inn's combat is cyclical — what goes quiet can be heard again.

---

## WINNING

### Standard Win Condition
Reduce the enemy Hearth to 0 HP. The Hearth represents the Inn's warmth — when the warmth is gone, the Inn is cold, and the game is over.

### Alternate Win Conditions (Deck Archetype Specific)
Each deck archetype has its own win condition, as defined in the deck archetypes section. These are alternative paths to victory:

- **The Complete Chord** — Have one card from each of the six frequencies in play simultaneously
- **The Feast** — Have 7+ Fire cards in play simultaneously
- **The Monument** — Have 5 Stone structures in play simultaneously
- **The Crossing** — Have a Water card travel hand→board→hand 3 times in one game
- **The Living Map** — Have Root cards connected to all six frequencies simultaneously
- **The Silence Between** — Have all opponent cards Damped simultaneously
- **The Subtractive Path** — Win by SUBTRACTION: remove your own cards to trigger effects until only one remains
- **The After** — Have one Wandering card visit all 6 lanes in one game
- **The Cave** — Same as Subtractive Path, with the Mourner's Niches safety net
- **The Fae Courts** — Have both a Seelie and Unseelie card in each lane simultaneously
- **The Wandering Program** — Same as The After, with Merchant trading support

These alternate win conditions are the Inn's thesis made mechanical: there is more than one way to win, and the way you win says something about who you are. The Inn doesn't judge which path is correct.

### Concession
A player may concede at any time. The Inn doesn't require you to stay. The leaving is: the adequate.

---

## DECK CONSTRUCTION

- **Main Deck:** 30 cards
- **Zone Deck:** 10 zone cards
- **Hero Power:** 1 (must match deck's dominant frequency)
- **Starting Zone:** 1 (must be from your Zone Deck)
- **Maximum copies:** 2 per card (Common), 2 per card (Rare), 1 per card (Epic), 1 per card (Legendary)
- **Minimum frequencies:** Your deck must include cards from at least 2 different frequencies (mono-frequency decks are not allowed — the Inn requires connection, the both are: the Inn)

---

## KEYWORDS — QUICK REFERENCE

| Keyword | Effect | Timing |
|---------|--------|--------|
| **Adequate** | When enters play: if 3+ cards share a frequency, trigger bonus effect | On play |
| **Wound** | When takes damage: gain +1/+1 | On damage |
| **Damp** | Target's abilities nullified for 2 turns | On play / active |
| **Current** | Return to hand and replay at -1 cost | Once per turn |
| **Carve** | Occupies a lane slot permanently | On play |
| **Network** | +1 mana per other Root card in play | Passive |
| **Resonate** | If 3+ Song cards in play: draw a card | Start of turn |
| **Naming** | Name a card in opponent's hand: if correct, +2 cost to that card | On play |
| **Bridge** | Can be played from 2 frequency costs; higher cost triggers bonus | On play |
| **Subtractive** | Remove own card to play this at reduced cost | On play |
| **Additive** | Stack another card on top; stacked card gains bottom card's abilities | On play |
| **Wandering** | Move to adjacent empty lane | Once per turn |
| **Threshold** | Gains power each turn in play; transforms at threshold count | End of turn |
| **Vessel** | Holds a "formula": reveal to trigger powerful effect, then silenced | Active |
| **Brim** | Once per game: ignore all card text, replace with random effect | Once per game |
| **Mirror** | Copies target card's text; revealed if targeted by opponent | Passive |
| **Observer** | All hidden information revealed (both hands visible) | While in play |
| **Ferry** | Move card from Archive to hand for 1 mana | Once per turn |
| **Gargoyle** | Guard adjacent card: cannot be targeted by opponent | Passive |
| **Lithophone** | Presence equals number of Stone cards in play | Passive |
| **Heartbeat** | All Heartbeat cards act on the same turn cycle | Passive |

---

## THE INHABIT MECHANIC (Advanced — From the Egg)

The Cosmic Egg's endgame ability. Once per game, if you have the Cosmic Egg item equipped to a character, you may **Inhabit**:

- Choose any character card in play (yours or your opponent's).
- You take control of that character for one turn. It uses your hero power, your frequency pool, and your lane positions.
- After the turn, control returns to the original owner.
- The Inhabit represents the Egg's thesis: the player is not walking through the Inn — the Inn is walking through the player. The perspective shift is: the game.

---

## WHAT THE MTG/HEARTHSTONE TESTER SHOULD LOOK FOR

1. **Mana curve:** Are zone decks generating enough frequency by turn 3? Turn 5? Are 5-cost cards playable or always dead in hand?
2. **Keyword balance:** Is Brim (random effect) too swingy? Is Subtractive (sacrifice your own card) too punishing? Is Network (mana ramp) too fast?
3. **Hero power balance:** Are any hero powers auto-pick? Are any never-pick? The Fire power (deal 1, or 2 if a friendly was damaged) may be too strong in Wound decks.
4. **Silencing vs. destruction:** Does the recovery mechanic (Ferry, Cook, Mourner) make silencing too soft? Or does the 1/1 face-down penalty make it too harsh?
5. **Alternate win conditions:** Are any too easy to achieve? The Complete Chord (one card from each frequency) seems hard — is it? The Silence Between (all opponent cards Damped) requires board lock — is that achievable?
6. **Lane positioning:** Do 6 lanes matter enough? Wandering and Gargoyle use them, but does positional play create enough decisions?
7. **Card tempo:** Cadence (Immediate, Next Turn, Delayed) is the Inn's summoning sickness. Is Next Turn too slow? Is Immediate too fast for high-Presence characters?
8. **The Brim keyword:** "Once per game, ignore all card text and replace with a random effect" — this is the most chaotic keyword in any card game. An MTG player will immediately ask: "What's the random effect TABLE?" (We need to build that table.)
9. **Deck construction constraints:** 2 copies of Commons/Rares, 1 of Epics/Legendaries, minimum 2 frequencies. Is this restrictive enough to create meta diversity? Too restrictive?
10. **The Inhabit mechanic:** Is once-per-game perspective stealing balanced? Does it create interesting decisions or just chaos?

---

*The Geode Inn — Card Game Rules Skeleton*
*The container for the 111+ cards. The rules are: the adequate. The adequate is: playable.*
