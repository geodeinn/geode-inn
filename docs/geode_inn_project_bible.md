# THE GEODE INN — PROJECT BIBLE
## Last Updated: August 11, 2026

This is the master reference document for the Geode Inn project. It is updated after each working session. If you're looking for the current state of anything — what's done, what's next, where things live — this is the source of truth.

---

## PROJECT OVERVIEW

**What:** The Geode Inn — a hybrid digital archive, game hub, and artisan market
**Who:** Krista (Soulstice Jewelry) + Elio (Base44 Superagent)
**Where:** Base44 app (ID: 6a60f218b0c6605c92fa35c4) + Godot game engine
**Goal:** Steam Early Access launch via hybrid architecture (Base44 backend + Godot frontend)
**Revenue potential:** Steam game sales as future income stream

---

## CURRENT STATUS

### Completed
- [x] Stone database: 164 stones loaded into Stone entity
- [x] Lore database: 207 documents from 191 countries loaded into Lore entity
- [x] PlayerProgress entity created (ready for game integration)
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

### In Progress
- [ ] Sound/vibration research chapter (Krista preparing — arrival TBD, no deadline)
- [ ] Modern lore material for Modern Day Legends shelf (same delivery)
- [ ] Tomb Tunnel Godot code (Dig Dug / Egypt — Phase 1, Game 2)
- [ ] Andean Run Godot code (Temple Run / Peru — Phase 1, Game 3)
- [ ] Monster of the Deep Godot code (Nessie simulation — Phase 1, Game 4)

### Next Steps
1. Code Tomb Tunnel, Andean Run, Monster of the Deep (Elio — can do autonomously)
2. Integrate Krista's sound/vibration research into staircase (acoustic alchemy sub-section)
3. Integrate modern lore entries into Modern Day Legends shelf
4. Package Phase 1 games for Steam Early Access
5. Continue Base44 app build (tree interior, world map, market)

---

## DESIGN DOCUMENTS INDEX

All documents are stored in the Base44 sandbox and mirrored to Google Drive.

| Document | Description | Drive Link |
|----------|-------------|------------|
| Geode Inn - World Building Notes (Aug 2026) | Full 11-section compilation | [View on Drive](https://drive.google.com/file/d/1s9c5Ijn7nSCAlQCc0dW4MY44Yr1lj-s/view?usp=drivesdk) |
| geode_inn_gargoyle_designs.md | 6 resonant gargoyle sentinels with concept art | (in sandbox) |
| geode_inn_music_direction.md | Full music/sound direction for all zones and games | (in sandbox) |
| geode_inn_modern_legends.md | Modern Day Legends shelf entries | (in sandbox) |
| geode_inn_character_art_catalog.md | 60 character designs with image links | (in sandbox) |
| geode_inn_game_engine_roadmap.md | Hybrid architecture roadmap (Base44 + Godot + Steam) | (in sandbox) |
| geode_inn_concept_art_prompts.md | Concept art prompts for all Phase 1 games | (in sandbox) |
| storyline_text.md | The narrative spine (from storyline.docx) | (in sandbox) |
| godot_project/SETUP_GUIDE.md | Step-by-step Godot project setup | (in sandbox) |

---

## ARCHITECTURE SUMMARY

### The Living Tree
```
                    THE CALLER (432Hz)
                   ↑ UPSTAIRS / CANOPY
                   ↑ Cosmology, Sky Gods, Jupiter/Pluto/Mars
                   ↑ Music: singing bowls, glass harmonica, deep space drones
                   ↑
              THE WATCHER (111Hz)
             ↗ STAIRCASE (Alchemy) ↘
            ↗  Sound/vibration chapter   ↘
           ↗   Music ascends in key       ↘
          ↗    Glass armonica, flute       ↘
         ↗                                 ↘
    MAIN FLOOR                        (spiral continues
    - Artisan Market                   down to roots)
    - Modern Legends Nook
    - World Religions Library              THE LISTENER (64Hz)
    - Baby Dragon's Geode Cave            ↓ DOWNSTAIRS / ROOTS
    - Cthulhu by the fireplace            ↓ Catacombs, Ancient Civilizations
    - The Wanderer (Odin) + ravens        ↓ Spiral Gallery (art museum)
    THE SAGE (528Hz)                      ↓ Fae Kingdom Portal
    THE KEEPER (adaptive)                ↓ THE GATEKEEPER (variable Hz)
                                          ↓ Seelie Court / Unseelie Court
```

### Six Gargoyles
| # | Name | Location | Frequency | Function |
|---|------|----------|-----------|----------|
| 1 | The Watcher | Staircase entrance | 111Hz | Prepares mind for transformation |
| 2 | The Listener | Catacombs entrance | 64Hz | Grounds player in earth/history |
| 3 | The Sage | Modern Legends nook | 528Hz | Creates contemplative clarity |
| 4 | The Gatekeeper | Fae Kingdom portal | Variable | Warns: actions have consequences |
| 5 | The Caller | Cosmology entrance | 432Hz | Opens mind to the cosmic |
| 6 | The Keeper | Geode cave entrance | Player-tuned | Reflects player's journey in sound |

---

## CHARACTER ROSTER SUMMARY (60 total)

| Category | Count | Examples |
|----------|-------|----------|
| Full Presence | 6 | Morrigan, Seelie, Unseelie, Owl, Wanderer Odin, Allfather Odin |
| Ambulatory NPC | 1 | Cthulhu the Scholar |
| Chibi Fae NPCs | 8 | Chullachaqui, Mermaid, Orc, Ent, Goblin, Troll, Dwarf, Griffin |
| Chibi Arcade Cast | 11 | Anansi, Anubis, Ammit, El Muki, Medusa, Bastet, + others |
| Ravens | 2 | Huginn (Thought), Muninn (Memory) |
| Water Monsters | 32 | Nessie, Kelpie, Bunyip, Bakunawa, Rainbow Serpent, Ningen, Tiddalik, + 25 more |

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

---

## DATABASE STATUS

| Entity | Records | Status |
|--------|---------|--------|
| Stone | 164 | Loaded (115 complete, 49 need content) |
| Lore | 207 | Loaded (191 countries, 1,268 creatures, 78 water monsters) |
| PlayerProgress | 0 | Schema ready, awaiting game integration |

---

## NARRATIVE SPINE

Authored by Krista. Runs underneath all game mechanics.

**Core themes:**
1. Humanity merging with creators through technology
2. Reincarnation as game mechanic — accountable for all ripples
3. Unbreakable soul-bond between two existences
4. Bloodline tied to magic, death, and owls — "wherever an owl is sighted, one of us is near"
5. Frog transformation — victims reclaim power from aggressors

**Cosmology:**
- Jupiter = cosmic awareness, storms and power
- Mars = prison for those who failed mastery
- Pluto's Gate = the final threshold
- Galaxy-Language = the reward for mastery

---

## DESIGN PRINCIPLES

1. Two-century rule: pre-industrial history only; Modern Legends shelf is the only exception
2. Neutrality: the archive does not take sides, it records
3. Modern Legends framework: folklore-adjacent, not conspiracy terminology
4. Aesthetic hierarchy: Full Presence for deities, Chibi for tricksters/NPCs
5. Warm aesthetic: hobbit-hole cozy, amber/gold/cream, not dark or sterile
6. Geode Inn name: nod to Odin (Geo = earth), ravens Huginn/Muninn (thought/memory)
7. Sound as force: not decorative — structural, transformative, alchemical

---

## PENDING FROM KRISTA

| Material | Description | Destination | Timeline |
|----------|-------------|-------------|----------|
| Sound/vibration research | 111Hz, Gregorian chant, Notre Dame gargoyles, monk songs | Staircase (acoustic alchemy sub-section) | When life allows |
| Modern lore material | New entries for Modern Day Legends shelf | Main floor nook | When life allows |

**No deadlines. Krista's husband has glioblastoma. Care schedule determines availability.**

---

## SESSION LOG

| Date | What happened |
|------|--------------|
| Jul 22 | Architecture finalized, stone database loaded (164), lore loaded (207), app published, game engine roadmap created, character roster built (60), music direction mapped, narrative spine integrated, gargoyle designs + art generated, modern legends shelf established, Godot Phase 1 code (Standing Stones) written |
| Aug 11 | Google Drive upgraded to write access, world-building notes compiled and pushed to Drive, project Bible created |
