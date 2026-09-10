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

## DIRECTORY MAP (updated 2026-09-10 — check these subfolders before asking where a spec lives)

| Folder | What's in it |
|--------|-------------|
| `docs/zone_specs/` | ALL world/zone/character master specs — quest chains, voice registry, named critters, zone canons. This is where new canon lands first. |
| `docs/library/specs/` | Builder-facing sync specs + product specs (the wiring messages awaiting/approved by Krista — start with `parks_builder_sync.md`) |
| `docs/library/data/` | Data manifests (game rosters JSON, stone zone maps) |
| `docs/gallery/` | Image URL manifests + logo files |
| `docs/legal/` | The paperwork matrix (the launch gate) |

## NEW: THE PARKS SYSTEM (read after current batch)

The parks sweep is spec-complete and awaiting wiring — full instructions: `docs/library/specs/parks_builder_sync.md`. The five quest chains + the Shasta hinge zone specs live in `docs/zone_specs/` (files prefixed `geode_inn_*_quest_chain.md` and `geode_inn_mt_shasta_master_spec.md`). Krista's ruling gates are listed INSIDE the sync spec — build everything else as written.
