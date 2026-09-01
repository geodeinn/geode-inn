import base44 from "base44";

export default async (req, res) => {
  try {
    const GEODE_INN_APP_ID = "6a60f218b0c6605c92fa35c4";
    
    // Read all 198 stones from staging (Elio app) to get imageFile URLs
    const stagingStones = await base44.entities.Stone.list({ limit: 500 });
    
    // Read all stones from the live Geode Inn app
    const liveStones = await base44.asServiceRole.entities.Stone.list({ 
      limit: 500,
      app_id: GEODE_INN_APP_ID 
    });
    
    // Build a name -> imageFile map from staging
    const imageMap = {};
    for (const stone of stagingStones) {
      if (stone.name && stone.imageFile) {
        imageMap[stone.name] = stone.imageFile;
      }
    }
    
    // Match and update live stones
    let updated = 0;
    let skipped = 0;
    let notFound = 0;
    
    for (const liveStone of liveStones) {
      const imageUrl = imageMap[liveStone.name];
      if (imageUrl) {
        // Update the live stone's image_url field
        await base44.asServiceRole.entities.Stone.update(liveStone.id, {
          image_url: imageUrl
        }, { app_id: GEODE_INN_APP_ID });
        updated++;
      } else {
        notFound++;
      }
    }
    
    return res.status(200).json({
      success: true,
      stagingCount: stagingStones.length,
      liveCount: liveStones.length,
      updated,
      notFound,
      message: `Synced ${updated} stone images to live Geode Inn. ${notFound} stones had no matching staging record.`
    });
  } catch (error) {
    console.error("Sync error:", error);
    return res.status(500).json({ 
      success: false, 
      error: error.message || "Unknown sync error" 
    });
  }
};
