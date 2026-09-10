# BUILDER SYNC — THE SILK ROAD: THE FLAGSHIP CORRIDOR WIRES INTO THE WEB BETA
## Priority: HIGH — the corridor is art-complete with 28 committed assets and public URLs; this wires it after the parks batch
## Status: Awaiting Krista's approval

---

The Silk Road is the Inn's flagship corridor: a trade road through fae-canopy territory with five routes, five cultural destination platforms, a Ley Line energy network of 12 real-world sacred sites, and a caravan expedition system. Everything below is art-complete (28 assets at docs/gallery/silk_road/, all with public URLs in the manifest at docs/gallery/geode_inn_complete_urls.md — search "silk_road"). Master spec: docs/zone_specs/geode_inn_silk_road_master_spec.md.

## TIER 1 — ZONE REGISTRATION + THE HUB (build now)

### 1. Zone entry: THE SILK ROAD (hub)
Register as an explorable zone + hub page. Card badges: TRADE ROUTE + LEY NETWORK. Entry from the world map as a corridor system (not a single pin — the hub anchors it, routes extend from it).

### 2. The hub in tri-mode (all three states painted, all three URLs live)
| State | Asset | What It Is |
|-------|-------|-----------|
| Living (42Hz) | `hub_living.png` | The postcard trade road — Rackham canopy, Bierstadt light, the market hum |
| Shadow (84Hz) | `hub_shadow.png` | The corridor's TRUE state — the frequency visible, the ley threads readable |
| In-Between (Echo) | `hub_echo.png` | Grey Rackham — the canopy without its color; the desaturated Echo protocol |

TWO WIRING LAWS (canon, do not adapt):
- **The tectonic shift:** tri-mode transitions are HARD CUTS, not crossfades (the Tool law: fusion, not layering).
- **The desaturation protocol:** Echo states use the committed `*_echo.png` assets as-is — no runtime filtering. The grey was painted, not processed.

## TIER 2 — THE FIVE ROUTES + CARAVAN + ENCOUNTERS

### 3. Route travel screens (5 routes, each with Living + Echo state)
| Route | Assets | Difficulty Flavor |
|-------|--------|------------------|
| The Amber Road | `amber_road.png` + `_echo` | Baltic trade, amber light through canopy |
| The Salt Road | `salt_road.png` + `_echo` | White flats, horizon shimmer |
| The Spice Road | `spice_road.png` + `_echo` | Warm saturation, market scents |
| The Jade Road | `jade_road.png` + `_echo` | Mist-green, carved stone |
| The Obsidian Road | `obsidian_road.png` + `_echo` | Black glass, the hardest road |

WIRING LAW — **storm-rift-crystal-glow:** Very Hard route segments render with the official canon aesthetic: storm-sky rift lighting, crystal luminescence from below, glow through the canopy. This is the corridor's Very Hard standard (canon, 2026-09-10).

### 4. The caravan
Asset: `caravan.png` (the fizgig-pulled cart). Wire as the player's transport through route screens — the movement system tie: the caravan is the ONLY vehicle in the Inn's movement manifest (Tier 2 external). Idle animation: the flip-book pipeline (movement cycle wiring spec).

### 5. The roadside shrine + the bandits
- `shrine.png` — the roadside offering shrine (Klimt offering-glow): wire as a rest-stop interaction node on every route (offerings tie to the Stone-Compass charging loop, master spec §Stone Charging).
- `bandit.png` + `bandit_echo.png` — the Gorey-style bandits: encounter art for the road events (master spec §Encounter Types).

## TIER 3 — PLATFORMS + THE LEY NETWORK + THE HINGE

### 6. The five cultural destination platforms (each a route's terminus, Living + Echo)
| Platform | Assets | Artist Hand | Route |
|----------|--------|-------------|-------|
| The Egyptian Platform | `platform_egyptian.png` + `_echo` | O'Keeffe | The Obsidian Road's cousin... |
| The Southeast Asian Platform | `platform_se_asian.png` + `_echo` | Hokusai | The Spice Road |
| The Celtic Platform | `platform_celtic.png` + `_echo` | Alan Lee | The Jade Road |
| The Andean Platform | `platform_andean.png` + `_echo` | Bierstadt | — |
| The Mesoamerican Platform | `platform_mesoamerican.png` + `_echo` | (spec §Artist Style Assignments) | — |

Route→platform mapping: confirm against master spec §The 5 Silk Road Routes before wiring (the routes' destinations are listed there — do not guess from names).

Each platform renders: market stalls, rare stone vendor, caravan master with route map, ley node shrine (all painted in-scene).

### 7. The Ley Line Vision overlay
Asset: `leymap.png` (Monet-style nodes). THE WIRE: Ley Line Vision is NOT a map mode — it's a VISION the player gains (master spec §Ley Line Vision): a translucent overlay on the world map showing the 12 primary nodes as Monet threads. The 12 nodes and their frequency signatures are in master spec §12 Primary Ley Line Nodes (Stonehenge 42Hz, Giza 111Hz, Uluru 7.83Hz, Machu Picchu 42Hz harmonic, Angkor 50 BPM, Chichen Itza 42Hz rhythmic, Easter Island subsonic, **Mount Shasta 84Hz**, Newgrange 42Hz spiral, Göbekli Tepe subsonic, Borobudur 42Hz mandala, Sedona variable).

### 8. The hinge (Mount Shasta tie — build the WIRE, the park chain wires separately)
Node #8 (Mount Shasta, 84Hz) is the corridor's ONLY 84Hz stop and the Inn's first hinge zone (dual citizenship: the Silk Road + the Modern Legends Nook — canon, ruled 2026-09-10). WIRE: the Silk Road's Shadow state and Shasta's Shadow state share the 84Hz tone — the same frequency constant, so a player who has walked the corridor in Shadow arrives at Shasta already fluent. The parks sync spec (parks_builder_sync.md) covers the Shasta zone build; this spec only requires the shared frequency constant between the two systems.

## WHAT NOT TO BUILD YET

- Nothing in this spec is canon-gated — all content rulings are already Krista-confirmed (artist hands, the storm-rift-crystal-glow standard, the tectonic shift law, the Shasta hinge). Build all three tiers as written.
- The caravan game's full loop (stats, progression) is master-spec territory for the fizgigs' own build order — this spec wires the corridor's PRESENCE (screens, states, travel, platforms); the expedition gameplay layers on when the caravan game is scheduled.
