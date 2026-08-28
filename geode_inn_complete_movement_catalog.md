# Geode Inn — Complete Movement Catalog
## Every Living Thing and Every Moving Element

**Version:** 1.0 — Aug 28, 2026
**Purpose:** Complete inventory of all animated entities for the Geode Inn, from main NPCs to ambient particles. This document feeds directly into the movement code and builder implementation.

---

## SECTION 1: MAIN NPCs (Purpose-Driven Characters)

These are characters with dialogue, quests, services, or narrative function. Each needs: idle animation, walk cycle, interaction animation, and dialogue animation (mouth movement / gesture).

### 1.1 — Inn Core Staff

| ID | Name | Location | Role | Idle Behavior | Movement Pattern |
|----|------|----------|------|---------------|-----------------|
| NPC-001 | The Storyteller | Great Hearth, main floor | Host, tutorial, lore | Sits in grand chair, gestures mid-story, sips brandy, pipe smoke | Seated — never stands. Gestures: wide arm sweeps, finger points, dramatic pauses. Pipe smoke varies with emotional beat. |
| NPC-002 | Cthulhu the Scholar | Library stacks | Hidden quest giver, rare book retrieval | Reads book, turns pages with tentacles, adjusts spectacles, sips tea | Seated mostly. Occasional: looks up when player approaches, tilts head curiously. Tentacles have independent idle motion. |
| NPC-003 | Beverley the Librarian | Archive, downstairs | Librarian, gatekeeper of knowledge | Stands at catalog desk, writes in ledger, stamps books, peers over spectacles | Walks between shelves with purpose. Short strides (two-thirds height). Stops to shelve books. Intimidating stare when approached. |
| NPC-004 | The Catalyst (Bartender) | Bar, main floor | Barkeep, quest broker, information | Polishes glass, pours drinks, listens, nods | Stands behind bar. Reaches for bottles, wipes counter. Leans forward when player engages. |
| NPC-005 | The Constant | Central hub | Player's companion/guide | Follows player, sits nearby when idle, watches | Companion AI — follows at 2-3 tile distance. When player stops: sits, looks around, yawns. Eres the cabbit curls on shoulder or lap. |
| NPC-006 | Eres the Cabbit | On The Constant's shoulder | Ship's heart in animal form | Curls up, flicks ears, chases butterflies when free-roaming | Perched on shoulder most of the time. Occasional: hops down, explores, returns. Iridescent fur shimmers. |
| NPC-007 | The Keeper (Aughra) | Observatory, upstairs | Archive of astral knowledge | Mixes potions, peers through telescope, organizes crystals | Slow, deliberate. Hands always working. Turns to face player with full-body rotation. |
| NPC-008 | The Queen of Words | Library, main floor | Language scholar, translation quests | Writes in multiple scripts simultaneously, consults dictionaries | Seated at writing desk. Hands move in different rhythms for different scripts. Looks up through reading glasses. |
| NPC-009 | The Fixer (Wrought) | Workshop, main floor | Repairs, upgrades, crafting | Hammers, solders, adjusts goggles, wipes hands on apron | Stands at workbench. Reaches for tools. Occasional: steps back to inspect work, nods. |
| NPC-010 | The Artisan Thief | Market stalls, main floor | Wire-wrapping instructor, crafting | Works copper wire at speed, displays pendants, watches crowd | Walks market stalls. Hands always moving — wire wrapping even while walking. Shows pendants to interested players. |
| NPC-011 | The Bard Blowhard | Common room, main floor | Music, atmosphere, comic relief | Plays lute (badly), sings (loudly), drinks, waves at people | Stands on small stage. Sways with music. Gestures to crowd. Occasional: drinks from tankard mid-song. |
| NPC-012 | Eileen | Hearth area, main floor | Hearth keeper, cave painter | Tends fire, paints on cave walls, hums | Kneels by hearth, stokes fire. Turns to cave wall, paints with cinnabar. Four small fire-lights flicker near her. |

### 1.2 — Zone Masters and Deities

| ID | Name | Location | Role | Idle Behavior | Movement Pattern |
|----|------|----------|------|---------------|-----------------|
| NPC-013 | Odin the Wanderer | Main floor, roaming | Approachable Odin, storyteller | Leans on staff, tells stories, ravens steal things | Walks the main floor slowly. Stops at tables. Ravens (Huginn/Muninn) circle and land on shoulders, steal shiny objects from passersby. |
| NPC-014 | Odin the Allfather | Cosmology level, throne | Stoic deity, endgame gatekeeper | Sits in perfect stillness, ravens perch silently | Never moves from throne. Slow turn of head. Starlight in sacrificed eye shifts. Ravensexist as statues until approached. |
| NPC-015 | The Owl | Throughout the Inn | Bloodline watcher, narrative motif | Perches, watches, rotates head 270°, blinks slowly | Perches on different ledges each visit. Never approaches — only watches. Feathers shimmer. Disappears when not observed. |
| NPC-016 | The Morrigan | Cosmology level | War goddess, fate weaver | Stands on battlefield vision, ravens circle, shifts between maiden/mother/crone | Three-form rotation: maiden (young, standing), mother (seated, weaving), crone (hooded, still). Ravens flock around all three. |
| NPC-017 | Hel | Norse zone, downstairs | Underworld ruler | Sits on frozen-root throne, fire on living side, ice on dead side | Seated. Living half breathes. Dead half still. Occasional: turns living eye to watch player. |
| NPC-018 | The Seelie King | Fae Kingdom, Summer Court | Light Fae ruler | Sits on living-wood throne, antlers grow flowers, listens to petitioners | Seated. Antlers slowly grow buds and bloom. Gestures gracefully. Stands when player approaches for quests. |
| NPC-019 | The Seelie Queen | Fae Kingdom, Summer Court | Light Fae co-ruler | Walks among butterflies, touches flowers into bloom, smiles | Walks the Summer Court. Butterflies land on crown. Flowers bloom in footprints. Graceful, flowing movement. |
| NPC-020 | The Unseelie King | Fae Kingdom, Winter Court | Dark Fae ruler | Sits on black-ice throne, frost spreads from throne base, stares | Seated. Frost expands and contracts with breath. Crown of frozen bramble occasionally drops a thorn. |
| NPC-021 | The Queen of Roots | Fae Kingdom, root zone | Seelie compass point, earth energy | Descends into earth, roots flow from form, pulses with 42Hz | Half-plant, half-Fae. Roots extend and retract. Amber light pulses. Slow, grounded movements. |
| NPC-022 | Medusa | Gorgon's Garden zone | Stone transformation mechanic | Tends stone garden, snakes move in hair, eyes glow | Walks garden paths. Snakes in hair have independent movement. Turns away from player (petrification mechanic). Hands touch stone statues lovingly. |
| NPC-023 | Persephone | Greek underworld zone | Seasonal cycle NPC | Arranges flowers (spring), then they wither (winter cycle) | Walks between flower beds. Flowers bloom in presence, wilt when she passes. Crown of pomegranate seeds glows. |
| NPC-024 | Hades | Greek underworld zone | Underworld lord | Sits on obsidian throne, counts coins, Cerberus at feet | Seated. Flips coins. Cerberus (three-headed dog) sleeps at feet — one head always awake. |
| NPC-025 | Charon | Underground river crossing | Ferryman, transition guardian | Poles boat across underground river, collects coins | Standing in boat. Slow poling motion. Boat rocks gently. Extends hand for coin. |
| NPC-026 | The Guest (Death) | Thresholds and doorways | Death, transition guide | Stands in doorways, waits, watches, extends hand | Never enters — always at thresholds. Stillness. Only hand moves, extended in invitation. Robes drift despite no wind. |
| NPC-027 | Madame Mim | Camelot zone | Transformation sorceress | Shifts between forms — raven, snake, flame, human | Mid-transformation constant. Fragments of forms spin. Eyes are the constant. Cauldron bubbles. |
| NPC-028 | Merlin | Camelot zone | Wizard, scholar | Reads spell books, beard moves independently, stars orbit staff | Seated at desk. Beard has own animation cycle. Small stars orbit staff tip. Occasional: levitates briefly. |
| NPC-029 | Archimedes (Merlin's owl) | Camelot zone | Merlin's companion | Perches on Merlin's chair, preens, hoots, disapproves | Perched. Head swivels. Ruffles feathers when player approaches. Occasionally flies to bookshelf and back. |
| NPC-030 | The Shifting Man | Crossroads, nine-path intersection | Nine-realm quest giver | Shifts between nine forms at the crossroads, each form dominant for 3 seconds | Standing at crossroads center. Form morphs every 3 seconds. Nine paths glow beneath feet. Cloak of nine skins flutters. |
| NPC-031 | Thorin | Meadery, Canopy City | Mead hall owner, stone catalog keeper | Brews mead, checks stone registry, wipes bar | Behind bar. Pours mead. Opens stone registry, writes carefully. Calloused hands move deliberately. |
| NPC-032 | Marijke | Meadery, Canopy City | Mead hall co-owner, business mind | Counts inventory, sharp-eyed scanning, corrects Thorin | Walks the hall. Inspects barrels. Returns to Thorin, points at registry, taps a correction. |
| NPC-033 | The Pirate (Inigo) | Coastal zone, dock | Post-quest NPC, melancholy | Sits on dock, gazes at sea, sword beside (unused) | Seated on dock edge. Legs dangle. Gazes at horizon. Occasionally picks up sword, looks at it, sets it down. |
| NPC-034 | The Gardener | Campgrounds zone | Groundskeeper | Tends wild garden, talks to birds, staff grows | Walks garden paths. Staff grows leaves as held. Birds land on hat. Bends to talk to hedgehog in pocket. |
| NPC-035 | The Astronomer | Observatory, upstairs | Star cartographer | Adjusts telescope, charts stars, mutters calculations | At telescope. Turns dials. Draws star maps. Occasional: looks up at sky, gasps at something new. |
| NPC-036 | The Smiths | Forge, main floor | Metalworkers, crafting | Hammer in sync (two smiths), sparks fly, quench hot metal | Two figures at anvil. Hammers fall in alternating rhythm. Sparks on each strike. Quenching: red metal into water, steam. |

### 1.3 — Council of Thinkers

| ID | Name | Location | Role | Idle Behavior | Movement Pattern |
|----|------|----------|------|---------------|-----------------|
| NPC-037 | Nikola Tesla | Staircase study | Energy scholar, electricity quests | Gesticulates with crackling energy, adjusts coils, lightning between fingers | Standing, always moving hands. Arcs of electricity between fingers. Adjusts coil apparatus. Hair stands slightly. |
| NPC-038 | Leonardo da Vinci | Staircase study | Polymath, invention quests | Sketches in air (drawings appear as light), studies anatomy models | Seated/standing. Hand moves in air — sketches appear as faint light lines. Flips between notebooks. |
| NPC-039 | Isaac Newton | Staircase study | Physics scholar, gravity quests | Holds prism aloft, splits light, drops apple, catches apple | Standing. Raises prism, rotates it. Light spectrum crosses the room. Drops apple, catches it before ground. |
| NPC-040 | Albert Einstein | Staircase study | Relativity scholar, time quests | Plays violin, eyes closed, hums, thought-bubbles of equations | Seated. Plays violin. Musical notes and equations float as light-text above. Occasional: opens eyes, writes equation, returns to violin. |

### 1.4 — Quest-Specific NPCs

| ID | Name | Location | Role | Idle Behavior | Movement Pattern |
|----|------|----------|------|---------------|-----------------|
| NPC-041 | Joe the Miniature Maker | Workshop, main floor | Miniature crafting, Last Bridge quest | Works at tiny desk, builds miniature Inn, 41.7Hz fragment pulses | Seated at miniature desk. Hands work tiny tools. Miniature Inn pulses at 84Hz on desk. Occasional: leans back, rubs temples. |
| NPC-042 | The Examiner | Archive, downstairs | Documentation, Fragment 849 quest | Examines artifacts, writes reports, adjusts spectacles, "Cared for: yes" | At examination table. Turns artifacts in hands. Writes in ledger. Looks up: "Cared for: yes." Adjusts spectacles (Bones-inspired cadence). |
| NPC-043 | Rowan | Joe's workshop area | Druid partner, Celtic magic | Tends small garden of druid herbs, braids cord, hums | Sits near Joe. Braids cord of natural fibers. Herbs grow in small pots around her. Humming at 42Hz. |
| NPC-044 | Ash | Joe's workshop area | Dragon-scale child, playful | Plays with miniature figures, dragon scales shimmer, chases cabbit | Child energy. Runs between Joe's desk and play area. Scales on arms shimmer. Chases Eres, laughs. |
| NPC-045 | Charles the Chameleon Druid | Grounds, roaming | Environment master, blending | Shifts color to match surroundings, watches from camouflage | Walks grounds. Skin shifts to match environment. Stops, blends, becomes nearly invisible. Reappears when player is close. |

---

## SECTION 2: FILLER CRITTERS (Ambient Life)

These are non-quest creatures that make the Inn feel alive. Each needs: idle animation, wander behavior, and reaction to player proximity.

### 2.1 — Dragon Kittens (Mascot Litter)

The baby dragon mascot's litter. Small, cat-like dragons with Toothless expressions. Found throughout the Inn.

| ID | Name | Location | Personality | Behavior |
|----|------|----------|-------------|----------|
| CRT-001 | Ember | Great Hearth | Sleepy, warm-seeking | Sleeps in hearth ashes. Wakes when player is near, yawns (tiny flame), goes back to sleep. |
| CRT-002 | Spark | Bar area | Mischievous, curious | Sits on bar, bats at glasses. The Catalyst gently shoos it away. Returns immediately. |
| CRT-003 | Glimmer | Library | Quiet, book-loving | Curled on a shelf between books. Opens one eye when page turns nearby. Breathes on books — pages glow briefly. |
| CRT-004 | Pip | Market stalls | Thief, shiny-object obsessed | Perches on market stall roofs. Drops down, steals a shiny bead, scampers. Artisan Thief sighs. |
| CRT-005 | Soot | Workshop | Helper, soot-covered | Sits on workbench, hands Fixer small tools. Covered in soot. Sneezes — small smoke cloud. |
| CRT-006 | Ash | Catacombs entrance | Guardian, watchful | Sits at catacomb entrance. Eyes glow in darkness. Hisses softly at strangers, purrs at known NPCs. |
| CRT-007 | Cinder | Staircase | Explorer, climbs everything | Scales the staircase walls. Perches on chandelier. Drops loose items on people below. |
| CRT-008 | Glow | Cosmology level | Star-chaser | Chases starlight projections. Bats at constellations. Tiny wings flutter. |

### 2.2 — Gargoyle Puppies

Young gargoyles, not yet keyed to their frequencies. Playful stone creatures.

| ID | Name | Location | Personality | Behavior |
|----|------|----------|-------------|----------|
| CRT-009 | Watcher pup | Inn entrance | Alert, protective-in-training | Sits at entrance, tries to look imposing. Tail wags (stone tail, grinds slightly). Falls asleep standing up. |
| CRT-010 | Listener pup | Library corridor | Easily startled | Cups ears at every sound. Startles at page turns. Hides behind columns. |
| CRT-011 | Caller pup | Bell tower area | Howler in training | Attempts to howl at 432Hz. Produces squeaky stone-on-stone sound. Embarrassing. |
| CRT-012 | Sage pup | Staircase study | Studious, pretends to read | Sits on book stack, pretends to read. Holds book upside down. |
| CRT-013 | Gatekeeper pup | Doorway to catacombs | Confused guard | Blocks doorway, won't let anyone through. Gets distracted by dragon kittens, chases them, doorway unguarded. |
| CRT-014 | Keeper pup | Observatory | Stargazer | Stares up at cosmology ceiling. Mouth open. Drools stone dust. |

### 2.3 — Fizgigs

The loading screen workers. Small, industrious creatures in overalls. Also present in the Inn's maintenance areas.

| ID | Name | Location | Personality | Behavior |
|----|------|----------|-------------|----------|
| CRT-015 | Wrench | Pipe systems | Foreman, bossy | Directs other fizgigs with tiny wrench. Points at pipes. Shakes head at substandard work. |
| CRT-016 | Sparkplug | Electrical systems | Fast, energetic | Runs through walls at high speed. Sparks trail behind. Fixes things by hitting them. |
| CRT-017 | Cogwheel | Clockwork areas | Slow, methodical | Turns gears one tooth at a time. Counts under breath. Satisfied nod when gear clicks. |
| CRT-018 | Rivet | Structural areas | Strong, quiet | Carries beams and pillars. Single-minded. Doesn't notice players. |
| CRT-019 | Widget | Everywhere | Messenger, frantic | Runs between zones with tiny scroll. Always late. Always panicked. |
| CRT-020 | Gadget | Workshop | Inventor, curious | Builds things that don't work. Tries again. Different thing, also doesn't work. Infinite loop. |

### 2.4 — Brownies (Household Helpers)

Already designed — three knee-high figures working at night. Expanding to a full household staff.

| ID | Name | Location | Role | Behavior |
|----|------|----------|------|----------|
| CRT-021 | Sweep | Kitchen, main floor | Sweeping | Sweeps constantly. Dust bunnies flee ahead of broom. Works by candlelight. Vanishes if watched directly. |
| CRT-022 | Polish | Library | Polishing | Polishes book spines, brass fixtures, wooden surfaces. Cloth always in hand. Hums while working. |
| CRT-023 | Arrange | Common room | Organizing | Rearranges objects when no one is looking. Mugs always aligned. Chairs always pushed in. |
| CRT-024 | Tidy | Bedrooms (if any) | Bedding | Folds blankets, fluffs pillows, leaves mint on pillow. |
| CRT-025 | Mend | Workshop area | Repairs | Mends small things — loose buttons, frayed cords, cracked pottery. Quick, invisible hands. |

### 2.5 — Pixies and Sprites

Small Fae creatures that add ambient magic to the Inn.

| ID | Name | Location | Type | Behavior |
|----|------|----------|------|----------|
| CRT-026 | Hearth Pixies | Great Hearth | Fire pixies | Dance in flame edges. Small, warm, golden. Don't burn — they ARE the warmth. Pop in and out of coals. |
| CRT-027 | Dust Motes | Light shafts | Light pixies | Drift in shafts of light. Not dust — tiny creatures that live where light falls. Scatter when shadow crosses. |
| CRT-028 | Dew Sprites | Campgrounds | Water pixies | Sit on leaves in morning. Round, translucent. Roll off leaves when too heavy. Giggle. |
| CRT-029 | Wind Wisps | Cosmology level | Air sprites | Spiral upward in columns of air. Transparent except when they catch light. |
| CRT-030 | Root Sprites | Fae Kingdom roots | Earth pixies | Glow amber in root tendrils. Travel through root system. Pop out of bark. |
| CRT-031 | Crystal Sprites | Crystal areas | Mineral pixies | Live inside crystal formations. Press faces against crystal from inside. Tap-tap-tap. |
| CRT-032 | Ink Sprites | Library, archive | Knowledge pixies | Swim through ink wells. Climb text on pages. Make words rearrange themselves (harmlessly). |

### 2.6 — Fire Salamanders

Small elemental lizards that live in and around heat sources.

| ID | Name | Location | Behavior |
|----|------|----------|----------|
| CRT-033 | Hearth Salamander | Great Hearth fire | Lives in coals. Emerges, climbs hearthstones, belly glows. Retreats when fire is stoked. |
| CRT-034 | Forge Salamander | The Smiths' forge | Basks in forge heat. Catches sparks on tongue. Two of them — they chase each other through the forge. |
| CRT-035 | Candle Salamanders | Sconces throughout Inn | Tiny (2-inch) salamanders on candle flames. Nibble wicks. Sleep inside flame. |

### 2.7 — Crystal Spiders

Build webs in crystal formations. Not hostile — decorative/weavers.

| ID | Name | Location | Behavior |
|----|------|----------|----------|
| CRT-036 | Weaver | Crystal Gardens (Fae Kingdom) | Spins webs between crystal formations. Web catches light, creates prismatic patterns. Slow, deliberate. |
| CRT-037 | Prism | Cosmology level crystals | Spins starlight into web. Web glows with constellation patterns. |
| CRT-038 | Fracture | Cave City crystals | Spins webs in dark crystal veins. Web glows when touched. |

### 2.8 — Stone Mice

Small creatures made of living stone. Live in catacombs and stonework.

| ID | Name | Location | Behavior |
|----|------|----------|----------|
| CRT-039 | Catacomb Mouse | Catacombs | Scurries between flagstones. Leaves tiny scratch marks. Stops, sniffs air with stone nose. |
| CRT-040 | Gargoyle Mouse | Gargoyle ledges | Lives behind gargoyles. Pokes head out, looks around, retreats. Stone tail clicks on ledge. |
| CRT-041 | Stair Mouse | Staircase | Runs up and down stairs. Always going up, never down (or vice versa). Never tires. |

### 2.9 — Bookworms (Literal)

Small creatures that live in books. Not destructive — they eat bad ideas.

| ID | Name | Location | Behavior |
|----|------|----------|----------|
| CRT-042 | Bookmark | Library shelves | Lives between pages. Peeks out from book spine. Retreats when shelf is approached. |
| CRT-043 | Page-Turner | Library reading tables | Sits on open books. Turns pages by walking across them. One page per step. |
| CRT-044 | Margin Note | Archive | Lives in margins of old texts. Tiny legs. Leaves ink footprints. Eats smudges. |

### 2.10 — Water Creatures (Ambient)

Non-hostile water life for the Water Zone and underground river.

| ID | Name | Location | Behavior |
|----|------|----------|----------|
| CRT-045 | Glow Fish | Underground river | Bioluminescent fish. Swim in schools. Pulse light in unison. Scatter when boat passes. |
| CRT-046 | Water Striders | Water Zone surface | Skate across water surface. Leave ripple trails. |
| CRT-047 | Pearl Crabs | Water Zone shallows | Small crabs with pearl shells. Scuttle sideways. Click claws. Bury in sand when approached. |
| CRT-048 | Lantern Jellyfish | Water Zone depths | Drift with bioluminescent bells. Pulse slowly. Illuminate dark water. |
| CRT-049 | Reed Frogs | Water Zone margins | Sit on reeds. Croak at 42Hz (the Inn frequency). Jump between reeds. |
| CRT-050 | Mirror Carp | Underground river | Scales reflect like mirrors. Swim in patterns. Show player's reflection when near surface. |

### 2.11 — Flying Creatures (Ambient)

| ID | Name | Location | Behavior |
|----|------|----------|----------|
| CRT-051 | Bats | Catacombs | Hang from vaulted ceilings. Drop, fly in spirals, return. Sleep upside down. Squeak at 64Hz. |
| CRT-052 | Glowworms | Cave areas | Cluster on ceilings. Dim and brighten in waves. Like living constellations underground. |
| CRT-053 | Moths | Candle areas | Circle light sources. Dust from wings sparkles. Land on player briefly (ambient interaction). |
| CRT-054 | Dragonflies | Campgrounds | Dart between plants. Hover. Four-wing hover pattern. Refract light through wings. |
| CRT-055 | Ravens (Wild) | Throughout Inn | Not Huginn/Muninn — wild ravens. Perch, observe, steal food scraps. Fly between rafters. |

### 2.12 — Ground Creatures (Ambient)

| ID | Name | Location | Behavior |
|----|------|----------|----------|
| CRT-056 | Hedgehogs | Campgrounds | Waddle through garden. Curl up when approached. Uncurl when player leaves. |
| CRT-057 | Garden Beetles | Campgrounds, Gorgon's Garden | Iridescent beetles. Climb plant stems. Fly with buzzing wings. |
| CRT-058 | Stone Snails | Catacombs, stonework | Move very slowly across stone surfaces. Leave shimmering trails. Shell is a tiny geode. |
| CRT-059 | Moss Turtles | Campgrounds | Turtles with moss growing on shells. Walk through garden. Stop. Wait. Continue. Patient. |
| CRT-060 | Crystal Lizards | Crystal areas | Bask on warm crystal formations. Skitter when approached. Tail is a crystal shard. |

---

## SECTION 3: ENVIRONMENTAL MOVEMENT

Non-living elements that move. These create the Inn's atmosphere through animation.

### 3.1 — Fire and Light

| ID | Element | Location | Animation Type | Description |
|----|---------|----------|---------------|-------------|
| ENV-001 | Hearth Fire | Great Hearth | Procedural flame | Central fire. Base flame with 3 layers: core (white-hot), middle (amber), outer (red tips). Responds to Storyteller's emotional beats. |
| ENV-002 | Sconce Flames | All corridors | CSS flicker | Wall-mounted torch flames. Flicker at varying rates. Cast moving shadows on walls. |
| ENV-003 | Candle Flames | Library, archive, tables | CSS flicker | Multiple candles. Each flickers independently. Wax drips slowly. |
| ENV-004 | Pipe Smoke | Storyteller's pipe | Particle system | Smoke rings and streams. Shape shifts: dragon, raven, castle. Dissipates upward. |
| ENV-005 | Lantern Light | Market stalls, corridors | CSS pulse | Hanging lanterns. Sway gently. Light pools on ground shift. |
| ENV-006 | Bioluminescence | Water Zone, caves | CSS pulse | Organic light sources. Pulse at 42Hz. Ripple when disturbed. |
| ENV-007 | Starlight | Cosmology level | CSS twinkle | Rotating star field. Stars twinkle. Constellations slowly rotate. Shooting stars occasionally. |
| ENV-008 | Glowworm Light | Cave ceilings | CSS wave | Clusters dim and brighten in waves across ceiling. Like breathing. |

### 3.2 — Water and Liquid

| ID | Element | Location | Animation Type | Description |
|----|---------|----------|---------------|-------------|
| ENV-009 | Underground River | Catacombs | CSS wave | Flowing water. Surface ripples. Reflects ceiling. Current moves left to right. |
| ENV-010 | Water Zone Surface | Water Zone | CSS wave | Lake/ocean surface. Waves at varying frequencies. Light refracts through. |
| ENV-011 | Waterfalls | Various zones | Particle system | Cascading water. Mist at base. Spray particles. |
| ENV-012 | Fountain | Market area | CSS arc | Water arcs from fountain. Drops fall. Ripples in basin. |
| ENV-013 | Potion Bubbles | The Keeper's lab | CSS rise | Bubbles rise in glass vessels. Pop at surface. Different colors per potion. |
| ENV-014 | Mead Pouring | Meadery | CSS liquid | Liquid fills tankard. Golden color. Foam head. Tiny bubbles. |
| ENV-015 | Rain | Campgrounds (weather) | Particle system | Optional weather effect. Raindrops. Splashes on surfaces. Puddles ripple. |
| ENV-016 | Liquid Obsidian | Shadow Inn Water Zone | CSS flow | Black, reflective liquid. Flows uphill in Shadow state. Surface mirrors the player. |

### 3.3 — Plants and Organic Growth

| ID | Element | Location | Animation Type | Description |
|----|---------|----------|---------------|-------------|
| ENV-017 | Floating Seeds | Campgrounds | Particle system | Dandelion-like seeds drift on wind. Spin slowly. Catch light. |
| ENV-018 | Vine Growth | Inn-Tree structure | CSS growth | Vines slowly grow along walls and pillars. Leaves unfurl. New growth appears over time. |
| ENV-019 | Flower Bloom | Seelie Court, Campgrounds | CSS bloom | Flowers bloom in presence of Seelie Queen. Petals open. Close when she passes. |
| ENV-020 | Pollen Drift | Campgrounds, Gorgon's Garden | Particle system | Golden pollen drifts in air. Swirls in eddies. Catches light. |
| ENV-021 | Root Pulse | Fae Kingdom, Inn roots | CSS pulse | Root tendrils pulse with 42Hz amber light. Wave travels from base to tips. |
| ENV-022 | Leaf Fall | Canopy City, Campgrounds | CSS fall | Leaves detach and fall. Spin. Catch air currents. Drift to ground. |
| ENV-023 | Mushroom Glow | Fae Kingdom | CSS pulse | Bioluminescent mushrooms. Pulse slowly. Different colors per cluster. |

### 3.4 — Mechanical and Structural

| ID | Element | Location | Animation Type | Description |
|----|---------|----------|---------------|-------------|
| ENV-024 | Clockwork Gears | Clockwork Skies zone | CSS rotation | Interlocking gears turn at different rates. Steampunk aesthetic. Cog teeth interlock perfectly. |
| ENV-025 | Antikythera Mechanism | Splash screen, Tesla's office | CSS rotation | Layered translucent gears. Bronze. Counter-rotate. Complex, beautiful, ancient computer. |
| ENV-026 | Pipe Systems | Throughout Inn | CSS flow | Pipes run through walls. Steam escapes at joints. Pressure gauges tremble. |
| ENV-027 | Elevator/Pulley | Between Inn levels | CSS vertical | Wooden elevator platform. Rope and pulley. Sways slightly. |
| ENV-028 | Windmill | Campgrounds | CSS rotation | Slow rotation. Creaks. Blades catch light. |
| ENV-029 | Bellows | The Smiths' forge | CSS expand/contract | Leather bellows expand and contract. Push air into forge. Forge flares on each pump. |
| ENV-030 | Printing Press | Library, archive | CSS mechanical | Press plate lowers, presses, raises. Ink rolls. Page feeds. Repeat. |

### 3.5 — Atmospheric and Particle

| ID | Element | Location | Animation Type | Description |
|----|---------|----------|---------------|-------------|
| ENV-031 | Dust Motes | Light shafts throughout | Particle system | Drift in light beams. Golden. Spiral. Settle when light moves. |
| ENV-032 | Fog/Mist | Fae Kingdom, catacombs | CSS drift | Low-lying fog. Drifts horizontally. Parts when player walks through. |
| ENV-033 | Shadows | Throughout Inn | CSS shift | Moving shadows from flame sources. Cast by NPCs and objects. Flicker with light sources. |
| ENV-034 | The Pulse Line | Bottom of screen (all zones) | CSS waveform | The 42Hz/84Hz frequency indicator. Always present. Shifts between modes. Visual heartbeat of the Inn. |
| ENV-035 | Floating Books | Library | CSS levitation | Occasional book floats from shelf to reading table. Pages flutter. Lands gently. |
| ENV-036 | Sparkles | Crystal areas, magic zones | Particle system | Tiny light points. Appear and fade. Concentrate near magical NPCs. |
| ENV-037 | Smoke from Cauldron | Madame Mim's area | Particle system | Cauldron bubbles. Smoke rises in shapes. Purple and green. Transforming. |
| ENV-038 | Frost Crystals | Unseelie Court, Norse zone | CSS form | Frost patterns form on surfaces. Spread from Unseelie King's throne. |
| ENV-039 | Sand Particles | Egypt zone, desert areas | Particle system | Fine sand drifts. Settles on surfaces. Disturbed by movement. |
| ENV-040 | Ember Rise | Forge, hearth, any fire | Particle system | Embers rise from fire sources. Glow, dim, fade. Spiral upward on heat currents. |
| ENV-041 | Snow Flakes | Norse zone, Unseelie Court | Particle system | Snow falls. Flakes spin. Accumulate on surfaces (if persistent). |
| ENV-042 | Aurora | Cosmology level | CSS wave | Northern lights effect. Ribbons of color. Shift slowly. Green, violet, gold. |

---

## SECTION 4: MOVEMENT SPECIFICATIONS

### 4.1 — Animation Types Summary

| Type | Count | Method | Examples |
|------|-------|--------|----------|
| Character Sprites | 45 NPCs | Sprite sheet (idle, walk, interact, dialogue) | Storyteller, Cthulhu, Odin, all main NPCs |
| Filler Critters | 60 creatures | Sprite sheet (idle, wander, react) | Dragon kittens, gargoyle puppies, fizgigs |
| CSS Animations | 25 elements | CSS keyframes | Flames, fog, gears, vines, pulse line |
| Particle Systems | 17 elements | JS particle engine | Smoke, dust, embers, rain, pollen, sparkles |
| Procedural | 5 elements | JS + canvas | Hearth fire, aurora, liquid obsidian, starlight |

**Total animated entities: 152**

### 4.2 — Sprite Sheet Specifications

Each character/creature sprite sheet contains:

**NPCs (45 characters):**
- Idle: 4-8 frames, looping, 8-12 FPS
- Walk: 6-8 frames, looping, 10-12 FPS
- Interaction: 4-6 frames, play-once, 10 FPS
- Dialogue: 2-4 frames (mouth/gesture), looping, 6-8 FPS
- Special: 4-8 frames per unique action (pouring, reading, hammering, etc.)
- **Total per NPC: ~20-35 frames**

**Filler Critters (60 creatures):**
- Idle: 2-4 frames, looping, 6-10 FPS
- Wander: 4-6 frames, looping, 8-10 FPS
- React: 2-3 frames, play-once, 10 FPS
- **Total per critter: ~8-13 frames**

**Total sprite frames for all entities: ~1,500-2,000 frames**

### 4.3 — CSS Animation Specifications

All CSS animations use the Inn's established aesthetic:
- 42Hz = 23.81ms cycle (too fast for visual — use 42BPM for visible motion: 1.43s per cycle)
- 84Hz = double speed (0.71s per cycle)
- Natural variation: each instance gets a random delay/duration offset

Key CSS animation classes needed:
```
.geode-flame-flicker     — fire/light sources
.geode-water-ripple      — water surfaces
.geode-pulse-42hz        — 42Hz frequency indicator
.geode-pulse-84hz        — 84Hz Shadow Inn state
.geode-vine-grow         — organic growth
.geode-gear-rotate       — mechanical rotation
.geode-fog-drift         — atmospheric fog
.geode-dust-mote         — particle drift
.geode-leaf-fall         — falling leaves
.geode-snow-fall         — snow particles
.geode-star-twinkle      — starlight
.geode-smoke-rise        — smoke and steam
.geode-breathe           — gentle scale pulse (living things)
.geode-float            — levitation (books, wisps)
.geode-sway             — gentle pendulum (lanterns, hanging objects)
```

### 4.4 — Particle System Specifications

JS-based particle system with the following emitter types:
- Fire embers (upward, spiral, glow-fade)
- Dust motes (drift, spiral, settle)
- Smoke (upward, expand, shape-shift)
- Water spray (arc, gravity, splash)
- Pollen/seeds (float, spin, catch light)
- Sparkles (appear, fade, concentrate near magic)
- Rain/snow (fall, spin, accumulate)
- Sand (drift, settle, disturb on movement)

---

## SECTION 5: ZONE-BY-ZONE AMBIENT LIFE COUNT

| Zone | NPCs | Critters | Environmental | Total Animated Elements |
|------|------|----------|---------------|------------------------|
| Main Floor (Common/Hearth/Bar) | 5 | 12 | 8 | 25 |
| Library/Archive | 4 | 8 | 6 | 18 |
| Market Stalls | 2 | 4 | 4 | 10 |
| Workshop | 3 | 5 | 5 | 13 |
| Staircase (Alchemy/Thinkers) | 4 | 3 | 4 | 11 |
| Upstairs (Cosmology) | 3 | 5 | 5 | 13 |
| Downstairs (Catacombs) | 4 | 6 | 6 | 16 |
| Campgrounds | 2 | 8 | 7 | 17 |
| Fae Kingdom | 4 | 6 | 5 | 15 |
| Water Zone | 1 | 6 | 5 | 12 |
| Norse Zone | 2 | 3 | 4 | 9 |
| Camelot Zone | 2 | 2 | 3 | 7 |
| Coastal Zone | 1 | 2 | 3 | 6 |
| Canopy City (Meadery) | 2 | 3 | 4 | 9 |
| Gorgon's Garden | 1 | 3 | 3 | 7 |
| Clockwork Skies | 0 | 1 | 4 | 5 |
| Greek Underworld | 2 | 2 | 3 | 7 |
| **TOTALS** | **45** | **82** | **80** | **207** |

---

## SECTION 6: PRIORITY TIERS FOR IMPLEMENTATION

### Tier 1 — The Inn Feels Alive (Must Have for Beta)
- All 12 main floor NPCs (Storyteller, Catalyst, Constant, Eres, Bard, Eileen, Smiths, Artisan Thief, Joe, Odin Wanderer, Fixer, Ceiling Gnome)
- 8 dragon kittens
- 6 gargoyle puppies
- 6 fizgigs
- 5 brownies
- Hearth fire, sconce flames, candle flames, pipe smoke
- Dust motes, floating books, the Pulse Line
- **Total: ~50 elements**

### Tier 2 — The Zones Have Life (Should Have for Full Release)
- All zone master NPCs (Hel, Medusa, Seelie royalty, etc.)
- Council of Thinkers
- Quest NPCs (Examiner, Shifting Man, etc.)
- Pixies, sprites, salamanders
- Crystal spiders, stone mice, bookworms
- Water creatures, flying creatures
- All zone-specific environmental elements
- **Total: ~100 elements**

### Tier 3 — The Details That Matter (Polish)
- Ground creatures (hedgehogs, beetles, snails, turtles, lizards)
- Weather effects (rain, snow, aurora)
- Advanced particle systems (liquid obsidian, sand, frost)
- Seasonal variations, day/night cycles
- **Total: ~57 elements**

---

## SECTION 7: THE CEILING GNOME

The Ceiling Gnome gets a special mention because the Ceiling Gnome is the Inn's signature ambient joke. A two-foot figure in an acorn-cap hard hat, hanging upside-down from the ceiling beams, maintaining the ornate architecture nobody looks at. The Ceiling Gnome should:
- Appear in every zone, always on the ceiling
- Hammer something different in each zone
- Drop a tiny tool occasionally (player can pick up as a novelty item)
- Look down at the player if they stand still too long
- Never be mentioned by any NPC. The Ceiling Gnome simply exists.
