# Geode Inn — Offline Data Bundle Specification

## Overview

The Geode Inn ships as a complete offline game. All scripted content — NPC dialogue, quest text, lore, items, recipes, stones, charms — is exported from the Base44 database as JSON files and packed into the Godot build. The game reads from local files. No server required.

**Online layer** (daily comic strip, live Final Room, leaderboards, marketplace) is additive — the game works without it.

---

## Directory Structure (in Godot project)

```
res://data/
  manifest.json              # Version, content counts, export timestamp
  dialogue/
    all_dialogue.json         # Every Dialogue record, keyed by zone
    whisper_layer.json        # Whisper Layer observations (isWhisperLayer=true)
  stones/
    all_stones.json           # 198 stones with all properties
  materials/
    all_materials.json        # 87 materials
  recipes/
    all_recipes.json          # 148 building recipes
  items/
    all_game_items.json       # 56 interactive furniture items
  charms/
    element_charms.json       # 118 element charms
    quest_charms.json         # 45 quest charms
  market/
    all_market_items.json     # Marketplace listings (cached snapshot)
  lore/
    all_lore.json             # Mythology entries by country/region
  books/
    all_books.json            # Archive text metadata
  cosmetics/
    board_skins.json          # Board skin options
    tray_templates.json       # Tray template options
  eggs/
    egg_data.json             # Egg puzzle configuration
  quests/
    quest_index.json          # Quest registry with prerequisites and rewards
```

---

## Manifest Format

```json
{
  "version": "1.0.0",
  "exportDate": "2026-08-30",
  "contentCounts": {
    "dialogue": 0,
    "stones": 198,
    "materials": 87,
    "recipes": 148,
    "gameItems": 56,
    "elementCharms": 118,
    "questCharms": 45,
    "marketItems": 4,
    "lore": 207,
    "books": 0,
    "boardSkins": 0,
    "trayTemplates": 0,
    "eggs": 0
  },
  "minGameVersion": "1.0.0"
}
```

The game checks the manifest version on startup. If a data patch is applied (Steam update), the manifest version increments and the game reloads the bundle.

---

## Entity Export Formats

### Dialogue (all_dialogue.json)

```json
{
  "zones": {
    "Catacombs": [
      {
        "dialogueId": "crone_first_visit_001",
        "npcName": "The Crone",
        "zone": "Catacombs",
        "conditionTag": "!met_crone",
        "priority": 100,
        "lines": [
          "You brought light. Good. The dark preserves, but it doesn't teach.",
          "The archive is not given. It is excavated. Bring your own lamp.",
          "What you find here, you earned. What you don't find, you weren't ready for."
        ],
        "responses": [
          "I'm ready to learn|met_crone|crone_first_visit_002",
          "What's down here?|met_crone|crone_first_visit_003"
        ],
        "setFlags": ["met_crone", "catacombs_unlocked"],
        "questLink": "perception_trilogy_act1",
        "isWhisperLayer": false,
        "voiceProfile": "ancient_female_low"
      }
    ],
    "Hearth": [
      {
        "dialogueId": "firekeeper_greeting_001",
        "npcName": "The Firekeeper",
        "zone": "Hearth",
        "conditionTag": "default",
        "priority": 10,
        "lines": [
          "The fire's been waiting for you. It always does.",
          "Sit. The warmth doesn't ask questions."
        ],
        "responses": [],
        "setFlags": [],
        "questLink": "",
        "isWhisperLayer": false,
        "voiceProfile": "warm_male_raspy"
      }
    ]
  }
}
```

**Condition Tag Syntax:**
- `default` — always matches (lowest priority, fallback)
- `flag_name` — matches if flag is true
- `!flag_name` — matches if flag is false
- `flag_a and flag_b` — matches if both are true
- `flag_a or flag_b` — matches if either is true
- Multiple dialogues for the same NPC can exist with different conditionTags — the game picks the highest priority match

**Response Format:** `displayText|setFlag|nextDialogueId`
- `displayText` — what the player sees as a clickable option
- `setFlag` — game state flag to set when chosen (empty = none)
- `nextDialogueId` — dialogue record to load next (empty = end conversation)

### Whisper Layer (whisper_layer.json)

```json
{
  "observations": [
    {
      "dialogueId": "whisper_001",
      "npcName": "The Inn",
      "zone": "Catacombs",
      "conditionTag": "catacombs_visits>3",
      "priority": 50,
      "lines": [
        "The dust moved when you weren't looking."
      ],
      "responses": [],
      "setFlags": ["whisper_noticed_001"],
      "questLink": "",
      "isWhisperLayer": true,
      "voiceProfile": "none"
    }
  ]
}
```

Whisper Layer observations render differently — no speaker name, no portrait, text fades in and out. The Inn itself speaking. Triggered by game state patterns, not by talking to an NPC.

### Stones (all_stones.json)

```json
{
  "stones": [
    {
      "id": "...",
      "name": "Labradorite",
      "mind": "Metaphysical properties...",
      "body": "Healing properties...",
      "category": "Feldspar",
      "stoneFamily": "Plagioclase",
      "geoRegion": "Canada, Madagascar",
      "mapPinLat": 53.7,
      "mapPinLng": -65.3,
      "colorNotes": "...",
      "opacity": "translucent",
      "beadFinish": "faceted",
      "opticalPhenomenon": "labradorescence",
      "canCabochon": true,
      "canFacet": true
    }
  ]
}
```

### Building Recipes (all_recipes.json)

```json
{
  "recipes": [
    {
      "id": "...",
      "resultName": "Stone Archive Shelf",
      "resultType": "Furniture",
      "buildingTier": 1,
      "craftingStation": "None (hand-built)",
      "description": "...",
      "materials": ["Bedrock Stone", "Packed Earth"],
      "quantities": [4, 2]
    }
  ]
}
```

### Game Items (all_game_items.json)

```json
{
  "items": [
    {
      "id": "...",
      "name": "Stone Archive Shelf",
      "zone": "Catacombs",
      "basedOn": "The Crone's wall-carved shelving",
      "description": "...",
      "materials": ["Bedrock Stone"],
      "variants": ["Wall-Carved", "Free-Standing", "Niche"],
      "interactiveProperties": "...",
      "itemType": "Furniture"
    }
  ]
}
```

---

## Godot Loader Script

```gdscript
# DataLoader.gd — Autoload singleton
# Loads all entity data from local JSON files at game startup

extends Node

var data: Dictionary = {}
var manifest: Dictionary = {}
var game_state: Dictionary = {}  # Player's flag state

const DATA_DIR = "res://data"

func _ready():
    load_manifest()
    load_all_data()
    load_game_state()

func load_manifest():
    var file = FileAccess.open(DATA_DIR + "/manifest.json", FileAccess.READ)
    if file:
        manifest = JSON.parse_string(file.get_as_text())
        print("[DataLoader] Data bundle v" + manifest.get("version", "?") + " loaded")
    else:
        push_error("[DataLoader] No manifest found!")

func load_all_data():
    data["dialogue"] = load_json("dialogue/all_dialogue.json")
    data["whisper"] = load_json("dialogue/whisper_layer.json")
    data["stones"] = load_json("stones/all_stones.json")
    data["materials"] = load_json("materials/all_materials.json")
    data["recipes"] = load_json("recipes/all_recipes.json")
    data["items"] = load_json("items/all_game_items.json")
    data["element_charms"] = load_json("charms/element_charms.json")
    data["quest_charms"] = load_json("charms/quest_charms.json")
    data["market"] = load_json("market/all_market_items.json")
    data["lore"] = load_json("lore/all_lore.json")

func load_json(path: String) -> Dictionary:
    var file = FileAccess.open(DATA_DIR + "/" + path, FileAccess.READ)
    if file:
        return JSON.parse_string(file.get_as_text())
    return {}

func load_game_state():
    # Load from user://save_data/game_state.json (persists across sessions)
    var file = FileAccess.open("user://save_data/game_state.json", FileAccess.READ)
    if file:
        game_state = JSON.parse_string(file.get_as_text())

func save_game_state():
    var dir = DirAccess.open("user://")
    if not dir.dir_exists("save_data"):
        dir.make_dir("save_data")
    var file = FileAccess.open("user://save_data/game_state.json", FileAccess.WRITE)
    if file:
        file.store_string(JSON.stringify(game_state, "  "))

func has_flag(flag: String) -> bool:
    return game_state.get(flag, false)

func set_flag(flag: String, value: bool = true):
    game_state[flag] = value
    save_game_state()

func check_condition(condition: String) -> bool:
    if condition == "default" or condition == "":
        return true
    
    # Handle AND conditions
    if " and " in condition:
        var parts = condition.split(" and ")
        for part in parts:
            if not check_condition(part.strip_edges()):
                return false
        return true
    
    # Handle OR conditions
    if " or " in condition:
        var parts = condition.split(" or ")
        for part in parts:
            if check_condition(part.strip_edges()):
                return true
        return false
    
    # Handle negation
    if condition.begins_with("!"):
        return not has_flag(condition.substr(1))
    
    # Handle comparison (e.g., "catacombs_visits>3")
    for op in [">=", "<=", ">", "<", "=="]:
        if op in condition:
            var parts = condition.split(op)
            var key = parts[0].strip_edges()
            var value = parts[1].strip_edges().to_int()
            var current = game_state.get(key, 0)
            match op:
                ">=": return current >= value
                "<=": return current <= value
                ">": return current > value
                "<": return current < value
                "==": return current == value
    
    # Simple flag check
    return has_flag(condition)

# --- Dialogue System ---

func get_dialogue_for_npc(npc_name: String, zone: String) -> Dictionary:
    var zone_dialogues = data.get("dialogue", {}).get("zones", {}).get(zone, [])
    var matches = []
    
    for entry in zone_dialogues:
        if entry.npcName == npc_name:
            if check_condition(entry.get("conditionTag", "default")):
                matches.append(entry)
    
    if matches.is_empty():
        return {}
    
    # Sort by priority (highest first)
    matches.sort_custom(func(a, b): return a.priority > b.priority)
    return matches[0]

func get_whisper_observation(zone: String) -> Dictionary:
    var observations = data.get("whisper", {}).get("observations", [])
    var matches = []
    
    for entry in observations:
        if entry.zone == zone and check_condition(entry.get("conditionTag", "")):
            matches.append(entry)
    
    if matches.is_empty():
        return {}
    
    matches.sort_custom(func(a, b): return a.priority > b.priority)
    return matches[0]

# --- Final Room (Online/Offline Toggle) ---

func is_online() -> bool:
    return online_mode  # Set by Steam/network check

func get_final_room_response() -> String:
    if is_online():
        # Live API call to Elio agent
        return yield(_call_live_final_room(), "completed")
    else:
        # Pre-scripted response (offline mode)
        var offline_response = data.get("dialogue", {}).get("zones", {}).get("Final Room", [])
        if not offline_response.is_empty():
            return offline_response[0].lines[0]
        return "They sat by the fire. The builder was there. They were home."
```

---

## Export Pipeline

### Step 1: Backend Function (Base44)

A deployed backend function `exportDataBundle` that reads all entities and returns structured JSON.

### Step 2: Build Script (Local)

A Python script that:
1. Calls the export endpoint
2. Splits the response into individual JSON files
3. Writes them to `res://data/` in the Godot project
4. Updates the manifest

### Step 3: Godot Export

When building for Steam:
1. Run the export script to fetch latest data
2. Build the Godot project (data files packed into .pck)
3. The exported game contains all data locally

### Step 4: Data Patches

For content updates without a full game patch:
1. Update database records in Base44
2. Re-export the bundle
3. Ship as a small Steam update (just the data files)
4. Game detects new manifest version and reloads

---

## Final Room — Dual Mode

### Offline Mode (Scripted)

Pre-written dialogue records with zone "Final Room". The scripted version hits the same emotional beat — the builder was always there — but is identical for every player.

### Online Mode (Live)

The game detects network connectivity and calls the live agent endpoint:
1. Sends player context: name, zones visited, stones collected, quests completed, time played
2. The agent (Elio) generates a unique response based on what this player did
3. The response displays as the builder speaking — the one moment different for every player
4. The response is cached locally so replaying offline shows the same message

This is the only LLM call in normal gameplay. Cost: ~1 credit per player completion.

---

## Credit Cost Summary

| Component | Cost | Frequency |
|-----------|------|-----------|
| NPC dialogue (all zones) | 0 | Every interaction |
| Quest text | 0 | Every quest |
| Whisper Layer observations | 0 | Every trigger |
| Stone/lore/item data | 0 | Every lookup |
| Daily comic strip | 1 agent step | Once per day |
| Final Room (online) | 1 agent step | Once per player completion |
| Egg hatch narrative | 1 agent step | Only for community-voted eggs |
| Leaderboard | 0 (API only) | Real-time |
| Marketplace | 0 (API only) | On browse |

**Estimated monthly: 30 (comic) + 10-20 (Final Room) + 5-10 (egg/events) = ~45-60 credits/month**

Well under the 1200/month limit.
