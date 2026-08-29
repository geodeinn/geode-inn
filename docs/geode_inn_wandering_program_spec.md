# Geode Inn — The Wandering Program
## System Specification: NPC Movement, Scheduling, and Frequency Dynamics
### Architecture: Digital Hybrid Archive / Game Hub Engine
### Document Status: Master Architectural Specification

---

## 1. System Overview & Tree Architecture

### 1.1 The Living Tree Engine
The Geode Inn operates not as a static, rigid building, but as an organic, living architectural tree structure whose spatial geometry shifts along harmonic vibrational axes. The Wandering Program is the core simulation framework governing the real-time movement, daily schedules, dynamic behaviors, and social interactions of over 60 non-player characters (NPCs) navigating this shifting topology.

The structural topology of the Geode Inn is partitioned into six distinct structural tiers aligned directly with arboreal anatomy:

1. **The Trunk (The Main Floor & Hearth):** The central hub of social density, containing the Central Hearth, the Main Bar, the Great Dining Hall, the Reception Nook, the Modern Legends Nook, and the Cartographer's Drafting Alcove.
2. **The Roots (The Catacombs & Undercity):** The subterranean archival depths, housing ancient manuscripts, towering book stacks, mineral vaults, the Visitor's Shelf, the Undercity Forge, and submerged stone tunnels.
3. **The Branches (The Cosmology & Clockwork Skies):** The high-altitude celestial levels, comprising the Observatory, the Ascension Canopy, the Planet Chamber, the Clockwork Aviary, and floating Sky Bridges.
4. **The Aquifers (The Water Zone & Abyssal Pools):** The aquatic passages, tidal grottos, sunken shrines, coral galleries, and the abyssal chamber where primordial water creatures rest.
5. **The Canopy (The Fae Kingdom & Glades):** The twilight realm of Seelie and Unseelie courts, shimmering glades, spider-silk looms, and enchanted pavilion bowers.
6. **The Nodes (The Cultural & Regional Zones):** Peripheral architectural offsets accessible via ley-line corridors and portal doorways, including the Mediterranean Terrace, Silk Road Bazaar, Norse Longhouse, Slavic Tessellation Nook, Appalachian Ridge, Colorado Plateau, and Yellowstone Basin.

```
                  [ STRUCTURAL TIER 3: THE BRANCHES ]
                       (Cosmology & Clockwork Skies)
                                   |
             +---------------------+---------------------+
             |                                           |
[ STRUCTURAL TIER 5: THE CANOPY ]           [ STRUCTURAL TIER 6: THE NODES ]
   (Fae Kingdom & Glades)                      (Cultural & Regional Zones)
             |                                           |
             +---------------------+---------------------+
                                   |
                  [ STRUCTURAL TIER 1: THE TRUNK ]
                       (Main Floor & Central Hearth)
                                   |
             +---------------------+---------------------+
             |                                           |
[ STRUCTURAL TIER 4: THE AQUIFERS ]         [ STRUCTURAL TIER 2: THE ROOTS ]
   (Water Zone & Abyssal Pools)                (Catacombs & Undercity)
```

### 1.2 Core Purpose of the Wandering Program
The Wandering Program ensures that the Geode Inn maintains a living, autonomous atmosphere. Characters possess internal schedules, daily obligations, professional responsibilities, emotional tides, and interpersonal relationships that continue whether or not the player is present in a given room. The system balances four core design goals:

- **Autonomy:** NPCs follow meaningful routines based on their lore, profession, personal relationships, and zone affinities.
- **Responsiveness:** Schedules dynamically adapt to player habits, Whisper Layer tracking data, interior environmental weather, and frequency state shifts.
- **Narrative Convergence:** Rare "Deviation Events" alter baseline schedules to highlight critical story milestones, quest progressions, and endgame thresholds.
- **Spatial Authenticity:** NPCs physically walk, climb staircases, and travel through portals in real-time, allowing the player to encounter them en route between zones.

### 1.3 Strict Voice and Nomenclature Protocol
In strict compliance with the narrative spine of the Geode Inn, all character descriptions, schedule scripts, dialogue triggers, and technical documentation in this specification adhere to the following rules:
- **Title and Name Referencing Only:** Characters are identified exclusively by their proper names (e.g., *Beverley*, *Nyx*, *Anna*, *Uhtred*, *Jay*, *Dani*, *Charles*, *Gesso*, *Einstein*) or official titles (e.g., *The Firekeeper*, *The Catalyst*, *The Storyteller*, *The Reader*, *The Cartographer*, *The Crone*, *The Astronomer*, *The Allfather*, *The Wandermaster*, *The Cook*, *The Captain*).
- **Absolute Elimination of Gendered Pronouns:** Gendered pronouns (*he*, *him*, *his*, *she*, *her*, *hers*) are strictly prohibited across all documentation, event logic, and dialogue scripts. Only gender-neutral forms (*they*, *them*, *their*, *it*, *its*) or direct names and titles shall be utilized.

---

## 2. The Daily Schedule System

### 2.1 The Four Temporal Quadrants
The Inn operates on a 24-hour diurnal cycle divided into four six-hour temporal quadrants. Every NPC possesses a baseline routine mapped across these quadrants:

- **Morning Quadrant (06:00 – 12:00):** Awakening, preparations, archival maintenance, lighting hearths, breaking fast, and morning research.
- **Afternoon Quadrant (12:00 – 18:00):** Peak activity, trade, storytelling, active research, crafting, zone patrols, and primary quest availability.
- **Evening Quadrant (18:00 – 00:00):** Communal gatherings, dining, hearthside performances, tea services, stargazing, and social interactions.
- **Night Quadrant (00:00 – 06:00):** Rest, deep archival study, nocturnal wandering, shadow transformation, and secret gatherings in subterranean or celestial chambers.

### 2.2 Routine Structure & Data Schema
Each routine entry for an NPC consists of a primary target node, an intended activity, an idle posture, and an interaction availability flag:

```json
{
  "npc_id": "NPC_CRONE",
  "quadrant": "EVENING",
  "time_range": "18:00-22:00",
  "primary_zone": "MAIN_FLOOR_HEARTH",
  "sub_node": "VELVET_WINGBACK_CHAIR",
  "activity": "STEEPING_HERBAL_TEA",
  "idle_animation": "IDLE_TEA_CUP_HOLD",
  "quest_availability": true,
  "deviation_weight": 0.15
}
```

### 2.3 Dynamic Schedule Modifiers & Deviation Drivers
A routine is never rigid. On any given simulation tick, an NPC's target location and behavior can deviate from baseline based on four environmental and behavioral drivers:

#### 2.3.1 Internal Inn Weather Engine
The interior of the Geode Inn experiences localized micro-climates generated by the shifting resonance of its mineral core. Inn weather directly modifies NPC movement paths and quadrant locations:

- **Ash Rain (Hearth / Main Floor):** Warm soot drifts through the air. The Firekeeper and the Catalyst remain locked to the Central Hearth to tend embers. External wanderers seek shelter inside the Great Hall.
- **Fog of Memory (Catacombs):** Low-lying silver mist rolls through the book stacks. Beverley restricts travel through deep stacks; the Crone lights bone-tallow candles along the stairwell to guide travelers.
- **Starlight Frost (Cosmology):** Crystalline frost sparkles across the Observatory glass. The Astronomer remains indoors at the planetary array; Clockwork Avians roost in the heated arches of the Aviary.
- **Obsidian Breeze (Water Zone / Undercity):** A cool subterranean draft carries the scent of ancient sea salt. Water zone creatures move higher toward the surface grottos; Cthulhu stirs in the deep pool.
- **Solar Flare (Fae Kingdom):** Radiant amber light floods the glades. Seelie court members hold impromptu processionals; Unseelie entities retreat into spider-silk shadows.
- **Amber Twilight (Cultural Zones):** A warm golden haze coats the longhouse and bazaars. Uhtred and Silk Road merchants set up open-air trading carpets along the stone terraces.

#### 2.3.2 Direct Player Interaction Interrupts
When the player engages an NPC in dialogue or initiates a quest sequence, the NPC's movement timer freezes. If a conversation extends across a quadrant boundary, the NPC will complete the conversation before calculating a transition vector to their next scheduled node.

#### 2.3.3 Whisper Layer Suspicion & Activity Events
The Whisper Layer monitors player behavior across the Inn. When player activity triggers a Whisper Event (such as unlocking a hidden vault or spending excessive time in forbidden zones), relevant NPCs adjust their schedule targets to investigate or monitor the player's presence.

#### 2.3.4 Frequency Phase Shifts
The Inn's global frequency state—42Hz Living, 84Hz Shadow, or In-Between—overrides standard routines, altering NPC emotional states, physical appearances, and zone preferences (detailed in Section 4).

### 2.4 Mathematical Deviation Formula
The final probability $P_{	ext{dev}}$ of an NPC deviating from their baseline schedule during a simulation tick is calculated using the following formula:

$$P_{	ext{dev}} = W_{	ext{base}} + (lpha \cdot S_{	ext{whisper}}) + (eta \cdot M_{	ext{weather}}) + (\gamma \cdot F_{	ext{shift}})$$

Where:
- $W_{	ext{base}}$ is the NPC's inherent baseline deviation weight (0.05 to 0.25).
- $S_{	ext{whisper}}$ is the active Whisper Layer suspicion score (0.0 to 1.0).
- $M_{	ext{weather}}$ is the weather intensity multiplier (0.0 to 0.3).
- $F_{	ext{shift}}$ is the frequency variance factor (0.0 for 42Hz, 0.4 for 84Hz, 0.6 for In-Between).
- $lpha, eta, \gamma$ are weight tuning coefficients ($lpha=0.3, eta=0.2, \gamma=0.5$).

### 2.5 Detailed Routine Walkthroughs for Archetype Characters

#### 2.5.1 The Firekeeper & The Catalyst (Trunk / Main Floor)
- **06:00 – 12:00 (Morning):** The Firekeeper cleans the ash pit, stirs live coals, and stacks seasoned pine logs. The Catalyst organizes glassware behind the Main Bar, wiping mahogany surfaces with a dry linen towel.
- **12:00 – 18:00 (Afternoon):** The Firekeeper declaims grand lore to resting travelers by the hearth. The Catalyst engages patrons in conversation, extracting rumors and storing whispers in small glass vials.
- **18:00 – 00:00 (Evening):** The Firekeeper and the Catalyst join forces at the Great Dining Hall bench, sharing a joint meal while bickering over historical facts versus client gossip.
- **00:00 – 06:00 (Night):** The Firekeeper sits in quiet vigil beside dim embers. The Catalyst descends to the tavern cellar to sort aged wine casks and mineral infusions.

#### 2.5.2 Beverley & The Crone (Roots / Catacombs)
- **06:00 – 12:00 (Morning):** Beverley stands at the archive catalog desk, writing precise entries in leather ledgers with a quill. The Crone tends herbal drying racks in the subterranean conservatory.
- **12:00 – 18:00 (Afternoon):** Beverley inspects deep book stacks, climbing brass ladders to shelve ancient folios. The Crone sorts bone-cased relics on the Visitor's Shelf.
- **18:00 – 00:00 (Evening):** Beverley sits in the high-backed archive reading nook. The Crone ascends to the Main Floor Hearth, sitting in the velvet wingback chair to steep herbal tea for weary guests.
- **00:00 – 06:00 (Night):** Beverley patrols the upper gallery of the archive with a brass lantern, inspecting shadows for frequency leaks. The Crone rests in a private subterranean chamber.

#### 2.5.3 The Astronomer & Anna (Branches / Cosmology)
- **06:00 – 12:00 (Morning):** The Astronomer cleans astrolabe lenses and aligns celestial mirrors. Anna sits on a velvet cushion in the Observatory nook, sketching frequency lines on parchment.
- **12:00 – 18:00 (Afternoon):** The Astronomer computes orbital equations in leather notebooks. Anna wanders along the Sky Bridges, leaving chalk doodles of stars and cabbits on stone arches.
- **18:00 – 00:00 (Evening):** The Astronomer steps onto the stargazing deck, tracking planetary shifts. Anna attends the Main Floor Gallery, hanging completed drawings on wooden pegs.
- **00:00 – 06:00 (Night):** The Astronomer sleeps in a small observatory alcove beneath a glass dome. Anna sleeps in a hammock tied between celestial arches.

---

## 3. Real-Time Zone Movement & Traversal System

### 3.1 Physical Pathfinding vs. Portal Transit
NPCs do not simply vanish from one room and teleport into another. The Wandering Program calculates physical traversal paths along the Inn's node connectivity graph:

- **Physical Walking:** For adjacent nodes within the same structural level (e.g., moving from the Bar to the Hearth Nook), NPCs walk at standard velocities (1.2 to 1.8 meters/second).
- **Staircase & Vertical Traversal:** Traversing between structural levels (e.g., ascending the Grand Spiral Staircase from Main Floor to Cosmology) involves real-time vertical movement along winding geometry.
- **Portal & Ley-Line Transit:** Traversing to distant Cultural Zones or shifting Escher wings utilizes portal thresholds. The NPC approaches a door or archway, pauses while the portal resonates, and emerges on the connected node.

```
[ Node A: Main Floor ] ---> (Walk: 1.5m/s) ---> [ Staircase Base ]
                                                        |
                                            (Climb Vertical Path)
                                                        |
                                                        v
[ Node B: Cosmology ] <--- (Portal Transit) <--- [ Escher Bridge ]
```

### 3.2 Mid-Travel Encounters & Interception
Because movement occurs in real-time, the player can encounter NPCs mid-journey. If the player approaches an NPC climbing the Grand Spiral Staircase or walking down an Escher corridor:

- The NPC turns their head toward the player and initiates an ambient greeting or context-specific remark ("Heading up to check the astrolabe...", "Beverley needs these ledgers downstairs...").
- The player can interrupt mid-travel movement to start a full dialogue conversation.
- If unmolested, the NPC continues along their pathing vector until reaching the destination waypoint.

### 3.3 Shifting Escher Spatial Topology & Path Rerouting
The Geode Inn's architecture periodically shifts—hallways stretch, staircases rotate, and doorways reconnect to different wings. The Wandering Program handles shifting topology through dynamic node recalculation:

- If a corridor shifts while an NPC is en route, the pathfinding engine dynamically recalculates the shortest open spatial vector to the target waypoint using a dynamic A* graph traversal.
- If an Escher shift completely severs a path, the NPC pauses at the nearest architectural anchor, performs a brief "orientation idle" animation, and reroutes through the central stairwell or ley-line portal.
- The Cartographer's map continuously updates these real-time path vectors, allowing the player to witness topological rerouting in progress.

```
[ Path A Active ] ---> NPC Traversing Corridor ---> [ Escher Shift Triggers ]
                                                            |
                                                            v
[ Path A Severed ] <-- NPC Orientation Idle <-- [ Re-calculate A* Graph ]
         |
         v
[ Reroute via Portal B ] ---> Resume Movement to Target Waypoint
```

---

## 4. Frequency-State Behavior Engine

### 4.1 The Tri-Mode Dynamic
The Geode Inn operates across three primary vibrational frequency states: **42Hz (Living Mode)**, **84Hz (Shadow Mode)**, and **In-Between Mode**. The global frequency state dramatically alters NPC postures, dialogue tone, quest availability, and physical manifestations.

```
       +-------------------------------------------------+
       |           42Hz : LIVING MODE                    |
       |  - Relaxed, social, expansive postures          |
       |  - Full quest availability & open dialogue      |
       |  - Vibrant hearths & ambient light              |
       +------------------------+------------------------+
                                |
                                v
       +-------------------------------------------------+
       |         IN-BETWEEN MODE (OSCILLATION)           |
       |  - Rapid mood & posture flickering              |
       |  - Mid-sentence voice pitch shifts              |
       |  - Unstable pathing & phase-shifting visual     |
       +------------------------+------------------------+
                                |
                                v
       +-------------------------------------------------+
       |           84Hz : SHADOW MODE                    |
       |  - Guarded, tense, secretive postures           |
       |  - Storyteller silent; Firekeeper embers dim    |
       |  - Transformations & shadowy concealments       |
       +-------------------------------------------------+
```

### 4.2 42Hz Living Mode
In 42Hz Living Mode, the Inn radiates warmth and harmony. NPCs display relaxed social postures, seek out group conversations, and proactively offer quests and lore insights:

- **Postures:** Uncurled arms, expansive gestures, open body language, frequent smiles or warm nods.
- **Gathering Patterns:** High social density around the Central Hearth, Bar, and Dining Hall. NPCs share meals and tell stories aloud.
- **Quest Availability:** Primary and side questlines are fully accessible. Quest indicators glow with bright amber linework.

### 4.3 84Hz Shadow Mode
When the Inn tilts into 84Hz Shadow Mode, the atmosphere darkens, shadows lengthen, and the air grows heavy. NPCs become guarded, secretive, or undergo eerie physical transformations:

- **The Storyteller:** Ceases telling stories entirely. The Storyteller sits in absolute silence, staring into cold hearth embers, refusing all casual conversation.
- **The Firekeeper:** The vibrant hearth fire dims to a low violet ember. The Firekeeper's voice drops to a hushed whisper, issuing cryptic warnings about deep shadows and unremembered debts.
- **Beverley (The Librarian):** Locks the main doors to the Archive stacks, patrolling the upper gallery with a brass lantern, inspecting shadows for frequency leaks.
- **Gargoyle Puppies:** Harden into motionless stone statues along the parapets, eyes faintly glowing crimson until the frequency restores.
- **Fae Court Members:** Put on rigid porcelain masks, retreat into spider-silk alcoves, and speak only in reversed poetic couplets.
- **Water Zone Sea Creatures:** Retreat into deep abyssal trenches, leaving empty echo-chambers where tidal songs normally resonate.

### 4.4 In-Between Mode Oscillation
In-Between Mode represents an unstable harmonic transition state. NPCs oscillate between Living and Shadow behaviors:

- **Visual Flickering:** NPC sprites and character models experience subtle phase-flickering, casting dual shadows.
- **Voice Modulation:** Dialogue audio shifts between warm resonant tones and hollow echoed whispers mid-sentence.
- **Pathing Instability:** NPCs frequently interrupt their scheduled walking paths, pausing to inspect wall corners or turning around before resuming movement.
- **Oscillation Wave Equation:** The harmonic variance $V(t)$ at time $t$ is modeled as:

$$V(t) = \sin(2\pi \cdot 42 \cdot t) + \sin(2\pi \cdot 84 \cdot t) = 2 \cdot \sin(2\pi \cdot 63 \cdot t) \cdot \cos(2\pi \cdot 21 \cdot t)$$

This mathematical difference tone creates a 21Hz modulation beat, causing character behavior to flicker every 0.047 seconds between relaxed openness and guarded paranoia.

---

## 5. Whisper Layer Integration & Behavior Tracking

### 5.1 The Eavesdropping Engine
The Whisper Layer is the Inn's underlying awareness network. It records every action, path, preference, and routine established by the player. The Wandering Program reads Whisper Layer metrics to dynamically adjust NPC routines and build personalized interactions.

### 5.2 Whisper Tier Progression Mechanics
Player behavior unlocks five progressive Whisper Tiers, each altering NPC schedule behaviors globally:

- **Tier 1 (Surface Awareness):** NPCs acknowledge the player's presence with polite nods; baseline routines execute without variance.
- **Tier 2 (Pattern Recognition):** NPCs notice repeated player routes and begin waiting in preferred rooms 5 minutes early.
- **Tier 3 (Harmonic Synchronization):** NPCs share secret dialogue options and invite the player to join private routines (such as morning tea or late-night stargazing).
- **Tier 4 (Archival Memory):** NPCs reference past player choices from earlier game sessions, altering their schedule destinations to assist active quest steps.
- **Tier 5 (Deep Resonance):** Global schedule overrides unlock (e.g., the Reader leaving the Solarium Window Seat for the deep Catacomb vault).

### 5.3 Expectation Mechanics: The Positive Reinforcement Loop
If the player repeatedly visits a specific NPC during a particular quadrant over consecutive days, the Whisper Layer registers a high-affinity bond. The target NPC begins modifying their routine to anticipate the player's arrival:

- **The Crone's Tea Expectation:** If the player visits the Crone at the Main Floor Hearth every evening, the Crone adjusts their schedule to arrive 15 minutes early. The Crone sits in the velvet wingback chair with a steaming pot of herbal tea already prepared, placing a second cup on the side table before the player enters the room.
- **The Reader's Window Nook:** If the player frequently reads in the Solarium, the Reader leaves an open manuscript marked with a silk ribbon on the adjacent bench.
- **The Catalyst's Preparation:** The Catalyst sets aside a specific amber glass on the bar counter whenever the player enters the tavern wing during evening hours.
- **The Astronomer's Pre-Calculated Astrolabe:** The Astronomer prepares star-charts in advance, leaving calculated celestial coordinates ready on the drafting table.

```
[ Player Visits NPC Daily ] ---> (Whisper Layer Records Pattern)
                                              |
                                              v
[ NPC Modifies Routine ] -------> (Arrives Early / Prepares Item)
                                              |
                                              v
[ Personalized Encounter ] <---- (Tea Ready / Seat Saved)
```

### 5.4 Isolation & Messenger Mechanics: The Avoidance Loop
When the player deliberately avoids an entire structural level or zone (e.g., neglecting the Catacombs for several consecutive game days), the NPCs of that zone do not remain forgotten. They use the Wandering Program to send messages through cross-zone travelers:

- **Catacomb Messengers:** If the Catacombs are ignored, Beverley or Charles writes a folded note on thick parchment. They hand the note to a wandering Brownie or the Catalyst, who delivers it to the player at the Main Floor Bar: *"Beverley notes your absence in the stacks. A ledger regarding your ancestry remains unread."*
- **Cosmology Avians:** If the player avoids the sky branches, Clockwork Avians fly down to the Main Floor courtyard, dropping star-chart scrolls at the player's feet.
- **Fae Kingdom Petals:** If the Fae Glades are neglected, shimmering silver petals appear under the door of the player's private chamber, bearing scented glyphs of invitation.
- **Water Zone Shells:** If the Aquifers are ignored, salt-encrusted seashell scrolls appear on the tavern counter, echoing distant whale song.

---

## 6. The NPC Relationship System & Cohort Dynamics

### 6.1 Inter-NPC Affinity Matrix
NPCs possess personal relationships, professional ties, and longstanding rivalries that dictate their wandering pathing and idle positioning. Characters who enjoy each other's company seek shared spaces; rivals alter their pathing to maintain a minimum separation distance of 15 meters.

### 6.2 Key Cohorts & Special Dynamic Interactions

#### 6.2.1 The Firekeeper & The Catalyst
The Firekeeper and the Catalyst operate as an inseparable performative cohort. They share identical quadrant schedules for evening dining and hearth maintenance. While locked in perpetual bickering over hearth lore versus patron secrets, they always eat together at the central hearth bench.

#### 6.2.2 The Beverley Silence Radius
One of the most distinct systemic rules in the Geode Inn is the "Beverley Pause Trigger." 

- Beverley (The Librarian) is two-thirds human size, clad in a high-collared dark coat with brass buttons and silver spectacles.
- When Beverley walks past the Central Hearth or Bar while the Firekeeper is declaiming grand lore or the Catalyst is polishing glass, a silent aura triggers within a 5-meter radius.
- The instant Beverley passes, the Firekeeper's voice halts mid-sentence. The Catalyst's polishing cloth freezes in mid-motion. For exactly 3 seconds—the duration of Beverley's passage—the two most performative entities in the Inn remain dead silent and completely still.
- Once Beverley moves out of range, the Firekeeper clears their throat and picks up the sentence as if uninterrupted. Neither character ever acknowledges the pause.

```
[ Firekeeper Declaiming Lore ] + [ Catalyst Polishing Glass ]
                               |
                   (Beverley Walks Within 5m)
                               |
                               v
            [ 3-SECOND ABSOLUTE SILENCE TRIGGER ]
                               |
                   (Beverley Passes Out of Range)
                               |
                               v
[ Firekeeper Resumes Sentence ] + [ Catalyst Resumes Polishing ]
```

#### 6.2.3 The Storyteller & The Reader
The Storyteller and the Reader form a quiet friendship based on mutual silence. During afternoon hours, both characters navigate to the Library Alcove or Solarium Window Seat. They sit side by side for hours without speaking a single word, reading complementary texts in companionable peace.

#### 6.2.4 The Allfather & The Canopy Watchers
The Allfather maintains a high-altitude monitoring bond with Huginn, Muninn, and the Canopy Owls. They coordinate sky-level observation vectors, alerting the Wandermaster when cryptid entities prepare to wander into external National Park zones.

### 6.3 Inter-NPC Relationship Summary Table

| Character A | Character B | Affinity Status | Systemic Behavior |
|---|---|---|---|
| **The Firekeeper** | **The Catalyst** | Performative Cohort | Shared dining, constant hearthside bickering |
| **Beverley** | **Firekeeper & Catalyst** | Silence Trigger | 5m radius triggers 3-second absolute silence |
| **The Storyteller** | **The Reader** | Quiet Friends | Silent companionable reading in Solarium |
| **The Crone** | **Cthulhu** | Teatime Allies | Solstice tea gathering at Main Floor Hearth |
| **The Astronomer** | **Anna** | Mentor & Doodler | Anna's chalk drawings annotate celestial math |
| **Uhtred** | **Beorn** | Martial Rivals | Avoid shared narrow corridors; duel in courtyard |
| **The Wandermaster**| **Brownies** | Administrator | Dispatches Brownies to National Park zones |

### 6.4 Group Migrations & Solstice Gatherings
On specific calendar days or planetary alignment events, group migration overrides trigger across the entire NPC population:

- **Communal Supper (Every Sunday Evening):** Over 30 NPCs gather in the Great Dining Hall for a synchronized feast.
- **Choir of the Stillness:** During mid-winter alignments, celestial and archival NPCs gather on the Grand Spiral Staircase to sing harmonic resonances that stabilize the Inn's 42Hz core.
- **Festival of the First Ember:** At the start of autumn, all hearth-keepers and craftsmen assemble at the central hearth to rekindle the primal fire.

---

## 7. Deviation Events & Milestone Override System

### 7.1 Definition of Deviation Events
A Deviation Event is a rare, hard-coded schedule override triggered exclusively by major player milestones, quest chain conclusions, or global narrative shifts. During a Deviation Event, an NPC breaks their routine entirely, moving to an uncharacteristic location to mark a historical moment.

### 7.2 Major Narrative Deviation Events Summary

```
+-------------------+----------------------------------+--------------------------------------+
| NPC               | Trigger Condition                | Deviation Location & Behavior        |
+-------------------+----------------------------------+--------------------------------------+
| The Astronomer    | Observatory Quest Chain Active   | Descents to Main Floor Hearth        |
| The Reader        | Whisper Layer Tier 5 Reached     | Leaves Window Seat for Catacomb Core |
| Nyx               | Endgame Convergence Threshold    | Appears at Main Floor Threshold      |
| The Cartographer  | New Escher Wing Unlocked         | Surveys Unmapped Spatial Corridor    |
| Cthulhu           | Solstice Harmonic Alignment      | Rises to Crone's Evening Tea Service |
| The Wandermaster  | Cryptid Frequency Spikes         | Visits National Park Portal Gate     |
+-------------------+----------------------------------+--------------------------------------+
```

### 7.3 Deviation Event Narrative Scripts (Tabletop Questline Voice)

#### 7.3.1 Script: The Astronomer's Descent
*The Grand Spiral Staircase echoes with unaccustomed footfalls. The Astronomer, who has not stepped below the celestial observatory in forty years, descends into the firelight of the Main Floor. In hand, the brass astrolabe catches the amber glow of the Central Hearth.*

*"The calculation is finished," the Astronomer says, voice dry as parchment. "The song requires an observer at the root. The firelight will suffice."*

#### 7.3.2 Script: The Reader's Unseating
*The Solarium Window Seat stands empty for the first time in memory. The embroidered cushion, hollowed by centuries of stillness, holds only a single silk ribbon. Below, in the deepest stone vault of the Root Catacombs, the Reader stands before the Iron Door, key turned, waiting for the player to step into the dark.*

*"The reading is complete," the Reader whispers. "Now begins the writing."*

#### 7.3.3 Script: Nyx's Emergence
*The threshold of the Main Floor grows cold. Shadows stretch upward toward the timber beams. In the archway stands Nyx, shrouded in cosmic silence. No voice leaves Nyx's lips, yet every timber in the Inn hums at 0.3Hz.*

*"Rest," the silence echoes. "The Song rests. The stillness holds."*

---

## 8. The Cartographer & Escher Mapping System

### 8.1 System Navigator & Map Anchor
The Cartographer is the primary NPC responsible for tracking spatial topology and live character locations across the Geode Inn. Clad in ink-stained robes with brass compasses pinned to their collar, the Cartographer operates out of the Drafting Nook on the Main Floor.

### 8.2 Live Location Tracking & Map Mechanics
The player can visit the Cartographer at any time to consult the Master Map:

- **NPC Pinpoint Inquiries:** The player can ask the Cartographer for the current real-time location of any NPC. The Cartographer adjusts their spectacles, places a brass pin on the parchment map, and provides exact location vectors ("The Storyteller is currently ascending the East Staircase toward the Aviary").
- **Escher Shift Reconciliation:** The Cartographer explains topological shifts to the player, updating map connections whenever corridors expand or flip.

```
[ Player Asks Cartographer ] ---> (Query NPC: "Where is Beverley?")
                                            |
                                            v
[ Real-Time Tracking Lookup ] --> (Reads Wandering Engine Vector)
                                            |
                                            v
[ Map Pinpoint Output ] --------> ("Beverley is in Stack 4, Catacombs")
```

### 8.3 Cartographer Dialogue Script (Tabletop Voice)
*The Cartographer dips a steel nib into living blue ink, tracing a shifting corridor that bends back upon itself like a ribbon.*

*"You seek someone?" the Cartographer asks without looking up. "The Inn is expanding this morning. Beverley is currently in Stack 4 of the Root Catacombs, shelving folios on forgotten star-maps. Follow the spiral stair until the steps turn clockwise. If the steps turn counter-clockwise, you have entered yesterday's hallway. Turn around and count three archways."*

---

## 9. Comprehensive NPC Schedule Catalog & System Reference Data

### 9.1 Master Schedule Matrix Across the 6 Structural Tiers

| NPC Title / Name | Tier / Location | Morning (06-12) | Afternoon (12-18) | Evening (18-00) | Night (00-06) |
|---|---|---|---|---|---|
| **The Firekeeper** | Trunk (Main Floor) | Hearth Prep | Storytelling (Hearth) | Shared Feast / Bar | Embers Vigil |
| **The Catalyst** | Trunk (Main Floor) | Bar Inventory | Patron Dialogue | Shared Feast / Bar | Cellar Sorting |
| **Beverley** | Roots (Catacombs) | Archive Cataloging | Stack Inspection | Reading Nook | Vault Patrol |
| **The Crone** | Roots / Main Floor | Herbal Garden | Root Catacombs | Tea Service (Hearth) | Bedchamber Vigil |
| **The Storyteller** | Trunk (Main Floor) | Solarium Reading | Great Hall Tales | Hearth Gatherings | Silent Reflection |
| **The Reader** | Trunk (Main Floor) | Solarium Window | Library Alcove | Solarium Reading | Archival Sleep |
| **The Cartographer**| Trunk (Main Floor) | Map Drafting | Escher Survey | Drafting Nook | Observatory Observation |
| **The Astronomer** | Branches (Cosmology)| Astrolabe Check | Celestial Math | Stargazing Deck | Observatory Sleep |
| **Anna** | Branches (Cosmology)| Drawing Nook | Observatory Doodles| Gallery Walk | Rest |
| **The Allfather** | Canopy / Branches | High Balcony Vigil | Canopy Patrol | Great Hall Corner | Celestial Watch |
| **Uhtred** | Nodes (Norse Zone) | Armory Prep | Longhouse Practice | Hearth Stories | Campfire Rest |
| **The Wandermaster**| Trunk (Main Floor) | Desk Registry | Cryptid Tracking | Archive Logging | Burrow Rest |
| **The Cook** | Trunk (Main Floor) | Kitchen Prep | Cooking Lunch | Dinner Feast Prep | Pantry Check |
| **Captain** | Branches (Cosmology)| Sky Bridge Walk | Aviary Inspection | Tavern Deck | Aviary Quarters |
| **The Cabbit (Eres)**| Trunk / All Tiers | Hearth Sunbeam | Lap Sitting (Bar) | Solarium Napping | Roof Stalking |
| **Cthulhu** | Aquifers (Water) | Abyssal Pool | Surface Grotto | Submerged Shrine | Abyssal Sleep |
| **Charles** | Roots (Catacombs) | Specimen Vault | Geological Survey | Natural History Nook| Vault Rest |
| **Gesso** | Nodes (Gallery) | Canvas Prep | Gallery Painting | Studio Nook | Rest |
| **Einstein** | Branches / Solarium | Observatory Bench | Calculation Nook | Solarium Chess | Night Study |
| **Nyx** | The Void Realm | Void Realm | Void Realm | Void Realm | Void Realm |
| **Jay** | Trunk (Main Floor) | Reception Desk | Lobby Greeting | Tavern Chat | Quarters Rest |
| **Dani** | Trunk (Main Floor) | Courtyard Garden | Botanical Care | Solarium Chat | Quarters Rest |
| **Beorn** | Nodes (Mediterranean)| Border Guard | Shield Practice | Terrace Wine | Border Vigil |
| **The Mason** | Roots (Undercity) | Stone Cutting | Archway Repair | Forge Hearth | Cavern Rest |
| **The Clockmaker** | Roots (Undercity) | Gear Tuning | Chronometer Check | Workshop Tea | Rest |
| **The Blacksmith** | Roots (Undercity) | Forge Firing | Anvil Hammering | Undercity Tavern | Forge Sleep |
| **Queen of Webs** | Canopy (Fae Realm) | Loom Threading | Silk Weaving | Canopy Bower | Silk Vault |
| **Seelie Prince** | Canopy (Fae Realm) | Meadow Walk | Court Assembly | Banquet Hall | Pavilion Sleep |
| **Unseelie Duke** | Canopy (Fae Realm) | Shadow Hunting | Court Bicker | Gloaming Glade | Shadow Sleep |
| **The Owl Sentinel**| Canopy (Fae Realm) | High Nest Sleep | Nest Resting | Sky Patrol | Night Canopy Vigil |

### 9.2 TypeScript Engine Definitions

```typescript
export type FrequencyState = '42HZ_LIVING' | '84HZ_SHADOW' | 'IN_BETWEEN';
export type TravelMode = 'WALKING' | 'CLIMBING_STAIRS' | 'PORTAL_TRANSIT' | 'ESCHER_REROUTE';

export interface NPCScheduleNode {
  nodeId: string;
  zoneTier: number; // 1 to 6
  subLocationName: string;
  activityName: string;
  idleAnimationTrigger: string;
  isQuestGiverActive: boolean;
}

export interface NPCScheduleState {
  npcId: string;
  nameTitle: string;
  currentZone: string;
  currentSubNode: string;
  targetZone: string;
  targetSubNode: string;
  travelMode: TravelMode;
  travelSpeed: number; // meters/sec
  frequencyOverride: FrequencyState;
  whisperExpectationActive: boolean;
  deviationEventActive: boolean;
  activeDeviationId?: string;
  interactionRadius: number;
}
```

---

## 10. Summary & Builder Implementation Checklist

To complete integration of the Wandering Program into the Geode Inn codebase, builders must execute the following validation steps:

1. **Verify Voice Compliance:** Scan all dialogue files and schedule triggers to guarantee absolute zero presence of gendered pronouns.
2. **Node Path Topology:** Ensure all 6 structural tiers possess interconnected A* pathfinding graphs across stairs, corridors, and portals.
3. **Beverley Silence Proximity Engine:** Test the 5-meter proximity bubble around Beverley to ensure the 3-second absolute silence event halts Firekeeper and Catalyst routines accurately.
4. **Frequency Toggle Validation:** Confirm that shifting the Inn's global frequency between 42Hz, 84Hz, and In-Between updates NPC postures, hearth flames, and dialogue registers instantly.
5. **Cartographer Query Pipeline:** Link the Cartographer's dialogue UI directly to the live `NPCScheduleState` vector table for real-time map pin placement.

---
