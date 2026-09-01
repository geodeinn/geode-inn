// syncShopInventory — Sync products from soulsticejeweler.com into MarketItem database
// Actions: check (preview new/changed), import (create new items), syncPrices (update prices)

import { createClientFromRequest } from 'npm:@base44/sdk@0.8.31';

Deno.serve(async (req: Request) => {
  try {
    const base44 = createClientFromRequest(req);
    const body = await req.json();
    const action = body.action || 'check';

    function json(data: any, status = 200): Response {
      return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
    }

    // ===== SCRAPE THE SHOP =====
    async function scrapeShop(): Promise<{name: string, price: string}[]> {
      const allProducts: {name: string, price: string}[] = [];
      
      // The shop has pagination — try pages 1-5
      for (let page = 1; page <= 5; page++) {
        const url = page === 1 
          ? 'https://soulsticejeweler.com/shop' 
          : `https://soulsticejeweler.com/shop?page=${page}`;
        
        try {
          const resp = await fetch(url, {
            headers: { 'User-Agent': 'Mozilla/5.0 (compatible; GeodeInnSync/1.0)' },
          });
          if (!resp.ok) break;
          const html = await resp.text();
          
          // Parse product cards — GoDaddy Airo builder format
          // Products are typically in elements with product names in headings and prices in price elements
          const productBlocks = html.match(/<div[^>]*class="[^"]*product[^"]*"[^>]*>([\s\S]*?)<\/div>\s*(?=<div[^>]*class="[^"]*product|<footer|<\/main|$)/gi) || [];
          
          // Alternative: look for product title patterns
          // The site uses data attributes or specific class patterns for products
          const titlePricePairs = [];
          
          // Try to find product names (usually in h2, h3, h4 tags within product cards)
          const titleMatches = html.match(/<h[234][^>]*>([\s\S]*?)<\/h[234]>/gi) || [];
          const priceMatches = html.match(/\$[\d,]+\.?\d*/g) || [];
          
          // Also try data-product-name attributes
          const dataNames = html.match(/data-product-name="([^"]+)"/gi) || [];
          const dataPrices = html.match(/data-product-price="([^"]+)"/gi) || [];
          
          // Try the GoDaddy Airo pattern — products in articles or specific divs
          const articles = html.match(/<article[\s\S]*?<\/article>/gi) || [];
          
          if (articles.length > 0) {
            for (const article of articles) {
              const nameMatch = article.match(/<h[234][^>]*>([\s\S]*?)<\/h[234]>/i);
              const priceMatch = article.match(/\$[\d,]+\.?\d*/);
              if (nameMatch) {
                const name = nameMatch[1].replace(/<[^>]*>/g, '').trim();
                const price = priceMatch ? priceMatch[0] : '';
                if (name && name.length > 3 && !name.toLowerCase().includes('soulstice') || price) {
                  allProducts.push({ name, price });
                }
              }
            }
          }
          
          // Fallback: extract from title/price pairs
          if (allProducts.length === 0 && titleMatches.length > 0) {
            for (let i = 0; i < titleMatches.length; i++) {
              const name = titleMatches[i].replace(/<[^>]*>/g, '').trim();
              const price = priceMatches[i] || '';
              // Filter out nav headers, footer text, etc.
              if (name && name.length > 5 && !name.match(/^(Home|Shop|About|Contact|Cart|Menu|Navigation|Footer)/i)) {
                allProducts.push({ name, price });
              }
            }
          }
          
          // If no products found on this page, stop paginating
          if (allProducts.length === 0 || (page > 1 && allProducts.length < (page - 1) * 10)) {
            break;
          }
        } catch (e) {
          break;
        }
      }
      
      // Deduplicate by name
      const seen = new Set<string>();
      const unique = allProducts.filter(p => {
        const key = p.name.toLowerCase().trim();
        if (seen.has(key)) return false;
        seen.add(key);
        return true;
      });
      
      return unique;
    }

    // ===== GET EXISTING ITEMS =====
    async function getExistingItems(): Promise<any[]> {
      try {
        return await base44.entities.MarketItem.list({ limit: 500 });
      } catch (e) {
        return [];
      }
    }

    // ===== GUESS CATEGORY =====
    function guessCategory(name: string): string {
      const n = name.toLowerCase();
      if (n.includes('earring')) return 'Gemstone Earrings';
      if (n.includes('necklace') || n.includes('pendant')) return 'Gemstone Jewelry';
      if (n.includes('bracelet') || n.includes('leather') || n.includes('celtic') || n.includes('knot') || n.includes('weaving') || n.includes('weave')) return 'Celtic Leatherwork';
      if (n.includes('ring')) return 'Gemstone Jewelry';
      return 'Gemstone Jewelry';
    }

    // ===== GUESS RARITY =====
    function guessRarity(priceStr: string): string {
      const match = priceStr.match(/\$(\d+)/);
      if (!match) return 'Common';
      const price = parseInt(match[1]);
      if (price >= 400) return 'Legendary';
      if (price >= 200) return 'Rare';
      if (price >= 100) return 'Uncommon';
      return 'Common';
    }

    // ===== EXTRACT STONE TYPES =====
    const STONE_NAMES = [
      'amber', 'amethyst', 'aquamarine', 'agate', 'alexandrite', 'apatite', 'apatite',
      'aventurine', 'azurite', 'bloodstone', 'carnelian', 'chalcedony', 'chrysocolla',
      'chrysoprase', 'citrine', 'coral', 'diamond', 'emerald', 'fluorite', 'garnet',
      'hematite', 'howlite', 'iolite', 'jade', 'jasper', 'kyanite', 'labradorite',
      'lapis', 'larimar', 'malachite', 'moonstone', 'onyx', 'opal', 'pearl',
      'peridot', 'pietersite', 'prehnite', 'quartz', 'ruby', 'sapphire', 'serpentine',
      'sodalite', 'sunstone', 'tanzanite', 'tiger', 'topaz', 'tourmaline', 'turquoise',
      'zoisite', 'spinel', 'spodumene', 'scapolite', 'danburite', 'dumortierite',
      'epidote', 'prehnite', 'rhodochrosite', 'rhodonite', 'sugilite', 'unakite',
      'shattuckite', 'moldavite', 'libyan gold', 'nibiru', 'preseli', 'spectrolite'
    ];

    function extractStoneTypes(name: string): string {
      const n = name.toLowerCase();
      const found = STONE_NAMES.filter(stone => n.includes(stone));
      if (found.length === 0) {
        if (n.includes('leather')) return 'Leather';
        if (n.includes('silver')) return 'Silver';
        if (n.includes('gold')) return 'Gold';
        return '';
      }
      // Capitalize
      return found.map(s => s.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')).join(', ');
    }

    // ===== ACTIONS =====
    switch (action) {
      case 'check': {
        const [shopProducts, existingItems] = await Promise.all([
          scrapeShop(),
          getExistingItems(),
        ]);
        
        const existingNames = new Set(existingItems.map((i: any) => (i.realName || i.name || '').toLowerCase().trim()));
        
        const newProducts = shopProducts.filter(p => !existingNames.has(p.name.toLowerCase().trim()));
        
        // Check price changes
        const priceChanges: any[] = [];
        for (const product of shopProducts) {
          const existing = existingItems.find((i: any) => 
            (i.realName || i.name || '').toLowerCase().trim() === product.name.toLowerCase().trim()
          );
          if (existing && product.price && existing.priceRange && existing.priceRange !== product.price) {
            priceChanges.push({
              id: existing.id,
              name: product.name,
              oldPrice: existing.priceRange,
              newPrice: product.price,
            });
          }
        }
        
        return json({
          success: true,
          shopCount: shopProducts.length,
          databaseCount: existingItems.length,
          newProducts: newProducts.map(p => ({
            name: p.name,
            price: p.price,
            category: guessCategory(p.name),
            stoneType: extractStoneTypes(p.name),
            rarity: guessRarity(p.price),
          })),
          priceChanges,
        });
      }

      case 'import': {
        const [shopProducts, existingItems] = await Promise.all([
          scrapeShop(),
          getExistingItems(),
        ]);
        
        const existingNames = new Set(existingItems.map((i: any) => (i.realName || i.name || '').toLowerCase().trim()));
        const newProducts = shopProducts.filter(p => !existingNames.has(p.name.toLowerCase().trim()));
        
        const imported: any[] = [];
        for (const product of newProducts) {
          const data: any = {
            name: product.name,
            realName: product.name,
            category: guessCategory(product.name),
            priceRange: product.price,
            stoneType: extractStoneTypes(product.name) || (product.name.toLowerCase().includes('leather') ? 'Leather' : ''),
            rarity: guessRarity(product.price),
            zone: 'Main Floor Market',
            developmentStatus: 'Available',
            inStock: true,
            isSoulsticeItem: true,
            externalUrl: 'https://soulsticejeweler.com/shop',
            artisanName: 'Soulstice',
            artisanShopName: 'Soulstice Jewelry',
            artisanShopUrl: 'https://soulsticejeweler.com/shop',
          };
          
          try {
            const item = await base44.entities.MarketItem.create(data);
            imported.push({ name: product.name, id: item.id, success: true });
          } catch (err: any) {
            imported.push({ name: product.name, success: false, error: err.message });
          }
        }
        
        return json({
          success: true,
          imported: imported.filter((i: any) => i.success).length,
          failed: imported.filter((i: any) => !i.success).length,
          items: imported,
        });
      }

      case 'syncPrices': {
        const [shopProducts, existingItems] = await Promise.all([
          scrapeShop(),
          getExistingItems(),
        ]);
        
        const updated: any[] = [];
        for (const product of shopProducts) {
          const existing = existingItems.find((i: any) => 
            (i.realName || i.name || '').toLowerCase().trim() === product.name.toLowerCase().trim()
          );
          if (existing && product.price && existing.priceRange !== product.price) {
            try {
              await base44.entities.MarketItem.update(existing.id, { priceRange: product.price });
              updated.push({ name: product.name, oldPrice: existing.priceRange, newPrice: product.price, success: true });
            } catch (err: any) {
              updated.push({ name: product.name, success: false, error: err.message });
            }
          }
        }
        
        return json({
          success: true,
          updated: updated.filter((u: any) => u.success).length,
          items: updated,
        });
      }

      default:
        return json({ error: `Unknown action: ${action}. Valid: check, import, syncPrices` }, 400);
    }
  } catch (err: any) {
    console.error('syncShopInventory error:', err);
    return new Response(JSON.stringify({ error: 'Shop sync failed', details: err.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
});
