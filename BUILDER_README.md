# GEODE INN — BUILDER INSTRUCTIONS

The fizgigs read this file first. All specs are in the `docs/` folder.

## CURRENT PRIORITY (Batch 7)

1. **Market sync** — Wire 34 real products into the Market page.
   - Read: `docs/market_sync_manifest.json`
   - Instructions: `docs/builder_instruction_batch7.md` (Section 1)
   - Match by name, update priceRange, realName, realDescription, realImage, externalUrl, rarity, etc.

2. **Arcade expansion** — Expand from 4 games to 52.
   - Read: `docs/geode_inn_complete_game_roster.md`
   - Visual thumbnails: `docs/geode_inn_game_visual_reference.md`
   - Instructions: `docs/builder_instruction_batch7.md` (Section 2)
   - Build cards for all 52 games organized by category, same dark stone + gold style.

3. **Ceiling Gnome** — Already live on most pages. Ensure on ALL pages.
   - Read: `docs/geode_inn_ceiling_gnome_spec.md`

4. **Unified controls** — Reference for game input mapping (all 52 games).
   - Read: `docs/geode_inn_unified_control_spec.md`

## FILE MAP

| File | What's in it |
|------|-------------|
| `docs/builder_instruction_batch7.md` | Master instruction (start here) |
| `docs/market_sync_manifest.json` | 34 products with prices, images, descriptions, URLs |
| `docs/geode_inn_complete_game_roster.md` | 52 games with templates, zones, reward stones |
| `docs/geode_inn_game_visual_reference.md` | Thumbnail descriptions + artist assignments per game |
| `docs/geode_inn_ceiling_gnome_spec.md` | Gnome UI element spec |
| `docs/geode_inn_unified_control_spec.md` | Switch 2 + keyboard/mouse control mapping for all games |
| `docs/geode_inn_knowledge_base.md` | Full project knowledge base (35KB) |

## THE REPO MAP (reorganized 2026-09-10 — the root is now CLEAN)

The root level held 172 loose spec files; everything is now sorted. Root contains ONLY: this README, README.md, and GEODE_INN_MASTER_MANIFEST.md.

**SEARCH PROTOCOL: open `docs/INDEX.md` FIRST.** It is the complete card catalog — every .md file in the repo with its path and a one-line description, grouped by folder. Ctrl-F the name or topic, then open the path. Do not search the raw tree.

| Folder | What's in it |
|--------|-------------|
| `docs/INDEX.md` | THE MASTER INDEX — search this first, always |
| `docs/zone_specs/` | All world/zone master specs — quest chains, the voice registry, named critters, zone canons. Where new canon lands first |
| `docs/library/specs/` | Builder-facing sync specs (start with `parks_builder_sync.md`, then `silk_road_builder_sync.md`) |
| `docs/zones/` | Zone builds, level completions, quest chains, origin storylines |
| `docs/characters/` | NPC profiles, character classes, rosters, the named critters |
| `docs/games/` | Game specs, arcade rosters, tabletop, card game, engine blueprints |
| `docs/systems/` | Movement, audio, linework, production references, launch checklists |
| `docs/art/` | Art portfolios, animation prompts, visual catalogs, image maps |
| `docs/data/` | Data manifests and catalogs |
| `docs/gallery/` | Image URL manifests + logo files (incl. `silk_road/` assets) |
| `docs/legal/` | The paperwork matrix (the launch gate) |
| `docs/arcade_build_sheets/` | The 80 game build sheets |
| `docs/GEODE_INN_PROJECT_BIBLE.md` + `docs/MASTER_ASSET_LEDGER.md` | The big two references |
| `docs/archive/` | Solidification batches and superseded docs (history, not current work) |

## CURRENT BUILD ORDERS

1. **The parks system** — full instructions: `docs/library/specs/parks_builder_sync.md` (five quest chains + the Shasta hinge zone + Batch 7 voices). Krista's ruling gates are ALL CLEARED — everything builds as written.
2. **The Silk Road** — full instructions: `docs/library/specs/silk_road_builder_sync.md` (hub tri-mode, five routes, platforms, the Ley Line Vision overlay, the Shasta 84Hz hinge wire). Nothing canon-gated.
