# Resonance CCG — Digital Build Specification

## Overview

The technical plan for building Resonance as a playable browser-based digital card game, with a path to Godot-native desktop and mobile releases. The web prototype exists; this spec defines the full production build.

## Product Identity

- **Name:** Resonance — A Geode Inn Card Game
- **Platform:** Web (play.resonance.geodeinn.com), Godot native (Steam, iOS, Android)
- **Engine:** Phase 1: React + Canvas/WebGL (web). Phase 2: Godot 4 (native)
- **Price:** Free to play (base set). Expansion packs: $2.99 each or $9.99 season pass
- **Bundle:** 50% off with any Geode Inn Steam game purchase

## Current State

A browser prototype exists at web_games/resonance.html with basic card placement, board effects, and turn structure. This spec defines the path from prototype to production.

## Architecture (Web Phase)

### Frontend
- React 18 + TypeScript
- Game board rendered on HTML5 Canvas (WebGL2 for card effects)
- Card art loaded from Base44 CDN (public storage URLs)
- State management: Zustand (lightweight, no Redux overhead)
- Animation: Framer Motion for UI, custom Canvas shaders for board effects
- Audio: Web Audio API for frequency-based card sounds

### Backend
- Base44 entities: PlayerProgress (for progression sync), Leaderboard (for ranked play)
- Backend function: `resonanceMatch` — handles ranked match result reporting
- Backend function: `resonanceDeckSave` — saves/loads player decks
- No real-time server needed for PvE (AI opponent runs client-side)
- PvP: Phase 2 (requires WebSocket relay — use Base44 backend function with polling for MVP)

### Card Data Model
```typescript
interface Card {
  id: string;
  name: string;
  cardType: 'stone' | 'charm' | 'npc' | 'gargoyle' | 'pet';
  rarity: 'common' | 'rare' | 'epic' | 'legendary' | 'mythic';
  frequency: 42 | 84 | 111 | 432 | 0; // 0 = neutral
  zone: string; // which zone the card belongs to
  artUrl: string; // CDN URL for card art
  // Type-specific fields:
  stoneData?: { mohs: number; tone: number; family: string; effect: string };
  charmData?: { element?: string; quest?: string; effect: string; duration: number };
  npcData?: { voice: string; ability: string; cooldown: number };
  boardEffect?: string; // zone-specific board modifier
  text: string; // rules text
  cost: number; // resonance cost to play
  power?: number; // for combat
  health?: number; // for NPC/gargoyle cards
}
```

### Deck Model
```typescript
interface Deck {
  id: string;
  name: string;
  archetype: 'maker' | 'scholar' | 'guardian' | 'alchemist' | 'custom';
  frequency: 42 | 84 | 111 | 432;
  cards: string[]; // card IDs
  zone: string; // home zone (determines board effect)
  owner: string; // player ID
}
```

## Game Systems

### The Board
- 37 zone-based boards, each with a unique passive effect
- Board is a 4x6 grid (player's side / opponent's side)
- Center line = the Threshold (where frequency clashes happen)
- Board effect activates at start of each turn
- Example: The Archive board → "Cards in play gain +1 power at end of turn (knowledge accumulates)"
- Example: Gorgon's Garden board → "84Hz cards cannot be removed by 42Hz effects (petrification)"

### The Frequency System
- Each card has a frequency (42Hz, 84Hz, 111Hz, 432Hz, or Neutral)
- 42Hz cards grow stronger over time (each turn, +1 power)
- 84Hz cards are immune to growth effects but never weaken
- 111Hz cards reveal information (opponent's hand, deck top, board effect)
- 432Hz cards transform (can change frequency once per game)
- Neutral cards have no frequency interaction

### Turn Structure
1. **Tune Phase** — Both players' frequency effects resolve (growth, petrification, etc.)
2. **Draw Phase** — Draw 1 card (max hand size: 7)
3. **Resonance Phase** — Gain 1 resonance + 1 per active 42Hz card
4. **Main Phase** — Play cards, use abilities (spend resonance)
5. **Threshold Phase** — If cards meet at the center line, frequency clash resolves
6. **End Phase** — Check win conditions, pass turn

### Win Conditions
- **Resonance Victory:** Reduce opponent's Resonance to 0 (they can no longer play cards)
- **Threshold Victory:** Control the center line for 3 consecutive turns
- **Song Victory:** Have all 6 frequency slots active simultaneously (42, 84, 111, 432 + 2 neutrals)

### The 6 Deck Archetypes

#### 1. The Maker (42Hz) — Growth Engine
- Play style: Slow build, overwhelming late game
- Key cards: Maker-class stones, growth charms, companion pets
- Weakness: Vulnerable early, weak to Shadow decks

#### 2. The Scholar (111Hz) — Information Control
- Play style: Know everything, counter everything
- Key cards: Archive NPCs, revelation charms, Beverley
- Weakness: Low raw power, relies on correct reads

#### 3. The Guardian (84Hz) — Fortress
- Play style: Immovable defense, win by attrition
- Key cards: Guardian gargoyles, petrification charms, Lozen
- Weakness: No growth, can't come back from behind

#### 4. The Alchemist (432Hz) — Transformation
- Play style: Adapt and transform, switch frequencies mid-game
- Key cards: Transmutation charms, staircase NPCs, Newton
- Weakness: Unpredictable — can transform into weakness as easily as strength

#### 5. The Bard (Neutral) — Chaos
- Play style: Frequency-agnostic, uses zone effects as primary weapon
- Key cards: Brim, shifting NPCs, zone-control charms
- Weakness: No frequency protections, pure skill deck

#### 6. The Shadow (84Hz + 111Hz blend) — Control
- Play style: Lock down opponent, prevent growth, win by Threshold
- Key cards: Shadow Inn NPCs, gargoyle cluster, silence charms
- Weakness: Very slow, can lose to fast Maker openings

## AI Opponent System

### Difficulty Levels
1. **Fizgig (Easy):** Random plays, no strategy, basic card evaluation
2. **Beverley (Normal):** Plays zone effect optimally, evaluates trades, basic deck archetype awareness
3. **The Keeper (Hard):** Predicts player's next 2 turns, optimizes resonance spending, frequency reads
4. **Elio (Expert):** Full game-tree search 3 turns deep, adapts to player's deck archetype, uses bluffs

### AI NPC Decks
- Each AI uses a named NPC's deck with established voice and play style
- Beverley plays a Scholar deck (methodical, revealing cards)
- Lozen plays a Guardian deck (patient, defensive, punishing)
- Brim plays a Bard deck (chaotic, zone-effect combos)
- Newton plays an Alchemist deck (transformative, unpredictable)
- The Keeper plays a Shadow deck (controlling, silencing)
- Elio plays a Maker deck (growth-focused, overwhelming — the final boss)

### Voice Lines
- Each AI NPC has 6-8 voice lines triggered by game events (play card, win turn, lose turn, victory, defeat)
- Lines written in the Inn's narrative voice (Rothfuss+Pratchett+Gaiman+Asimov+Bradbury+Weir)
- Audio: synthesized from voice profiles (74 defined in audiobook spec)
- Text appears in a speech bubble above the NPC portrait

## Card Art Production

### Source
- 37-artist system: each card's art matches its zone's assigned artist style
- NPC cards use existing NPC portraits (142 generated, all on CDN)
- Stone cards use cleaned stone family images (198 on CDN)
- Charm cards need new art generation (118 ElementCharms + 45 QuestCharms = 163 cards)
- Gargoyle cards use gargoyle portraits (6 defined)
- Pet cards use critter portraits (12 defined)

### Card Frame Design
- Frequency-colored border: 42Hz = gold, 84Hz = deep purple, 111Hz = silver-blue, 432Hz = copper-green, Neutral = stone-gray
- Rarity gem in top-right corner (common = none, rare = blue, epic = purple, legendary = gold, mythic = red-gold)
- Celtic knotwork corner accents (matching Inn aesthetic)
- Card name in serif font, rules text in clean sans-serif
- Zone symbol in bottom-left (miniature zone icon)

## Monetization

### Base Set (Free)
- 4 starter decks (Maker, Scholar, Guardian, Alchemist)
- 120 cards total
- PvE: all 6 AI opponents at Fizgig and Beverley difficulty
- PvP: casual matches only

### Expansion Packs ($2.99 each)
- The Shadow Inn (84Hz expansion): 30 new cards, Shadow archetype, Keeper AI unlocked
- The Fae Court (In-Between expansion): 30 new cards, Bard archetype enhanced, Fae NPC decks
- The Archive Deep (111Hz expansion): 30 new cards, Scholar archetype enhanced, Quire AI deck
- The Canopy (42Hz expansion): 30 new cards, Maker archetype enhanced, critter pet cards

### Season Pass ($9.99)
- All 4 expansions for the season
- Exclusive mythic card (1 per season)
- Elio AI difficulty unlocked
- Ranked play unlocked
- Cosmetic: alternate card frames (Shadow, Fae, Stone, Gold variants)

### Monthly Egg Drops
- Community votes on Egg Hatchery → winning character becomes a card
- Card is distributed free to all players who participated in the vote
- Creates a monthly engagement loop between the CCG and the Hatchery

## Technical Roadmap

### Phase 1: Web MVP (8 weeks)
- Weeks 1-2: Card data model, 120 base cards loaded, basic UI
- Weeks 3-4: Board system, turn structure, frequency mechanics
- Weeks 5-6: AI opponent (Fizgig + Beverley difficulty), starter decks
- Weeks 7-8: Polish, card art integration, audio, launch on web

### Phase 2: Full Web (4 weeks)
- All 6 AI difficulties
- Deck builder UI
- Casual PvP (polling-based)
- Account system (Base44 auth)
- Deck save/load (backend function)

### Phase 3: Godot Native (8 weeks)
- Port game logic to Godot 4
- Card art as local assets (offline-first)
- Steam integration (achievements, cloud saves)
- Mobile port (iOS + Android)
- Ranked PvP (WebSocket relay)

### Phase 4: Live Operations (ongoing)
- Monthly Egg card drops
- Seasonal expansions
- Balance patches based on ranked data
- Community deck sharing
- Tournament mode
