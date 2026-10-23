"""Builds data/stones.json and data/market_sample.json from the client data extract.

Usage: python -I tools/convert_client_data.py <client-extract dir>

Stone notes stay on the live site's rule (frequency_hz if set, else the Mohs map).
The repo's per-stone values are density-based driver frequencies (20 Hz to 7.5 kHz),
so they are kept as driver_hz for haptics, not used as notes.
"""
import json
import pathlib
import re
import sys

# The market's canon catalog (dissection 13, option 4): four Soulstice pieces are
# also in-world artifacts with their own names and lore.
CANON_ARTIFACTS = {
    "soulstice_labradorite_pendant_sterling_silver": ("The Aurora Pendant", "Labradorite. Shows the hidden Fae paths."),
    "soulstice_malachite_ring_in_copper": ("The Truth-Teller's Ring", "Malachite. Shows when someone isn't being straight with you."),
    "soulstice_cats_eye_chrysoberyl_pendant": ("The Cat's Eye of Bastet", "Chrysoberyl. Opens the way to Egypt's secret cats."),
    "soulstice_preseli_bluestone_pendant": ("The Bluestone Key", "Preseli blue stone. The Fae portal's key."),
}

SKIP_NAMES = {
    "Agatized fossil Coprolite (Dinosaur) Coral fossils Opalized Wood Orthoceras",
    "Petrified palm wood rainbow petrified wood",
}


def slug(name: str) -> str:
    s = re.sub(r"[^a-z0-9]+", "_", name.lower()).strip("_")
    return s or "stone"


def main(extract_dir: str) -> None:
    src = pathlib.Path(extract_dir)
    game = pathlib.Path(__file__).resolve().parent.parent
    data = json.loads((src / "stones_from_repo.json").read_text(encoding="utf-8"))
    out = []
    seen = set()
    for s in data["stones"]:
        if s["name"] in SKIP_NAMES:
            continue
        sid = s.get("id") or slug(s["name"])
        if sid in seen:
            sid = slug(s["name"]) + "_2"
        seen.add(sid)
        entry = {
            "id": sid,
            "name": s["name"],
            "family": s.get("family") or "",
            "category": s.get("category") or "",
            "hardness": s.get("hardness"),
            "frequency_hz": None,
            "driver_hz": s.get("frequency_hz"),
            "iem_driver": s.get("iem_driver"),
            "rarity": (s.get("rarity") or "common").lower(),
            "region": s.get("region") or "",
            "inn_zone": s.get("inn_zone") or "",
            "note": s.get("note") or "",
        }
        if "41.7" in s["name"]:
            entry["frequency_hz"] = 41.7
            entry["unique_per_player"] = True
            entry["rarity"] = "legendary"
        out.append(entry)
    for s in data.get("extra_doc_stones", []):
        if "41.7" in json.dumps(s) and not any(e.get("unique_per_player") for e in out):
            out.append({
                "id": "self_stone", "name": s.get("name", "Self Stone"), "family": "Silicate", "category": "Quartz",
                "hardness": 7.0, "frequency_hz": 41.7, "driver_hz": None, "iem_driver": None, "rarity": "legendary",
                "region": "", "inn_zone": "", "note": s.get("note", ""), "unique_per_player": True,
            })
    stones_doc = {
        "_source": "200-stone census from the client's repo (198 live Stone entity records + Stillness + Octave), converted by tools/convert_client_data.py. Notes follow the live site's rule: frequency_hz if set, else the Mohs map from round(hardness). driver_hz is the repo's density-based driver frequency (for haptics, not notes). Two merged records are left out. Hardness for some stones is inferred from a base mineral in the repo; see client-extract/stones_from_repo.json for per-field sources.",
        "stones": out,
    }
    (game / "data" / "stones.json").write_text(json.dumps(stones_doc, indent=1, ensure_ascii=False), encoding="utf-8")

    market = json.loads((src / "market_from_repo.json").read_text(encoding="utf-8"))
    items = []
    for it in market["items"]:
        if "duplicate" in " ".join(it.get("flags", [])):
            continue
        entry = {
            "id": it["id"], "title": it["title"], "stones": it.get("stones", ""),
            "price_usd": it.get("price_usd"), "price_range_usd": it.get("price_range_usd"),
            "artisan": it.get("artisan", "Soulstice"), "category": it.get("category", ""),
            "url": it.get("url", ""),
        }
        if it["id"] in CANON_ARTIFACTS:
            entry["canon_name"], entry["lore"] = CANON_ARTIFACTS[it["id"]]
        items.append(entry)
    market_doc = {
        "_source": "Soulstice products from the client's live MarketItem snapshot (core-files/entities/geode_inn_live_market_manifest.json, Sep 1 2026), via tools/convert_client_data.py. Duplicate listings removed. In-world text follows the phrasing law: the real piece is 'the one that travels', never a website.",
        "shop_url": market.get("shop_url", ""),
        "items": items,
    }
    (game / "data" / "market_sample.json").write_text(json.dumps(market_doc, indent=1, ensure_ascii=False), encoding="utf-8")

    games = market.get("arcade_games", {}).get("items", [])
    arcade_doc = {
        "_source": "The 61 arcade titles from the client's live MarketItem snapshot (core-files/entities/market_items_all_61_games.json), via tools/convert_client_data.py. The cabinets stand on the Main Floor; the games themselves are the client's web beta games and get ported later.",
        "corner_of_honor": "game_standing_stones",
        "games": [{"id": g["id"], "title": g["title"], "zone": g.get("zone", ""), "stones": g.get("stones") or ""} for g in games],
    }
    (game / "data" / "arcade.json").write_text(json.dumps(arcade_doc, indent=1, ensure_ascii=False), encoding="utf-8")

    ids = {e["name"]: e["id"] for e in out}
    print(f"stones: {len(out)}  market items: {len(items)}")
    for want in ["Clear Quartz", "Quartz", "Calcite", "Hematite", "Rainbow Fluorite", "Labradorite", "Green Labradorite",
                 "Preseli Blue Stone", "Amethyst", "Rose Quartz", "Malachite", "Pyrite", "Smoky Quartz", "Moss Agate"]:
        print(f"  {want!r}: {ids.get(want)}")
    print("  unique:", [e["id"] for e in out if e.get("unique_per_player")])
    print("  no hardness:", [e["id"] for e in out if e["hardness"] is None])


if __name__ == "__main__":
    main(sys.argv[1])
