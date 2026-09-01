#!/usr/bin/env python3
"""Generate Steam store page HTML for each of the 61 arcade games from the manifest."""
import json, os, re

with open('docs/market_items_all_61_games.json', 'r') as f:
    games = json.load(f)

with open('packaging/steam_store_page_template.html', 'r') as f:
    template = f.read()

os.makedirs('packaging/steam_pages', exist_ok=True)

for game in games:
    html = template
    html = html.replace('{{GAME_NAME}}', game['name'])
    html = html.replace('{{GAME_ZONE}}', game.get('zone', 'Geode Inn'))
    html = html.replace('{{GAME_DESCRIPTION}}', game.get('gameDescription', ''))
    html = html.replace('{{LORE_CONNECTION}}', game.get('loreConnection', ''))
    html = html.replace('{{PRICE}}', game.get('priceRange', 'Free'))
    html = html.replace('{{REWARD_STONE}}', game.get('stoneType') or 'None')
    html = html.replace('{{RARITY}}', game.get('rarity', 'Common'))
    
    # Generate features from game type
    features = [
        f"Inspired by classic arcade mechanics — {game.get('gameDescription', '').split('.')[0]}",
        f"Set in the {game.get('zone', 'Geode Inn')} zone of the Geode Inn",
    ]
    if game.get('stoneType'):
        features.append(f"Unlocks {game['stoneType']} upon completion")
    html = html.replace('{{FEATURE_1}}', features[0])
    html = html.replace('{{FEATURE_2}}', features[1])
    html = html.replace('{{FEATURE_3}}', features[2] if len(features) > 2 else 'Original soundtrack at 50 BPM canopy heartbeat')
    html = html.replace('{{FEATURE_4}}', 'Frequency-shift mechanics between Living (42Hz) and Shadow (84Hz) states')
    
    # Clean filename
    safe_name = re.sub(r"[^a-zA-Z0-9]+", '-', game['name'].lower()).strip('-')
    filepath = f'packaging/steam_pages/{safe_name}.html'
    with open(filepath, 'w') as f:
        f.write(html)

print(f"Generated {len(games)} Steam store pages in packaging/steam_pages/")
