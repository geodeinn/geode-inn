# Geode Inn — Environment Catalog & Godot Reference
## Upstairs/Cosmology, Main Floor, and Staircase/Alchemy Zones

This document provides an exhaustive architectural, lighting, atmospheric, and technical Godot engine breakdown of 11 environment reference images for **Geode Inn**. All color hex codes have been extracted from direct image color space analysis and quantized for direct use in Godot `Light2D`, `CanvasModulate`, spatial materials, and custom shaders.

---

## Executive Summary & Master Palette Reference

| Zone Name | Category | Primary Dominant Hex | Primary Light Source Hex | CanvasModulate Hex | Safety Rating | Primary Godot Node / FX |
| :--- | :--- | :--- | :--- | :--- | :---: | :--- |
| **Allfather's Throne** | Upstairs | `#162235` (Midnight Navy) | `#FDFAF7` / `#C48652` | `#121824` | ✅ | `Light2D`, `GPUParticles2D` (Cosmic dust), Nebulae Shader |
| **Planet Chamber** | Upstairs | `#5A606E` (Slate Gray) | `#F7F7E9` / `#7AB1E1` | `#2A323D` | ✅ | `Light2D`, Armillary Orbit Viewport, Parallax Rings |
| **Cosmology Ceiling Mural** | Upstairs | `#31374A` (Deep Indigo) | `#DDC7B3` / `#B29F8B` | `#302E32` | ✅ | `ParallaxBackground`, Gold Shimmer Shader |
| **Ascension to Canopy** | Upstairs | `#402E20` (Rustic Bark) | `#F6F1E7` / `#6D9EC7` | `#1A1612` | ✅ | God Rays Shader, Spore `GPUParticles2D`, Sconces |
| **Central Hearth** | Main Floor | `#311E0E` (Charred Oak) | `#FBE9C3` / `#DF9241` | `#18120C` | ⚠️ | Smooth Flicker `PointLight2D`, Heat Distortion, Embers |
| **Artisan Market** | Main Floor | `#1D130F` (Shadow Timber) | `#F5EFE3` / `#D5C9BF` | `#241C18` | ✅ | Overlapping Multi-Light Array, Cloth Wave Shader |
| **Modern Legends Nook** | Main Floor | `#332927` (Dark Mahogany) | `#FEF6E3` / `#E5B481` | `#141212` | ✅ | Focused Cone `PointLight2D`, Vignette Shader |
| **Modern Religions Library** | Main Floor | `#464149` (Slate Marble) | `#F6EFDA` / `#6A91CB` | `#22232B` | ✅ | Stained Glass Shaft Shader, Book Dust Particles |
| **Alchemical Landing** | Staircase | `#332C25` (Damp Stone) | `#F8F3DE` / `#B5702F` | `#161412` | ✅ | Glass Refraction Shader, Steam `GPUParticles2D` |
| **Alembic Window** | Staircase | `#090704` (Gothic Obsidian) | `#FCECE7` / `#E09B69` | `#0F1218` | ✅ | Stained Glass Shaft Shader, Liquid Tube Flow Shader |
| **Transformation** | Staircase | `#2F2513` (Mossy Umber) | `#ABC9C3` / `#95A78E` | `#151812` | ⚠️ | Rune Pulse Shader (Sine-clamped), Spore Particles |

---

## 1. UPSTAIRS / COSMOLOGY ZONES

### 1.1 Allfather's Throne
* **Image URL**: `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/e36348bd1_up_allfathers_throne_mid.jpg`

#### 1. Composition
* **Perspective & Layout**: Grand symmetrical eye-level perspective framing a massive celestial throne at the central focal point. Elevated dais with ceremonial stairs leading up to an ornate high-backed throne seat. Framed by soaring gothic/cosmic archways that open into deep space.
* **Key Architectural Elements**: Obsidian and dark marble platform step risers, gilded starburst halo surrounding the throne headrest, flanked by floating celestial orb pedestals and vaulted cosmic ribbing.

#### 2. Lighting
* **Color Hex Codes**:
  * Base Shadows / Backdrop: `#161315` (40.1%), `#162235` (25.4%)
  * Midtone Celestial Teal: `#233D54` (19.4%), `#3F6875` (6.5%)
  * Throne Base Amber Glow: `#613C20` (6.0%), `#C48652` (2.5%)
  * Focal Highlight / Light Source: `#FDFAF7`
* **Light Sources**: High-altitude cool starlight filtering from cosmic arches down onto the dais, complemented by a concentrated warm golden/bronze aura surrounding the throne seat.
* **Intensity & Mood**: Majestic, divine, authoritative, and awe-inspiring. High contrast between cold cosmic depth and warm sovereign authority.

#### 3. Atmosphere & Textures
* Polished black obsidian floors reflecting starlight motes; chiseled dark stone pillars; beaten bronze starburst filigree; faint swirling ethereal cosmic nebula fog hanging in the air.

#### 4. Epilepsy Safety Rating
* **Rating**: ✅ **SAFE**
* **Explanation**: Steady dual-temperature lighting with zero rapid flickering or sudden contrast spikes. Ethereal ambient particle drift is smooth and low-velocity.

#### 5. Best Use in Game
* Overseer's Sanctum / Boss Chamber / Ultimate Lore Encounter at the apex of the Upstairs level.

#### 6. Godot Translation Notes
* **CanvasModulate**: `#121824` (Deep celestial navy tint).
* **Light2D Setup**:
  * `PointLight2D` at Throne center: Color `#C48652`, Energy `2.0`, Radial drop-off texture.
  * `DirectionalLight2D` or wide `PointLight2D` for archways: Color `#3F6875`, Energy `1.2`.
* **Particle Systems**: `GPUParticles2D` spawning celestial dust/starlight motes drifting down with slow alpha fade (`#FDFAF7`).
* **Shaders Needed**: Background TileMap parallax cosmic nebula shader with slow UV distortion.

---

### 1.2 Planet Chamber
* **Image URL**: `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/c209ebd33_up_planet_chamber_mid.jpg`

#### 1. Composition
* **Perspective & Layout**: Centered spherical orrery chamber viewed from a slightly lowered angle. Circular vaulted domed ceiling with concentric metal armillary bands and floating planetary spheres suspended at varying depths.
* **Key Architectural Elements**: Brass and iron orbital rings, floating glowing globes of varying sizes, circular stone observation balcony with carved balustrades, stone wall alcoves displaying starry maps.

#### 2. Lighting
* **Color Hex Codes**:
  * Ambient Slate / Shadow: `#5A606E` (28.0%), `#474347` (22.2%)
  * Muted Azure Sky: `#748299` (18.7%), `#251A19` (18.6%)
  * Celestial Planet Glow Blue: `#7AB1E1` (9.1%)
  * Warm Bronze Highlight: `#C3A292` (3.4%)
  * Focal Light Source: `#F7F7E9`
* **Light Sources**: Diffuse cool moonlight filtering through the dome, soft internal self-illumination from floating planetary orbs (`#7AB1E1`), warm rim lighting on brass gearings (`#C3A292`).
* **Intensity & Mood**: Serene, scholarly, contemplative, and cosmic. Balanced cool-tone wash with soft localized warmth.

#### 3. Atmosphere & Textures
* Polished slate stone flooring; brushed brass armillary bands; translucent glowing glass orbs; fine dust suspended in zero-G orrery field.

#### 4. Epilepsy Safety Rating
* **Rating**: ✅ **SAFE**
* **Explanation**: Continuous, smooth rotation of planetary rings and gentle, static light emission from orbs. No pulsing or flash risks.

#### 5. Best Use in Game
* Planetarium / World Map Navigation Hub / Celestial puzzle room in the Upstairs level.

#### 6. Godot Translation Notes
* **CanvasModulate**: `#2A323D` (Muted steel blue).
* **Light2D Setup**:
  * `PointLight2D` on key planetary globes: Color `#7AB1E1`, Energy `1.5`.
  * `PointLight2D` on brass center axis: Color `#C3A292`, Energy `0.9`.
* **Particle Systems**: Slow orbital particle ring (`GPUParticles2D`) circling central planets.
* **Shaders Needed**: 2D sphere rotation shader or Viewport texture mapping for planetary surface movement; Parallax background for ceiling armillary rings.

---

### 1.3 Cosmology Ceiling Mural
* **Image URL**: `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/27de4fe65_up_cosmology_mural_mid.jpg`

#### 1. Composition
* **Perspective & Layout**: Directly overhead orthographic ceiling view / high angle looking up. Large circular celestial map fresco painted across fitted plaster ceiling tiles.
* **Key Architectural Elements**: Concentric astrological rings, central sun/star emblem, painted zodiacal constellations, mythic celestial figures framing the outer circumference, stone vault ribs holding the ceiling panels.

#### 2. Lighting
* **Color Hex Codes**:
  * Dark Charcoal Plaster: `#1B1818` (24.2%)
  * Celestial Navy Wash: `#31374A` (23.0%), `#55596B` (10.8%)
  * Umber / Aged Wood Shadow: `#48382B` (18.6%)
  * Gold Leaf / Warm Pigment: `#937B5E` (13.5%), `#B29F8B` (9.8%)
  * Highlight / Uplight Source: `#DDC7B3`
* **Light Sources**: Indirect architectural sconce uplighting from lower walls casting an even, diffuse glow across the ceiling plaster.
* **Intensity & Mood**: Historic, sacred, antique, and venerable. Soft, muted glow revealing subtle gold leaf accents.

#### 3. Atmosphere & Textures
* Cracked plaster fresco surfaces; faded tempera paint; aged gold leaf gilding; dust-draped vaulted stone seams.

#### 4. Epilepsy Safety Rating
* **Rating**: ✅ **SAFE**
* **Explanation**: Completely static artwork with diffuse indirect lighting. Absolutely no strobe or contrast flicker hazard.

#### 5. Best Use in Game
* Grand Hallway ceiling parallax background / Celestial lore inspection puzzle panel in the Upstairs gallery.

#### 6. Godot Translation Notes
* **CanvasModulate**: `#302E32` (Neutral dark stone).
* **Light2D Setup**:
  * Sconce uplights: `PointLight2D` with color `#B29F8B`, Energy `0.6`, high smooth attenuation.
* **Particle Systems**: None required, or extremely sparse falling plaster dust (`GPUParticles2D`).
* **Shaders Needed**: Normal-map depth shader for plaster cracks; subtle light-angle gold leaf shimmer shader (`specular_light` reflection).

---

### 1.4 Ascension to Canopy
* **Image URL**: `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/c23a8e38a_up_ascension_canopy_mid.jpg`

#### 1. Composition
* **Perspective & Layout**: Upward-tilted vertical perspective following a grand winding wooden staircase/ramp wrapping around a massive ancient living tree trunk.
* **Key Architectural Elements**: Carved wooden stair steps with rope-and-iron handrails, gargantuan hollow tree trunk core, carved support struts, canopy skylights at upper right framing forest foliage.

#### 2. Lighting
* **Color Hex Codes**:
  * Dark Bark Shadow: `#181513` (58.4%)
  * Deep Timber Warmth: `#402E20` (24.7%)
  * Rich Mahogany Accent: `#835834` (7.7%)
  * Upper Canopy Sky Blue: `#2F455A` (3.9%), `#6D9EC7` (2.8%)
  * Sconce Warmth / Sconce Highlight: `#E0AC78` (2.3%), `#F6F1E7`
* **Light Sources**: Dual temperature contrast: warm lantern sconces mounted along the stair posts (`#E0AC78`) vs cool natural daylight/starlight descending from the canopy ceiling (`#6D9EC7`).
* **Intensity & Mood**: Adventurous, organic, uplifting, and awe-inspiring. Upward movement guided by rising light gradients.

#### 3. Atmosphere & Textures
* Rough ancient tree bark; polished grain wooden stair treads; wrought iron sconce brackets; floating leaf particles and pollen in god rays.

#### 4. Epilepsy Safety Rating
* **Rating**: ✅ **SAFE**
* **Explanation**: Steady directional light shafts and static lantern sconces. No rapid flashing.

#### 5. Best Use in Game
* Major vertical transition zone connecting Main Floor / Upper Inn to the Observatory Canopy tier.

#### 6. Godot Translation Notes
* **CanvasModulate**: `#1A1612` (Deep dark forest floor shadow).
* **Light2D Setup**:
  * Upper Canopy Light: `PointLight2D` / `DirectionalLight2D` with color `#6D9EC7`, Energy `1.4`.
  * Stair Lanterns: `PointLight2D` array along stairs with color `#E0AC78`, Energy `1.8`.
* **Particle Systems**: Airborne spores and falling leaf particles (`GPUParticles2D`) drifting diagonally downward.
* **Shaders Needed**: Volumetric god-ray light shaft shader filtering down through canopy branches.

---

## 2. MAIN FLOOR ZONES

### 2.1 Central Hearth
* **Image URL**: `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/c074ac7d1_mf_central_hearth_mid.jpg`

#### 1. Composition
* **Perspective & Layout**: Centered eye-level perspective focused on a massive open stone hearth located at the heart of the main inn floor. Heavy stone hearth structure anchored on a polished timber floor surrounded by seating tables.
* **Key Architectural Elements**: Soot-stained stone mantlepiece, iron fire grate, burning log fire core, heavy oak ceiling beams, copper kettles and cast iron cookware hung nearby.

#### 2. Lighting
* **Color Hex Codes**:
  * Deep Hearth Shadows: `#110D08` (58.2%)
  * Charcoal / Warm Wood Shadow: `#311E0E` (22.4%)
  * Deep Ember Red: `#642907` (10.6%)
  * Fire Flame Orange: `#9F4408` (5.6%), `#DF9241` (1.0%)
  * Core Flame Yellow / Light Source: `#F6DFB6` (2.2%), `#FBE9C3`
* **Light Sources**: Intense central radiant firelight from hearth core casting dramatic warm radial light into surrounding dark wood room.
* **Intensity & Mood**: Intensely cozy, warm, safe, inviting, and rustic. Strong local light falloff.

#### 3. Atmosphere & Textures
* Rough masonry stone; charred wood embers; polished dark oak tables; flickering warmth; gentle smoke haze rising to ceiling rafters.

#### 4. Epilepsy Safety Rating
* **Rating**: ⚠️ **CAUTION**
* **Explanation**: Dynamic fire flicker effect can cause rapid contrast shifts if implemented with sharp step flicker. **Godot Requirement**: Smooth noise-based energy modulation (e.g., `FastNoiseLite` driven `PointLight2D.energy` between `1.8` and `2.4` with low frequency `< 3.0 Hz`) to avoid triggering photo-sensitivity.

#### 5. Best Use in Game
* Main Inn Lobby / Central Hub / Primary Save Point & Rest Zone for players.

#### 6. Godot Translation Notes
* **CanvasModulate**: `#18120C` (Cozy dark mahogany tint).
* **Light2D Setup**:
  * Central Fireplace Light: `PointLight2D` with color `#DF9241`, Energy `2.2` (modulated via Perlin noise script).
  * Inner Flame Highlight: `PointLight2D` with color `#F6DFB6`, Energy `1.0`.
* **Particle Systems**: Rising embers and spark particles (`GPUParticles2D`) fading into thin translucent smoke (`#642907` to `#311E0E`).
* **Shaders Needed**: Heat distortion fragment shader applied to CanvasItem above hearth opening.

---

### 2.2 Artisan Market
* **Image URL**: `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/88c41e608_mf_artisan_market_mid.jpg`

#### 1. Composition
* **Perspective & Layout**: One-point corridor perspective looking down a vibrant market arcade lined with artisan stalls and craft displays on both sides.
* **Key Architectural Elements**: Timber market stalls with canvas awnings, hanging woven tapestries, terracotta pottery racks, polished brass lanterns, cobblestone thoroughfare flooring.

#### 2. Lighting
* **Color Hex Codes**:
  * Deep Alcove Shadow: `#1D130F` (32.0%)
  * Muted Fabric / Clay: `#6D5A54` (19.1%), `#948380` (12.7%)
  * Warm Timber Brown: `#552B10` (16.4%)
  * Stone Cobblestone Gray: `#3D3334` (15.6%)
  * Warm Lantern Glow / Light Source: `#D5C9BF` (4.1%), `#F5EFE3`
* **Light Sources**: Overhead string lanterns and stall-mounted brass sconces creating overlapping pools of soft warm illumination across goods on display.
* **Intensity & Mood**: Lively, industrious, welcoming, and detailed. Rich multi-point ambient warmth.

#### 3. Atmosphere & Textures
* Woven dyed wool textiles; raw terracotta clay; polished copper trinkets; coarse timber stall beams; dusty merchant thoroughfare.

#### 4. Epilepsy Safety Rating
* **Rating**: ✅ **SAFE**
* **Explanation**: Multiple steady lantern light sources with no animated strobing or high-contrast pulsing.

#### 5. Best Use in Game
* Merchant Alley / Item Shops & Crafting Vendor Hub on Main Floor.

#### 6. Godot Translation Notes
* **CanvasModulate**: `#241C18` (Warm indoor shadow).
* **Light2D Setup**:
  * Stall Lantern Array: Multiple `PointLight2D` nodes placed at each lantern with color `#D5C9BF`, Energy `1.0`, smooth radius overlap.
* **Particle Systems**: Subtle airborne market dust motes in lantern light cones (`GPUParticles2D`).
* **Shaders Needed**: Subtle cloth wind/sway vertex shader for hanging banners and awnings.

---

### 2.3 Modern Legends Nook
* **Image URL**: `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/08624ca4f_mf_modern_legends_mid.jpg`

#### 1. Composition
* **Perspective & Layout**: Intimate corner perspective focused on a quiet reading alcove embedded in the main floor wall. Plush leather armchair positioned beside a round wooden end table with framed wall portraits.
* **Key Architectural Elements**: Dark mahogany wall panelling, framed portrait art of legendary figures, brass reading lamp, tufted leather armchair, thick patterned floor rug.

#### 2. Lighting
* **Color Hex Codes**:
  * Surrounding Dark Shadow: `#181514` (37.7%)
  * Mahogany Panel Brown: `#332927` (26.2%)
  * Leather / Rug Crimson Tone: `#4B4142` (21.5%)
  * Muted Wall Gray: `#666368` (11.2%)
  * Warm Brass Lamp Light: `#905D35` (2.4%), `#E5B481` (1.0%)
  * Lamp Cone Light Source: `#FEF6E3`
* **Light Sources**: Single focused warm reading lamp spotlighting the chair and table, creating a solitary, cozy sanctuary in a dark room.
* **Intensity & Mood**: Quiet, intellectual, secretive, and cozy. High localized spotlight contrast.

#### 3. Atmosphere & Textures
* Aged cracked leather; dark polished wood paneling; brass lamp neck; woven wool rug; parchment paper texture.

#### 4. Epilepsy Safety Rating
* **Rating**: ✅ **SAFE**
* **Explanation**: Fixed, constant reading lamp illumination with zero dynamic flickering.

#### 5. Best Use in Game
* Lore Reading Alcove / Quest Log Rest Nook / NPC Storytelling Corner on Main Floor.

#### 6. Godot Translation Notes
* **CanvasModulate**: `#141212` (Deep dark room shadow).
* **Light2D Setup**:
  * Reading Lamp Spot: `PointLight2D` with color `#E5B481`, Energy `1.6`, texture using cone light map.
  * Leather Chair Bounce: `PointLight2D` with color `#905D35`, Energy `0.5`, smooth falloff.
* **Particle Systems**: Low-density floating dust motes caught in lamp cone (`GPUParticles2D`).
* **Shaders Needed**: Vignette screen-space shader to deepen edge shadows around alcove.

---

### 2.4 Modern Religions Library
* **Image URL**: `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/204b1bd30_mf_modern_religions_mid.jpg`

#### 1. Composition
* **Perspective & Layout**: Soaring multi-story library aisle perspective with high floor-to-ceiling bookshelves, accessible via rolling wooden ladders and upper balcony walkways.
* **Key Architectural Elements**: Double-height oak bookcases packed with leather-bound codices, arched stained-glass clerestory window at upper left, study desks with brass green-shade lamps, carved marble pillars.

#### 2. Lighting
* **Color Hex Codes**:
  * Deep Bookcase Shadow: `#1B1718` (34.6%)
  * Slate Column Gray: `#464149` (26.0%), `#606374` (21.1%)
  * Stained Glass Window Blue: `#6A91CB` (9.3%)
  * Leather Book & Desk Amber: `#B39477` (5.5%)
  * Muted Paper Gold: `#D7DACB` (3.6%)
  * Window Light Source: `#F6EFDA`
* **Light Sources**: High-altitude cool blue daylight shafts streaming through stained glass window (`#6A91CB`) intersecting with warm golden reading lamps at floor study desks (`#B39477`).
* **Intensity & Mood**: Scholarly, solemn, vast, reverent, and peaceful. Beautiful blue/amber light harmony.

#### 3. Atmosphere & Textures
* Leather-bound book spines; polished oak desk surfaces; smooth slate/marble columns; dusty air filled with floating paper flecks.

#### 4. Epilepsy Safety Rating
* **Rating**: ✅ **SAFE**
* **Explanation**: Stable natural light shafts and stationary desk lamps. No pulsing or flashing elements.

#### 5. Best Use in Game
* Main Floor Library Archive / Lore Research Hub / Skill Tree Unlocking Sanctuary.

#### 6. Godot Translation Notes
* **CanvasModulate**: `#22232B` (Cool slate library tint).
* **Light2D Setup**:
  * Stained Glass Window Ray: `PointLight2D` with color `#6A91CB`, Energy `1.5`, angled light texture.
  * Desk Reading Lamp: `PointLight2D` with color `#B39477`, Energy `1.2`.
* **Particle Systems**: `GPUParticles2D` emitting slow floating parchment dust motes in window light beams.
* **Shaders Needed**: Stained glass light shaft / god ray shader projecting subtle tinted pattern onto floor.

---

## 3. STAIRCASE / ALCHEMY ZONES

### 3.1 Alchemical Landing
* **Image URL**: `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/cddf3de87_st_alchemical_landing_mid.jpg`

#### 1. Composition
* **Perspective & Layout**: Angled view of a staircase landing converted into an alchemical laboratory workstation. Curved stone stairs frame the left and background while a heavy oak workbench dominates the center.
* **Key Architectural Elements**: Curved stone stair steps, thick timber workbench, glass retorts and alembics, mortar and pestles, brass scales, dried herbs hanging from overhead beams.

#### 2. Lighting
* **Color Hex Codes**:
  * Dark Stone Shadow: `#141210` (32.2%), `#332C25` (37.0%)
  * Workbench Timber Brown: `#5D4C3D` (16.7%)
  * Brass & Glass Highlight: `#88867C` (6.2%), `#C9C3AF` (4.6%)
  * Amber Lamp Glow: `#B5702F` (3.2%)
  * Focal Light Source: `#F8F3DE`
* **Light Sources**: Concentrated amber oil lamp on workbench casting localized warm light onto glassware, with dark shadows wrapping around stone stairwell.
* **Intensity & Mood**: Mysterious, functional, clandestine, and focused. Strong task lighting.

#### 3. Atmosphere & Textures
* Damp masonry stone; polished glass retorts; Tarnished brass; dried herbal bundles; liquid condensation on glass tubes.

#### 4. Epilepsy Safety Rating
* **Rating**: ✅ **SAFE**
* **Explanation**: Steady oil lamp light and static liquid glows. No rapid contrast shifts.

#### 5. Best Use in Game
* Intermediate Potion Brewing / Alchemy Crafting Station on Staircase landing between Main Floor and Upper Level.

#### 6. Godot Translation Notes
* **CanvasModulate**: `#161412` (Dark stairwell shadow).
* **Light2D Setup**:
  * Workbench Oil Lamp: `PointLight2D` with color `#B5702F`, Energy `1.5`.
  * Flask Glow: Small `PointLight2D` with color `#C9C3AF`, Energy `0.9`.
* **Particle Systems**: Gentle rising steam / chemical vapor particles (`GPUParticles2D`) hovering over alembic flasks.
* **Shaders Needed**: Glass refraction shader on flask canvas items.

---

### 3.2 Alembic Window
* **Image URL**: `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/67f36b6a5_st_alembic_window_mid.jpg`

#### 1. Composition
* **Perspective & Layout**: Dramatic close-up/mid-shot centered on a giant brass and glass alembic apparatus positioned directly in front of a grand gothic arched window.
* **Key Architectural Elements**: Gothic stone window tracery, stained glass window panes, massive copper/brass distillation coil, glass collection vessel filled with glowing amber liquid, heavy stone sill.

#### 2. Lighting
* **Color Hex Codes**:
  * Deep Gothic Obsidian: `#090704` (52.0%)
  * Muted Wall Slate: `#58463C` (20.3%), `#2F1E16` (13.5%)
  * Alembic Distillate Amber: `#945A35` (10.3%), `#E09B69` (1.3%)
  * Window Stained Glass Teal: `#24475B` (2.6%)
  * Highlight Light Source: `#FCECE7`
* **Light Sources**: High contrast dual sources: cool sapphire/teal moonlight streaming through the gothic window frame (`#24475B`) vs intense warm amber self-illumination radiating from the bubbling alembic distillate (`#E09B69`).
* **Intensity & Mood**: Dramatic, magical, gothic, and mystical. High visual impact with deep shadow backdrop.

#### 3. Atmosphere & Textures
* Cold chiseled window stone; warm polished copper coil; bubbling glowing liquid distillate; condensation glass droplets.

#### 4. Epilepsy Safety Rating
* **Rating**: ✅ **SAFE**
* **Explanation**: High visual contrast, but static light distribution. Bubbling liquid requires smooth particle generation without flashing screen overlay.

#### 5. Best Use in Game
* Master Alchemy Laboratory Window / Focal Lore Puzzle Room in Staircase Tower.

#### 6. Godot Translation Notes
* **CanvasModulate**: `#0F1218` (Very dark stone blue).
* **Light2D Setup**:
  * Gothic Window Moonlight: `PointLight2D` with color `#24475B`, Energy `1.8`.
  * Alembic Liquid Glow: `PointLight2D` with color `#E09B69`, Energy `2.2`.
* **Particle Systems**: Slow rising amber liquid bubbles (`GPUParticles2D`) inside distillation tubes.
* **Shaders Needed**: Stained glass window light ray projection shader + animated liquid flow shader inside tubing.

---

### 3.3 Transformation
* **Image URL**: `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/69e5f8b97_st_transformation_mid.jpg`

#### 1. Composition
* **Perspective & Layout**: Centered low-angle perspective looking across an ancient transmutational ritual floor toward overgrown stone arches.
* **Key Architectural Elements**: Intricate alchemical transmutation circle etched into stone floor, mossy overgrown stone pillars, central bronze alchemy cauldron crucible, glowing elder runes carved along wall arches.

#### 2. Lighting
* **Color Hex Codes**:
  * Deep Vault Shadow: `#100B04` (27.4%), `#2F2513` (24.6%)
  * Muted Moss Green: `#495037` (14.7%)
  * Bioluminescent Jade / Rune Glow: `#6E775A` (14.4%), `#95A78E` (7.2%)
  * Warm Background Torch: `#553316` (11.7%)
  * Center Rune Light Source: `#ABC9C3`
* **Light Sources**: Ethereal sage green and pale jade bioluminescence radiating upward from floor transmutation circle (`#95A78E` / `#ABC9C3`) contrasted with warm background arch torchlight (`#553316`).
* **Intensity & Mood**: Transmutative, magical, eldritch, and ancient. Mysterious green glow dominating shadows.

#### 3. Atmosphere & Textures
* Overgrown damp stone; carved glowing rune channels; green moss and vines; swirling magical mist hanging above floor.

#### 4. Epilepsy Safety Rating
* **Rating**: ⚠️ **CAUTION**
* **Explanation**: Rune circle activation FX can involve rapid pulsing. **Godot Requirement**: Smooth sine-wave pulse scripting (`sin(TIME * 1.5)`) for light energy (`1.2` to `1.8`), maintaining frequency below 2.0 Hz. Avoid sharp step-function triggers during spell animation.

#### 5. Best Use in Game
* Major Alchemical Transmutation Chamber / Item Upgrade Shrine / Boss Encounter Arena in Staircase Crypt.

#### 6. Godot Translation Notes
* **CanvasModulate**: `#151812` (Dark mossy stone tint).
* **Light2D Setup**:
  * Transmutation Circle Rune Glow: `PointLight2D` with color `#95A78E`, Energy `1.8` (modulated via smooth sine script).
  * Torch Background Sconce: `PointLight2D` with color `#553316`, Energy `1.0`.
* **Particle Systems**: Rising green magical spore particles (`GPUParticles2D`) ascending from floor runes (`#ABC9C3`).
* **Shaders Needed**: Pulsing floor rune glowing shader + moss growth dissolve fragment shader.

---

## 4. GLOBAL GODOT IMPLEMENTATION GUIDE

### 4.1 Lighting Engine Architecture (2D / 2.5D setup)
1. **CanvasModulate**: Set per-zone as defined in the master reference table. Always keep base shadow colors dark but saturated to allow `Light2D` nodes to pop with rich contrast.
2. **Light2D Multi-Pass Strategy**:
   * **Pass 1 (Ambient Fill)**: Large-radius, low-energy `PointLight2D` (Energy 0.3-0.5) matching room tint.
   * **Pass 2 (Key Light)**: High-energy directional or cone light (`Light2D`) matching primary light source hex codes.
   * **Pass 3 (Rim/Accent)**: Specular rim light on interactive elements or doorways.
3. **Normal Mapping**: Ensure all wall and floor `TileMap` sprites utilize normal maps (`CanvasItem.normal_map`) so `Light2D` sources create authentic depth and stone relief textures.

### 4.2 Epilepsy & Photo-Safety Compliance Matrix
To maintain strict epilepsy safety compliance across all dynamic game environments:
* **Flicker Frequency Limit**: Never exceed 2 Hz (2 flashes/sec) on light energy modulation.
* **Luminance Delta**: Clamp maximum energy swing to $\Delta E \le 0.6$ on $2D$ lights.
* **Transition Curves**: Use `EaseInOut` cubic or Perlin noise (`FastNoiseLite`) smooth interpolation for fire, magic runes, and glowing orbs instead of hard square-wave toggles.

### 4.3 Particle System Performance Matrix
* Use `GPUParticles2D` for ambient dust motes, spores, leaves, and liquid bubbles.
* Keep max particle count under `200` per screen for ambient effects to preserve mobile and low-end GPU performance.
* Enable `fixed_fps = 30` or `60` on `GPUParticles2D` process materials for smooth, deterministic movement across framerates.

---
*Catalog generated for Geode Inn project visual development team.*
