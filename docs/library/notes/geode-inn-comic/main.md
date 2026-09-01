---
title: Geode Inn Daily Comic
summary: Tracking system for the daily four-panel comic — player adventures archived
  as visual stories in the game library
---

# Geode Inn Daily Comic

## Concept

A daily four-panel comic strip documenting player adventures in the Geode Inn. Feeds into the game's interactive library section — player adventures become archived visual stories. Living narrative record of what happens in the game world.

## System

* **Entity:** `ComicStrip` — stores strip data (date, title, zone, characters, 4 panels, image URL, publish status)

* **Flow:** Player adventure → 4 panel descriptions → generate image → save to entity → publish to library

* **Art style:** Rotates by zone (Klimt for Undercity, Mucha for Campgrounds, Dalí for Clockwork Skies, etc.)

* **Voice:** Tabletop questline narrative — clever, direct, foreshadowing

## Strip Log

(no strips yet — game not yet live with players)

## Backlog of Adventure Seeds

(no player adventures yet — will populate once beta players are active)

## Workflow for Elio

1. Check for notable player adventures (from PlayerProgress entity, Leaderboard, or Krista's notes)
2. Write 4 panel descriptions in tabletop questline voice
3. Generate the comic image (Royo-style dark fantasy, zone-appropriate artist overlay)
4. Save to ComicStrip entity
5. Update this page with the strip number and date
6. Update For You if there's a backlog or something needs Krista's approval
