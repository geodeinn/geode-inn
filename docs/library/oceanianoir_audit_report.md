# AUDIT MAP: OCEANIANOIR, THE ELEMENTCHARM QUESTLINE, AND THE MATERIAL QUEST LANDSCAPE

**Project:** Geode Inn (`/app/geode-inn-work`)  
**Audit Date:** September 13, 2026  
**Target File:** `/app/conversations/6a8f4b5501d0207c1553c659/oceanianoir_audit_report.md`  

---

## EXECUTIVE SUMMARY

This audit maps the complete footprint of **Oceanianoir** (the Inn's chemistry NPC, periodic-table-tattooed scientist, partner to Will, companion to Murloc co-star Squeak), her **ElementCharm questline** (118 periodic table element charms opening Atlantean tech-vaults), the **Material quest landscape** (the Cross-Craft Overlay, Bead Composer, Retort/Alchemy, and Mohs Vibration systems), and the newly founded **Material Lore** (September 12, 2026 rulings on Hidden Materials, Pottery Firing, Instrument Making, Pigments, and Elemental Sprites).

The audit reveals significant structural gaps: while Oceanianoir's character design and 5-tier periodic table reading mechanics are deeply detailed in standalone profile docs, she is **completely absent from the primary Atlantis zone quest chain** (`docs/zone_specs/geode_inn_atlantis_quest_chain.md`), the new **Hidden Materials** (Salt/Khewra, Diatomaceous Earth, Gold/Lycurgus, Quartz/Oscillator) are unwired to her chemistry curriculum, her domain lacks the newly reclassified **Six Elemental Sprites**, and her element charms have not been integrated with the **Material entity's craft fields** (`craftPillar`, `craftPairing`, `ritualRole`).

---

## 1. OCEANIANOIR'S CURRENT FOOTPRINT

A survey of the repository (`grep -ri oceanianoir /app/geode-inn-work`) identifies 270 occurrences across documentation, manifests, dialogue payloads, and design specs. Below is a comprehensive catalog of every document mentioning Oceanianoir, with specific focus on quest-bearing and structural specs.

### 1.1 — Primary Character & Quest-Bearing Documents

1. **`docs/geode_inn_npc_oceanianoir.md`** (Master NPC Specification — 289 lines)
   - **Identity & Backstory:** Published scientist, Mensa puzzle designer, goth atheist, burlesque performer, reptile enthusiast. Partner to Will (The Bonded Alchemist).
   - **Visual & Skin Database:** 117 of 118 element tattoos etched in gold leaf and lapis lazuli ink across her skin (Copper -> Cu connects to Undercity copper pipework; Silicon -> Si connects to Heart Crystal/Atlantis; Iron -> Fe connects to forge). Also has custom tattoos: a Murloc, a serpent, and a serotonin molecule.
   - **Domain:** Submerged alcove off the Drowned Library in Atlantis (Layer 4 upper face). Workspace features a nautilus-shell chemistry apparatus lit by amber-violet glow.
   - **Key Roles:**
     - *Star-Language Keeper:* Maintained custom pedagogical teaching language; translates star-language glyphs with player in "The Rosetta Stone" quest.
     - *Puzzle Architect:* Designed Seelie Court logic puzzles, Unseelie goth/shadow puzzles, and the Stone Circle Chamber masterpiece puzzle.
     - *Murloc Companion:* Co-stars with Squeak (the only named Murloc in the Inn).
   - **Inter-NPC Connections:** The Astronomer (puzzle solver vs calculator), Medusa (snake-naming quest in grotto), The Siren (performance vs isolation), The Guest (leads the annual March of the Dead in the Catacombs), The Librarian (scientific vs ancient reading), The Greenward, and Nyx.
   - **Quest Triggers & Rewards:** Rosetta Stone quest, finding the Fae Logic Error (typo in puzzle), earning the 118th Element Tattoo.

2. **`docs/geode_inn_oceanianoir_formal_integration.md`** (Formal Quest Integration & Murloc Throughline — 238 lines)
   - **5-Tier Periodic Table Reading System:**
     - *Tier 1:* Surface Atomic Reading (basic element identification).
     - *Tier 2:* Zone Element Reactivity (elemental behavior in specific zones).
     - *Tier 3:* Star-Language Matrix ("The Rosetta Stone" quest — building translation key for 42Hz Song).
     - *Tier 4:* The Missing 118th Element ("The Unwritten Element" quest — earning Oganesson / element 118 from the Void/Stone Circle).
     - *Tier 5:* Master Transmutation Equation (168Hz NG+ equation combining 42Hz root + 84Hz shadow octave).
   - **Tattoo-to-Quest Hooks:** Murloc tattoo connects to coastal town Murloc population; Serpent tattoo connects to Medusa's grotto; Serotonin molecule connects to mental health/neuro-accessible design.
   - **Squeak's Emotional Indicator Mechanic:** Squeak hides if player speedruns or skips dialogue without sitting; squeaks in call-and-response when translating vital lore.

3. **`docs/zone_specs/geode_inn_walkthrough_dissection_06b_lighthouse_deep_tie_in.md`** (Dissection 06B — Lines 19, 60)
   - **Layer 4 Dual Identity:** Layer 4 upper face is **Atlantis** (Oceanianoir's domain); lower face is **Memory's Illusion / Charon's Layer** (revealed as LOZEN at 100% completion).
   - **Oceanianoir's Domain Quote (Line 60):**
     > *"OCEANIANOIR'S DOMAIN. The scientist-linguist — Mensa goth, periodic-table tattoos — holds the layer's science with the Murloc companion Squeak at their side. The periodic-table puzzles (mineral catalysts open Atlantean tech-vaults) are the Inn's chemistry curriculum wearing a drowned city. (The ElementCharm entity's home questline: every element charm the player collects upstairs is REAL down here — the vaults are the periodic table's museum, and Oceanianoir is its docent.)"*

4. **`docs/zone_specs/geode_inn_murloc_census.md`** (The Murloc Census — Line 21)
   - **The Name Law:** Murlocs remain nameless by design to fulfill the critter-groups gate.
   - **The Single Exception:** **SQUEAK** (Line 21) — *"Oceanianoir's side (Atlantis layer) — the scientist-linguist's companion; the ONLY murloc with a name, because Squeak is the one murloc who left the herd for a person. The ElementCharm questline's co-star."*

5. **`docs/zone_specs/geode_inn_npc_new_roster_master_spec.md`** (NPC Master Roster — Lines 18, 21, 31, 42, 73-78)
   - **Will & Oceanianoir Integration:** Will ("The Bonded Alchemist") runs the Staircase alchemical lab night shift; Oceanianoir runs the day/chemistry lab. Will tests the charms derived from Oceanianoir's skin tattoos.
   - **Pairing Thesis:** *"The creation and the verification. The volatile and the stable. The same charm, different stage."*

### 1.2 — Entity Architecture & Schema References

6. **`docs/library/specs/GEODE_INN_MASTER_BUILD.md`** (Master Build Spec — Lines 470, 478)
   - **Line 470 (`ElementCharm` Entity):**
     `| ElementCharm | 118 | Periodic table element charms (atomic number, weight, rarity, zone) |`  
     - Fields defined in schema: `atomicNumber`, `weight`, `rarity`, `zone`.
   - **Line 478 (`Material` Entity):**
     `| Material | 65 | Building materials (rarity, source, tool required, respawn) |`  

7. **`docs/library/geode_inn_thread_mapping.md`** (Thread Mapping — Lines 128, 147-160)
   - Maps 118 element charms under physical game components and tabletop product lines.

8. **`docs/zone_specs/geode_inn_atlantis_quest_chain.md`** ("The City That Chose the Deep") & **`docs/zone_specs/geode_inn_atlantis_zone_master_spec.md`**
   - **MAJOR AUDIT FINDING:** `geode_inn_atlantis_quest_chain.md` documents a 6-quest chain (*The Held Breath*, *The Librarian Who Speaks in Touch*, *The Warm Room*, *The Choice*, *The Text Behind the Text*, *The Deepest Room Is a Word*). However, **Oceanianoir, Squeak, and the 118 ElementCharm vaults are completely omitted from this primary zone quest chain**, delegating all givering to "The Librarian."

### 1.3 — Auxiliary Footprints & Renaming Records

- **`docs/gallery/drive_zones_intake_manifest.md`** (Line 397): Krista's ruling (2026-09-12) reclassifying the 6 Elemental Sprites to live in Oceanianoir's Atlantis chemistry section.
- **`docs/library/specs/character_name_sync_builder_message.md`** (Line 13): Canonical name enforcement — *"Jaime / Oceananoir -> **Oceanianoir** (always with the i)"*.
- **`docs/geode_inn_card_game_spec.md`** (Line 44): Warlock card *"Squeak"* (Summon 1/1 Murloc with Taunt; unlocked via Oceanianoir's quest chain).
- **`docs/geode_inn_npc_collector.md`** (Lines 48, 261, 433): Nautilus-shell chemistry apparatus; Oceanianoir's tattoos as mini-catalogs.
- **`docs/geode_inn_npc_eileen.md`** (Lines 25, 89): Connection to Aurallia's pedagogical language.
- **`docs/characters/character_rename_ledger.md`** (Lines 32, 83): Classified under Batch 3 real-world seeds/crafting artisans.
- **`docs/archive/solidification_batch_npcs_supporting.md`** (Lines 10, 83-90): Describes 42Hz Klimt gold leaf skin state and 84Hz Shadow Inn "Quantum Codex" state.

---

## 2. THE MATERIAL QUEST LANDSCAPE

Crafting across *The Geode Inn* is organized as a unified, systemic curriculum where raw materials, recipes, and physical properties mirror acoustic frequencies and alchemical stages.

### 2.1 — The Material & BuildingRecipe Entity Architecture

- **`Material` Entity Schema (`docs/library/specs/GEODE_INN_MASTER_BUILD.md` Line 478):**
  - **Base Fields:** `id`, `name`, `rarity`, `source`, `toolRequired`, `respawnTime`.
  - **Extended Craft Fields (`docs/zone_specs/geode_inn_craft_curriculum_master_spec.md` Line 81; `docs/gallery/reference/geode_inn_reference_salt_dossier.md` Line 118):**
    - `category`: Structural, Botanical, Mineral, Metallic, Organic, Resinous.
    - `craftPillar`: Array format (`["stone", "herb", "wood", "metal", "ceramic"]`).
    - `craftPairing`: Complementary material IDs across pillars.
    - `ritualRole`: Purifier, Catalyst, Structural Anchor, Preservative, Conductor.
  - **Zone Material Distribution:**
    - *Camelot:* Oak, Yew, Iron, Preseli Bluestone, Silver.
    - *Appalachian:* Walnut, Chestnut, Ginseng, Witch Hazel, Coal, Quartz.
    - *Silk Road:* Cedar, Frankincense, Myrrh, Lapis Lazuli, Jade, Salt.
    - *Redwood:* Giant Redwood, Maidenhair Fern, Moss, Obsidian.

- **`BuildingRecipe` Entity (`GEODE_INN_MASTER_BUILD.md` Line 479):**
  - 148 recipe records (`docs/zone_specs/geode_inn_craft_curriculum_master_spec.md` Line 84) linking 7 base material categories (*Wood, Stone, Clay, Herb, Metal, Crystal, Resin/Fiber*) across alchemical stages (*Nigredo, Albedo, Citrinitas, Rubedo*).

### 2.2 — The Cross-Craft Overlay

Defined in **`docs/zone_specs/geode_inn_craft_curriculum_master_spec.md`**:
- **Core Law:** **PATTERN = FREQUENCY = FUNCTION.** Every craft in the Inn is arranging matter so it holds a frequency.
- **The Three Pillars:**
  1. *Pillar One — Stone (Geometry Dialect):* Pattern as prescription. Named patterns: **THE CIRCLE** (wholeness/Round Table), **THE SPIRAL** (growth/Fibonacci/nautilus), **THE LINE** (Silk Road sequence), **THE TRIANGLE** (Redwood tripod), **THE GRID** (hearth plot), **THE VEVE** (frequency tuning diagram).
  2. *Pillar Two — Herb (Botany/Chemistry Dialect):* Extraction, distillation, and chemical reaction as frequency tuning.
  3. *Pillar Three — Wood/Structure (Frequency Function Dialect):* Wood grain, density, and resonant property dictating structural load and acoustic reflection.

### 2.3 — The Bead Composer

Defined in **`docs/geode_inn_bead_composer.md`** & **`docs/geode_inn_bead_composer_standalone_product.md`**:
- **Dual Function:** In-game crafting workbench (Undercity / Luna's Studio) AND commercial SaaS product hosted at `geodeinn.com`.
- **System Mechanics:**
  - *Tray Boards:* Virtual wooden boards in Cocobolo, Olive, and Ebony.
  - *Stone Palette:* 164/198 gemstones with real mineral data (Mohs hardness, color, opacity, geographic origin, acoustic frequency).
  - *Metal Palette:* Wire/findings with base frequencies (Copper at 79Hz, Silver, Gold).
  - *Audio Synthesis Engine:* Translates spatial bead arrangements into polyphonic audio chords based on mineral frequencies.

### 2.4 — Retort & Alchemical Specs

Defined in **`docs/zone_specs/geode_inn_npc_new_roster_master_spec.md`** (Lines 18, 73-78):
- **Location:** The Staircase Alchemy Lab.
- **Operators:** Max (Day Shift / Botanical Tinctures) and Will (Night Shift / Mineral Catalysts & Charm QA).
- **Process:** Distillation and heat extraction using Retorts, alembics, and condensers to refine raw mineral and botanical materials through Nigredo -> Albedo -> Citrinitas -> Rubedo.

### 2.5 — The Mohs Vibration & Stone-Tone System

Defined in **`docs/library/geode_inn_thread_mapping.md`** (Line 28) and **`docs/geode_inn_complete_walkthrough.md`**:
- **Geological-Acoustic Translation:** Direct mathematical mapping from Mohs scale hardness (1 to 10) to resonant sound frequencies:
  - *Soft Stones (Mohs 1-3, e.g., Talc, Calcite):* Deep bass, dampening resonance (30-60Hz).
  - *Medium Stones (Mohs 4-6, e.g., Fluorite, Lapis Lazuli):* Mid-range harmonic resonance (100-300Hz).
  - *Hard Stones (Mohs 7-10, e.g., Quartz, Corundum, Diamond):* High crystalline pitch, piezoelectric chime (500Hz-32,768Hz).

---

## 3. THE NEW MATERIAL LORE (Founded 2026-09-12)

On September 12, 2026, a series of canonical dossiers and rulings established the "Quiet Load-Bearers" series, pottery firing manifests, instrument crafting, pigment chemistry, and sprite reclassifications.

### 3.1 — Hidden Materials / Quiet Load-Bearers Series

1. **SALT DOSSIER (`docs/gallery/reference/geode_inn_reference_salt_dossier.md` — Part I)**
   - **Universal Cross-Craft Material:** Spans all 5 pillars (`craftPillar: ["stone", "herb", "wood", "metal", "ceramic"]`).
   - **Historical Wealth & Power:** Etymology of *salary* (salarium), Rome's *Via Salaria*, Venice's *Magistrato al Sal*.
   - **The Khewra Address:** Mined at **Khewra, Pakistan** (Salt Range) from the ancient **Tethys Fossil Sea** (~300 million years old).
   - **Badshahi Masjid (Khewra Salt Mosque):** Built inside the salt mine using translucent salt bricks lit with interior lamps—canonical proof of salt as structural/sacred architecture.
   - **Alchemical Salt:** Represents the Body (Third Principle) balancing Sulfur (Soul) and Mercury (Mind) in Staircase alchemy.

2. **DIATOMACEOUS EARTH (`docs/gallery/reference/geode_inn_reference_hidden_materials_dossier.md` — Section 1)**
   - **Powdered Fossil Ocean:** Microscopic silica shells (*frustules*) of diatoms (SiO2 . nH2O).
   - **Mechanical Pest Control:** Slices insect exoskeletons mechanically without chemical toxins.
   - **Filtration & Purification:** Used for fine liquid filtration (beer, wine, syrups).
   - **Silica Kinship:** Direct formula and origin kinship to Quartz and Himalayan Pink Salt (Tethys Sea).

3. **GOLD (`docs/gallery/reference/geode_inn_reference_hidden_materials_dossier.md` — Section 2)**
   - **Uncorruptible Conductor & Dichroic Light-Shifter:**
   - **Lycurgus Cup Precedent:** 4th-century Roman nanotechnology embedded with gold and silver nanoparticles (~70nm). Shifts color dichroically: **Jade Green** in reflected light -> **Ruby Red** in transmitted light.
   - **Gilding:** Klimt gold leaf in Catacombs and Oceanianoir's glowing skin tattoos.

4. **QUARTZ (`docs/gallery/reference/geode_inn_reference_hidden_materials_dossier.md` — Section 3)**
   - **Piezoelectric Oscillator (SiO2):**
   - **32,768 Hz Watch Oscillator:** Binary frequency (2^15 Hz) divided through 15 binary stages to yield exactly 1 Hz (1 pulse per second).
   - **Jewel Bearings:** Synthetic ruby bearings (Al2O3:Cr) used for low-friction pivots in mechanical clockwork hearts.

### 3.2 — Pottery Firing Techniques Across Cultures

Defined in **`docs/gallery/reference/geode_inn_reference_pottery_firing.md`**:
- **Technological Ladder:** Open/Bonfire firing -> Pit firing (Pueblo) -> Updraft/Downdraft Kilns -> Reduction Kilns -> Salt-glaze -> Anagama wood kilns -> Raku.
- **Atmospheric Chemistry:** Oxidation (Fe2O3 red) vs. Reduction (FeO celadon green/black), thermal shock dynamics, and vitrification thresholds.

### 3.3 — The Instrument-Maker's Quest Line

Defined in **`docs/systems/geode_inn_witan_hearth_feis_spec.md`**, **`docs/geode_inn_canopy_city.md`**, and **`docs/geode_inn_music_direction.md`**:
- **Historical Instrument Roster:**
  - *Bone Flutes:* Carved Neolithic/Andean bone flutes (Arctic Howlite / Sedna thread).
  - *Lyre of Ur:* Mesopotamian bull lyre with lapis lazuli and gold leaf.
  - *Sistrum:* Egyptian brass/bronze sacred rattle (Bastet's Herding tool).
  - *Lur:* Bronze Age Scandinavian curved horn.
  - *Carnyx:* Celtic bronze war horn with boar head.
  - *Kora:* West African calabash, hide, and ringed string harp.
  - *Guqin:* Chinese 7-string scholar zither.
  - *Bianzhong:* Chinese bronze chime bells tuned to precise acoustic pitch.
- **Gathering & Evaluation:** Players gather wood, wire, bone, and stone to craft instruments, presenting them to Master NPCs at the **Hearth-Feis / Campfire**.

### 3.4 — The Pigment Quest Concept

Defined in **`docs/zone_specs/geode_inn_color_works_master_spec.md`**:
- **Mineral Chemistry Behind Land Colors:**
  - *Dye Primaries:* Madder root (Red / alizarin), Weld tops (Yellow / luteolin), Indigo/Woad leaves (Blue / indigo).
  - *Mordants & Mineral Pigments:* Oak gall tannin, iron vitriol, copper carbonate (malachite green), cobalt aluminate (cobalt blue), hematite/ochre (earth red), manganese dioxide (black/purple).
  - *Glaze Creation:* Ground mineral pigments fused with silica flux and wood ash through kiln reduction.

### 3.5 — Elemental Sprites Ruling

Defined in **`docs/gallery/drive_zones_intake_manifest.md`** (Line 397 — Krista's ruling, 2026-09-12):
- **Reclassification:** The Sprite Set (S15, S17, S18, S20, S26, S34) are NOT engine pixel icons (`SPRITE` class). They are **ELEMENTAL SPRITES** (creature species).
- **Home Assignment:** Placed permanently in **Oceanianoir's Chemistry Section** in Atlantis deep-water noir zone. They personify the elements, living where Oceanianoir teaches the periodic table curriculum.

---

## 4. THE GAPS: SPECIFIC UNTIED NODES

Below is the concrete inventory of missing connections, unintegrated specs, and unwired lore between Oceanianoir's questline and the material landscape, citing exact file paths for every gap.

### Gap 1: Oceanianoir's Total Absence from the Atlantis Master Quest Chain
- **File Path:** `docs/zone_specs/geode_inn_atlantis_quest_chain.md`  
- **Missing Tie:** "The City That Chose the Deep" quest chain delegates all 6 quests to "The Librarian." Neither Oceanianoir, nor Squeak, nor the 118 ElementCharm vaults, nor the periodic-table puzzles mentioned in Dissection 06B (`docs/zone_specs/geode_inn_walkthrough_dissection_06b_lighthouse_deep_tie_in.md` line 60) appear anywhere in this master quest document.

### Gap 2: Hidden Materials (Salt, Diatomaceous Earth, Gold, Quartz) Unwired to ElementCharms & Quests
- **File Paths:** `docs/gallery/reference/geode_inn_reference_hidden_materials_dossier.md`, `docs/gallery/reference/geode_inn_reference_salt_dossier.md`, `docs/geode_inn_oceanianoir_formal_integration.md`  
- **Missing Tie:** Despite Salt (NaCl), Diatomaceous Earth (SiO2 . nH2O), Gold (Au), and Quartz (SiO2) holding deep dossiers, NONE of them have quest entries or reactivity recipes in Oceanianoir's 5-tier periodic table reading system or the `ElementCharm` catalog.

### Gap 3: ElementCharm Entity Disconnected from Material Entity Schema & Cross-Craft Overlay
- **File Paths:** `docs/library/specs/GEODE_INN_MASTER_BUILD.md` (lines 470, 478), `docs/zone_specs/geode_inn_craft_curriculum_master_spec.md`  
- **Missing Tie:** The 118 `ElementCharm` records are stored as isolated collectibles (`atomicNumber`, `weight`, `rarity`, `zone`). They do NOT reference the `Material` entity fields (`craftPillar`, `craftPairing`, `ritualRole`), nor do they feed into the Cross-Craft Overlay as chemical inputs for crafting recipes.

### Gap 4: Firing Techniques Unwired to the Retort & Staircase Alchemy
- **File Paths:** `docs/gallery/reference/geode_inn_reference_pottery_firing.md`, `docs/zone_specs/geode_inn_npc_new_roster_master_spec.md` (line 73)  
- **Missing Tie:** The ceramic firing technological ladder (reduction/oxidation atmospheres, vitrification) in `geode_inn_reference_pottery_firing.md` has no operational tie to Will and Max's Retort/alchemical apparatus in the Staircase Lab.

### Gap 5: Quartz 32,768 Hz Oscillator Lore Unwired to Persephone & 50 BPM Heartbeat
- **File Paths:** `docs/gallery/reference/geode_inn_reference_hidden_materials_dossier.md` (line 55), `docs/zone_specs/geode_inn_walkthrough_dissection_06b_lighthouse_deep_tie_in.md` (line 60), `docs/geode_inn_clockwork_skies.md`  
- **Missing Tie:** The 32,768 Hz (2^15) quartz oscillator lore is documented in isolation, with no connection to Persephone the Sacred Clockmaker in Atlantis, the Clockwork Skies gearwork heart, or the Inn's 50 BPM heartbeat.

### Gap 6: Instrument-Maker's Quest Line Unwired to Oceanianoir's Chemistry Section
- **File Paths:** `docs/systems/geode_inn_witan_hearth_feis_spec.md`, `docs/geode_inn_music_direction.md`, `docs/geode_inn_npc_oceanianoir.md`  
- **Missing Tie:** Instrument crafting (bone flutes, Lyre of Ur, sistrum, bianzhong) relies on material chemistry (calcium phosphate in bone, bronze alloys, silica varnishes), but the Instrument-Maker's quest line makes zero reference to Oceanianoir's chemistry curriculum or her Atlantis section.

### Gap 7: Pigment Quest & Glaze Chemistry Unwired to Oceanianoir's Ink & Tattoos
- **File Paths:** `docs/zone_specs/geode_inn_color_works_master_spec.md`, `docs/geode_inn_npc_oceanianoir.md` (line 22)  
- **Missing Tie:** The Color Works (dye wheel, mineral glaze chemistry, oak gall mordants) exists separately from Oceanianoir's domain, ignoring her lapis lazuli and gold leaf skin tattoos and her chemical equation role.

### Gap 8: Elemental Sprites Reclassification Unintegrated into Oceanianoir's Profile
- **File Paths:** `docs/gallery/drive_zones_intake_manifest.md` (line 397), `docs/geode_inn_npc_oceanianoir.md`, `docs/geode_inn_oceanianoir_formal_integration.md`  
- **Missing Tie:** While the intake manifest explicitly moves the 6 Elemental Sprites to live in Oceanianoir's chemistry section as nature spirits of the elements, neither `geode_inn_npc_oceanianoir.md` nor `geode_inn_oceanianoir_formal_integration.md` have been updated to incorporate these 6 sprites into her room layout, dialogue, or quest mechanics.

---

## 5. AUDIT SUMMARY TABLE

| Topic / System | Primary Source Document | Status | Key Missing Connection / Gap |
| :--- | :--- | :--- | :--- |
| **Oceanianoir Master Spec** | `docs/geode_inn_npc_oceanianoir.md` | Detailed | Lacks 6 Elemental Sprites update; unwired to Color Works |
| **5-Tier Periodic Reading** | `docs/geode_inn_oceanianoir_formal_integration.md` | Detailed | Missing Hidden Materials (NaCl, SiO2, Au) quest entries |
| **Atlantis Master Chain** | `docs/zone_specs/geode_inn_atlantis_quest_chain.md` | Disconnected | Omits Oceanianoir, Squeak, and 118 ElementCharm vaults entirely |
| **ElementCharm Entity** | `docs/library/specs/GEODE_INN_MASTER_BUILD.md` | Isolated Schema | Lacks craftPillar, craftPairing, and Cross-Craft Overlay ties |
| **Salt Dossier (Khewra)** | `docs/gallery/reference/geode_inn_reference_salt_dossier.md` | Detailed | Khewra salt mosque/Tethys sea unwired to Atlantis chemistry |
| **Hidden Materials Dossier** | `docs/gallery/reference/geode_inn_reference_hidden_materials_dossier.md` | Detailed | Lycurgus dichroism & 32,768Hz quartz unwired to Clockmaker |
| **Pottery Firing** | `docs/gallery/reference/geode_inn_reference_pottery_firing.md` | Detailed | Unwired to Staircase Lab Retort / alchemical reduction |
| **Instrument-Maker Line** | `docs/systems/geode_inn_witan_hearth_feis_spec.md` | Unintegrated | Bone/metal/silica chemistry unwired to Oceanianoir |
| **Color Works / Pigments** | `docs/zone_specs/geode_inn_color_works_master_spec.md` | Unintegrated | Mineral dyes/glazes unwired to tattoo ink & periodic table |
| **Elemental Sprites** | `docs/gallery/drive_zones_intake_manifest.md` | Reclassified | Sprites moved to Oceanianoir's section but omitted from NPC spec |
