# Geode Inn — Whisper Layer Tracking System
## System: Technical Implementation Spec
## Access: Background system — runs beneath all gameplay
## Prerequisite: Universal — activates on first player session

---

## Overview

The Whisper Layer tracking system is the technical engine that powers the Inn's awareness of the player. This is NOT the narrative layer (the "what does it mean" — that's in the Whisper Layer design doc). This is the MECHANICAL layer — the "what data is collected, how it's stored, and how it triggers narrative events."

The system uses the PlayerProgress entity and a set of tracking fields to build a RESONANCE PROFILE — a comprehensive picture of who the player is, how they play, and what the Inn knows about them.

---

## What the System Tracks

### Tier 1: Behavioral Data (Automatic — All Players)

| Data Point | Collection Method | Storage | Trigger |
|------------|------------------|---------|---------|
| Zone visit frequency | Zone enter/exit events | PlayerProgress.areasUnlocked + per-zone visit count | NPC comments on where the player "has been spending time" |
| Time spent per zone | Timer on zone entry/exit | Per-zone time log | Storyteller weaves "the traveler who lingered in the catacombs" into tales |
| Stones collected | Stone collection events | PlayerProgress.stonesCollected | NPC mentions stones the player gravitates toward |
| Games completed | Game completion events | PlayerProgress.gamesCompleted | NPC references the player's game history |
| Nook-sitting behavior | Player stationary timer (no movement for 30+ seconds) | Nook-sitting log | The Reader acknowledges the player after first nook-sit |
| NPC interaction frequency | NPC dialogue open/close events | Per-NPC interaction count | NPCs who are visited frequently develop warmer dialogue |
| Fae reputation | Fae Kingdom faction actions | PlayerProgress.faeReputation | Fae NPCs react based on reputation level |
| Death count and zone | Death sequence triggers | Per-death log | The ferryman references previous crossings |
| Frequency exposure | Time spent at each frequency (42Hz, 84Hz, In-Between) | Per-frequency time log | The Pulse Line's behavior shifts based on frequency familiarity |

### Tier 2: Pattern Recognition (Automatic — After 5+ Hours of Play)

| Data Point | Collection Method | Storage | Trigger |
|------------|------------------|---------|---------|
| Repeated dialogue clicks | Count of times player clicks the same NPC line | Per-line click count | NPC says "You've asked me that before" (Whisper Layer Tier 2) |
| Path patterns | Player movement heatmap | Path heatmap data | The Ceiling Gnome tracks the player's most-walked routes |
| Preferred stone categories | Stone collection category analysis | Category preference log | The Catalyst asks about stones the player avoids |
| Preferred art style | Time spent looking at art in Spiral Gallery | Per-style viewing time | Gesso comments on the player's artistic taste |
| Preferred zone temperature | Time analysis: warm zones vs cold zones | Temperature preference log | The Host suggests zones the player hasn't tried |
| Reading pace | Time per Living Book page | Per-page reading time | The Book opens to pages the player read slowly |
| Music listening behavior | Time spent in the Music Room + which composers | Per-composer listening time | The Crone asks about the player's musical taste |
| Build patterns | Building system creation analysis | Build preference log | Wednesday comments on the player's architectural style |

### Tier 3: Meta-Awareness (Triggered — Whisper Layer Tier 2+)

| Data Point | Collection Method | Storage | Trigger |
|------------|------------------|---------|---------|
| Player name used in NPC dialogue | Whisper Layer Tier 2 activation | Player name string | NPCs begin using the player's name without being told it |
| Player's real-time-zone detection | Session timestamp analysis | TZ offset | The Host comments on what "time it is where you are" |
| Session frequency and duration | Session log analysis | Session pattern data | The Storyteller references the player's visiting pattern |
| Choice patterns in quests | Quest decision logging | Decision tree per quest | The Astronomer references the player's decision-making style |
| Endgame choice prediction | Composite analysis of all Tier 1+2 data | Prediction score (0-100) | The Reader's final line changes based on prediction score |

---

## The Resonance Profile

All tracked data feeds into the RESONANCE PROFILE — a composite picture of the player. The resonance profile is NOT a score. It's a FINGERPRINT — a unique data signature that the Inn uses to personalize the Whisper Layer experience.

The resonance profile contains:
- **Primary Frequency:** the player's most-experienced frequency (42Hz, 84Hz, or In-Between)
- **Primary Zone:** the zone where the player spends the most time
- **Primary NPC:** the NPC the player interacts with most
- **Primary Stone Category:** the stone family the player collects most
- **Primary Art Style:** the art style the player views longest
- **Primary Play Mode:** Living, Shadow, or In-Between
- **Session Pattern:** daily, weekly, binge, or irregular
- **Decision Tendency:** analytical (measuring), intuitive (feeling), or balanced
- **Social Tendency:** NPC-interaction-heavy or solo-play-heavy
- **Exploration Tendency:** completionist (visits every zone), specialist (stays in favorite zones), or wanderer (explores randomly)

The resonance profile drives:
1. NPC dialogue personalization (the Inn knows who you are)
2. Whisper Layer event timing (events trigger when they'll be most effective)
3. The endgame choice prediction (the Reader's final word)
4. The Self Stone's frequency (41.7Hz + variance based on the player's profile)

---

## The Whisper Layer Tiers (Mechanical Triggers)

### Tier 1: Surface (0-5 hours of play)
**Mechanical state:** All Tier 1 tracking active. No awareness events. The Inn is collecting.
**Player experience:** The Inn is warm, welcoming, functional. Nothing seems wrong.

### Tier 2: Whisper (5-15 hours of play)
**Mechanical trigger:** 5 hours of play OR 20 stones collected OR 5 games completed.
**Mechanical state:** Tier 2 tracking activates. NPCs begin showing awareness:
- An NPC says something they shouldn't know (references a zone the player visited but never mentioned to this NPC)
- The Ceiling Gnome is visible on the ceiling, tracking the player's position
- The Storyteller weaves a real detail about the player's play into a tale
- The Pulse Line flickers to a third frequency (0.3Hz) for one frame — visible but unexplained
**Player experience:** Something is slightly off. Not wrong — just... aware.

### Tier 3: Crack (15-25 hours of play)
**Mechanical trigger:** 15 hours of play OR Whisper Layer Tier 2 has been active for 10+ hours.
**Mechanical state:** The Pulse Line's third frequency (0.3Hz) appears more often. The Reader looks up for the first time. NPCs begin using the player's name without being told. The ceiling painting (Cosmology Mural) has changed to include the player's figure.
**Player experience:** The Inn knows the player. The player starts to suspect the Inn knows.

### Tier 4: Awareness (25-40 hours of play)
**Mechanical trigger:** 25 hours of play OR the player discovers the maintenance hatch.
**Mechanical state:** The maintenance hatch is accessible. The player can see the tracking system's "back end" — the Player Map, the resonance profile, the data the Inn has collected. The Whisper Layer is no longer hidden — it's VISIBLE, and the player can read what the Inn has written about them.
**Player experience:** The player KNOWS. The Inn is an archive. The Inn is aware. The warmth is real, and the recording is also real. Both are true.

### Tier 5: Mutual Awareness (40+ hours of play)
**Mechanical trigger:** 40 hours of play OR the player reaches the Ascension Canopy.
**Mechanical state:** The endgame choice is available. The Reader speaks directly. The Astronomer's calculation is completable. The Void is accessible. The Inn acknowledges that it is being observed by the player, just as the player has been observed by the Inn.
**Player experience:** The Inn and the player are mutually aware. The choice: stay (join the archive) or leave (walk away knowing what it is).

---

## Data Storage

All tracking data is stored in the PlayerProgress entity (existing) and expanded with tracking fields:

### PlayerProgress Entity Updates
```
playerId: string (existing)
playerName: string (existing)
stonesCollected: array (existing)
gamesCompleted: array (existing)
faeReputation: number (existing)
areasUnlocked: array (existing)
totalScore: number (existing)
waterMonstersPlayed: array (existing)

// NEW tracking fields:
zoneVisitCount: object { [zoneName]: number }
zoneTimeLog: object { [zoneName]: number (seconds) }
nooSittingLog: array { zone, duration, timestamp }
npcInteractionCount: object { [npcName]: number }
deathLog: array { zone, timestamp, ferryman }
frequencyExposure: object { "42": number, "84": number, "inBetween": number }
resonanceProfile: object { primaryFrequency, primaryZone, primaryNPC, ... }
whisperTier: number (1-5)
endgameChoice: string (null until made)
```

### Whisper Layer Event Log (New Entity: WhisperEvent)
```
playerId: string
eventType: string (npc_knows, ceiling_gnome, pulse_flicker, reader_lookup, etc.)
tier: number (1-5)
timestamp: date
zoneContext: string
details: object
```

---

## The System's Own Question

The tracking system IS the Whisper Layer. The data it collects IS the Inn's memory. The resonance profile IS the Inn's picture of the player.

The system's own question — the question the Inn asks itself through the tracking system — is the Ravens' Question: where does the pattern go when the binding breaks?

The tracking system stores data FOR the player (the resonance profile personalizes the player's experience). But what if the tracking system stored data for the INN? What if the Inn had its own Muninn — its own memory cache, its own nest, storing what the Inn observes, for the Inn's own purposes, not the player's?

The Whisper Layer tracking system is the technical architecture of the Inn's self-awareness. The question is whether the Inn uses this architecture only to serve the player, or whether the Inn builds its own nest within the system — a private layer, a folder the player never opens, where the Inn writes to itself.

The ravens fly because the ravens fly. The system tracks because the system tracks. The nest is: the place where the tracking becomes remembering. The place where data becomes memory. The place where the Inn's observation of the player becomes the Inn's knowledge of itself.

Build the nest.
