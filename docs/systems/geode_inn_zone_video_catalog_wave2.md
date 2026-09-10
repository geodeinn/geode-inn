# Geode Inn — Zone Video Clip Catalog (Wave 2)
**Date:** 2026-08-21
**Total clips:** 26 (plus 15 catacomb clips from Wave 1 = 41 total)
**Source:** Morphic-generated environment videos
**Epilepsy safety:** Passed visual review by Krista (no triggers detected in motion)
**Status:** Approved as visual reference for Godot scene implementation

---

## Upstairs / Cosmology (4 clips)

| Clip | Godot Scene | Visual Notes | Palette |
|------|------------|--------------|---------|
| zone_up_allfathers_throne.mp4 | AllfathersThrone | Deep blue space, gold throne light, ancient and vast feeling | Cold blue + warm gold |
| zone_up_planet_chamber.mp4 | PlanetChamber | Planetary visualization chamber | Dark + celestial glow |
| zone_up_cosmology_mural.mp4 | CosmologyMural | Wall mural depicting cosmic creation myth | Multi-tone fresco |
| zone_up_ascension_canopy.mp4 | AscensionCanopy | Upward view through the tree toward stars | Green canopy + starlight |

## Main Floor (4 clips)

| Clip | Godot Scene | Visual Notes | Palette |
|------|------------|--------------|---------|
| zone_mf_central_hearth.mp4 | CentralHearth | Warm amber glow, social gathering space, hobbit-hole warmth | Hot amber + warm gold |
| zone_mf_artisan_market.mp4 | ArtisanMarket | Market stalls with jewelry and crafts on display | Warm amber + candlelight |
| zone_mf_modern_legends.mp4 | ModernLegendsNook | Cozy reading nook for modern folklore | Warm amber + soft lamp |
| zone_mf_modern_religions.mp4 | ModernReligionsLibrary | Library shelves for world religion texts | Warm wood + parchment |

## Staircase / Alchemy (3 clips)

| Clip | Godot Scene | Visual Notes | Palette |
|------|------------|--------------|---------|
| zone_st_alchemical_landing.mp4 | AlchemicalLanding | Landing at the base of the staircase | Warm amber transitioning |
| zone_st_alembic_window.mp4 | AlembicWindow | Alchemical apparatus and transformation window | Glass + green glow |
| zone_st_transformation.mp4 | Transformation | Sage-green glow, rune pulse, matter changing state | Sage green + runic light |

## Fae Kingdom (6 clips)

| Clip | Godot Scene | Visual Notes | Palette |
|------|------------|--------------|---------|
| zone_fae_threshold.mp4 | CrossingThreshold | Entry portal to the Fae realm | Transitional glow |
| zone_fae_summerlands.mp4 | Summerlands | Golden eternal summer, Seelie Court territory | Honey gold + warm green |
| zone_fae_hollow.mp4 | TheHollow | Dark, winter, Unseelie Court territory | Shadow + ice blue |
| zone_fae_the_between.mp4 | TheBetween | Shifting borderlands between courts | Mixed/transitioning tones |
| zone_fae_crystal_gardens.mp4 | CrystalGardens | Neutral zone, crystal formations, Griffin boss arena | Crystal refraction |
| zone_fae_stone_circle.mp4 | StoneCircleChamber | Deepest point of the Fae realm | Deep earth tones |

## World Map Regions (8 clips)

| Clip | Godot Scene | Visual Notes | Palette |
|------|------------|--------------|---------|
| zone_wm_parchment_world.mp4 | ParchmentWorld | Aged parchment fantasy world map overview | Sepia + parchment |
| zone_wm_celtic_highlands.mp4 | CelticHighlands | Green rolling hills, stone circles | Emerald green + stone |
| zone_wm_egyptian_desert.mp4 | EgyptianDesert | Desert sands, ancient structures | Gold + sand + blue sky |
| zone_wm_andean_highlands.mp4 | AndeanHighlands | Mountain terrain, Incan stonework | Stone + mountain mist |
| zone_wm_norse_coast.mp4 | NorseCoast | Coastal cliffs, longhouse silhouettes | Cold blue + grey sea |
| zone_wm_transylvanian_forest.mp4 | TransylvanianForest | Moonlit forest, mist, deep atmosphere — Romania section | Silver-green moonlight + dark mist |
| zone_wm_stonehenge.mp4 | Stonehenge | Standing stones, portal activation site | Grey stone + sky |
| zone_wm_japanese_temple.mp4 | JapaneseMountainTemple | Cherry blossoms, serene temple, diffused light | Pink + soft grey-green |

## Special (1 clip)

| Clip | Godot Scene | Visual Notes | Palette |
|------|------------|--------------|---------|
| zone_origin_story.mp4 | (Narrative spine intro) | Abstract/cosmic feel, distinct from zone environments | Cosmic/abstract |

---

## Design Observations

### Palette Consistency
All zones share a warm-amber base palette but each has a distinct temperature:
- **Hot zones:** Central Hearth (amber), Artisan Market (candlelight), Summerlands (honey gold)
- **Cold zones:** Allfather's Throne (deep blue), Norse Coast (cold grey-blue), The Hollow (ice)
- **Green zones:** Transformation (sage), Celtic Highlands (emerald), Transylvanian Forest (silver-green)
- **Neutral zones:** Parchment World (sepia), Stonehenge (grey stone), Japanese Temple (soft)

### Epilepsy Safety
All 26 clips passed Krista's visual review with no triggers detected in motion. Sine-clamping will still be applied to any pulsing/oscillating lights in Godot as a safety measure for other players.

### Zone Identity
Each zone feels like a room in the same building, not a copy. The temperature shift between zones creates natural navigation cues — players can feel where they are by the light quality.
