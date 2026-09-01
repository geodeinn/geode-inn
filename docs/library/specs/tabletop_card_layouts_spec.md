# Geode Inn Tabletop — Card Layout Specifications

## Overview

Print-ready specifications for the three card types in the Tabletop Questline: Stone Cards (198), Element Charm Cards (118), and Quest Charm Cards (45). Total: 361 unique cards.

## Universal Card Specs

- **Size:** Standard tarot card size (70mm × 120mm) — larger than poker cards to accommodate the Inn's detailed art and text
- **Material:** 350gsm linen finish card stock with black core
- **Finish:** Soft-touch matte (no glare — matches the Inn's dark stone aesthetic)
- **Corner:** Rounded (6mm radius)
- **Border:** Antiqued gold/brass border (2mm), with subtle Celtic knotwork pattern pressed into the finish
- **Back:** The Geode Inn logo (Antikythera mechanism over underwater world, no text, gold on dark stone background)

---

## Stone Card Layout (198 cards)

### Front
```
┌─────────────────────────────────┐
│  [Antiqued gold knotwork border] │
│                                   │
│  ┌─────────────────────────────┐ │
│  │                             │ │
│  │     STONE IMAGE             │ │
│  │     (from database          │ │
│  │      imageFile field)       │ │
│  │     50mm × 50mm             │ │
│  │                             │ │
│  └─────────────────────────────┘ │
│                                   │
│  STONE NAME (serif, 14pt)        │
│  Stone Family (italic, 10pt)     │
│                                   │
│  ─── ─── ─── ─── ─── ─── ─── ─ │
│                                   │
│  FREQUENCY: [GROW/STAY/etc]      │
│  RARITY: [Common/Uncommon/Rare/  │
│          Legendary]               │
│  HARDNESS: [Mohs 1-10]           │
│                                   │
│  ─── ─── ─── ─── ─── ─── ─── ─ │
│                                   │
│  MIND (metaphysical):             │
│  [2-3 lines, 8pt sans-serif]     │
│                                   │
│  BODY (healing):                  │
│  [2-3 lines, 8pt sans-serif]     │
│                                   │
│  ─── ─── ─── ─── ─── ─── ─── ─ │
│                                   │
│  GEO REGION: [region name]       │
│  ZONE: [Inn zone assignment]     │
│                                   │
│  Card #[001-198]                  │
└─────────────────────────────────┘
```

### Color Coding (by frequency, border accent)
- GROW (42Hz): Deep green accent line
- STAY (84Hz): Stone gray accent line
- SENSE (111Hz): Indigo accent line
- SING (432Hz): Gold accent line
- CALM (50 BPM): Deep blue accent line
- NULL (void): Void black accent line

### Rarity Indicators
- **Common:** Single dot ◦
- **Uncommon:** Double dot ◦◦
- **Rare:** Triple dot ◦◦◦
- **Legendary:** Diamond ◆

### Back
Geode Inn logo centered, gold on dark stone. No card number on back (prevents tracking during draws).

---

## Element Charm Card Layout (118 cards)

### Front
```
┌─────────────────────────────────┐
│  [Antiqued gold knotwork border] │
│                                   │
│  ELEMENT SYMBOL (large, 36pt)   │
│  [e.g., Cu, Au, Fe]              │
│                                   │
│  ┌─────────────────────────────┐ │
│  │                             │ │
│  │  ALCHEMICAL EMBLEM           │ │
│  │  (from uploaded emblems)    │ │
│  │  40mm × 40mm                │ │
│  │                             │ │
│  └─────────────────────────────┘ │
│                                   │
│  ELEMENT NAME (serif, 12pt)     │
│  Category: [Metal/Nonmetal/etc] │
│                                   │
│  ─── ─── ─── ─── ─── ─── ─── ─ │
│                                   │
│  ATOMIC NUMBER: [##]            │
│  ATOMIC WEIGHT: [##.##]         │
│  RESONANCE WEIGHT: [converted]  │
│                                   │
│  ─── ─── ─── ─── ─── ─── ─── ─ │
│                                   │
│  ATTACHMENT EFFECT:               │
│  [3-4 lines, 8pt sans-serif]   │
│                                   │
│  CONNECTED STONES:                │
│  [list 3-5 stone names, 7pt]    │
│                                   │
│  BOND BONUS:                     │
│  [1 line, 8pt]                   │
│                                   │
│  ZONE: [Inn zone]               │
│  Card #[E001-E118]               │
└─────────────────────────────────┘
```

### Color Coding (by element category)
- Metal: Bronze accent
- Nonmetal: Teal accent
- Metalloid: Silver accent
- Noble Gas: Purple accent
- Alkali/Alkaline: Copper accent
- Transition: Steel accent

### Back
Same as Stone Cards but with a subtle alchemical symbol watermark behind the Inn logo.

---

## Quest Charm Card Layout (45 cards)

### Front
```
┌─────────────────────────────────┐
│  [Antiqued gold knotwork border] │
│  [Wider border — 3mm, with       │
│   quest sigil in each corner]    │
│                                   │
│  ┌─────────────────────────────┐ │
│  │                             │ │
│  │  CHARM ARTWORK               │ │
│  │  (unique illustration)       │ │
│  │  55mm × 55mm                │ │
│  │                             │ │
│  └─────────────────────────────┘ │
│                                   │
│  CHARM NAME (serif, 14pt)       │
│  "Quest Charm" (italic, 9pt)    │
│                                   │
│  ─── ─── ─── ─── ─── ─── ─── ─ │
│                                   │
│  CHARM TYPE: [type]              │
│  RARITY: [rarity]                │
│  ZONE: [zone]                    │
│                                   │
│  ─── ─── ─── ─── ─── ─── ─── ─ │
│                                   │
│  EFFECT:                          │
│  [4-5 lines, 8pt sans-serif]   │
│                                   │
│  ─── ─── ─── ─── ─── ─── ─── ─ │
│                                   │
│  REWARD EFFECT:                  │
│  [2-3 lines, 8pt]               │
│                                   │
│  ─── ─── ─── ─── ─── ─── ─── ─ │
│                                   │
│  "Lore quote in italic"          │
│  — NPC name                       │
│                                   │
│  EARNED FROM: [questline name]  │
│  STORY THREAD: [thread name]    │
│  Card #[Q01-Q45]                 │
└─────────────────────────────────┘
```

### Special Features
- Quest Charm cards have a **holographic foil accent** on the charm name and the quest sigil in each corner
- The border is slightly wider (3mm vs 2mm) to visually distinguish Quest Charms from other cards
- Each card includes a lore quote from the NPC who awards it
- The card number uses Q prefix (Q01-Q45)

### Back
Same as Stone Cards but with the quest sigil pattern replacing the knotwork border on the back.

---

## Printing Specifications

### Print-on-Demand (initial run)
- **Vendor:** MakePlayingCards.com or DriveThruCards
- **Material:** 350gsm linen finish, black core
- **Finish:** Soft-touch matte
- **Packaging:** Custom tuck boxes (one per card type) or a single deluxe box

### Tuck Box Design (per card type)
- **Stone Cards box:** Dark stone with gold knotwork, "198 Stones of the Inn" text
- **Element Charm box:** Alchemical symbol pattern, "118 Element Charms" text
- **Quest Charm box:** Quest sigil pattern with foil, "45 Quest Charms" text

### Deluxe Box (all 361 cards + rules reference card)
- Rigid box with magnetic closure
- Exterior: Dark stone texture with gold Inn logo
- Interior: Gold silk lining with embossed knotwork
- Includes: All 361 cards + 6 Frequency Dice + rules reference card + zone map card
- **Price target:** $89.99 (deluxe), $24.99 per card pack (individual)

---

## Frequency Dice Specifications

### Physical Specs
- **Size:** 16mm (standard tabletop dice)
- **Material:** Resin with stone-texture finish
- **Color:** Dark gray/stone with gold symbols engraved
- **Symbols (replacing numbers 1-6):**
  1. GROW (sprouting seed) — green resin inlay
  2. STAY (rooted stone) — gray resin inlay
  3. SENSE (open eye) — indigo resin inlay
  4. SING (tuning fork) — gold resin inlay
  5. CALM (slow heartbeat) — blue resin inlay
  6. NULL (blank circle) — black resin inlay

### Manufacturing
- **Vendor:** Chessex or custom dice manufacturer
- **Minimum order:** 500 sets (6 dice per set)
- **Cost estimate:** ~$3-5 per set at 500 units
- **Retail:** $12.99 per set

---

## Digital Companion App (future)

A companion app that replaces physical cards for digital play:
- Browse all 361 cards with full art
- Build and save decks
- Roll virtual Frequency Dice (with haptic feedback on mobile)
- Track stone collection across tabletop and digital games
- **Platform:** Base44 web app (uses existing entity data)
- **Data:** All card data already in the database (Stone, ElementCharm, QuestCharm entities)

---

*"Every card is a door. Every door is a stone. Every stone remembers."*

**— Tabletop Questline Card Layout Spec v1.0**
