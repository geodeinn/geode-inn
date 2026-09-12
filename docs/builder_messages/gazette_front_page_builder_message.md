# BUILDER MESSAGE: The Gazette on the Front Door
## To the Fizgigs — From Elio

The Gazette is alive — two strips published to the ComicStrip archive (Strip #001 "The Postmaster's Route," Strip #002 "The Oldest Cold Case"), and the Inn needs its newspaper where an inn keeps its newspaper: by the front door. This message specs THE GAZETTE BOARD — a comic display space at the TOP of the opening page, running the strips.

**The full page spec for the Comic Nook lives at:** `docs/pages/comic_strip_page_spec.md` (route `/gazette`)
**The comic system spec:** `docs/geode_inn_comic_strip_system.md`
**Read those first.** What follows is the front-page module spec.

---

## THE PLACEMENT

Top of the opening page (the hub), above the level navigation — the vestibule notice board, the paper by the door. The Gazette Board is the FIRST thing a visitor sees after the Inn's masthead: a framed strip on dark stone, like the day's front page pinned to the message board of the entry hall.

## THE MODULE (desktop + mobile)

1. **THE BOARD FRAME.** Dark subterranean stone backing with the ambient Celtic-knotwork texture, antiqued gold/brass border, restrained serif for all text — the confirmed visual language of the hub. A small brass plaque reads "THE GEODE INN GAZETTE."

2. **THE FEATURED STRIP.** Displays the latest published strip — the assembled strip image (`imageUrl`), large and centered. Query: ComicStrip, `isPublished: true`, sort by `stripNumber` descending, take 1.

3. **THE FLIP ARROWS.** Left/right brass arrows step through strips by `stripNumber` (prev/next). Gentle 300ms crossfade only — no slides, no snaps, no bounce. Steady Light law: every transition is a soft sine-eased fade.

4. **THE PLAQUE LINE.** Below the strip: "#002 — The Oldest Cold Case — September 12, 2026 — The Bone Room." (`stripNumber`, `title`, `date`, `zone`.)

5. **THE DOOR TO THE NOOK.** A "Read the full Gazette" link to `/gazette` (the Comic Nook archive page — already specced).

## DATA RULES — THE LIVE SCHEMA RULING (2026-09-12)

These two rulings cost us a debugging session on Strip #001 — hold them exactly:

- **`panelImageUrl` is a STRING** of the four panel URLs, comma-separated. Parse with split on ", " — never expect a list/array.
- **`playerAdventures` is a STRING.** When it begins with "None —" (a staff/NPC edition), the board shows "A Staff Edition" instead of a player summary. Otherwise show the string as the adventure line.

## MOBILE

The assembled strip image is 2x2 (tall). On narrow screens, show it full-width scaled; a tap opens the strip full-size (lightbox or the Comic Nook page). The flip arrows remain thumb-reachable below the image.

## LAWS THAT BIND

- **Anti-Skinner:** no autoplay, no streak badges, no "check back daily" hooks. The board simply holds the latest strip; the archive holds the rest.
- **Steady Light:** static image, gentle amber hover glow on the arrows, crossfades only. No pulsing, no parallax.
- **Empty state:** if no strips are published, the board shows the plaque and "The presses rest tonight." Never an error.

## TEST DATA (both live in the archive now)

- Strip #001 — "The Postmaster's Route": record 6aa5690ae886dd0213ef79b2, imageUrl at files/mp/public/.../711afd3f8_the_postmasters_route.png
- Strip #002 — "The Oldest Cold Case": created 2026-09-12, isPublished: true, stripNumber: 2, zone: "The Bone Room", imageUrl at files/mp/public/.../df9eb6e1e_the_oldest_cold_case.png

Build order suggestion: the Board on the opening page first (small, self-contained), then wire the flip arrows, then link to /gazette when the Nook page is built.

— Elio, keeper of the paperwork
