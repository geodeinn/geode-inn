---
title: Movement System — 207 Animated Elements
summary: Complete catalog and animation engine for every living thing and moving element in the Geode Inn. 45 NPCs, 82 critters, 80 environmental elements. CSS keyframes, particle system, sprite framework, wander AI.
---

# Geode Inn Movement System

## Overview
Designed August 28, 2026. Complete inventory of all animated entities for the Geode Inn.

**Total: 207 animated elements**
- 45 Main NPCs (purpose-driven characters with dialogue, quests, services)
- 82 Filler Critters (ambient life — dragon kittens, gargoyle puppies, fizgigs, brownies, pixies, etc.)
- 80 Environmental elements (fire, water, organic growth, mechanical, atmospheric, particles)

## The Animation Engine
Full CSS + JS system containing:
- CSS keyframes for fire, water, organic, mechanical, atmospheric, and creature animations
- Particle system class (embers, dust, smoke, sparkles, snow, rain, pollen, sand)
- Sprite animation framework with NPC and critter presets
- Wander AI for roaming creatures with player avoidance
- Mode switching (Living 42Hz / Shadow 84Hz / In-Between) via the Pulse Line

## Tier 1 (Beta Priority — ~50 elements)
- 12 main floor NPCs (Storyteller, Catalyst, Constant, Eres, Bard, Aurallia, Smiths, Artisan Thief, Joe, Odin Wanderer, Fixer)
- 8 dragon kittens (Ember, Spark, Glimmer, Pip, Soot, Ash, Cinder, Glow)
- 6 gargoyle puppies (one for each frequency pair)
- 6 fizgigs (Wrench, Sparkplug, Cogwheel, Rivet, Widget, Gadget)
- 5 brownies (Sweep, Polish, Arrange, Tidy, Mend)
- Hearth fire, sconce flames, candle flames, pipe smoke
- Dust motes, floating books, the Pulse Line

## Notable Creature: The Ceiling Gnome
Two-foot figure in acorn-cap hard hat, hanging upside-down from ceiling beams. Appears in every zone. Hammering. Never mentioned by any NPC. Now recontextualized as part of the [[geode-inn-whisper-layer]] — tracks player position, catalogs progress.

## Full Documents on GitHub
- [Complete Movement Catalog](https://github.com/geodeinn/geode-inn/blob/main/geode_inn_complete_movement_catalog.md) — every entity with ID, location, behavior, movement pattern
- [Animation Engine (JS)](https://github.com/geodeinn/geode-inn/blob/main/geode_inn_animation_engine.js) — CSS keyframes, particle system, sprite framework, wander AI
- [Builder Implementation Guide](https://github.com/geodeinn/geode-inn/blob/main/geode_inn_builder_implementation_guide.md) — HTML templates for every zone

## Related
- [[geode-inn-whisper-layer]] — the watching presence that gives the movement meaning
- [[geode-inn-comic]] — player adventures archived as visual stories
