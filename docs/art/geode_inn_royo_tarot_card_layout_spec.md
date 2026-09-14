# THE PRINTED PORTFOLIO — THE ROYO TAROT CARD LAYOUT
**Ruled:** Krista, 2026-09-14. The printed portfolio's character cards follow Krista's Royo tarot deck layout — the visual soul's own deck, the Royo side of the Inn.

## THE ANATOMY (every card, same law)
1. **THE FULL-BLEED PORTRAIT.** The image runs edge to edge — no border, no matte, no frame. The painting IS the card (Royo's register). The portrait master fills the face; the bleed area carries the crop tolerance.
2. **THE NAME BAND.** A horizontal band across the lower portion of the card, in the deck's register: a dark band, the character's name in elegant type, canonical spelling (the copy editor's law — verify against the stored image). The band sits over the portrait's lower edge without covering the eyes or the hands (the two things Royo never wastes).
3. **THE SUIT MARKER — THE ZONE AS ARCANA.** A small marker at the band. The zone IS the character's "arcana" — the suit they belong to. Marker glyph = the zone's emblem (from the Master Asset Ledger's EMBLEM class). The whole cast becomes the Inn's own major and minor arcana.
4. **THE BACK.** The Resonance deck precedent rides along as the standing option: the Ziggy/Brim split-register (one motif per half, the formula split across both backs). GATE: the portfolio back design ruling (single Inn motif vs split register).

## CARD-READY ROWS (the Adobe Data Merge structure)
One row per printed card. Headers:
`card_id, character_name, zone_arcana, card_title, version_type, portrait_master_path, in_game_render_path, living_state_path, shadow_state_path, in_between_state_path, cycle_sheet_path, version_notes`

- `version_type` ∈ {portrait master, in-game render, state variant, cycle sheet} — each version of the cast gets its own card (the ruling: "each version of the cast on a single card").
- Paths relative to the portfolio's image folder, forward slashes, no spaces (Adobe's demand).
- `character_name` is the canonical roster spelling — this column is the copy editor's column; the verification pass runs here before any print.

## POPULATION
Rows populate from the Master Asset Ledger once the audit lands (the ledger reconciliation in progress). The template does not wait for the data — the format is fixed, the cast fills in behind it. First proof already run (2026-09-14): a test card with an artist image Krista likes — the machine passed cyan, magenta, yellow, and the layout held.

## THE PRINTER'S OWN LAW
The portfolio prints on a machine that shows its work — each color pass visible (the darkroom cycle mechanized, the family printmaker trade run one plate per ink). Show-your-work is the portfolio's production ethos as well as its content.
