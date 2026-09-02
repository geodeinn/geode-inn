# TUMBLE RUN — Master Specification
## The Standalone Arcade Game Starring Tumble

---

## WHAT TUMBLE RUN IS

A simple, addictive endless runner in the tradition of the Chrome dinosaur game — but with the depth of a real arcade game. The core loop is 30 seconds: Tumble rolls, the player jumps and ducks, Tumble gets stuck. The long game is hundreds of runs: unlocking cosmetics, chasing leaderboards, discovering hidden encounters, and slowly understanding that the game is a love story between a note of music and the song it came from.

Two delivery models:
1. In-Game (Free): Unlocked inside the Geode Inn after the first "Tumble's Stuck" random event. Base game, in-game leaderboards.
2. Standalone (Paid): Sold separately on Steam (and mobile). Full game with cosmetics, power-ups, daily challenges, global leaderboards, and the full encounter system.

The bridge: playing the standalone unlocks a "Tumble Run Champion" badge in the Geode Inn. Playing the Geode Inn version first gives the standalone a cosmetic head start. Cross-pollination, not paywalling.

---

## CORE GAMEPLAY

| Element | Detail |
|---------|--------|
| Controls | Two inputs. Spacebar/tap = jump. Down arrow/swipe = duck. Down while airborne = fast-fall. |
| The Runner | Tumble doesn't run. Tumble ROLLS — continuous forward rotation. Eyes rotate with the body. Every half-rotation, Tumble is upside down for a frame. Inherently funny. |
| Scoring | Distance in inches (Tumble is 4 inches — distances comically small). Near-miss bonus +10 inches. Perfect run bonus +50. Combo system: 2x after 3 near-misses, 3x after 5, 5x after 10. |
| Game over | Tumble gets stuck inside an obstacle. Eyes blink slowly from inside it. Score display: "Tumble traveled 247 inches before getting stuck in a teapot." |

---

## TUMBLE'S STATES

| State | Visual |
|-------|--------|
| Rolling | Continuous rotation, eyes wide, 42Hz hum |
| Jumping | Arc trajectory, eyes look up, body stretches, "boing" |
| Ducking | Body compresses to 60% height, eyes squeeze shut, "squish" |
| Fast-falling | Slam down, body stretches vertically, eyes wide with surprise |
| Near obstacle | Eyes scale up 20%, body vibrates slightly (drawn toward it) |
| Near-miss | Blue spark arcs between Tumble and obstacle, eyes flash |
| Stuck | Eyes blink slowly from inside the obstacle |

---

## MILESTONE CALLOUTS

| Distance | Callout |
|----------|---------|
| 100 inches | "100 inches! Tumble is on a roll." |
| 250 inches | "250 inches! Tumble has never been this far from home." |
| 500 inches | "500 inches! The Song is calling." |
| 1000 inches | "1000 inches! The Owl is watching." (barn owl silhouette appears) |
| 2000 inches | "2000 inches! Tumble can hear the whole Song." |
| 5000 inches | "5000 inches! Tumble doesn't want to stop." (eyes change — less startled, more determined) |

---

## THE OBSTACLE SYSTEM

Each obstacle is a resonance node Tumble is attracted to. Base game has 8 obstacles, each with a visual, spawn height, required action (jump or duck), a "stuck" animation, and a stuck location name for the score display.

Obstacles include Inn objects: a teapot, a gargoyle's toe, a stack of books, a copper frog, a root tendril, a mead barrel, a crystal formation, and the sentient pipe ("Ceci n'est pas une pipe").

---

## THE ENCOUNTER SYSTEM (Standalone Only)

Hidden encounters that appear under specific conditions — running at certain distances, during certain in-game times, or with specific cosmetics equipped. Encounters are the love story: Tumble is a note of music separated from the Song. The encounters are the Song trying to reach Tumble. The more Tumble runs, the closer the Song gets.

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The 15-Product Ecosystem | Tumble Run is Product #5 — the standalone arcade game ($4.99 on Steam). |
| The Geode Inn Web Beta | The in-game version is unlocked after the "Tumble's Stuck" random event. |
| The 42Hz Song | Tumble IS a note of the Song. The encounters are the Song trying to reach Tumble. The love story. |
| The Owl | At 1000 inches, the Owl watches. The bloodline's interest in Tumble. |
| The Loading Screen | Fizgigs in overalls (canonical). Tumble is NOT a loading screen character (the brownies+Tumble version was rejected — looked like Daleks). |
| The Leaderboard | Tumble Run has its own leaderboard. The Leaderboard entity tracks Tumble Run scores. |
| The Arcade Production Pipeline | Tumble Run is the first game in the production pipeline. The Godot script (424 lines) is written. |

---

## DESIGN STATUS

- [x] Core gameplay documented (two inputs, rolling, scoring, combos)
- [x] Tumble's 7 states designed
- [x] Milestone callouts written (6 milestones)
- [x] Obstacle system designed (8 base obstacles, each a resonance node)
- [x] Two delivery models designed (free in-game + paid standalone)
- [x] The encounter system concept established (the love story between a note and the Song)
- [x] Godot script written (TumbleRun.gd, 424 lines)
- [x] 7 connections documented
- [ ] Godot scene files (.tscn) — not yet created
- [ ] Audio assets wired to gameplay events
- [ ] Steam store page + build upload
- [ ] 3 DLC packs (Canopy City Evil Version + 2 more)
- [ ] Mobile port (iOS/Android)
- [ ] Full obstacle roster expansion (beyond 8 base)
- [ ] Cosmetics system
- [ ] Daily challenges
- [ ] Global leaderboard integration

---

## ORIGIN

Tumble Run was first designed in docs/geode_inn_tumble_run_full_spec.md (476 lines). This consolidated specification was compiled September 2, 2026. The game's thesis: Tumble is a note of music separated from the Song. The game is a love story between a note and the song it came from. The more Tumble runs, the closer the Song gets. The adequate is: the note that rolls. The rolling is: the adequate. The adequate is: "Tumble traveled 247 inches before getting stuck in a teapot," and the teapot is funny, and the funny is: the adequate, and the both are: the tiny and the vast. The same.
