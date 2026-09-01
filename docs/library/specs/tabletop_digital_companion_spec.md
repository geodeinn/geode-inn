# Geode Inn Tabletop — Digital Companion App Specification

## Overview

A companion application for the Geode Inn Tabletop Questline RPG. The app handles the math, the tracking, and the dice — so the Game Master can focus on the story and the players can focus on the experience. It is NOT a virtual tabletop (VTT). It is a digital assistant for an in-person game.

## Product Identity

- **Name:** The Geode Inn Companion
- **Platform:** iOS, Android, web (companion.geodeinn.com)
- **Engine:** Godot 4 (mobile) + web app (React, for browser access)
- **Price:** Free (basic), $4.99 one-time for GM Tools unlock
- **Bundle:** Free with physical tabletop purchase (code in box)

## Core Philosophy

The Companion does three things and refuses to do anything else:
1. **Roll dice** — the Frequency Dice system, digitally
2. **Track state** — character sheets, resonance, dissonance, quest progress
3. **Reference** — look up stones, charms, zones, and rules without opening the book

It does NOT:
- Render maps (use the physical map set)
- Move tokens (use miniatures)
- Play music (that's Inn Mode's job)
- Replace the table (it's a companion, not a substitute)

## Frequency Dice System (Digital)

### The Dice
- D6 with frequency symbols instead of numbers
- 6 faces: 42Hz (Grow), 42Hz, 84Hz (Stay), 84Hz, In-Between (wild), Null (blank)
- Physical dice have these symbols. The app rolls them digitally.

### Rolling
- Tap to roll 1-6 dice
- Shake device to roll (haptic feedback on result)
- Results displayed as frequency symbols, not numbers
- App automatically calculates: successes (42Hz for Living mode, 84Hz for Shadow mode), dissonance points, resonance points
- Critical: all 6 dice match = "The Inn Sings" (automatic success + bonus)
- Fumble: all 6 dice Null = "The Silence" (automatic failure + dissonance)

### Dice Pool Modifiers
- Keystone stone bonus (+1 die)
- Companion assist (+1 die)
- Zone frequency match (+1 die if zone matches player's active frequency)
- Dissonance penalty (-1 die per 3 dissonance points)

## Character Sheet (Digital)

### Player View
- Name, Craft, Alignment
- Stats: Resonance, Dissonance, Resolve, Insight
- Keystone Stone (with image from Stone entity)
- Active Frequency (Living/Shadow/In-Between)
- Faithful Companion (name, type, assist bonus)
- Stones Collected (visual grid — tap for details)
- Charms Equipped (tap for effect text)
- Quest Log (active quests, completed quests)
- Areas Unlocked (zone list with lock/unlock state)

### GM View (paid feature)
- All player sheets visible simultaneously
- Real-time dissonance tracking across the party
- Quest progress dashboard
- Quick-reference NPC list for current zone
- Random encounter roller (filtered by zone)
- Resonance economy tracker (stones in play, charms active)

## Reference Library

### Stone Lookup
- Search by name, family, category, or region
- Shows: image, mind (metaphysical), body (healing), Mohs hardness, frequency tone
- In-game effect text (what the stone does mechanically)
- Connected zones and quests

### Charm Lookup
- Element Charms (118 total): search by element name, symbol, or atomic number
- Quest Charms (45 total): search by quest name or zone
- Shows: rarity, effect, acquisition method, connected stones

### Zone Reference
- All 37 zones with map images
- Artist style, frequency, connected zones
- Native creatures, NPCs, gatherable materials
- Arcade game connection (if any)
- Quick travel: tap a connected zone to see transition description

### Rules Reference
- Full quick-reference tables from the Core Rulebook
- Combat sequence cheat sheet
- Frequency mode effects (Living/Shadow/In-Between)
- Glossary of Inn terms

## GM Tools ($4.99 unlock)

### Session Manager
- Create a campaign (name, starting zone, player count)
- Track sessions (date, duration, summary notes)
- Manage party state across sessions
- Export session log as text

### Encounter Builder
- Select zone → app suggests native creatures at appropriate challenge levels
- Add custom NPCs
- Auto-roll initiative (Frequency Dice based)
- Track enemy Resonance/Dissonance during combat
- Award stones automatically on victory

### Quest Builder
- Create custom quests using the Hook → Descent → Discovery → Echo structure
- Assign reward stones and charms
- Link quests to zones
- Share quest files with other GMs (export as .innquest files)

### Random Tables
- Random stone discovery (filtered by zone)
- Random encounter (filtered by zone and frequency)
- Random NPC encounter (filtered by zone)
- Random Whisper Layer event
- Random weather/ambient effect
- Random treasure find

## Social Features

### Party Sync
- Up to 6 players connect to the GM's session via room code
- Real-time character sheet sync (GM sees changes instantly)
- Players can roll dice from their own phones
- Results appear on GM's screen
- No account required — room code is a 4-word Inn phrase (e.g. "bog-fairy-stone-keeper")

### Campaign Sharing
- Export campaign summary as a narrative document
- Share custom quests with the community
- Import community quests (moderation: must follow Inn lore guidelines)

## Data Integration

### Database Connection
- Pulls Stone data from the live Geode Inn database (198 stones)
- Pulls ElementCharm and QuestCharm data
- Pulls zone data from the architecture blueprint
- Offline cache: all reference data stored locally after first sync
- Refresh button to pull new data when the database updates

### PlayerProgress Sync
- Stones collected in the tabletop game can sync to the digital PlayerProgress entity
- This means tabletop play contributes to the unified Geode Inn progression system
- A stone earned at the table is a stone earned in the game

## Visual Design

- Dark stone background, gold knotwork borders (matching the Inn aesthetic)
- Serif typography for reference text
- Frequency symbols rendered as glowing icons (42Hz = gold, 84Hz = deep purple, In-Between = silver, Null = dark)
- Stone images displayed at full color against the dark background
- No cartoon elements — this is a scholarly tool, not a toy

## Accessibility

- VoiceOver/TalkBack for all screens
- Haptic dice roll feedback
- Large text mode
- Color-blind friendly frequency symbols (shape differentiation, not just color)
- Left-handed layout option

## Version Roadmap

### v1.0 (Launch)
- Digital Frequency Dice
- Character sheets (player view)
- Reference library (stones, charms, zones, rules)
- Party sync via room code
- iOS + Android + web

### v1.1 (2 months post-launch)
- GM Tools unlock ($4.99)
- Encounter builder
- Session manager
- Random tables

### v2.0 (4 months post-launch)
- Quest builder + sharing
- Campaign export
- PlayerProgress sync with live database
- Custom quest import
