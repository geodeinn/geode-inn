# Art credits and licenses

Every model, texture and sky in this build comes from the sources below. All
but one are CC0 (public domain, no attribution needed; credited anyway). The
barn owl is CC-BY 3.0 and needs the credit line below wherever the game's
credits are shown.

## Quaternius (quaternius.com), CC0 1.0

| Pack | Used for | In the project |
|---|---|---|
| Universal Base Characters [Standard] | Heads, eyes, brows, hair and beards | `assets/characters/base`, `assets/characters/hair` |
| Modular Character Outfits - Fantasy [Standard] | Every outfit (peasant, ranger, hoods, pauldrons) | `assets/characters/outfits` |
| Universal Animation Library [Standard] | All character animations (idle, walk, jog, sit, talk, dance...) | `assets/characters/anim` |
| Animal Pack Vol.2 | The wolf | `assets/creatures/Wolf.fbx` |
| Animated Monster Pack | The baby dragon | `assets/creatures/Dragon.fbx` |
| Fantasy Props MegaKit [Standard] | Furniture, stalls, lanterns, chandeliers, books, tools, barrels | `assets/props` |
| Stylized Nature MegaKit [Standard] | Trees, bushes, grass, flowers, ferns, mushrooms, rocks, stepping stones | `assets/nature` |
| Medieval Village MegaKit [Standard] | Wall, brick, cobble, plaster and roof-tile textures; wagon, vines, fences | `assets/village`, `assets/textures/village` |

## Poly Haven (polyhaven.com), CC0 1.0

| Asset | Author | In the project |
|---|---|---|
| Old Wood Floor | Guillaume Monsergent | `assets/textures/surfaces/old_wood_floor` |
| Old Planks 02 | Rob Tuytel | `assets/textures/surfaces/old_planks_02` |
| Dark Wooden Planks | Amal Kumar | `assets/textures/surfaces/dark_wooden_planks` |
| Brown Planks 05 | Rob Tuytel | `assets/textures/surfaces/brown_planks_05` |
| Reed Roof 04 | Rob Tuytel | `assets/textures/surfaces/reed_roof_04` |
| Leafy Grass | Charlotte Baglioni | `assets/textures/surfaces/leafy_grass` |
| Forest Ground 04 | Rob Tuytel, Rico Cilliers | `assets/textures/surfaces/forest_ground_04` |
| Coast Sand 01 | Rob Tuytel | `assets/textures/surfaces/coast_sand_01` |
| Kloofendal 48d Partly Cloudy (Pure Sky), HDRI | Greg Zaal, Jarod Guest | `assets/sky` |

## CC-BY 3.0 (credit required)

"Barn Owl" by Poly by Google, licensed under CC-BY 3.0
(https://creativecommons.org/licenses/by/3.0/), via Poly Pizza
(https://poly.pizza/m/7BGjfcacWkz). Used as the Owl who keeps the
lighthouse light. `assets/creatures/BarnOwl.glb`, unchanged apart from scale.

## Changes made here

- Textures scaled down to 1024 px (the game's import limit).
- Outfit textures dyed into extra colors by `tools/make_outfit_variants.py`
  (`assets/characters/outfits/variants`).
- Heads cut from the base bodies at runtime (the outfits bring their own arms
  and hands); the dragon recolored to the canon's amethyst and gold and posed
  asleep in code.
- Ziggy, Pluck, the frog, Naut's squid head and Brindle's mushroom cap are
  shaped in code (`scripts/world/creatures.gd`), not taken from any pack.

The client's own concept portraits in `assets/portraits` are the client's.
