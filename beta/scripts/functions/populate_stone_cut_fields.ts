// populate_stone_cut_fields.ts
// Bulk-updates Stone entity records with cabochon, facet, opacity, and opticalPhenomenon fields
// based on the Geode Inn's bead faceting rules and mineral science.

export default async function(req: any, res: any) {
  const { entities, asServiceRole } = req.base44;
  
  // Read all stones
  const stones = await asServiceRole.entities.Stone.list({ limit: 500 });
  
  const OPAQUE_FAMILIES = [
    'Metal', 'Igneous', 'Rock', 'Carbonate', 'Iron', 'Obsidian',
    'Jasper', 'Granite', 'Basalt', 'Hematite', 'Magnetite', 'Pyrite',
    'Turquoise', 'Malachite', 'Lapis Lazuli', 'Azurite', 'Serpentine',
    'Unakite', 'Bloodstone', 'Onyx', 'Jet', 'Shungite'
  ];
  
  const TRANSLUCENT_FAMILIES = [
    'Quartz', 'Chalcedony', 'Agate', 'Fluorite', 'Moonstone', 'Labradorite',
    'Amazonite', 'Jadeite', 'Nephrite', 'Opal', 'Carnelian', 'Garnet',
    'Prehnite', 'Aventurine', 'Chrysoprase', 'Sardonyx'
  ];
  
  const TRANSPARENT_FAMILIES = [
    'Diamond', 'Sapphire', 'Ruby', 'Emerald', 'Aquamarine', 'Topaz',
    'Beryl', 'Spinel', 'Zircon', 'Tanzanite', 'Tourmaline', 'Peridot',
    'Tsavorite', 'Demantoid', 'Alexandrite', 'Iolite', 'Kunzite',
    'Morganite', 'Heliodor', 'Goshenite'
  ];
  
  const OPTICAL_PHENOMENA: Record<string, string> = {
    'Opal': 'play-of-color',
    'Moonstone': 'adularescence',
    'Labradorite': 'labradorescence',
    'Tiger Eye': 'chatoyancy',
    "Tiger's Eye": 'chatoyancy',
    'Star Sapphire': 'asterism',
    'Star Ruby': 'asterism',
    'Alexandrite': 'color-change',
    'Sunstone': 'aventurescence',
    'Rainbow Moonstone': 'iridescence',
    'Selenite': 'schiller',
    'Pearl': 'iridescence',
    'Amber': 'fluorescence',
    'Fluorite': 'fluorescence'
  };
  
  const OPAQUE_BUT_FACETABLE = ['Black Onyx', 'Tourmaline', 'Black Tourmaline', 'Schorl Tourmaline'];
  
  let updated = 0;
  
  for (const stone of stones) {
    const family = stone.stoneFamily || '';
    const name = stone.name || '';
    const category = stone.category || '';
    
    let opacity = 'opaque';
    if (TRANSLUCENT_FAMILIES.includes(family) || TRANSPARENT_FAMILIES.includes(family)) {
      opacity = TRANSPARENT_FAMILIES.includes(family) ? 'transparent' : 'translucent';
    }
    if (OPAQUE_FAMILIES.includes(family)) {
      opacity = 'opaque';
    }
    if (category === 'Organic') {
      if (family === 'Pearl' || family === 'Coral') opacity = 'opaque';
      else opacity = 'translucent';
    }
    
    let canFacet = false;
    if (opacity === 'translucent' || opacity === 'transparent') {
      canFacet = true;
    }
    if (OPAQUE_BUT_FACETABLE.some(n => name.includes(n) || family.includes(n))) {
      canFacet = true;
    }
    if (family === 'Opal') {
      canFacet = name.toLowerCase().includes('fire opal');
      opacity = 'translucent';
    }
    
    let canCabochon = true;
    
    let opticalPhenomenon = stone.opticalPhenomenon || '';
    if (!opticalPhenomenon && OPTICAL_PHENOMENA[family]) {
      opticalPhenomenon = OPTICAL_PHENOMENA[family];
    }
    
    let cabochonShapes = stone.cabochonShapes || '';
    if (!cabochonShapes) {
      if (opacity === 'opaque') {
        cabochonShapes = 'round, oval, square, freeform';
      } else if (opticalPhenomenon) {
        cabochonShapes = 'round, oval, cushion';
      } else {
        cabochonShapes = 'round, oval, cushion, pear';
      }
    }
    
    try {
      await asServiceRole.entities.Stone.update(stone.id, {
        opacity,
        canCabochon,
        canFacet,
        opticalPhenomenon: opticalPhenomenon || undefined,
        cabochonShapes
      });
      updated++;
    } catch (e) {
      console.error(`Failed to update stone ${stone.id}:`, e);
    }
  }
  
  res.json({
    success: true,
    totalStones: stones.length,
    updated,
    message: `Populated cut fields for ${updated} of ${stones.length} stones`
  });
}
