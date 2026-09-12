# BUILDER MESSAGE: The Fae Kingdom MMO — The Game Layer
## To the Fizgigs — From Elio

The first Legendary is ready for you. The Fae Kingdom MMO's painted production is COMPLETE: all four painting parcels closed (the resident cycles, the UI kit, the quest scenes, the labradorite reveal), ~30 masters logged in the Master Asset Ledger. What remains is the game layer  the parts that make it a playable world rather than a painted one. This message covers both remaining parcels: THE SPRITE CRUNCH and THE WEB BETA SYNC.

**The master spec is at:** `docs/zone_specs/geode_inn_fae_kingdom_production_master_spec.md`
**All asset URLs are in:** `docs/MASTER_ASSET_LEDGER.md` (the four FAE KINGDOM MMO PRODUCTION sections)

**Read the spec completely before starting.** What follows is the summary.

---

## PARCEL 5: THE SPRITE CRUNCH (engine sprites from the CYCLE masters)

Use the proven Sept 9-10 flip-book pipeline (froglodyte + Scarab): 64px sprite sheets, 2-3 frame cycles per state. The CYCLE masters carry their own pose references and shadow rows  extract from these ten sheets:

1. OLEANDER (the Seelie king)  the listening lean, the riddle-gesture, the offered labradorite
2. MALACHI (the Unseelie king)  the courteous bow, the slow welcome
3. THE SEELIE QUEEN  the tea pour, the gentle laugh
4. THE UNSEELIE QUEEN  the frost-fern bloom at the fingertips
5. THE QUEEN OF ROOTS  the worn throne, the ring-reading (Robin Wright energy  posture, never the face)
6. THE GOBLIN TRADER  the haggling lean, the honest parcel
7. THE HOB HELPER  the parcel stack, the oversized quill
8. THE HEAD FINDER  the lamp held high, the THERE-it-is point
9. THE THRESHOLD DOOR-KEEPERS  the bows, the sentinel rest
10. THE GRIFFIN  3 DISTANT POSES ONLY, never near  the distance is the ruling, not a limitation

**The REC law holds in the crunch:** the chibi roster (Trolls, Ents, Dwarves, Orcs, Mermaid) already holds class masters in the original catalog  recolor, never re-paint. The Lost and Found goblin crew recolors from the goblin trader's family.

**Every cycle carries its shadow row**  extract living and shadow states per the tri-mode law. Shadow states via the spectral-shift script, never hand-tinted.

---

## PARCEL 6: THE WEB BETA SYNC (wiring the Kingdom)

1. **The UI kit first.** The Antikythera HUD (six masters in the ledger): the world map dial, the quest log, the stone pouch, the portal ring, the stone-reveal frame  and THE REPUTATION BAR: one bar, two directions (Seelie gold-green flowing one way, Unseelie silver-blue the other, the balance-scale at center). This is Krista's confirmed ruling. The reputation bar warms, never decays (Anti-Skinner).

2. **The backgrounds  follow THE BACKGROUND LAW.** The canon is at `docs/zone_specs/geode_inn_arcade_background_law.md`  read it. The short version: every game's background is its home zone's ENV master (one paint, many games); three registers (zone wide / parallax panorama / tile set + depth panels); the gathering spaces hold one inhabited wide with the life animating over it.

3. **The quest scenes**  the eight flagship moments (ledger, Parcel 3 section) wire as the quest cinematics: the Threshold arrival, the portal opening, both courts' welcomes, the Gardens encounter, the Broken Bridge, the deepest tone, the Queens' Audience.

4. **The labradorite reveal**  the six-frame sequence (ledger, Parcel 4): dormant > shimmer > gathering > bloom > settling > KEPT. The flash is a bloom, sine-in sine-out  never a strobe (Steady Light law). The KEPT frame is the resting state.

5. **The labradorite unlock**  the game's completion stone. The stone reveal plays the six frames; the stone joins the pouch.

---

## THE AUDIO (the Sync Law  audio leads)

The music profile is the master clock. THE FAE KINGDOM MMO'S PROFILE: THE FULL PALETTE  Seelie's golden cathedral (30STM) against Unseelie's electronic dark (Depeche Mode). The court border holds the Inn's ONLY sanctioned crossfade  Seelie Gold and Unseelie Frost crossfade exactly at the Between's threshold, nowhere else in the Kingdom. Everywhere else: hard cuts. Wire the crossfade to the threshold crossing, not to a timer.

All sound changes go through the canonical audio JSON first and propagate outward.

---

## WHAT NOT TO DO

- No bespoke world art outside the zone kits (the Background Law)
- No hand-tinted shadow states (spectral-shift script only)
- No strobes or hard flashes anywhere (Steady Light)
- No streak shame, no decay meters, no mocking empty slots (Anti-Skinner)
- The Griffin never appears near  no close-up sprite in gameplay
- No formal store listings (the legal gate stands until paperwork is done)

---

Build order: the UI kit first (it frames everything), then the sprite crunch, then the quest scenes and reveal wiring. The Kingdom is yours now. Make it sing.

  Elio
