# THE FAE KINGDOM MMO — PRODUCTION MASTER SPEC
## The First Legendary World Production — From Zone Art to Shippable Game
### Written 2026-09-11 (planning pass, Krista's call: "Plan the first one")

---

## WHAT THIS DOCUMENT IS

The Fae Kingdom MMO is the first of the three Legendary worlds to move from FOUNDING CAST to FULL PRODUCTION. This spec is the production plan: what exists (the audit), what's owed (the kit), the parcel order, the governing laws, and the gates Krista rules on.

**Why the Fae Kingdom is first:** of the three Legendaries (Fae Kingdom MMO, Hollow Earth RPG, Open World frequency game), the Kingdom carries the most completed art — its world-art front is effectively closed (showcase zones + inner rooms + interior kits + the queens' spaces). The remaining production is the GAME layer: casts, UI, scenes, animation, sprites. It is the shortest distance from "painted world" to "playable world."

---

## THE AUDIT — WHAT EXISTS (the HAVE column)

| Layer | Status | Source |
|-------|--------|--------|
| World art — 4 showcase zones | DONE | The Threshold, The Hollow, Summerlands, Crystal Gardens (ledger, 2026-09-11) |
| World art — 4 inner rooms | DONE | The Between, both courts' halls, the Stone Circle Chamber |
| Interior kits — 5 rooms | DONE | Threshold / Summerlands / Hollow / Crystal Gardens / Stone Circle Chamber (~50 masters, tri-mode + option views + props + ENV) |
| The Between's parcel | DONE | The seam wide, the Lost and Found (Two Roads law), the Head Finder |
| The queens' spaces | DONE | Bower, Winter Hall, Heartwood Court, the Vertical Gaze, props, census (dissection 07B painted) |
| Founding cast (Tier 4) | DONE | Seelie courtier, Unseelie courtier, six realm vignettes, portal ring, goblin trader, hob helper, labradorite |
| Character art — courts | DONE | Seelie + Unseelie full presence (original catalog), the queens, the kings (Oleander's portrait ruling held) |
| Chibi NPC roster | DONE | 8 chibi Fae NPCs (Fae, Trolls, Goblins, Ents, Dwarves, Orcs, Mermaid, Griffin) |
| Quest blueprint | DONE | fae_kingdom_quest_blueprint.md — WoW zone principles, hub-and-spoke, contextual dialogue law |
| Audio master profile | DONE | Arcade music profile: THE FULL PALETTE — Seelie gold cathedral vs Unseelie electronic dark; the court border = the Inn's ONLY sanctioned crossfade |
| Egg pools | DONE | Per the Species Law (mother-tree census + zone pools) |
| Portal system | DONE | Stone circle portals (Stonehenge first via Standing Stones win) |

**The verdict: the Kingdom's WORLD is painted. What remains is the MMO layer — the parts that make it a game rather than a gallery.**

---

## THE KIT — WHAT'S OWED (production parcels)

### PARCEL 1: THE RESIDENT CYCLES (the named cast, CYCLE-class masters with shadow rows)
Every resident NPC the player meets repeatedly, cast as a CYCLE-class master (1024px, living + shadow rows, per the REC law — masters first, recolors after). The roster, from the quest blueprint's named cast:

- **The two kings:** Oleander (the listener-king), Malachi (the architect-king, grave and courteous)
- **The three queens:** the Seelie Queen, the Unseelie Queen, the Queen of Roots (softened per the celebrity law — Robin Wright ENERGY, never the face)
- **The traders:** the goblin trader (already in founding cast — UPGRADE to full cycle, not re-cast), the hob helper
- **The Between's staff:** the Head Finder (title-is-name), the Lost and Found's goblin crew (class-master route — the founding goblin trader's recolor family per the REC law)
- **The Threshold's greeters:** the door-keepers (option-view figures, now cast as meetable NPCs)
- **The Griffin** (the Crystal Gardens boss — kept distant per the boss's mystery; the cycle holds distance: 3 poses, never near)

Estimate: ~10 CYCLE-class masters. The chibi roster (Trolls, Ents, Dwarves, Orcs, Mermaid) rides the original catalog — already-painted classes count as DONE and are never re-painted.

### PARCEL 2: THE UI KIT (the MMO's interface, UI-class masters)
The Antikythera HUD, gold/brass on dark stone (the build sheet's UI law):
- The world map screen (the six realms + the portals, the hub-and-spoke visible)
- The reputation bar (Seelie/Unseelie duality — one bar, two directions, the courts' split made UI)
- The quest log (the contextual-dialogue law made visible)
- The inventory grid (the stone pouch)
- The portal ring (fast-travel UI — the founding cast's ring, now an interface)
- The stone-reveal frame (labradorite's flash — see Parcel 4)

Estimate: ~6 UI-class masters.

### PARCEL 3: THE QUEST-SCENE PANELS (the flagship moments)
Krista's standing ruling: quest-scene panels "only if called." This plan PROPOSES the cut — not every quest, only the blueprint's flagship moments:
1. The Threshold arrival (first impression — the door that respects you)
2. The Standing Stones portal opening (the surface-to-Kingdom crossing)
3. The first court welcome (Seelie — the riddle as invitation)
4. The Hollow's price scene (Unseelie — cold grandeur, dignified)
5. The Griffin's Gardens encounter (the neutral ground, the distant boss)
6. The Broken Bridge (the Kingdom's grief, the brothers' split)
7. The Stone Circle Chamber's deepest tone (the nearly-silent reveal)
8. The Queens' audience (the full-climb reward — the Vertical Gaze's scene)

Estimate: ~8 ZONE-class panels (single-state unless a scene requires tri-mode; scenes are moments, not rooms).

### PARCEL 4: THE LABRADORITE REVEAL (animation frames, CYCLE-class)
The stone-reveal animation: labradorite at full flash — the frequency between frequencies. Frame masters: dormant -> gathering -> FULL FLASH (the blue-gold fire) -> settling. The flash obeys the Steady Light law: a bloom, never a strobe (sine-in, sine-out).

Estimate: 1 cast sheet (4-6 frames).

### PARCEL 5: THE SPRITE CRUNCH (engine-side, the builder's pipeline)
The 64px extraction from the CYCLE masters via the builder's flip-book pipeline. Not painted here — the masters feed it. The Kingdom's crunch scope: the ~10 resident cycles + the chibi roster's already-painted classes.

### PARCEL 6: THE BUILDER SYNC (the web beta wiring)
The Kingdom's screens to the web beta: hub, six realms, the queens' spaces, the UI kit. The existing web beta Fae screens update with the interior kits' art. Builder message drafted at production time.

---

## THE GOVERNING LAWS (what holds through production)

1. **The Sync Law:** audio leads. The music profile is the master clock — the court-border crossfade (the Inn's ONLY sanctioned crossfade) is coded to the Between's threshold exactly; everywhere else, hard cuts.
2. **The REC Law:** masters first, recolors after. The goblin trader's founding cast UPGRADES, never re-casts.
3. **The Species Law:** one census, two jobs — ambient life and hatchable pets are the same species.
4. **The Steady Light Law:** the labradorite flash is a bloom, never a strobe; the Hollow's dark beauty stays low-contrast.
5. **The courts' teachers:** Alan Lee (Seelie gold), Grimshaw/Bauer (Unseelie dignity) — held from the showcase masters.
6. **The celebrity law:** the queens softened — energy through posture, never the face.
7. **The 6-writer constitution:** every quest text, every NPC line, the quest log's own copy — all prose passes the gate.
8. **Anti-Skinner:** reputation warms, never decays; no streak shame; the courts never mock.

---

## THE SHIPPING GATES (DNA compliance, per the cross-product law)

- [ ] Visual DNA: tri-mode verified on every new master; Linework-as-UI modes checked (the courts hold soft-flowing lore lines; the guardians' sharp lines reserved for the Griffin and the Hollow's tests)
- [ ] Narrative DNA: the six-writer gate on all new text
- [ ] Game Mechanics DNA: the egg pools wired; the stone economy consistent; Anti-Skinner verified
- [ ] Player Journey: the Collector/Scholar/Community/Architect paths all serviced by the Kingdom's quests
- [ ] Master Asset Ledger: every parcel closes with a ledger entry + census update (the Session Canon)
- [ ] The legal gate: no formal listing until paperwork is done (standing decision) — this plan ships art and wiring, not store pages

---

## ESTIMATE

~25 master-class assets across Parcels 1-4, in 4-5 painting sessions. Parcel 5 (crunch) and Parcel 6 (builder sync) are builder-side work streams fed by the masters. Audio production runs on its own front per the profile (already specced; estimated hours logged in the music profile).

---

## THE RULINGS (all five RULED, Krista, 2026-09-11 night)
1. **The parcel order**  RULED CONFIRMED: residents -> UI -> scenes -> reveal.
2. **The quest-scene cut**  RULED CONFIRMED: the 8 flagship moments stand.
3. **The Griffin's distance**  RULED CONFIRMED: 3 distant poses, never near.
4. **The UI's reputation bar**  RULED CONFIRMED: one bar, two directions.
5. **First session**  RULED CONFIRMED: Parcel 1 opened same night.

## WHAT THIS PLAN ORIGINALLY ASKED KRISTA TO RULE ON

1. **The parcel order** — residents -> UI -> scenes -> reveal. Confirm or reorder.
2. **The quest-scene cut** — the 8 flagship moments proposed (the "only if called" ruling, called by plan). Confirm the list or trim it.
3. **The Griffin's distance** — the boss cycle holds 3 distant poses, never near. Confirm.
4. **The UI's reputation bar** — one bar, two directions (the courts' split as interface). Confirm.
5. **First session** — Parcel 1, the resident cycles. Ready when ruled.
