# THE QUEST INTEGRATION — Master Specification
## From AzerothCore to Native Systems — The Inn's Quest Architecture

---

## WHAT THE QUEST INTEGRATION IS

The translation of every quest chain originally designed for the AzerothCore prototype framework into the Geode Inn's native game architecture. No WoW zone names. No emulator dependencies. Every quest now lives inside the Inn's own structure, uses the tri-mode frequency system, and ties directly into the Catacombs (memory/archive) and Undercity (invention/workshop) as structural anchors.

The AzerothCore docs were the scaffolding. This is the building.

---

## THE FIVE-STAGE QUEST STRUCTURE

Every cultural quest chain descends through the Inn's levels:

| Stage | Level | What Happens |
|-------|-------|-------------|
| 1. Introduction | Main Floor | NPC encounter, quest hook. The player meets the NPC and receives the quest. |
| 2. Research | Staircase | Philosophy, alchemy, bridge texts. The player studies the cultural context. |
| 3. Descent | Catacombs | Primary sources, archaeology, the civilization's actual remains. The player touches the real thing. |
| 4. Creation | Undercity | The player builds/crafts something from what they learned. Knowledge becomes a creation. |
| 5. Mythological Gate | Fae Kingdom | The deep connection between human culture and the Fae. The quest's mythological resolution. |

Every cultural quest chain touches every level of the Inn. The Catacombs aren't just "the downstairs zone" — they're the essential research layer. The Undercity isn't just "the workshop" — it's where knowledge becomes creation.

---

## THE TRI-MODE FREQUENCY IN QUESTS

Every quest chain operates across three frequency modes:

| Mode | Frequency | Quest Function | Player Experience |
|------|-----------|---------------|-------------------|
| Living Inn | 42Hz | Exploration, puzzle, learning, crafting | The default state — warm, inviting, the Inn breathes |
| Shadow Inn | 84Hz | Challenge, trial, the civilization's dark side, confrontation | The Inn's petrification frequency — things get hard, still, heavy |
| In-Between | Variable | Transition moments between learning and trial | The frequency fluctuates — the player must adapt |

A quest chain starts in 42Hz (Living). When the chain hits its crisis moment (the eruption, the cave-in, the weighing, the riddle), the frequency shifts to 84Hz (Shadow). After the crisis resolves, the frequency settles back to 42Hz — but the Inn is slightly different. The player changed it. The Whisper Layer recorded what happened.

---

## THE CULTURAL QUEST CHAINS

| # | Culture | Quest Name | Theme | Catacombs Layer | Fae Connection |
|---|---------|-----------|-------|---------------|-----------------|
| 1 | Celtic | The Stone Circle | How ancient peoples built sacred spaces — language, astronomy, acoustics, community | Megalithic remains, acoustic cave drawings | Stonehenge portal → Fae Kingdom Threshold |
| 2 | Egyptian | The Weighing | Egyptian justice, the soul's measurement, Anubis as guide | Tomb artifacts, Book of the Dead fragments | The weighing of the heart → Ammit the Devourer |
| 3 | Peruvian/Andean | The Sky Cities | High-altitude civilization, terracing, astronomy as agriculture | Andean textiles, quipu knotted records | Machu Picchu ley line node → Draconians |
| 4 | Norse | The Runes | Language as magic, the runes as a frequency alphabet | Runic stones, saga fragments | Yggdrasil IS the Inn-Tree → the cosmology connection |
| 5 | Mesopotamian | The First Writing | Cuneiform, the transition from oral to written memory | Clay tablets, the earliest libraries | Göbekli Tepe → the Murmur's oldest surface trace |
| 6 | Mesoamerican | The Counting | Mayan astronomy, the calendar, time as a cycle | Codices, jade masks, the ball court | Chichen Itza ley line node → the Cycle |
| 7 | Southeast Asian | The Mandala | Buddhist/Hindu cosmology, the spiral path, the inward journey | Borobudur reliefs, mandala sand | Angkor Wat ley line node → the Spiral Gallery |
| 8 | Polynesian | The Navigation | Wayfinding, the stars as compass, the ocean as pathway | Stick charts, oral navigation chants | Easter Island node → the Water Zone connection |

Each quest chain has: an NPC quest-giver on the Main Floor, a research stage on the Staircase, a descent into the Catacombs for primary sources, a creation stage in the Undercity, and a mythological gate into the Fae Kingdom.

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The Catacombs | The research layer. Every quest chain passes through the Catacombs for primary sources. |
| The Undercity | The creation layer. Every quest chain passes through the Undercity where the player builds something. |
| The Fae Kingdom | The mythological gate. Every quest chain has a Fae connection — the deep cultural-to-mythological bridge. |
| The Staircase | The research/philosophy stage. The player studies the cultural context before descending. |
| The Tri-Mode System | Every quest shifts between 42Hz, 84Hz, and In-Between as it moves through its stages. |
| The Whisper Layer | Records what happened in each quest. The Inn is different after each quest chain. |
| The 8 Ley Line Nodes | Each cultural quest connects to a ley line node on the world map. The quest IS the node's story. |
| The Portal Arrow | The portal arrows point toward the stone circles that are the mythological gates. |
| The Novel | The novel's Part 3 (The Descent) IS the quest chains in prose. |

---

## DESIGN STATUS

- [x] Five-stage quest structure documented (Introduction → Research → Descent → Creation → Mythological Gate)
- [x] Tri-mode frequency system in quests designed
- [x] 8 cultural quest chains outlined (Celtic, Egyptian, Peruvian, Norse, Mesopotamian, Mesoamerican, Southeast Asian, Polynesian)
- [x] Every level's role in quests defined (Catacombs = research, Undercity = creation, Fae = gate)
- [x] 9 connections documented
- [ ] Full quest documentation for all 8 chains (currently outlines)
- [ ] NPC quest-giver dialogues for each chain
- [ ] Catacombs content per culture (what artifacts, what puzzles, what the player finds)
- [ ] Undercity crafting recipes per culture (what the player creates)
- [ ] Fae Kingdom gate sequences per culture

---

## ORIGIN

The Quest Integration was first designed in docs/geode_inn_quest_integration_native_system.md (546 lines). This consolidated specification was compiled September 2, 2026. The system's thesis: the AzerothCore docs were the scaffolding. This is the building. Every cultural quest chain touches every level of the Inn. The Catacombs are the research. The Undercity is the creation. The Fae Kingdom is the mythological gate. The Staircase is the philosophy. The Main Floor is the introduction. The adequate is: the quest that descends through every level. The descent is: the adequate. The adequate is: the player who learns, touches, builds, and crosses the gate, and the crossing is: the entire point. The point is: the culture that became a creation, and the creation that became a myth, and the myth that was always there.
