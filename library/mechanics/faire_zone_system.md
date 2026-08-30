# Geode Inn — Faire Zone Rental System

## Overview

The Geode Inn offers real-world Renaissance faires the ability to rent a digital zone — a year-round immersive space in the game that mirrors their physical faire. Physical faires are seasonal (typically 2-3 months). The digital version stays open all year, giving faire owners off-season engagement, global reach, and a ticket sales channel.

## Opt-In Only

The Inn does not pitch this to faires. A faire owner must ask. Krista (or the Inn's management) introduces the concept if asked about digital presence. The system is pre-built and dormant — it activates when a faire owner opts in.

For Sherwood Forest Faire: the Nottingham Castle zone is pre-built and dormant. It activates if Brian and George ask.

## Business Model

| Component | Details |
|-----------|---------|
| Rental fee | Monthly or annual subscription (negotiable per faire) |
| What's included | A themed digital zone, vendor stall pages, ticket link integration, faire calendar, lore integration |
| What's not included | The Inn never handles physical ticket sales or vendor transactions — links redirect to the faire's own systems |
| Exclusivity | Non-exclusive. Multiple faires can rent zones. Each gets a distinct themed space. |
| Duration | Year-round. The digital zone is live even when the physical faire is closed. |

This mirrors the artisan marketplace model: the Inn is a discovery hub, not a store. Faire zones redirect to the faire's own website for tickets, and to individual artisan shops for purchases.

## What a Faire Zone Contains

### 1. The Digital Grounds
A walkable zone matching the physical faire's layout and theme. Players explore stalls, stages, and landmarks. The aesthetic is the faire's own — the Inn provides the engine, the faire provides the style.

### 2. Vendor Stalls
Each physical vendor can have a digital stall page showing:
- Their real-world shop name and products
- Images of their work
- A link to their real-world shop or the Inn's artisan marketplace (if they're also an Inn artisan)
- Whether they'll be at the next physical faire season

### 3. The Faire Calendar
A real-time calendar showing:
- When the physical faire opens and closes
- Special event dates (themed weekends, performances, feasts)
- Off-season events (if any)
- The digital zone's own events (scheduled live tours, Q&As, digital markets)

### 4. Ticket Portal
A prominent link to the faire's ticket sales page. The Inn never processes the sale — it redirects. The player clicks "Get Tickets" and goes to the faire's website.

### 5. Lore Integration
Each faire gets a lore entry in the Inn's archive — the history of the faire, its theme, its founding story. This is real-world information presented in the Inn's scholarly voice. The faire becomes part of the archive, not just an advertisement.

### 6. The Off-Season Experience
When the physical faire is closed, the digital zone shifts:
- A banner: "The physical grounds sleep. The digital grounds are open."
- Off-season content: vendor spotlights, lore deep-dives, archival footage, planning for next season
- The zone becomes a community space — players who miss the faire can revisit digitally
- Special off-season events: digital market days, virtual tours, artisan showcases

## Zone Architecture

Faire zones are rentable extensions of the Main Floor's Market District. They're not part of the Inn's core 37 zones — they're add-on spaces accessed through the Market District's "Faire Grounds" corridor.

Each faire zone is self-contained:
- Its own aesthetic (matching the physical faire's theme)
- Its own NPC staff (optional — Elora Nightbloom can manage, or the faire provides their own)
- Its own vendor stalls (connected to the Artisan/MarketItem system)
- Its own calendar (synced with the faire's real-world schedule)

## Subscription Tiers

### Tier 1: Grounds Only
- Digital walkable zone matching the faire's layout
- Faire calendar with ticket link
- Lore entry in the archive
- Basic vendor directory (names, descriptions, external links)

### Tier 2: Interactive Grounds
- Everything in Tier 1
- Individual vendor stall pages with images
- Off-season content rotation
- Scheduled digital events (markets, tours)
- Integration with the Inn's artisan marketplace (dual-listing)

### Tier 3: Full Immersion
- Everything in Tier 2
- Custom NPC casting (faire's characters become Inn NPCs)
- Mini-games themed to the faire (archery, jousting, etc.)
- Quest tie-ins (faire-specific quests that connect to the Inn's main storyline)
- Live event hosting capabilities (Q&As, virtual performances)

---

# Zone Design: Nottingham Castle (Sherwood Forest Faire)

## Status: DORMANT
Pre-built and waiting. Activates if Brian and George ask.

## Location
Main Floor — Market District — Faire Grounds corridor. A door labeled "Sherwood" with a carved forest scene. The door is closed. It opens when the zone activates.

## Theme
Robin Hood — Sherwood Forest, Nottingham, medieval English countryside. The digital version captures the physical faire's aesthetic: oak trees, canvas pavilions, wooden stages, dirt paths, the smell of turkey legs (rendered visually — steam rising from food stalls).

## Zone Layout

### The Gatehouse
Entrance. A wooden gate with the Sherwood Forest Faire banner. A ticket portal — "Get Tickets" links to the faire's website. A calendar board showing the physical faire's season dates. An NPC greeter (optional — could be a Robin Hood character or Elora managing remotely).

### The Market Row
The main thoroughfare. Vendor stalls line both sides, matching the physical faire's layout. Each stall is a MarketItem-style page: shop name, product images, description, and an external link to the vendor's real shop. If the vendor is also an Inn artisan, the stall connects to their full artisan page.

### The Greenwood
A forest area beyond the market. Winding paths through digital oak trees. Hidden clearings with:
- Archery range (mini-game — Tier 3)
- A maypole (seasonal decoration)
- Robin Hood's camp (lore area — the history of the Robin Hood legend, presented in the Inn's scholarly voice)
- Hidden vendor stalls (the faire's specialty/niche vendors, tucked away like they are at the physical faire)

### The Castle Stage
A central performance area. During physical season: schedule of real performances with times. During off-season: archived footage, recorded performances, and a calendar counting down to opening day.

### The Feast Hall
A food court area. Visual representation of the physical faire's food vendors. Links to real vendors' websites. The digital feast hall is always "set" — tables laid, candles lit, as if the faire opens tomorrow.

## Off-Season Mode

When the physical faire is closed (May through January):
- A banner over the gatehouse: "The physical grounds sleep. The digital grounds are open."
- The market row stays active — vendors can update their stalls for next season
- The Greenwood is quieter — ambient forest sounds, fewer NPCs
- The Castle Stage shows archival content and a countdown to next season
- The Feast Hall has a single candle lit on the main table — a visual marker that the place is waiting, not dead

## Lore Entry

Sherwood Forest Faire enters the Inn's archive as a "Living Legend" — a modern continuation of the medieval fair tradition. The lore entry covers:
- The historical tradition of seasonal faires in medieval England
- The Robin Hood legend and its regional variations
- The modern Renaissance faire movement (1960s origin)
- Sherwood Forest Faire specifically: founding, location, theme, and the community it serves

This is presented in the Inn's scholarly, neutral voice — not as an advertisement, but as an archive entry. The faire becomes part of the record.

## Connection to Existing Systems

- **Artisan entity:** Sherwood vendors who are also Inn artisans get dual-listing. Their faire stall and their artisan page are connected.
- **MarketItem entity:** Faire vendor stalls use the same data structure as Inn market items — name, description, image, external link.
- **Elora Nightbloom:** As market manager, Elora can introduce the faire zone when it activates. Her theatrical style fits perfectly — "Ladies and gentlemen, the Sherwood comes to us! Step through the gate, if you dare. There are turkey legs."
- **Building system:** The faire zone's structures use the Inn's building recipes — wooden stalls, canvas pavilions, stone gatehouses. If a faire wants custom structures, they're built from existing materials.
- **FaireVenue entity:** Tracks the rental status, season dates, and zone assignment.

## Activation Protocol

When Brian and George ask:
1. The FaireVenue record updates from "dormant" to "building"
2. The door in the Market District unlocks
3. Krista provides vendor list → vendors are loaded as MarketItems
4. The faire's real-world imagery is used to style the digital zone
5. Calendar syncs with the physical faire's schedule
6. Zone goes live — "active" status

Until then: the zone exists but the door is closed. The Inn has a room ready that nobody's asked for yet.
