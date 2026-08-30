import json

with open("zone_items_main_under.json", "r", encoding="utf-8") as f:
    items = json.load(f)

print(f"Total items loaded: {len(items)}")
assert len(items) == 72, f"Expected 72 items, got {len(items)}"

expected_zones = [
    "Garden",
    "Meadery",
    "Common Room",
    "Bone Room",
    "Cave City",
    "Poison Garden",
    "Seelie Court",
    "Unseelie Court",
    "Atlantis"
]

valid_item_types = {"Furniture", "QuestItem", "Tool", "Interactive", "Collectible"}

required_keys = {
    "name", "description", "itemType", "materials",
    "zone", "interactiveProperties", "basedOn", "variants"
}

zone_counts = {z: [] for z in expected_zones}

for idx, item in enumerate(items):
    # Check keys
    item_keys = set(item.keys())
    assert item_keys == required_keys, f"Item {idx} ({item.get('name')}) has invalid keys: {item_keys ^ required_keys}"
    
    # Check non-empty strings
    for k in ["name", "description", "itemType", "zone", "interactiveProperties", "basedOn"]:
        assert isinstance(item[k], str) and len(item[k].strip()) > 0, f"Item {idx} field {k} is invalid"
    
    # Check itemType
    assert item["itemType"] in valid_item_types, f"Item {idx} has invalid itemType: {item['itemType']}"
    
    # Check zone
    assert item["zone"] in expected_zones, f"Item {idx} has unknown zone: {item['zone']}"
    
    # Check lists
    assert isinstance(item["materials"], list) and len(item["materials"]) > 0, f"Item {idx} materials invalid"
    for m in item["materials"]:
        assert isinstance(m, str) and len(m.strip()) > 0, f"Item {idx} material invalid: {m}"
        
    assert isinstance(item["variants"], list) and len(item["variants"]) > 0, f"Item {idx} variants invalid"
    for v in item["variants"]:
        assert isinstance(v, str) and len(v.strip()) > 0, f"Item {idx} variant invalid: {v}"

    zone_counts[item["zone"]].append(item)

print("\n--- Zone breakdown checks ---")
for zone_name in expected_zones:
    z_items = zone_counts[zone_name]
    print(f"\nZone: {zone_name} (Total: {len(z_items)})")
    assert len(z_items) == 8, f"Zone {zone_name} has {len(z_items)} items, expected 8!"
    
    type_counts = {}
    for it in z_items:
        t = it["itemType"]
        type_counts[t] = type_counts.get(t, 0) + 1
        print(f"  - [{t}] {it['name']}")
    
    quest_count = type_counts.get("QuestItem", 0)
    interactive_count = type_counts.get("Interactive", 0)
    furniture_count = type_counts.get("Furniture", 0)
    collectible_tool_count = type_counts.get("Collectible", 0) + type_counts.get("Tool", 0)
    
    assert quest_count >= 2, f"Zone {zone_name} has {quest_count} QuestItems, expected >= 2"
    assert interactive_count >= 2, f"Zone {zone_name} has {interactive_count} Interactive items, expected >= 2"
    assert furniture_count >= 2, f"Zone {zone_name} has {furniture_count} Furniture items, expected >= 2"
    assert collectible_tool_count >= 2, f"Zone {zone_name} has {collectible_tool_count} Collectible/Tool items, expected >= 2"

print("\nALL 72 ITEMS VALIDATED SUCCESSFULLY AND PASSED ALL CONSTRAINTS!")
