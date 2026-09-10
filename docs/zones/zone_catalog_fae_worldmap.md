# Geode Inn — Environment Reference & Zone Catalog
**Target Engine:** Godot 4.x (2D / 2.5D Lighting & Shader Architecture)  
**Catalog Scope:** Fae Kingdom Realms (6 Images) & World Map / Regional Reference (8 Images)  
**File Name:** `zone_catalog_fae_worldmap.md`  

---

## Executive Summary & Godot Technical Standards

This catalog establishes technical and visual specifications for translating 14 environment reference images into Godot 4 render pipelines for **'Geode Inn'**. Every zone profile contains precise color hex codes extracted from image colorimetry analysis, designated Godot node configurations (`CanvasModulate`, `PointLight2D`, `DirectionalLight2D`, `GPUParticles2D`), custom GLSL/CanvasItem shader requirements, and epilepsy safety guidelines.

---

# Part 1: Fae Kingdom Realms

---

### 1. Crossing Threshold

- **Reference Image URL:** `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/e1bdfa304_fae_threshold_mid.jpg`
- **Resolution:** 1920x1080 | **Mean Brightness:** 58.4 (Dark/High Dynamic Range)

#### 1. Composition
- **Perspective:** First-person / low eye-level forward gateway perspective looking into an inner glade.
- **Layout:** Strongly framed center-tunnel composition. Overarching dark twisted oak boughs at top-left and top-right form a natural arch and heavy vignetting. High mossy archway leads toward a central illuminated aperture in the midground.
- **Key Architectural Elements:** Ancient ashlar stone portal, carved runic lintels, moss-draped masonry, twisting ancient roots, wooden threshold frame.

#### 2. Lighting
- **Light Sources & Distribution:**
  - *Primary Source:* Overhead sunbeam streaming through top-center archway (`#5E6954`, `#73826A`).
  - *Highlights:* Foliage and portal rim sunburst (`#9CAE96`, `#9EB4A1`).
  - *Shadows:* Deep dark wood and earth shadows framing the portal (`#100B04`, `#2F2312`, `#040301`).
  - *Accent Glow:* Moss green and glowing amber sap runes (`#869375`, `#646C51`).
- **Intensity & Mood:** High contrast, directional top-down lighting, mysterious, transitional, alluring yet solemn.

#### 3. Atmosphere & Textures
- Damp mossy stone, rough oak bark with visible growth rings, floating pollen/spores suspended in volumetric sunbeams, humid ground mist clinging to threshold stones.

#### 4. Epilepsy Safety Rating
- **Rating:** ✅ **Safe**
- **Explanation:** Stable volumetric lighting with smooth spatial gradients. No high-frequency strobing, flashing, or rapid light intensity oscillations present in source design.

#### 5. Best Use in 'Geode Inn'
- Gateway transition zone connecting the main Geode Inn Courtyard / Garden to the Fae Realm Wing. Acts as a loading/seamless scene portal door.

#### 6. Godot Translation Notes
- **CanvasModulate:**
  - `color = Color("#3B3326")` (warm dark brown-tinted ambient baseline).
- **Light2D Nodes:**
  - `PointLight2D` (God Rays Shaft): Positioned at top arch. `color = Color("#73826A")`, `energy = 1.8`, `texture_scale = 2.5`, `shadow_enabled = true`.
  - `PointLight2D` (Threshold Floor Glow): `color = Color("#9CAE96")`, `energy = 1.2`, subtle sine energy modulation (`energy = 1.2 + 0.15 * sin(TIME * 1.5)`).
- **GPUParticles2D:**
  - *Pollen & Dust Motes:* `emission_shape = Box(Vector2(600, 400))`, `direction = Vector2(0, -1)`, `initial_velocity_min = 5.0`, `initial_velocity_max = 15.0`, `color = Color("#9CAE96")` fading to transparent.
- **Shaders Needed:**
  - `res://shaders/volumetric_godrays_2d.gdshader`: Scrolling 2D noise mask multiplying light cone alpha.
  - `res://shaders/rune_emission_pulse.gdshader`: Pulsing emission map on portal stone texture using `sin(TIME * 1.2)`.

---

### 2. Summerlands

- **Reference Image URL:** `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/b95878140_fae_summerlands_mid.jpg`
- **Resolution:** 1920x1080 | **Mean Brightness:** 74.2

#### 1. Composition
- **Perspective:** Eye-level open forest path view.
- **Layout:** Asymmetrical sylvan corridor with a winding cobblestone path vanishing into a radiant golden clearing in the upper-center distance. High leafy forest canopy arching across top screen.
- **Key Architectural Elements:** Winding mossy cobblestone trail, organic root steps, golden fern brakes, overarching ancient beech tree canopy, glowing sunlit glade.

#### 2. Lighting
- **Light Sources & Distribution:**
  - *Primary Source:* Golden sunburst bursting through forest canopy and glade center (`#A39760`, `#D6CB98`).
  - *Highlights:* Sunlit leaf edges and glowing glade grass (`#CABF88`, `#AFA270`).
  - *Shadows:* Dark forest understory and tree trunks (`#1F2113`, `#3D3C27`, shadow `#12130B`).
  - *Midtones:* Warm golden-olive forest floor (`#675F3E`, `#8B8056`).
- **Intensity & Mood:** Warm, vibrant, idyllic, eternal summer solstice, peaceful and enchanting.

#### 3. Atmosphere & Textures
- Dappled sunlight dancing on dirt paths, soft emerald moss, golden fern fronds, fluttering leaves drifting down, warm golden haze near ground level.

#### 4. Epilepsy Safety Rating
- **Rating:** ✅ **Safe**
- **Explanation:** Continuous warm canopy lighting with gentle leaf shadow movement. No rapid light contrast shifts or high-frequency pulses.

#### 5. Best Use in 'Geode Inn'
- The Fae Realm Courtyard / Outdoor Solarium / Summer Fae Guest Wing Hub in Geode Inn.

#### 6. Godot Translation Notes
- **CanvasModulate:**
  - `color = Color("#4A4633")` (warm olive dark ambient).
- **Light2D Nodes:**
  - `DirectionalLight2D` (Sunlight Angle): `color = Color("#D6CB98")`, `energy = 1.4`, `rotation = deg_to_rad(65.0)`.
  - `PointLight2D` (Glade Highlight): Positioned at glade center. `color = Color("#CABF88")`, `energy = 2.0`, `texture_scale = 3.2`.
- **GPUParticles2D:**
  - *Falling Golden Leaves:* `emission_shape = Line(1920)`, `direction = Vector2(0.3, 1.0)`, `angular_velocity_min = 20.0`, `angular_velocity_max = 60.0`, `color = Color("#D6CB98")`.
- **Shaders Needed:**
  - `res://shaders/foliage_sway_2d.gdshader`: Vertex swaying shader (`VERTEX.x += sin(TIME * 2.0 + VERTEX.y) * sway_intensity`).
  - `res://shaders/dappled_light_caustics.gdshader`: Screen-space light noise mask simulating moving tree shadows.

---

### 3. The Hollow

- **Reference Image URL:** `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/f66c132b2_fae_hollow_mid.jpg`
- **Resolution:** 1920x1080 | **Mean Brightness:** 66.5 (Bioluminescent Cool Palette)

#### 1. Composition
- **Perspective:** Deep subterranean cavern perspective looking across an underground pool toward a massive ancient root vault.
- **Layout:** Tiered vertical composition. Massive gnarled root system branching upward into dark cavern ceilings. Central reflective pool in lower center, surrounded by glowing bioluminescent flora terraces.
- **Key Architectural Elements:** Subterranean hollow tree trunk, root bridges, bio-luminescent mushroom clusters, serene subterranean water pool, crystal stalactites.

#### 2. Lighting
- **Light Sources & Distribution:**
  - *Primary Source:* Bioluminescent mushrooms and glowing bio-flora (`#607DA2`, `#6C8EB9`, `#99C0EC`).
  - *Highlights:* Ice-blue crystal highlights and water surface caustics (`#8DB3E0`, `#99C0EC`).
  - *Shadows:* Deep midnight navy and obsidian cavern recesses (`#080E16`, `#1F303F`, shadow `#010205`).
  - *Midtones:* Deep slate blue root wood (`#364D63`, `#506C8B`).
- **Intensity & Mood:** Ethereal, mysterious, cool, subterranean sanctuary, quiet and reverent.

#### 3. Atmosphere & Textures
- Damp gleaming root bark, wet cavern rock, reflective still water, glowing sapphire fungal spores floating upward, cold ground mist.

#### 4. Epilepsy Safety Rating
- **Rating:** ✅ **Safe** (with configuration recommendation)
- **Explanation:** Steady bioluminescent illumination. *Developer Note:* When implementing pulsing bioluminescence on mushroom clusters, maintain slow sine-wave frequencies (`period >= 2.5s`) to prevent flickering.

#### 5. Best Use in 'Geode Inn'
- Geode Inn Underground Cellar / Mineral Springs / Deep Geode Vault / Unseelie Night Lounge.

#### 6. Godot Translation Notes
- **CanvasModulate:**
  - `color = Color("#121B26")` (cool midnight blue dark ambient).
- **Light2D Nodes:**
  - `PointLight2D` (Bioluminescent Flora): Placed at mushroom nodes. `color = Color("#6C8EB9")`, `energy = 1.2`, pulsing range `0.9` to `1.3` over 3s.
  - `PointLight2D` (Pool Caustic Glow): `color = Color("#506C8B")`, `energy = 0.8`, `texture_scale = 2.0`.
- **GPUParticles2D:**
  - *Bioluminescent Bio-Spores:* `emission_shape = Circle(400)`, `direction = Vector2(0, -1)`, `spread = 25.0`, `initial_velocity_min = 8.0`, `color = Color("#99C0EC")`.
- **Shaders Needed:**
  - `res://shaders/water_reflection_distortion.gdshader`: Viewport-based water reflection with normal-map ripple displacement.
  - `res://shaders/bioluminescent_pulse.gdshader`: Smooth emission map noise modulation for mushrooms and flora.

---

### 4. The Between

- **Reference Image URL:** `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/cae6fb7a7_fae_the_between_mid.jpg`
- **Resolution:** 1280x720 | **Mean Brightness:** 118.7 (Desaturated Twilight Balance)

#### 1. Composition
- **Perspective:** High-horizon atmospheric landscape view.
- **Layout:** Liminal floating landmasses spanning across desaturated ether-water. Silver birch trees on left bank (`#848452`), misty turquoise water in midground (`#6F8A88`), misty mountain silhouettes fading into distance on right (`#506985`, `#6788AE`). Winding stone path bridging realms.
- **Key Architectural Elements:** Birch tree thicket, floating lichen-covered stone piers, spirit lanterns along pathway, soft twilight water mirror, distant mountain peaks.

#### 2. Lighting
- **Light Sources & Distribution:**
  - *Primary Source:* Diffuse desaturated sky and twilight mist (`#85A3C7`, `#6A869F`).
  - *Highlights:* Soft silvery mist reflections and sky highlights (`#AFB7B9`, `#8DA6C0`).
  - *Shadows:* Deep slate green and forest floor shadows (`#2E3C34`, `#445333`).
  - *Lantern Accents:* Warm pale gold path lantern glow (`#B4A67A`).
- **Intensity & Mood:** Dreamlike, nostalgic, tranquil, desaturated liminal realm between day and night.

#### 3. Atmosphere & Textures
- Rolling silver fog layers, smooth damp river pebbles, white papery birch bark, glowing spirit mist hovering above water.

#### 4. Epilepsy Safety Rating
- **Rating:** ✅ **Safe**
- **Explanation:** Very low contrast variance across the scene (mean brightness 118.7 with narrow standard deviation). Smooth desaturated lighting.

#### 5. Best Use in 'Geode Inn'
- Hallway of Portals / Fast-Travel Nexus / Dream Realm Transition Hallway connecting different wings of the Inn.

#### 6. Godot Translation Notes
- **CanvasModulate:**
  - `color = Color("#556B73")` (soft desaturated teal-grey ambient).
- **Light2D Nodes:**
  - `DirectionalLight2D` (Sky Diffuse): `color = Color("#85A3C7")`, `energy = 0.7`.
  - `PointLight2D` (Path Lanterns): `color = Color("#B4A67A")`, `energy = 1.1`, subtle flicker (`energy = 1.1 + randf_range(-0.05, 0.05)`).
- **GPUParticles2D:**
  - *Rolling Ether Fog:* `emission_shape = Box(Vector2(1280, 200))`, `direction = Vector2(1, 0)`, `initial_velocity_min = 10.0`, `color = Color("#AFB7B9")` with 0.15 alpha.
- **Shaders Needed:**
  - `res://shaders/multi_layer_fog.gdshader`: Multi-layered scrolling noise pass for ground fog.
  - `res://shaders/liminal_water_flow.gdshader`: Slow scrolling UV distortion shader for ether-water.

---

### 5. Crystal Gardens

- **Reference Image URL:** `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/7b7add6ae_fae_crystal_gardens_mid.jpg`
- **Resolution:** 1920x1080 | **Mean Brightness:** 135.5 (High Contrast & Peak Brightness)

#### 1. Composition
- **Perspective:** Grand central axial perspective down a crystalline hall.
- **Layout:** Symmetrical arcade layout. Towering quartz and geode clusters frame left and right (`#837E7B`, `#A09A93`). A polished mirror-like walkway down the center leads toward a bright crystalline dome skylight (`#CECCC8`, `#D7D5CB`).
- **Key Architectural Elements:** Alabaster stone pillars, faceted quartz geodes, amethyst crystal geodes, polished marble reflective flooring, radiant crystal dome roof.

#### 2. Lighting
- **Light Sources & Distribution:**
  - *Primary Source:* Overhead crystal skylight dome (`#DCD8CC`, `#DEDACD`).
  - *Highlights:* Brilliant white specular crystal facet flashes (`#E4DFD1`, peak 255 brightness).
  - *Shadows:* Dark stone foundation and deep crystal clefts (`#26231A`, `#343332`, shadow `#18170E`).
  - *Midtones:* Warm quartz grey and pale alabaster (`#958E8B`, `#D4D0C8`).
- **Intensity & Mood:** Radiant, pristine, opulent, high magic conservatory, majestic and gleaming.

#### 3. Atmosphere & Textures
- Faceted sharp quartz crystal edges, mirror-polished marble floor, alabaster grain, sparkling dust motes, clean refractive air.

#### 4. Epilepsy Safety Rating
- **Rating:** ⚠️ **Caution / Needs Tuning**
- **Explanation:** High dynamic range contrast between bright crystal highlights (`#E4DFD1`, 255) and dark shadows (`#18170E`). If camera or character movement causes rapid specular flashes, it could induce high-contrast flickering.
- **Developer Remediation:** Clamp specular glint shader intensity, smooth reflection interpolation, and ensure sparkling particle emitters have minimum lifetime ramps (`>0.8s`) without high-frequency toggles.

#### 5. Best Use in 'Geode Inn'
- Geode Inn Grand Atrium / Crystal Conservatory / VIP Royal Suite / Gem Refining Workshop.

#### 6. Godot Translation Notes
- **CanvasModulate:**
  - `color = Color("#68645C")` (neutral warm alabaster ambient).
- **Light2D Nodes:**
  - `PointLight2D` (Dome Skylight): Positioned overhead. `color = Color("#E4DFD1")`, `energy = 2.2`, `shadow_enabled = true`.
  - `PointLight2D` (Crystal Cluster Accents): `color = Color("#CDC9C4")`, `energy = 0.9`.
- **GPUParticles2D:**
  - *Prismatic Glints:* `emission_shape = Box(Vector2(1200, 600))`, `lifetime = 1.2`, `scale_min = 0.5`, `color_ramp` transitioning white to gold to transparent.
- **Shaders Needed:**
  - `res://shaders/crystal_refraction_specular.gdshader`: Normal-mapped caustic refraction shader with clamped specular intensity.
  - `res://shaders/planar_floor_reflection.gdshader`: Polished floor reflection shader.

---

### 6. Stone Circle Chamber

- **Reference Image URL:** `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/f2f8e74f0_fae_stone_circle_mid.jpg`
- **Resolution:** 1280x720 | **Mean Brightness:** 37.3 (Extreme Dark / Spotlit Hearth)

#### 1. Composition
- **Perspective:** Low-angle centralized ritual circle view.
- **Layout:** Enclosed radial layout. Monolithic megalithic stones arranged in a tight ring (`#5D4224`, `#553C21`). Central fire hearth casting strong radial amber illumination outward (`#A2743D`, `#DBA56E`). Total pitch darkness shrouding upper vault and background (`#1C1916`, `#131211`).
- **Key Architectural Elements:** Weathered granite megaliths, carved rune grooves, central stone hearth pit, charcoal ash floor, ritual altar stone.

#### 2. Lighting
- **Light Sources & Distribution:**
  - *Primary Source:* Central hearth fire and rune pit (`#DBA56E`, `#A2743D`, highlight `#BB8952`).
  - *Highlights:* Warm bronze megalith inner face highlights (`#664A30`, `#A2743D`).
  - *Shadows:* Total pitch black cavern shadows outside the ring (`#131211`, shadow `#0E0D0D`).
  - *Midtones:* Deep charcoal umber stone (`#271F17`, `#46321E`).
- **Intensity & Mood:** Dramatic, high-contrast, intimate, sacred, solemn, ancient ritualistic warmth amidst deep void.

#### 3. Atmosphere & Textures
- Rough pitted granite, carved glowing runic incisions, swirling wood smoke, crackling embers, thick shadows.

#### 4. Epilepsy Safety Rating
- **Rating:** ⚠️ **Caution / Needs Tuning**
- **Explanation:** Fire light intensity variation in dark environments can cause rapid light intensity flickering if random noise frequency is too high.
- **Developer Remediation:** Drive fire light energy using low-frequency Perlin noise (frequency 0.5Hz–1.2Hz): `energy = 1.8 + 0.3 * noise.get_noise_1d(TIME)`. Avoid high-frequency `randf()` flickering.

#### 5. Best Use in 'Geode Inn'
- Ritual Summoning Room / Innkeeper's Secret Underground Hearth / Council Shrine / Ancient Binding Vault.

#### 6. Godot Translation Notes
- **CanvasModulate:**
  - `color = Color("#0D0C0B")` (near black ambient, making PointLight2D the dominant illumination).
- **Light2D Nodes:**
  - `PointLight2D` (Central Hearth Fire): Positioned at hearth center. `color = Color("#DBA56E")`, `energy = 2.2`, `texture_scale = 3.5`, `shadow_enabled = true`, `shadow_filter = SHADOW_FILTER_PCF5`.
  - `PointLight2D` (Rune Incision Glow): `color = Color("#A2743D")`, `energy = 0.6`.
- **GPUParticles2D:**
  - *Rising Embers:* `emission_shape = Circle(25)`, `gravity = Vector2(0, -60)`, `initial_velocity_min = 20.0`, `color_ramp` from `#DBA56E` to `#5E4224` to transparent.
- **Shaders Needed:**
  - `res://shaders/fire_heat_distortion_2d.gdshader`: Localized heat shimmer displacement above hearth.
  - `res://shaders/carved_rune_pulse.gdshader`: Glowing runic texture emission map.

---

# Part 2: World Map / Regional Reference

---

### 7. Parchment World

- **Reference Image URL:** `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/078905563_wm_parchment_world_mid.jpg`
- **Resolution:** 1280x720 | **Mean Brightness:** 165.9 (Warm Parchment Baseline)

#### 1. Composition
- **Perspective:** Top-down orthographic cartographic map view.
- **Layout:** Complete world map spread across an aged parchment manuscript. Vignetted leather borders (`#82633A`), central continent masses, hand-drawn ink coastline contours, compass rose, and regional callouts.
- **Key Architectural Elements:** Parchment paper substrate, burnt ink linework, hand-lettered banner labels, sea monster illustrations, compass rose.

#### 2. Lighting
- **Light Sources & Distribution:**
  - *Primary Substrate:* Warm sheepskin parchment (`#C7B28F`, `#BBA782`, `#CAB591`).
  - *Ink Lineart & Topography:* Burnt umber and sepia ink (`#7C5D35`, `#927346`, shadow `#82633A`).
  - *Highlights:* Aged paper highlight centers (`#CFB895`, `#CAB591`).
- **Intensity & Mood:** Uniform, warm desaturated UI style, historic, scholarly, exploratory.

#### 3. Atmosphere & Textures
- Fine paper grain, subtle water stains, creased leather map edges, vintage iron gall ink strokes.

#### 4. Epilepsy Safety Rating
- **Rating:** ✅ **Safe**
- **Explanation:** Static map UI texture with soft uniform lighting and zero dynamic flicker or motion.

#### 5. Best Use in 'Geode Inn'
- Main World Map Navigation Screen / Fast-Travel Menu UI / Quest Log Overview Map.

#### 6. Godot Translation Notes
- **CanvasModulate:**
  - `color = Color("#FFFFFF")` (Standard UI CanvasItem layer).
- **Light2D Nodes:**
  - Optional ambient UI light: `PointLight2D` at screen center (`color = Color("#CAB591")`, `energy = 0.3`) for desk lamp ambiance.
- **GPUParticles2D:**
  - *Ambient Study Dust:* Microscopic dust particles drifting over map UI.
- **Shaders Needed:**
  - `res://shaders/parchment_vignette.gdshader`: UI shader blending parchment paper noise, edge vignetting, and coffee stain layers.
  - `res://shaders/map_fog_of_war_burn.gdshader`: Discovers new regions with a charring/burning parchment dissolve edge.

---

### 8. Celtic Highlands

- **Reference Image URL:** `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/578102142_wm_celtic_highlands_mid.jpg`
- **Resolution:** 1280x720 | **Mean Brightness:** 110.1

#### 1. Composition
- **Perspective:** High-altitude regional overlook perspective.
- **Layout:** Sweeping moorland vista. Rolling green hills (`#4D4C3D`, `#60695F`) with a winding river valley slicing through the center. Overcast slate-blue cloud deck covering upper screen (`#A6BAC7`, `#C7D5D9`). Distant ruin perched on ridge top.
- **Key Architectural Elements:** Ruined stone watchtower, peat bog valley, stone field boundary walls, winding river, misty mountain ridges.

#### 2. Lighting
- **Light Sources & Distribution:**
  - *Primary Source:* Overcast diffused cloud deck (`#A6BAC7`, `#ADC0CB`, highlight `#C3D2D7`).
  - *Terrain Shadows:* Peat bog and dark valley shadows (`#363729`, `#282A1E`).
  - *Midtones:* Olive heather moorland (`#4D4C3D`, `#60695F`).
- **Intensity & Mood:** Overcast, cool, windswept, ancient, serene highland mood.

#### 3. Atmosphere & Textures
- Peat moss, wet heather, damp grey granite, river spray, low mist sweeping across valleys.

#### 4. Epilepsy Safety Rating
- **Rating:** ✅ **Safe**
- **Explanation:** Diffuse cloud lighting with smooth spatial luminance transitions.

#### 5. Best Use in 'Geode Inn'
- Celtic Highlands World Map Zone / Windswept Moorland Region outside the Inn.

#### 6. Godot Translation Notes
- **CanvasModulate:**
  - `color = Color("#6A706A")` (cool desaturated green-grey ambient).
- **Light2D Nodes:**
  - `DirectionalLight2D` (Overcast Sky): `color = Color("#A6BAC7")`, `energy = 0.9`, `rotation = deg_to_rad(90.0)`.
- **GPUParticles2D:**
  - *Highland Drizzle & Mist:* `emission_shape = Box(Vector2(1280, 100))`, `velocity = Vector2(35.0, 12.0)`, `color = Color("#C7D5D9")` at 0.3 alpha.
- **Shaders Needed:**
  - `res://shaders/cloud_shadow_scrolling.gdshader`: Multiplies terrain texture with moving cloud shadow noise map.
  - `res://shaders/river_water_flow.gdshader`: Scrolling river normal map shader.

---

### 9. Egyptian Desert

- **Reference Image URL:** `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/fd745563e_wm_egyptian_desert_mid.jpg`
- **Resolution:** 1280x720 | **Mean Brightness:** 113.8

#### 1. Composition
- **Perspective:** High-angle desert valley overview.
- **Layout:** Dynamic diagonal dune composition. Sweeping golden sand dunes sweep across left foreground (`#A8723E`, `#C68E52`, `#E6CDA3`). Deep sandstone canyon cliffs and obelisk/pyramid ruins frame right background (`#624D39`, `#433326`). Sun haze low on horizon (`#F0DDB5`).
- **Key Architectural Elements:** Weathered sandstone obelisks, half-buried pyramid apex, ancient stone steps, wind-rippled sand dunes.

#### 2. Lighting
- **Light Sources & Distribution:**
  - *Primary Source:* Intense desert sunlight and horizon haze (`#E6CDA3`, `#F0DDB5`, highlight `#F0DDB5`).
  - *Highlights:* Sun-bleached dune crests (`#E6CDA3`, `#E6C798`).
  - *Shadows:* Deep terracotta canyon shadows (`#433326`, shadow `#312318`).
  - *Midtones:* Warm ochre sand (`#866343`, `#C68E52`).
- **Intensity & Mood:** Harsh, brilliant, sun-baked, ancient, arid, majestic.

#### 3. Atmosphere & Textures
- Fine windblown sand ripples, heat shimmer haze, sun-bleached carved sandstone rock faces.

#### 4. Epilepsy Safety Rating
- **Rating:** ✅ **Safe**
- **Explanation:** High shadow contrast but completely static scene lighting with smooth heat haze movement.

#### 5. Best Use in 'Geode Inn'
- Arid Desert World Map Region / Solar Geode Excavation Site / Sun Temple Zone.

#### 6. Godot Translation Notes
- **CanvasModulate:**
  - `color = Color("#7A5E43")` (warm terracotta dark ambient).
- **Light2D Nodes:**
  - `DirectionalLight2D` (Desert Sun): `color = Color("#E6CDA3")`, `energy = 1.8`, `rotation = deg_to_rad(45.0)`.
  - `PointLight2D` (Horizon Haze): Positioned top right. `color = Color("#F0DDB5")`, `energy = 1.5`, `texture_scale = 4.0`.
- **GPUParticles2D:**
  - *Drifting Sand Dust:* `emission_shape = Line(1280)`, `direction = Vector2(1, -0.1)`, `initial_velocity_min = 40.0`, `color = Color("#C68E52")`.
- **Shaders Needed:**
  - `res://shaders/heat_haze_distortion.gdshader`: Screen-space heat distortion using sine wave displacement.
  - `res://shaders/dune_wind_ripples.gdshader`: Moving normal map for sand ripples.

---

### 10. Andean Highlands

- **Reference Image URL:** `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/bfe59bbb0_wm_andean_highlands_mid.jpg`
- **Resolution:** 1280x720 | **Mean Brightness:** 113.3

#### 1. Composition
- **Perspective:** Panoramic mountain range vista.
- **Layout:** Symmetrical mountain basin composition. Majestic snow-capped granite peaks dominate top half (`#8EC2F4`, `#91C4F2`, `#7EA2C9`, highlight `#9ED2F9`). Terraced agricultural steps and slate mountain gorges occupy lower half (`#5A635E`, `#444D4A`). Piercing azure sky above.
- **Key Architectural Elements:** Terraced Inca agricultural steps, slate stone bridges, snow-capped mountain peaks, glacial valley gorges.

#### 2. Lighting
- **Light Sources & Distribution:**
  - *Primary Source:* Crisp high-altitude alpine daylight (`#91C4F2`, `#8EC2F4`, highlight `#9ED2F9`).
  - *Highlights:* Glacial ice and snow crests (`#9ED2F9`, `#8EC2F4`).
  - *Shadows:* Slate cliff face shadows (`#2C322E`, shadow `#222723`).
  - *Midtones:* Slate grey rock and alpine turf (`#5A635E`, `#444D4A`).
- **Intensity & Mood:** Crisp, brilliant, cold, high-altitude, majestic, expansive.

#### 3. Atmosphere & Textures
- Glacial blue ice, raw granite slate, mountain grass, rare crystal-clear alpine atmosphere, wispy cloud plumes.

#### 4. Epilepsy Safety Rating
- **Rating:** ✅ **Safe**
- **Explanation:** Crisp high-luminance sky with stable mountain geometry and gentle cloud drift.

#### 5. Best Use in 'Geode Inn'
- Alpine Mountain World Map Region / Sky Observatory / Celestial Geode Sanctum.

#### 6. Godot Translation Notes
- **CanvasModulate:**
  - `color = Color("#5C666B")` (cool slate ambient).
- **Light2D Nodes:**
  - `DirectionalLight2D` (High-Altitude Sun): `color = Color("#91C4F2")`, `energy = 1.6`, `rotation = deg_to_rad(30.0)`.
- **GPUParticles2D:**
  - *Peak Snow Plumes:* `emission_shape = Line(800)`, `velocity = Vector2(-25.0, 5.0)`, `color = Color("#9ED2F9")` at 0.25 alpha.
- **Shaders Needed:**
  - `res://shaders/glacial_ice_glint.gdshader`: Specular spark shader on ice crests.
  - `res://shaders/mountain_depth_fog.gdshader`: Distance-based depth fog shader.

---

### 11. Norse Coast

- **Reference Image URL:** `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/5b2c39ba8_wm_norse_coast_mid.jpg`
- **Resolution:** 1920x1080 | **Mean Brightness:** 52.1 (Low Ambient / Twilight Horizon)

#### 1. Composition
- **Perspective:** High-angle sea cliff coastal overview.
- **Layout:** Dramatic fjord framing. Towering black basalt sea stacks and jagged cliffs frame left and right (`#101517`, `#1E2629`). Dark ocean water fills lower center (`#12191D`). A brilliant warm copper/magenta twilight sky stripe cuts horizontally across upper center (`#7F7480`, `#A58682`, `#DDB995`, highlight `#CCA68D`).
- **Key Architectural Elements:** Basalt sea stacks, Viking longhouse settlement on cliff, rocky shorelines, crashing ocean waves.

#### 2. Lighting
- **Light Sources & Distribution:**
  - *Primary Source:* Horizon twilight sun glow (`#DDB995`, `#A58682`, highlight `#CCA68D`).
  - *Highlights:* Sea spray foam and horizon sky stripe (`#CCA68D`, `#DDB995`).
  - *Shadows:* Near-black basalt sea cliffs (`#101517`, shadow `#080C0D`).
  - *Midtones:* Slate ocean water and purple sky clouds (`#1E2629`, `#7F7480`).
- **Intensity & Mood:** Dramatic, cold, moody, epic coastal twilight, fierce yet beautiful.

#### 3. Atmosphere & Textures
- Wet black basalt stone, crashing white sea foam, cold ocean spray, dusk twilight sky gradient.

#### 4. Epilepsy Safety Rating
- **Rating:** ✅ **Safe**
- **Explanation:** Dark scene (mean brightness 52.1) with steady warm twilight horizon contrast. No strobing or rapid flicker.

#### 5. Best Use in 'Geode Inn'
- Coastal Fjord World Map Zone / Northern Sea Port / Tempest Geode Shoreline.

#### 6. Godot Translation Notes
- **CanvasModulate:**
  - `color = Color("#182024")` (deep cold navy ambient).
- **Light2D Nodes:**
  - `PointLight2D` (Horizon Twilight Strip): Positioned at horizon center. `color = Color("#A58682")`, `energy = 1.5`, `texture_scale = Vector2(4.0, 1.0)`.
  - `PointLight2D` (Water Sky Reflection): `color = Color("#DDB995")`, `energy = 0.6`.
- **GPUParticles2D:**
  - *Cliff Base Sea Spray:* `emission_shape = Line(1920)`, `velocity = Vector2(10.0, -20.0)`, `color = Color("#7F7480")` with 0.3 opacity.
- **Shaders Needed:**
  - `res://shaders/ocean_twilight_reflection.gdshader`: Wave displacement shader with horizon twilight color palette.
  - `res://shaders/wet_basalt_specular.gdshader`: Normal map specular shader for wet sea rocks.

---

### 12. Transylvanian Forest

- **Reference Image URL:** `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/7ff65954e_wm_transylvanian_forest_mid.jpg`
- **Resolution:** 1280x720 | **Mean Brightness:** 47.4 (Low Ambient / Gothic Twilight)

#### 1. Composition
- **Perspective:** Eye-level dark forest corridor view looking up toward a mountain fortress.
- **Layout:** Dense gothic woodland panorama. Dark coniferous canopy shrouds lower screen (`#161A17`, `#2F2D27`). Gothic castle spires pierce low mountain mist in upper center (`#4B4136`, `#B28E6C`). Winding forest path flanked by gnarled pines.
- **Key Architectural Elements:** Gothic castle spires, wrought iron gates, gnarled pine trees, stone boundary cairns, misty forest trail.

#### 2. Lighting
- **Light Sources & Distribution:**
  - *Primary Source:* Low autumn sun burning through mist behind castle (`#B28E6C`, `#736049`, highlight `#B28E6C`).
  - *Highlights:* Autumn leaf decay and mist light behind spires (`#B28E6C`, `#736049`).
  - *Shadows:* Deep forest shadow black (`#161A17`, shadow `#0C0E0E`).
  - *Midtones:* Muted bronze wood and grey slate roof (`#2F2D27`, `#35322E`).
- **Intensity & Mood:** Gothic, eerie, melancholic, autumnal, mysterious, shadowy.

#### 3. Atmosphere & Textures
- Pine needle litter, autumn leaf rot, damp fog, weathered slate castle roofs, wrought iron rust.

#### 4. Epilepsy Safety Rating
- **Rating:** ✅ **Safe**
- **Explanation:** Low average brightness (47.4) with desaturated bronze fog and static geometry.

#### 5. Best Use in 'Geode Inn'
- Dark Forest World Map Region / Gothic Castle Grounds / Shadow Geode Grove.

#### 6. Godot Translation Notes
- **CanvasModulate:**
  - `color = Color("#181B19")` (dark gothic amber-grey ambient).
- **Light2D Nodes:**
  - `PointLight2D` (Mist Behind Castle): Placed behind castle silhouette. `color = Color("#B28E6C")`, `energy = 1.6`, `texture_scale = 2.5`.
- **GPUParticles2D:**
  - *Falling Autumn Pine Needles:* `emission_shape = Box(Vector2(1280, 50))`, `direction = Vector2(0.2, 1.0)`, `color = Color("#736049")`.
- **Shaders Needed:**
  - `res://shaders/gothic_fog_layer.gdshader`: Multi-layered scrolling fog noise pass.
  - `res://shaders/spire_silhouette_blend.gdshader`: Alpha distance mask for distant castle spires.

---

### 13. Stonehenge

- **Reference Image URL:** `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/cd55bbf6b_wm_stonehenge_mid.jpg`
- **Resolution:** 1280x720 | **Mean Brightness:** 100.0

#### 1. Composition
- **Perspective:** Low eye-level solstice vista over megalithic stone circle.
- **Layout:** Centered panoramic layout. Massive sarsen megaliths silhouette against a deep purple/violet twilight sky (`#A4A0C0`, `#8B88A0`). A brilliant golden sunset rim light cuts across the horizon between stone pillars (`#D7B8AA`, `#A57D64`, highlight `#E1C1AC`). Grass plain foreground (`#222A26`, `#393C31`).
- **Key Architectural Elements:** Monolithic sarsen megaliths, lintel stones, grassy earthen bank, horizon sun beam gap.

#### 2. Lighting
- **Light Sources & Distribution:**
  - *Primary Source:* Horizon solstice sunset gap (`#D7B8AA`, `#E1C1AC`, highlight `#E1C1AC`).
  - *Sky Gradient:* Deep twilight lavender and purple (`#A4A0C0`, `#8B88A0`, `#9799BE`).
  - *Shadows:* Megalith silhouettes and dark turf (`#222A26`, `#393C31`, shadow `#161E1A`).
  - *Midtones:* Warm coral stone rim light (`#A57D64`, `#655143`).
- **Intensity & Mood:** Ancient, astronomical, solemn, magical, timeless solstice alignment.

#### 3. Atmosphere & Textures
- Weathered sarsen stone with lichen crusts, rolling green turf, clear twilight atmosphere.

#### 4. Epilepsy Safety Rating
- **Rating:** ✅ **Safe**
- **Explanation:** Smooth twilight sky gradient and static stone silhouettes.

#### 5. Best Use in 'Geode Inn'
- Solstice Ritual Site / World Map Landmark / Astronomical Observatory.

#### 6. Godot Translation Notes
- **CanvasModulate:**
  - `color = Color("#322B38")` (deep twilight purple ambient).
- **Light2D Nodes:**
  - `PointLight2D` (Solstice Horizon Rim Light): Placed on horizon. `color = Color("#D7B8AA")`, `energy = 1.8`, `texture_scale = Vector2(5.0, 0.8)`.
  - `DirectionalLight2D` (Sky Ambient): `color = Color("#A4A0C0")`, `energy = 0.6`.
- **GPUParticles2D:**
  - *Solstice Starlight / Fireflies:* `emission_shape = Box(Vector2(1280, 400))`, `color = Color("#E1C1AC")` with slow alpha pulsation.
- **Shaders Needed:**
  - `res://shaders/twilight_sky_gradient.gdshader`: Procedural 2-color vertical sky gradient shader.
  - `res://shaders/megalith_rim_lighting.gdshader`: Rim-lighting normal shader for stone edges.

---

### 14. Japanese Mountain Temple

- **Reference Image URL:** `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/70cd7ecbd_wm_japanese_temple_mid.jpg`
- **Resolution:** 1280x720 | **Mean Brightness:** 101.0

#### 1. Composition
- **Perspective:** High eye-level vista down mossy stone steps toward a mountain shrine.
- **Layout:** Framed oriental vista. Crimson autumn maple canopy arches across top screen (`#874B41`). Pagoda roof eaves and torii gate frame right midground (`#30322F`, `#3B3F3E`). Mossy stone steps and ancient cedar trees occupy left (`#70816A`, `#4E5750`). Mountain fog shrouds background (`#A3A793`, `#B8C1BC`).
- **Key Architectural Elements:** Wooden pagoda eaves, vermilion torii arch, mossy stone steps, stone lanterns (*tōrō*), maple branch canopy.

#### 2. Lighting
- **Light Sources & Distribution:**
  - *Primary Source:* Soft desaturated mountain fog daylight (`#A3A793`, `#B8C1BC`, highlight `#C0CAC8`).
  - *Accent Highlight:* Crimson autumn maple leaves (`#874B41`, vermilion red).
  - *Shadows:* Dark cedar bark and pagoda eaves (`#30322F`, shadow `#1F2222`).
  - *Midtones:* Sage moss green (`#4E5750`, `#6A776B`).
- **Intensity & Mood:** Zen, serene, spiritual, peaceful autumn mountain sanctuary.

#### 3. Atmosphere & Textures
- Dark weathered cedar wood, vermilion lacquer, moss-draped stone lanterns, swirling mountain fog, falling maple leaves.

#### 4. Epilepsy Safety Rating
- **Rating:** ✅ **Safe**
- **Explanation:** Peaceful, desaturated sage and fog palette with gentle red leaf accents. Zero strobing.

#### 5. Best Use in 'Geode Inn'
- Eastern Mountain Temple World Map Region / Zen Garden / Spirit Geode Shrine.

#### 6. Godot Translation Notes
- **CanvasModulate:**
  - `color = Color("#4A524A")` (mellow sage ambient).
- **Light2D Nodes:**
  - `DirectionalLight2D` (Mountain Fog Light): `color = Color("#B8C1BC")`, `energy = 1.1`.
  - `PointLight2D` (Stone Lantern Glow): Placed at lanterns. `color = Color("#874B41")`, `energy = 1.0`, `texture_scale = 1.2`.
- **GPUParticles2D:**
  - *Falling Crimson Maple Leaves:* `emission_shape = Line(1280)`, `direction = Vector2(0.4, 1.0)`, `angular_velocity_min = 40.0`, `color = Color("#874B41")`.
- **Shaders Needed:**
  - `res://shaders/maple_leaf_wind.gdshader`: Swaying branch vertex shader.
  - `res://shaders/mountain_mist_scrolling.gdshader`: Multi-layered scrolling fog shader.

---

## Technical Summary Matrix for Godot Implementation

| Zone Name | CanvasModulate | Primary Light Color & Energy | Key Particle System | Epilepsy Rating |
| :--- | :--- | :--- | :--- | :---: |
| **Crossing Threshold** | `#3B3326` | `#73826A` (Energy 1.8) | Pollen Dust Motes (`#9CAE96`) | ✅ Safe |
| **Summerlands** | `#4A4633` | `#D6CB98` (Energy 1.4) | Falling Golden Leaves (`#D6CB98`) | ✅ Safe |
| **The Hollow** | `#121B26` | `#6C8EB9` (Energy 1.2) | Bio-luminescent Spores (`#99C0EC`) | ✅ Safe |
| **The Between** | `#556B73` | `#85A3C7` (Energy 0.7) | Rolling Ether Fog (`#AFB7B9`) | ✅ Safe |
| **Crystal Gardens** | `#68645C` | `#E4DFD1` (Energy 2.2) | Prismatic Glints (`#E4DFD1`) | ⚠️ Caution |
| **Stone Circle Chamber** | `#0D0C0B` | `#DBA56E` (Energy 2.2) | Hearth Embers (`#DBA56E`) | ⚠️ Caution |
| **Parchment World** | `#FFFFFF` | `#CAB591` (Energy 0.3) | Ambient Study Dust | ✅ Safe |
| **Celtic Highlands** | `#6A706A` | `#A6BAC7` (Energy 0.9) | Highland Drizzle (`#C7D5D9`) | ✅ Safe |
| **Egyptian Desert** | `#7A5E43` | `#E6CDA3` (Energy 1.8) | Drifting Sand Dust (`#C68E52`) | ✅ Safe |
| **Andean Highlands** | `#5C666B` | `#91C4F2` (Energy 1.6) | Peak Snow Plumes (`#9ED2F9`) | ✅ Safe |
| **Norse Coast** | `#182024` | `#A58682` (Energy 1.5) | Sea Spray Foam (`#7F7480`) | ✅ Safe |
| **Transylvanian Forest** | `#181B19` | `#B28E6C` (Energy 1.6) | Pine Needles (`#736049`) | ✅ Safe |
| **Stonehenge** | `#322B38` | `#D7B8AA` (Energy 1.8) | Solstice Starlight (`#E1C1AC`) | ✅ Safe |
| **Japanese Mountain Temple** | `#4A524A` | `#B8C1BC` (Energy 1.1) | Crimson Maple Leaves (`#874B41`) | ✅ Safe |

---
*Catalog generated for Geode Inn project. Color codes and specs ready for Godot 4.x import.*
