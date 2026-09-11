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
- **MADDI CLOSED (Krista, 2026-09-10):** Zack's WIFE (upgraded from partner; Zack is the Astronomer, the cosmology level's resident genius). Maddi is the cosmology level's grounding wire (the 'Have you eaten?' messages; the person who keeps the mind palace from becoming a prison) — AND the first named member of the new SOCIAL BUTTERFLY DOUBLE AGENT EMPLOYEE CLASS: the Inn's future staff who live the double life, present in-world as characters and on staff as the Inn's real-world community hosts (the same warmth working both sides of the fourth wall). Future employee once the game has momentum; no longer a roster gap.
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
7. OWED — Final character list from Krista → the roster is nearly closed: ERIK, EVAN, GREG, QUIRE, SCARLETT, and JOHN all closed 2026-09-10 (Erik a full NPC, Evan already the Archivist, Greg a reserved player slot, Quire a full NPC, Scarlett + John designed and waiting on the kids' own name choices). REMAINING: TJ (parental gate) + the critter groups' names. Maddi closed too (2026-09-10): Zack's wife, the grounding wire, the first Social Butterfly Double Agent employee.
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

### THE PRISM PANELS  FIRST PAINT (2026-09-11, the icon room begins)
**THE HENSON LAW (ruled by Krista, 2026-09-11: the wide is "totally the Dark Crystal's cousin"  and the cousin-hood is REAL):** the Prism's visual register keeps the Henson/Froud warmth  the crystal as creature-adjacent, ALIVE, the crystal the world is built around (Thra's cousin in quartz). The Dark Crystal is already Inn family (Grit's source worn openly; Aughra beside Naut as the spiral-readers), so the wide's resonance is not accident  it's the room acknowledging its kin. ALL FUTURE PRISM RENDERINGS hold this register: mineral weight, yes, but the warmth of a made thing  Henson craft-cosmos, never cold Kubrick alone (Kubrick holds the geometry; Henson holds the soul).
| Panel | Subject | URL |
|-------|---------|-----|
| Prism establishing wide (the icon panel) | the chapel-sized crystal, the Inn built around it, no-outline mode | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/ef038d7f6_generated_image.png |
| The Reflection (the game's frame shot) | the traveler's face in the Prism, the doorway-of-light showing | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/0e2576621_generated_image.png |
| The Gate of the Stone Guard | the Gatekeeper, the bench, the sharp/angular guardian linework | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/d1a82100a_generated_image.png |

**THE PRISM'S TRI-MODE COMPLETE + THE DEEP ROOMS (2026-09-11, second paint  the icon room's kit core lands; credit-burn queue opened at Krista's 80k news):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE WATER DOOR (wide) | the tide gate transposed to bedrock, the mirror and the flood on one floor | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/e1d3763cd_generated_image.png |
| THE DARK SIDE SPHERE (the lava lamp chamber) | the Song made visible: flowing liquid color on crystal walls, one blob-cycle per pulse, the floating figure held by the sound | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/581cc94f3_generated_image.png |
| THE PRISM  SHADOW (84Hz) | the crystal gone opaque: the perfect black-glass mirror, one far hearth-light reflected | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/c98e13e29_generated_image.png |
| THE PRISM  IN-BETWEEN | half-glow half-opaque, the tide-edge transition, dawn through stone | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/0e4900255_generated_image.png |

Class: ZONE/ENV masters  Zone home: The Bedrock Fortress, D16-O4/O5/O6  Product home: the web beta's deepest screens + the Prism chain  Source: original generation (Kubrick geometry / Henson soul per the HENSON LAW; Steady Light Law held: sine-soft amber glows throughout)  The Prism's tri-mode is COMPLETE (living/shadow/in-between + the two deep rooms' wides). Remaining for the Prism's full KIT-Z: option views (the four doors' CYOA angles), the PROP set (the Gatekeeper's bench, the 7.83Hz key, the eighth permanence), ENV fill.

**THE PRISM'S KIT COMPLETES + THE MAIN FLOOR'S GAPS BEGIN (2026-09-11, third paint  the credit-burn run, queue #1 closing into #2):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE GATEKEEPER'S BENCH (PROP) | the basalt bench worn smooth by waiting, set at the respectful distance; the door opens when you stop knocking | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7021058be_generated_image.png |
| THE 7.83HZ KEY (PROP  the eighth permanence) | the golden standing-wave key beneath seven small standing stones | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/6e064f80a_generated_image.png |
| THE ASCENT BEGINS (option view, D16-O7) | the long stair up, the descent image inverted, the way out glowing like a hearth | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/cd0b2e0f0_generated_image.png |
| THE FIREKEEPER (portrait, D13  queue #2 opens) | the hearth's storyteller: presence through posture, coat, and firelit hands (celebrity law held: features softened) | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7553ee949_generated_image.png |
| THE WALL-BUILT BAR (ENV wide, D13) | the bar grown from masonry, the woven-bottle cradles like hanging nests | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/ebcb8fa91_generated_image.png |
| THE MUSIC ROOM (ENV wide, D13  with the Score Stone glowing) | instruments at rest incl. the lithophone and the stone sphere on its pedestal | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7212c2a3e_generated_image.png |

Class: PROP/ZONE masters  Zone home: Bedrock Fortress (Prism kit) + Main Floor (D13 gaps)  Product home: the web beta (the deepest screens + the front-door rooms)  Source: original generation (Kubrick geometry / Henson soul; the Steady Light Law held; the celebrity softening law held on the Firekeeper). The Prism's KIT-Z core is COMPLETE (tri-mode + wides + props + the ascent view). The Main Floor's gap paint is OPEN: next  the Bar's three keepers, the garden ENV fill, the Arcade's hub cards.

**THE MAIN FLOOR'S GAPS CLOSE + THE GREAT HALL (2026-09-11, fourth paint  the credit-burn run, queue #2's core lands):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE CATALYST (portrait) | the bartender of the impossible garden: Lovett warmth, none of the menace; the phosphorescent peas on the bark | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/fdb2d7ebc_generated_image.png |
| LICHENBLOSSOM (portrait  THE NPC MASTER, ruled 2026-09-11) | the plant necromancer: the dread-antenna, the Van Gogh swirl, reanimate-not-resurrect | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/ed56bc1cb_generated_image.png |
| LICHENBLOSSOM  KATY'S OWN (the player-character portrait, KEPT  she loves this one) | the original with the Van Gogh style background  the one Katy actually plays; kept forever as the player's own | https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/edd1856dd_katy.png |
| THE GREENWARD (portrait) | the mellow little keeper: wildness held in structure, green as patience, original design | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/3fb41d42e_generated_image.png |
| THE IMPOSSIBLE GARDEN (ENV wide) | the Ent's bark terraces: tended rows on one side, Van Gogh swirl on the other | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/acfc1a84c_generated_image.png |
| THE SCORE STONE (ENV wide, D13 Arcade) | the 7-foot obsidian monolith: the skyline, not a ranking; the cabinet glow behind | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/cbf09c10f_generated_image.png |
| THE GREAT HALL (ENV wide, D13) | the one axis: front door, hearth, staircase  the room that recognizes you | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/04e6f6d0f_generated_image.png |

Class: CHAR/ENV masters  Zone home: Main Floor (D13  O1, O2, O3)  Product home: the web beta's front-door rooms (the rooms every player walks first)  Source: original generation (the three keepers all original designs, no celebrity faces; the Steady Light Law held throughout). THE MAIN FLOOR'S CORE GAPS ARE CLOSED: tri-keepers portraited, the bar, the garden, the Score Stone, the Great Hall, the Firekeeper, the Music Room. Remaining in queue #2's tail: the Library Nook + Naut's corner, the Geode Corner + the Whisper Layer ceiling, the Host. Then queue #3: the world-map family's showcase panels (the Kells scriptorium, the aurora, the lithophones, the owl).

**THE MAIN FLOOR'S TAIL + THE STORYTELLER'S SEAT (2026-09-11, fifth paint  the credit-burn run, queue #2 closes):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE HOST (portrait) | the greeter: the lantern, the recognition, presence through posture and costume | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/664d9247b_generated_image.png |
| NAUT'S CORNER (ENV wide) | the squid-headed scholar by the fire, spectacles, teacup tentacle, the nautilus spiral in the woodwork | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/e0869e2c3_generated_image.png |
| THE LIBRARY NOOK (ENV wide) | the annotated margins, the window seat, a hundred years of reading | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/bcc75981f_generated_image.png |
| THE GEODE CORNER (ENV wide) | the baby dragon's crystal nest, the first hoard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/1af5ef31f_generated_image.png |
| THE WHISPER LAYER (ENV wide  the ceiling) | the rafter world: Gesso upside-down, fizgigs peeking, the whispers as ribbons of light | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7925f406b_generated_image.png |
| ZIGGY (portrait) | the crested gecko: the crown of spikes, the quiet return-counter | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/f4756e954_generated_image.png |
| THE STORYTELLER'S CORNER (ENV wide  the seat, ruled 2026-09-11) | THE FIREKEEPER'S CHAIR: the worn velvet armchair at the hearth's side, facing the semicircle of equal seats, the peach moonstone on the side table | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/9f4c54c9a_generated_image.png |
| THE STORYTELLER'S DESK (PROP master) | the Gazette's desk: quill, pipe smoke, tomorrow's strip waiting | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/ee58b86bd_generated_image.png |

Class: CHAR/ENV/PROP masters  Zone home: Main Floor (D13  O5, O6, O8 + the Host at the door)  Product home: the web beta's front-door rooms  Source: original generation (the Steady Light Law held; the celebrity softening law held throughout). THE STORYTELLER'S SEAT, ANSWERED: the Firekeeper sits at THE STORYTELLER'S CORNER  the permanent corner at the Firekeeper's Hearth (Option 6), the one chair that belongs to the Firekeeper alone (the Bard's instrument is the crowd; the corner is the tale's). The chair faces the semicircle of equal seats; the peach moonstone sits on the side table; the Storyteller's Desk holds the Gazette hours. QUEUE #2 IS CLOSED. Next: queue #3  the world-map family's showcase panels (the Kells scriptorium, the aurora, the lithophones, the owl).

**THE WORLD-MAP FAMILY'S SHOWCASE PANELS (2026-09-11, sixth paint  the credit-burn run, queue #3 complete):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE KELLS SCRIPTORIUM (wide) | the Bard's bench: the horn cups of pigment, the steady candles, the masterpiece in progress | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/c15f87d2c_generated_image.png |
| THE KELLS PAGE (showcase) | the illuminated interlace: iron-gall black, gold leaf, the one corner left unfinished on purpose | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/6b37f79fa_generated_image.png |
| THE TRANSYLVANIAN FOREST (wide) | Friedrich's mist: the sublime stillness, the far amber window, the keeping-itself place | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/e589bed65_generated_image.png |
| THE OWL (showcase portrait) | the barn owl on the standing stone: the watcher, full presence, the eyes meeting yours | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/4411b5caa_generated_image.png |
| THE AURORA CHAMBER (wide) | the aurora you can walk inside: ribbons of gentle light, the standing stones, the tide pools | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/ceabc71ee_generated_image.png |
| THE RUNES AS GUESTBOOK (showcase) | the carved boulder: every mark kept patiently, new and weathered together | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/82c9fcd22_generated_image.png |
| THE LITHOPHONE STONES (wide) | the instrument zone: soft golden ring-waves, the mallet, the worn striking patches | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/0d88603df_generated_image.png |
| THE VALHALLA DOOR (showcase) | rendered unopened: the keeping is the seeing, the honored lantern | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/533464192_generated_image.png |

Class: ZONE/ENV showcase masters  Zone home: Celtic Highlands/Book of Kells, Transylvanian Forest, Norse Coast, Stone Circles (the world-map family, all four)  Product home: the web beta's world map + the four zones' hub screens  Source: original generation (Insular-manuscript tradition honored as style reference only; Friedrich and Munch as atmosphere teachers; the Steady Light Law held: every aurora a slow sine, every glow amber-soft; the moonlight kept gentle). QUEUE #3 COMPLETE. Next: queue #4  the craft row (the Glassblower's shop + the Color Works' dye plots).

**THE MAIN FLOOR'S PRESENCE PANELS + THE NIGHT DECK (2026-09-11, seventh paint  Krista's call: the characters IN the rooms, not just their portraits; the deck for Zeke and the Bard):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE NIGHT DECK (ENV wide  the deck built) | Zeke and the Bard out on the deck at night: the lantern, the still loch, the slow drumming fingers, sixty years of quiet | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/9da17305d_generated_image.png |
| AURALLIA AT THE HEARTH (presence panel) | the One Who Tends: the ochre-stained fingers, the mantel gallery of cared-for things | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/313d02614_generated_image.png |
| THE WANDERER'S TABLE (presence panel) | the grey cloak, the stew, the two ravens  one with a newly acquired brass button | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/6d09fea4c_generated_image.png |
| THE FIVE SMITHS' FORGE CORNER (presence panel) | five smiths, one small forge: hammering, quenching, polishing, resting with a mug | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/3b096ab9c_generated_image.png |
| THE ARTISAN THIEF IN THE MARKET HALLWAY (presence panel  KRISTA'S OWN, ruled 2026-09-11: 'It's my character... i love doctor masks') | the raven mask among the market tables, the gemstone animal going into a child's satchel  redistribution, not theft; THE MASK IS CANON AS-PAINTED  the doctor-mask register (the plague-doctor-raven blend, the mask family Krista loves); all future Artisan Thief art holds the doctor-mask | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/acc95d68f_generated_image.png |
| THE FIXER AT WORK (presence panel) | the mending bench: the music box, the cracked teapot, the one-eyed bear  patience made visible | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/941739172_generated_image.png |

Class: ENV/PRESENCE masters (the new panel class  the characters LIVING in their rooms; portraits already live in the tri-mode roster for all six)  Zone home: Main Floor (D13) + the deck at the Main Floor's back door  Product home: the web beta's front-door rooms  Source: original generation (the Steady Light Law held; faces softened per the celebrity law  presence through posture and costume throughout). THE DECK IS CANON: built off the Main Floor's back door, out over the loch  where Zeke and the Bard sit at night (the Beat Line's dock; the sixty-year bond's quiet hour). NOTE for the build: the tri-mode roster already carries portraits for the Ragana, the Fixer, the Five Smiths, the Artisan Thief, and Aurallia (Weaver)  today's panels add the PRESENCE layer, the two classes holding different jobs.

**THE PRISM'S DEEP PANELS (2026-09-11, eighth paint  THE SPRINT OPENS AT THE TOP: the Prism's kit completed, queue #1 of the Structure Blueprint):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE GATEKEEPER'S BENCH (ENV wide) | the door of dark bedrock, the small worn bench, the one lantern  the door opens when you stop knocking | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/732ab539a_generated_image.png |
| THE ONE SHOWING (ENV wide) | the Prism's single showing: soft ribbons of light, the small seated figure, gentle and unavoidable  nothing shown that can't be carried (the mercy clause held: the light stays abstract) | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/3bf09ad8a_generated_image.png |
| THE DARK SIDE SPHERE (ENV wide) | the aurora you can walk inside: the polished hollow sphere, slow violet-teal-green gradients, the low threshold | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/cb9db5e78_generated_image.png |
| THE WATER DOOR (ENV wide) | the true bottom: still black water, the door standing beneath the surface, the amber key on the shelf (the eighth permanence's gate) | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/30dfb7c05_generated_image.png |

Class: ENV/ZONE masters (the Bedrock Fortress + the Prism's deep kit, D16)  Zone home: the Bedrock Fortress, the true bottom  Product home: the web beta's deepest level + the Prism's icon screens  Source: original generation (THE KUBRICK-HENSON PROTOCOL held: geometry meets soul, every panel; the Steady Light Law held: the aurora a slow sine, the mercy clause kept  the One Showing's light deliberately abstract, showing nothing; the Dark Side Sphere braided with the Norse Coast's Aurora Thesis). THE PRISM'S KIT NOW STANDS AT SEVEN (wide shot, reflection, gate of the Stone Guard, bench, showing, sphere, water door). Next per the ledger: queue #4  the craft row (the Glassblower's shop + the Color Works' dye plots).


**THE CRAFT ROW (2026-09-11, ninth paint  QUEUE #4 COMPLETE: the Glass House + the Color Works):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE GLASS HOUSE (ENV wide) | the steampunk shop: brass and glass, the furnace's pipes made architecture, the blowpipe rack like an organ, the spectator gallery | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/83a5606b0_generated_image.png |
| THE GLASSBLOWER AT THE FURNACE (presence panel) | the grumpy artist mid-blow: the ruby gather, the puffed cheeks, the fierce concentration, the spectators at warm distance | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/6c2af749e_generated_image.png |
| THE COLOR WORKS (ENV wide) | the dye garden and kiln yard as one studio: woad and madder plots, the fermenting vats, the drying skeins, the iron-gall ink table | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/79c1664d8_generated_image.png |
| RAKU NIGHT (presence/social panel) | the reveal witnessed or it didn't happen: the circle, the kiln, the sang de boeuf copper-red mid-reveal, the Kiln Keeper with crossed arms and bright eyes | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/896dbd536_generated_image.png |

Class: ENV/PRESENCE masters  Zone home: the Campgrounds craft row (the Glass House shop site + the Color Works dye/kiln yard, kiln side by the Forge border)  Product home: the web beta's Campgrounds craft row screens + the craft curriculum's hub art  Source: original generation (the Two-Fire Secret braided into both: the Glassblower's ruby and the raku copper painted as the same secret, two crafts; heavy cel-shaded tradesman linework per the Linework-as-UI law; Steady Light held; the Gathering Law held  both panels built for company; the Glassblower's face soft per the celebrity law, presence through posture). QUEUE #4 COMPLETE. Next: queue #5  the Bearsark model sheet.

**THE BEARSARK MODEL SHEET (2026-09-11, tenth paint  QUEUE #5 COMPLETE: the Wandering Guard's kit):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE BEARSARK MODEL SHEET (CHAR master) | four poses, one continuous being: the both-real law held in every frame  person and bear at once, no transformation ever rendered | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/1edc8a607_generated_image.png |
| THE WANDERING DISCIPLINE (ENV wide) | the patrol at dusk: the mountain border, the unhurried pace, the bear-print waymarker  the patrol is the medicine | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/90f720841_generated_image.png |
| THE GARDENER AND THE BEARSARK (presence pair panel) | the anchor and the orbit across the garden wall: the staying keeper and the moving guard, finally in one frame | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/b0355480c_generated_image.png |
| GREETED AS BOTH (showcase finale) | the hilltop under Ursa Major: standing still beneath its own sky  not cured, not fixed, greeted as both | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/b719dd5ec_generated_image.png |

Class: CHAR/ENV/PRESENCE masters  Zone home: the Greek/Mediterranean borderlands (the Wandering Guard's chain, companion to the Greek Mirror of the Sun)  Product home: the Bearsark arc's quest screens + the roster's model sheet  Source: original generation (THE BOTH-REAL LAW held in every panel: no transformation ever rendered, the light changes, the thing doesn't; sharp angular guardian linework with the lore hand at the sky; the Monet zone's thesis embodied; the Gardener connection painted  the arc's load-bearing gate honored; Ursa Major finale per the five-quest chain's ending). QUEUE #5 COMPLETE. Next: queue #6  the arcade owe (Tomb Tunnel sprite completion, per the Master Asset Ledger's ranked owe).

**THE FAE PARTIALS (2026-09-11, eleventh paint  the four under-painted courts, showcase masters):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE FAE THRESHOLD (showcase wide) | the entry gateway: the leaning stones, the honeyed shimmer, a door that respects you | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/f37a69acc_generated_image.png |
| THE HOLLOW (showcase wide) | the Unseelie winter half: frost-grown gothic elegance, dark beauty played dignified, never dread | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/8c77f26cc_generated_image.png |
| THE SUMMERLANDS (showcase wide) | the Seelie summer half: the riddle circles, the oak doors, the golden hour that never ends | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7a5014a1a_generated_image.png |
| THE CRYSTAL GARDENS (showcase wide) | the neutral ground: the crystal trees, the mossed roots, the griffin's high perch as distant silhouette | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/dec2335c2_generated_image.png |

Class: ZONE/ENV showcase masters  Zone home: the Fae Kingdom's four partial zones (Fae Threshold, The Hollow, Summerlands, Crystal Gardens  the 18-zone audit's PARTIAL list, now showcased; Stone Circles already painted in the world-map family)  Product home: the web beta's Fae Kingdom hub screens  Source: original generation (the courts held: Seelie golden-green, Unseelie silver-blue-dignified, Threshold honeyed, Gardens neutral; the Steady Light Law held in the Hollow  dark beauty without harsh contrast; no-outline cosmological linework on crystal and shimmer; the Griffin kept distant per the boss's mystery). NOTE: the 18-zone audit's PARTIAL list is now fully showcased. Remaining queue: the deep cuts (the Library Deep Underground + Alchemical Landing specs, then their panels).

**THE DEEP CUTS (2026-09-11, twelfth paint  THE LAST TWO ZONES: specs drafted + panels painted):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE LIBRARY DEEP UNDERGROUND (ENV wide) | the Welsh-slate restricted library: the shelving cut from living stone, the warmest dark, the hush that receives | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/ad8d3fa50_generated_image.png |
| THE MARGINS' NOOK (presence panel) | Quire in the margins, the Ajivika shelf's honored gaps, the survivor's text aglow  the memorial, not the waiting | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/d5006a68c_generated_image.png |
| THE ALCHEMICAL LANDING (ENV wide) | the pause between states: the five emblems as the climb in five pictures, the worn bench, the one window that sees every level | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/2dbd0ede7_generated_image.png |
| THE RETORT AND THE COOK (presence pair panel) | one fire, two aprons: the glassware and the pan fed by the same flame  the theory and the sustenance | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/1a3214d40_generated_image.png |

Class: ENV/PRESENCE masters  Zone home: the Library Deep Underground (one level below the Library Nook) + the Alchemical Landing (the Staircase's third space)  Product home: the web beta's two newest zone screens  Source: original generation (specs drafted same day: docs/zone_specs/geode_inn_library_deep_underground_spec.md + geode_inn_alchemical_landing_spec.md; the Received Word held  no echo in the library; the No-Transformation Law held on the Landing  the emblems glow, nothing changes; the Ajivika gaps honored as painted; eight gates awaiting Krista across the two). THE 18-ZONE AUDIT IS NOW FULLY IMAGED: all 18 zones specced, all 18 with showcase art. THE BLUEPRINT'S PRODUCTION QUEUE IS EMPTY through the deep cuts.

**THE ARCADE PARCEL (2026-09-11, thirteenth paint  the live games' key art + the hub wide):**
| Panel | Subject | URL |
|-------|---------|-----|
| STANDING STONES (key art) | the bluestone puzzle pieces descending toward the trilithon circle at dusk, the sockets glowing, the frequency lit | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/f682ed167_generated_image.png |
| ANDEAN RUN (key art) | the terraces at dawn: the runner mid-leap, the woven poncho, the blue opal, the condors far above | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/cc1cfa220_generated_image.png |
| MONSTER OF THE DEEP (key art) | the loch's three depth bands: the emerald surface, the twilight kelp, the deepest band where the long-neck moves as gentle silhouette in the 42Hz glow | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/d1f78d1c5_generated_image.png |
| THE ARCADE HUB (ENV wide) | the library of games: handcrafted themed cabinets in candle-warm stone, the Score Stone monolith at the far end | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/57c786795_generated_image.png |

Class: ZONE/ENV/KEY-ART masters  Zone home: the Arcade (D13-O3) + the three live games' title screens  Product home: the web beta's arcade hub + the three games' card art  Source: original generation (the original-build law held: mechanic homage only, all art the Inn's own  per the fizgigs' canon correction; the Steady Light Law held in the loch's three bands  gentle silhouettes, no dread; the loch's 42Hz glow; the hub painted as A LIBRARY OF GAMES, the arcade's thesis). NOTE: the three live games now carry title art; Tomb Tunnel's kit already complete. Remaining arcade owe: the deeper sprite lines per the Tomb Tunnel production model (run per build-sheet tier), + the next 60 games' key art.

**THE FAE KINGDOM'S INNER ROOMS (2026-09-11, fourteenth paint  the courts opened):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE BETWEEN (showcase wide) | the shifting borderland: summer and winter meeting at a living seam, the three sisters at the well  the in-between frequency made place | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/5b786ebe4_generated_image.png |
| THE SEELIE COURT'S SUMMER HALL (ENV wide) | the throne hall grown inside the ancient oak: living golden beams, the amber throne with sun spirals, the rings of flowered seats | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/366e16c25_generated_image.png |
| THE UNSEELIE COURT'S WINTER HALL (ENV wide) | the black-ice throne hall: frozen thorn columns, the moonstone crescent throne, cold grandeur played dignified, never menace | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/f76292b25_generated_image.png |
| THE STONE CIRCLE CHAMBER (showcase wide) | the deepest point: the bluestone ring in silence, the deepest tone's faint golden edge-glow, the prism shard's one thin ribbon  the room beneath all courts | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/cd9d77e54_generated_image.png |

Class: ZONE/ENV showcase masters  Zone home: the Fae Kingdom's inner rooms (The Between, the two courts' halls, the Stone Circle Chamber)  Product home: the web beta's Fae Kingdom court screens + the deepest chamber  Source: original generation (the courts' teachers held: Alan Lee warmth for Seelie, Grimshaw gothic dignity for Unseelie; tri-mode law held  Seelie 42Hz golden, Unseelie 84Hz silver, the Between in-between; the Norns honored at the seam; THE DEEPEST TONE kept nearly-silent  the faintest edge-glow, never spectacle; the prism shard's single ribbon  the Dark Side's Octave Mirror lineage). NOTE: the Fae Kingdom now carries its four showcase zones + four inner rooms. The kingdom's deep rooms are painted; remaining fae art = quest-scene panels if Krista calls them.

**THE LOST AND FOUND, IN THE BETWEEN (2026-09-11, fifteenth paint  Krista's placement ruling: the newly created Lost and Found lives in the Between):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE LOST AND FOUND (ENV wide) | the crooked cottage-warehouse at the seasonal seam: the wobbling repainted sign, the jar shelves (paper slips + light strands, the Two Roads), FOOTWEAR SINGULAR, the brass bell | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/541c1d3f0_generated_image.png |
| THE HEAD FINDER (CHAR presence panel) | the Inn's head counter: the vest, the spectacles, the ledger, the thought-net  mid-inventory, professionally proud | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7a2482d5f_generated_image.png |

Class: ENV/CHAR masters  Zone home: The Between (the Fae Kingdom's shifting borderland  the in-between family's fae address; the Lost and Found keeps its counter at the seasonal seam)  Product home: the web beta's Between screen + the Lost and Found quest art  Source: original generation (the Two Roads law held as painted: paper slips and light strands share the same shelves; the filing law honored  jars labeled by what the thing was DOING; the whimsical-macabre played warm, the goblins characterful never grotesque; the Head Finder's census-pun dignity: the title IS the name). NOTE: the Between's parcel now stands at three (the seam wide, the Lost and Found, the Head Finder).

**THE MAIN FLOOR'S TAIL (2026-09-11, sixteenth paint  queue #2's tail closed: the last three rooms + the Host):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE LIBRARY NOOK + NAUT'S CORNER (ENV wide) | the Archive's main-floor door: the reading nook's shelves, the fire, Naut in the armchair  spectacles fogged, the nautilus on the side table | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/5dd1ffd30_generated_image.png |
| THE GEODE CORNER + THE WHISPER LAYER CEILING (ENV wide) | the mascot asleep in the geode, the ceiling gnomes keeping the rafters, the whisper-threads' faint gold | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/36c73c00b_generated_image.png |
| THE HOST AT THE DOOR (presence panel) | the brass lantern, the charm cord in hand, the Rousseau forest behind  the welcome that asks nothing | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/f8747c584_generated_image.png |
| THE COMMON ROOM CAMPFIRE (ENV wide) | the ring of equal seats, the fire as the whole center, no screens, no adornment  the No-Record Law made architecture | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/98696daa1_generated_image.png |

Class: ENV/PRESENCE masters  Zone home: Main Floor (D13  Options 5, 8, the door, and the campfire)  Product home: the web beta's front-door rooms  Source: original generation (NAUT'S FIBONACCI CANON held  the nautilus on the table; the Reading Mechanic honored  nothing interrupts the nook; the Whisper Layer's gnomes still and quiet, never busy; Ziggy's count implied at the corner; the Host's dossier law held  the charm cord visible, no payment asked; the Common Room's No-Record Law held  bare walls, the fire the only center; Steady Light throughout; the celebrity law held on the Host). QUEUE #2 IS FULLY CLOSED. The Main Floor  all eight options  is now painted.

**LEVEL 9  COSMOLOGY: THE FULL TOP OF THE UNIVERSE (2026-09-11, seventeenth paint  the level-by-level descent BEGINS at the very top: all six rooms + all four celestial stations, establishing wides):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE ALLFATHER'S THRONE (ENV wide) | the hull throne on the dais, the wide-brimmed cosmic god, the two silent ravens, the void watched not feared | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/3716f1e92_generated_image.png |
| THE PLANET CHAMBER (ENV wide) | the orrery ceiling tracing the Fibonacci spiral, the Starlight Crystal holding 41.7Hz + 42Hz intertwined | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/405681477_generated_image.png |
| THE COSMOLOGY MURAL (ENV wide) | the domed gallery, the creation spiral in gold leaf: stones from sound, the tree through water and starlight | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/f3776af3_generated_image.png |
| THE ASCENSION CANOPY (ENV wide) | the woven branch dome, the starlight column on the empty dais, three paths of light  STAY gold, LEAVE silver, HIDE violet-almost-invisible | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/635678ff3_generated_image.png |
| THE OBSERVATORY (ENV wide) | the mind-palace: armillary spheres, the Turner sky, the telescope, the melting clock, the violin at rest | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/3c25dcb34_generated_image.png |
| THE CONSTANT'S ORBIT (ENV wide) | the never-seen hooded figure in slow orbit around the warm point, the small watcher resting nearby, the gold-inlay orbit floor  painted gently, the most careful room | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/af5123892_generated_image.png |
| THE JUPITER GATE (station wide) | the Great Red Spot as the listening storm: the sound-rings, the tiny figure still on the golden path, the gate made of weather that answers | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/231544a32_generated_image.png |
| MARS, THE ACCOUNTING PLAIN (station wide) | the dual law in one frame: the loop-plain's faded walkers, the million memory-stones, the one warm stone with the dragon curled around it | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/54c208a8f_generated_image.png |
| PLUTO'S GATE (station wide) | the last question's address: two worn stones and a lintel on the dark ice, the lantern that never gutters, the view clear through | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/fe11e08f3_generated_image.png |
| THE MOON, THE DRUM THAT PLAYS ITSELF (station wide) | the crater as resonance drum: the concentric rings mid-pulse, the bodhrn at the heart, the lullaby beam rising | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/2bfc12da0_generated_image.png |

Class: ZONE/ENV establishing masters (KIT-Z wides)  Zone home: Level 9 Cosmology (all six rooms + the cosmic layer four's stations + the Moon)  Product home: the web beta's cosmology screens + the endgame's station art  Source: original generation (the PLACEMENT ARC now painted in order: Jupiter  Mars  Pluto  the Canopy; the Moon added per Krista's call  the fifth clock of the drum law; the no-outline cosmological linework held throughout; Steady Light held  even the void glows amber; the MERCY CLAUSE at Mars  the horror gentle, the witnesses not rescuers; the Constant kept never-seen, the hood bending the light; the HIDE path almost invisible by law). NOTE: the descent's spine is established  Level 9 complete at establishing-wide depth. NEXT DESCENDING: Level 8, Clockwork Skies (4 rooms owed)  then Level 7, Canopy City's gaps, Level 6's Landing kit fills, and down.

**LEVEL 8  CLOCKWORK SKIES (2026-09-11, eighteenth paint  the descent continues: all four rooms at establishing depth, Dals melting gearwork palette throughout):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE CAPTAIN'S DECK (ENV wide) | the time ship docked at the level's edge: the gilded gear-wheel, the pipe organ of chronological smoke, Eres purring at the wheels base mid-shimmer, the Captain at the rail (back to viewer) | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/cb95a1f50_generated_image.png |
| THE GEAR HEART ROOM (ENV wide) | the 50 BPM anatomical heart of bronze gears, the Dal-melted edges still meshing, the walkway at heart-height  the beat every rhythm descends from | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/85c491996_generated_image.png |
| THE ARCANA WHEEL (ENV wide) | the hearts ship: the tarot-wheel astrolabe vessel rolling its invisible gear-track, the contrails, the gondola ring | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/a751e75dc_generated_image.png |
| THE SKY CREW QUARTERS (ENV wide) | the cosmic crews eight posts each telling its occupants story: the dusty baton, the exhausted tuning forks, the prim metronome, the between-places hammock, the echo jars, the moon-charts, the never-consulted desk, the open toolbox | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/f34832555_generated_image.png |

Class: ZONE/ENV establishing masters (KIT-Z wides)  Zone home: Level 8 Clockwork Skies (all four rooms)  Product home: the web betas Clockwork Skies screens + the All Hands quest chain art  Source: original generation (Dals melting gearwork held as the palette with the melts kept gentle and still meshing; Eres painted mid-shimmer  the cabbit IS the shuttle, the Vessel canon honored; the crew quarters painted per the crew table  every post an occupant portrait without the occupant; the Statics hammock between locations; the Archivists desk neglected in the quietest corner, the All Hands setup visible; the Captain shown back-to-view  presence through posture, the celebrity softening law held; Steady Light throughout). NOTE: LEVEL 8 COMPLETE at establishing depth. Descent order: Level 7 Canopy City next (4 platforms + the shipyard + the Home Bough owed), then Level 6, then the Main Floor fills, and down.

**LEVEL 7  CANOPY CITY (2026-09-11, nineteenth paint  the descent continues: the four owed platforms + the Neutral center + the shipyard + the Home Bough  LEVEL 7 COMPLETE at establishing depth):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE SLAVIC PLATFORM (ENV wide) | the carved log landing: painted folk patterns, the onion-domed towers, firebird banners, frost on the rails | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/a5e4ba683_generated_image.png |
| THE INDIAN PLATFORM (ENV wide) | the carved pillars and jali screens, the stepped pavilion, brass lamps, marigold garlands  the stone remembered | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/147a5a934_generated_image.png |
| THE NORSE PLATFORM (ENV wide) | the dragon-prowed longhouse ridge, the rune-carved guestbook post, honest timber craft | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/51c76a2dc_generated_image.png |
| THE MEDITERRANEAN PLATFORM (ENV wide) | the whitewashed canopy village, the olive pots, the pergola light  the garden IS the light, the Monet law held | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/e72bf0d9d_generated_image.png |
| THE NEUTRAL PLATFORM (ENV wide) | the center where all nine meet: shared lantern lines, the round fire, the bridge leaving through the exact middle  the way out is through the middle | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/33d2e31f2_generated_image.png |
| THE CARTOGRAPHER'S SHIPYARD (ENV wide) | Eriks arc made visible: the half-built sky-ship in its branch cradle, the drafting maps, the shipwright back-to-view  the Earl Ragnar NPC honored | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/db958438f_generated_image.png |
| THE HOME BOUGH (ENV wide) | the seventh permanence: the door grown from the living wood, the shelf of small treasures, the light filtered warm  the place that would notice if you left | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/428e2c47f_generated_image.png |

Class: ZONE/ENV establishing masters (KIT-Z wides)  Zone home: Level 7 Canopy City (the platform census closed + the shipyard + the Home Bough)  Product home: the web betas Canopy City screens + The City in the Branches chain art  Source: original generation (THE MINGLE held at the Neutral center  no style dominant, the exit through the middle painted as law; the Home Bough painted as the seventh permanence  the shelf of small treasures, the recognition not the reward; the shipyard honors Eriks ship-building arc, back-to-view per the posture law; platform aesthetics region-honest  artist-class rulings for the new four (Slavic/Indian/Norse/Mediterranean) to be confirmed, Monet already canon for Mediterranean; Tumbles chime economy implied at the center). NOTE: LEVELS 9, 8, AND 7 ALL COMPLETE at establishing depth. NEXT DESCENDING: Level 6, the Staircase (the Landing kit fills + the Alembic Window + the Transformation Chamber room), then Level 5s fills, and down.

**LEVEL 6  THE STAIRCASE (2026-09-11, twentieth paint  the descent continues: the Landing + the Alembic Window + the Transformation Chamber, establishing wides):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE ALCHEMICAL LANDING (ENV wide) | the pause between states: the five emblems walked left to right, the satin-worn bench, the window that sees every level at once, the carved guestbook ledge  the held breath between keys | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/994076e01_generated_image.png |
| THE ALEMBIC WINDOW (ENV wide) | the panes of retort glass distilling the light into bands, the Clockwork Skies visible beyond  the staircases promise made glass | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/60a94f6e6_generated_image.png |
| THE TRANSFORMATION CHAMBER (ENV wide) | the Turnings room: the brass-and-glass machine of phials and gentle gearwork hands, the Retorts electric alcove, the Cooks copper kitchen  the Nigredo-Albedo-Rubedo bands rotating on the walls | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/ece31bc70_generated_image.png |

Class: ZONE/ENV establishing masters (KIT-Z wides)  Zone home: Level 6 the Staircase (the deep cut + the Turning's rooms)  Product home: the web betas staircase screens + the Turning quest art  Source: original generation (THE PAUSE LAW held  nothing changes on the Landing, the emblems walked not activated; the Alembic Window painted as the staircases promise per D03s window option; the Transformation Chamber holds the Turnings cast in absentia  the machine, the electric alcove, the copper kitchen, one room three crafts; the color bands rotate sine-soft, Steady Light throughout; the Turning is harmony not total  the machine of phials, not a scoreboard). NOTE: LEVEL 6 COMPLETE at establishing depth (the Five Emblems hall already DONE; cast portraits already live). NEXT DESCENDING: Level 5 the Main Floors fills are largely CLOSED (queue #2 done), then the Campgrounds, and down into the descent series.

**LEVEL 4  THE CAMPGROUNDS (2026-09-11, twenty-first paint  the descent continues: the faire level, seven rooms at establishing depth):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE MARKET FIELD (ENV wide) | the faire lanes: stall frames and pavilions, the artisan goods hung, banner flags, the golden-hour dust | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/5fd8e3b14_generated_image.png |
| THE HUNTSMAN TAVERN (ENV wide) | the well-kept timber tavern: the porch benches, the iron lanterns, the crossed-ars sign  warm and lived-in, the parental gates children held off-frame | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/008e9ea12_generated_image.png |
| LUNA'S TENT-STUDIO (ENV wide) | the beadwork tent: the trays in rainbow gradient, the strands on pegs, the waxed cord  the Bead Composers home | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/dfd9b622a_generated_image.png |
| THE FORGE (ENV wide) | the Firekeepers cousin: the banked glow, the anvil on oak, the finished ironwork on the beams  craft station, not battlefield | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/1578d1394_generated_image.png |
| THE SEVEN RITUAL WOODS (ENV wide) | the curriculum in timber: birch, yew, oak, ash, rowan, cedar, hawthorn  each grove with its waystone and its bench | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7bc83e096_generated_image.png |
| THE STAGE (ENV wide) | the Gathering Laws home: the canopy and swags, the lute case backstage, the lanterns against the plum sky  anticipation without pressure | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/2135d02ef_generated_image.png |
| THE LOCH AND THE DOCK (ENV wide) | Zekes ground: the furled ship, the tide-charts nailed to the dockhouse, the lighthouse sweep slow across the water  the whole scene keeping time | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/1bc8de479_generated_image.png |

Class: ZONE/ENV establishing masters (KIT-Z wides)  Zone home: Level 4 the Campgrounds (the faire)  Product home: the web betas campgrounds screens + the Beat Line + the Stage event art  Source: original generation (THE PARENTAL GATE held  no children rendered anywhere in the level; the Seven Sisters Circle already painted in its own parcel; the Glassblowers shop + Color Works painted in the craft row parcel; the lighthouse images already live, the loch/dock completing the set; the Beat Line implied at the dock  the tide-charts, the lanterns keeping time; the Stage painted empty per the Terrible Clauses family  the show is anticipated, never demanded; Steady Light throughout). NOTE: LEVEL 4 COMPLETE at establishing depth. NEXT DESCENDING: Level 3 (the Catacombs/Undercity descent series  D16s Bedrock already painted), then the water system and the world-maps family fills.

**THE CAMPFIRES + THE NEWGRANGE ADDITIONS (2026-09-11, twenty-second paint  Krista's call: the large campfire areas + all the new grange additions planned earlier today):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE SEVEN SISTERS CIRCLE, FULL FIRE (ENV wide) | the consecrated ring at dusk: seven lithophonic sisters, the grand campfire leaping, the drums on the benches, the outlier sister apart on the alignment axis | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/f94c20f3c_generated_image.png |
| THE AFTER-CANNON HOUR (ENV wide, the circle's truest state) | the same ring banked low: deep amber coals, empty warm benches, one drum left resting, the sisters holding the quiet  the fire at its most real | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7940340e4_generated_image.png |
| THE LITTLE NEWGRANGE (ENV wide) | the passage mound itself: the quartz-pebble ring, the triple-spiral kerbstone entrance, the path to the oldest kind of house | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/8a8434aef_generated_image.png |
| THE LIGHTBOX DAWN (ENV wide) | the heart chamber at its alignment hour: the single blade of winter sunrise crossing the heart stone  witnessed, not taken, the quietest collectible | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/fc8837980_generated_image.png |
| THE SPIRAL ROCK FAMILY (ENV/PROP wide) | the signature at every scale: the spiral benches, the nooks, the pebbles, the gift tokens in a bowl  the oldest mark, made furniture | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/d5bd9a9ee_generated_image.png |
| THE ROLLING DOOR (ENV wide) | the Derinkuyu tribute: the wheel-shaped granite door in its curved track, half-rolled open on a warm lamplit gallery  one hands can move | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/4c87748f5_generated_image.png |

Class: ZONE/ENV establishing masters  Zone home: the Campgrounds (the Seven Sisters Circle + the Passage Mounds family)  Product home: the web betas campgrounds screens + the lightbox event art + the drum circle art  Source: original generation (THE CIRCLE painted in BOTH REGISTERS  the fire at its loudest and the after-cannon hour at its most true, same fire; the outlier sister held apart on the axis per the mini-Stonehenge ruling; the murlocs implied never rendered  the gargle finds the low end, nobody counts them; the LIGHTBOX painted as the witnessed-moment mechanic  the light arrives, the room receives, nothing is taken; the spiral family rendered at bench/noo/pebble/token scale per the four-sizes law; the rolling door painted pushable  the hands-did-this law, the Man-Made Is the Miracle family; Steady Light throughout, even the leaping flames sine-soft). NOTE: the Campgrounds' campfire law is now COMPLETE (the Sisters circle full-fire + banked + the Common Room campfire already painted), and the Newgrange additions' core set is painted (the amphitheater + Maeshowe runes + Skara Brae interiors remain as room fills).

**WE MARRIED THE NOISE (2026-09-11, twenty-third paint  the Root Storyline Study's headline, painted):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE WINDOW TRUCE (CHAR/ENV wide, the study's structural mirror) | the one-frame story in two registers: the Bard and Zekes dock session below (lute + guitar + harmonica, back-to-view, the 50 BPM warm), the Ragana and Katya in the library window above (silhouettes, arms folded, patient and fond), and the golden sound rising between them, dissolving at the glass without entering | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/295c6a582_generated_image.png |

Class: CHAR/ENV master (the family's quiet structural scene)  Zone home: the Dock + the Library Nook (both at once  the frame is the point)  Product home: the Root Storyline Study's plate + the web beta's family lore art  Source: original generation (the study found the scene; the painting holds it  the noise never enters the library, the quiet never leaves it, and neither could exist without the other; the musicians back-to-view per the posture law, the watchers silhouetted at the glass; We married the noise, the phrase the whole building is built on). NOTE: the Root Storyline Study now has its plate. The Host + Charon master dossiers landed the same evening as the study  the two biggest doors closed.

**THE CLOSING PARCEL (2026-09-11, twenty-fourth paint  the stone-cave manifest's gaps closed, the underground weave COMPLETE):**
| Panel | Subject | URL |
|-------|---------|-----|
| THE FILLED REWARD CAVE (ENV wide) | the geode cave brimming: the drifts of amethyst, the amber strands hung on crystal spikes, the dragon asleep on the softest stones  the geode forming as progress | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/80cb8af8a_generated_image.png |
| THE DEEP ONES (ENV/CHAR wide) | the third faction's presence: the watchers surfacing at the Deep Harbor quay, gold bioluminescent brows, the chin on the stone like an old neighbor at a fence | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/2bd33661f_generated_image.png |
| THE HALICARNASSUS MAUSOLEUM interior (ENV wide) | the translucent marble, the horse friezes, the shaft of light on the podium  the wonder kept | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/4de63a680_generated_image.png |
| THE TAJ-LIKE MAUSOLEUM interior (ENV wide) | the pietra dura inlay, the jali light patterns, grief built into the most beautiful room its makers could build | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/f664e25a1_generated_image.png |
| THE SERAPEUM GALLERY (ENV wide) | the ninety-ton granite sarcophagi in their rock-cut gallery, lids half-slid  human hands moved these, the loudest SOMEONE WAS HERE | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/4f550f5d4_generated_image.png |

Class: ZONE/ENV masters  Zone home: the reward cave (the Main Floor mascot arc) + the Hollow Earth's Deep Harbor + the Mausoleum register  Product home: the collection-economy proof art + the Hollow Earth RPG faction screens + the catacombs weave screens  Source: original generation (the Man-Made Is the Miracle law holds across all three mausoleums; the Deep Ones painted as watchers, never threats  the Adapted family; the reward cave is the geode-mascot canon made literal: the cave that fills with gems as the journey is kept; Steady Light throughout). NOTE: THE STONE CAVE MANIFEST IS CLOSED  no gaps remain. The underground weave is one painted building, mounds to crystal city.

**THE PHASE 1 GAME CASTS (2026-09-11, twenty-fifth paint  the arcade owe begun: the three flagship games' cast cycle sheets, the 1024px masters for the crunch line):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| STANDING STONES (Tetris-class) | the full cast in-pose: the druid mason, the megalith-surveyor, the Preseli blue stone spirit, the corvid carrier + the five carved tetromino-stone block shapes + the blue shard reveal + the shadow row | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/83ad7a5a7_generated_image.png |
| ANDEAN RUN (endless runner) | the build sheet's exact cast: the Chasqui Runner in 8 poses (run x4/jump x2/slide/turn), the Apu in 2 (dormant stone/manifesting), the Awqa Pacha in 4 (chase x2/lunge x2) + the shadow row  the 32-sprite count covered | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/e46881360_generated_image.png |
| MONSTER OF THE DEEP (growth game) | the player creature's FIVE growth stages, each with the pose row (swim x2/hunt/eat/rest) + the shadow row  the 60-sprite player-creature count covered (the 32 rival monsters already hold tri-mode bestiary assets) | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/d62345a3f_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line: auto-slice  quantize 32 colors  64px frames  atlas)  Zone home: the Arcade (Phase 1 row)  Product home: the Arcade cards + the Godot builds  Source: original generation (the Tomb Tunnel line extended to its three flagship siblings; tri-mode held via the shadow rows  the 84Hz recolor class; the Andean cast matches its build sheet count exactly; MotD's rivals deliberately not repainted  the bestiary already holds them; consistent design language per game, clean silhouette legibility for the crunch). NOTE: 76 GAMES REMAIN after this parcel (Tier 1 first, per the build-sheet tier ranking). Files staged for the crunch line in docs/library/sprites/phase1/.

**THE SECOND CAST PARCEL (2026-09-11, twenty-sixth paint  the arcade owe, Tier 1 continues):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| BASTET'S HERDING | the goddess in 3 poses + the six cat archetypes (temple, alley, lap, fishing, sand, lion cub) in 2 poses each + the sistrum with pulse rings, the reed basket, the Cat's Eye Chrysoberyl shard + the shadow row | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/1fd945b3d_generated_image.png |
| DRAGON TILES | the tile master in 3 poses + the cloud-dragon spirit in 3 + the carved tile set (bamboo, orchid, koi, moon gate, pagoda, plum blossom + the jade-inlay dragon tiles) + the jade shard + the shadow row | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/a6894d672_generated_image.png |
| EGYPTIAN GATES | the Gatekeeper priest in 3 poses + the chibi jackal scribe + the scarab roller in 3 + the five interlocking gate segments + the uraeus watcher + the carnelian shard + the shadow row | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/fd863fbde_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 1)  Product home: the Arcade cards + the Godot builds  Source: original generation (each game's stone reveal included as the shard  the collection tie on every sheet; the sistrum's pulse rings = the mechanic made visible; the gate segments interlock like the doorway arch  the puzzle IS the door; tri-mode held via the shadow rows, the 84Hz recolor class). NOTE: 73 GAMES REMAIN. Seven Tier 1 games now hold master casts.

**THE THIRD CAST PARCEL (2026-09-11, twenty-seventh paint  the arcade owe, Tier 1 continues):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| FROG TRANSFORMATION (the moderation game) | the Inn patron base + the FROGLODYTE (the same soul in frog form: hopping, guilty slouch, balloon-inflated) + the owl-headed judge JUDGE TOOTENKOWL (Krista-ruled, 2026-09-11) + the lily pad shield  three transforms = suspension, held with humor | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/ecc52b0a3_generated_image.png |
| THE MOHS VIBRATION (the blind cave, the accessibility showcase) | Fibonacci the Keeper + the six stones rendered twice  once solid, once as their pure vibration ring-pattern  VIBRATION IS IDENTITY made visible; the clear quartz teaching shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/fa2fd2250_generated_image.png |
| NORSE VOYAGE (the sailing game) | the navigator with the iolite pendant in 5 poses + the knarr in furled/full sail + the three wave-tile styles + the seal spirit + Yggdrasil's roots glowing beneath the grid + the iolite shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/dfa0b0668_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 1) + the Geode Cave (Mohs) + the Norse Coast (Voyage)  Product home: the Arcade cards + the Godot builds  Source: original generation (the Froglodyte carries the same clothes as the patron  the transformation never changes the soul, only the shape; the Mohs sheet renders sound as the primary road per the Every-Mind Welcome law  the game that teaches the accessibility thesis; the Voyage holds the Norse Coast canon  roots beneath the waves, runes in the guestbook, iolite the navigator's stone; tri-mode via the shadow rows). NOTE: 70 GAMES REMAIN. Ten Tier 1 games now hold master casts.

**THE FOURTH CAST PARCEL (2026-09-11, twenty-eighth paint  the arcade owe, Tier 1 continues):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| ACROPOLIS IN FIVE LIGHTS | the marble philosopher-guide + the Parthenon in its five light phases + the subtle sixth (the Song-complete glow) + the light-beam puzzle pieces + the sapphire shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/989423164_generated_image.png |
| DRAGON'S DESCENT | the dragon kitten hero in 6 poses (run/jump/crouch/skid/celebrate) + the carved platform tiles + the waking guardian statue + the vine spirit + the multi-gem cluster | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/449963953_generated_image.png |
| GHATS OF KALI | the festival drummer in 4 poses + the flower-boat girl with the oil lamp + the rhythm glyph row (drum/hand/lotus/bell) + the marigold lantern tiles + the ghat steps + the ruby shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/ce515611d_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 1) + Greece + Lost Civ + India  Product home: the Arcade cards + the Godot builds  Source: original generation (the Parthenon's sixth phase deliberately subtle  the reward is noticing; the dragon kitten is the mascot lineage in platformer duty; the Kali game's glyphs are carved icons, never letters  meaning has more than one road; tri-mode via the shadow rows). NOTE: 67 GAMES REMAIN. Thirteen Tier 1 games now hold master casts.

**GATE CLOSED (2026-09-11, Krista's ruling): THE OWL-JUDGE IS NAMED  JUDGE TOOTENKOWL** (Krista's exact spelling; the Tutankhamun pun  the pharaoh-judge of the frog court). The frog-transformation game's owl-headed judge, cast in parcel three, now holds the name. NOTE: Judge Tootenkowl is the FROG COURT's judge (the moderation game's seat)  distinct from THE OWL, the bloodline witness of the lighthouse and the Owls spec (the witness, not the judge  the distinction is the canon).

**THE FIFTH CAST PARCEL (2026-09-11, twenty-ninth paint  the arcade owe, Tier 1 continues):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| BAYOU RECLAMATION | the bayou keeper in 4 poses + the resource row (moss, reeds, cypress knee, firefly jar, crawfish trap, plank) + the gator spirit + the will-o-wisp guide + the turf block + the swamp agate shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/949cfacd3_generated_image.png |
| CAVE PAINTER'S QUIZ | the cave painter spirit in 3 poses + the torch + the six Chauvet panel tiles (horses, lion, rhino, aurochs, owl, hand prints  authentic charcoal-and-ochre style) + the aragonite cluster | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/5c76d719f_generated_image.png |
| CLOCKWORK SKIES | the clockwork aviator in 3 poses + the brass gull craft (straight/bank/roll) + the finch drone + the kite raider + the gear debris tiles + the star iron shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/6b47deae2_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 1) + the Bayou + Chauvet + Clockwork Skies  Product home: the Arcade cards + the Godot builds  Source: original generation (the Chauvet panels painted faithful to the real cave's charcoal-and-ochre style  the oldest art in the Inn honored accurately; the aviator's craft follows the Inn's clockwork canon; the gator spirit is a shy neighbor, never a threat; tri-mode via the shadow rows). NOTE: 64 GAMES REMAIN. Sixteen Tier 1 games now hold master casts.

**THE SIXTH CAST PARCEL (2026-09-11, thirtieth paint  the arcade owe, Tier 1 continues):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| COLORADO PLATEAU | the climber in 6 poses (reach/grip/rest/leap/perch/summit) + the red-strata cliff tiles + the canyon wren, bighorn, and collared lizard + the turquoise shard in red matrix | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/c90c0ce78_generated_image.png |
| FJORD OF STARS | the star mapper with brass astrolabe in 3 poses + the aurora block tiles in three phases (green/violet/rose) with light trails + the constellation panels + the iolite shard that sees through fog | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/6a5951ab0_generated_image.png |
| INCA TERRACE LULLABY | the sleeping giant (the mountain that IS a sleeper, snore rings and all) + the lullaby keeper with the quena in 4 poses + the quiet glyphs (feather/closed eyes/sway/tiptoe) + the terrace masonry tiles + the vicuña + the blue opal | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7a57d9a81_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 1) + Colorado + Slavic + Peru  Product home: the Arcade cards + the Godot builds  Source: original generation (the sleeping giant's silhouette is a person  the mountain IS the sleeper, the gentlest sprite in the ledger; the quiet glyphs carry the No-Boo law  every command is a hush, never a shout; the climber's cast holds the parks canon  the real geology is the curriculum; tri-mode via the shadow rows). NOTE: 61 GAMES REMAIN. Nineteen Tier 1 games now hold master casts.

**THE SEVENTH CAST PARCEL (2026-09-11, thirty-first paint  the arcade owe, Tier 1 continues):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| MEDITERRANEAN TRADE | the trader captain in 4 poses + the merchant round ship (docked/sailing) + the goods row (oil, grain, purple dye, bronze, glass, papyrus) + the port tiles + the coral shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/31f712ae8_generated_image.png |
| MOJI MAKER | the carver sage + the little moai's EIGHT evolving forms (the final wearing the coral topknot) + the element tiles (water/earth/fire/air + combined glyphs) + the obsidian shard in glassy conchoidal shine | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/6d316f39d_generated_image.png |
| ORACLE'S RIDDLES | the oracle with the tripod vapor in 3 poses + the riddle scribe + the clue-icon tiles (owl, olive, wave, sun, lyre  letters never shown, pictures only) + the omphalos stone + the sapphire shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/c942be833_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 1) + Mediterranean + Easter Island + Parthenon  Product home: the Arcade cards + the Godot builds  Source: original generation (the oracle's tiles carry the Heard-Text law's picture road  clue icons, never letters; the moai's eight forms are the game's whole tech tree on one row; the trader's balance scale is the game's soul  trade is a weighing; tri-mode via the shadow rows). NOTE: 58 GAMES REMAIN. Twenty-two Tier 1 games now hold master casts  EIGHT REMAIN IN TIER 1: Pinball, Redwood Cathedral, Rune Hunt, Sacred Scramble, Spiral Gallery Tour, Terracotta Army Builder, The Crystal Paddle, Whisper Layer Discovery.

**THE EIGHTH CAST PARCEL (2026-09-11, thirty-second paint  the arcade owe, Tier 1 continues, FOUR-GAME PARCEL):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| GEODE INN PINBALL | the frequency ball (a glowing orb trailing sound rings  the ball IS a frequency) + the carved bumper zones (amethyst cluster, brass gear, geode-slice, mushroom) + the wooden flippers + the tiny cheering gargoyle | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/629150011_generated_image.png |
| REDWOOD CATHEDRAL | the redwood climber in 6 poses + the bark grip tiles + the banana slug, the knot-hole owl, the spiral fern + the petrified wood shard (growth rings turned agate) | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/41cfcbdcc_generated_image.png |
| RUNE HUNT | the rune-reading scholar with brass lens in 4 poses + the 4x4 rune grid (plain weathered tiles hiding gold-glow runes) + the standing tall tile + the Yggdrasil-root found-rune + the iolite shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/68a0742d7_generated_image.png |
| SACRED SCRAMBLE | the marble mason-beard scholar + the gemstone-fragment glyph tiles (ruby/jade/carnelian/lapis/pearl mosaics) + the solved pietra dura medallion + the jali lovebirds + the ruby shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/f8be8359d_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 1) + the Inn itself (pinball) + Redwood + Norse + Taj  Product home: the Arcade cards + the Godot builds  Source: original generation (the pinball ball carries its mechanic literally  the ball is a frequency with visible rings; the rune grid honors the guestbook law  runes hidden in plain sight, found by looking; the Scramble tiles keep letters off the board  gemstone fragments as glyphs, the picture road again; the Redwood cast holds the Fae Queen's origin zone with reverence; tri-mode via the shadow rows). NOTE: 54 GAMES REMAIN. TWENTY-SIX Tier 1 games now hold master casts  FOUR REMAIN IN TIER 1: Spiral Gallery Tour, Terracotta Army Builder, The Crystal Paddle, Whisper Layer Discovery.

**THE NINTH CAST PARCEL (2026-09-11, thirty-third paint  THE TIER 1 ROW CLOSED):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| SPIRAL GALLERY TOUR | the docent with brass pointer + the spiral ramp tiles + the six art epoch tiles (cave to impressionist) + the beret mouse + the bench and placard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/a4436adda_generated_image.png |
| TERRACOTTA ARMY BUILDER | the commander with tally tablet + the six soldier types with painted pigment traces (the general with pheasant tassels) + the war horse + the flag and trench tiles + the jade shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/409e52074_generated_image.png |
| THE CRYSTAL PADDLE | the layered beryl paddle + the prism ball with refraction rainbow + the five crystal block types + the garden sprite pruning + the beryl shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/a71bd0879_generated_image.png |
| WHISPER LAYER DISCOVERY | the quiet visitor + the FIVE manifestation vignettes (the settled curtain, the refilled mug, the turned chair, the ending footprints, the relit candle) + the soft sound ring + the ceiling gnome pointing down subtly + the echo stone | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/42bcb51d4_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 1) + Spiral Gallery + China + Crystal Gardens + ALL ZONES (the Whisper)  Product home: the Arcade cards + the Godot builds  Source: original generation (the whisper vignettes are the Inn noticing, made warm, never spooky  the Whisper Layer spec's five events on tiles; the terracotta ranks faithful to the real army's types with pigment traces  the science is the lesson; the paddle's hexagonal grain = real beryl crystallography; tri-mode via the shadow rows).

TIER 1 COMPLETE: ALL 30 TIER 1 GAMES NOW HOLD MASTER CASTS (30/30). The arcade owes 50 games (Tiers 2-4 next, per the build-sheet ranking). The Owl-judge's name gate stands open (later closed: Judge Tootenkowl, 2026-09-11).

**THE TENTH CAST PARCEL (2026-09-11, thirty-fourth paint  TIER 2 BEGINS, four-game parcel):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| ALCHEMICAL STAIRCASE | the split-toned alchemist climber in 5 poses + the sigil block set (salt/sulfur/mercury + the cracked unstable) + the hazard tiles + the spiraling stair tile + the philosopher's stone shard (gold with inner red) | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/b1101ac9a_generated_image.png |
| CANADIAN ROCKIES | the red-tuque climber in 8 poses (dash streaks visible) + the snow/ice/granite/fir terrain tiles + the mountain goat guide + the golden memory spark that follows the climber + the jade shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/0a9b33c05_generated_image.png |
| CATACOMB LABYRINTH | the lantern soul in 4 poses + the four pursuing shades (gaunt/squat/swooping/skittering, lantern-light eyes, warm not spooky) + the ember motes and the bright ember + the fitted catacomb masonry + the CHARON TOKEN (an antique coin with a tiny boat engraving) | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/ebdfc89b4_generated_image.png |
| CRYSTAL CATCHER | the caver with brass grappling gauntlet in 5 poses (aim/swing/hang/reel/crouch) + the three-pronged claw hook + the anchor tiles + the tourmaline collectibles incl. the watermelon slice + the shy translucent newt + the tourmaline shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/1d130af6f_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 2) + Staircase + Canadian Rockies + Catacombs + Caverns  Product home: the Arcade cards + the Godot builds  Source: original generation (the reference-blueprint law held on every sheet  mechanic only, all assets original; the Charon token carries the ferry canon  the obol as a game token, the release ritual made playable; the memory spark follows the Rockies' gossip-is-gravity canon made gentle; tri-mode via the shadow rows). NOTE: 46 GAMES REMAIN. Four Tier 2 games now hold master casts.

**THE ELEVENTH CAST PARCEL (2026-09-11, thirty-fifth paint  Tier 2 continues, four-game parcel):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| MUSIC ROOM COMPOSER | the silver-streaked composer in 4 poses + the carved stone note glyphs riding stave rails + the humming violin-string spirit + the harmonic stone with its chord ring inside | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/0dd5908e4_generated_image.png |
| POISON GARDEN | the garden spirit with belladonna-bloom hair in 3 poses (lure/misdirect/watch) + the plant cast (foxglove, monkshood, poppy, strangling rose) + the careless visitors + the decoy lures + the ANTIDOTE ORCHID (the one safe bloom) | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/11a93c034_generated_image.png |
| SERPENT STEPS | the plumed serpent in 4 poses + the three segment states (plain/fed/gold-elder) + the food orbs (jade, quetzal feather, cocoa pod) + the serpent-step masonry + the calling quetzal + the fire opal | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/73f4e04d7_generated_image.png |
| TEMPLE OF THE NAGA | the vine-whip warden-monk in 6 poses + the whip (coiled/extended) + the bas-relief temple tiles + the waking apsara + the nagini guardian + the many-hooded boss glyph + the zircon | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/0fe7b46c8_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 2) + Music Room + Poison Garden + Chichen Itza + Angkor Wat  Product home: the Arcade cards + the Godot builds  Source: original generation (the Poison Garden reversal held  the player IS the garden, protecting not raiding; the serpent's gold-elder segments reward survival with visible growth; Angkor's bas-reliefs accurate  the real carvings are the curriculum; the composer's notes carved as stone  the Inn's stone-tone canon carried into the Music Room; tri-mode via the shadow rows). NOTE: 42 GAMES REMAIN. Eight Tier 2 games now hold master casts.

**THE TWELFTH CAST PARCEL (2026-09-11, thirty-sixth paint  Tier 2 continues, four-game parcel):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| THE APOTHECARY'S CURE | the patient apothecary with brass scales in 4 poses + the two-tone remedy tiles (herb/mineral/water/salt halves) + the mist-filled affliction jars + the tiny droplet helper + the banded malachite shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/26ee680e4_generated_image.png |
| THE DREAM GARDENER | the moth-antlered fae gardener in 5 poses (uproot/throw/plant/water/dust-off) + the dream seedlings' 3 stages (bulb > sprout > bloom with the tiny fae wisp emerging) + the acorn watering can + the opalescent dream quartz with the closed-eye shimmer | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/35d626541_generated_image.png |
| THE EGG CARRIER | the long-legged carrier bird with the basket harness in 5 poses + the four gemstone eggs (agate/jasper/geode-crack/humming) + the bough platforms + the seed-pod tosser fleeing + the fire agate with inner ember | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/27bd4e2ea_generated_image.png |
| THE FOREST DEFENSE | the campfire keeper in 3 poses + the four tower types (mushroom ring, thorn bramble, drum tower, lantern post) + the trail curves + the mischievous visitors bounced back comically + the campfire heart + the mossy moss agate | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/92d6f7ae4_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 2) + Staircase + Fae Kingdom + Canopy + Campgrounds  Product home: the Arcade cards + the Godot builds  Source: original generation (the Apothecary holds the malachite paradox in the game itself  toxic ground, medicinal whole; the dream seedlings grow INTO fae  the Kingdom grows its own inhabitants, the canon made playable; the carrier's eggs match the hatchery canon  gemstone eggs; the Forest Defense enemies are never scary  bounced back comically, the Whimsical-Macabre law's gentlest reading; tri-mode via the shadow rows). NOTE: 38 GAMES REMAIN. Twelve Tier 2 games now hold master casts.

**THE THIRTEENTH CAST PARCEL (2026-09-11, thirty-seventh paint  Tier 2 continues, four-game parcel):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| THE HOOK | the weathered pirate captain with the winch spool in 3 poses + the braided hook cable in 4 states + the 7x7 water-layer grid (foam down to still deep) + the catchables (aquamarine, pearl, sardine, hermit crab) + the aligned-flow tile with gold frequency lines + the aquamarine shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/433bb9b9d_generated_image.png |
| THE LONG DARK | the lampkeeper with the memory-lamp in 4 poses + the lamp's glow-radius ring + the Hollow Men (tall/stooped/creeping, faceless, patient, never gory) + the defenses (lamp cluster, bell-pulley, chalk ward) + the shadow quartz with violet heart | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/cbd80fa60_generated_image.png |
| THE MIRROR'S SEVEN | the seeker with one glove + the standing mirror in 3 states (dormant/waking/reflection showing a faint second self) + the seven task-emblem tiles + the glass-coffin bower in blooms + the snowflake obsidian (black glass, white fern-bloom) | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/1155dce6f_generated_image.png |
| THE NOOB SIEGE | the fizgig defenders in four personality variants (scout/slinger/drummer/banner-bearer) + the bumbling noobs (noodle arms, tiny ladders, comically tangled retreats) + the wire-woven home with lantern strings + the lodestone with iron-filing star | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/d223460e6_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 2) + Tidal Caves + Undercity + Poison Garden + Wire Nook  Product home: the Arcade cards + the Godot builds  Source: original generation (the Hook holds the tide canon  the grid IS the aqueduct cross-section, the aligned-flow tile shows the 42Hz Song made visible; the Long Dark's lampkeeper carries the memory-lamp canon  the Undercity's power grid as the weapon; the Hollow Men patient and faceless, 84Hz made figure; the fizgigs are the Inn's own emergent critters defending their nook  home is worth defending; tri-mode via the shadow rows). NOTE: 34 GAMES REMAIN. Sixteen Tier 2 games now hold master casts.

**THE FOURTEENTH CAST PARCEL (2026-09-11, thirty-eighth paint  Tier 2 continues, four-game parcel):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| THE PIPE DESCENT | the bone-keeper's helper stomper in 6 poses + the song-carved pipes (frequency lines spiraling in) + the gentle popping critters (bone-mouse, skull-sparrow, dust wisp) + the fossil rat cameo dancing mid-air + the pipe stone with hollow resonant core | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/a84b27485_generated_image.png |
| THE RECLAMATION | the marsh-folk reclaimer in 4 poses (planting/mopping/lighting/leaning) + the reclaim stakes' 3 growth stages (planted > sprouting > blooming with light) + the soft-edged murk retreating from light + the firefly swarm + the swamp agate | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/106f51c62_generated_image.png |
| THE SIGNAL | the radio officer in 4 poses (incl. leaning toward the screen as if hearing the player, waving hello) + the small spacecraft with its antenna turned toward the viewer + the tuning dial and speaker tiles + the cursor-light sprite sitting on the console like a friendly firefly + the moldavite tektite | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/f85d23191_generated_image.png |
| TREASURY MATCH | the Petra slinger with the rose-stone cannon + the six banded agate orbs + the Nabataean carved wall grid + the rock hyrax companion + the dotted aim arc + the banded agate shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/c219de86f_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 2) + Catacombs + Bayou + Cosmology + Petra  Product home: the Arcade cards + the Godot builds  Source: original generation (the Signal's fourth wall is TENDER  the radio officer leans in and waves, the cursor-light is a friendly firefly on the console, never creepy; the reference blueprint held  DDLC's mechanic only, the Inn's warmth replacing the horror entirely; the murk always retreating from light  the murk is soft-edged, no dread; the hyrax is Petra's real resident  the science is the lesson; tri-mode via the shadow rows). NOTE: 30 GAMES REMAIN. Twenty Tier 2 games now hold master casts.

**THE FIFTEENTH CAST PARCEL (2026-09-11, thirty-ninth paint  TIER 2 CLOSED):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| TUMBLE RUN | the leaf-sprite tumbler with acorn cap in 6 poses (roll/jump/bounce/dash/spin/run-out) + the beat-aligned obstacle tiles (bough drum, thorn burr, vine gate, pulsing beat discs) + the moss landing pads + three reward stones (citrine/moonstone/garnet, the random-pool reward shown in art) + the cheering canopy bird | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/3de038afb_generated_image.png |
| WALL DEFENSE | the Han-dynasty wall archer with repeating crossbow in 4 poses + the crossbow drawn accurately (bolt magazine, the real Chinese invention) + the battlements and watchtower + the paper-lantern wind spirits (popping into harmless paper scraps) + the golden lantern bonus + the jade shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/0aebcbc7c_generated_image.png |
| YELLOWSTONE GEYSER | the brass-buttoned geyser keeper with pressure pocket-watch in 4 poses + the full brass pipe tile set (straight/elbow/T/cross/valve/cap) + the flow sprites + the accurate sinter tiles (geyserite cone, mudpot, turquoise spring with pale stone ring) + the unbothered bison + the obsidian shard with conchoidal edges | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/ea2acd21e_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 2) + Canopy + Great Wall + Yellowstone  Product home: the Arcade cards + the Godot builds  Source: original generation (the crossbow is the real repeating crossbow  the science is the lesson, the story is the delivery; the Yellowstone sinter tiles carry the geology accurately  geyserite cones, mudpots, the hot spring's stone ring; the lantern spirits pop into paper scraps  never violent; tri-mode via the shadow rows).

TIER 2 COMPLETE: ALL 23 TIER 2 GAMES NOW HOLD MASTER CASTS (23/23). TIERS 1 AND 2 BOTH CLOSED. The arcade owes 27 games (Tiers 3-4). The Owl-judge's name gate stands open (later closed: Judge Tootenkowl, 2026-09-11).

**THE SIXTEENTH CAST PARCEL (2026-09-11, fortieth paint  TIER 3 BEGINS, four-game parcel):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| APPALACHIAN TRAIL | the thru-hiker with the huge frame pack and dangling tin cup in 5 poses (incl. the ford, staff-first) + the supply row + the event vignettes (the curious bear at a respectful distance) + the trail tiles + the ruby shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7a5da6240_generated_image.png |
| AURORA BOREALIS | the light trail spirit in 5 growing stages (wisp to long flowing ribbon) + the absorbable aurora motes and rival ribbons + the absorb burst + the silhouette landscapes (ridge, frozen lake mirror, pine line) + the labradorite with its blue-gold flash | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/cc72746d8_generated_image.png |
| AURORA FALLS | the small walker silhouette with a rim of aurora glow in 5 poses + the physics puzzle tiles (crate, rope lever, log raft, barrel) + the basalt and waterfall curtain tiles with soft spray glow + the firefly-light guide + the Icelandic spar catching its double image | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/9cb0a21e4_generated_image.png |
| BADLANDS FOSSIL DIG | the eager digger in 5 poses (incl. the pockets-full waddle and the exit leap) + the boulders in 3 states + the banded strata dirt tiles + the ACCURATE fossil collectibles (ammonite, trilobite, fish in slate, oreodont jaw) + the fossil jasper | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/a9a113e17_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 3) + Appalachians + Arctic + Iceland + Badlands  Product home: the Arcade cards + the Godot builds  Source: original generation (the Trail's bear is curious at a respectful distance  the Adequacy Law's neighbor; the Aurora Falls silhouette sheet holds the Steady Light law  every glow is soft rim light, the melancholy played warm; the Badlands fossils are the real fauna of the formation  the science is the lesson; tri-mode via the shadow rows). NOTE: 23 GAMES REMAIN. Four Tier 3 games now hold master casts.

**THE SEVENTEENTH CAST PARCEL (2026-09-11, forty-first paint  Tier 3 continues, four-game parcel):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| BONSAI GARDEN | the zen gardener with bamboo ladle in 4 poses + the bonsai in 3 growth stages (sapling > styled > magnificent) + the branch-routing tiles + the water runnel and gold light mote flowing along the grain + the one pale drooping warning leaf + the jade shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/bd1ea6269_generated_image.png |
| CANOPY CITY TRADING | the canopy merchant with coin-belt in 4 poses + the stall, lantern post, and rope bridge + the trade goods + the resident critters (sleepy sloth shopkeeper, beaver carpenter, chatty macaw courier) + the LUMINWOOD plank (light held in the grain like sun in amber) | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/c58183ea1_generated_image.png |
| CORAL REEF RESCUE | the reef-keeper turtle with kelp satchel in 4 poses + the accurate coral tile types (brain/staghorn/fan/tube/mushroom) + the pearl wildcard and current-swirl + the silver-fish swarm jumbler + the coral aragonite with hex needles | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/9d09a73b6_generated_image.png |
| EASTER ISLAND HEADS | the little moai in 5 poses (incl. stopping to gaze at the sea, celebrating with tiny raised arms) + the ability variants (obsidian-adze digger, coral-topknot blocker, palm-frond parachute floater, the bridger lying down as a stepping stone) + the terrain tiles incl. the safe shoreline goal + the waving crab + the pounamu | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/ea4176121_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 3) + Japan + Canopy City + Coral Reef + Easter Island  Product home: the Arcade cards + the Godot builds  Source: original generation (the moai are the Inn's observers  the walking played deadpan funny, one stops to gaze at the sea; the coral types are the real reef's architecture  the science is the lesson; the luminwood plank carries the Canopy City canon  wood that holds light; tri-mode via the shadow rows). NOTE: 19 GAMES REMAIN. Eight Tier 3 games now hold master casts.

**THE EIGHTEENTH CAST PARCEL (2026-09-11, forty-second paint  Tier 3 continues, four-game parcel):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| FUJI BLOSSOM | the serene shrine attendant in 3 poses + the twelve month cards (traditional motifs  pine, plum, cherry, wisteria, iris, peony, clover, susuki, chrysanthemum, maple, rain, moon) + the glowing crane scoring card + the stone play surface under the petal tree + the cherry opal with pink fire | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/19663944d_generated_image.png |
| HIMALAYAN ECHO | the four shapes with personalities (tall-proud rectangle, curious cube, dependable slab, cheerful roller) + the prayer flag line + the echo rings bouncing between cliffs + the see-saw and crevasse tiles + the Tibetan quartz with phantom inclusions | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/e853099d8_generated_image.png |
| ICEBERG BREAKER | the genial walrus captain with brass launcher in 3 poses + the ice pearl with bounce trail + the peg set (brash ice, growler, floe, refraction peg) + the golden berg + the fish-token shot counter + the rowboat free-ball bucket + the glacier quartz | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/bf7443ef6_generated_image.png |
| MESA VERDE | the contraption part set as Puebloan tools (corn cob wheel, jar dominoes, timber see-saw, ladder chute, clay bell, basket trampoline, metate stone) + the proud strutting turkey who pecks parts into motion + the golden chain-reaction arcs + the seed-in-planting-hole goal + the turquoise shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/0181e23fe_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 3) + Mount Fuji + Himalayas + Arctic Ice + Mesa Verde  Product home: the Arcade cards + the Godot builds  Source: original generation (the hanafuda motifs are the traditional game's own public-domain set  the art all original; the shapes carry personality without faces  Thomas Was Alone's law, the Inn's warmth; the turkey is the real Southwest icon made the contraption's engine; tri-mode via the shadow rows). NOTE: 15 GAMES REMAIN. Twelve Tier 3 games now hold master casts.

**THE NINETEENTH CAST PARCEL (2026-09-11, forty-third paint  Tier 3 continues, four-game parcel):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| SAGUARO BLOOM | the sun-hatted crystal gardener in 5 poses + the crystal crop row (shard > sprout > bloom-crowned in light) + the old waving saguaro + the season tiles (dry/monsoon/bloom) + the traveler traders (road-runner peddler, javelina appraiser) + the fire agate | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/04e639653_generated_image.png |
| STONE CIRCLE DEFENDER | the wren-spirit guardian on the standing stone in 4 poses + the sarsen/lintel/blue-stone tiles + the dusk-shades in 3 variants (formation + dive) + the violet-cocoon capture awaiting golden-thread rescue + the preseli blue stone | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/34e95c785_generated_image.png |
| STONE LIBRARY DEFENDER | the brisk archivist with inkwell holster in 3 poses (incl. the shhh-finger) + the bookish sentinels (gargoyle reader, reading-lamp sentry, inkwell sprayer, parchment curtain, rolling ladder sweeper) + the ink blots and dust bunnies (the armored blot wears a hardcover) + the sardonyx | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/ca1e93311_generated_image.png |
| SUPERSTITION MOUNTAINS | the prospector in 6 poses + THE LOST DUTCHMAN (one pressed tulip in the hatband, pointing at nothing in particular, offering company not directions) + the cave tile set + the hazards (rattlesnake, ocotillo thorn pit, unstable boulder) + the thunderbird silhouette + the turquoise | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/219741438_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 3) + Sonoran Desert + Stonehenge + the Archive + Superstition Mountains  Product home: the Arcade cards + the Godot builds  Source: original generation (THE LOST DUTCHMAN CARRIES THE CANON  the single pressed tulip is the entire evidence of the name, the ghost sits kindly and points at nothing; the preseli blue stone is the Fae portal unlock stone, the capture-rescue mechanic retold as the golden thread; the armored blot wears a hardcover like plate armor; tri-mode via the shadow rows). NOTE: 11 GAMES REMAIN. Sixteen Tier 3 games now hold master casts.

**THE TWENTIETH CAST PARCEL (2026-09-11, forty-fourth paint  Tier 3 continues, four-game parcel):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| THE ARCANA | the Captain with hand raised for silence in 5 poses + the void-skiff with brass ring drive and canvas sail in 3 states + the quiet-zone halo tile + the companion star-sprite that dims when quiet is asked + the moldavite | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/0c7151060_generated_image.png |
| THE BETWEEN | the margin-walker with the threshold-only lantern in 5 poses (incl. waiting for a door to open on its own, sitting beside a stranger) + the geography of cracks (light through the seam, a puddle reflecting a second world, a bridge made of a fallen mirror) + the kindness mechanic glyphs (shared bench, held door, returned item) + the labradorite at full flash | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/fcb460534_generated_image.png |
| THE PHILOSOPHER'S GAME | the seeker with open honest hands in 5 poses + THE STONE in 3 states (whole on plinth / offered on palms / LEFT WHERE IT BELONGS  the third state is the true victory) + the desire-mirror + the five stage emblems (flame, wave, sieve, knot, open hand) + the gentle golden pull | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/5c7819e17_generated_image.png |
| THE REST | the seated one with eyes gently closed in 4 states (settling > still > breathing > at ease) + the carved musical-rest glyph in 3 durations + the held void tiles (motes settle, never swirl) + the breath ring + the one constant ember + the stillness stone (so clear it is almost invisible, one held point of light) | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/b373cb735_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 3) + Cosmology + The Between + Staircase + The Void  Product home: the Arcade cards + the Godot builds  Source: original generation (THE INTENTION LAW HELD IN THE ART  the Stone's third state, left where it belongs, is the victory tile; the rest glyphs are the gameplay  a silence with a duration; the margin-walker's lantern lights only thresholds; the Captain is tested by QUIET, the companion sprite dims when silence is asked; tri-mode via the shadow rows, though The Rest's shadow row rests deeper than any other). NOTE: 7 GAMES REMAIN. Twenty Tier 3 games now hold master casts.

**THE TWENTY-FIRST CAST PARCEL (2026-09-11, forty-fifth paint  TIER 3 CLOSED):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| THE THREAD | the Arriver with thread spool in 5 poses (incl. arriving with arms slightly open) + ASTERION at full canon (huge, horned, profoundly gentle, big patient eyes, holding one small found feather; waiting at a turn, looking up at the moonlight, tentatively receiving a greeting) + the two-sided threshold tile (Mediterranean stone meets Unseelie crystal) + the moonlight inscriptions glowing on moon-bright walls + the dead end with the worn resting bench + the rainbow moonstone at full adularescence | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/c760692cb_generated_image.png |
| TIDAL CAVES | the masked Crafter in the wax-sealed selkie apron with tool bandolier in 5 poses (incl. listening to the water change, waving the player deeper in) + the six environment vignettes (cave mouth, turquoise pool, air bell, blowhole, tide-locked grotto, moonlit workshop alcove) + the carved waterline tide marks + the works-in-progress (shell inlay, sea-glass bead curtain, wire mobile) + the pearl on its shell dish | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/fb61755b0_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 3) + Labyrinth of Crete + the Tidal Caves  Product home: the Arcade cards + the Godot builds  Source: original generation (THE ARRIVAL LAW HELD IN THE ART  Asterion's greeting pose IS the win state; the dead end gets a bench, arrival is the quest; the Crafter wears the apron-as-skin canon  the seal-skin sheen subtle, never literal; the moonlight inscriptions pair with The Between's seam-sight; tri-mode via the shadow rows).

TIER 3 COMPLETE: ALL 22 TIER 3 GAMES NOW HOLD MASTER CASTS (22/22). TIERS 1, 2, AND 3 ALL CLOSED. The arcade owes 5 games (Tier 4). The Owl-judge's name gate stands open (later closed: Judge Tootenkowl, 2026-09-11).

**THE TWENTY-SECOND CAST PARCEL (2026-09-11, forty-sixth paint  TIER 4 BEGINS, four-game parcel):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| GIANT'S CAUSEWAY | the plucky puffin hopper with knapsack in 6 poses + the accurate hexagonal basalt prism tiles (plain / mid-change glowing edge / fully-changed / cracked) + the gentle hazards (kelp wisp, sand puck) + the life-ring fall recovery + the basalt shard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/5a63ca330_generated_image.png |
| NAZCA LINES | the line steward with the feather-light stylus wand in 4 poses + the real geoglyphs half-finished with glowing trace completion (hummingbird, monkey, spider, condor) + the rhythm rings + the burrowing owl spectator + the sodalite with royal blue veins | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7a2b2a597_generated_image.png |
| STONE FOREST | the wiry Yunnan driller in straw rain cape in 5 poses + the accurate Shilin karst pillar layers + the air system (glowing air-pocket crystal, gourd canister, soft low-air glow) + the notch-count depth markers + the shoushan stone | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/871d8af43_generated_image.png |
| VICTORIA FALLS | the calm river guide with push-pole in 3 poses + the river-stone merge tiers (pebble > cobble > boulder > the monarch stone) + the golden joining bloom + the raft-frame board floating at the falls' edge + the moonbow tile (Victoria Falls' real night rainbow) + the kingfisher + the tiger's eye at full chatoyance | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/23642adae_generated_image.png |

Class: CYCLE cast masters (1024px, for the crunch line)  Zone home: the Arcade (Tier 4) + Giant's Causeway + Nazca + Shilin + Victoria Falls  Product home: the Arcade cards + the Godot builds  Source: original generation (the puffin is the Causeway's real resident; the geoglyphs are the actual Nazca figures traced as gameplay; the karst pillars are Shilin's true geology; the moonbow is Victoria Falls' real night phenomenon  the science is the lesson; tri-mode via the shadow rows). NOTE: 4 GAMES REMAIN (3 Legendary world-builds + The World Walker).

**THE TWENTY-THIRD CAST PARCEL (2026-09-11, forty-seventh paint  THE ARCADE RACK CLOSED):**
| Game | Cast sheet (CYCLE-class master) | URL |
|------|-------------------------------|-----|
| THE WORLD WALKER | the patched traveler in the six-fabric cloak in 6 poses + the world map with dotted walking routes + the journey-charm power-ups (river-strider sandals, storm-turn pin, second-wind lantern) + the checkpoint flag posts + the stowaway mouse + the rainbow stone holding all zone colors at once | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/5d384594c_generated_image.png |
| FAERIE KINGDOM (Legendary MMO) | FOUNDING CAST: the Seelie courtier (moth-wing cloak) + the Unseelie courtier (crow-feather mantle, grave and courteous) + all six realm vignettes (Threshold, Summerlands, Hollow, Between, Crystal Gardens, Stone Circle Chamber) + the portal ring + the goblin trader and hob helper + the labradorite at full flash | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/df70c6ffb_generated_image.png |
| HOLLOW EARTH (Legendary RPG) | FOUNDING CAST: the delver hero in crystal-lens goggles + three of nine district elders (gem-cutter magistrate, root-bridge engineer, deep-song archivist) + the city vignettes (geode plaza, root-bridge, luminescent spires, Deep Harbor) + the quest glyph set + the cave companion + the Source Stone, banded and self-lit | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/88d1967a2_generated_image.png |
| OPEN WORLD ADVENTURE (Legendary, the frequency world) | FOUNDING CAST: the wanderer (original design) in 6 poses + the SAME wanderer in shadow-frequency with violet rim light + the shift-mid tile (half gold, half violet) + every location tile in BOTH frequency states + the multi-gem prism + the small stone friend | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/e9ba7b937_generated_image.png |

Class: CYCLE cast masters (1024px) — THE THREE LEGENDARIES ARE FOUNDING CASTS, not finished productions: each world (the Fae Kingdom's six realms, Hollow Earth's nine districts, the frequency world's every-zone map) is a world-scale production that grows from these tone masters. The World Walker's cast is complete.  Zone home: the Arcade (Tier 4) + all zones  Product home: the Arcade cards + the Godot builds + the three world productions  Source: original generation (the frequency law painted into the Open World sheet  same forms, two moods, never harsh; the courts cast warm and courteous on both sides of the light; tri-mode via the shadow rows). 

THE ARCADE BUILD SHEET RACK IS CLOSED: ALL 83 BUILD SHEETS NOW HOLD CASTS (30 Tier 1 + 23 Tier 2 + 22 Tier 3 + 8 Tier 4). The arcade owes NO uncast games. The three Legendary worlds continue as world-scale productions (the Fae Kingdom's deeper room art was already the queued next front). THE OWL-JUDGE'S NAME GATE IS CLOSED: Judge Tootenkowl (Krista, 2026-09-11).

**THE NAMING RULING (2026-09-11, Krista  the last open arcade gate, closed):**
| Character | Name | Notes |
|-----------|------|-------|
| THE OWL-HEADED JUDGE (the frog-transformation moderation game) | **JUDGE TOOTENKOWL** | Krista's ruling, exact spelling. The Tutankhamun pun  the pharaoh of the frog court, the judge of the three-transforms law. The frog court's seat is filled. Distinct from THE OWL (the bloodline witness)  the judge judges; the witness watches. |

## THE BLUE BOX — RE-BOARDED (2026-09-11, Krista's recall: "the Daleks were being turds again")
| Panel | Cast | URL |
|-------|------|-----|
| THE BLUE BOX (ENV presence, the alcove) | the 1963 navy police box in the recessed stone alcove between alchemical stages, brass lamp mid-blink at 50 BPM, warm amber, the shadow falling from a sky that isn't there — torchlit Staircase, easy to walk past | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/f5983a62d_generated_image.png |

Class: ENV presence master  Zone home: Level 6 the Staircase (the unmarked alcove between the alchemical stages  the in-between section of the in-between level, exactly where a TARDIS belongs)  Product home: the web beta's staircase screens (the alcove the player walks past)  Source: original generation (spec unchanged from 2026-09-02: the blink synced to the Inn's global 50 BPM clock  NOW THE SPIRAL THRUM's resting resolution, the heartbeat made visible; the wrong shadow held as the first clue; the sign's three added letters at maximum zoom only; no NPC explains the box, no document explains the box, the Adequacy Law's own guest). STATUS: the box never left canon  the Sept 2 spec survived the Dalek raid whole; what dematerialized was the PAPERWORK (no Blueprint row, no ledger panel, no walkthrough mention after the September rebuild). Re-boarded 2026-09-11: Blueprint row restored, panel painted and logged, the alcove marked as canon-held. The box is there. The box blinks. That's all anyone knows.

## THE POSTMASTER — THE FACE OF THE POST (2026-09-11 evening, panel painted)
| Panel | Cast | URL |
|-------|------|-----|
| THE POSTMASTER (CHAR presence master) | the rubber-hose skeleton mid-soft-shoe, top hat tilted, sine-soft amber eye-lights, one gloved finger striking the ribcage of a docked bone mail cart (the xylophone dispatch, tone-sparks warm), the polite queue of containers waiting behind  the Bone Room dock | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/849fb8760_generated_image.png |

Class: CHAR presence master  Character: THE POSTMASTER (the Inn Post's face; title-is-name)  Zone home: the Bone Room dock (the quiet room's neighbor)  Product home: the web beta's post surface + the Inn Post quest art  Source: original generation (the 1929 Skeleton Dance register held: rubber-hose line, round skull, friendly permanent grin, weightless bounce  cute/unscary, the Whimsical-Macabre's great-grandparent; the xylophone dispatch painted as the pose  the tap IS the route tone; Steady Light held on the eye-lights, amber 590-620nm; the dispatch IS choreography held  mid-soft-shoe, not standing; the container queue holds the Cuteness Law  polite, waiting, never blocking. Style/era reference only per the reference-blueprint law  all assets original, no Disney designs borrowed). The shelved mail system is now FULLY EMPLOYED AND PAINTED: crews, franchise, philosophy, and the face.

## THE FAE INTERIOR CATCH-UP — PARCEL 1: THE THRESHOLD'S KIT (2026-09-11 evening)
| Panel | Cast | URL |
|-------|------|-----|
| THE LEANING STONES (option view) | the pass-through: two leaning stones sharing a secret, worn triple spirals, the offerings at the bases (pebble, grass ring, shell), honeyed shimmer beyond | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/1179f54db_generated_image.png |
| THE DOOR THAT WAITS (option view) | the respectful door: the rounded hillside door, worn-smooth step, brass knob's faint amber, the spiral over the lintel  closed, patient, unforced | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/3feb3a1f2_generated_image.png |
| THE HONEYED PATH (ENV fill) | the shimmer road: pale worn stone path through mossy ground, amber-gold light ribbons and motes, crystal shards at the edges, the hills' soft gold-green | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/80593e9b9_generated_image.png |
| THE THRESHOLD, SHADOW STATE (84Hz) | the same gateway in the winter frequency: silver-blue moonlight, frost lace on the spirals, low silver mist, steady low-contrast light  the same place listening instead of speaking | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/b05e37c87_generated_image.png |

Class: ZONE/ENV kit masters (KIT-Z fills)  Zone home: the Fae Threshold (the Kingdom's entry)  Product home: the web beta's Threshold screen (CYOA option views) + tri-mode  Source: original generation (Rackham's ink-and-watercolor held throughout; the respectful-door law painted as the closed waiting door, not a demand; Steady Light held on every glow; the shadow state dignified silver-blue per the Hollow's dark-beauty law, never dread; the offerings family at the stone bases  the token family's threshold register). NOTE: PARCEL 1 of the FAE INTERIOR CATCH-UP. The kit math: six rooms, ~50 masters owed across option views + tri-mode + props + ENV. Parcel order: Threshold (DONE) -> Summerlands' doors -> the Hollow's doors -> the Crystal Gardens -> the Stone Circle Chamber.

## THE FAE INTERIOR CATCH-UP — PARCEL 2: THE SUMMERLANDS' DOORS (2026-09-11 evening)
| Panel | Cast | URL |
|-------|------|-----|
| THE AMBER THRONE (option view) | Oleander's throne room: the living oak-and-amber throne, resin jewels warm along the arms, the empty welcoming seat  the court where the king listens | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/af7b6d18e_generated_image.png |
| THE RIDDLE CIRCLES (option view) | three mossy stone circles, worn spirals, the golden leaf-tokens, threads of amber thought-light between them  the riddle game, true and friendly-stakes | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/d033a75db_generated_image.png |
| THE OAK DOORS (option view) | the three grown oak doors: the grand sun-carved arch, the child-sized smooth-knobbed door, the ivy-hidden one  choices that wait, never rush | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/35461a7ea_generated_image.png |
| THE SUMMERLANDS, SHADOW STATE (84Hz) | the riddle circles in silver-blue moonlight, frost-silver leaf edges, cool silver tokens, the silver thread still true  the same court listening | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/29aa018bd_generated_image.png |

Class: ZONE/ENV kit masters (KIT-Z fills)  Zone home: the Summerlands (the Seelie court, 42Hz golden)  Product home: the web beta's Summerlands screen (CYOA option views) + tri-mode  Source: original generation (Alan Lee's golden-green generous light held throughout  the court where the light is generous; the riddle law painted as invitation, never pressure; the empty throne WELCOMING  the listener-king's seat holds a place rather than a ruler, Oleander's law in wood; the child-sized oak door nods to the future; Steady Light on every glow; the shadow state silver-blue dignified per the Hollow's dark-beauty law). NOTE: PARCEL 2 of the FAE INTERIOR CATCH-UP. Remaining queue: (3) the Hollow's doors, (4) the Crystal Gardens, (5) the Stone Circle Chamber.

## THE FAE INTERIOR CATCH-UP — PARCEL 3: THE HOLLOW'S DOORS (2026-09-11 evening)
| Panel | Cast | URL |
|-------|------|-----|
| THE FROST THRONE (option view) | Malachi's throne room: the dark-branch and crystal-ice throne, hoarfrost fern-fronds on the arms, the empty dignified seat  the court where the king is heard | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/f9bab0328_generated_image.png |
| THE FROST GARDEN (option view) | winter grown as its own quiet plants: frost-fern beds on dark stone, icicle chimes, crystal-petaled flowers blooming through thin ice with faint inner glow | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7b3c49baa_generated_image.png |
| THE LABYRINTH ENTRANCE (option view) | the great knotwork arch, the designed corridor curving out of sight, the bench for those who pause  the sanctuary's front door, a love letter written in walls | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/33cb8800e_generated_image.png |
| THE HOLLOW, GOLD STATE (42Hz) | the frost garden with summer bleeding gently in: frost-ferns melting to moss at the edges, one amber sun-shaft, the silver-blue flower that keeps blooming anyway  the other half of the root, reaching in | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/c2efddabb_generated_image.png |

Class: ZONE/ENV kit masters (KIT-Z fills)  Zone home: the Hollow (the Unseelie court, 84Hz silver  its living state IS the shadow register; the tri-mode fill is the 42Hz gold bleed-through)  Product home: the web beta's Hollow screen (CYOA option views) + tri-mode  Source: original generation (John Bauer's Scandinavian winter linework held throughout; the Hollow's dark-beauty law held on every panel  dignified, never dread, low-contrast steady light; Malachi's architect law painted in the labyrinth entrance  designed, not menacing, the bench honoring hesitation; THE BOTH-KINGS symmetry held: Oleander's empty throne welcomes, Malachi's empty throne dignifies  the listener and the one who is heard; the gold state encodes the courts-were-never-opposites law at the frequency line). NOTE: PARCEL 3 of the FAE INTERIOR CATCH-UP. Remaining queue: (4) the Crystal Gardens, (5) the Stone Circle Chamber.

## THE FAE INTERIOR CATCH-UP — PARCEL 4: THE CRYSTAL GARDENS (2026-09-11 evening)
| Panel | Cast | URL |
|-------|------|-----|
| THE GRIFFIN'S PERCH (option view) | the centerpiece formation: half amber-warm, half silver-blue, balanced at the heart; the griffin at the crown in silhouette  neutrality as majesty | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/86661cb83_generated_image.png |
| THE PADDLE COURT (option view) | the Crystal Paddle's home: the court between the formations, the hexagonal beryl paddle mid-glide, the griffin's far watch  the game as meditation | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/d9b7bfb3e_generated_image.png |
| THE MOSSED ROOTS (ENV fill) | the quiet corner: velveted root-benches, small crystals sprouting from the hollows like garden flowers, drifting spores  the place to sit and be | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/0019d2f2c_generated_image.png |
| THE GARDENS, IN-BETWEEN STATE | the seam state: summer-warm and winter-cool exactly equal, the living light-seam down the garden's center, mist at the boundary  the held breath between two courts | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/1cde7945c_generated_image.png |

Class: ZONE/ENV kit masters (KIT-Z fills)  Zone home: the Crystal Gardens (the neutral ground, no court, no crown)  Product home: the web beta's Gardens screen (CYOA option views) + tri-mode  Source: original generation (the no-brother-wears-the-crown law held  the formation balanced, never throned; the Griffin distant and noble per the boss's mystery, the health-bar law never painted  the fight stays optional and unseen here; the beryl paddle rendered with true hexagonal crystallography  the science is the lesson; the mossed roots hold the Gathering Law's quiet seat  a place to be; no-outline cosmological linework on all crystal; Steady Light throughout; the in-between state encodes the seam law  the courts were never opposites, the Gardens are the proof). NOTE: PARCEL 4 of the FAE INTERIOR CATCH-UP. Remaining queue: (5) the Stone Circle Chamber  the Contract pedestal, the sealed chamber beneath, the twelve Preseli stones.

## THE FAE INTERIOR CATCH-UP — PARCEL 5: THE STONE CIRCLE CHAMBER (2026-09-11 evening  THE CATCH-UP IS CLOSED)
| Panel | Cast | URL |
|-------|------|-----|
| THE TWELVE PRESCELI STONES (option view) | the circle at near-silence: the braided hairline edge-glow, amber and silver together on every stone  the deepest tone barely visible, never spectacle | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/78846b35e_generated_image.png |
| THE GOLDEN CONTRACT (option view) | the pedestal and the glowing golden scroll, the gargoyle sigils ringing the base as signatures  the Song is carried, not owned | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/44127962f_generated_image.png |
| THE SEALED CHAMBER BENEATH (option view) | the floor seal: twelve keystone segments, the once-per-beat whisper-pulse of hairline light, the door rendered unopened  the keeping is the seeing | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/dbaaf61d1_generated_image.png |
| THE BRAIDED TONE (moment panel) | the deepest tone sounded: six gold ribbons and six silver ribbons rising from the stones, weaving into one braided double-helix of light overhead  the courts heard as what they always were | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/46b8be76f_generated_image.png |

Class: ZONE/ENV kit masters (KIT-Z fills) + one moment master  Zone home: the Stone Circle Chamber (the deepest point; 42Hz + 84Hz braided)  Product home: the web beta's deepest-chamber screen (CYOA option views) + the both-chains-completion moment art  Source: original generation (THE DEEPEST TONE law held  near-silence, the faintest edge-glow, never spectacle; the Golden Contract painted as the sovereignty philosophy made object  carried, not owned; the gargoyle signatures honored in the pedestal ring; THE UNOPENED DOOR law held in the sealed chamber  the Valhalla/Qin family, the keeping is the seeing, the once-per-beat pulse rendered at whisper-strength per Steady Light; the Braided Tone is the D07 lesson painted  the courts were never opposites, they were harmony; the tessellation heard unbroken). NOTE: PARCEL 5 of 5  THE FAE INTERIOR CATCH-UP IS CLOSED. All six rooms now hold showcase wides + option views + tri-mode states. The Fae Kingdom's interior art is CAUGHT UP: what remains fae-side is only quest-scene panels if Krista calls them, plus the sprite crunch line.

## THE LEGENDARY PRODUCTION, PARCEL 1: THE OPEN WORLD'S WORLD-MAP FAMILY WIDES (2026-09-11 night)
| Panel | Cast | URL |
|-------|------|-----|
| THE CELTIC HIGHLANDS (establishing wide) | the Moorlands: emerald hills, worn spiral stones, THE BARD'S BENCH (quill and inkpot, the seat worn smooth  the masterpiece that never needed finishing), the scriptorium tower's one amber window, gold knotwork in the mist | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7abebd326_generated_image.png |
| THE TRANSYLVANIAN FOREST (establishing wide) | the Owl Zone: Friedrich's moonlit spruce forest, the ivy-wrapped arch, the barn owl silhouetted on the high branch  watchful stillness, never dread; the owl sees you and lets you pass | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7a028a71a_generated_image.png |
| THE NORSE COAST (establishing wide) | the Aurora Thesis: the fjord, the knarr at the dock, the rune-guestbook stones, and the aurora as a cathedral you can walk inside  the sky as a room, the oldest light leaning down to greet you | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/d9b244bb0_generated_image.png |
| THE STONE CIRCLES (establishing wide) | the Instrument Zone: the lithophonic bluestone circle at dusk, the concentric tone-ripples where the light touches, the heel-stone outlier, the avenue leading away  a lithophone you can stand inside | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/f2a55ab72_generated_image.png |

Class: ZONE/ENV establishing wides  THE LEGENDARY PRODUCTION, front one: THE OPEN WORLD (the frequency world game  its location tiles ARE the world-map zones; every zone paints in BOTH frequency states). Zone home: the world map (the surface axis; the Open World's founding cast grows into the full production)  Product home: the web beta's world-map screens + the Open World's location tiles  Source: original generation (each zone's spec canon held: the Bard's bench painted early per the Blueprint flag; Friedrich held for the forest WITHOUT dread  the Owl Zone's watchful-stillness law; the Aurora Thesis painted as walkable chamber, Munch's palette, Steady Light held on the aurora's billow (no strobing  the aurora is the sky's candlelight); the Stone Circles' lithophonic law made visible in gentle tone-ripples  the science is the lesson). NOTE: PARCEL 1 of THE LEGENDARY PRODUCTION. The plan: (a) the Open World's world-map family  four wides DONE, frequency-state pairs + kit fills next; (b) Hollow Earth's districts (the elders + the remaining district vignettes); (c) the Fae Kingdom MMO's world-art stands CAUGHT UP (the six realms = the production, tonight's five parcels).

## THE LEGENDARY PRODUCTION, PARCEL 2: THE OPEN WORLD'S FREQUENCY-STATE PAIRS (2026-09-11 night)
| Panel | Cast | URL |
|-------|------|-----|
| THE CELTIC HIGHLANDS, VIOLET STATE | the same moorlands in indigo-violet dusk, the bench unchanged, the tower's window violet, the knotwork threads silver-violet | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/49bc7c838_generated_image.png |
| THE TRANSYLVANIAN FOREST, VIOLET STATE | the same forest at the frequency where seeing stops: violet mist, the owl's violet-rimmed wings, still watching, still letting you pass | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/7e3259fe4_generated_image.png |
| THE NORSE COAST, VIOLET STATE | the aurora's violet phase: magenta-violet ribbons with teal threads, the mast rimmed violet, the rune-guestbook glowing  the chamber of light in its other voice | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/99df2f478_generated_image.png |
| THE STONE CIRCLES, VIOLET STATE | the lithophone's other mood: violet-rimmed stones, violet tone-ripples, the deep magenta horizon band  the instrument zone tuned to where seeing stops | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/6862199ac_generated_image.png |

Class: ZONE/ENV tri-mode masters (the Open World's frequency law: same forms, two moods, never harsh)  Zone home: the world map's four new zones  Product home: the Open World's location tiles (every zone in BOTH frequency states, per the founding cast) + the web beta's tri-mode  Source: original generation (THE FREQUENCY LAW HELD AS PAINTED: identical compositions re-rendered in the violet register  the 84Hz window law family, the frequency where seeing stops; every rim glow steady and sine-soft; the aurora's violet phase kept as the walk-in chamber, Munch's palette deepened not darkened; the owl keeps the letting-you-pass law in both moods; the lithophone ripples the same gentle ripples, re-voiced). NOTE: PARCEL 2 of THE LEGENDARY PRODUCTION  the four world-map zones now hold BOTH frequency states. Remaining on the Open World front: kit fills (option views, props, ENV) per zone; then Hollow Earth's districts.

## CONVENTION CHANGE — THE ZONE IMAGE SESSION CANON (Krista's ruling, 2026-09-11 night)
CANON: all zone image sessions now run on THE KIT (the Room Kit Law made the session format): a session opens by reading the zone's kit row, paints toward the full kit in parcels (wide + both frequency states + option views + props + ENV, + portrait/cycle for inhabited rooms, + sprites for game rooms), and closes with one Ledger entry that names what remains. No zone leaves a session half-kitted silently  the Blueprint row updates at every session close (the stale-table problem solved by rule). The REC LAW holds inside sessions (masters first, variants after). Ruled by Krista after the Fae interior catch-up and the world-map parcels both ran this way: "Kit fills should be a canon for all zone image sessions, it would simplify things immensely." It is now.

## CONVENTION CHANGE  THE CRITTER LINE / KIT-C (Krista's call, 2026-09-11 night)
CANON: the zone kit gains KIT-C (the critter line)  every zone's kit includes its critter census from the Critter Roster master spec, painted as one CLASS MASTER per species per the REC LAW (individuals are recolors). Named-collective residents (murlocs, brownies, fizgigs, goblins, the bone crew) follow the same route. ALREADY-PAINTED classes (the murloc census, the brownie roundup, the fizgig group, the goblin census, the bone crew, Pluck, Bob, the fizgig Wire Nook defense) count as DONE and are never re-painted. The session canon gains rule 6: no zone is called caught up with its residents unpainted  the room without its critters is a stage set, not a home. The canon conformance pass ran the same night: the Blueprint rows are current as of the Fae catch-up and the world-map parcels; the ranked canon session queue is the Blueprint's queue (the world-map four's kit fills first, then Hollow Earth's districts under the full kit + KIT-C).

## CONVENTION CHANGE  THE SPECIES LAW (Krista's ruling, 2026-09-11 night)
CANON: the Critter Roster (KIT-C) is the Gemstone Egg Economy's species index  every zone's egg pool draws its pets from that zone's critter census. One census, two jobs: ambient life + hatchable pets; the wild is the preview. The REC law carries: one class master per species serves both (no second paint line). The Zoologist's Long Study of the wild census is the study of the pet line itself. Written into both specs (the Egg Economy's Hatch Law + the Critter Roster's header) and pushed. The community Hatchery's content line stays separate (retired characters, the vote).

## THE CELTIC HIGHLANDS SESSION — THE FIRST FULL-CANON SESSION (2026-09-11 night  THE KIT IS CLOSED)
| Panel | Cast | URL |
|-------|------|-----|
| THE IN-BETWEEN STATE (tri-mode) | the seam: half gold dusk, half violet, the living line through the stones, the bench at the balance point | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/e919e9bb5_generated_image.png |
| THE SCRIPTORIUM (option view) | Kubrick's single axis: one desk, one shaft of window light, the Book open to the unfinished carpet page  the blank spaces radiant, the masterpiece that never needed finishing | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/bb64473ef_generated_image.png |
| THE BARD'S BENCH (option view) | the master class: the Bard turning the page, the visitor learning beside, the seat worn smooth  no grades, only the turning  v2 (repainted 2026-09-11: v1 carried a mythology glitch  the storyteller rendered with three hands; v2 corrected to proper anatomy, hands counted) | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/6b37c2e08_generated_image.png |
| THE SCRIPTORIUM PROPS (PROP set) | the quill, the iron-gall inkpot, the gold-leaf + burnisher, the psalter, the unfinished carpet page, the mist-woven satchel  the margin made an arrangement | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/d37769585_generated_image.png |
| THE MOOR'S AMBIENCE (ENV fill) | the mist lying in gold-leaf layers, heather in manuscript pigments, the horizon's interlace border, the bog pools like inkwells  the world as illumination | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/d5b6a70ab_generated_image.png |
| THE MOORLAND CRITTERS (KIT-C class masters) | the census painted: Heather Hare, Bog Wisp, Ink-Starling, Bog-Oak Beetle, Mist Sheep, the Limner's Wren  the Insular margin made alive; per the Species Law, the zone's egg pool | https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/e89c97303_generated_image.png |

Class: ZONE/ENV kit masters + KIT-C class-master sheet  Zone home: the Celtic Highlands (the Moorlands, the world-map family)  Product home: the web beta's zone screen + the Open World's location tiles + the Gemstone Egg Economy's Highland pool  Source: original generation (THE FIRST SESSION RUN ENTIRELY ON THE CANON: kit row read, full kit painted in two parcels, census extended, ledger closed). Canon notes: the manuscript-is-the-artist law held (all six panels in the Insular hand); the unfinished carpet page painted as rest, never failure; the Bard's features softened, presence through posture; the Limner played straight, never explained (the wren is the only evidence); the six critters logged in the roster spec as the world-map census's opening section + the Highland egg pool (the wren gated behind the Missing Folio). REMAINING KIT SLOTS: none  the Celtic Highlands is CAUGHT UP (wide, shadow, in-between, option views, props, ENV, KIT-C). The Bard's class portrait stands from the Main Floor census per the REC law (a scriptorium-posting variant, if ever wanted, is a recolor  not a new master). NEXT CANON SESSIONS: the Transylvanian Forest, the Norse Coast, the Stone Circles (same kit shape), then Hollow Earth's districts.

## CANON ENTRY  THE LIMNER, THREE-HANDED (Krista's ruling, 2026-09-11 night)
THE GLITCH IS CANON: the Bard's Bench v1 (3f0803fbb  the storyteller with three hands) is NOT discarded  it is THE LIMNER'S ONLY TRUE PORTRAIT, kept forever. The clean v2 (6b37c2e08) remains the zone's master for general use; the three-handed v1 is the Limner's register, deployed per the Del Toro law: rare appearances, always three hands, always gentle, never explained; the spotter receives the quiet margin note ("You saw. The page turns anyway."). The Scriptorium displays the kept panel as the anonymous guild's family portrait  the first INTENTIONALLY unfinished design in the Hall of Unfinished Designs. THE THIRD HAND'S JOB (canon): one hand holds the page, one hand holds the pen, the third turns the page the world has not finished. The Limner gate in the Highlands spec is CLOSED.
