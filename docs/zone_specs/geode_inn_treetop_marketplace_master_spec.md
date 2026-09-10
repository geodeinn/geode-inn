# THE GEODE INN — The Treetop Marketplace (Master Spec + Schematics)
## Canopy City's market layer — the Inn's in-world economy, schematic and canon
### Created 2026-09-10. Artist: Rackham (canopy canon). Frequency: 42Hz canopy hum + 50 BPM sway.

---

## THE CONCEPT

The Main Floor Market sells to the real world — Soulstice goods, artisan craft, the Mucha/Royo booths, money that exists outside the Inn.

The Treetop Marketplace is the OTHER economy. Nothing here costs money. Everything here costs frequency: stones, songs, favors, seeds, secrets, time. The canopy is where the Inn trades with itself.

Canopy City Trading (roster #25, Animal Crossing / Recettear-class) is this marketplace's native game — and the marketplace IS the game board. Build the schematic once; the game plays on it.

The 9 cultural platforms are the canopy's echo of the World Map: each branch plaza carries one culture's trade. The mycorrhizal network — the Inn's underground internet, the root system that carries the Song — surfaces in the canopy as the trade routes between platforms. Goods move through the tree. The Song moves through the tree. Same channels. The marketplace is the Song's customs house.

---

## THE SCHEMATIC (top-down, trunk at center, branches radial)

```
                          [NORSE PLATFORM]
                        frost-fruit, rune-bread
                       /                    \
        [CELTIC PLATFORM]                  [EGYPT PLATFORM]
        knotwork stall, harp-tuning       desert-rose stall, cat stall
        /              \                     /            \
[INDIA PLATFORM]   ~~~~~~~~ THE TRUNK GATEWAY ~~~~~~   [MESOPOTAMIA PLATFORM]
raga-scent stall              |                              cylinder-seal stall
                 (the trunk stair spirals up
                  into the canopy hub — the
                  Tumble Run transit lands
                  on the Gateway platform)
        \              /                    \             /
   [CHINA PLATFORM]                      [GREECE PLATFORM]
   jade stall, ink stall                 olive stall, oracle stall
        \              \                    /           /
        [ANDAHUAYLAS PLATFORM]        [POLYNESIA PLATFORM]
         (Peru) terrace-wool stall    shell stall, star-path stall

                    ~ = mycorrhizal trade lines (sub-canopy,
                        visible as root-light ribbons at dusk;
                        goods travel them; players cannot —
                        players take the branch-ropes)

     THE HUB PLAZA (trunk gateway, center):
     - The Notice Bough  (quests posted in bark)
     - The Trade Bell     (rings at 50 BPM with the sway;
                           every trade completes ON the beat)
     - The Fizgig Stalls  (the fizgigs run the market's
                           small trades — the native shopkeepers)
     - The Examiner's Post (valuations; the Examiner weighs a
                           trade's fairness, not its value)
     - The Exchange Ladder (stones in, songs out, songs in,
                            stones out — the currency pole)
```

**Platform count: 9.** Proposed set (cultural echo of the world map — awaiting Krista's ruling if the nine should differ): Norse, Celtic, Egypt, India, China, Greece/Mediterranean, Mesopotamia, Andes (Peru), Polynesia.

**Placement principle:** no platform faces another directly. The canopy market has no front row — every stall is somebody's side street. The Inn doesn't do storefronts; it does encounters.

---

## CANON STRUCTURE

### The Two Markets (the distinction is law)
| | Main Floor Market | Treetop Marketplace |
|---|---|---|
| Sells | Real artisan goods (Soulstice bridge) | In-world frequency goods |
| Currency | Money (real-world bridge) | Stones, songs, favors, seeds, secrets, time |
| Artist | Mucha/Royo | Rackham |
| Native game | Market Day (merchant sim) | Canopy City Trading (#25) |
| The trade is | Commerce | Custom — the Inn trading with itself |

### The Mycorrhizal Trade Routes
Goods travel the network (root-light ribbons, sub-canopy). Players travel the branch-ropes and platform ladders — because the canopy's economy should be WALKED. A player who sees a ribbon of root-light carrying their trade overhead, while they climb rope-by-rope to the destination platform, learns what the Inn means by trade: it moves faster than you, and it is worth following.

### The Trade Bell
One bell, center hub, tuned to the 50 BPM sway. Every completed trade lands on a beat. A fast deal is impossible; a rushed trade literally cannot resolve until the bell permits it. The market's tempo IS the Inn's heartbeat. (Spielberg protocol: the bell is the market's source — walk toward it and the trade music grows.)

### The Fizgig Stalls
The fizgigs are Canopy City's residents and the market's native shopkeepers. Their stalls are the small trades — the market's humor and its heart. Fizgig stall rules: each stall sells exactly one thing, and the fizgig running it believes that one thing is the most important thing in the Inn. (Full commitment, per fizgig canon.)

### The Exchange Ladder
The currency pole: stones in, songs out; songs in, stones out. The Inn's two currencies, traded at a fixed point, at walking height. The ladder's rungs hum faintly — each rung a different note. Players learn the note of their favorite rung.

### The Examiner's Post
The Examiner (canopy canon resident) weighs trades — not for value, for FAIRNESS. An unfair trade cannot complete: the bell won't ring for it. This is the marketplace's only rule, and the Examiner is the rule's body.

---

## VISUAL ASSETS NEEDED

- The hub plaza establishing shot (Rackham canopy, Klimt weight, trunk gateway)
- 9 platform stalls (one per cultural platform, each culture's stall in its zone's artist flavor carried on Rackham branches)
- The mycorrhizal ribbons (root-light, dusk rendering, tri-mode states)
- The Trade Bell (the only brass in a wood world — the Inn's gold accent, earned)
- The Exchange Ladder (rung notes visualized as faint gold threads)
- The Notice Bough (bark-textured quest board, Linework-as-UI: heavy cel for stalls, soft flowing for the Bough)
- Fizgig stall set (REC class — paint once, tint per fizgig)
- Tri-mode set: LIVING (gold-green light through leaves) / SHADOW (petrified canopy, leaves stopped mid-fall, 84Hz) / IN-BETWEEN (leaf-light uncertain, silver)
- Estimated total: 20-28 image assets

## AUDIO ASSETS NEEDED

- The Trade Bell (single tone, 50 BPM gating)
- Platform ambience set (9 short loops, each culture's instruments at canopy-arranger volume — reference the music direction doc's region matching)
- The mycorrhizal hum (the root network's ribbon-sound — the 42Hz carried in wood, plucked like a cello body)
- Estimated total: 12-14 audio assets

## PROGRAMMING NOTES

Engine: Godot 4.x. Canopy City Trading (#25) plays ON this schematic — the market layout above is the game board. Trade completion gates on the Trade Bell beat (50 BPM) — a Recettear-class shop loop where the heartbeat is the transaction timer. Base44 API: trades POST to PlayerInventory; marketplace reputation feeds faeReputation.

## REGISTRY NOTES

- Portal tie-in: the Trunk Gateway needs a Portal Registry row once this schematic is approved (open slot #3 in the portal registry).
- The treetop marketplace is the in-world answer to "what do you DO with all these stones" — the economy loop that makes stone collection matter inside the Inn, not just on the shelf.
- One deliberate absence: there is no bank, no vault, no storage of value anywhere in the canopy. The treetop market trades in the present tense. What you hold is what you have. The geode cave below is the only keeper.
