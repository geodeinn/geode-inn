# Geode Inn — Leaderboard & Competition System

## Overview

The Geode Inn features an asynchronous leaderboard system for all arcade games. No real-time PvP required — players compete against scores, not against each other's screens. A "pair competition" mode adds cooperative/competitive flavor without forcing direct confrontation.

## Philosophy

The leaderboard follows the Inn's core design principles:
- **Non-assertive competition** — scores are visible but never pushed in your face. No "YOU LOSE" screens. No forced notifications. The board is there if you want to look; it doesn't come looking for you.
- **Neuro-accessible** — no countdown timers, no pressure mechanics. Your score is your score. The board updates gently.
- **Weekly cycles** — leaderboards reset weekly, keeping the field fresh without erasing all-time records. This gives new players a chance while honoring veterans.
- **Pair mode is opt-in only** — you pair with someone, you both play, your combined score competes against other pairs. It's a tag team, not a cage match.

## Entity: Leaderboard

Fields:
- `gameId` — which game (standing_stones, tomb_tunnel, andean_run, monster_of_the_deep, bastets_herding, plus coop variants)
- `gameMode` — "solo" or "pair"
- `playerId` — links to PlayerProgress
- `playerName` — display name
- `score` — the score
- `level` — highest level reached
- `durationSeconds` — how long the run lasted
- `comboMultiplier` — highest combo achieved
- `stonesCollected` — stones earned this run
- `faeReputation` — Fae reputation at time of score
- `stonesEarned` — array of stone names earned
- `pairId` — if pair mode, the shared pair identifier
- `pairScore` — combined score for pair mode
- `pairTheme` — the themed name for the pair (see below)
- `weekNumber` / `weekYear` — which weekly cycle this score belongs to
- `isVerified` — server-side verification flag (anti-cheat)

## Scoreboard Locations in the Inn

The leaderboard is physically present in the game world — not a menu overlay.

### Main Floor — The Score Stone
A large polished obsidian monolith near the arcade area, covered in glowing amber text. Players walk up to it and see:
- **Current Week's Top 10** — for whichever game they last played
- **All-Time Top 10** — eternal records
- **Pair Leaderboard** — current week's pair rankings
- **Your Best** — your personal records across all games

The stone is warm to the touch. The text rearranges gently when you switch views. No jarring transitions.

### The Fae Kingdom — The Wager Stone
In The Threshold (entry zone of the Fae Kingdom), a smaller stone shows:
- **Fae Wager Board** — pair scores specifically for Fae Kingdom quests
- Pairs can wager reputation points on their combined performance
- The Fae (Seelie and Unseelie) comment on pair performances — Seelie congratulates, Unseelie mocks

## Pair Competition System

### How It Works

1. **Opt-in pairing** — a player invites another player (by name or randomly matched by the system)
2. **Pair Theme** — the system generates a themed name for the pair based on their combined play styles (e.g., "The Crystal Cartographers," "The Dust Raiders," "The Starlight Syndicate")
3. **Asynchronous play** — both players play their own runs independently. The system combines their scores.
4. **Combined score** — each player's run contributes to the pair's weekly total. You can play multiple runs; your best counts.
5. **Pair bonuses** — certain combinations unlock bonuses:
   - Both players collect the same stone type: "Resonance Bonus" (+10%)
   - Both players reach the same level: "Parallel Mastery" (+15%)
   - Players collect complementary stones (e.g., fire + water): "Alchemy Bonus" (+20%)
6. **Weekly pair standings** — reset each week. The top pair gets a unique stone unavailable through any other mechanic: the **Twin Crystal**

### Pair Competition Modes per Game

- **Standing Stones (Tetris)** — "Twin Towers": both players' Tetris scores combined. Resonance bonus if both achieve the same line-clear pattern.
- **Tomb Tunnel** — "Dig Partners": one player digs, one player defends. Asynchronous — Player A's dig run and Player B's defense run are scored together.
- **Andean Run** — "Relay Run": Player A's distance + Player B's distance = combined run. If both choose the same path, bonus.
- **Monster of the Deep** — "Chum Sweep": both players' creature encounters combined. If both encounter the same water monster, "Synergy Catch" bonus.
- **Bastet's Herding** — "Cat Corral": both players' cat counts combined. If both herd the same cat personality type, "Kindred Spirits" bonus.

### The Twin Crystal

The weekly-winning pair receives the **Twin Crystal** — a single stone that exists in two collections simultaneously. Both players get it. It's a unique visual stone (split-colored, two minerals fused). It cannot be traded, sold, or lost. It updates each week to reflect the current pair's colors.

If the same pair wins three weeks in a row, the Twin Crystal evolves into the **Eternal Twin** — a permanent version with bonus properties and a special glow.

## Implementation — Godot + Base44 API

### Score Submission (Godot side)
```
func submit_score(game_id, score, level, duration, combo, stones):
    var payload = {
        "gameId": game_id,
        "gameMode": "solo",
        "playerId": GameManager.player_id,
        "playerName": GameManager.player_name,
        "score": score,
        "level": level,
        "durationSeconds": duration,
        "comboMultiplier": combo,
        "stonesCollected": stones.size(),
        "stonesEarned": stones,
        "weekNumber": Time.get_week_number(),
        "weekYear": Time.get_year(),
        "isVerified": true  # server validates on receipt
    }
    APIManager.post_entity("Leaderboard", payload)
```

### Leaderboard Fetch (Godot side)
```
func fetch_leaderboard(game_id, mode = "solo", scope = "weekly"):
    var params = {
        "filter": {
            "gameId": game_id,
            "gameMode": mode
        },
        "sort": "-score",
        "limit": 10
    }
    if scope == "weekly":
        params["filter"]["weekNumber"] = Time.get_week_number()
        params["filter"]["weekYear"] = Time.get_year()
    return APIManager.get_entities("Leaderboard", params)
```

### Pair Score Combination
The Base44 backend handles pair score aggregation. When both players in a pair have submitted scores for the week, the backend:
1. Identifies matching pairId entries
2. Takes each player's best score
3. Applies pair bonuses based on stone/level overlap
4. Calculates combined pairScore
5. Updates the pair leaderboard

### Anti-Cheat
- `isVerified` is set to false on submission
- Server-side validation checks: score plausibility, duration vs. score ratio, combo vs. level consistency
- Verified scores appear on the public board; unverified scores are held for review
- Repeated impossible scores result in a quiet flag — no public shaming, just silent non-appearance on the board

## Krista's Tetris Dominance

The system is specifically designed to let Krista hold a Tetris crown. Her scores on Standing Stones are permanent all-time records unless someone genuinely beats them. The All-Time Top 10 serves this purpose — it doesn't reset. If someone does beat her, it's real, it's verified, and it's earned.

The weekly board keeps the competitive field fresh. The all-time board honors the legends.

## UI — The Score Stone

The Score Stone is an in-world object, not a menu. Visual design:
- Polished obsidian monolith, ~7 feet tall, on the main floor near the arcade
- Amber text glows on the surface, rearranging gently when switching views
- Top section: current game's Weekly Top 10
- Middle section: All-Time Top 10
- Bottom section: Your personal best across all games
- A small crystal at the base — touch it to switch games
- Pair leaderboard is a separate view — touch a small paired-crystal icon to toggle
- No scrolling, no loading screens. The text flows like the Inn's other magical surfaces.

## Connection to the Narrative Spine

The leaderboard feeds into the reincarnation mechanic — your scores persist across lives. Your all-time records are part of your cosmic record. When you reincarnate, you keep your personal bests but your weekly scores reset. The All-Time board is the closest thing the Inn has to a monument — proof that you were here, that you played, that you mattered.

The pair system feeds the theme of unbreakable bonds — some pairs are chosen, some are not. The Twin Crystal exists in two collections at once. It is the game mechanic version of the narrative spine's soul-bond.
