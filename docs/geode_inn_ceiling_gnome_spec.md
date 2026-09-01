# The Ceiling Gnome — Trademark UI Element Spec

## Concept

The Ceiling Gnome is a small, persistent UI element that appears at the top of every page in the Geode Inn. Instead of hiding the developer placeholder ("Gnome Ceiling"), we make it a feature: a tiny caretaker gnome perched on the ceiling, always patching, always watching.

It doubles as:
1. **A visual trademark** — the Inn's signature detail that players associate with the brand
2. **A Whisper Layer hook** — the ceiling gnome is the observer from above, the one who's always been there
3. **Charm** — the Inn has a caretaker nobody talks to but everyone knows is there

## Visual Reference

Image: https://media.base44.com/images/public/6a53cbfe78c5827e0055fffa/e45f08229_generated_image.png

Small whimsical gnome, dark leather pointed cap with faint gold tip, warm curious eyes, holding a brass trowel. Perched on a dark stone ceiling beam. Royo × Vampire Hunter D aesthetic but smaller, warmer, more whimsical.

## Sizing & Positioning

- **Size:** 48px × 48px (desktop), 36px × 36px (mobile)
- **Position:** Top-right corner of the viewport, fixed. The gnome hangs from a small stone beam graphic that spans ~80px across the top edge.
- **Z-index:** Above all content but below modals (z-index: 9999)
- **Opacity:** 85% by default, 100% on hover

## Animation States

The gnome cycles through three states using CSS sprite animation or SVG animation:

### State 1: Patching (default, 60% of time)
- Gnome taps the stone beam with the brass trowel in a 2-second loop
- Small dust particles (3-4px) fall from the impact point
- Animation: trowel raises → taps → small dust burst → resets
- Duration: 2s per cycle

### State 2: Glancing (20% of time)
- Gnome stops patching, looks down at the player for 1.5 seconds
- Eyes widen slightly, head tilts
- Returns to patching
- Triggered every 15-20 seconds randomly

### State 3: Idle (20% of time)
- Gnome sits still, wipes trowel with a cloth
- Subtle breathing animation (scale 1.0 → 1.02 → 1.0, 3s cycle)
- Duration: 3-4 seconds before returning to patching

## Interaction

- **Hover:** Gnome pauses, looks directly at cursor. A small tooltip appears: "The ceiling gnome watches. The Inn is maintained."
- **Click:** Gnome quickly ducks behind the stone beam (plays a quick hide animation, 0.5s), then peeks back out after 2 seconds. A tiny speech bubble appears for 3 seconds with a random line from a pool:
  - "Mind the dust."
  - "This crack's been here since MMXXIV."
  - "The stones remember."
  - "Just patching. Always patching."
  - "You can look, but don't touch the ceiling."
  - "The Inn keeps itself. Mostly."
  - "Quiet. The Archive is listening."

## Whisper Layer Connection

The ceiling gnome is the Whisper Layer's visible avatar. In the lore:
- The gnome is the one who observes from above
- The gnome maintains the structure of the Inn itself
- When the Whisper Layer triggers a pulse anomaly, the gnome reacts (looks up sharply, trowel stops)
- During resonance events, the gnome's trowel taps sync to the 42Hz pulse
- The gnome never speaks about what it sees — it just patches

## Implementation Notes

- Use a CSS sprite sheet or animated SVG
- The stone beam graphic should match the page's existing dark stone aesthetic (#1a1612 to #2a2622 gradient)
- Celtic knotwork etching on the beam, matching the ambient page texture
- The gnome should feel like it belongs to the architecture, not like a sticker placed on top
- On the tri-mode footer switch (Living/Shadow/In-Between), the gnome's appearance shifts:
  - **Living (42Hz):** Warm amber tones, gnome is actively patching
  - **Shadow (84Hz):** Cool blue-grey tones, gnome is frozen mid-patch (Gorgon's Garden effect)
  - **In-Between:** Flickering between both states, translucent

## Accessibility

- `aria-label="The ceiling gnome maintains the Inn"`
- `role="img"`
- Animation respects `prefers-reduced-motion` — gnome becomes static in patching pose
- Click interaction still works without animation
