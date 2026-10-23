# Art in the game, and bringing in the client's own

Since 0.3 the world is dressed with free CC0 art (see `CREDITS.md`): real
characters with animations, creatures, furniture, plants and textured
surfaces. Any piece can still be swapped for the client's own models without
touching the game rules.

## How the current art is put together

| Part | Where | How |
|---|---|---|
| People | `scripts/world/character_model.gd` | Built from the character kit: an outfit (peasant or ranger, mixable per slot, hood, pauldron), the base body's head, eyes, brows, hair and beard, tints for skin, hair and cloth, and the shared animation library. Each cast member's look is the `"look"` block in `data/characters.json` |
| Animations | `assets/characters/anim` | One library for everyone, retargeted onto Godot's humanoid skeleton at import (`tools/setup_imports.py` writes the bone maps). Idle, walk, jog, sit, talk, dance and ~40 more |
| Creatures | `scripts/world/creatures.gd` | Wolf, baby dragon (posed asleep from its rig), barn owl from model files; Ziggy, Pluck, the frog, Naut's head and Brindle's cap shaped in code. `"creature"` in `data/characters.json` |
| Surfaces | `Builder.skin()` / `Builder.SURFACES` | Each zone names its palette colors (planks, brick, thatch, grass...). Every box and post in that color, or a lighter/darker shade of it, gets the texture, tinted back to the palette color. Boxes carry UVs in metres, so nothing stretches |
| Props and plants | `Builder.prop()`, `Builder.scatter()` | Kit models by name. Plants and stones are drawn in batches (MultiMesh) and fade out past ~45 m |
| Fire, lights | `Builder.flame()`, `Builder.lantern()`, `Builder.wisp()` | Particle flames, wall lanterns with their light, living lights for the Echo and companions |

Tools: `tools/install_kits.py` (copies the packs in, textures at 1024 px),
`tools/setup_imports.py` (import settings and bone maps; run, then
`godot --headless --path . --import`), `tools/make_outfit_variants.py` (dyed
outfit textures), `tools/model_preview.tscn`, `tools/prop_preview.tscn` and
`tools/creature_probe.tscn` (offscreen renders for checking), and
`tools/prop_catalog.gd` (sizes of every kit model).

## Swapping in the client's own art

### Characters

- Format: glTF binary (.glb), Y up, 1 unit = 1 meter, feet at the origin,
  facing -Z. Around 1.6 to 1.9 m tall for human-sized characters.
- Budget: about 15k to 30k triangles per character, one or two 2K textures.
  The same high-detail sculpt used for action figures can be reduced to this.
- Animations in the same .glb: idle, walk, talk, sit (names exactly like that).
  Or rig the model as a humanoid and it can use the shared library instead.
- File: `assets/models/characters/<id>.glb` where id matches
  `data/characters.json`, then add `"model": "res://assets/models/characters/<id>.glb"`
  to that character. A "model" wins over "look" and "creature".
- The player: `assets/models/characters/player_<class>.glb`.

### Props and rooms

- Same .glb rules. Put them under `assets/models/props/` and
  `assets/models/rooms/`; `Builder.model_or_box()` and `Builder.prop()` load by path or name.
- Rooms can arrive as one model per zone; collision gets added in Godot.

### Portraits

- Already wired: `assets/portraits/*.jpg` (the client's concept images).
  Square images, 512 px or more.

## Before release

- Keep `CREDITS.md` with the build and show the barn owl's CC-BY credit line
  in the game's credits.
- Steam requires disclosing AI-generated content on the store page, so note
  which art was made with AI tools.
- Names, faces and voices in the shipped game must be the client's own
  originals (no real actors' likeness, no other studios' characters).
