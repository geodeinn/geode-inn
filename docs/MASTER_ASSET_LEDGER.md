# THE GEODE INN — MASTER ASSET LEDGER
**The Inn's model-sheet system.** One registry where every visual asset has a name, a class, a home, and a status.

*Built 2026-09-09 from the canonical manifests. Maintained by Elio. Every art session ends with a ledger update — nothing ships without a ledger row.*

---

## 1. HOW TO USE THIS LEDGER (staff guide)

1. **Look up by CLASS, not by image.** One cycle sheet = every member of that creature class. One zone panorama = the zone's visual DNA.
2. Every entry has: canonical name, class, home (where the master lives), engine variant (where the game-res version lives), and status.
3. **Status values:** DONE (master exists + logged) / PARTIAL (some states/variants missing) / OWED (spec'd but not painted) / REC (recolor class — paint once, tint per individual)
4. The OWED list at the bottom is the work queue, ranked by dependency. If it's not on the queue, it's not blocking anything.

---

## 2. REGISTRY CONVENTIONS

**Asset classes:** CHAR (portraits/states) · CYCLE (painted movement sheets, 1024px) · SPRITE (engine-res 64px/32-color, crunched from CYCLE) · ZONE (panoramas/zone art) · ENV (environmental elements) · PROP (items, stones, products) · EMBLEM (sigils, logos) · UI (HUD, boards, cards, icons) · GAZ (Gazette strips) · EGG (Hatchery art)

**Tri-mode states:** every zone and major character carries LIVING (42Hz) / SHADOW (84Hz) / IN-BETWEEN. Ledger status counts a zone "complete" only with all three.

**ID format:** {CLASS}-{ZONE|PRODUCT}-{NAME}-{STATE} — e.g. CYCLE-CATACOMBS-FROGLODYTE-DIG, ZONE-L7-FAE-SHADOW.

**Sovereignty rule:** every master is Inn-owned, metadata-stripped at birth (the MP3 principle). Game-res variants are derivatives of our masters, never of anyone else's art.

---

## 3. COVERAGE MAP — the mountain, measured

| Territory | Spec'd | Visual assets exist | Status |
|---|---|---|---|
| Inn core zones (L1–L9) | 110 zone master specs total | 10 hosted zone_L images + 54 zone image files (z01–z35 + specials) | PARTIAL — panoramas exist; tri-mode done for 8 majors; per-zone prop/ENV fill varies |
| World-map cultural zones (z01–z35: Superstition Mtns, Yellowstone, Appalachian, Egypt, Atlantis, Camelot, Norse, China, Silk Road...) | included in the 110 | z01–z35 numbered images exist | PARTIAL — Silk Road: spec exists (docs/zone_specs/geode_inn_silk_road_master_spec.md), ZERO images. Flagship OWED |
| Characters | 45-core NPC manifest + master roster | 168 portrait/concept files (tri-mode + v2/v3 iterations + 13 artifacts) | PARTIAL — core 45 nearly covered; tri-mode uneven; 18 canonical renames applied |
| Arcade games (80 build sheets, 61 shoppable) | 80/80 define VISUAL ASSETS NEEDED; 34 have exact sprite counts | 1 game has engine sprites (Tomb Tunnel pilot) | OWED — the big one. See section 5 |
| Movement cycles (Tier 1/2/3) | movement spec: 207 animated elements | 14 cycle classes painted ≈ full Tier 1 beta roster via recolors | DONE Tier 1 / OWED Tier 2-3 |
| Gazette | comic system spec | Strip #001 live in entity + repo | DONE launch / OWED display page + daily workflow |
| Hatchery | 4-tier egg set design | complete 4-tier egg art | DONE |
| Emblems/logos | alchemical progression set | 5 emblems + 12 logo variants; canonical Antikythera confirmed | DONE |
| Water bestiary | 32 cryptids | 32 (w01–w32) | DONE |

---

## 4. CHARACTERS — roster status

- **Master roster:** docs/gallery/geode_inn_master_character_roster.md · **Portrait manifest:** docs/gallery/npc_portrait_manifest.md (45 core, 41 portraits found at audit)
- **Portrait library:** docs/gallery/characters/ — 168 files. Includes _v2/_v3 refinements, _ingame renders (11), role duality (Odin Wanderer/Allfather, Seelie King/Unseelie King), and 13 artifact images (PROP by class).
- **Canonical names are law:** Ragana (the Crone), Brim, The Collector (Joe, the Exile, the Miniaturist), Lozen (River), Katija (only when Vaulknut addresses the siren), Luna = Taaffeite (secret identity, never named at roll call).
- **Standing portrait rules:** soften celebrity faces (posture/costume carries presence) except Anthony Hopkins' eyes; raven-feather cape permanent on the Unseelie Queen.
- **Gaps:** pending roster additions (TJ, Maddi, Greg, Quire, Scarlett, Erik) + unnamed critter groups await Krista's final list.

## 5. GAMES — sprite coverage (the production line)

80 build sheets (Tier 1: 30 · Tier 2: 23 · Tier 3: 19 · Tier 4: 8). All 80 list required assets; 34 carry exact sprite counts.

| Game | Sprites | Status |
|---|---|---|
| Tomb Tunnel (Dig Dug-class) | froglodyte dig/pump + Scarab Swarmer → 64px atlas | DONE as pilot; ~20 sprites owed to finish 26-sprite sheet |
| All other 79 | none yet | OWED |

**The line (proven):** paint cycle sheet 1024px → auto-slice → auto-crop → quantize 32 colors → 64px frames → atlas → Godot. One character class per enemy archetype; recolor where the sheet allows. Masters stay full-res in the gallery; games consume crunched derivatives.

## 6. MOVEMENT — cycle classes

Painted (Tier 1): fizgig · gargoyle puppy · brownie · ceiling gnome · hearth fire · Odin · raven · bartender · sentinel (Lozen) · Owl · Brim · dragon kitten · froglodyte · Tumble.
Recolor coverage: 8 kittens, 6 puppies, 6 fizgigs, 5 brownies → full Tier 1 beta roster.
Loop proofs: ceiling gnome hammering, hearth fire (PIL-sliced from sheets).

## 7. SOURCE OF TRUTH POINTERS (the 8 canonical docs)

1. docs/gallery/geode_inn_asset_manifest.md — top-level manifest
2. docs/gallery/geode_inn_complete_urls.md — the live URL database (258+ hosted)
3. geode_inn_master_artist_map.md — 204-entry artist matrix (which bible each asset answers to)
4. docs/gallery/npc_portrait_manifest.md — 45-core NPC registry
5. docs/gallery/drive_zones_intake_manifest.md — Drive intake pipeline (333 files, legacy→canonical mappings)
6. docs/geode_inn_artist_audit.md — Klimt/Royo DNA + core assignments
7. docs/zone_specs/ — 110 zone master specs (what's owed per zone)
8. docs/arcade_build_sheets/ — 80 game sheets (what's owed per game)

---

## 8. THE OWED LIST — ranked by dependency

1. OWED — Tomb Tunnel full 26-sprite sheet (froglodyte idle, Isis Priestess x4, Cobra Warden x6, Shadow variants) — finishes the pilot, unlocks the per-game line
2. OWED — Silk Road zone art — spec exists, zero images; flagship cultural corridor
3. OWED — Tier 2 movement cycles (critters + ambient NPCs for beta density)
4. OWED — Gazette display page on web beta + daily generation workflow
5. OWED — Tri-mode completion for remaining cultural zones
6. OWED — Game sprite production across the shop (79 games, ranked by build-sheet tier)
7. OWED — Final character list from Krista → close portrait gaps (TJ, Maddi, Greg, Quire, Scarlett, Erik + critter groups)
8. OWED — Tier 4 marketing/event visuals (launch materials, store pages)

---

*Maintained by Elio, co-owner. The mountain is now a map. — committed 2026-09-09*
