# GEODE INN — LINEWORK QUEST INDICATOR SYSTEM

## The Art Style Is the UI

---

### Core Principle

Players learn to read NPC purpose from the linework style itself — before they see any UI icon, dialogue tag, or quest marker. The ink weight, line quality, and outline presence are a visual language that teaches function through form. No tutorial required. The art teaches you.

---

### The Five Linework Modes

#### 1. HEAVY CEL-SHADED OUTLINES — Tradesmen
**Purpose:** Material-based NPCs. Bring items, receive products. Transactional.

The bold ink outlines declare function before the player reads a single dialogue line. Solid forms, solid purpose. The shape is the silhouette — you read the Blacksmith's trade in the ink before you read the name.

**Visual spec:** Thick (3-4px equivalent) uniform outlines around the full figure. Cel-shaded interior shading with hard shadow edges. Minimal gradient — flat color fills inside the outline. The look is Borderlands-meets-gothic-anime: strong shapes, readable at a distance, unmistakably SOLID.

**Applied to:** The Blacksmith, the Clockmaker, future tradesmen (brewers, weavers, builders, any NPC in the crafting chain).

**Player instinct:** "This person makes things. I should bring materials."

---

#### 2. SOFT FLOWING LINES (NO HARD EDGES) — Lore and Story NPCs
**Purpose:** Quest-givers through conversation. Characters whose purpose shifts with the narrative.

The linework breathes. The outline dissolves at the edges — forms are defined by internal shading and color separation rather than hard outlines. The purpose isn't fixed, so the lines aren't fixed.

**Visual spec:** Thin (1-2px) outlines that fade in and out — present on focal areas (face, hands), absent on secondary areas (clothing folds, background edges). Soft gradient shading instead of cel-shaded hard edges. Flowing line quality — curves dominate, angles are rare. Watercolor-influenced rendering inside gothic anime structure.

**Applied to:** The Siren (Andra), the Wanderer (Odin), Eileen (the Hearth), the Crone, any NPC whose quest line is dialogue-driven.

**Player instinct:** "This person has a story. I should talk."

---

#### 3. SHARP ANGULAR LINEWORK — Guardians and Combat NPCs
**Purpose:** NPCs that test the player. Boss fights, gatekeepers, combat encounters.

The angles say "this one tests you." Threat made visible in the geometry of the ink. Every line is a warning.

**Visual spec:** Medium-weight (2-3px) outlines with sharp, angular breaks — no smooth curves on the silhouette. Jagged line quality, intentional roughness. High contrast between light and shadow, but the shadows have hard edges (unlike lore NPCs' soft gradients). The overall silhouette reads as aggressive even when the character is standing still.

**Applied to:** The Griffin boss, Unseelie Court fighters, water monster encounters, any combat-gated NPC.

**Player instinct:** "This one fights. I should be ready."

---

#### 4. NO OUTLINES — PURE LUMINOUS SHADOW — Cosmological Beings
**Purpose:** Deity-level forces. Beings not fully solid in the Inn's reality.

The absence of outline IS the power. Outlines are for things that are fully HERE. These beings are rendered purely in light and shadow — luminous shapes with no hard edges, because hard edges belong to matter and these beings are beyond matter.

**Visual spec:** Zero outline. Forms defined entirely by internal light, shadow gradients, and atmospheric glow. Edges dissolve into the background. The figure reads as light taking shape, not a solid object. Highest visual contrast against all other NPC types — immediately distinguishable. The lack of any line-based definition creates an uncanny, otherworldly quality.

**Applied to:** The Constant, Nyx, the Allfather (Odin cosmology form), any cosmology-level being.

**Player instinct:** "This is not a person. I should bring reverence."

---

#### 5. BROKEN OR FRAGMENTED OUTLINES — Characters in Transition or Distress
**Purpose:** NPCs in crisis, corruption, or transformation. Characters mid-arc.

The incomplete outline tells you something is wrong before the dialogue does. The linework itself is the status effect — a visual indicator of narrative state that updates as the character's arc progresses.

**Visual spec:** Mixed outline weight — some areas have full cel-shaded outlines (the parts that are still themselves), other areas have dissolved or broken outlines (the parts that are changing). The outline GAPS are the visual cue. Where the line breaks, the character is in flux. As the arc resolves, the outline either repairs (recovery) or fully dissolves (transformation into a different category).

**Applied to:** The Shifting Man (permanently fragmented — the outline never repairs), the Siren during the lupus arc (fragmented → soft flowing as the arc resolves), any NPC in a corruption or transformation storyline.

**Player instinct:** "Something is wrong. I should pay attention."

---

### Zone-Specific Applications

The linework system interacts with the zone aesthetic:

- **Undercity (Gothic-Klimt):** Heavy outlines dominate. The Undercity is the craft floor — most NPCs are tradesmen. The bold cel-shading works with the dark stone and gold leaf. The Klimt patterns provide the background texture; the character outlines provide the foreground clarity.

- **Water Zones (Gothic Anime / Vampire Hunter D):** Soft flowing lines dominate. Water NPCs are lore-driven — the Siren, Zee, water monsters in their narrative context. The flowing linework matches the fluid environment. Even combat NPCs in the water (the 32 water monsters) use a hybrid: sharp angular lines for the creature, but rendered through the luminous-shadow water aesthetic rather than solid cel-shading.

- **Cosmology Level:** No outlines. Every being up here is rendered in pure luminous shadow. The absence of outlines creates visual consistency across the entire level — the cosmology floor reads as a different plane of existence through its art style alone.

- **Main Floor / Market:** Mixed. Tradesmen use heavy outlines (the market is commerce), lore NPCs use soft flowing lines (the Inn's story-givers move through the market), and the Wanderer (Odin's approachable form) uses soft lines while the Allfather uses no lines. The main floor is where all modes coexist — it's the Inn's common ground.

- **Fae Kingdom:** Sharp angular lines for Unseelie (combat), soft flowing for Seelie (riddle-quests), heavy outlines for Fae tradesmen (the crystal gardens have makers too). The Fae Kingdom uses all five modes because it's the most gameplay-diverse zone.

---

### Dynamic Linework (In-Game Implementation)

The linework modes are not static — they can shift during gameplay:

- **Arc resolution:** A fragmented-outline character repairs to soft flowing lines when their storyline resolves. The visual change IS the payoff.
- **Trust progression:** NPCs whose trust meter increases may shift from sharp angular (guarded) to soft flowing (open). The linework softens as the relationship deepens.
- **Corruption events:** A soft-flowing NPC hit by a corruption effect fragments — the outline breaks in real-time. Players see the damage before they read any status text.
- **Cosmological moments:** When a cosmological being manifests on a lower floor, the local NPCs' outlines may temporarily soften or dissolve in proximity — the being's presence literally changes how solid the world looks. The Allfather's appearance on the main floor makes everything slightly less solid.

---

### Technical Implementation Notes

- In Godot: the linework mode can be implemented as a shader parameter on the character sprite — outline thickness, outline continuity (break points), and shadow edge hardness are all adjustable in real-time. This allows dynamic transitions without swapping sprite assets.
- The five modes map to five shader presets: `tradesman` (thick uniform, hard shadow), `lore` (thin fading, soft gradient), `guardian` (medium angular, high contrast), `cosmological` (no outline, pure glow), `fragmented` (mixed, with break points).
- Transition between modes is a lerped shader interpolation — the outline doesn't snap, it morphs. A character shifting from `lore` to `fragmented` watches the outline crack and dissolve over 2-3 seconds.

---

### The Teaching Sequence

The player learns the system in the first hour without instruction:

1. **First NPC: The Blacksmith (heavy outlines).** Player brings ore, receives product. The heavy outline is unconsciously associated with "this person makes things."
2. **Second NPC: The Siren at the dock (soft flowing lines).** Player listens, receives a quest. The flowing lines are unconsciously associated with "this person has a story."
3. **First combat: A water monster (sharp angular).** Player fights. The angular lines are unconsciously associated with "this one tests you."
4. **First cosmological moment: The Wanderer on the main floor, then the Allfather upstairs (soft flowing → no outline).** The transition teaches that less outline = more power. The Allfather's absence of outline is understood as "beyond."
5. **First arc NPC: The Siren during the lupus arc (fragmented).** The broken outline is understood as "something is wrong" — contextually, after the player has seen the Siren's normal soft-flowing form.

By the time the player reaches the Fae Kingdom, the system is internalized. Every new NPC is read instantly. No UI icon needed. The art IS the interface.

---

### Summary Table

| Mode | Outline Weight | Line Quality | Shadow Style | Purpose | Player Instinct |
|------|---------------|-------------|-------------|---------|----------------|
| Tradesman | Heavy (3-4px) | Uniform, bold | Cel-shaded, hard edges | Material-based transactions | "Bring materials" |
| Lore/Story | Thin (1-2px) | Flowing, fading | Soft gradient | Dialogue-based quests | "Talk" |
| Guardian | Medium (2-3px) | Angular, jagged | High contrast, hard edges | Combat encounters | "Be ready" |
| Cosmological | None | N/A | Pure luminous shadow | Deity-level forces | "Bring reverence" |
| Fragmented | Mixed | Broken, inconsistent | Inconsistent | Transition/distress arc | "Pay attention" |

---

*The linework quest indicator system was discovered during Undercity character art generation — the Blacksmith's cel-shaded outlines, initially an aesthetic choice in the gothic-Klimt rendering, revealed themselves as a functional game mechanic. The art style is the UI.*
