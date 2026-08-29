> DEPRECATED - SUPERSEDED BY geode_inn_quest_integration_native_system.md. This document was designed for an AzerothCore/WoW emulator prototype. The Geode Inn now uses native game architecture. Kept for design reference only.
# Geode Inn — Celtic Stone Circle Quest Chain
## Zone: Teldrassil → "The Sacred Grove" (Druidic/Celtic Reskin)

### Overview

A 7-quest chain that takes the player from arriving at the Sacred Grove through building a stone circle, learning Ogham writing, understanding druidic astronomy, and ultimately igniting the Fae Kingdom portal. This is the entry point to the entire Fae Kingdom — completing this chain is what unlocks the portal.

Each quest teaches a real aspect of Celtic/Druidic culture through gameplay mechanics, not exposition dumps. The player learns by doing.

---

## NPC Cast

| NPC | Role | Character Catalog Entry |
|-----|------|------------------------|
| **Elder Cian** | Quest giver — old druid, white robe, oak staff | Full Presence (like the Owl) |
| **Branwen** | Craft teacher — stone mason, leather apron, strong build | Chibi NPC |
| **Taliesin** | Ogham scholar — thin, hooded, carries tablets | Chibi NPC |
| **Arianrhod** | Astronomer — silver-haired, observes stars from hilltop | Full Presence |
| **The Oak** | Ancient tree spirit — optional side quest giver | Ambulatory (like Cthulhu) |
| **Chibi Fae** | Mischievous helpers — appear after stones are placed | Chibi Fae NPCs |

---

## Quest 1: "The Empty Circle"

**Giver:** Elder Cian, standing in a clearing with a ring of holes in the ground
**Prerequisite:** None (starter quest)

**Quest Text:**
*"You feel it before you see it — the hum in the earth, the way the trees lean inward. This place was meant for something. The old circle stood here once, before the forgetting. The stones were taken for walls, for bridges, for fear. But the ground remembers. Can you?"*

**Objectives:**
- Explore the Sacred Grove and find 3 foundation markers (interact with ground depressions)
- Listen to the earth at each marker (short audio cue — different tone at each)
- Return to Elder Cian

**Mechanic:** Exploration + environmental awareness. The three markers are at specific compass points — N, SE, SW — teaching the player the triangular foundation of Celtic stone circles.

**Cultural Teaching:** Stone circles weren't random — they were precisely placed on landscape alignments. The triangular/solar alignment is foundational to Celtic archaeoastronomy.

**Reward:** 50 reputation with Druidic Circle, "Grove Walker" title

---

## Quest 2: "The Language of Trees"

**Giver:** Taliesin, the Ogham scholar
**Prerequisite:** Complete "The Empty Circle"

**Quest Text:**
*"The stones will not hold their place unless they know their names. Before we build, you must learn to speak as the druids spoke — not with ink and parchment, but with the trees themselves. Each letter is a tree. Each tree is a sound. Each sound is a power. I will teach you five."*

**Objectives:**
- Learn the Ogham alphabet (interactive lesson with Taliesin)
  - **Beith** (Birch) — beginnings, purification
  - **Luis** (Rowan) — protection, vision
  - **Fearn** (Alder) — courage, water
  - **Saille** (Willow) — intuition, cycles
  - **Nion** (Ash) — connection, the World Tree
- Find 5 Ogham-inscribed stones scattered in the grove (each has a single Ogham letter carved into it)
- Identify each letter correctly (multiple choice at each stone)
- Return to Taliesin

**Mechanic:** Language puzzle. The player learns 5 real Ogham letters, then must identify them on physical stones. Wrong answers give hints, not penalties.

**Cultural Teaching:** Ogham is a real early medieval Irish alphabet, with each letter associated with a specific tree and spiritual meaning. It was carved on stone edges and used for memorials and territorial markers.

**Reward:** 75 reputation with Druidic Circle, Ogham Primer (usable item — reveals hidden Ogham inscriptions in other zones)

---

## Quest 3: "Stone from the Earth"

**Giver:** Branwen, the stone mason
**Prerequisite:** Complete "The Language of Trees"

**Quest Text:**
*"Pretty words won't raise stones. You need the right rock — not just any stone will sing. The old ones used bluestone from the far hills, carried by water and ice and stubborn will. We have no glacier to help us, but we have something better. You."*

**Objectives:**
- Travel to the quarry (small cave in the zone — repurposed existing cave instance entrance)
- Identify the correct stone type from 4 options (only Preseli bluestone has the right resonant tone)
  - The player tests each stone by striking it — only the bluestone rings clear
  - The other three stones produce dull thuds (audio feedback)
- Mine 5 bluestone blocks (interact with deposit, 3-second cast per block)
- Return to Branwen

**Mechanic:** Material identification through sound. The player must distinguish the resonant stone from non-resonant ones by listening. This connects to the Geode Inn's 111Hz resonance theme and the gargoyle sentinels.

**Cultural Teaching:** Stonehenge's bluestones were transported ~140 miles from the Preseli Hills in Wales to Salisbury Plain. The stones were chosen for their acoustic properties — they ring when struck. Recent archaeological research confirms the stones' sonic qualities were known to Neolithic peoples.

**Reward:** 100 reputation with Druidic Circle, 5 Preseli Bluestone Blocks (quest item, appears in inventory)

---

## Quest 4: "The Sky Map"

**Giver:** Arianrhod, the astronomer
**Prerequisite:** Complete "Stone from the Earth"

**Quest Text:**
*"Any fool can stack stones. A circle of rock is just a fence. What makes it a place of power is the sky. The sun does not rise where you think it rises — it moves. Every dawn is a different dawn. But on certain days, it returns to the same point. Those are the days we mark. Those are the days we build for."*

**Objectives:**
- Observe the sunrise from 3 positions (dawn simulation — time accelerates)
  - Position 1: Northeast — observe summer solstice sunrise (northernmost sunrise)
  - Position 2: Southeast — observe winter solstice sunrise (southernmost sunrise)
  - Position 3: East — observe equinox sunrise (due east)
- Place alignment markers at each position
- Return to Arianrhod

**Mechanic:** Astronomical observation. The player watches accelerated sunrises from different positions and must identify where the sun rises at each. The zone has a visible horizon line, and the sun's position shifts based on the date (shown as text overlay during the time-acceleration).

**Cultural Teaching:** Stone circles were solar calendars. The alignment of stones to solstice and equinox sunrises is documented at Stonehenge, Newgrange, Maeshowe, and hundreds of other sites. The astronomical knowledge required was sophisticated — these were observatories.

**Reward:** 100 reputation with Druidic Circle, Sky Map (usable item — reveals solar alignment lines in the zone)

---

## Quest 5: "Raising the Stones"

**Giver:** Elder Cian (returned to clearing)
**Prerequisite:** Complete "The Sky Map" + have 5 Bluestone Blocks

**Quest Text:**
*"Now you know the earth and the sky. Now you know the words and the stone. Place the bluestones where the sky tells you — where the sun will find them. When the stones stand in their rightful places, the grove will remember what it was."*

**Objectives:**
- Place 5 bluestone blocks at the 5 alignment markers (phased construction — zone visually changes as each stone is placed)
  - The Sky Map overlay shows where each stone goes
  - Each stone requires a short "raising" cast (5 seconds — visual of the stone being levered upright)
  - After each placement, the zone environment shifts slightly — more light, more color, chibi Fae begin appearing
- After all 5 stones are placed, stand in the center of the circle
- Witness the circle activate (cutscene — the stones hum, light lines connect them, the grove transforms)

**Mechanic:** Phased zone modification. This is the big moment — the player literally builds the stone circle and watches the world change around them. Each stone placed makes the grove more alive. The chibi Fae appear one by one as the stones go up.

**Cultural Teaching:** Stone circle construction was a community effort, not a single ruler's decree. The phased construction reflects real archaeological evidence of multi-phase building at Stonehenge and other sites over centuries. The transformation of the environment mirrors how sacred landscapes were conceptually transformed by the act of building.

**Reward:** 200 reputation with Druidic Circle (large jump), "Stone Raiser" title

---

## Quest 6: "The Solstice Chant"

**Giver:** Elder Cian
**Prerequisite:** Complete "Raising the Stones"

**Quest Text:**
*"The stones stand. The sky is mapped. But stone is dead matter without voice. The old druids knew that sound shapes matter — a tone held long enough can crack stone or mend it. The resonance of the bluestone is real. You must learn the chant that wakes the circle."*

**Objectives:**
- Learn the 3-tone sequence from Elder Cian (interactive — each tone maps to a stone)
  - **Low tone (64Hz)** — earth, grounding, the base
  - **Middle tone (111Hz)** — the resonance of ancient sites, altered consciousness
  - **High tone (528Hz)** — transformation, activation
- Sing the sequence at each of the 5 stones in the correct order (the order follows the solar alignment from Quest 4)
  - Player interacts with each stone, selects the correct tone
  - Correct tone = stone glows and hums
  - Wrong tone = stone stays dark, brief hint from a chibi Fae
- After all 5 stones are tuned, stand in the center
- The full chant plays — all 5 stones resonate together (audio crescendo)

**Mechanic:** Sound/music puzzle. The player must match tones to stones in the correct order based on the solar alignment learned earlier. This connects to the Geode Inn's acoustic alchemy system and the gargoyle sentinel frequencies (The Watcher at 111Hz, The Listener at 64Hz, The Sage at 528Hz).

**Cultural Teaching:** The 111Hz frequency has been measured at ancient sites including Newgrange (Ireland) and the Hypogeum of Hal Saflieni (Malta). Archaeoacoustics is a real field studying how ancient structures were designed to produce specific resonant frequencies. The 528Hz "transformation" tone is part of the modern solfeggio scale, debated but widely used in sound healing contexts.

**Reward:** 150 reputation with Druidic Circle, Solstice Chant (emote — can be used at any stone circle in the game)

---

## Quest 7: "The Portal Ignites"

**Giver:** Elder Cian
**Prerequisite:** Complete "The Solstice Chant" + reputation Neutral with Druidic Circle (guaranteed by this point)

**Quest Text:**
*"The stones sing. The sky is right. But the circle is a door, and every door needs a key. You are the key. Your work, your knowledge, your voice — these are what the Fae have been waiting for. They will not open for the fearful or the greedy. They open for the ones who learned. Stand in the center. Speak the name of every stone. The rest is not for me to say."*

**Objectives:**
- Stand in the center of the stone circle
- Recite the 5 Ogham tree names in order (Beith, Luis, Fearn, Saille, Nion)
  - Each name triggers a visual effect — the corresponding stone lights up
- After all 5 names are spoken, the portal ignites
  - **Cutscene:** The 5 stones pulse with blue-white energy. Light streams connect them. The center of the circle fills with a shimmering portal — not fire, but light through water. Chibi Fae swarm excitedly. Elder Cian watches. The ground trembles at 111Hz.
  - **Portal stabilizes:** A standing portal now exists in the circle. The player can step through.
- Step through the portal → Enter the Fae Kingdom (zone transition to The Threshold)

**Mechanic:** The culmination of everything learned — the Ogham (Quest 2), the stones (Quest 3), the sky alignment (Quest 4), the construction (Quest 5), the resonance (Quest 6). The player must actively demonstrate knowledge, not just watch a cutscene. The portal is earned, not given.

**Cultural Teaching:** The integration of language, material science, astronomy, construction, and acoustics reflects the holistic nature of druidic knowledge — druids were not just priests but judges, astronomers, poets, and natural philosophers. The idea that knowledge itself is the key to passage between worlds draws from Celtic Otherworld mythology, where wisdom (not force) grants access to the realm of the Fae.

**Reward:** 500 reputation with Druidic Circle (Exalted threshold), "Circle Keeper" title, Preseli Blue Stone (added to geode cave), Fae Kingdom portal permanently unlocked

---

## Reputation Progression

| Quest | Reputation Gain | Running Total | Rank |
|------|----------------|---------------|------|
| The Empty Circle | +50 | 50 | Neutral |
| The Language of Trees | +75 | 125 | Neutral |
| Stone from the Earth | +100 | 225 | Friendly |
| The Sky Map | +100 | 325 | Friendly |
| Raising the Stones | +200 | 525 | Honored |
| The Solstice Chant | +150 | 675 | Honored |
| The Portal Ignites | +500 | 1175 | Exalted |

## Side Quests (Optional)

### "The Oak's Memory"
**Giver:** The Oak (ancient tree spirit, found in a hidden grove off the main path)
**Prerequisite:** Complete "Raising the Stones"

The Oak asks the player to recover 3 lost acorns from different parts of the zone. Each acorn, when returned, triggers a vision — a flashback to a previous age when the stone circle was whole. The visions show:
1. **The Builders** — Neolithic people constructing the original circle (the effort, the community)
2. **The Ceremony** — A solstice ritual with hundreds gathered (the scale, the sound)
3. **The Forgetting** — The stones being taken down, one by one, over centuries (the loss)

**Reward:** 100 reputation, "Memory Keeper" title, lore entry unlocked in the Geode Inn archive

### "Fae Mischief"
**Giver:** A chibi Fae (appears after Quest 5)
**Prerequisite:** Complete "Raising the Stones"

Three chibi Fae have stolen items from Branwen, Taliesin, and Arianrhod. The player must find each Fae and negotiate the return — one wants a riddle answered, one wants a song, one just wants to play tag (mini-game). Lighthearted comic relief between the heavier main quests.

**Reward:** 50 reputation per Fae, "Fae Friend" title, small chance of Fae Kingdom reputation boost

---

## Technical Notes

- **Zone modification:** Teldrassil's existing terrain works. Replace Night Elf structures with stone circle elements, thatched roundhouses, and sacred grove decoration.
- **Phased construction:** Quest 5 uses the existing phasing system in AzerothCore. Each stone placement updates the phase, and the zone environment changes per phase.
- **Audio integration:** Quests 3, 6, and 7 require custom audio assets — stone resonance tones, Ogham chant, portal activation. These should use the Geode Inn music direction's frequency system (64Hz, 111Hz, 528Hz).
- **Portal trigger:** Completing this chain should set the `fae_kingdom_portal` flag in the PlayerProgress entity, matching the Standing Stones (Tetris) game's unlock condition. Both paths lead to the same portal.
