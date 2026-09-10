# The Whisper Layer — Builder Spec (Condensed)

## CONCEPT
The Whisper Layer is a tracking system that runs beneath the existing game systems. It creates the feeling that the Inn is aware of the player — not through horror or a twist, but through accumulated small moments. The Inn is warm and genuine. The whisper is the *context* around the warmth.

## THREE LAYERS

### Layer 1: Surface (Default)
The warm, beautiful Inn. Genuine. Not a lie — a selection. This is the default state. Nothing extra to build here — this is the existing app.

### Layer 2: Whisper (Cracks)
Small moments where something feels slightly off. Each is a single, unrepeatable event triggered by player behavior milestones. Not random — earned.

### Layer 3: Awareness (The Realization)
The player understands: the Inn isn't a game world. It's an archive. And the player is being archived. No twist, no reveal — just a perspective shift.

## WHAT TO BUILD (Tier 1 — Beta)

### 1. Player Resonance Profile (Data Layer)
Track these player behaviors silently in the background:
- Stones collected (count + types)
- Nooks sat in (count + which ones)
- Zones explored (count + time spent)
- Frequencies matched (which stones' frequencies the player resonates with)
Build a "resonance signature" — a unique frequency profile for each player based on their collection patterns.

### 2. Whisper Events (5 events for beta)
Each triggers ONCE when the player hits a milestone:

**Event 1 — "The Book" (triggers at 10 stones collected)**
A new book appears on a library shelf. Title: "A Traveler Who Collected Stones." The details inside match the player's actual collection. The book wasn't there before. If the player searches the library catalog, the book is listed. It has a publication date that predates the player's visit.

**Event 2 — "The Storyteller's Aside" (triggers at 5 zones explored)**
The Storyteller tells a story that includes a detail from the player's recent journey — woven in naturally, as if part of the tale. But it's the player's story. The Storyteller is telling the player back to themselves. (This is a dialogue variant, not new dialogue.)

**Event 3 — "The Gnome's Gaze" (triggers at 20 stones collected)**
The Ceiling Gnome stops hammering when the player enters the zone. Looks down at the player. Makes eye contact for 3 seconds. Resumes hammering. The Gnome's hammer rhythm subtly changes to match the player's stone collection count.

**Event 4 — "The Pulse Anomaly" (triggers at 15 nooks sat in)**
The Pulse Line at the bottom of the screen flickers to a third frequency — not 42Hz, not 84Hz. A frequency the player has never heard. Brief. One pulse. Then back to normal. This happens once. Never repeats.

**Event 5 — "The Feather" (triggers at 25 stones collected)**
An owl feather appears in a nook the player has sat in frequently. The feather vibrates at 84Hz (Shadow frequency). It wasn't there before. It stays. The player can pick it up as a novelty item.

### 3. Ceiling Gnome Positioning (Ambient)
The Ceiling Gnome's position in each zone changes between sessions. The Gnome is always closest to wherever the player spent the most time in the previous session. This is a proximity tracker — the Gnome follows the player's pattern.

### 4. Storyteller Dialogue Variants
The Storyteller's dialogue has two layers:
- Base text (what every player hears)
- Whisper variants (unlocked at milestones — include player details woven into stories)

The shift is gradual. The player shouldn't notice the change happening — only that, eventually, the stories feel personal.

### 5. The Pulse Line Anomaly System
The Pulse Line at the bottom of every screen has a small chance (0.1% per zone transition) to flicker to an unknown third frequency. This chance increases slightly as the player hits more whisper milestones. The anomaly is brief — one pulse — and never explained.

## WHAT NOT TO BUILD
- No horror elements. No jumpscares. No dark imagery.
- No villain. No conspiracy reveal. No "it was all a simulation" twist.
- No UI for the tracking system. The whisper is invisible by design.
- The warmth is real. The fire is real. The whisper is context, not replacement.

## NARRATIVE VOICE
All whisper events use the tabletop questline narrative voice: Rothfuss (precision), Pratchett (warmth), Gaiman (mythic), Asimov (logic), Bradbury (fire), Weir (engineering optimism). The whisper is written with warmth — not menace.

## THE ENDGAME QUESTION
The Silo asks: will you escape?
The Inn asks: will you stay?

This question is not asked in the beta. It's embedded in the architecture. The player arrives at it naturally through accumulation of whisper moments.

## TECHNICAL NOTES
- Whisper events are stored as flags on the PlayerProgress entity
- Each event triggers once per player account (isRepeatable = false)
- The resonance profile is computed from existing PlayerProgress fields (stonesCollected, areasUnlocked, gamesCompleted)
- No new entities needed for beta — use PlayerProgress fields + a simple "whisperFlags" JSON field
- The Gnome positioning is a simple algorithm: find player's most-visited zone from last session → place Gnome in that zone
- The Storyteller variants are dialogue branches, not new dialogue entries
