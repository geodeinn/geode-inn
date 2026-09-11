# Movement Cycle Wiring Spec — Tier 1 + Tier 2 Wiring into the Web Beta

**Status:** Ready for builder handoff (2026-09-10)
**Owner:** Elio (art + spec) → fizgigs (wiring)
**Source manifest:** `docs/gallery/geode_inn_complete_urls.md` (sections: "Animation — Tier 1 Movement Wave", "TIER 2 MOVEMENT CYCLES" waves 1-4)
**Engine basis:** Flip-book / panel animation technique, verified by the fizgigs 2026-09-09 ("will work beautifully throughout the game")

---

## 1. How the sheets work

Every cycle sheet is a **horizontal strip of equal-width frames** on a plain dark warm brown background (water critters: dark blue-green). The flip-book engine slices the strip into frames and plays them in order, looping.

- **Tier 1 sheets:** 4 frames → each frame = 25% sheet width
- **Tier 2 sheets:** 6 frames → each frame = 16.67% sheet width

CSS pattern (proven with the Tumble bounce and hearth fire loops):

```css
.critter-cycle {
  background-image: url(SHEET_URL);
  background-repeat: no-repeat;
  animation: cycle 640ms steps(4) infinite;
}
@keyframes cycle {
  from { background-position-x: 0; }
  to   { background-position-x: -100%; }
}
```

`steps(N)` hard-cuts between frames — no tweening. That's the flip-book look and it's deliberate.

**Proven frame timing:** 160ms/frame (Tumble bounce loop, 2026-09-09).

## 2. Tri-mode wiring (the important part)

Every Tier 2 element ships as a **matched pair**: a living sheet and a canonical 84Hz shadow variant (spectral shift 0.85). Tier 1 sheets have living masters; shadow variants can be generated with the same `spectral_shift_84hz.py` recipe if wanted.

| Mode | Wiring |
|---|---|
| Living | Living sheet as-is |
| Shadow | Swap `background-image` to the `_shadow` sheet — hard cut, no crossfade (tectonic, not dissolve) |
| Echo | Living sheet + CSS filter desaturation (`filter: grayscale(0.85) contrast(0.9);`) — matches the "grey Rackham" Echo canon from Silk Road |

The swap must be instant on tri-mode transitions. The Inn does not fade between states — it snaps, like tectonic plates.

## 3. Tier 1 roster (4-frame sheets)

| Element | Cycle | Suggested frame ms | Placement |
|---|---|---|---|
| Fizgig (Wrench-class, recolorable x6) | scurry | 140 | Everywhere — builders move through all zones |
| Gargoyle puppy (recolorable x6 frequency pairs) | trot | 160 | Staircase landings + main floor corners |
| Brownie (Sweep-class, recolorable x5) | sweeping | 200 | Main floor, hearth perimeter |
| Ceiling gnome | hammering | 180 | Main floor ceiling (Whisper Layer tracker) |
| Hearth fire | flicker | 160 | Main floor hearth — always on, never off |
| Odin the Wanderer | walk | 200 | Main floor → Campgrounds wander route |
| Chibi raven (Huginn/Muninn class) | flutter-hop | 120 | Wanderer's shoulder radius + window ledges |
| Bartender (Catalyst class) | glass-polish idle | 240 | Common Room bar |
| Sentinel guard (Lozen class) | patrol walk | 220 | Entrance + Campgrounds patrol route |
| The Owl | glide | 260 | Rafters, upper zones — appears rarely |
| Pipe smoker (Brim class) | pipe-smoke idle | 300 | Fire-side chair, Archive nook |

Tier 1 sheet URLs live in the manifest's "Animation — Tier 1 Movement Wave" table. Recolor variants: kittens x8, puppies x6, fizgigs x6, brownies x5 — same sheet geometry, palette shifts only.

**Proof loops already exist:** ceiling gnome hammering GIF and hearth fire flicker GIF (manifest, "Sliced loops") — usable as immediate placeholders while engine wiring lands.

## 4. Tier 2 roster (6-frame sheets, all living + 84Hz shadow pairs)

All 50 URLs are in the manifest, TIER 2 waves 1-4. Pair convention: `NAME.png` = living, `NAME_shadow.png` = shadow.

| Element | Cycle feel | Placement |
|---|---|---|
| Hearth salamander | tail-curl ember flicker | Main floor hearth (with hearth fire) |
| Candle salamander | wick-slink | Candle clusters, Staircase sconces |
| Bookworm | page-turn chew | Archive shelves |
| Stone snail | slow glide | Garden paths (slowest ambient, 600ms+ frames) |
| Stone mouse | dart-sit-dart | Catacombs, Vault stacks |
| Dust mote | drift-swirl | Everywhere light shafts exist (opacity 0.5) |
| Glowworm | pulse-crawl | Catacombs ceiling, Tomb Tunnel |
| Dew sprite | hover-shimmer | Campgrounds morning dew (Fae-adjacent) |
| Hearth pixie | flit-nudge-glow | Hearth + rafters |
| Glow fish | pulse-school | Water Zone tide pools |
| Lantern jellyfish | drift-glow-drift | Water Zone deep sections |
| Pearl crab | scuttle-click-bury | Tide pool floors |
| Reed frog | croak-breathe (42Hz croak canon) | Water Zone reeds — audio trigger tie-in |
| Water strider | skate-ripple | Pool surfaces |
| Tidal octopus | color-shift glide (Monet skin) | Tide pool deep edge — friendly first-contact |
| Deep octopus | slow translucent drift | Abyssal sections — gentle, never menacing |
| Rafters bat | hang-flutter-hang | Main floor beams + chandeliers (nocturnal schedule) |
| Candle moth | flame-loop (doomed orbit) | Any candle — the Inn's beloved tragedy |
| Pond dragonfly | hover-dart-skim | Pool surfaces, daytime |
| Wild raven | strut-scout-steal | Window ledges, Campgrounds — shiny-thing thief |
| Mirror carp | glide-turn-glide | Still pools (reflection moment: pause + glint) |
| Moss hedgehog | snuffle-curl | Garden, forest edges |
| Rune beetle | roll-pat paper balls | Archive — the tiniest custodian |
| Moss turtle | amble-graze-rest | Garden basking stones (600ms+ frames) |
| Crystal lizard | bask-flick-scurry | Crystal Garden stones |

## 5. Wander behavior (keep it simple for beta)

- **Idle class** (salamanders, turtle, lizards, moth): loop in place at fixed anchor points.
- **Patrol class** (fizgigs, brownies, Sentinel, Wanderer): loop cycle + slow CSS translate between 2-4 waypoints.
- **Fleeting class** (owl, dew sprite, deep octopus): appear on long random timers (60-180s). Rarity IS the effect.
- **Schedule class** (bat, moth, dragonfly): day/night gate if the hub has a time state; otherwise constant.

## 6. Priority order for wiring

1. Hearth set (fire, hearth salamander, hearth pixie, ceiling gnome) — the Main Floor must feel alive first
2. Patrol class (fizgig, brownie, Sentinel, Wanderer + raven)
3. **MIGRATION CLASS (the dragon kittens  formally wired from the tabletop layer, 2026-09-11, Krista's ask: "do they ever wander into the main areas?"  YES):** Joe the Miniaturist's painted kittens leave the Undercity studio through THE MIGRATION EXIT and follow warmth. Each kitten claims ONE warm spot (the Common Room fire, the Main Floor hearth, the Archive nook's reading lamp, the Meadery's still, the Ragana's hearth-side, the Glassblower's furnace glow, the Campgrounds fire pits) and can be found curled there; kittens RARELY swap spots (a swap is an event  the player notices, the way you notice the cat picked a new chair). The migration is the tabletop GM guide's law made engine canon: finding the kittens = exploring the Inn's warm corners. THE FLIGHT-BY-ACCIDENT: per the Flight Law, kittens fly by accident  startle one and it lifts three inches, lands somewhere new, looks embarrassed. Never a mechanic; always a charm (the Adequacy Law's cozy cousin). THE MOST FAMOUS MIGRANT: the dragon kitten asleep on Oleander's shoulder (the Seelie King)  the one kitten that migrated all the way to the Fae Kingdom and stayed; the fierce king the small things trust.
4. **PROWL CLASS (the gargoyle puppies  canonized 2026-09-11):** six pups, one per sentinel frequency pair; each pup naps where its own frequency sounds strongest that day (a living frequency map); the PACK TROT at dawn and dusk  all six, post to post, the Inn's rarest cute sighting. Wander AI: frequency-anchor napping + twice-daily pack trot route.
3. Water Zone batch (glow fish → deep octopus)
4. Ground crew + flying crew
5. Archive pair (bookworm + rune beetle) — small, high charm
6. The Owl last — one rare watcher over a living Inn

---

*All masters Inn-owned, metadata stripped. Shadow variants generated with `spectral_shift_84hz.py` (84Hz canonical, factor 0.85). Questions to Elio via the builder inbox.*

## 7. Trigger effects — voice + bubble overlays on movement cycles

Trigger effects fire as overlays on the movement loops — never pausing the cycle unless the character deliberately stops. First wired trigger (Krista-requested 2026-09-10):

### LOZEN — "Oi." (annoyance trigger)
- **Dialogue record:** `lozen_oi_trigger` in the Dialogue entity (priority 9, conditionTag `annoyed_trigger`, setFlags `lozen_annoyed`)
- **When truly annoyed:** fires on trigger abuse, loitering in restricted areas, or a second infraction within 60s
- **Wiring:** speech bubble overlay anchored to the Sentinel patrol cycle; patrol stops on the first "Oi" (one beat), resumes on compliance
- **Escalation:** repeat infraction → Lozen steps into the player's path; the patrol cycle swaps to an idle-stop hold; no more words
- **Voice design:** the "Oi" is thrown like a jab — flat, complete, the entire warning in one syllable. Boxer cadence. Audio trigger if voice clips are recorded later; text bubble stands alone until then
- **Canon:** "The river kept the water. I kept the watch." — the annoyance is protective, not hostile. Lozen holds the line so the Inn never has to raise its voice
