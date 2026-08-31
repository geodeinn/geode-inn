# Tumble Run — DLC Pack Specs

**Base game:** $4.99 on Steam
**DLC model:** 3 themed packs at $2.99 each, or $7.99 season pass

---

## DLC 1: Canopy City (Evil Version)

**Theme:** The Inn's Canopy — where Rackham-style twisted vines and ancient tree spirits dwell. This is the "evil version" — the Canopy has gone dark, and the creatures that were once friendly are now hazards.

**New zones (4):**
1. **The Canopy Entrance** — Tumble climbs upward for the first time (reversed gravity sections). Vines grab at the player. Background: Rackham-inspired twisted trees, deep greens and purples.
2. **The Hornet's Highway** — Aerial chase sequence. Giant hornets replace ground hazards. Tumble must dodge between branches while hornets dive from above.
3. **The Hollow Tree** — Vertical descent inside a massive hollow tree. Player falls and must steer between inner walls. Petriwood sap traps slow Tumble.
4. **The Canopy Heart** — Boss zone. The Canopy Mother — an ancient tree spirit — has been corrupted. Tumble must collect 5 rare stones to play a chord that purifies the Heart. No combat — pure collection under pressure.

**New stones (5 exclusive):**
- Canopy Amber, Hornet's Jade, Petrified Bark, Hollow Core Crystal, Heartwood Diamond

**New hazards:**
- Grabbing vines (hold player for 1 second)
- Falling branches (telegraphed by shadow on ground)
- Sap pools (slow player movement)
- Hornet swarms (chase patterns)

**New music:** Rackham-inspired — strings and woodwinds processed through deep sub-bass at 50 BPM, with corrupted versions that detune when hazards are near.

---

## DLC 2: The Whisper Layer

**Theme:** The Inn's archive becomes self-aware. Books fly off shelves, texts rearrange themselves, and the Whisper Layer writes about Tumble in real time. This is the atmospheric horror DLC — not jump scares, but creeping unease.

**New zones (4):**
1. **The Shifting Stacks** — Library corridors that rearrange between runs. The layout changes every time you play. Book avalanches are the primary hazard.
2. **The Restricted Section** — Dark zone where Tumble can only see a small radius around themselves. Stones glow in the dark, but so do hazards.
3. **The Margin Notes** — A text-based zone where the words themselves form platforms and pits. Tumble runs on sentences and jumps between paragraphs. The text is written by the Whisper Layer about the player's current run.
4. **The Unwritten** — The final zone. Blank pages. No hazards, no stones — just Tumble and white space. The player must find the one word that completes the page. When they do, the zone fills with stones and the Whisper Layer goes quiet.

**New mechanic: The Read/Unread system**
- Each stone collected in this DLC has a text fragment. Collecting enough fragments reveals a hidden story about the Inn's creation.
- The Whisper Layer writes commentary about the player's playstyle on the walls. "The dragon hesitates at jumps." "The dragon collects recklessly." This text becomes platforms in Zone 3.

**New stones (5 exclusive):**
- Whisper Quartz, Margin Gold, Restricted Opal, Unwritten Moonstone, The Final Word

**New music:** Near-silent. Ambient room tone with occasional page-turn sounds. When the Whisper Layer writes, a single piano note plays. The final zone has no music — just the sound of a pen.

---

## DLC 3: The Shadow Inn

**Theme:** The Inn at 84Hz. Everything is still. Everything is stone. Tumble must navigate the petrified Inn where movement itself is the hazard — the more you move, the more the Shadow Inn notices you.

**New zones (4):**
1. **The Petrified Floor** — The Main Floor turned to stone. Tumble moves slower. Hazards don't move — they activate when Tumble gets close. Medusa's gaze sweeps the zone periodically (telegraphed by a red glow).
2. **The Frozen Market** — The Marketplace, but every stall is stone. The stones here are embedded in the petrified stalls and must be extracted carefully (timing-based extraction minigame, not collection).
3. **The Lithophone** — Gorgon's Garden's stone instrument. Each platform is a stone note. Tumble must jump in sequence to play a chord. Wrong notes petrify Tumble for 2 seconds.
4. **The Still Point** — The deepest point of the Shadow Inn. No movement — Tumble must hold still while the zone transforms around them. Stones appear and must be collected in a specific order based on their frequencies. The zone completes when Tumble plays the Inn's fundamental frequency (42Hz) from stone notes.

**New mechanic: The Stillness Meter**
- A new HUD element. Moving fills the meter; standing still drains it. If the meter fills completely, Tumble petrifies (game over).
- Some zones require movement (dodging Medusa's gaze). Some require stillness (the Lithophone). The tension between the two is the DLC's core challenge.

**New stones (5 exclusive):**
- Shadow Onyx, Petrified Sunstone, Lithophone Quartz, Still Point Diamond, The Gorgon's Tear

**New music:** 84Hz drone bass throughout. No melody — just the hum of stone. The Lithophone zone adds percussive stone strikes. The Still Point is completely silent except for Tumble's heartbeat (50 BPM).

---

## IMPLEMENTATION NOTES

**Engine:** All DLC uses the same TumbleRun.gd base. New zones are data-driven (zone configs loaded from JSON). New mechanics (Stillness Meter, Read/Unread system) are modular systems added via Godot's node system.

**Steam integration:** Each DLC is a separate Steam app ID with its own achievements:
- Canopy City: "Heart Purified" (complete the Canopy Heart), "Hornet Dodger" (complete Zone 2 without taking damage)
- Whisper Layer: "The Final Word" (find the word in The Unwritten), "Speed Reader" (complete all 4 zones in under 5 minutes)
- Shadow Inn: "The Still Point" (complete the final zone), "Stone Cold" (complete the entire DLC without petrifying)

**Cross-promotion:** Each DLC unlocks stones that appear in the base game's collection screen, the tabletop game's Stone Cards, and the card game's card pool. This makes the DLC valuable beyond the arcade game itself.

**Pricing:**
- Base game: $4.99
- Each DLC: $2.99
- Season pass (all 3): $7.99
- Complete edition (base + all DLC): $10.99

---

*Written in the voice of six: Rothfuss (each mechanic must be precise), Pratchett (the humor underneath the horror), Gaiman (the mythic weight of stone), Asimov (the systems that hold it together), Bradbury (the fire that doesn't burn), and Weir (the math that proves the fire was never going to go out).*
