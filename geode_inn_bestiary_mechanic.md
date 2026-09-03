# Geode Inn — The Bestiary: Creature Compendium Mechanic Design Document

> **Document Version:** 1.0  
> **Project:** Geode Inn Game Project  
> **Module:** Library Archive & Creature Compendium Mechanic  
> **Target File:** `geode_inn_bestiary_mechanic.md`  

---

## 1. System Overview & Creative Vision

The **Bestiary** in the Geode Inn is not a floating HUD menu or a sterile UI list. It is a living, physical artifact located on an oak reading desk in the Inn's Library and accessible via the player’s personal codex inventory. Styled as a heavy leather-bound tome embossed with gilded Yggdrasil filigree, its pages turn with an audible parchment rustle layered over a subterranean 42Hz sub-bass thump—the fundamental heartbeat of the Inn-Tree.

The Geode Inn functions simultaneously as a game hub and a global mythological archive. The database catalogs **1,268 mythological creatures from 191 countries**. Within active gameplay, these entries bridge narrative lore, combat encounters, exploration tracking, and community moderation.

```
+-----------------------------------------------------------------------------------+
|                                 THE BESTIARY                                      |
|                                                                                   |
|  +---------------------------------+  +----------------------------------------+  |
|  | [VISUAL PORTRAIT / SILHOUETTE]  |  | CREATURE NAME: The Siren               |  |
|  |                                 |  | ORIGIN: Greece (Aegean Sea)            |  |
|  | [Presence: Full Presence]       |  | ZONE: The Docks / Layer 5 Deep Water   |  |
|  | [Depth Gauge: Layer 2 & 5]      |  | STATS: HP 1,420 | FREQ: 20Hz / 432Hz    |  |
|  | [Court: Neutral / Coastal]      |  |                                        |  |
|  |                                 |  | "She does not sing to drown you...     |  |
|  | < Discovery State: Mastered >   |  |  She sings because the shore is quiet, |  |
|  |                                 |  |  and quiet is a dangerous thing..."    |  |
|  +---------------------------------+  +----------------------------------------+  |
|  [Page 104/1268]                     [ Scholarly Mode: OFF (Naut Quest 0) ]    |
+-----------------------------------------------------------------------------------+
```

### Key Design Pillars
1. **Skeuomorphic Immersion**: Heavy leather, weathered parchment, gold foil lettering (`#c9a84c`), dark background (`#0a0805`), and tactile audio feedback.
2. **Tabletop Narrative Voice**: All lore text is written in the voice of the original Geode Inn tabletop questline (*"Festival in the Middle of a Raid"*), modeled on Patrick Rothfuss’s *The Name of the Wind*—lyrical, grounded, clever, direct, and laden with foreshadowing and pregnant pauses (`...`).
3. **Mythological Archive Integration**: Direct synchronization with the Inn’s `Lore` database entity, organizing 1,268 global entries across 191 countries, including 78 cataloged water monsters and 32 active water combat creatures.
4. **Multi-System Interlock**:
   - **Water Depth Gauge**: 7-layer ocean/water depth classification.
   - **Fae Court Alignment**: Seelie (Summer/Light) vs. Unseelie (Winter/Dark) for Alfheim/Svartalfheim entities.
   - **Presence Scale**: Full Presence (boss/mythic scale) vs. Chibi (common/compact encounters).
   - **Frog Transformation Moderation**: Documentation of frog-curse triggers and community self-defense rites.
   - **Scholarly Mode**: A 3-quest chain led by Naut the Scholar that unlocks deep mythological root context, comparative folklore, and frequency counters.

---

## 2. Skeuomorphic & Visual UI/UX Layout

### 2.1 Color Palette & Typography
The visual design mirrors the architectural theme of the Geode Inn—warm obsidian, burnished brass, aged gold, and parchment lit by fireplace embers.

| Component | Hex Code | Purpose / Application |
| :--- | :--- | :--- |
| **Obsidian Leather (BG)** | `#0a0805` | Background canvas, outer book frame, deep padding shadow |
| **Aged Embossed Gold** | `#c9a84c` | Titles, section headers, borders, gold leaf accents |
| **Illuminated Parchment** | `#e2d19f` | Primary body text, folklore quotes, field labels |
| **Antique Ink** | `#8a7541` | Secondary metadata, inactive tabs, unread footnotes |
| **Seelie Summer Green** | `#4ca66b` | Fae Court alignment badge (Seelie), light linework |
| **Unseelie Winter Ice** | `#4a8da8` | Fae Court alignment badge (Unseelie), angular linework |
| **Abyssal Water Blue** | `#1b4965` | Depth Gauge active indicator, water monster badge |
| **Amphibian Jade** | `#3b7a57` | Frog Moderation Tethered badge |

- **Primary Font Family**: `Georgia`, `serif` (Body lore, narrative quotes, footnotes).
- **Header Font Family**: `Cinzel`, `Garamond`, `serif` (Creature titles, chapter titles, gold foil headers).
- **Monospace Metadata**: `Courier Prime`, `monospace` (Resonance Hz, database IDs, raw stat blocks).

---

### 2.2 Physical Book Presentation
When opened, the Bestiary fills the screen as a two-page open book spread against a darkened background (`#0a0805`).

```
==================================================================================================
|                                     THE BESTIARY OF GEODE INN                                  |
|================================================================================================|
| SEARCH: [ Search 1,268 creatures... ]   FILTER: [ Zone v ] [ Country v ] [ Depth v ] [ Court v]|
|------------------------------------------------------------------------------------------------|
| LEFT PAGE (Visual & Categorization)             | RIGHT PAGE (Lore & Statistics)               |
|                                                 |                                              |
| +---------------------------------------------+ | CREATURE: The Siren                          |
| |                                             | | MYTHOLOGY: Greek Mythology                 |
| |                                             | | COUNTRY: Greece (191 Global Catalog)         |
| |             [ CREATURE PORTRAIT ]           | | ZONE: The Docks / Layer 5 Deep Water         |
| |            (Full Presence Render)           | | PRESENCE: Full Presence (Boss/Mythic)        |
| |                                             | |                                              |
| +---------------------------------------------+ | [ STATS BLOCK ]                              |
|   CLASSIFICATION: Water Entity                  | |   HP: 1,420    ATK: 85 (Acoustic/Charm)       |
|   DEPTH GAUGE: [1][2*][3][4][5*][6][7]          | |   DEF: 42      RES: 20Hz / 432Hz              |
|   COURT ALIGNMENT: N/A (Coastal Neutral)        | |   WEAKNESS: Silent Quartz / 528Hz Harmonic   |
|   FROG AFFINITY: None                           | |                                              |
|                                                 | | [ NARRATIVE LORE - ROTHFUSS VOICE ]        |
|   COLLECTION STATE: [Mastered]                  | | "You do not hear the Siren with your ears. |
|   DISCOVERY DATE: Day 14, Cycle of the Moon     | |  You hear her in the back of your teeth..."|
|                                                 | |                                              |
|   [ < PREVIOUS ENTRY ]                          | | [ SCHOLARLY FOOTNOTE (CTHULHU) - LOCKED ]    |
|                                                 | | [ NEXT ENTRY > ]                           |
|------------------------------------------------------------------------------------------------|
| PAGE 104 OF 1268 | [ SOUND: ON ]                | SCHOLARLY MODE: [ OFF ] (Requires Quest 1)   |
==================================================================================================
```

### 2.3 Interactive Controls & Audio Cues
- **Page Flip Animation**: 30 FPS skeletal page-curl shaders simulating thick vellum paper.
- **Audio Sound Effects**:
  - **Page Turn**: High-frequency paper rustle paired with a low-frequency 42Hz impulse response recorded from stone acoustics.
  - **Scholarly Mode Toggle**: Heavy brass latch click (`clack-hiss`) accompanied by a faint 432Hz tuning fork chime.
  - **New Entry Discovered**: Golden leaf shimmer effect with a 528Hz harmonic chime.

---

## 3. Bestiary Entry Template & Schema

Every entry in the Bestiary follows a rigid structural template designed for both UI rendering and database synchronization.

### 3.1 Field Structure Breakdown

```typescript
interface BestiaryEntry {
  // Core Identifiers
  id: string;                         // Unique ID (e.g., "creature_siren_001")
  name: string;                       // Common name
  nativeName?: string;                // Name in original language
  mythologyOrigin: string;            // Origin mythology (e.g., "Greek Mythology")
  country: string;                    // Country of origin (matches 191 global roster)
  region: string;                     // Specific region or body of water

  // Spatial & Game Categorization
  zoneFound: string;                  // Geode Inn Zone (e.g., "The Docks", "Alfheim")
  presenceType: "Full Presence" | "Chibi"; // Boss/Mythic vs. Common encounter
  category: "Standard" | "Fae" | "Water" | "Frog-Tethered";

  // Specialized Attributes
  courtAlignment?: "Seelie" | "Unseelie" | "Neutral"; // Required for Fae creatures
  waterDepthLayer?: number[];         // Layers 1-7 (Required for Water creatures)
  frogAffinity: {
    isFrogTethered: boolean;          // Connected to Frog Moderation Mechanic
    role?: "Curse Giver" | "Transformed State" | "Moderation Warden";
    transformationLore?: string;
  };

  // Game & Combat Statistics
  combatStats?: {
    hp: number;
    attack: number;
    attackType: "Physical" | "Acoustic" | "Arcane" | "Tidal" | "Fae Illusion";
    defense: number;
    resonanceFreqHz: number;          // Resonant frequency (e.g., 20, 42, 111, 432, 528)
    weakness: string;
    resistances: string[];
    dropTable?: Array<{ item: string; chancePercent: number }>;
  };

  // Narrative Text (Rothfuss Voice)
  loreText: {
    summary: string;                  // Direct, clever opening
    prose: string;                    // Lyrical narrative with ellipses
    foreshadowing: string;            // Hint toward broader Inn mysteries
  };

  // Scholarly Mode (Unlocked via Naut Quest Chain)
  scholarlyMode: {
    unlockedLevel: 0 | 1 | 2 | 3;     // 0 = Locked, 1 = Etymology, 2 = Comparative, 3 = Root
    etymology?: string;               // Unlocked by Quest 1
    comparativeFolklore?: string;     // Unlocked by Quest 2
    primordialRootText?: string;      // Unlocked by Quest 3 (Naut's personal commentary)
  };

  // Collection State
  discoveryState: "Unseen" | "Sighted" | "Encountered" | "Mastered" | "Scholarly Mastered";
}
```

---

## 4. Specialized Creature Mechanics & Attributes

### 4.1 Water Creatures & The 7-Layer Depth Gauge
Water connects the sky canopy to the deep subterranean core. The **78 cataloged water monsters** and **32 active combat encounters** are mapped directly across the **Seven Water Layers**.

```
+---------------------------------------------------------------------------------+
|                         WATER CREATURE DEPTH GAUGE                              |
|                                                                                 |
|  [L1] RAIN & TROVANTS   :: Surface solution, 42Hz mineral deposit               |
|  [L2] AEGEAN SURFACE    :: Sunlight reflection, Siren's Dock, coastal shallows   |
|  [L3] TIDAL COAST       :: 50 BPM heartbeat pulse, Pirate's caves, tide pools    |
|  [L4] CHARON'S RIVER    :: Memory water, subterranean catacomb river              |
|  [L5] THE SIREN'S DEEP  :: Subsonic <20Hz, deep abyssal monsters, water labyrinth  |
|  [L6] ATLANTIS          :: 432Hz crystal hum, Drowned Library, Merfolk realm   |
|  [L7] CRYSTAL CORE      :: Primordial 42Hz carrier wave, Constant's depth       |
+---------------------------------------------------------------------------------+
```

#### Depth Gauge UI Render
In the entry view, water creatures feature a horizontal gauge bar with illuminated blue gem nodes corresponding to their native depth layers:
- **Layer 1 (Rain/Trovants)**: e.g., Trovant Water Elemental
- **Layer 2 (Surface)**: e.g., Lake Mermaid, Selkie (Land Form)
- **Layer 3 (Tidal)**: e.g., Kelpie, Bluecap
- **Layer 4 (Underground River)**: e.g., Charon's River Serpent, Styx Nixie
- **Layer 5 (Deep Water)**: e.g., The Siren, Nessie, Bunyip, Lindwurm
- **Layer 6 (Atlantis)**: e.g., Merfolk Scholar, Deep Kraken
- **Layer 7 (Crystal Core)**: e.g., Primordial Leviathan, Naut's True Aspect

---

### 4.2 Fae Creatures & Court Alignment
Fae creatures in Alfheim (Summerlands) and Svartalfheim (The Hollow/Labyrinth) belong to the Seelie or Unseelie Courts.

```
+---------------------------------------------------------------------------------+
|                           FAE COURT ALIGNMENT                                   |
|                                                                                 |
|   SEELIE COURT (Summerlands)           |   UNSEELIE COURT (Winter Labyrinth)    |
|   - Alignment: Light / Green / Gold    |   - Alignment: Shadow / Ice / Obsidian |
|   - Linework: Soft, flowing gradients  |   - Linework: Sharp, angular, geometric|
|   - Quests: Riddles, songs, crafts     |   - Quests: Combat, tricks, tests      |
|   - Entities: Ents, Light Mermaids,    |   - Entities: Trolls, Goblins, Orcs,   |
|     Griffin Boss, Seelie King/Queen    |     Bwca, Unseelie King (Jareth)       |
+---------------------------------------------------------------------------------+
```

#### Chibi vs. Full Presence Fae Roster
The Fae Kingdom relies heavily on **Chibi creatures**—compact, highly expressive, stylized encounters that maintain charm even in combat:
- **Chibi Fae Creatures**: Goblins, Trolls, Orcs, Ents, Dwarves, Mermaid, Bwca.
- **Full Presence Fae Entities**: The Seelie King, The Unseelie King (Jareth), The Griffin (Crystal Gardens Boss), The Queen of Webs.

---

### 4.3 Presence Scale: Full Presence vs. Chibi
The Geode Inn balances grand mythic scale with warm accessibility through a dual presence system:

1. **Full Presence (Boss / Mythic Scale)**:
   - High-fidelity visual presentation, custom atmospheric lighting, intricate animation rigs.
   - Reserved for major narrative anchors: *The Siren, Medusa, Odin, Charon, Naut, The Griffin, Anubis, The Morrigan*.
   - Entry features full 3D interactive preview and detailed harmonic weakness matrices.

2. **Chibi (Common Encounters / Expressive Folk)**:
   - Stylized, compact geometry, emphasized expressions, playful combat animations.
   - Used for common encounters, regional wildlife, and Fae minion tiers: *Huginn & Muninn, Chullachaqui, Goblins, Trolls, Orcs, Ents, Dwarves*.
   - Entry features stylized sketches and humorous behavioral anecdotes.

---

### 4.4 The Frog Transformation Moderation Connection

```
+---------------------------------------------------------------------------------+
|                  FROG TRANSFORMATION MODERATION MECHANIC                        |
|                                                                                 |
|  [ Aggressive / Antagonistic Player ] --( Community Rite )--> [ Transformed Frog]|
|                                                                                 |
|  - Rite: "The Rite of the Amphibian" (Mythic reclamation of power)              |
|  - Rule: 3 Frog transformations = Temporary Suspension                          |
|  - Bestiary Function: Documents Frog-Curse Affinities & Restoration Quests      |
+---------------------------------------------------------------------------------+
```

#### Mythological & Narrative Philosophy
In the Geode Inn, moderation is not a modern ban button or an invisible admin flag—it is **folklore doing work**. When a player exhibits persecutory, hostile, or abusive behavior, community members can perform *The Rite of the Amphibian*, transforming the aggressor into a croaking frog.

Three transformations result in a temporary suspension from the Inn. This inverts historical dynamics of persecution: victims reclaim agency through mythic transformation (recalling Circe turning men into swine, or witches turning harassers into toads).

#### Bestiary Integration
The Bestiary tags specific creatures with a **Frog Moderation Tether**:
1. **Curse Givers**: Creatures whose folklore centers on turning the arrogant or cruel into frogs (e.g., *Medusa of the Stone Frogs*, *Circe*, *The Bog-Witch*, *Tiddalik*).
2. **Transformed States**: Detailed entries on the *Player Frog Form* (jump height, croak frequencies, lily pad navigation).
3. **Moderation Wardens**: NPCs who guide transformed frogs through penance and rehabilitation quests before restoring their human skin.

---

## 5. Collection Mechanics & Player Progression

Discovering and cataloging creatures is a central gameplay loop in the Geode Inn. Players advance entries through **5 Discovery States**.

```
+---------------------------------------------------------------------------------+
|                           DISCOVERY STATE PROGRESSION                           |
|                                                                                 |
|  [1. UNSEEN]      --> Silhouette, '???', Page Locked                            |
|  [2. SIGHTED]     --> Pencil Sketch, Country of Origin, Zone Location           |
|  [3. ENCOUNTERED] --> Full Render, Basic HP/Atk, Rothfuss Lore Text Unlocked    |
|  [4. MASTERED]    --> Full Stat Matrix, Resonant Frequency, Drop Rates Unlocked |
|  [5. SCHOLARLY]   --> Naut's Footnotes, Etymology, Primordial Root Text     |
+---------------------------------------------------------------------------------+
```

### 5.1 Unlock Triggers
- **Sighted**: Spotting a creature through the Spyglass, seeing its shadow in deep water, or reading its name in a library scroll.
- **Encountered**: Engaging in dialogue, entering combat, or surviving an encounter.
- **Mastered**: Defeating/befriending the creature 5 times, solving its riddle, or harvesting its harmonic stone.
- **Scholarly Mastered**: Completing Naut’s 3-stage book retrieval quest chain and reading the creature's ancient folio in the Miskatonic Annex.

### 5.2 Visual & Audio Feedback
When a new creature is added or elevated to a higher discovery state:
1. The Bestiary icon in the HUD pulses with an ember-gold glow (`#c9a84c`).
2. Opening the page triggers a **528Hz harmonic chime** overlaid with a crisp parchment flip.
3. Illuminated gold filigree paints itself onto the margins of the entry page in real time.

---

## 6. Naut's Scholarly Quest Chain

### 6.1 Character Profile: Naut the Scholar
Naut sits by the fireplace in the Catacombs / Miskatonic Annex—a 4-foot squid-headed academic wearing brass spectacles, sipping tea, and peering through ancient folios.

- **Dual Cadence Voice**:
  - *Spectacles ON*: Gary Oldman—mild-mannered, erudite, soft-spoken, deeply encouraging of human curiosity.
  - *Spectacles OFF*: Geoffrey Rush—slightly irked, thunderously ancient, revealing the cosmic horror underneath before adjusting his glasses and coughing politely.

```
+---------------------------------------------------------------------------------+
|                    CTHULHU'S SCHOLARLY QUEST CHAIN                              |
|                                                                                 |
|  [ QUEST 1: The Dust on the Folios ]                                            |
|    -> Retrieve the Lost Lexicon from the Catacomb Stacks                        |
|    -> REWARD: Unlocks Scholarly Level 1 (Etymologies across 191 countries)       |
|                                                                                 |
|  [ QUEST 2: Comparative Mythologies of the Submerged ]                          |
|    -> Dive to Atlantis (Layer 6) & retrieve the Drowned Codex                  |
|    -> REWARD: Unlocks Scholarly Level 2 (Water Monster Depth Resonances)        |
|                                                                                 |
|  [ QUEST 3: The Language Before the Song ]                                      |
|    -> Recover the Starlight Tablet from the Crystal Core (Layer 7)             |
|    -> REWARD: Unlocks Scholarly Level 3 (Primordial Root Text & Full Toggle)    |
+---------------------------------------------------------------------------------+
```

---

### 6.2 Quest Details & Dialogue

#### Quest 1: "The Dust on the Folios"
- **Location**: Miskatonic Annex / Catacomb Archives
- **Objective**: Locate 3 missing parchment folios scattered among the gargoyle perches on the Staircase.
- **Naut's Dialogue**:
  > *"People assume madness comes from knowing too much... A charming misunderstanding. Madness comes from knowing only half a sentence and filling the rest with terror. Bring me the folios from the staircase. Let us finish the thought, shall we?"*
- **Bestiary Unlock**: Unlocks **Scholarly Mode Level 1** (Etymology and native linguistic roots for all cataloged creatures).

---

#### Quest 2: "Comparative Mythologies of the Submerged"
- **Location**: Layer 6 Atlantis / The Drowned Library
- **Objective**: Dive into Layer 6 wearing the Merfolk form and retrieve the *Submerged Codex of Tides*.
- **Naut's Dialogue**:
  > *"The surface dwellers think every water monster is a leviathan waiting to swallow their ships... But if you listen at four hundred and thirty-two hertz, you realize they are merely complaining about the noise on the surface. Fetch the codex from Atlantis. Let us read what they wrote when the water was still clear..."*
- **Bestiary Unlock**: Unlocks **Scholarly Mode Level 2** (Comparative cross-mythology mapping, depth resonances, and exact drop tables for all 78 water creatures).

---

#### Quest 3: "The Language Before the Song"
- **Location**: Layer 7 Crystal Core / Stone Circle Chamber
- **Objective**: Escort a resonant amber gargoyle to the Crystal Core root and transcribe the *Starlight Inscription*.
- **Naut's Dialogue**:
  > *(Adjusts spectacles, voice dropping an octave into resonant bass)*  
  > *"Before there was an Inn, before there was a tree, there was a frequency carrying a memory across the dark... You have cataloged their names and their teeth. Now learn what they were called before men had tongues to mispronounce them."*
- **Bestiary Unlock**: Unlocks **Scholarly Mode Level 3** (Naut's personal primordial annotations, true frequency hard counters, and the gold-embossed Scholarly Mode UI Toggle).

---

## 7. Integration with Existing Creature Database & Lore Entity

The Bestiary acts as the frontend presentation layer for the Geode Inn’s underlying database structure.

```
+---------------------------------------------------------------------------------+
|                        DATABASE & ENTITY ARCHITECTURE                           |
|                                                                                 |
|   1,268 TOTAL MYTHOLOGICAL CREATURES (191 Countries)                            |
|   |                                                                             |
|   +---> 78 Water Monster Database Entries                                       |
|   |     +---> 32 Active Water Combat Encounters (Mapped to 7 Layers)            |
|   |                                                                             |
|   +---> Fae Kingdom Roster (Alfheim / Svartalfheim)                             |
|         +---> Chibi Minions (Goblins, Trolls, Orcs, Ents, Dwarves, Mermaid)     |
|         +---> Full Presence Bosses (Seelie King, Jareth, The Griffin)           |
|                                                                                 |
|   BASE44 PLATFORM 'LORE' ENTITY SCHEMA:                                         |
|   { country, region, creatures[], waterCreatures[] }                            |
+---------------------------------------------------------------------------------+
```

### 7.1 Base44 `Lore` Entity Schema Definition

The Bestiary reads directly from and updates the `Lore` entity in the Base44 application platform.

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "Lore",
  "type": "object",
  "properties": {
    "id": { "type": "string" },
    "country": {
      "type": "string",
      "description": "Country name corresponding to the 191 global catalog (e.g., 'Greece', 'Japan', 'Romania', 'Ireland')"
    },
    "region": {
      "type": "string",
      "description": "Geographic or mythic region (e.g., 'Aegean Sea', 'Transylvanian Alps', 'Celtic Shallows')"
    },
    "creatures": {
      "type": "array",
      "description": "Catalog of land, air, fae, and mythic creatures originating from this country",
      "items": {
        "type": "object",
        "properties": {
          "creatureId": { "type": "string" },
          "name": { "type": "string" },
          "presenceType": { "type": "string", "enum": ["Full Presence", "Chibi"] },
          "courtAlignment": { "type": "string", "enum": ["Seelie", "Unseelie", "Neutral"] },
          "isFrogTethered": { "type": "boolean" },
          "loreSummary": { "type": "string" },
          "resonantFrequencyHz": { "type": "number" }
        },
        "required": ["creatureId", "name", "presenceType"]
      }
    },
    "waterCreatures": {
      "type": "array",
      "description": "Subset of the 78 global water monsters originating from this country",
      "items": {
        "type": "object",
        "properties": {
          "waterCreatureId": { "type": "string" },
          "name": { "type": "string" },
          "depthLayers": {
            "type": "array",
            "items": { "type": "integer", "minimum": 1, "maximum": 7 }
          },
          "isCombatEncounter": { "type": "boolean" },
          "combatStats": {
            "type": "object",
            "properties": {
              "hp": { "type": "integer" },
              "attack": { "type": "integer" },
              "defense": { "type": "integer" }
            }
          }
        },
        "required": ["waterCreatureId", "name", "depthLayers", "isCombatEncounter"]
      }
    }
  },
  "required": ["country", "region", "creatures", "waterCreatures"]
}
```

---

### 7.2 Database Query & Data Sync Pipelines

#### Reading Regional Lore & Water Monsters
To populate a Bestiary page for a specific country or zone:

```javascript
// Example Base44 read_entities query for Greek Water Lore
const loreRecord = await read_entities({
  entity_name: "Lore",
  query: { country: "Greece" },
  fields: ["country", "region", "creatures", "waterCreatures"]
});

// Filter active 32 combat encounters from the 78 water monster archive
const activeWaterEncounters = loreRecord.waterCreatures.filter(
  wc => wc.isCombatEncounter === true
);
```

#### MongoDB Aggregation Pipeline for Bestiary Completion Analytics
To compute player compendium progress across the 191 countries:

```javascript
const pipeline = [
  {
    $project: {
      country: "$data.country",
      totalCreatures: { $size: { $ifNull: ["$data.creatures", []] } },
      totalWaterCreatures: { $size: { $ifNull: ["$data.waterCreatures", []] } }
    }
  },
  {
    $group: {
      _id: null,
      globalCountriesCount: { $sum: 1 },
      totalCatalogedCreatures: { $sum: "$totalCreatures" },
      totalCatalogedWaterMonsters: { $sum: "$totalWaterCreatures" }
    }
  }
];

const stats = await aggregate_entities({
  entity_name: "Lore",
  pipeline: pipeline
});
```

---

## 8. Sample Bestiary Entries (Tabletop Narrative Voice)

Below are four complete, fully formatted Bestiary entries demonstrating the specific narrative tone (*Patrick Rothfuss / The Name of the Wind* style), UI flags, depth gauges, court alignments, and Naut scholarly annotations.

---

### Entry 001: The Siren (Water Creature & Full Presence)

```
==================================================================================================
| CREATURE 001: THE SIREN                                                                        |
| Mythology: Greek Mythology | Country: Greece | Zone: The Docks & Layer 5 Deep Water              |
| Presence: Full Presence    | Classification: Water Entity | Frog Affinity: None                 |
| Depth Gauge: [ Layer 2: Surface ] & [ Layer 5: Deep Water ]                                    |
|================================================================================================|
| COMBAT STATISTICS:                                                                             |
| HP: 1,420 | ATK: 85 (Acoustic / Charm) | DEF: 42 | RESONANCE: 20Hz (Subsonic) / 432Hz (Crystalline)|
| WEAKNESS: Silent Quartz / 528Hz Harmonic | RESISTANCES: Tidal Wave, Drowning, Charm           |
|------------------------------------------------------------------------------------------------|
| NARRATIVE LORE (Rothfuss Voice):                                                               |
| "There is a mistake men make about the Siren. They believe she sings to drown them. She doesn't.|
| Drowning is merely what happens when a land creature forgets that lungs are fragile things...   |
|                                                                                                |
| She sits on the edge of the dock, her heels dipping into the Aegean surface, carrying two      |
| voices in one throat. The outer voice is a cello—fast, liquid, full of promises about home.    |
| The inner voice is a piano playing alone in a cold room. It is the second voice that pulls you |
| in. Not because it is loud, but because it sounds exactly like your own loneliness, echoed back|
| across six leagues of salt water...                                                            |
|                                                                                                |
| If you meet her in the deep water of Layer 5, do not draw a sword. A blade moves slowly through|
| four hundred fathoms. Sing back to her. Even a broken note will do."                           |
|------------------------------------------------------------------------------------------------|
| SCHOLARLY MODE ANNOTATIONS (Unlocked via Naut Quest 2):                                     |
| Etymology: Greek 'Seirēn' — related to 'seira' (cord/rope), literal meaning: 'That which binds' |
| Depth Ecology: Inhabits Layer 2 during solar noon to lure surface craft; descends to Layer 5   |
| during low tide to rest among the submerged abyssal monuments.                                  |
| Naut's Note: "Her song is simply an uncalibrated harmonic frequency from the first cycle.  |
| She is not malicious; she is merely lonely at a frequency humans cannot digest without choking."|
==================================================================================================
```

---

### Entry 042: Lake Mermaid (Fae Creature, Chibi & Seelie Court)

```
==================================================================================================
| CREATURE 042: LAKE MERMAID                                                                     |
| Mythology: Slavic / Celtic | Country: Ireland | Zone: Alfheim (The Summerlands)                |
| Presence: Chibi            | Classification: Fae Entity  | Court: Seelie (Summerlands)           |
| Depth Gauge: [ Layer 2: Surface Shallows ]                                                     |
|================================================================================================|
| COMBAT STATISTICS:                                                                             |
| HP: 380 | ATK: 28 (Fae Illusion / Splash) | DEF: 18 | RESONANCE: 432Hz                          |
| WEAKNESS: Cold Iron / Silver Chime | RESISTANCES: Water Spells, Mind Confusion                  |
|------------------------------------------------------------------------------------------------|
| NARRATIVE LORE (Rothfuss Voice):                                                               |
| "A Seelie mermaid is roughly three feet of mischief wrapped in iridescent scales and wet moss.  |
| She does not drag ships down into the dark. She steals shiny brass buttons, rearranges fishermen's|
| bobbers into intricate geometric knots, and laughs with a sound like creek water over smooth  |
| pebbles...                                                                                     |
|                                                                                                |
| If you sit quietly on the reeds at dusk and offer her a piece of polished fluorite, she will   |
| trade you a secret about the Seelie King's garden. If you throw stone at her, she will turn    |
| your boots into wet river clay before you can finish your curse..."                            |
|------------------------------------------------------------------------------------------------|
| SCHOLARLY MODE ANNOTATIONS (Unlocked via Naut Quest 1):                                     |
| Etymology: Old English 'Mere' (sea/lake) + 'Maid' (young woman).                               |
| Fae Alignment: Seelie Court operative under the Seelie Queen's canopy estate.                  |
| Naut's Note: "Do not let the small stature fool you. They are the water system's scouts.    |
| What they see in the shallows is reported to the Ents before nightfall."                       |
==================================================================================================
```

---

### Entry 089: Unseelie Troll (Fae Creature, Chibi & Unseelie Court)

```
==================================================================================================
| CREATURE 089: UNSEELIE TROLL                                                                   |
| Mythology: Norse / Germanic | Country: Norway | Zone: Svartalfheim (The Hollow)                 |
| Presence: Chibi            | Classification: Fae Entity  | Court: Unseelie (Winter Labyrinth)     |
| Depth Gauge: N/A (Subterranean Land / Stone Bridge)                                             |
|================================================================================================|
| COMBAT STATISTICS:                                                                             |
| HP: 650 | ATK: 55 (Heavy Club / Earth Siphon) | DEF: 60 | RESONANCE: 111Hz (Subterranean Stone) |
| WEAKNESS: Sunlight Lantern / 528Hz Harmonic | RESISTANCES: Physical Heavy, Bludgeoning          |
|------------------------------------------------------------------------------------------------|
| NARRATIVE LORE (Rothfuss Voice):                                                               |
| "An Unseelie troll under a labyrinth bridge is not an obstacle. He is a tax collector with     |
| poor posture and moss growing out of his nostrils...                                           |
|                                                                                                |
| Jareth built the five-zone Labyrinth to test those who walk with too much confidence. The troll|
| is the exam. He carries a stone club twice his height, but his eyes are surprisingly wide and  |
| sharp. He doesn't want your gold. He wants a riddle he hasn't heard in two hundred years...    |
|                                                                                                |
| Give him a poor riddle, and he swings. Give him a good one, and he sits on his club, scratches |
| his ear, and grunts: '...Pass. But don't tell the King I let you through easy...'"             |
|------------------------------------------------------------------------------------------------|
| SCHOLARLY MODE ANNOTATIONS (Unlocked via Naut Quest 1):                                     |
| Etymology: Old Norse 'Troll' — fiend, demon, or subterranean giant.                            |
| Court Role: Heavy infantry for the Unseelie Winter Guard; responds directly to Daedalus's      |
| structural escapement gear ticks at 42 BPM.                                                    |
| Naut's Note: "They turn to granite when exposed to pure 528Hz harmonic light. Sir Isaac     |
| Newton spent three days trying to calculate their density before giving up and eating lunch."  |
==================================================================================================
```

---

### Entry 112: Medusa of the Stone Frogs (Full Presence & Frog Moderation Tether)

```
==================================================================================================
| CREATURE 112: MEDUSA OF THE STONE FROGS                                                        |
| Mythology: Greek Mythology | Country: Greece | Zone: The Catacombs / Moderation Sanctuary       |
| Presence: Full Presence    | Classification: Mythic / Moderation Anchor                        |
| Frog Affinity: Moderation Warden & Curse Giver                                                 |
|================================================================================================|
| COMBAT STATISTICS:                                                                             |
| HP: 2,100 | ATK: 95 (Gaze of Repentance / Serpent Lash) | DEF: 75 | RESONANCE: 42Hz              |
| WEAKNESS: Polished Mirror Shield / Humility | RESISTANCES: Aggression, Verbal Hostility, Fire   |
|------------------------------------------------------------------------------------------------|
| NARRATIVE LORE (Rothfuss Voice):                                                               |
| "She does not stand tall like the statues in the old temples. She sits on a low stone step at  |
| the edge of the Catacombs, her small hands folded over her knee, tired snakes wriggling softly|
| around her temples...                                                                          |
|                                                                                                |
| At her feet lie dozens of stone frogs. Not victims. Reminders.                                 |
| She didn't ask for the curse. The gods gave it to her because they were afraid of a woman who |
| could look at cruelty and name it for what it was. In the Geode Inn, she is the community's     |
| quiet shield. When a player enters the Inn carrying the bitter noise of the inquisitor or the   |
| bully, she raises one pale hand in a gesture that says: 'Stop... or else.'...                  |
|                                                                                                |
| Cross that line three times, and you leave your boots behind. You spend the night croaking on a|
| lily pad in Layer 2 until you remember how to speak like a guest..."                           |
|------------------------------------------------------------------------------------------------|
| SCHOLARLY MODE ANNOTATIONS (Unlocked via Naut Quest 3):                                     |
| Mythic Roots: Hesiodic Gorgon traditions; recontextualized as the archetype of sacred          |
| boundary protection and self-defense for the persecuted.                                       |
| Moderation Rite: Anchor NPC for 'The Rite of the Amphibian'. Manages the transformation state|
| timer (24-hour croak cycle) and evaluates rehabilitation penance before restoring human skin. |
| Naut's Note: "The most misunderstood entity in the archive. The gods called her a monster   |
| because she refused to let them turn her sanctuary into a hunting ground. Her frequency is    |
| pure forty-two hertz—the Inn's own foundation stone."                                          |
==================================================================================================
```

---

## 9. Implementation Checklist & Verification

To ensure full compatibility with the Geode Inn production build, verify the following integration points:

- [x] **File Creation**: Saved as `geode_inn_bestiary_mechanic.md`.
- [x] **UI Styling Rules**: Matches obsidian leather (`#0a0805`), gold embossed accents (`#c9a84c`), and Georgia serif typography.
- [x] **7 Water Layers Mapped**: Correctly integrates Layer 1 (Rain/Trovants) through Layer 7 (Crystal Core).
- [x] **Fae Court Badges Included**: Seelie vs. Unseelie alignments with Chibi and Full Presence distinctions.
- [x] **Frog Moderation Mechanic Anchored**: Linked to *Medusa*, *Circe*, *Tiddalik*, and community self-regulation rites.
- [x] **Naut Quest Chain Detailed**: 3-part book retrieval progression unlocking Scholarly Mode Levels 1-3.
- [x] **Database & Lore Entity Synchronized**: Includes JSON Schema for Base44 `Lore` entity (`country`, `region`, `creatures`, `waterCreatures`) and MongoDB aggregation pipelines.
- [x] **Rothfuss Narrative Tone Maintained**: Written with clever, direct, lyrical prose, pregnant pauses (`...`), and deep foreshadowing.

---
*End of Design Document — Geode Inn Bestiary Mechanic v1.0*
