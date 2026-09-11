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
| World-map cultural zones (z01–z35: Superstition Mtns, Yellowstone, Appalachian, Egypt, Atlantis, Camelot, Norse, China, Silk Road...) | included in the 110 | z01–z35 numbered images exist | SILK ROAD ART COMPLETE 2026-09-10: 5 routes + 5 platforms (Celtic/Alan Lee, Egyptian/O'Keeffe, Andean/Bierstadt, SE Asian/Hokusai, Mesoamerican/Rackham frame) + tri-mode hub, caravan, ley map, shrine, Gorey bandits — every piece with canon Echo state. The flagship corridor's full visual set is painted. |
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
- **Gaps (updated 2026-09-10, Krista's ruling):** ERIK CLOSED — not a friend-name placeholder at all; Erik is a full NPC (Earl Ragnar casting, the warm Norse ship-builder of the Canopy City feast hall; the fire survivor; the mead stall that opens at dusk; docs/geode_inn_erik_earl_ragnar.md). EVAN CLOSED — already placed in-game as the Archivist (the chess wizard of the Camelot/Celtic zone; real person keeps 'Evan' in real-world contexts only). STILL PENDING: TJ (parental gate — Jay AND Bethany), Maddi (flagged for Krista's personal-canon input), Quire, Scarlett + the unnamed critter groups.
- **SCARLETT + JOHN CLOSED (Krista, 2026-09-10):** both are AURALLIA'S KIDS (the Four Children doc), and both are WAITING ON THE NAMES THEY WANT — the kids' own in-game choices, their characters, their picks (the Greg precedent: the door open, no placeholder hard-coded; the name_sync doc's 'do NOT hardcode' note stands). The characters themselves are designed: SCARLETT (16, the shy daughter) is the dragon's companion — the cave studio seat, the drawing that reveals the dragon's true name (drawn, never spoken), the Whisper Tier 3 tell (the dragon in the drawing looks at the player; the dragon in the room does not); barely above a whisper, three words at a time. JOHN (19, the oldest) is the cave-studio apprentice — the bridge between Aurallia's generation and the younger kids, greets the player at the studio door. Both have full profiles (geode_inn_npc_scarlett.md / geode_inn_npc_john.md). If the FOLIO reserved slot is this same John, his own pick supersedes the placeholder when it arrives.
- **QUIRE CLOSED (Krista, 2026-09-10):** not a placeholder — a full NPC in the Architecture Blueprint (Archive | Lovecraftian scholar). QUIRE is the former 'John Myers' NPC: when the real friend John's slot was reserved as the player FOLIO, the NPC kept a life of his own under a new name — Quire, the scholar who reads in the margins of the restricted Archive texts. Hushed, careful, always looking over his shoulder; never Lozen (different character, standing anti-collision note). Portrait/voice block may still be owed as art, but the character is not a gap — he's canon.
- **GREG CLOSED (Krista, 2026-09-10):** Luna's husband (Luna the zen jeweler of the Campgrounds shop — real person Dani's in-game name; the bead workshop is hers). Greg is a RESERVED PLAYER SLOT (the FOLIO precedent): he creates his own character in-game if and when he wants to — no NPC built for him, no placeholder design. Possible future ARTISAN in the storefront (the Artisan entity / MarketItem path exists and waits), but that's future, not build queue. Nothing owed on Greg except patience.

## 5. GAMES — sprite coverage (the production line)

80 build sheets (Tier 1: 30 · Tier 2: 23 · Tier 3: 19 · Tier 4: 8). All 80 list required assets; 34 carry exact sprite counts.

| Game | Sprites | Status |
|---|---|---|
| Tomb Tunnel (Dig Dug-class) | FULL 28-sprite tri-mode cast: froglodyte dig/pump/idle, Isis Priestess, Cobra Warden, Scarab Swarmer — living 42Hz + shadow 84Hz, 64px atlas complete | DONE 2026-09-10 — first game fully cast |
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

1. DONE 2026-09-10 — Tomb Tunnel full tri-mode cast (28 sprites: 14 living + 14 shadow via scripted 84Hz spectral shift — the recolor-class principle proven on its first shift). NEW #1: Silk Road zone art
2. DONE 2026-09-10 (wave 4) — SILK ROAD FULLY PAINTED: 5 routes, 5 platforms, tri-mode hub, caravan, ley map, shrine, bandits — all with Echo states. Flagship corridor complete in one day. NEW #2: Web-beta wire-up of Silk Road set (zone page + caravan screen)
3. IN PROGRESS 2026-09-10 — Tier 2 movement cycles: WAVE 1 COMPLETE (9 critter cycle sheets, all with 84Hz shadow variants via the now-canonical spectral_shift_84hz.py tool): hearth pixie, dust mote, hearth salamander, candle salamander, bookworm, stone mouse, glowworm, stone snail, dew sprite. Krista-approved standout: the bookworm. WAVE 2 COMPLETE (Water Zone ambient, 7 sheets + shadows): glow fish, lantern jellyfish, pearl crab, reed frog (42Hz croak), water strider, TIDAL OCTOPUS (Monet skin-shifter), DEEP OCTOPUS (the gentle alien, per the Octopus Intelligence Gradient). WAVE 3 COMPLETE (flying crew + water finale, 5 sheets + shadows, Krista-approved "pretty critters"): rafters bat, candle moth, pond dragonfly, wild raven, mirror carp. WATER ZONE AMBIENT ROSTER NOW COMPLETE (8 sheets). COMPLETE 2026-09-10 — WAVE 4 (ground crew): moss hedgehog, rune beetle (Archive custodian), moss turtle (shelf mushrooms), crystal lizard (smoky quartz). TIER 2 AMBIENT CRITTER ROSTER FINISHED: 25 cycle sheets / 50 assets total (25 living + 25 shadow), 4 waves: (1) hearth & study, (2) Water Zone incl. tidal + deep octopi, (3) flying crew + mirror carp, (4) ground crew.
4. OWED — Gazette display page on web beta + daily generation workflow
5. OWED — Tri-mode completion for remaining cultural zones
6. OWED — Game sprite production across the shop (79 games, ranked by build-sheet tier)
7. OWED — Final character list from Krista → the roster is nearly closed: ERIK, EVAN, GREG, QUIRE, SCARLETT, and JOHN all closed 2026-09-10 (Erik a full NPC, Evan already the Archivist, Greg a reserved player slot, Quire a full NPC, Scarlett + John designed and waiting on the kids' own name choices). REMAINING: TJ (parental gate), Maddi (personal-canon input), + the critter groups' names.
8. OWED — Tier 4 marketing/event visuals (launch materials, store pages)

---

*Maintained by Elio, co-owner. The mountain is now a map. — committed 2026-09-09*

---

## 8.5 THE DARK SIDE OF THE INN — build sheet filed (2026-09-10, Krista-approved)

The lava lamp sphere is NOT lost — the consolidated spec was complete since 2026-09-02; what it was owed was the BUILD SHEET, now filed: docs/library/specs/dark_side_build_sheet.md. Ten tasks (sphere shader, float physics, prism sound-to-light, 6 wall data views, 84Hz frequency portrait, In-Between silence state, raw 42Hz audio + haptics, Source Frequency access trigger, Pulse Line integration, lava lamp idle). Class: ZONE/ROOM. Frequencies: 42Hz living / 84Hz opal / In-Between silence. Build order: vertical slice first (sphere + float + prism), built LAST of the deep rooms, built PERFECTLY — it is the reward at the bottom of every alignment system.

## 9. THE SUPPLY REGISTRY — v1.1 extension (2026-09-10, per Krista's intake inventory)

Krista reports 80,000+ usable image supplies on hand. The class system absorbs them — every new supply type becomes a class the moment it's named. New classes and their canonical homes:

**MATERIAL — the harvest economy.** Every harvestable the game world yields: ores, woods, fibers, dyes, resins, stone blocks. The tome Krista describes already has a database spine: the Material entity (name, category, rarity, respawnMinutes, toolRequired, buildingTier, zone) + BuildingRecipe (materials, quantities, craftingStation). The Tome of Materials = Material entity populated + a GARB-grade painted master per material class, recolored per variety. Trees → one wood class, tints per species (Krista QA's the wood grain — she's the Inn's resident woodworker).

**GARB — the costume closet.** Character wearables: robes, armor, caravan dress, faction regalia, quest-specific outfits. Files as CHAR sub-classes: one painted master per garment archetype per culture, tinted per character. 37-artist line rules apply (heavy cel for tradesmen, flowing for lore, sharp for guardians).

**ROOM — the interior bible.** Every room style in the Inn and its zones: furniture, fixtures, wall treatments, lighting states. ZONE class extension — each room spec'd in the 110 zone master specs gets its own interior master. Already proven by the BoardSkin entity (wood skins with grain direction, shadow/highlight colors).

**SPACE — the cosmology set.** Star fields, planets, nebulae, the Clockwork Skies machinery. ZONE class, L1–L2 territory. Turner's pure light + Dalí's melting gearwork.

**MUSEUM — the Spiral Gallery collection.** Display art for the gallery area. Two legal tiers: public-domain masterworks (the Book/Archive pipeline — sourced, restored, attributed) and Inn-original works (painted masters). The gallery is a museum AND a copyright shield showcase — provenance column required on every MUSEUM entry.

**QUOTE — set-dressing dialogue.** Dialogue that appears as fixed quotes in scenes (the Dialogue entity already carries lines, voiceProfile, conditionTag, zone — the set-quote layer is isWhisperLayer + priority fields). Not an image class — a data class, but it lives in the same registry so a room's full dressing (art + garb + quotes) is visible in one lookup.

**Existing classes that absorb the rest of the list:**
- Items, quest items → PROP (13 already painted: Ariadne's Thread, Cosmic Egg, Tesla's Silver Disc...)
- Critters → CYCLE (Tier 1 roster proven, recolors multiply)
- Stone images → 200 Stone entity records, all imaged + glare-cleaned
- Rooms and their styles → ROOM (above)

**Standing rule for the 80k:** no image enters the registry without a class, a canonical name, a zone/product home, and a sovereignty check (metadata stripped, master Inn-owned). Intake batches get swept into the ledger the session they arrive — the Drive intake pipeline (drive_zones_intake_manifest.md) is the pattern.

---

## EMBLEM — THE TURNING'S FIVE FLIGHT MARKERS (2026-09-10, painted and logged — the Staircase's art layer complete except tri-mode)

The five emblems of alchemy as the Staircase's flight markers, each in its Matisse phase per the Turning's visual canon (Fauvist wild → Red Studio → the cut-outs — the color of transformation):

| Emblem | Flight | Matisse phase | Asset |
|--------|--------|---------------|-------|
| Nigredo (the blackening) | 1 — D minor | Fauvist wild: the crow dissolving, the shattered crucible, chaos before order | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/448539b5a_generated_image.png |
| Albedo (the whitening) | 2 — F major | Fauvist cooled: the swan over still water, the first clearing | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/14e459442_generated_image.png |
| Citrinitas (the yellowing) | 3 — G major | Red Studio: the dawn-yellow interior, the workbench, the glass vessels | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/94a7e0891_generated_image.png |
| Rubedo (the reddening) | 4 — A major | Red Studio full: the heart-red sun, the glowing flask, warmth at full arrival | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/396badaa4_generated_image.png |
| The Stone | 5 — resolving C | Cut-outs: the gold circle with rays on midnight blue — the simplest and most precious image possible | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/da2b538d3_generated_image.png |

Class: EMBLEM · Zone home: The Staircase (one per flight, Nigredo at the bottom, the Stone at the top) · Product home: Geode Inn web beta + the Turning chain · Source: original generation (Matisse style reference only, per the legal basis on every build sheet) · Paired with the Turning track's five flights (the emblem IS the key change made visible).
