import json

with open("recipes.json") as f:
    recipes = json.load(f)

print(json.dumps(recipes, indent=2))
