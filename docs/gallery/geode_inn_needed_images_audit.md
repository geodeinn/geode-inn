# Geode Inn — Needed Images Audit & Prioritized Work Queue
**Generated:** 2026-09-12 | **Scope:** Repository Audit (/app/geode-inn-work)

This audit establishes the definitive 'really needed' image list for the Geode Inn project. It cross-references the Master Asset Ledger (), Camera Coverage Kit (), Fae Kingdom MMO Production Spec (), Drive Intake Manifest (), Asset Manifest (), NPC Portrait Manifest (), and local gallery storage ().

---

## 1. REFERENCED BUT MISSING
*Images referenced across game specs, manifests, or lore documents that currently have NO hosted URL in  and NO local file in  subfolders.*

### A. Fae Kingdom MMO Web Sync Assets (15 Items)
- **Antikythera UI Kit (6 UI-Class Masters):**
  1. World Map Screen (6 realms + portal network, hub-and-spoke layout)
  2. Dual Reputation Bar (Seelie/Unseelie court alignment UI)
  3. Quest Log Interface (contextual dialogue framework)
  4. Inventory Grid (the stone pouch)
  5. Portal Ring Fast-Travel Interface
  6. Stone-Reveal Frame (labradorite flash container)
- **Quest Cinematics / Scene Panels (8 Flagship Moments):**
  1. The Threshold Arrival (the respectful door)
  2. Standing Stones Portal Opening (surface-to-Kingdom crossing)
  3. First Court Welcome / Seelie Riddle
  4. The Hollow's Price Scene (Unseelie cold grandeur)
  5. Griffin's Gardens Encounter (distant neutral ground)
  6. The Broken Bridge (court split & grief)
  7. Stone Circle Chamber Reveal (deepest tone)
  8. Queens' Audience (Vertical Gaze reward)
- **Labradorite Reveal Animation Set (1 Set / 4-6 Frames):**
  - Dormant → gathering -> FULL FLASH (blue-gold bloom, sine-in/sine-out) → settling.

### B. Missing Critter Art (3 Species)
- **Axolotl** (missing 42Hz Living, 84Hz Shadow, and In-Between art)
- **Mantis Shrimp** (missing 42Hz Living, 84Hz Shadow, and In-Between art)
- **Rain Frog** (missing 42Hz Living, 84Hz Shadow, and In-Between art)

### C. Tri-Mode In-Between & Shadow Debt (70 Assets)
- **NPC In-Between State Portraits (59 NPCs):** Only Belladonna has an In-Between version completed; 59 main cast NPCs are missing In-Between state portraits.
- **Item In-Between State Portraits (11 Items):** 11 core quest/inventory items lack In-Between art.

### D. Roster Character Visuals Owed (4 NPCs)
- **Quire / John Myers:** Canon Archive scholar NPC; portrait and voice block unpainted.
- **TJ:** Parental gate character; portrait unpainted.
- **The Apothecary:** Poison Garden quest giver; portrait unpainted.
- **Goth/Cave City Voice Cast Visuals:** Gatekeeper Goth, Hearthkeeper Goth, The Mourner, Root Reader, The Singer.

### E. Drive Intake Queue (333 Files Queued / Unhosted)
- **Zone & JPEG Files (295 images, 38 videos):** Upload queued in ; pending metadata stripping, hosting, and URL appending.
- **Unidentified JPEGs (36 files):** Files named  requiring sorting and tagging with Krista.

---

## 2. THE OWED ART DEBT
*Summary of all OWED rows in  and spec kit tables.*

### A. CYCLE-CAM Angle Sets (Camera Coverage Kit Debt)
Per , every CYCLE class master requires an angle set:
1. **Player Character (4-Angle Compass + Hand Set):**
   - **Back 3/4 (Priority 1):** Over-the-shoulder default (idle + walk cycles).
   - **Front:** Dialogue and approach default (idle + dialogue).
   - **True Side:** Movement angle.
   - **True Back:** Quest follow-cam angle.
   - **First-Person Hand Set Overlays:** Tea-cup hands, stone-touching hands, card-dealing hands, mail-folding hands (Puzzle Stamp).
2. **High-Traffic NPC Residents (3-Angle Resident Cut):**
   - Front, Front 3/4, and Side angles for core cast (Storyteller, Catalyst, Constant, Bard, Fixer, etc.).
3. **Walkers (4-Angle Cut):**
   - Resident cut + True Back route angle for mobile NPCs (Postmaster, Bone Mail Crew, Door-keepers).

### B. Zone Kit Slots Owed (KIT-Z Fills & Wides)
- **Fae Kingdom Interior Catch-Up (~50 masters):** Summerlands doors, Hollow doors, Crystal Gardens, Stone Circle Chamber option views, tri-mode states, and props.
- **Clockwork Skies (Level 8):** 4 room fills and establishing wides.
- **Canopy City (Level 7):** 4 platforms (Norse, etc.), shipyard, and Home Bough fills.
- **Dark Side of the Inn:** Lava lamp sphere shader/visuals, 84Hz Opal, and In-Between silence states.

### C. Game Engine & System Art Debt
- **Arcade Game Sprites:** 79 out of 80 arcade games lack engine sprites (only Tomb Tunnel has pilot sprites).
- **Movement Cycles:** Tier 2 and Tier 3 animated element cycles (~150 animated elements).
- **Gazette Web Beta Page:** Gazette display page and daily generation workflow templates.
- **Tier 4 Marketing Visuals:** Storefront pages, launch banners, event key art.

---

## 3. DEDUPE TARGETS
*Redundant or duplicate files identified in  and gallery audits to be collapsed into single canonical uploads.*

### A. Known Duplicate Zone Sets (Drive Intake)
1. **Fae Summerlands Set:** Collapse , , , and  → canonical .
2. **Staircase Alembic Window Set:** Collapse , , , and  → canonical .
3. **Allfather's Throne Set:** Collapse , , , and  → canonical .
4. **Cosmology Mural Set:** Collapse , , and  → canonical .
5. **Catacombs Walkthrough Set:** Collapse – and – → 8 canonical paired zone assets ( through ).

### B. Character Filename Consolidation & Renames
-  /  → **Brim**
-  (v1, v2, v3) → **Malachi** (v3 canonical)
-  (v1, v2) → **Waystone** (v2 canonical)
-  /  → **Belladonna**
-  /  /  → **Ragana**
-  /  → **Lozen**
-  → **The Archivist**
-  → **Fibonacci**
-  → **The Greenward**

---

## 4. TOP 40 PRIORITY LIST
*Ranked for a single ~5-hour work session today. Yardstick: Highest build impact for the web beta and Fizgigs' active parcels.*

1. **Player Character Back 3/4 Angle (Idle + Walk):** Over-the-shoulder default camera angle (highest build impact across entire game).
2. **Antikythera HUD & UI Kit (6 Masters):** Unlocks Fae Kingdom MMO web beta interface (map, reputation, quest log, inventory, portals, reveal frame).
3. **Labradorite Bloom Animation Set (4 Frames):** Fae web sync requirement (dormant → gathering → full flash → settling).
4. **Fae Kingdom Quest Cinematics (8 Flagship Moments):** Key story panels for Fae web beta release.
5. **Player Character Front Angle (Idle + Dialogue):** Conversation default for third-person camera mode.
6. **First-Person Hand Set Overlays (4 Overlays):** Tea-cup, stone-touching, card-dealing, and mail-folding hands wearing attire.
7. **High-Traffic NPC Resident Cut (3 Angles):** Front, front 3/4, side for core cast (Storyteller, Catalyst, Constant, Bard, Fixer).
8. **Walkers' Back Route Angles:** Back route angle for Postmaster and Bone Mail Crew.
9. **Missing Critter Art (Axolotl, Mantis Shrimp, Rain Frog):** Complete 42Hz, 84Hz, and In-Between art for missing critters.
10. **Drive Intake Zone Set Deduplication & Upload:** Collapse and host the 5 duplicate zone sets (Fae, Staircase, Allfather, Cosmology, Catacombs).
11. **Fae Kingdom Named Resident Cycles (10 Masters):** Oleander, Malachi, Queens, Head Finder, Door-keepers.
12. **Griffin Boss Distant Poses (3 Poses):** Distant angle set for Crystal Gardens boss.
13. **Drive Intake 36 Unidentified JPEGs Sorting:** Categorize and tag mystery files with Krista.
14. **High-Priority Arcade Game Sprites (Batch 1 - Top 10 Games):** Engine sprites for Tomb Tunnel and top 9 build-sheet games.
15. **NPC In-Between State Batch 1 (Tier 1 Cast - 12 NPCs):** In-Between portraits for core Tier 1 NPCs.
16. **Fae Threshold & Summerlands Kit-Z Fills:** Option views and ENV props for Fae entrance zones.
17. **Clockwork Skies Room Establishing Wides (4 Rooms):** Level 8 room fills.
18. **Canopy City Platform & Shipyard Fills:** Level 7 platform wides and Home Bough fills.
19. **Quire & TJ Character Portrait Masters:** Portrait debt for canon Archive scholar and parental gate NPC.
20. **Poison Garden Apothecary Character Portrait:** Portrait master for Poison Garden quest chain.
21. **Item In-Between State Batch 1 (11 Items):** Missing In-Between states for key quest items.
22. **NPC In-Between State Batch 2 (Tier 2 Cast - 20 NPCs):** In-Between portraits for secondary NPCs.
23. **NPC In-Between State Batch 3 (Remaining Cast - 27 NPCs):** Complete remaining NPC In-Between portraits.
24. **Arcade Game Sprites Batch 2 (20 Tier 2 Games):** Engine sprites for Tier 2 arcade games.
25. **Arcade Game Sprites Batch 3 (20 Tier 3 Games):** Engine sprites for Tier 3 arcade games.
26. **Arcade Game Sprites Batch 4 (Remaining 29 Games):** Complete remaining arcade game sprite sheets.
27. **Tier 2 Movement Cycles (50 Elements):** Animated movement cycles for residents and walkers.
28. **Tier 3 Movement Cycles (Remaining Elements):** Environmental animated cycles.
29. **Gazette Web Display Page & Daily Workflow Art:** Web beta Gazette layout and daily strip templates.
30. **Drive Intake Character JPEGs Batch 1 Upload (100 Files):** Strip metadata and upload first batch of character intake JPEGs.
31. **Drive Intake Character JPEGs Batch 2 Upload (112 Files):** Strip metadata and upload second batch of character intake JPEGs.
32. **Drive Intake Zone Videos Batch Upload (38 MP4s):** Upload zone walkthrough MP4s to public storage.
33. **Character Filename Consolidation Execution:** Execute rename map (Brim, Malachi, Waystone, Belladonna, Ragana, Lozen).
34. **Cultural Zones Tri-Mode Completion:** Final 84Hz/In-Between passes for remaining cultural zones.
35. **Dark Side Lava Lamp & Sphere Visuals:** 84Hz Opal and In-Between silence visuals for Dark Side build sheet.
36. **Fae Hollow & Crystal Gardens Kit-Z Fills:** Interior props and option views for Fae courts.
37. **Stone Circle Chamber Kit-Z Fills:** Deepest Fae room props and tri-mode views.
38. **Tier 4 Marketing & Store Page Visuals:** Launch banners, store listing assets, key art.
39. **Cryptid Expansion Roster Art (17 Cryptids):** Optional Wikipedia cryptid expansion.
40. **Sprite Crunch Extraction Pass:** 64px extraction pipeline run across all completed CYCLE-CAM masters.
