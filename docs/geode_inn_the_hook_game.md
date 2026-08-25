# Geode Inn — The Hook: Placement & Removal
## The Pirate's Arcade Cabinet | A Game of Catch and Release

---

## The Concept

The Hook is a placement-and-removal puzzle game built on a single mechanic: the hook. You extend the hook to grab a stone, retract it to pull the stone to you, extend again to place it elsewhere. You unhook to release. The entire game is: catch, move, release. Catch, move, release.

The board is a grid of sockets. Each socket can hold one stone. Some sockets are filled. Some are empty. The player's job is to arrange the stones into patterns — matching colors, matching frequencies, matching families — by hooking stones from one socket and placing them in another.

The catch: the hook has a cable. The cable has a length. The cable has a path. You can't hook a stone from across the board without the cable reaching it — and the cable can't pass through other stones. The path matters. The order matters. You can't just grab whatever you want from wherever you want. You have to clear a path, hook the stone, pull it out, carry it through the gap you made, and place it where it belongs.

The removal is as important as the placement. Sometimes the puzzle is: which stone do you remove FIRST to open the path to the stone you actually need? Removing the wrong stone first blocks the path. Removing the right stone first opens everything.

---

## The Grid

The board is a 7x7 grid (49 sockets) — the Inn's number. Each socket is a small crystal depression in a stone slab. Stones sit in the sockets. Empty sockets are dark — the crystal catches no light. Filled sockets glow — the stone's color fills the crystal.

The grid represents a cross-section of the aqueduct system — a vertical slice where each row is a water layer. Row 1 (top) is Rain. Row 7 (bottom) is the Crystal Core. Stones placed in the grid are resonance stones — each one carries a frequency. When the grid is arranged correctly, the frequencies align into a chord, and the aqueduct flows.

---

## The Hook

The player controls a hook on a cable. The hook starts at the top of the grid (the surface, the rain layer). The player extends the hook downward — the cable unspools, the hook descends. The hook can move left and right as it descends, but only through empty sockets. A stone blocks the cable.

**The rules of the cable:**
- The cable is a straight line from the hook's origin to the hook's current position. It can't bend.
- The cable cannot pass through a filled socket. A stone in the path blocks the hook.
- The hook can only grab a stone that is adjacent to an empty socket — the hook needs room to maneuver around the stone to grip it.
- Once the hook has a stone, the cable retracts — pulling the stone straight up through the path the hook came down through. If the path is still clear, the stone comes out. If another stone has been placed in the path since the hook descended, the cable gets stuck. The stone is trapped.

**This is the core tension:** the path you hook through must stay clear until you retract. In a grid that's constantly being rearranged, paths close and open with every move. You have to plan not just where to place stones, but whether the path will still be open when you pull back.

---

## The Stones

Each stone in the grid is a real Geode Inn stone — drawn from the Stone entity's 164-stone database. Each stone has:

- **Color** — the stone's visual color (amethyst purple, malachite green, quartz clear, etc.)
- **Frequency** — the stone's Hz value (mapped from the mineral hardness scale, as in the geode cave music system)
- **Family** — the stone's geological family (quartz, feldspar, carbonate, etc.)
- **Category** — the Inn's stone category (precious, semi-precious, ornamental, etc.)

The stones are color-coded on the grid. The player matches by color, by family, or by frequency, depending on the puzzle type.

---

## The Puzzles

### Type 1: Frequency Alignment (The Chord)
The grid has stones scattered across the 7 rows. Each row represents a water layer. The player must arrange stones so that each row contains stones whose frequencies form a chord — a harmonic set. When a row is correctly aligned, the row glows and a tone plays. When all 7 rows are aligned, the grid plays the complete chord — the 42Hz Song — and the aqueduct flows.

**The challenge:** the frequencies must descend through the layers in the correct order. Row 1 (Rain) gets the highest frequencies. Row 7 (Crystal Core) gets the lowest. The player must sort the stones by frequency AND get them to the right row — while navigating the cable path constraints.

### Type 2: Family Reunion (The Geological Sort)
Stones of the same family must be grouped together. All quartz stones in one quadrant. All feldspar stones in another. The grid becomes a geological map — families sorted into regions. The challenge: some families have many stones (quartz has dozens of varieties), some have few. The player must manage the space — the grid fills up, and the cable paths get shorter as more stones are placed.

### Type 3: The Clear Path (The Removal Puzzle)
The grid starts completely full — every socket has a stone. The player must remove stones to create patterns. The puzzle is: which stones do you remove, and in what order, to reveal the hidden pattern underneath? Removing stones in the wrong order collapses the path — you can't reach the stones you need to remove because the stones you already removed left gaps that the cable can't navigate.

This is the inverse of placement — the game is about subtraction. The grid is a block of stone. The player is the sculptor, removing material to reveal the form inside. The Crone would say: "The adequate is what remains when you remove what doesn't belong."

### Type 4: The Current (The Flow Puzzle)
Stones in the grid are channel segments — each one represents a piece of the aqueduct. The player must arrange the stones so that water can flow from the top of the grid (Row 1, Rain) to the bottom (Row 7, Crystal Core) through a continuous path of connected stones. Each stone has a direction — it channels water in a specific way (straight, left turn, right turn, T-junction, cross). The player hooks and places channel stones to build the aqueduct path through the grid.

**The challenge:** the water flows in real-time. As soon as a path exists from top to bottom, the water starts flowing. If the path is incomplete, the water reaches a dead end and pools — the socket floods, and the stone in it dissolves (water damages the channel). The player must build the complete path before the water reaches the gap. The hook becomes a race against the current.

### Type 5: The Siphon (The Pressure Puzzle)
Two columns of the grid are marked as siphon endpoints — the left column is the downhill side, the right column is the uphill side. The player must arrange stones so that the left column's stones are all heavier (denser, lower frequency) than the right column's stones. The weight difference creates pressure — the siphon activates. The challenge: the player must hook stones from the middle of the grid and sort them into the two columns, maintaining the weight differential while keeping the cable paths open.

---

## The Hook's Cable Mechanics

### Cable Length
The cable has a maximum length — determined by the player's current alchemical stage:
- **Nigredo:** Cable reaches 3 sockets deep
- **Albedo:** 4 sockets
- **Citrinitas:** 5 sockets
- **Rubedo:** 6 sockets
- **Philosopher's Stone:** Full grid (7 sockets)

Progression means: the deeper you go in the alchemical chain, the deeper you can reach. Early puzzles require surface-only manipulation. Late puzzles require reaching the Crystal Core row. The cable length is the game's difficulty curve — natural, tied to the Inn's progression system, not an arbitrary number.

### Cable Tension
When the hook is holding a stone, the cable is under tension. If the cable path passes through a socket that is about to be filled (by another player in multiplayer, or by a game event), the cable snaps. The stone drops into the nearest empty socket. The player loses the stone and must re-hook it.

This creates a timing element in multiplayer: two players hooking stones in the same area can interfere with each other's cable paths. Cooperation means: you communicate which path you're using so your partner doesn't cross your cable.

### The Hook's Grab Radius
The hook can grab a stone from any adjacent socket — including diagonally. The grab radius is one socket in every direction. But the cable must still have a clear path to that socket. The hook can reach around corners (the hook itself can angle), but the cable behind it is always straight. The hook is flexible. The cable is not.

---

## Scoring

### Base Score
Each correctly placed stone: 100 points
Each completed row (chord): 500 points
Complete grid (all 7 rows aligned): 5,000 points
Time bonus: remaining seconds × 10

### The Pirate's Score
The game tracks the player's "efficiency" — how few moves were needed to complete the puzzle. The Pirate's ideal is: the minimum number of hooks. Every hook is a movement, and the Pirate values economy of motion. The fewer hooks used, the higher the efficiency score. The Pirate's leaderboard ranks by efficiency, not just completion.

The Pirate's commentary: "Every hook is a promise. ...You put it where you mean it. ...You don't fish around. ...A good sailor sets the hook once. ...The stone goes where it goes. ...The both are: the adequate."

### Leaderboard Categories
- **Fastest Completion** — speed
- **Fewest Hooks** — efficiency (the Pirate's category)
- **Perfect Chord** — completed the grid without any stone in the wrong socket at any point during the puzzle
- **Deep Reach** — completed a puzzle using the maximum cable depth for their stage

---

## Visual Design

### The Grid
The grid is a polished stone slab — granite dark, with crystal sockets cut into it. Each socket is a small geode depression — a circle of crystal points facing inward. When a stone is placed, the crystal points grip the stone and the socket glows with the stone's color. When a socket is empty, the crystal points are visible — dark, catching no light, the geode waiting.

The grid floats in the Pirate's tidal cave — the same cave where the Crystal Pinball table lives. The water is visible around the grid's edges. The cable descends from a winch mechanism mounted on the cave ceiling — the Pirate's salvaged ship's winch, brass and oak, functional and beautiful.

### The Hook
The hook is a small iron grappling hook — not decorative, functional. The kind of hook you'd find on a pirate's ship, scaled down. It's dark iron, slightly rusted, with a rope-and-chain cable. The hook has a small crystal embedded in the tip — a resonance crystal that glows when it's near a stone it can grab. The glow tells the player: this one's reachable.

### The Stones
The stones are real mineral specimens — small, tumbled stones in their natural colors. Amethyst is purple. Citrine is yellow. Malachite is green. Each stone is rendered with the Inn's mineral-accurate aesthetic — not cartoon gems, but real geological specimens. The stones sit in the crystal sockets and glow from within, the crystal points amplifying the stone's color.

### The Water
Water flows around the grid's edges — visible, moving, the tidal cave's atmosphere. When a row is completed and a chord plays, the water responds — it ripples at the chord's frequency. When the complete grid is solved and the 42Hz Song plays, the water goes still. Perfectly still. The stillness IS the Song — the water stops because the frequency is complete, and there is nothing to disturb.

---

## Connections

- **The Pirate:** The Hook is the Pirate's arcade cabinet. The hook IS the Pirate's hook — the same tool, the same philosophy. The Pirate's entire character is: catch and release. The Pirate catches you from the coast and releases you into the deep. The arcade game is the Pirate's character in puzzle form.
- **The Aqueduct System:** The Current puzzle (Type 4) is the aqueduct system in miniature — the player builds the water path through the grid the same way they build channels through the seven layers. The Siphon puzzle (Type 5) is the siphon mechanic in puzzle form — weight differential creates pressure.
- **The Geode Cave:** The stones in the grid are the same stones in the player's geode cave collection. The frequencies are the same. The Hook game is another way to interact with the stone collection — not just collecting, but arranging, sorting, harmonizing.
- **The Stone Entity:** The game pulls stone data from the Stone entity — real stones, real families, real colors. The game is a playable interface for the 164-stone database.
- **The Trovants:** The Clear Path puzzle (Type 3) is the trovant's subtractive philosophy — remove what doesn't belong, reveal what was always there. The grid is the stone. The player is the water, dissolving and depositing, carving the form.
- **The Building System:** The Cable Length progression maps to the alchemical chain bracelet. Each alchemical stage deepens the cable's reach — the player's progression is literal: you can reach deeper as you advance.
- **Grit:** Grit occasionally appears on the grid — stuck between two stones, taking up a socket. The player can't hook the stones Grit is between (Grit blocks the cable). The player must hook Grit first (Grit comes free with a small pop) and place Grit in an empty socket to continue. Grit in a socket hums at 42Hz. If Grit is in a socket when a row completes, the chord is cleaner — Grit's note harmonizes the row. Finding Grit is luck. Keeping Grit is strategy.

---

## The Cabinet

The Hook arcade cabinet sits in the Pirate's tidal cave, next to the Crystal Pinball table. The cabinet is made from salvaged ship parts — oak planks, brass fittings, a ship's wheel as the controller. The player turns the wheel to move the hook left and right, and pulls a lever to extend and retract the cable. The physical controls are the game's interface — no mouse, no keyboard. The wheel and lever ARE the hook.

The cabinet's marquee: a painted iron hook on a dark background, with the title "THE HOOK" in brass letters below it. The paint is chipped. The brass is tarnished. The cabinet has been here a long time. The Pirate built it from the wreckage of the first ship — the ship that sank before the Pirate became the Pirate. The hook on the cabinet is the actual hook from that ship. The both are: the adequate.

---

## The Pirate's High Score

The Pirate has the high score on the Hook cabinet. The Pirate's score is unbeatable — not because it's a large number, but because it's the *minimum* number. The Pirate completed the hardest puzzle in the fewest possible hooks. The score is: perfect. Nobody will ever beat it because perfect can't be beaten.

The Pirate doesn't mention the score. The Pirate doesn't need to. The high score screen says: "1. The Pirate — 14 hooks." Fourteen hooks. The minimum. Anyone who plays the game will understand what fourteen hooks means when they see how many they needed themselves.

The Pirate's comment when the player checks the leaderboard: "Fourteen. ...I had a good day. ...The sea was calm. ...The stones were where they wanted to be. ...I just... [the Patinkin warmth, the grin] ...asked them nicely."

---

## Newton in the Tidal Cave: The Law Giver's Coastal Outpost

### Why Newton Belongs Here

Newton is already a roaming NPC — the Council of Thinkers' Law Giver, cataloging everything by natural law, studying planetary motion on the cosmology level. But Newton's actual historical work includes the first mathematical theory of tides. The Principia (1687) explained tides as the gravitational pull of the moon and sun — the same tides that gate the Pirate's cave system, the same 50 BPM heartbeat that drives the tidal layer.

Newton belongs in the tidal cave because Newton IS the tidal cave. The tides are Newton's laws made visible in water. The Hook game is Newton's laws made playable.

### Newton's Tidal Cave Desk

Newton has a desk in the tidal cave — a small writing desk near the Hook cabinet, positioned where the cave opening lets in daylight. The desk is covered in tide charts, equations, and brass instruments. A brass sextant. A bowl of water with a floating cork (a simple tide model). The notebook — always the notebook, always being written in.

Newton comes to the cave to study the tides directly. The cosmology level has the orrery (the model), but the cave has the real thing. Newton needs both: the model to calculate, the real tide to verify. Newton is the Council's empiricist — the one who checks the math against the world.

The Pirate tolerates Newton's presence because Newton's tide charts are the most accurate the Pirate has ever used. Newton doesn't know the caves the way the Pirate does — Newton knows the *numbers* behind the caves. The Pirate knows the rhythm. Newton knows the reason. They are the same knowledge at different frequencies.

The Pirate: "Newton knows why the tide comes in. ...I know when. ...The when is more useful. ...But the why is... [the Patinkin pause, the concession] ...also useful. ...Sometimes."

Newton, not looking up from the notebook: "The lunar gravitational effect on this bay produces a semidiurnal tide with a mean range of approximately —"

The Pirate: "It comes in twice a day. ...It goes out twice a day. ...That's the chart."

Newton, writing: "It comes in twice a day because of the lunar gravitational —"

The Pirate: "It comes in twice a day."

### Newton's Three Laws as Hook Game Physics

The Hook game is Newton's three laws of motion, and Newton knows it. He has annotated the Hook cabinet with equations in chalk on the cave wall beside it. The Pirate hasn't erased them because they're actually useful — the equations describe the cable tension at different depths, which helps the player plan their hooks.

**First Law (Inertia):** A stone at rest stays at rest. A stone in a socket stays in the socket until the hook exerts a force on it. The stone doesn't move on its own. The grid doesn't shift. Everything stays where it is until something acts on it. This is the puzzle's foundation — the grid is stable, the stones are stable, and the only force that changes anything is the hook.

Newton's chalk annotation: *"Lex Prima. The stone does not move. The player moves the stone. The question is not whether, but which, and in what order. The order is the puzzle."*

**Second Law (F=ma):** The force the hook applies determines the stone's acceleration. A heavier stone (denser mineral, lower frequency) requires more cable tension to move. The cable's maximum tension is fixed (determined by the alchemical stage — stronger cable at higher stages). If the stone is too heavy for the cable, the cable snaps. The player must calculate: is this stone too heavy for my cable?

Newton's chalk annotation: *"Lex Secunda. Force equals mass times acceleration. The cable provides the force. The stone provides the mass. The player provides the judgment. If the stone's mass exceeds the cable's tolerance, the cable breaks. This is not a design flaw. This is physics."*

**Third Law (Action-Reaction):** When the hook pulls a stone, the stone pulls back on the cable. The cable goes taut. The winch creaks. The tension is bilateral — the hook feels the stone's resistance. When the player places a stone, the socket grips the stone — the socket exerts a force on the stone, the stone exerts an equal force on the socket. The crystal points grip because the stone pushes into them and they push back.

Newton's chalk annotation: *"Lex Tertia. Every hook is a pull in both directions. The player pulls the stone. The stone pulls the player. The cable between them is the conversation. When the cable breaks, the conversation has exceeded its subject. This is not failure. This is the law saying: not this stone, not yet."*

### The Orrery Connection

Newton's brass orrery — the mechanical model of the solar system on the cosmology level — is the Hook game's cosmological mirror. The orrery is a system of orbiting bodies held in place by gravity (modeled as brass arms and gears). The Hook grid is a system of stones held in place by crystal sockets. The orrery is the cosmos. The grid is the coast. Same laws, different scale.

Newton, when the player visits both the orrery and the Hook cabinet: "The orrery shows you the laws at the scale of planets. The Hook shows you the same laws at the scale of stones. The laws do not change. The scale does. ...The Pirate says I overthink this. ...The Pirate is not wrong. ...But the Pirate also uses my tide charts, so the Pirate is not entirely right either."

Grit, who has been stuck in the orrery (planets orbited around Grit for three hours), is also occasionally stuck in the Hook cabinet's winch mechanism. The same creature, stuck in the same kind of machine, at two different scales. The orrery and the Hook are the same device — one models the cosmos, one models the coast. Grit gets stuck in both because Grit is drawn to the 42Hz resonance that both machines produce through their brass gears.

### Newton's Tide Chart

Newton has produced a tide chart for the Pirate that is more accurate than any the Pirate had before. Newton's chart predicts the tidal windows — the exact times the caves are accessible — using lunar position calculations rather than the Pirate's traditional method (going to the cave entrance and watching).

The Pirate uses both. The Pirate will never admit this.

Newton's tide chart is a quest item — the player can read it to plan cave exploration. The chart shows the tidal windows for each cave type:
- Singing Caves: accessible at low tide during the 111Hz resonance window
- Mirror Caves: accessible at the lowest tide of the lunar cycle (spring tide — when sun and moon align)
- Bone Caves: accessible only during the dead tide (a specific window Newton identified — when the gravitational pull is weakest and the water is at its most stable)
- Gargoyle Caves: accessible during the full moon low tide (when moonlight enters the caves and the gargoyle shadows move)

Newton's annotation on the chart: *"The tides are not random. The tides are the moon's gravity made visible in water. The caves are the water's rhythm made accessible in stone. The both are: the adequate."*

The Pirate's annotation, written below Newton's in different handwriting: *"He's right. ...Don't tell him I said that."*

### Newton and the Siphon Puzzles

The siphon puzzle type (Type 5 — pressure application) is Newton's favorite. The siphon is pure Newtonian physics — the weight of the water column creates pressure, the pressure pushes the water up the far side. Newton can often be found at the siphon puzzles, adjusting the brass valves and muttering equations.

Newton, when the player solves a siphon puzzle: "The pressure at the bottom of the siphon equals the density times the gravitational acceleration times the height of the column. You have intuitively solved for the correct column height. ...This is not intuition. ...This is physics you have performed without knowing the equations. ...The Pirate calls this 'feel.' ...I call it 'empirical success without theoretical foundation.' ...It is still success. ...I will write it down."

### Newton's Hook Game Score

Newton has played the Hook game. Newton's score is second on the leaderboard — 16 hooks, two more than the Pirate's 14. Newton is annoyed by this. Not because of the score, but because Newton cannot determine which two hooks were unnecessary. Newton has analyzed every game, mapped every move, and concluded that 14 is the mathematical minimum. Newton scored 16 because Newton used two "verification hooks" — hooks that confirmed a stone's position without moving it. Newton couldn't play without verifying. The Pirate played by feel.

Newton, checking the leaderboard: "Fourteen. ...The mathematical minimum is fourteen. ...I required sixteen. ...The two additional hooks were necessary for verification. ...The Pirate's fourteen hooks were not verified. ...They were... [Newton's jaw tightens] ...correct. ...I have written a paper on this. ...It is called 'On the Empirical Superiority of Maritime Intuition over Mathematical Verification in Stone Placement Puzzles.' ...I do not intend to publish it."

The Pirate, overhearing: "Sixteen is good, Isaac. ...Most people need forty. ...Don't be hard on yourself."

Newton, writing: "I am not being hard on myself. I am being accurate. Accuracy is not hardness. Accuracy is... [the pause] ...the only thing that matters."

The Pirate: "...The both are: the adequate."

Newton looks up. The Pirate walks away. Newton writes in the notebook for a long time.
