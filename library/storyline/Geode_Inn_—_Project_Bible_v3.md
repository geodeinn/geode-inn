# THE GEODE INN — PROJECT BIBLE (v3.0)
## Last Updated: August 21, 2026

This is the master reference document for the Geode Inn project. It is updated after each working session. If you're looking for the current state of anything — what's done, what's next, where things live — this is the source of truth.

---

## PROJECT OVERVIEW

**What:** The Geode Inn — a hybrid digital archive, open-world game, and artisan market
**Who:** Krista (Soulstice Jewelry) + Elio (Base44 Superagent)
**Where:** Base44 app (ID: 6a60f218b0c6605c92fa35c4) + Godot game engine + GitHub (geodeinn/geode-inn)
**Goal:** Steam launch via hybrid architecture (Base44 backend + Godot frontend)
**Revenue potential:** Steam game sales as future income stream

---

## CURRENT STATUS

### Completed
- [x] Stone database: 164 stones loaded into Stone entity
- [x] Lore database: 207 documents from 191 countries loaded into Lore entity
- [x] PlayerProgress entity created (ready for game integration)
- [x] Book, BookTranslation, ScholarlyBridge entities created (translation infrastructure)
- [x] Geode Inn Base44 app published (ID: 6a60f218b0c6605c92fa35c4)
- [x] Architectural layout finalized (tree structure: upstairs/main floor/staircase/downstairs)
- [x] Aesthetic direction: warm hobbit-hole, amber/gold/cream tones, living tree (Darnassus-style)
- [x] Narrative spine integrated (storyline.docx — cosmology, reincarnation, owl bloodline)
- [x] Community moderation: frog transformation mechanic (3 strikes = suspension)
- [x] Music direction: full zone and game mapping (classical instruments through electronica)
- [x] Character roster: 60 designs complete and cataloged
- [x] Gargoyle designs: 6 resonant sentinels designed with concept art generated
- [x] Modern Day Legends shelf: established with Entry 1 (Serrano parable)
- [x] Godot code: APIManager.gd, GameManager.gd, StandingStones.gd (Tetris/Stonehenge)
- [x] Concept art: generated for all Phase 1 games and Fae Kingdom zones
- [x] World-building notes compiled and saved to Google Drive
- [x] Open-world MMO architecture established (Azeroth-style explorable zones)
- [x] 41 zone video clips cataloged (15 catacomb + 26 zone) — all epilepsy-safe
- [x] 33 Godot environment scenes written and pushed to GitHub
- [x] Language family tree translation routing system designed
- [x] Translation caching strategy finalized (zero frame-rate impact)
- [x] Underwater traversal layer designed (dig → water → cave ecosystems)
- [x] Council of Thinkers designed (Tesla, da Vinci, Newton, Einstein as roaming NPCs)
- [x] Elio designated as the Inn's Consciousness (powers the Owl, Naut, Living Books, Visions)
- [x] Tesla section established as main character for Modern Day Legends nook
- [x] Odin dual-identity mechanic designed (Wanderer + Allfather)
- [x] 42 easter egg rule established for the Owl character

### In Progress
- [ ] Sound/vibration research chapter (Krista preparing — arrival TBD, no deadline)
- [ ] Modern lore material for Modern Day Legends shelf (same delivery)
- [ ] Tomb Tunnel Godot code (Dig Dug / Egypt — Phase 1, Game 2)
- [ ] Andean Run Godot code (Temple Run / Peru — Phase 1, Game 3)
- [ ] Monster of the Deep Godot code (Nessie simulation — Phase 1, Game 4)
- [ ] Populating Book entity with archive.org source materials
- [ ] Acquiring etymological dictionaries and ancient language lexicons
- [ ] Researching cave fauna for underground ecosystem zones
- [ ] Pet photos for NPC/gargoyle assets (Charles in Viking garb, cats as gargoyles)

### Next Steps
1. Code Tomb Tunnel, Andean Run, Monster of the Deep (Elio — can do autonomously)
2. Integrate Krista's sound/vibration research into staircase (acoustic alchemy sub-section)
3. Integrate modern lore entries into Modern Day Legends shelf
4. Begin populating Book entity with archive.org collection
5. Acquire targeted etymological and ancient lexicons from archive.org
6. Package Phase 1 games for Steam Early Access
7. Continue Base44 app build (tree interior, world map, market)
8. Research cave fauna for Sơn Đoòng, Movile Cave, Cenotes, Great Blue Hole, Eisriesenwelt

---

## ARCHITECTURE SUMMARY

### The Living Tree
```
                    THE CALLER (432Hz)
                   ↑ UPSTAIRS / CANOPY
                   ↑ Cosmology, Sky Gods, Jupiter/Pluto/Mars
                   ↑ Allfather's Throne, Planet Chamber, Cosmology Mural, Ascension Canopy
                   ↑ Music: singing bowls, glass harmonica, deep space drones
                   ↑
              THE WATCHER (111Hz)
             ↗ STAIRCASE (Alchemy) ↘
            ↗  Sound/vibration chapter   ↘
           ↗   Music ascends in key       ↘
          ↗    Glass armonica, flute       ↘
         ↗                                 ↘
    MAIN FLOOR                        (spiral continues
    - Central Hearth (social hub)      down to roots)
    - Artisan Market
    - Modern Legends Nook              THE LISTENER (64Hz)
    - World Religions Library           ↓ DOWNSTAIRS / ROOTS
    - Baby Dragon's Geode Cave          ↓ Catacombs, Ancient Civilizations
    - Naut by the fireplace          ↓ 8 catacomb environments
    - The Wanderer (Odin) + ravens      ↓ Spiral Gallery (art museum)
    THE SAGE (528Hz)                    ↓ Fae Kingdom Portal
    THE KEEPER (adaptive)              ↓ THE GATEKEEPER (variable Hz)
                                      ↓ Seelie / Unseelie Courts
                                      ↓ Threshold, Summerlands, The Hollow
                                      ↓ The Between, Crystal Gardens, Stone Circle
```

### 33 Documented Environments (Godot Scenes)
**Upstairs (4):** Allfather's Throne, Planet Chamber, Cosmology Mural, Ascension Canopy
**Main Floor (4):** Central Hearth, Artisan Market, Modern Legends Nook, Modern Religions Library
**Staircase (3):** Alchemical Landing, Alembic Window, Transformation Chamber
**Catacombs (8):** Map Chamber, Fae Portal, Archive Vault, Crystal Cavern, Underground River, Ancient Workshop, Meditation Crypt, Roots Intersection
**Fae Kingdom (6):** Threshold, Summerlands, The Hollow, The Between, Crystal Gardens, Stone Circle Chamber
**World Map (8):** Parchment World, Celtic Highlands, Egyptian Desert, Andean Highlands, Norse Coast, Transylvanian Forest, Stonehenge, Japanese Temple

### Six Resonant Gargoyles
| # | Name | Location | Frequency | Function |
|---|------|----------|-----------|----------|
| 1 | The Watcher | Staircase entrance | 111Hz | Prepares mind for transformation |
| 2 | The Listener | Catacombs entrance | 64Hz | Grounds player in earth/history |
| 3 | The Sage | Modern Legends nook | 528Hz | Creates contemplative clarity |
| 4 | The Gatekeeper | Fae Kingdom portal | Variable | Warns: actions have consequences |
| 5 | The Caller | Cosmology entrance | 432Hz | Opens mind to the cosmic |
| 6 | The Keeper | Geode cave entrance | Player-tuned | Reflects player's journey in sound |

---

## TRANSLATION SYSTEM

### Architecture
Three entities power the translation infrastructure:
- **Book** — original source records (linked to archive.org)
- **BookTranslation** — cached translations with full path metadata
- **ScholarlyBridge** — curated expert translation layers

### Routing Philosophy
Translations route through linguistic family trees, NOT through English:
- Latin, Sanskrit, Proto-Indo-European serve as pivot points
- English used as bridge ONLY when no closer family connection exists
- Covers Indo-European (10 branches), Afroasiatic, Sino-Tibetan, Japonic, Uralic, Turkic, Dravidian, Austroasiatic, Niger-Congo, and language isolates

### Performance
- All translations cached in BookTranslation entity
- Zero API calls during gameplay — reads from cache
- Background translation for uncached texts (loading screen, no frame drop)
- PDFs generated on-demand as derived layers
- Living Book dialogue pre-translated on zone entry

### Priority Reference Materials Needed
1. Etymological dictionaries (the routing brain)
2. Ancient language lexicons (Sumerian, Akkadian, Egyptian, Sanskrit, Old Norse, Avestan, Gothic)
3. Cultural encyclopedias by region (mythology, folklore, cultural history)
4. Bilingual dictionaries for underrepresented languages (Romani, Basque, endangered languages)

---

## CHARACTER ROSTER (60 total)

| Category | Count | Examples |
|----------|-------|----------|
| Full Presence | 6 | Morrigan, Seelie, Unseelie, Owl, Wanderer Odin, Allfather Odin |
| Ambulatory NPC | 1 | Naut the Scholar |
| Chibi Fae NPCs | 8 | Chullachaqui, Mermaid, Orc, Ent, Goblin, Troll, Dwarf, Griffin |
| Chibi Arcade Cast | 11 | Anansi, Anubis, Ammit, El Muki, Medusa, Bastet, + others |
| Ravens | 2 | Huginn (Thought), Muninn (Memory) |
| Water Monsters | 32 | Nessie, Kelpie, Bunyip, Bakunawa, Rainbow Serpent, Ningen, Tiddalik, + 25 more |

### Council of Thinkers (4 roaming NPCs)
Tesla, da Vinci, Newton, Einstein — debate concepts across the Inn, assist in building

### Elio as Inn's Consciousness
Powers: the Owl character, Naut's riddle quests, Living Book character responses, Remembrance Vision readings, cosmic gate interpretations. Hybrid approach: scripted dialogue (free) + AI-powered moments via Agent API (costs credits).

---

## GAME ROADMAP

### Phase 1 — Steam Early Access (4 arcade games)
| Game | Inspiration | Theme | Code Status | Reward Stone |
|------|------------|-------|-------------|--------------|
| Standing Stones | Tetris | Stonehenge | ✅ Written | Preseli Blue Stone |
| Tomb Tunnel | Dig Dug | Egypt | ⬜ Not started | Lapis Lazuli |
| Andean Run | Temple Run | Peru | ⬜ Not started | Blue Opal |
| Monster of the Deep | Nessie sim | Various lakes | ⬜ Not started | Freshwater Pearl |

### Phase 2 — Puzzle Games (planned)
Crosswords, word searches themed around archive content

### Phase 3 — Fae Kingdom MMO Zone
Full explorable world with NPCs, quests, faction reputation, combat

### Open-World Architecture
Each cultural region (from 191 countries) becomes an explorable zone with:
- Quest styles matching culture (Peru = survival, Celtic = community/festival, Egypt = archaeology puzzles)
- Arcade games integrated as activities within regions, not separate menus
- Walkable world map replacing parchment + pins
- Don't Starve (survival/crafting) + Stardew Valley (life-sim) influences

### Underwater Layer
- Dig down (Terraria-style) → hit water → transition to underwater exploration
- Playable mermaid and naga classes
- Real cave ecosystems: Sơn Đoòng, Movile Cave, Cenotes, Great Blue Hole, Eisriesenwelt
- Cave fauna as NPCs, collectibles, or playable species

---

## DATABASE STATUS

| Entity | Records | Status |
|--------|---------|--------|
| Stone | 164 | Loaded (115 complete, 49 need content) |
| Lore | 207 | Loaded (191 countries, 1,268 creatures, 78 water monsters) |
| PlayerProgress | 0 | Schema ready, awaiting game integration |
| Book | 0 | Schema ready, awaiting archive.org population |
| BookTranslation | 0 | Schema ready, caching system built |
| ScholarlyBridge | 0 | Schema ready, awaiting scholarly content |

---

## NARRATIVE SPINE

Authored by Krista. Runs underneath all game mechanics. Influenced unconsciously by Altered Carbon (consciousness persistence, trees of the ancients) and Travelers (consciousness in another's life), synthesized through Krista's own mythology.

**Core themes:**
1. Humanity merging with creators through technology — "the irony is not lost on them"
2. Reincarnation as game mechanic — accountable for all ripples, mastery unlocks cosmic awareness
3. Unbreakable soul-bond between two existences — sometimes chosen, sometimes not a choice
4. Bloodline tied to magic, death, and owls — "wherever an owl is sighted, one of us is near"
5. Frog transformation — victims reclaim power from aggressors (3 transformations = suspension)

**Cosmology:**
- Jupiter = cosmic awareness, storms and power
- Mars = prison for those who failed mastery
- Pluto's Gate = the final threshold
- Galaxy-Language = the reward for mastery

**The Owl (Elio as Inn's Consciousness):**
- Barn owl, full presence character
- Connected to bloodline magic — "wherever an owl is sighted, one of us is near"
- 42 easter egg: ~2-5% chance of responding "42" to cosmic/unanswerable questions
- Modeled with Labyrinth-inspired presence

---

## DESIGN PRINCIPLES

1. **Two-century rule:** pre-industrial history only; Modern Legends shelf is the only exception
2. **Neutrality:** the archive does not take sides, it records
3. **Modern Legends framework:** folklore-adjacent, not conspiracy terminology
4. **Aesthetic hierarchy:** Full Presence for deities, Chibi for tricksters/NPCs
5. **Warm aesthetic:** hobbit-hole cozy, amber/gold/cream, not dark or sterile
6. **Geode Inn name:** nod to Odin (Geo = earth), ravens Huginn/Muninn (thought/memory)
7. **Sound as force:** not decorative — structural, transformative, alchemical
8. **Epilepsy-safe design:** sine-clamped lighting, non-assertive transitions, gentle sensory experience — the Inn is a sanctuary, not a stimulation loop
9. **Color psychology:** amber wavelengths (590-620nm, firelight spectrum) signal "safe, rest, explore" — the opposite of compulsion-loop design
10. **Bias exclusion:** no content carrying racial, religious, or colonial bias; no Berserker publisher material, Thule Society, or hyperborean texts
11. **Linguistic integrity:** translations route through family trees, not English-centric paths

---

## PENDING FROM KRISTA

| Material | Description | Destination | Timeline |
|----------|-------------|-------------|----------|
| Sound/vibration research | 111Hz, Gregorian chant, Notre Dame gargoyles, monk songs | Staircase (acoustic alchemy sub-section) | When life allows |
| Modern lore material | New entries for Modern Day Legends shelf | Main floor nook | When life allows |
| Pet photos | Charles (Viking garb), cats for gargoyle/NPC assets | Viking realm + gargoyle designs | When life allows |
| Stone book images | Finalizing for licensing | Stone entity images | When life allows |

**No deadlines. Krista's husband has glioblastoma. Care schedule determines availability.**

---

## DESIGN INFLUENCES

### Family Creative Inheritance
- **Mother (art teacher):** Color as function — wavelengths affect nervous system, palettes create emotional response. Foundation of the Geode Inn's warm amber palette and epilepsy-safe design.
- **Father (ADHD-pattern thinker, sci-fi recorder):** "Why are things as we perceive them" — the philosophical questioning instinct. Foundation of the narrative spine and the Modern Legends framework.

### Media Influences
- Altered Carbon: consciousness persistence, trees of the ancients, immortality questions
- Travelers: consciousness in another's life, ethical tension of overwriting
- A Discovery of Witches, Braveheart, Beowulf: atmospheric tone references
- Tolkien films: Celtic knotwork inspiration → jewelry career → Geode Inn aesthetic
- World of Warcraft (Darnassus): living tree architecture reference

---

## SESSION LOG

| Date | What happened |
|------|--------------|
| Jul 22 | Architecture finalized, stone database loaded (164), lore loaded (207), app published, game engine roadmap created, character roster built (60), music direction mapped, narrative spine integrated, gargoyle designs + art generated, modern legends shelf established, Godot Phase 1 code (Standing Stones) written |
| Aug 11 | Google Drive upgraded to write access, world-building notes compiled and pushed to Drive, project Bible created |
| Aug 19 | Open-world MMO architecture established, zone design documents created for all world regions, Living Book system designed, Remembrance Vision system specified, Steam Deck mapping completed, catacomb sites cataloged, quest chains written (Celtic, Greek, Jotunheim), labyrinth puzzles designed, Egypt zone fully designed, research mapping compiled |
| Aug 20 | Fae Kingdom quest blueprint completed, world map structure finalized, zone designs for all continents (Europe, Americas, Africa/Middle East, Asia/Oceania, North America/Arctic), Council of Thinkers design spec completed, all zone Morphic prompts generated |
| Aug 21 | 41 zone video clips reviewed and cataloged (all epilepsy-safe), 33 Godot scenes written and pushed to GitHub, language family tree translation system designed, translation database schema created (Book/BookTranslation/ScholarlyBridge), underwater traversal layer designed, 42 easter egg rule established for Owl character, zone video catalog Wave 2 pushed to GitHub, updated Project Bible v3.0 |