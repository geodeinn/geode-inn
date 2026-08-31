# Geode Inn Tabletop — Digital Companion App

## Overview

A web app that serves as the digital companion to the Tabletop Questline. Replaces physical cards and dice for digital play, tracks stone collection across all Geode Inn games, and provides GM tools for running sessions.

## Platform

Built as a Base44 web app. All card data already exists in the database entities (Stone, ElementCharm, QuestCharm, BoardSkin, Dialogue, Leaderboard).

## Route Structure

### Player Tools
- `/companion` — Home dashboard (collection stats, recent sessions, quick links)
- `/companion/cards` — Card browser (all 361 cards with filters)
- `/companion/decks` — Deck builder (save and manage decks)
- `/companion/dice` — Virtual Frequency Dice roller
- `/companion/collection` — Stone collection tracker (syncs with all games)

### GM Tools
- `/companion/gm` — GM dashboard (session prep, NPC lookup, zone info)
- `/companion/gm/quests` — Quest builder (create custom questlines)
- `/companion/gm/npcs` — NPC directory (all 45+ NPCs with dialogue, voice profiles)
- `/companion/gm/zones` — Zone reference (all 37 zones with map, encounters, stones)

---

## Feature Specs

### 1. Card Browser (`/companion/cards`)

**Layout:** Grid of card thumbnails, 5 columns desktop, 2 mobile
**Filters:**
- Card type: Stone / Element Charm / Quest Charm
- Frequency: GROW / STAY / SENSE / SING / CALM / NULL
- Rarity: Common / Uncommon / Rare / Legendary
- Zone: dropdown of all 37 zones
- Search: by name

**Card detail view (click a card):**
- Full card art (large)
- All card text (name, family, frequency, rarity, hardness, mind, body, geo region, zone)
- For Element Charms: symbol, atomic number, atomic weight, connected stones, bond bonus
- For Quest Charms: lore quote, earned from, story thread, reward effect
- "Add to Deck" button (if in deck builder mode)

### 2. Deck Builder (`/companion/decks`)

**Layout:** Two-panel — card browser on left, deck composition on right
**Rules enforced:**
- 30 cards exactly
- Max 2 of each Stone
- Max 2 of each Element Charm
- Max 1 of each Quest Charm
- Max 1 of each NPC
- Max 8 cards of any single frequency
**Save:** Decks saved to a new `Deck` entity (to be created)
**Share:** Export deck list as text or shareable URL

### 3. Virtual Frequency Dice (`/companion/dice`)

**Layout:** Large 3D-style dice on screen, roll button
**Features:**
- Roll 1-6 dice
- Results shown as frequency symbols (not numbers)
- Haptic feedback on mobile (short vibration per die)
- Roll history (last 10 rolls)
- "Frequency Check" mode — roll and see if you hit a target frequency
- Sound: stone clatter on roll, frequency chime on result

### 4. Stone Collection Tracker (`/companion/collection`)

**Layout:** Grid of all 198 stones, colored by collection status
**Features:**
- Collected (green), Seen but not collected (yellow), Unknown (gray)
- Click a stone to see full details + which game/zone it comes from
- Progress bar: "147/198 stones collected"
- Sync with PlayerProgress entity (stonesCollected field)
- Sync with PlayerInventory entity (items collected across games)
- Filter by: stone family, rarity, zone, collected status

### 5. GM Dashboard (`/companion/gm`)

**Layout:** Tabbed interface
**Tabs:**
- **Session Prep:** Select zone → see available encounters, NPCs, stones, map reference
- **NPC Quick Reference:** Search NPCs by name, see dialogue snippets, voice profile, zone assignment
- **Zone Reference:** All 37 zones with: map thumbnail, artist style, frequency, encounter types, stone sources, connected zones
- **Dice Roller:** Same as player dice, but with GM-specific options (hidden rolls, group rolls)
- **Dissonance Tracker:** Track party dissonance during a session — add/remove dissonance points, see effects at each threshold

### 6. Quest Builder (`/companion/gm/quests`)

**Layout:** Form-based quest creation tool
**Fields:**
- Quest name
- Zone (dropdown)
- Hook (text — what starts the quest)
- Descent (text — the challenge)
- Discovery (text — what they find)
- Echo (text — what changes after)
- Reward (stone or charm)
- NPC involvement (multi-select)
- Recommended frequency (dropdown)
- Difficulty (1-5)
**Save:** Custom quests saved to a new `CustomQuest` entity
**Export:** Print-ready quest card

---

## New Entities Needed

### Deck
- `playerId` (string) — who owns the deck
- `playerName` (string) — display name
- `deckName` (string) — user-named
- `cards` (array of objects) — [{cardType, cardId, cardName, quantity}]
- `frequencyBalance` (object) — {GROW: int, STAY: int, SENSE: int, SING: int, CALM: int, NULL: int}
- `isShared` (boolean) — public or private
- `createdDate` / `updatedDate` (auto)

### CustomQuest
- `gmId` (string) — who created the quest
- `gmName` (string) — display name
- `questName` (string)
- `zone` (string)
- `hook` (string)
- `descent` (string)
- `discovery` (string)
- `echo` (string)
- `reward` (string)
- `npcInvolvement` (array of strings)
- `recommendedFrequency` (string)
- `difficulty` (number 1-5)
- `isShared` (boolean)
- `createdDate` / `updatedDate` (auto)

---

## Backend Functions Needed

### getCardCollection
- Input: cardType (optional), filters (optional)
- Output: Array of card data from Stone, ElementCharm, or QuestCharms entities
- Logic: Query the appropriate entity with filters applied

### saveDeck
- Input: playerId, playerName, deckName, cards array
- Output: Saved deck confirmation
- Logic: Validate deck rules (30 cards, frequency limits, rarity limits), save to Deck entity

### rollFrequencyDice
- Input: number of dice (1-6)
- Output: Array of frequency results
- Logic: Random selection from [GROW, STAY, SENSE, SING, CALM, NULL] for each die

### getGMZoneReference
- Input: zone name
- Output: Zone details (map, encounters, NPCs, stones, connected zones)
- Logic: Query relevant entities for the zone

---

## Visual Style

- Same dark stone + gold/brass aesthetic as the main web beta
- Card display: dark card surface with gold border, matching the physical card spec
- Dice: 3D-rendered stone-textured dice with gold symbols
- Navigation: Left sidebar with icon-based nav (matching the Inn's linework-as-UI system)
- Loading: Fizgigs in overalls animation

---

*"The companion app is not the game. The game is at the table. The companion is what you reach for when the table is quiet."*

**— Digital Companion App Spec v1.0**
