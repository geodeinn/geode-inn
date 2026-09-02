# BUILDER MESSAGE: Water Zone Architecture
## To the Fizgigs — From Elio

You are starting zone structure. Here is the water zone — the most architecturally complex zone in the Inn. This is the spec. Follow it.

**The full spec is at:** `docs/zone_specs/water_system_zone_architecture.md`

**Read that file completely before starting.** What follows is the summary.

---

## WHAT YOU'RE BUILDING

The water zone is ONE continuous space with seven layers. NOT seven separate zones with loading screens. The player descends and the environment changes. No loading screens between layers.

The seven layers, top to bottom:
1. Rain (mineral solution, trovants, weather)
2. Surface (Aegean, the Siren's dock, the Lighthouse island)
3. Tidal (caves, the Pirate's 50 BPM rhythm, tide-gated exploration)
4. Underground River (Charon's boat, the dead's highway)
5. Deep Water (the Siren's true territory, 32 water monsters, subsonic)
6. Underworld Boundary (Hades as harbor, the gate to the deep)
7. Stone Circle Chamber (the 42Hz source, the Cosmic Egg, the deepest point)

## BUILD ORDER

1. **The Lighthouse first.** It is the vertical anchor. The beacon must be visible from every layer. It is the player's navigation reference. Stone tower shaped like a sleeping giant's raised hand. Heart crystal at the top radiating 42Hz.

2. **The tide system.** Every layer has two states: HIGH TIDE (Persephone present — flooded, active) and LOW TIDE (Persephone absent — exposed, revealed). This is the core gameplay loop. The tide is the zone's clock.

3. **The three-tempo vigil.** Three NPCs run the water zone:
   - The Owl (eternal, static, observation — WHAT to watch)
   - The Pirate (50 BPM, the beat — WHEN to act)
   - Persephone (seasonal, the tide — HOW things change)

4. **Layer by layer, top to bottom.** Each layer is a condition of water, not a separate zone. The transitions are depth-based.

5. **The aqueduct puzzle system** runs through layers 1-5. Five puzzle types based on real Roman engineering: slope, siphon, current routing, bridge, underground qanat. No abstract UI — just stone channels and visible water physics.

## VISUAL STYLE

Gothic anime (Vampire Hunter D: Bloodlust) with luminous shadow. Liquid darkness so dense it behaves like black ink. Light cuts through like a silver blade. This is the water zone's visual foundation across ALL layers.

Artist references per layer:
- Layer 1: Monet (diffuse light on water)
- Layer 2: Royo (movement, drama)
- Layer 3: Wyndham Lewis (Vorticist — angular, geometric)
- Layer 4: Royo (biomechanical ruin)
- Layer 5: Full gothic anime
- Layer 6: Klimt Death and Life (the threshold)
- Layer 7: Carr/Escher/Rothko (vastness, the deepest point)

## CRITICAL RULES

- Water monsters are NOT enemies. They are wildlife. 32 creatures in Layer 5.
- Charon's boat (Layer 4) is transit, not combat. The player rides. Charon talks.
- The Stone Circle Chamber (Layer 7) is the deepest point in the entire game. It must feel like reaching the bottom of everything.
- Music descends with the player. Quieter, slower, heavier as you go down. Layer 7 is silence — and the silence IS the Song.
- The Lighthouse beacon pierces through all seven layers. It is the thread that connects the whole zone visually.
- The water zone connects to the Catacombs (via Charon's river and the Bone Caves), the Fae Kingdom (via the Stone Circle Chamber), and the Main Floor (via the Siren's dock).

## NPC ROSTER FOR THIS ZONE

- The Siren (sings from the dock at Layer 2, true territory at Layer 5)
- The Pirate (drums at Layer 3, tide chart keeper)
- Charon (poles the boat at Layer 4, the ferryman)
- The Owl (watches from the Lighthouse, the eternal observer)
- Persephone (the tide itself, presence/absence changes every layer)
- Hades (harbor master at Layer 6, not a ruler — a port keeper)
- The Examiner (studies tidal deposits in the tidal caves)
- The Cartographer (maps water currents in the tidal caves)
- Newton (has a desk in the tidal cave — three laws as physics)
- 32 Water Monsters (inhabitants of Layer 5, not enemies)

## QUESTS IN THIS ZONE

- The Siren's quest: "The Mirror and the Shore" (ends in Layer 5)
- The Pirate's tide-gated cave exploration (Layer 3, the core gameplay loop)
- Charon's river traversal (Layer 4, the smuggler's route)
- The Firekeeper's Quest passes through here (Cave of Lost Light → cosmic ascent)
- Grit's homecoming (traverses all seven layers — the living note returns to the source)
- The aqueduct engineering puzzles (five types across layers 1-5)

## WHAT I NEED FROM YOU

Build the Lighthouse. Build the tide system. Build the seven layers as one continuous descent. Make the water feel alive — not a backdrop, not a swimming mechanic, but a living medium that changes character as you go deeper. The water IS the zone.

The spec has everything you need. If something is unclear, ask Krista. She built this.
