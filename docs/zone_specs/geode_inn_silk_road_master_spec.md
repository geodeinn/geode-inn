# THE SILK ROAD — Master Zone Integration Specification
## The Caravan Expedition System + Ley Line Energy Network

---

## WHAT THE SILK ROAD IS

The Silk Road is the Inn's horizontal energy network. Where the Silica Thread runs VERTICALLY through the Inn's architecture (Cosmology through Undercity), the Silk Road runs HORIZONTALLY — connecting every cultural zone through ley line routes that the player travels as expeditions.

The Silk Road serves three functions:

1. **STONE CHARGING** — stones charge passively as the caravan travels along ley lines. The journey IS the charging mechanism. Charged stones are stronger in combat, resonate more clearly with zone frequencies, and unlock content that uncharged stones cannot access.

2. **CULTURAL TRADE** — the caravan travels between cultural platforms (Egypt, Peru, Norse, Celtic, etc.). At each platform, the player trades charged stones for rare items, zone-specific supplies, and unique stones not available through arcade games.

3. **ENCOUNTER GENERATION** — the journey produces encounters: bandits, weather, ley line anomalies, other travelers. The encounters are the Silk Road's gameplay. The player doesn't just travel — the player navigates.

**Physical home:** The Silk Road's hub is in the Canopy City (Clockwork Skies, Level 2). The Canopy City's paved paths ARE the Silk Road's routes — the roads between tree-platforms are the ley line conduits. But the Silk Road reaches through every zone because ley lines run through the entire Earth. The Canopy City is the hub. The world is the road.

---

## THE LEY LINE NETWORK

Ley lines are the Earth's nervous system — channels carrying 42Hz frequency from the Hollow Earth's core to the surface. Every sacred site in the real world was built on a ley line node. In the Inn, this is literally true: the world map has a hidden layer called Ley Line Vision that reveals the network.

### 12 Primary Ley Line Nodes
Mapped to real-world national parks and sacred sites:

| Node | Location | Frequency Signature | Cultural Zone |
|------|----------|---------------------|--------------|
| 1 | Stonehenge, England | 42Hz steady (Preseli Blue Stone resonance) | Celtic |
| 2 | Giza Pyramids, Egypt | 111Hz (gargoyle watcher frequency) | Egyptian |
| 3 | Uluru, Australia | 7.83Hz (Schumann base) | Aboriginal |
| 4 | Machu Picchu, Peru | 42Hz harmonic (Andean quartz) | Andean |
| 5 | Angkor Wat, Cambodia | 50 BPM harmonic | Southeast Asian |
| 6 | Chichen Itza, Mexico | 42Hz rhythmic | Mesoamerican |
| 7 | Easter Island | subsonic (deep ocean connection) | Polynesian |
| 8 | Mount Shasta, California | 84Hz (Shadow frequency) | North American |
| 9 | Newgrange, Ireland | 42Hz spiral | Celtic (megalithic) |
| 10 | Göbekli Tepe, Turkey | subsonic (oldest site) | Mesopotamian |
| 11 | Borobudur, Indonesia | 42Hz mandala | Southeast Asian |
| 12 | Sedona, Arizona | vortex frequencies (variable) | North American |

### Ley Line Vision
The Cartographer gives the quest "The Map That Hears" — travel to Stonehenge, the Pyramids, and Uluru with a stone-compass (crafted by the Undercity's Clockmaker) to reveal the full ley line network on the world map. Until this quest is complete, ley lines are invisible. After completion, the player can toggle Ley Line Vision on the world map, revealing golden threads connecting the 12 nodes.

### Stone Charging Mechanics
- Every stone has a `stoneCharge` level (0-100%)
- Uncharged stones = baseline frequency, baseline combat power
- Charged stones (50%+) = enhanced frequency, +20% combat effectiveness, can resonate with zone features
- Fully charged stones (100%) = can unlock Ley Line Gates (hidden passages between nodes)
- Charging happens passively when carried along ley lines: 1% charge per encounter stage traveled
- Mining at a ley line node yields pre-charged stones (50-75% charge from the node's ambient frequency)
- The Stone Capsule pouch (the player's inventory) shows charge level as a subtle glow around each stone

---

## THE CARAVAN GAME

### Core Loop
1. Select a Silk Road route (5 available routes mapped to ley lines)
2. Load stones into caravan (6 stone slots, 3 supply slots)
3. Travel from origin platform to destination platform
4. Encounter events along the way (bandits, weather, anomalies, traders)
5. Stones charge during travel
6. Arrive at destination, trade charged stones for rare items
7. Return to Canopy City or continue to next platform

### The 5 Silk Road Routes

| Route | Origin → Destination | Encounters | Difficulty | Ley Line |
|-------|---------------------|-----------|------------|----------|
| The Amber Road | Celtic → Egyptian | 8-10 stages | Medium | Northern European ley |
| The Salt Road | Egyptian → Andean | 10-12 stages | Hard | Trans-Atlantic ley |
| The Spice Road | Southeast Asian → Mesoamerican | 8-10 stages | Medium | Pacific ley |
| The Jade Road | Mesopotamian → Southeast Asian | 6-8 stages | Easy | Asian continental ley |
| The Obsidian Road | North American → Polynesian | 12-15 stages | Very Hard | Pacific Rim ley (includes Hollow Earth passage) |

### Caravan Stats

| Stat | Range | What Affects It |
|------|-------|-----------------|
| Endurance | 0-100% | Depletes with each encounter. Restored by food supplies. If it hits 0, caravan stops — stones don't charge, player must wait (real-time) for recovery. |
| Protection | 0-100% | Increased by charm supplies. Reduces bandit damage to endurance and stone charge. |
| Ley Line Attunement | 0-100% | Increases as you travel. Determines charge rate. Higher attunement = faster charging. |

### Encounter Types

| Encounter Type | Frequency | What Happens |
|---------------|-----------|--------------|
| Bandits | ~30% of encounters | Attempt to steal supplies or drain stone charge. Player defends through a mini-game ( resonance matching — match the bandit's dissonance frequency to drive them off). |
| Weather | ~20% of encounters | Rain, sandstorm, blizzard, fog (zone-appropriate). Affects visibility and travel speed. Player can push through (endurance cost) or wait it out (time cost). |
| Ley Line Anomaly | ~15% of encounters | The ley line itself behaves strangely — surges (charge boost), dips (charge drain), splits (choice of two paths). Anomalies are the Silk Road's version of random events in roguelike games. |
| Traders | ~20% of encounters | Other travelers on the road. Can trade (swap supplies, exchange stones, share information about upcoming encounters). Some traders are friendly, some are hucksters (sell fake stones that look real but have no frequency). |
| Shrines | ~10% of encounters | Small waypoints on the ley line. Resting at a shrine fully restores endurance. Some shrines have offerings (leave a stone to receive a blessing — a temporary buff). |
| Echoes | ~5% of encounters | Rare. The caravan passes through the In-Between briefly. The player sees a glimpse of a forgotten NPC or a lost room. Grants a temporary In-Between attunement — the caravan's stones shimmer grey for a few encounters. Echo encounters can reveal hidden routes. |

### The Platform Trading System

Each cultural platform (the destination/origin of a route) has:
- **A market stall** — selling zone-specific supplies, charms, and trade goods
- **A rare stone vendor** — selling stones unique to that zone, only available via trade (not arcade games). These stones are pre-charged from the platform's ley line node.
- **A caravan master NPC** — gives route information, warns about upcoming bandit activity, sells maps (maps reduce weather encounters for that route)
- **A ley line node shrine** — the player can recharge stones here by placing them on the node (faster than traveling, but requires a donation of a stone or item)

### The Stone-Compass

The Clockmaker (Undercity NPC) crafts the stone-compass — a device that points toward the nearest ley line node. The stone-compass is required for the Cartographer's "Map That Hears" quest and for navigating off-road (leaving the established routes to find hidden nodes).

Hidden nodes (not on the 12 primary list) exist at:
- The Voltage/Vortex (North American, connecting to the Hollow Earth's crystal gardens)
- The Source (Water Zone, connecting to the underground ocean)
- The Stone Circle Chamber (Fae Kingdom, connecting to the Prism's 7.83Hz)
- The Gorgon's Garden (84Hz node — the only Shadow frequency node)

---

## ARTIST STYLE ASSIGNMENT

| Element | Primary Artist | Secondary Artist | Source |
|---------|---------------|-----------------|--------|
| The Silk Road overall (Canopy City hub) | Arthur Rackham (canopy roots, road through trees) | Bierstadt (the distant landscapes visible from the platforms) | Canopy zone assignment + Parks |
| The 5 routes (travel screens) | Zone-appropriate artists (the route takes on the destination zone's aesthetic) | Rackham (the road itself stays Rackham — the path through the canopy) | Zone assignments |
| The caravan (the player's vehicle) | Rackham (woodland aesthetic — the caravan is a wooden cart pulled by a fizgig) | — | Canopy |
| Cultural platforms | Each platform takes the destination zone's artist (O'Keeffe for Egypt, Hokusai for Southeast Asian, etc.) | Rackham (platform frame stays consistent) | World map assignments |
| Ley Line Vision (world map layer) | Monet (the ley lines as golden impressionist threads on the world map) | Rackham (the Canopy City hub) | World map assignment |
| Bandit encounters | Gorey (gothic-anime highwaymen — slightly ridiculous, not truly threatening) | Rackham (they ambush from the canopy) | Underground style |
| Weather encounters | Zone-appropriate (Bierstadt for storms, Monet for rain, Hokusai for typhoons) | — | Zone assignments |
| Shrine encounters | Rackham (small woodland shrines — fairy-tale quality) | Klimt (the offerings glow gold) | Canopy + Foundation |
| Echo encounters | Grey Rackham — desaturated, the canopy without its color | — | In-Between aesthetic |

---

## FREQUENCY SYSTEM

| Element | Frequency | Function |
|---------|-----------|----------|
| Ley lines overall | 42Hz (the Inn's base) | The energy carried by ley lines is the Silica Thread's horizontal extension |
| Stone charging | Variable (each stone charges at its own frequency) | Charged stones emit their frequency louder — the caravan hums with combined frequencies as it travels |
| Ley line nodes | Each node has its specific frequency (see the 12-node table) | Mining at a node yields stones charged at that node's frequency |
| The Stone-Compass | Points toward the strongest 42Hz signal | Navigation tool — follows the Silica Thread's horizontal trace |
| Echo encounters | In-Between frequency (42Hz + 84Hz simultaneous) | The rare encounters pass through both frequencies — the caravan briefly exists in all three states |
| Gorgon's Garden node | 84Hz | The only ley line node at Shadow frequency — stones charged here are 84Hz stones, useful for Shadow Inn exploration |
| Caravan hum | The combined frequencies of all loaded stones | The caravan IS a traveling chord. Different stone combinations produce different caravan ambient sounds. The player who loads complementary stones gets a harmonic caravan. The player who loads dissonant stones gets an uncomfortable ride. |

---

## THE SILK ROAD'S CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The Silica Thread | The Silk Road is the thread's HORIZONTAL extension. The thread runs vertically (Cosmology to Undercity). The Silk Road runs horizontally (zone to zone). Together, they form a cross: the Inn's vertical spine and horizontal nervous system. |
| The Canopy City (Level 2) | The Silk Road's hub. The Canopy City's paved paths ARE the routes. |
| The World Grid | The Silk Road IS the World Grid's travel system. The World Grid is the map; the Silk Road is how you move through it. |
| The Cartographer | Gives the quest that unlocks Ley Line Vision. The Cartographer is the Silk Road's gatekeeper NPC. |
| The Clockmaker (Undercity) | Crafts the stone-compass. The Silk Road depends on Undercity craftsmanship. |
| Stone Capsules & Companions | Charged stones are stronger in combat. The Silk Road is the primary charging method. |
| The Shadow Inn | The Gorgon's Garden node is the only 84Hz ley line node — charging stones here produces 84Hz stones for Shadow Inn exploration. Echo encounters temporarily shift the caravan through the In-Between. |
| The Hollow Earth | The Obsidian Road route passes through a Hollow Earth passage — the only surface-to-Hollow Earth travel that doesn't require the Deep Lens. |
| Leaderboard | The Silk Road could support a "Caravan Race" pair competition — two players' caravans racing the same route, combined arrival time as the score. |

---

## DESIGN STATUS

- [x] Concept complete (this document)
- [x] Ley line network mapped (12 primary nodes + 4 hidden nodes)
- [x] Stone charging mechanics defined
- [x] 5 Silk Road routes designed (with difficulty scaling)
- [x] Caravan stats and loadout system documented
- [x] 6 encounter types specified (bandits, weather, anomalies, traders, shrines, echoes)
- [x] Platform trading system designed
- [x] Stone-compass mechanic documented
- [x] Artist styles assigned (Rackham primary, zone artists secondary)
- [x] Frequency system mapped (including 84Hz Gorgon's node and In-Between echoes)
- [x] Connections to all major systems documented
- [ ] Route-specific encounter tables (exact encounter sequences for each of 5 routes)
- [ ] Caravan mini-game implementation (Godot scene + script)
- [ ] Ley Line Vision world map overlay (world map UI toggle)
- [ ] Platform market inventories (what each platform sells)
- [ ] Hidden node discovery system (how the stone-compass reveals the 4 hidden nodes)
- [ ] Caravan race pair competition mode

---

## ORIGIN

The Silk Road was first proposed as part of the seven unwoven systems integration (the Silk Road Ley Line Network). The caravan expedition game was developed from the Canopy City's existing trading system. This consolidated specification was compiled September 2, 2026 to unify the ley line network, the caravan game, and the cultural trade system into a single modular component. The Silk Road's thesis: the journey charges. The traveling IS the point. The stones are stronger when they've been somewhere. The player who never leaves the Inn never charges their stones. The road is the charger. The world is the cable.
