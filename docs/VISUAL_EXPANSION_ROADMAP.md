# Visual Expansion Roadmap & Animation Sequencing Guide

*The Geode Inn — a catalog of what needs visual expansion and a technical blueprint for zone animation sequencing.*

---

## Table of Contents

1. [Visual Expansion — Priority Map](#visual-expansion--priority-map)
   - [Tier 1: Character Portraits](#tier-1-character-portraits-highest-impact)
   - [Tier 2: Zone Backgrounds & Atmosphere](#tier-2-zone-backgrounds--atmosphere)
   - [Tier 3: Game Sprites & Assets](#tier-3-game-sprites--assets)
   - [Tier 4: Supporting Media](#tier-4-supporting-media)
2. [Animation Sequencing for Zone Modification](#animation-sequencing-for-zone-modification)
   - [The Core Idea: Zone Transition Orchestrator](#the-core-idea-zone-transition-orchestrator)
   - [Frequency-State Transitions](#frequency-state-transitions-living--shadow--in-between)
   - [Story-Triggered Permanent Modifications](#story-triggered-permanent-modifications)
   - [Technical Suggestion: ZoneSequencer](#technical-suggestion-zonesequencer)

---

## Visual Expansion — Priority Map

### Tier 1: Character Portraits (Highest Impact)

From the portrait ledger, many NPCs have only shadow/in-between states but **no living portrait**. These are the characters travelers meet face-to-face. Each character should have **3 states** — living (42Hz, warm), shadow (84Hz, dark mirror), in-between (phase-shifting, ethereal). Square portraits, ~600×600px, work best with the Celtic portrait frame.

#### Main Floor
- The Host / Storyteller
- The Bartender
- The Exile
- The Cartographer

#### Staircase (Alchemy)
- The Alchemist
- The Librarian
- The Examiner
- The One Who Tends (Eileen)
- The One Who Is Awake

#### Catacombs
- The Queen of Webs
- The Constant
- The Guest (Death)
- The Blacksmith (Dwarf)
- Thorin

#### Cosmology
- Einstein
- Jakob
- The Weaver
- The Watcher

#### Fae Kingdom
- Seelie Queen
- Unseelie Queen
- Court fae (summer court / winter court)

#### Water Zone
- Pirate captain
- Merfolk
- Tide-pool spirits

#### Gorgon's Garden
- Medusa
- The Gardener (Radagast)
- Frozen vine creatures

#### Hollow Earth
- The First
- Admiral Byrd
- Echo faction leader
- Deep One faction leader
- Lost faction leader

---

### Tier 2: Zone Backgrounds & Atmosphere

These zones currently rely on CSS gradients and need organic, hand-drawn backgrounds. Wide panoramas (1920×800 or taller) that can parallax-scroll, plus tileable texture strips for corridors.

- **Main Floor** — the hearth, market stalls, arcade nook (wide panoramic)
- **Staircase** — the ascending spiral, alchemy alcoves
- **Catacombs** — bone-lined tunnels, underground springs
- **Cosmology** — the spacecraft/observatory interior
- **Faerie Kingdom** — Seelie court (glowing summer), Unseelie court (frozen winter)
- **Water Zone / Tidal Caves** — six subterranean water environments
- **Canopy City** — nine cultural platforms (rope bridges, treehouse markets)
- **Hollow Earth** — nine districts (crystal city, archives, resonance engine)
- **Gorgon's Garden** — petrified statuary, poison herbs, frozen vine
- **The In-Between** — phase-shifting borderless space
- **Clockwork Skies** — anime-styled flying zone
- **Shadow Inn** — the 84Hz dark mirror of the entire Inn

---

### Tier 3: Game Sprites & Assets

The arcade games currently use colored rectangles as sprite placeholders. Each needs:

- **Standing Stones** — Tetromino-shaped stone blocks, Preseli Blue Stone texture
- **Tomb Tunnel** — Dig Dug-style digger, sand/limestone tiles, scarab enemies
- **Andean Run** — Runner character, Inca terrace tiles, obstacles
- **Monster of the Deep** — Sea creatures (6+ designs), water body backgrounds
- **Tumble Run** — Tumble the egg, canyon obstacles, brownie rescue sprites
- **Bead Board** — Bead renders (matching Stone entity colors/facets)
- **Stone Memory / Solitaire / Dominance** — Card-face designs, stone textures
- **Murloc's Remedy** — Murloc doctor, pill sprites, bottle grid
- **Jigsaw Relics** — Three jigsaw art styles (buried, drift, watching)
- **World Games** — Sphinx, Kappa, Labyrinth, El Muki, Nidhogg character sprites
- **The Caravan** — Caravan cart, charm items, Silk Road route tiles

---

### Tier 4: Supporting Media

- **Stone bead crops** — round bead photos for the Codex and Bead Composer (many stones lack `imageFile`)
- **Market item images** — real product photos for artisan listings (both real-world and in-game variants)
- **Comic strip art** — Gazette strips need full panel art
- **Podcast cover art** — Daily Echoes episode thumbnails
- **Spirit manifestation images** — expanding the 159-stone spirit system
- **Steam capsule images** — for the Steam Studio catalog cards
- **Egg designs** — decorative egg shells for the Hatchery (Stone/Iron/Gold/Geode tiers)

---

## Animation Sequencing for Zone Modification

### The Core Idea: Zone Transition Orchestrator

A single component (`ZoneTransitionOrchestrator`) that sequences entrance animations when a traveler crosses a zone threshold. Instead of everything appearing at once, it **stages** the reveal:

| Phase | Timing | What Happens |
|---|---|---|
| **Phase 0 — Threshold** | 0ms | Screen dims, current zone audio drone fades out |
| **Phase 1 — Foundation** | 200ms | Background panorama fades/slides in, zone CSS theme variables shift (colors, filter values) |
| **Phase 2 — Atmosphere** | 600ms | Ambient particle layers activate (fireflies, dust motes, water ripples), ambient audio drone starts at the zone's resting BPM |
| **Phase 3 — Inhabitants** | 1000ms | NPC sprites emerge with staggered delays (`staggerChildren: 0.15`), critters and fizgigs begin their idle loops |
| **Phase 4 — Invitation** | 1400ms | Interactive elements (doorways, items, quest markers) pulse softly, signaling readiness |

This maps perfectly onto the existing `innAudio.js` zone profiles — each phase can trigger its corresponding audio layer (drone → heartbeat → stone tones → NPC voices).

---

### Frequency-State Transitions (Living ↔ Shadow ↔ In-Between)

The tri-mode system is already spec'd in `innAudio.js` (42Hz / 84Hz / null). For visual sequencing:

- **Living → Shadow**: Hard cut (no crossfade, per the spec — "tectonic shift"). Background inverts, NPC portraits swap to their shadow variants, particle colors shift from amber to violet, animation speeds double (84Hz = 2× 42Hz).
- **Shadow → Living**: Another hard cut back.
- **→ In-Between**: Phase-shifting — use framer-motion's `animate` with keyframe arrays that oscillate (e.g., `opacity: [0.3, 0.7, 0.3]` with `repeat: Infinity`), borders blur, sprites use the `fae-shifting` class.

The `OctaveMirrorControl` already toggles this — it should be wired to drive both audio mode AND a React context that zone components read for their visual state.

---

### Story-Triggered Permanent Modifications

When a quest completes or a reputation threshold is crossed, the zone should **permanently** change:

- New NPC sprites appear (previously hidden characters emerge)
- Color palette shifts (e.g., Gorgon's Garden freezes → blue-white tint after the Waking Vine is frozen)
- New audio layers unlock (the Nine Muses chord when the Inn Song completes)
- Previously locked doorways become accessible (visual: the doorway's border shifts from muted to glowing gold)

These should be driven by `PlayerProgress` fields — the zone reads the player's progress and renders accordingly. The animation sequence plays **once** when the change is first discovered, then settles into the new baseline.

---

### Technical Suggestion: ZoneSequencer

A `ZoneSequencer` component that:

1. Takes `zone`, `frequencyState`, and `playerProgress` as props
2. Uses framer-motion `variants` with `staggerChildren` for the phased reveal
3. Reads the zone's DSP profile from `innAudio.js` to sync audio timing with visual phases
4. Exposes a `useZoneTransition` hook that child components can use to know which phase is active (so an NPC can wait for Phase 3 before emerging)

This keeps all zone transitions consistent without each page reimplementing the sequence. The existing `AnimatedLayout` (which currently just fades pages) could delegate to this for a richer, zone-aware transition.

#### Proposed Hook Signature

```javascript
const { phase, isTransitioning, frequencyState } = useZoneTransition({
  zone: 'catacombs',
  playerProgress: progressData
});
// phase: 0-4 (which reveal phase we're in)
// isTransitioning: boolean (true during the 1.4s entrance sequence)
// frequencyState: 'living' | 'shadow' | 'inBetween'
```

#### Proposed Variant Structure

```javascript
const zoneVariants = {
  hidden: { opacity: 0 },
  visible: {
    opacity: 1,
    transition: {
      staggerChildren: 0.15,
      delayChildren: 0.2
    }
  }
};

const layerVariants = {
  hidden: { opacity: 0, y: 20 },
  visible: (phase) => ({
    opacity: 1,
    y: 0,
    transition: { duration: 0.4, delay: phase * 0.2 }
  })
};
```

---

## Summary

The highest-value images that can be created right now are:

1. **Tier 1 character portraits** (3 states each — living, shadow, in-between)
2. **Tier 2 zone backgrounds** (wide panoramas + tileable textures)

Those two categories will transform the app more than anything else. For animation sequencing, the phased-orchestrator approach gives every zone entrance a cinematic, cohesive feel without duplicating logic across pages.

---

*The Geode Inn — est. MMXXIV*