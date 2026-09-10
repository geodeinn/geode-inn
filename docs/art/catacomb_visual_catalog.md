# Geode Inn — Catacomb Video Asset Catalog
**Generated:** 2026-08-20
**Source:** Morphic AI video generation → Google Drive → frame extraction
**Total clips on Drive:** 15 (but variation pairs are identical — 8 unique environments)

---

## Clip 1: catacombs_1-1 (5s) — The Tunnel Approach
**Prompt:** Ancient stone tunnel, arched ceiling, warm lanterns, mist, teal shadows

**Visual Analysis:**
- **Composition:** Vanishing-point perspective down a stone-lined arched tunnel
- **Lighting:** Warm amber lanterns (#F5B041–#F8D59A) against cool teal ambient (#0F1A1A–#3B5B65)
- **Atmosphere:** Soft hazy mist, gentle depth fade, non-flickering constant light
- **Textures:** Mossy wet stone, reflective damp floor catching lantern glow
- **Epilepsy-safe rating:** ✅ Excellent — no strobing, no rapid cuts, constant light
- **Best for:** Entry corridor, looping ambient background, loading screen atmosphere

**Godot Translation Notes:**
- Light2D nodes: amber #F5B041, radius 200px, energy 0.8
- CanvasModulate: #1A2A2A (teal-tinted darkness)
- CPUParticles2D: mist (slow upward drift, low alpha)
- Shader: wet floor reflection via back_buffer_copy + mirror shader

---

## Clip 2: catacombs_2-1 (5s) — The Alcove Corridor
**Prompt:** Curved corridor with recessed alcoves, glowing blue runes, warm torches

**Visual Analysis:**
- **Composition:** Curved corridor with recessed rectangular alcoves on both sides
- **Lighting:** Warm torchlight on walls/ceiling (#FFC56E) + cool blue/cyan runes near floor (#64FDFD)
- **Details:** Alcoves contain pottery/vases, lit with cool blue interior light (#AEEEEE)
- **Textures:** Weathered stone, moss near blue rune markers, worn paving slabs
- **Epilepsy-safe rating:** ✅ Good — steady torchlight, gentle rune glow
- **Best for:** Transition hallway, display alcove system, artifact browsing corridor

**Godot Translation Notes:**
- PointLight2D for torches: #FFA500, texture flicker off
- PointLight2D for runes: #00FFFF, energy 0.5, pulse slow (0.5Hz)
- Alcove system: Y-sort layer for shelf sprites
- Interactable: examine pottery/scrolls in alcoves

---

## Clip 3: catacombs_3-1 (5s) — The Map Chamber
**Prompt:** Circular stone chamber with domed ceiling, central map table, glowing crystals

**Visual Analysis:**
- **Composition:** Eye-level view of circular domed chamber with central round table
- **Centerpiece:** Large stone table with relief world map (#D6CDB8 with #504E48 grid lines)
- **Lighting:** Overhead skylight spotlight on table + warm wall sconces (#FFB347) + turquoise crystals (#00E6FF)
- **Details:** Scroll shelves in alcoves, arched doorway to dim passage with green glow
- **Atmosphere:** High contrast warm/cool, cinematic focus on the map table
- **Epilepsy-safe rating:** ✅ Excellent — steady spot lighting, crystal glow constant
- **Best for:** World map navigation hub, quest planning room, crystal collection display

**Godot Translation Notes:**
- Central Light2D: #FFFFFF spotlight, cone texture, focused on table
- Crystal PointLight2D: #00E6FF, energy 0.6, gentle pulse 0.3Hz
- Table as interactive node: opens world map UI
- Dome ceiling: parallax background layer

---

## Clip 4: catacombs_4-1 (5s) — The Spiral Staircase
**Prompt:** Stone spiral staircase with glowing orange ember crystals, runic carvings

**Visual Analysis:**
- **Composition:** Curved internal staircase ascending from bottom right to upper center
- **Lighting:** Glowing ember-orange crystals embedded in walls (#FF9900, #CC6600)
- **Details:** Handrail carved with runic symbols/circular glyphs, light beige stone (#B9A89A–#D1C5B6)
- **Atmosphere:** Low moody lighting, orange glow as primary light source
- **Epilepsy-safe rating:** ✅ Good — steady ember glow, no flickering
- **Best for:** Transition between catacomb levels, alchemy staircase visual reference, vertical navigation

**Godot Translation Notes:**
- Crystal Light2D: #FF9900, energy 0.7, subtle pulse 0.2Hz
- Railing shader: glyph texture with emissive overlay
- Staircase movement: Tween-based camera pan upward
- Audio: ascending pitch as player climbs (matches music direction doc)

---

## Clip 5: catacombs_5-1 (5s) — The Geode Cave
**Prompt:** Dark cave with large glowing geode, water reflection, warm torch

**Visual Analysis:**
- **Composition:** Central large open geode as focal point in dark cave interior
- **Geode:** Interior glows cool blue-white (#AACCFF–#DDEEFF), exterior rough brown (#443322)
- **Lighting:** Geode as primary light source + warm torch right side (#FF9900) + secondary warm glow left
- **Details:** Smooth pebble floor (#C0BBAA), shallow water pool reflecting geode and torch
- **Atmosphere:** Mysterious, cinematic, high-contrast cool crystal vs warm fire
- **Epilepsy-safe rating:** ✅ Excellent — steady crystal glow, no flash
- **Best for:** Reward room, gem collection display, dragon's cave visualization

**Godot Translation Notes:**
- Geode Light2D: #AACCFF, energy 1.2, large radius
- Torch Light2D: #FF9900, energy 0.6
- Water: AnimatedSprite with reflection shader
- Reward system: geode fills with gem sprites as player collects stones
- Audio: chime per stone added (tone based on Mohs hardness — see music direction doc)

---

## Clip 6: catacombs_6-1 (10s) — The Serpent Hall
**Prompt:** Flooded hall with carved serpent/dragon columns, warm torches, glowing water

**Visual Analysis:**
- **Composition:** Symmetrical perspective down a hall lined with massive carved pillars
- **Centerpiece:** Pillars with relief carvings of serpent/dragon creatures winding around them
- **Lighting:** Warm iron torches on pillars (#FFB347–#E58E26) + cyan-blue glowing water from below (#00FFFF–#7FFFD4)
- **Details:** Flooded floor reflecting all light, dense fog over water surface
- **Atmosphere:** Grand, ominous but warm, deep depth into darkness
- **Epilepsy-safe rating:** ✅ Good — constant torches, steady underwater glow, slow fog drift
- **Duration bonus:** 10 seconds (longer than others) — better for looping
- **Best for:** Boss room approach, grand hall, dramatic reveal corridor

**Godot Translation Notes:**
- Pillar Light2D: #FFB347, energy 0.7, placed at intervals
- Water glow: CanvasModulate overlay #00CED1, energy 0.4
- Water surface: Shader with animated wave + reflection
- Fog: CPUParticles2D horizontal drift
- Serpent pillars: Sprite with normal map for relief carving effect

---

## Clip 7: catacombs_7-1 (10s) — The Egyptian Vault
**Prompt:** Stone burial chamber with hieroglyphic shelves, artifacts, oil lamps

**Visual Analysis:**
- **Composition:** Shallow angle looking down a corridor of stone-carved shelves
- **Centerpiece:** Recessed niches with carved hieroglyphic dividers, filled with artifacts
- **Artifacts:** Sculpted head, vessels, jars, bowls, figurines
- **Lighting:** Three oil lamps (#F4A460–#FFD700), warm golden-orange, deep shadows (#4A3B2D)
- **Textures:** Rough tan/beige sandstone (#C2A88D–#9D856A), heavy texture, matte finish
- **Atmosphere:** Warm, dusty, archaeological — feels like a real museum vault
- **Epilepsy-safe rating:** ✅ Excellent — steady lamp glow, no movement
- **Duration bonus:** 10 seconds
- **Best for:** Artifact display room, Egypt zone gallery, archaeology puzzle chamber

**Godot Translation Notes:**
- Lamp Light2D: #F4A460, energy 0.6, warm texture
- Shelf system: TileMap with custom hieroglyphic border tiles
- Artifact slots: Interactable nodes with examine UI
- Bokeh: DepthOfField shader on background shelves
- Audio: museum ambience, soft footstep echoes

---

## Clip 8: catacombs_8-1 (5s) — The Fae Portal
**Prompt:** Celtic knotwork archway with glowing portal, mushroom circle

**Visual Analysis:**
- **Composition:** Arched stone doorway with Celtic knot carvings, centered in tunnel
- **Portal:** Dense ethereal fog inside arch — lime green (#80FF80) left to pale cyan (#80FFFF) right
- **Details:** Circle of glowing white-yellow mushrooms (#FDFDE0) on floor before arch
- **Lighting:** Warm torch left (#FF8C00), mushroom glow as secondary, portal as primary
- **Textures:** Grey stone with interlacing knot carvings, thin vines growing up sides
- **Atmosphere:** Mystical, inviting, liminal — clear threshold between worlds
- **Epilepsy-safe rating:** ✅ Good — gentle portal gradient, no pulsing or strobing
- **Best for:** Fae Kingdom entrance, zone transition portal, Stone Circle Chamber access point

**Godot Translation Notes:**
- Portal shader: Gradient texture #80FF80 → #80FFFF, animated UV scroll
- Mushroom Light2D: #FDFDE0, energy 0.4, small radius, arranged in circle
- Torch Light2D: #FF8C00, energy 0.6
- Vine overlay: Sprite with alpha mask growing animation
- Trigger: Area2D at archway → scene change to Fae Kingdom
- Audio: portal hum at 432Hz (Gatekeeper gargoyle frequency)

---

## Summary: Strongest Takes for Godot Implementation

| Clip | Environment | Duration | Priority | Best Use |
|------|------------|----------|----------|----------|
| 1-1 | Tunnel Approach | 5s | HIGH | Entry corridor / loading ambiance |
| 2-1 | Alcove Corridor | 5s | HIGH | Artifact browsing hallway |
| 3-1 | Map Chamber | 5s | CRITICAL | World map navigation hub |
| 4-1 | Spiral Staircase | 5s | HIGH | Level transition / alchemy staircase |
| 5-1 | Geode Cave | 5s | CRITICAL | Reward room / gem collection |
| 6-1 | Serpent Hall | 10s | HIGH | Boss approach / grand corridor |
| 7-1 | Egyptian Vault | 10s | MEDIUM | Egypt zone artifact gallery |
| 8-1 | Fae Portal | 5s | CRITICAL | Fae Kingdom entrance |

## Color Palette Master Reference (for Godot shaders/lighting)

**Warm tones (lanterns/torches):**
- #F5B041, #F8D59A, #FF9900, #FFB347, #F4A460, #FFC56E

**Cool tones (ambient/crystals/runes):**
- #0F1A1A, #3B5B65, #00E6FF, #00FFFF, #64FDFD, #AACCFF

**Stone/neutral:**
- #B9A89A, #C2A88D, #D6CDB8, #4A4D46

**Special (portal/mushrooms):**
- #80FF80, #80FFFF, #FDFDE0

## Note on Variations
All 15 clips on Drive consist of pairs (e.g., 1-1 and 1-2) that are byte-identical. Morphic generated the same output for both variations of each prompt. No need to differentiate between "-1" and "-2" takes — they are the same video.
