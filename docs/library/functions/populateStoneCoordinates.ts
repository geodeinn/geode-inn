// populateStoneCoordinates — Auto-populate mapPinLat/mapPinLng and geoRegion for all stones
import { createClientFromRequest } from 'npm:@base44/sdk@0.8.31';

Deno.serve(async (req: Request) => {
  try {
    const base44 = createClientFromRequest(req);
    
    // Region name -> [lat, lng] mapping
    const REGION_COORDS: Record<string, [number, number]> = {
      'Scotland': [56.4907, -4.2026],
      'Scotland (Orkney)': [58.9636, -2.9606],
      'Wales': [52.1307, -3.7837],
      'Wales, UK': [52.1307, -3.7837],
      'England': [52.3555, -1.1743],
      'Norway': [60.4720, 8.4689],
      'France': [46.2276, 2.2137],
      'Germany': [51.1657, 10.4515],
      'Austria': [47.5162, 14.5501],
      'Poland': [51.9194, 19.1451],
      'Czech Republic': [49.8175, 15.4730],
      'Eastern Europe': [44.4268, 26.1025],
      'Tibet': [30.2272, 88.1634],
      'China': [35.8617, 104.1954],
      'Philippines': [12.8797, 121.7740],
      'Australia': [25.2744, 133.7751],
      'New Zealand': [-40.9006, 174.8860],
      'Madagascar': [-18.7669, 46.8691],
      'Solomon Islands': [-9.4318, 159.9551],
      'Maldives': [3.2028, 73.2207],
      'Bahamas': [25.0343, -77.3963],
      'South Africa': [-30.5595, 22.9375],
      'Ethiopia': [9.1450, 40.4897],
      'Tanzania': [-6.3690, 34.8888],
      'Congo': [-0.6654, 23.3802],
      'Gambia': [13.4410, -15.3101],
      'Benin': [9.3077, 2.3759],
      'Cameroon': [7.3697, 12.3541],
      'Mozambique': [-18.6657, 35.5296],
      'Africa': [0.0, 20.0],
      'Brazil': [-14.2350, -51.9253],
      'Peru': [-9.1900, -75.0152],
      'Guatemala': [15.7835, -90.2308],
      'Dominican Republic': [18.7357, -70.1627],
      'Montana, USA': [46.8797, -110.3626],
      'New York, USA': [43.2994, -74.2179],
      'USA (Georgia)': [32.1656, -82.9001],
      'Americas': [15.0, -90.0],
      'Antarctica': [-82.8628, 135.0000],
      'Cyprus': [35.1264, 33.4299],
      'Arizona, Pakistan, Egypt, Myanmar': [33.6, 73.0], // Pakistan as primary
      'Texas, Louisiana, Wyoming, Egypt, Argentina': [31.0, -100.0], // Texas as primary
      'South Carolina, Madagascar, England, Global': [33.0, -80.0], // South Carolina as primary
      'North Carolina, Sri Lanka, India, Global (rhyolite deposits)': [35.0, 80.0], // India as primary
    };

    // Stone name -> [geoRegion, lat, lng] for stones with no geoRegion
    // Based on known gemstone origins
    const STONE_REGION_MAP: Record<string, {region: string, lat: number, lng: number}> = {
      'Lapis Lazuli': { region: 'Afghanistan', lat: 33.9, lng: 67.0 },
      'Malachite': { region: 'Congo', lat: -0.7, lng: 23.4 },
      'Black Tourmaline': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Blue Tourmaline': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Green Tourmaline': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Watermelon Tourmaline': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Rubellite Tourmaline': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Multi - Colored Tourmaline': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Ruby': { region: 'Myanmar', lat: 21.9, lng: 95.9 },
      'Ruby with kyanite': { region: 'Myanmar', lat: 21.9, lng: 95.9 },
      'Sapphire': { region: 'Sri Lanka', lat: 7.9, lng: 80.7 },
      'Sapphire (Tundra)': { region: 'Russia', lat: 66.0, lng: 90.0 },
      'Clear Quartz': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Rose Quartz': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Smoky Quartz': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Rutilated Quartz': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Phantom Quartz': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Solar Quartz': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Tourmalinated Quartz': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      "Blue Tiger's Eye": { region: 'South Africa', lat: -30.6, lng: 22.9 },
      "Brown Tiger's Eye": { region: 'South Africa', lat: -30.6, lng: 22.9 },
      "Red Tiger's Eye": { region: 'South Africa', lat: -30.6, lng: 22.9 },
      'Tiger Iron': { region: 'Australia', lat: -25.3, lng: 133.8 },
      "Hawk's Eye": { region: 'South Africa', lat: -30.6, lng: 22.9 },
      'Lepidolite': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Sugilite': { region: 'South Africa', lat: -30.6, lng: 22.9 },
      'Hematite': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Pyrite': { region: 'Peru', lat: -9.2, lng: -75.0 },
      'Sodalite': { region: 'Canada', lat: 56.1, lng: -106.3 },
      'Sodalite (African)': { region: 'Africa', lat: 0.0, lng: 20.0 },
      'Unakite': { region: 'USA', lat: 35.8, lng: -80.0 },
      'Uvarovite': { region: 'Russia', lat: 66.0, lng: 90.0 },
      'Zoisite (with ruby inclusions)': { region: 'Tanzania', lat: -6.4, lng: 34.9 },
      'Zultanite': { region: 'Turkey', lat: 38.9, lng: 35.2 },
      'Sunstone': { region: 'Tanzania', lat: -6.4, lng: 34.9 },
      'Tektite': { region: 'Global', lat: 0.0, lng: 0.0 },
      'Spinel': { region: 'Myanmar', lat: 21.9, lng: 95.9 },
      'Staurolite (fairy cross stone)': { region: 'USA (Georgia)', lat: 32.2, lng: -82.9 },
      'Shungite': { region: 'Russia', lat: 60.7, lng: 34.2 },
      'Pearl': { region: 'Global', lat: 0.0, lng: 0.0 },
      'Peridot': { region: 'Arizona, Pakistan, Egypt, Myanmar', lat: 33.6, lng: 73.0 },
      'Petrified Wood': { region: 'USA', lat: 35.0, lng: -110.0 },
      'Pietersite': { region: 'Namibia', lat: -22.0, lng: 17.0 },
      'Platinum': { region: 'South Africa', lat: -30.6, lng: 22.9 },
      'Prehnite': { region: 'South Africa', lat: -30.6, lng: 22.9 },
      'Moldavite': { region: 'Czech Republic', lat: 49.8, lng: 15.5 },
      'Peach Moonstone': { region: 'Sri Lanka', lat: 7.9, lng: 80.7 },
      'Rainbow Moonstone': { region: 'Sri Lanka', lat: 7.9, lng: 80.7 },
      'White Moonstone': { region: 'Sri Lanka', lat: 7.9, lng: 80.7 },
      'Morganite': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Nuummite': { region: 'Greenland', lat: 72.0, lng: -40.0 },
      'Gold Sheen Obsidian': { region: 'Mexico', lat: 23.6, lng: -102.6 },
      'Rainbow Obsidian': { region: 'Mexico', lat: 23.6, lng: -102.6 },
      'Snowflake Obsidian': { region: 'Mexico', lat: 23.6, lng: -102.6 },
      'Black Onyx': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Green Onyx': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Lemurian Blue Calcite (Blue Onyx)': { region: 'Argentina', lat: -38.4, lng: -63.6 },
      'Black Opal': { region: 'Australia', lat: -25.3, lng: 133.8 },
      'Boulder Opal': { region: 'Australia', lat: -25.3, lng: 133.8 },
      'Fire Opal': { region: 'Mexico', lat: 23.6, lng: -102.6 },
      'Water Opal': { region: 'Mexico', lat: 23.6, lng: -102.6 },
      'Picasso Jasper': { region: 'USA', lat: 35.8, lng: -80.0 },
      'Picture Jasper': { region: 'USA', lat: 35.8, lng: -80.0 },
      'Sunset Jasper': { region: 'USA', lat: 35.8, lng: -80.0 },
      'Jet': { region: 'England', lat: 52.4, lng: -1.2 },
      'Kammererite': { region: 'Turkey', lat: 38.9, lng: 35.2 },
      'Kunzite': { region: 'Afghanistan', lat: 33.9, lng: 67.0 },
      'Kyanite (blue)': { region: 'Nepal', lat: 28.4, lng: 84.1 },
      'Kyanite (orange)': { region: 'Nepal', lat: 28.4, lng: 84.1 },
      'Kyanite (Moss)': { region: 'Nepal', lat: 28.4, lng: 84.1 },
      'Green Labradorite': { region: 'Madagascar', lat: -18.8, lng: 46.9 },
      'Lepidocrocite': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Iolite': { region: 'Sri Lanka', lat: 7.9, lng: 80.7 },
      'Hypersthene': { region: 'Canada', lat: 56.1, lng: -106.3 },
      'Jadeite': { region: 'Myanmar', lat: 21.9, lng: 95.9 },
      'Nephrite Jade': { region: 'China', lat: 35.9, lng: 104.2 },
      'White Jade': { region: 'Myanmar', lat: 21.9, lng: 95.9 },
      'Bloodstone': { region: 'India', lat: 22.6, lng: 78.0 },
      'Bumblebee Jasper': { region: 'Indonesia', lat: -0.5, lng: 113.9 },
      'Desert Jasper': { region: 'USA', lat: 35.8, lng: -110.0 },
      'Leopardskin Jasper': { region: 'Mexico', lat: 23.6, lng: -102.6 },
      'Sard': { region: 'India', lat: 22.6, lng: 78.0 },
      'Sardonyx': { region: 'India', lat: 22.6, lng: 78.0 },
      'Septarian': { region: 'USA (Utah)', lat: 39.3, lng: -111.0 },
      'Rhodochrosite': { region: 'Argentina', lat: -38.4, lng: -63.6 },
      'Rhodonite': { region: 'Russia', lat: 66.0, lng: 90.0 },
      'Blue Topaz (Swiss)': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Clear Topaz': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Imperial (Golden) Topaz': { region: 'Brazil', lat: -14.2, lng: -51.9 },
      'Turquoise (types found in the Americas)': { region: 'Americas', lat: 15.0, lng: -90.0 },
      'Turquoise (Tibetan)': { region: 'Tibet', lat: 30.2, lng: 88.2 },
    };

    // Fetch all stones
    const stones = await base44.entities.Stone.list({ limit: 500 });
    let updated = 0;
    let skipped = 0;
    let guessed = 0;
    const results: any[] = [];

    for (const stone of stones) {
      const updates: any = {};
      const region = stone.geoRegion || stone.data?.geoRegion;
      const name = stone.name || stone.data?.name;
      
      // Check if already has coordinates
      const hasCoords = stone.mapPinLat || stone.data?.mapPinLat;
      if (hasCoords) {
        skipped++;
        results.push({ name, status: 'skipped', reason: 'has coords' });
        continue;
      }

      // Try to get coordinates from region
      if (region && REGION_COORDS[region]) {
        const [lat, lng] = REGION_COORDS[region];
        updates.mapPinLat = lat;
        updates.mapPinLng = lng;
      }
      // Try to get coordinates from stone name map
      else if (name && STONE_REGION_MAP[name]) {
        const info = STONE_REGION_MAP[name];
        updates.mapPinLat = info.lat;
        updates.mapPinLng = info.lng;
        if (!region) {
          updates.geoRegion = info.region;
        }
        guessed++;
      }
      else {
        // Try partial name matching
        if (name) {
          const lowerName = name.toLowerCase();
          let found = false;
          for (const [stoneName, info] of Object.entries(STONE_REGION_MAP)) {
            if (lowerName.includes(stoneName.toLowerCase())) {
              updates.mapPinLat = info.lat;
              updates.mapPinLng = info.lng;
              if (!region) updates.geoRegion = info.region;
              guessed++;
              found = true;
              break;
            }
          }
          if (!found) {
            // Default based on stone family
            const family = stone.stoneFamily || stone.data?.stoneFamily;
            if (family === 'Quartz') {
              updates.mapPinLat = -14.2; updates.mapPinLng = -51.9; updates.geoRegion = 'Brazil';
              guessed++;
            } else if (family === 'Tourmaline') {
              updates.mapPinLat = -14.2; updates.mapPinLng = -51.9; updates.geoRegion = 'Brazil';
              guessed++;
            } else if (family === 'Garnet') {
              updates.mapPinLat = 21.9; updates.mapPinLng = 95.9; updates.geoRegion = 'Myanmar';
              guessed++;
            } else {
              skipped++;
              results.push({ name, status: 'no_match', reason: `family: ${family}` });
              continue;
            }
          }
        } else {
          skipped++;
          continue;
        }
      }

      try {
        await base44.entities.Stone.update(stone.id, updates);
        updated++;
        results.push({ name, status: 'updated', region: updates.geoRegion || region });
      } catch (err: any) {
        results.push({ name, status: 'error', error: err.message });
      }
    }

    return new Response(JSON.stringify({
      success: true,
      total: stones.length,
      updated,
      guessed,
      skipped,
      results: results.slice(0, 50),
    }), { status: 200, headers: { 'Content-Type': 'application/json' } });
  } catch (err: any) {
    console.error('populateStoneCoordinates error:', err);
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
});
