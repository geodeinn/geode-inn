# Bringing in the real art

Everything in the world is a placeholder built from simple shapes, so any
piece can be swapped for a real model without touching the game rules.

## Characters

- Format: glTF binary (.glb), Y up, 1 unit = 1 meter, feet at the origin,
  facing -Z. Around 1.6 to 1.9 m tall for human-sized characters.
- Budget for the first release: about 15k to 30k triangles per character, one
  or two 2K textures. The same high-detail sculpt used for action figures can
  be reduced to this (a "game copy").
- Animations in the same .glb: idle, walk, talk, sit. Names exactly like that.
- File: `assets/models/characters/<id>.glb` where id matches
  `data/characters.json` (host, crone, marijke, zeke...). Add
  `"model": "res://assets/models/characters/<id>.glb"` to that character.

## Props and rooms

- Same .glb rules. Put them under `assets/models/props/` and
  `assets/models/rooms/`.
- Rooms can arrive as one model per zone; collision gets added in Godot.

## Portraits

- Already wired: `assets/portraits/*.jpg` (the client's concept images).
  Square images, 512 px or more.

## Before release

- Steam requires disclosing AI-generated content on the store page, so note
  which art was made with AI tools.
- Names, faces and voices in the shipped game must be the client's own
  originals (no real actors' likeness, no other studios' characters).
