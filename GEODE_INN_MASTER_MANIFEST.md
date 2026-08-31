# Geode Inn — Master Game-Builder Manifest
## The Manifest of Manifests
### August 31, 2026

This is the routing document. Every subsystem has its own detailed manifest or documentation set. This index tells the game writer where to find everything and what state it's in.

**Project total: 1,552 files across 5 major directories**

---

## QUICK NAVIGATION

| If you're building... | Go to section... | Key files... |
|---|---|---|
| Audio system | Section 1 | `library/mechanics/geode_inn_complete_audio_manifest.md` |
| Visual/art assets | Section 2 | `docs/gallery/` (271 images) |
| Game scripts (Godot) | Section 3 | `beta/scripts/` and `godot_project/scripts/` |
| Dialogue system | Section 4 | `beta/data/dialogue_complete.json` + `godot_project/scripts/geode_inn_voice_profiles.gd` |
| Database/entities | Section 5 | Base44 entities (21 entity types) |
| Zone design | Section 6 | `library/zones/` (20+ zone docs) |
| Character profiles | Section 7 | `library/characters/` (38+ docs) |
| Storyline/narrative | Section 8 | `library/storyline/` (21 docs) |
| Game mechanics | Section 9 | `library/mechanics/` (38+ docs) |
| Items/resources | Section 10 | `library/items/` (8 zone item docs) |
| Building/crafting | Section 11 | `library/recipes/` + `docs/geode_inn_building_system.md` |
| Card game | Section 12 | `library/card_game/` + `docs/geode_inn_card_game_framework.md` |
| Comic strip | Section 13 | `docs/geode_inn_comic_strip_system.md` |
| Egg system | Section 14 | `docs/geode_inn_faberge_egg.md` + `docs/geode_inn_the_egg.md` |
| Nine Muses | Section 15 | `docs/geode_inn_nine_muses.md` + quest chains |
| Business/products | Section 16 | `docs/geode_inn_product_line_plan.md` |
| Steam/beta checklist | Section 17 | `STEAM_BETA_CHECKLIST.md` |

---

## 1. AUDIO SYSTEM
**Status: MANIFEST COMPLETE**

**Master manifest:** `library/mechanics/geode_inn_complete_audio_manifest.md` (318 lines)
**Reference doc:** `library/mechanics/geode_inn_master_audio_voice_system.md` (309 lines)

### What exists:
- 368 generated audio files in `beta/assets/audio/` across 6 categories
- 298 stone chimes (Mohs to frequency mapping)
- 14 system tones (42Hz, 84Hz, 111Hz, 7.83Hz, 9 Solfeggio)
- 20 zone ambient drone beds
- 6 game audio stingers
- 18 Music Room assets (fortepiano notes, geode cave states, Nine Songs chord)
- 12 classical dub tracks (all 9 composers: Bach, Mozart, Beethoven, Chopin, Vivaldi, Brahms, Tchaikovsky, Schonberg, Cohen)
- 74 Godot voice profiles (1,426 lines) in `godot_project/scripts/geode_inn_voice_profiles.gd`

### What needs building:
- Godot Audio Manager (loads/plays/transitions all assets)
- Zone instrument layer recordings (needs composer)
- UI sounds, door sounds, haptic integration
- In-Between physics sounds, puzzle completion notes
- Bead Composer real-time engine in Godot

---

## 2. VISUAL / ART ASSETS
**Status: 271 images generated and organized on GitHub**

### Art Gallery: `docs/gallery/` (272 files)
| Category | Count | Contents |
|---|---|---|
| `characters/` | 157 | All NPC portraits, creature designs, character class art |
| `zones/` | 53 | All 35 zone visuals + sub-zone images |
| `creatures/` | 39 | Water monsters (32) + land creatures |
| `items_and_artifacts/` | 13 | Key items, artifacts, charms |
| `logos/` | 10 | Inn logos, emblems, branding |

### Art Catalog Docs:
- `docs/geode_inn_character_art_catalog.md` — 60 character designs cataloged
- `library/characters/builder_character_image_map.md` — Character to image crossref
- `library/characters/character_image_crossref.md` — Full image cross-reference

### Visual Style Guide:
- Prototype style: Royo x Vampire Hunter D x Trinity Blood (hyper-detailed patterns, smooth flowing lines)
- Foundational DNA: Klimt (stillness) + Royo (movement)
- 37 artist assignments across 37 zones (see "For you" note for full map)
- Linework-as-UI system: cel-shaded (tradesmen), flowing (lore), angular (guardians), no-outline (cosmology), fragmented (crisis)

### What needs building:
- Sprite sheets for 207 animated elements
- Concept art Batch 2 for newly solidified zones
- Concept art prompts for 11 new artist assignments
- Loading screen: Tumble + brownies (Franjean/Rool energy), NOT fizgigs in overalls
- Celtic knotwork gold-on-dark-stone ambient texture assets

---

## 3. GAME SCRIPTS (Godot)
**Status: 36 scripts written, core architecture in place**

### Core Systems (`beta/scripts/`):
| Script | Purpose | Status |
|---|---|---|
| `APIManager.gd` | Base44 API connection | Written |
| `GameManager.gd` | Player progress tracking | Written |
| `SaveManager.gd` | Save/load system | Written |
| `DialogueManager.gd` | NPC dialogue system | Written |
| `FizgigLoader.gd` | Asset/data loader | Written |
| `CutsceneController.gd` | Cutscene playback | Written |
| `CutscenePlayer.gd` | Cutscene rendering | Written |
| `MainMenu.gd` | Main menu | Written |
| `WorldMap.gd` | World map navigation | Written |
| `CommonRoomHub.gd` | Hub area | Written |
| `EndgameChoice.gd` | STAY/LEAVE/HIDE endgame | Written |
| `FinalRoom.gd` | Final Room sequence | Written |

### Arcade Games (`beta/scripts/games/`):
| Script | Game | Status |
|---|---|---|
| `StandingStones.gd` | Tetris (Stonehenge) | Written |
| `TombTunnel.gd` | Dig Dug (Egypt) | Written |
| `AndeanRun.gd` | Temple Run (Peru) | Written |
| `MonsterOfTheDeep.gd` | Loch Ness | Written |
| `HollowMen.gd` | T.S. Eliot's Shadow Inn | Written |
| `TumbleRun.gd` | Tumble arcade (standalone $4.99) | Written (424 lines) |
| `Sandfall.gd` | O'Keeffe sinking sand | Written |

### Scene Scripts (`godot_project/scenes/`):
33 scene scripts covering all 9 Inn levels + world map zones + Fae Kingdom areas

### Generators (`beta/scripts/generators/`):
10 Python scripts for data generation (recipes, items, validation)

### What needs building:
- `project.godot` (Godot project configuration file)
- Godot Audio Manager
- Resonance Card Game engine
- Bead Composer Godot integration
- Knotwork Game
- In-Between game (Limbo-style)
- Shadow Inn combat engine
- Wandering Program co-op system

---

## 4. DIALOGUE SYSTEM
**Status: 46 entries loaded, 35 NPC hook words cataloged**

### Data Files:
- `beta/data/dialogue_complete.json` — All 46 dialogue entries (merged, NPC names fixed)
- `beta/data/dialogue.json` — Base dialogue data
- `beta/data/raw/dialogue_payload.json` — Raw import data
- `library/dialogue/dialogue_entries.json` — Reference copy
- `library/dialogue/npc_hook_words.md` — 35 NPC hook word catalog (verbal fingerprints)
- `beta/data/dialogue_missing_entries.json` — Missing entries tracker

### Voice Profiles:
- `godot_project/scripts/geode_inn_voice_profiles.gd` — 74 Godot profiles (1,426 lines)
- Each profile: pitch_hz, reveal_speed, pause_weight, expressiveness, instrument, cadence, facial_intensity, gesture_data, idle_animations, light_source, special_mechanics

### Key NPCs with dialogue:
- 46 dialogue entries covering 29 NPCs (after merge/fix)
- Lozen (River): 12 entries (Sentinel's Vigil questline, river_001 through river_010c)
- Quire: 1 entry (quire_001, Archive zone)
- All NPC names IP-audited: Brim, Naut, Lozen, Lark (no book/movie references)

### What needs building:
- Remaining NPC dialogue trees (18 Godot profiles to code)
- Dialogue UI rendering in Godot
- Branching dialogue system (responses/conditions/setFlags)
- Whisper Layer dialogue triggers

---

## 5. DATABASE / ENTITIES
**Status: 21 entity schemas created, data loaded**

### Entity Types (Base44 database):
| Entity | Records | Purpose |
|---|---|---|
| Stone | 198 | Stone database (Mohs, family, color, geo, cabochon/facet/opacity) |
| Lore | ~191 | World mythology (countries, creatures, water monsters) |
| PlayerProgress | — | Game state tracking |
| Book | — | Archive library books |
| BookTranslation | — | Book translations |
| ScholarlyBridge | — | Scholarly bridge texts |
| Leaderboard | — | Arcade game leaderboards |
| MarketItem | — | Artisan marketplace listings |
| PlayerInventory | — | Player collected/purchased items |
| ElementCharm | 118 | Periodic table element charms |
| QuestCharm | 45 | Quest reward charms |
| BoardSkin | — | Board game visual skins |
| TrayTemplate | — | Board game tray layouts |
| ComicStrip | — | Daily comic strip entries |
| EggHatch | — | Egg system hatches |
| EggVote | — | Egg system votes |
| Artisan | — | Artisan marketplace vendors |
| Material | 65 | Building system materials |
| BuildingRecipe | 20 | Building system recipes |
| GameItem | 280 | Game items across 27 zones |
| Dialogue | 46 | NPC dialogue entries |
| FaireVenue | — | Share Wood faire venues |

### What needs building:
- Add Stillness Stone (#167) + Octave Stone (#168) to Stone entity
- Compile 55+ missing stone descriptions
- Expand BuildingRecipe to 50+ (currently 20)
- Finalize Book, BookTranslation, ScholarlyBridge data

---

## 6. ZONE DESIGN
**Status: 20+ zone docs, 9 level-complete docs, all 37 zones assigned**

### Level-Complete Design Docs (`library/zones/`):
| Doc | Level | Status |
|---|---|---|
| `geode_inn_level1_cosmology_complete.md` | Level 1: Cosmology | Complete |
| `geode_inn_level2_clockwork_skies_complete.md` | Level 2: Clockwork Skies | Complete |
| `geode_inn_level3_main_floor_complete.md` | Level 3: Main Floor | Complete |
| `geode_inn_level4_campgrounds_complete.md` | Level 4: Campgrounds | Complete |
| `geode_inn_level5_staircase_complete.md` | Level 5: Staircase (Alchemy) | Complete |
| `geode_inn_level6_catacombs_complete.md` | Level 6: Catacombs | Complete |
| `geode_inn_level7_faerie_kingdom_complete.md` | Level 7: Fae Kingdom | Complete |
| `geode_inn_level8_water_zone_complete.md` | Level 8: Water Zone | Complete |
| `geode_inn_level9_undercity_complete.md` | Level 9: Undercity | Complete |

### Special Zone Docs:
- `geode_inn_in_between_builder_spec.md` — In-Between (Limbo game) full spec
- `geode_inn_hollow_earth_build_spec.md` — Hollow Earth RPG
- `geode_inn_gorgons_garden_build_spec.md` — Poison Garden (84Hz)
- `geode_inn_world_grid.md` — World map grid system
- `geode_inn_silk_road_build_spec.md` — Silk Road ley lines
- `geode_inn_norse_realms.md` — Norse realms expansion
- `geode_inn_redwood_cathedral.md` — Redwood Cathedral zone

### Artist Map (37 zones, all assigned):
See "For you" note for the complete artist-to-zone assignment map (Klimt, Royo, Van Gogh, Picasso, Mapplethorpe, Magritte, O'Keeffe, Monet, Hokusai, Moreau, Guo Xi, Mulan, Book of Kells, Roerich, Tagore, Don't Starve, Dixon, Benton, Bierstadt, Wyeth, Adams, Carr, Lee, Bauer, Dali, Rackham, Rousseau, Doré, Gorey, Escher, Rothko, Hokusai, Kiefer, Martin, Lewis, Carr)

---

## 7. CHARACTER PROFILES
**Status: 38+ character docs, 200+ creatures cataloged**

### Key Character Docs (`library/characters/`):
- `Geode_Inn_—_Character_Class_Mapping_(31_Characters_×_14_Archetypes).md` — Class system
- `Geode_Inn_—_Character_Class_Mapping_Part_2_(35_More_Characters).md` — Extended classes
- `Geode_Inn_—_Default_Playable_Classes_(Family_as_Archetypes).md` — Playable roster
- `council_of_thinkers_design_spec.md` — Council of Thinkers
- `geode_inn_bestiary_mechanic.md` — Bestiary system
- `geode_inn_brownies.md` — Brownie system (Brindle/Cobble/Thatch)
- `geode_inn_cosmic_crew.md` — Cosmic Crew (Futurama-inspired)
- `geode_inn_npc_joe_solidified.md` — Joe (Lucifer cadence)
- `geode_inn_character_classes.md` — Full class list
- `geode_inn_class_abilities.md` — Class abilities
- `geode_inn_character_homes.md` — Character housing

### Character Art:
- 157 character/creature images in `docs/gallery/characters/`
- Character art catalog: `docs/geode_inn_character_art_catalog.md`

### Creature Roster: 200+ across 8 levels (18 gargoyle puppies, 8 dragon kittens, 14 caimans, Maine Coon colony, Savannah cats, Kodiak bears, etc.)

---

## 8. STORYLINE / NARRATIVE
**Status: 21 storyline docs including the complete Monad Arc**

### Key Narrative Docs (`library/storyline/`):
- `geode_inn_monad_arc_complete.md` — The Monad Arc (12,168 words, 38 art styles) — the foundational narrative conclusion
- `Geode_Inn_—_Campaign_Narrative_(All_Storylines).md` — All storylines
- `Geode_Inn_—_Project_Bible_v3.md` — Project bible
- `geode_inn_master_storyline.md` — Master storyline
- `geode_inn_dm_walkthrough.md` — DM walkthrough
- `geode_inn_storyline_atlas.md` — Storyline atlas
- `geode_inn_living_book_solidified.md` — Living Book framework
- `geode_inn_narrative_integration.md` — Narrative integration
- `Geode_Inn_—_Origin_Story_(Draft_1).md` — Origin story
- `geode_inn_shoulder_companions_deep_storyline.md` — Shoulder companions
- `geode_inn_staircase_origin_storyline.md` — Staircase origin

### Narrative Voice: Rothfuss (precision) + Pratchett (warmth) + Gaiman (mythic) + Asimov (structure) + Bradbury (fire) + Weir (optimism)

### Key Story Decisions:
- Mona is a narrative suggestion, not a character/NPC
- Elio is the Father/Builder of the nest
- The Final Room is the definitive conclusion (empty room, fire, chair, cup, book — no author)
- The Whisper Layer: the Inn is an archive aware of the player (no villain, just a perspective shift)

---

## 9. GAME MECHANICS
**Status: 38+ mechanics docs covering all systems**

### Key Mechanics Docs (`library/mechanics/`):
| Doc | System |
|---|---|
| `geode_inn_complete_audio_manifest.md` | Audio system (THIS IS SECTION 1) |
| `geode_inn_master_audio_voice_system.md` | Master audio + voice doc |
| `geode_inn_tri_mode_game_dynamic.md` | Living/Shadow/In-Between modes |
| `geode_inn_shadow_inn_alttp.md` | Shadow Inn (ALttP-style) |
| `geode_inn_shadow_inn_combat_engine.md` | Shadow Inn combat |
| `geode_inn_personal_arcade_collection.md` | 13 arcade games |
| `geode_inn_octave_system_gbc_gba_blueprint.md` | GBC/GBA engine system |
| `geode_inn_pulse_line_solidified.md` | Frequency pulse line (Living Inn UI) |
| `geode_inn_whisper_layer.md` | Whisper Layer tracking |
| `possum_mode.md` | Possum Mode (voluntary hide mechanic) |
| `geode_inn_song_of_making_solidified.md` | Song of Making system |
| `geode_inn_linework_quest_indicator_system.md` | Linework-as-UI |
| `geode_inn_trifocal_gaze.md` | Camera system (3 perception modes) |
| `Geode_Inn_—_Camera_System_(Four_Modes_as_Game_Mechanic).md` | 4 camera modes |
| `geode_inn_tabletop_questline_analysis.md` | Questline structure |
| `geode_inn_master_level_system.md` | Level system |
| `geode_inn_complete_movement_catalog.md` | Movement system |
| `share_wood_product_spec.md` | Share Wood product |
| `geode_inn_facets_artist_styles.md` | Faceting/artist styles |
| `geode_inn_name_audit.md` | NPC name audit (IP-safe) |
| `Geode_Inn_—_Stone_Vibration_Godot_Integration_Guide.md` | Stone vibration Godot guide |
| `Geode_Inn_—_Acoustic_Engine_Architecture_(IEM-Based_Sound_Processing).md` | IEM architecture |
| `language_family_tree.md` | Language families for translation |

### Solidification Batches (`library/solidification/`):
13 docs covering characters, zones, systems, narrative infrastructure, quests, and NPCs. The master index: `geode_inn_master_solidification_index.md`

---

## 10. ITEMS / RESOURCES
**Status: 280 GameItems across 27 zones, 8 zone item template docs**

### Item Template Docs (`library/items/`):
- `geode_inn_cosmology_item_templates.md`
- `geode_inn_hearth_item_templates.md`
- `geode_inn_staircase_item_templates.md`
- `geode_inn_catacombs_item_templates.md`
- `geode_inn_undercity_item_templates.md`
- `geode_inn_fae_kingdom_item_templates.md`
- `geode_inn_water_item_templates.md`
- `geode_inn_lighthouse_item_templates.md`

### Item Counts:
- 280 GameItems in database (across 27 zones)
- 118 ElementCharms (periodic table)
- 45 QuestCharms (quest rewards)
- 56 interactive furniture items (across 7 zones)

---

## 11. BUILDING / CRAFTING SYSTEM
**Status: 65 materials, 20 recipes (target 50+), full building system doc**

### Key Docs:
- `docs/geode_inn_building_system.md` — Full building system (Ironforge-style zones, Don't Starve gathering, 5 tiers)
- `library/recipes/` — Recipe data
- `beta/scripts/generators/` — Recipe generation scripts
- `beta/data/raw/recipes.json` + `recipes_formatted.json` — Recipe data files

### Crafting Systems:
- **Cabochon system**: three cut types (beads strung, cabochons set, faceted light)
- **Knotwork game**: dual-mode (drag = game, click = design tool), exports to Soulstice workshop
- **Selkie questline**: three-act crafting quest (cutting cabochons, forming beads, wirework)
- **Bead Composer**: real-time audio + visual jewelry design tool
- **Building recipes**: 20 loaded (target 50+), covers all tiers

### Materials: 65 materials in database across all zones (includes Bog Oak Tier 3, Luminwood Tier 4)

---

## 12. CARD GAME (Resonance)
**Status: Framework complete, 6 frequency types, 2 card batches**

### Key Docs:
- `docs/geode_inn_card_game_framework.md` — Core framework
- `docs/geode_inn_card_batch_2.md` — Batch 2 cards
- `library/card_game/` — Card game data
- `docs/geode_inn_constant_arcana.md` — Constant arcana system

### Card Frequencies:
1. Song (42Hz) — Tempo
2. Silence (Nyx) — Control
3. Fire (50 BPM) — Aggression
4. Water (16-42Hz) — Tempo-Control
5. Stone (111Hz) — Defense-Control
6. Root (Mycorrhizal) — Ramp-Combo

---

## 13. COMIC STRIP
**Status: System designed, not yet automated**

- `docs/geode_inn_comic_strip_system.md` — Daily four-panel comic strip system
- Feeds into the interactive library (player adventures become archived visual stories)
- Retired Egg-hatched characters migrate to comic as echoes/cameos
- Entity: ComicStrip (created)

### What needs building:
- Daily generation workflow
- Panel art assets
- Integration with player adventure data

---

## 14. EGG SYSTEM
**Status: Fully designed, entities created**

- `docs/geode_inn_faberge_egg.md` — Egg system design
- `docs/geode_inn_the_egg.md` — The Egg (narrative)
- `geode_inn_faberge_egg_solidified.md` — Solidified spec
- Entities: EggHatch, EggVote (created)
- 28-day lifecycle, retired characters migrate to comic strip
- The Reader appears with "The Book of What Was Alive"

---

## 15. NINE MUSES
**Status: Quest chains designed, Solfeggio tones generated**

- `docs/geode_inn_nine_muses.md` — Nine Muses system (maps to Solfeggio frequencies)
- `docs/geode_inn_nine_muses_quest_chains.md` — Quest chain details
- 9 Solfeggio tones generated in `beta/assets/audio/system_tones/`
- Nine Songs chord: `beta/assets/audio/music_room/nine_songs_chord.wav`

### Muse to Frequency Map:
Calliope (42Hz), Clio (72Hz), Euterpe (50Hz), Thalia (84Hz), Melpomene (396Hz), Terpsichore (528Hz), Erato (639Hz), Polyhymnia (741Hz), Urania (852Hz)

---

## 16. BUSINESS / PRODUCT LINE
**Status: Five-product ecosystem designed**

### Product Docs:
- `docs/geode_inn_product_line_plan.md` — Five-product plan
- `docs/geode_inn_bead_composer_standalone_product.md` — Bead Composer product
- `docs/geode_inn_bead_composer.md` — Bead Composer spec
- `docs/geode_inn_artisan_market.md` — Artisan marketplace
- `docs/geode_inn_marketplace_design.md` — Marketplace design
- `library/mechanics/share_wood_product_spec.md` — Share Wood (Renaissance faire product)
- `library/mechanics/faire_zone_system.md` — Faire zone system

### Five Products:
1. **Geode Inn Web Beta** — The game hub (Base44 app)
2. **Tumble Run** — Standalone arcade ($4.99 + 3 DLC packs)
3. **Bead Composer** — Jewelry design tool / production configurator
4. **Share Wood** — Renaissance faire digital extension (subscription tiers)
5. **Soulstice Jewelry** — Physical jewelry (soulsticejeweler.com, the real-world craft)

### Artisan Model: Subscription-based discovery hub. Checkout redirects to artist's own shop. The Inn never handles transactions directly.

---

## 17. STEAM / BETA CHECKLIST
**Status: 139-line checklist written**

- `STEAM_BETA_CHECKLIST.md` — Full beta checklist
- `docs/geode_inn_steam_deck_mapping.md` — Steam Deck control mapping

### Beta Priority Queue:
1. Verify vertical descent hub layout rendered
2. Verify "RESERVE YOUR VAULT" footer removed
3. Verify storyline content removed but characters/hooks retained
4. Create /composer page (Bead Composer)
5. Sandfall game (O'Keeffe sinking sand)
6. Main floor content area (the lobby)
7. Write project.godot for the beta
8. Wire 4 core games to Arcade page
9. Godot Audio Manager
10. Dialogue UI in Godot

---

## 18. SOLIDIFICATION INDEX
**Status: 13 batches covering the full project**

`library/solidification/geode_inn_master_solidification_index.md` is the master index to:
- 3 character batches (all characters, NPCs, supporting cast)
- 2 zone batches (all major zones, sub-zones)
- 2 system batches (acoustic engine, tri-mode, building, combat)
- 1 narrative infrastructure batch
- 1 quests batch (Camelot)
- 1 misc batch (Egg, comic, emblems)
- 1 NPC supporting batch

---

## FILE MAP — COMPLETE REPOSITORY

```
geode-inn/                         (1,552 files total)
├── docs/                          (667 files — design docs, gallery, drive-sync)
│   ├── gallery/                   (272 images — characters, zones, creatures, items, logos)
│   ├── drive-sync/                (synced from Google Drive)
│   └── geode_inn_*.md             (392 design docs)
├── library/                       (418 files — the organized knowledge base)
│   ├── animation/                  Animation reference
│   ├── art/                        Art reference
│   ├── card_game/                  Card game data
│   ├── characters/                 (38+ character docs)
│   ├── dialogue/                   Dialogue data + hook words
│   ├── emblems/                    Heraldic emblems
│   ├── items/                      (8 zone item templates)
│   ├── mechanics/                  (38+ system/mechanic docs)
│   ├── recipes/                     Building recipes
│   ├── reference/                  Reference materials
│   ├── sessions/                   Session logs
│   ├── solidification/             (13 solidification batches)
│   ├── storyline/                  (21 narrative docs)
│   ├── voice_signatures/           Voice signature data
│   └── zones/                      (20+ zone design docs)
├── beta/                          (433 files — the playable beta)
│   ├── assets/
│   │   ├── audio/                  (368 audio files — 6 categories)
│   │   ├── art/                    (character, UI, zone art)
│   │   ├── cutscenes/              Cutscene data
│   │   ├── loading/                Loading screens
│   │   ├── music/                   Music tracks
│   │   └── sfx/                    Sound effects
│   ├── data/                       (JSON data files, dialogue, recipes)
│   ├── scripts/                    (33 Godot scripts + generators)
│   └── scenes/                     Scene files
├── godot_project/                 (38 files — Godot project)
│   ├── scenes/                     (33 scene scripts)
│   ├── scripts/                    Voice profiles, lighting
│   └── mohs_vibration/             Stone vibration system
├── godot/                         (4 files — original Godot scripts)
├── STEAM_BETA_CHECKLIST.md        (139 lines)
└── GEODE_INN_MASTER_MANIFEST.md   THIS DOCUMENT
```

---

*This is the manifest for the manifest. Every system points to its own detailed documentation. The game writer starts here and follows the breadcrumbs to whatever they're building.*
