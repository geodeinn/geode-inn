# Geode Inn — Builder Implementation Guide
## For the Fizgigs

This document is the complete specification for the builder to implement the Geode Inn's living world. It contains every animated element, where it goes, and how it moves.

---

## FILES NEEDED

1. **`geode_inn_animation_engine.js`** — Complete animation engine (CSS keyframes, particle system, sprite framework, wander AI, mode switching). This file should be included in the app as a global script.

2. **`geode_inn_animation_engine.css`** — Extract the CSS portion (all `@keyframes` and `.geode-*` classes) into a stylesheet.

3. Sprite sheet images — Placeholder rectangles can be used initially; sprite sheets will be provided in batches.

---

## PAGE STRUCTURE

The Geode Inn main floor page needs the following HTML structure:

### Great Hearth (Main Floor Center)

```html
<!-- Great Hearth -->
<div class="geode-hearth" data-geode-element="hearth">
  <!-- Central fire -->
  <canvas data-geode-particles="embers" 
          data-emitter-x="400" data-emitter-y="300"
          width="800" height="400"></canvas>
  <div class="geode-flame-flicker hearth-fire"></div>
  
  <!-- Storyteller NPC (seated, never stands) -->
  <div class="npc-storyteller" 
       data-geode-sprite="/sprites/storyteller.png" 
       data-geode-preset="seated">
  </div>
  
  <!-- Pipe smoke particle system -->
  <canvas data-geode-particles="smoke" 
          data-emitter-x="420" data-emitter-y="180"
          width="100" height="200"></canvas>
  
  <!-- Hearth dragon kitten (sleeps in ashes) -->
  <div class="critter-dragon-kitten geode-breathe"
       data-geode-sprite="/sprites/dragon_kitten_ember.png"
       data-geode-preset="dragonKitten">
  </div>
  
  <!-- Hearth pixies (dance in flame edges) -->
  <div class="pixie-hearth geode-float" style="left: 380px; top: 200px;"></div>
  <div class="pixie-hearth geode-float geode-var-2" style="left: 420px; top: 190px;"></div>
  <div class="pixie-hearth geode-float geode-var-4" style="left: 400px; top: 210px;"></div>
  
  <!-- Eileen NPC (tends fire, paints cave walls) -->
  <div class="npc-eileen"
       data-geode-sprite="/sprites/eileen.png"
       data-geode-preset="kneeling">
  </div>
</div>
```

### Bar Area (Main Floor)

```html
<!-- Bar Area -->
<div class="geode-bar">
  <!-- The Catalyst (bartender) -->
  <div class="npc-catalyst"
       data-geode-sprite="/sprites/catalyst.png"
       data-geode-preset="standing">
  </div>
  
  <!-- Spark the dragon kitten (sits on bar, bats at glasses) -->
  <div class="critter-dragon-kitten geode-idle-sway"
       data-geode-sprite="/sprites/dragon_kitten_spark.png"
       data-geode-preset="dragonKitten"
       data-geode-wander
       data-wander-speed="0.3"
       data-wander-bounds='{"x":300,"y":200,"width":200,"height":50}'
       data-avoid-player="false">
  </div>
  
  <!-- Bar lantern -->
  <div class="lantern geode-lantern-sway"></div>
  
  <!-- Candle on bar -->
  <div class="candle geode-candle-flicker"></div>
</div>
```

### Library

```html
<!-- Library -->
<div class="geode-library">
  <!-- Beverley the Librarian -->
  <div class="npc-beverley"
       data-geode-sprite="/sprites/beverley.png"
       data-geode-preset="small"
       data-geode-wander
       data-wander-speed="0.3"
       data-wander-bounds='{"x":0,"y":0,"width":600,"height":400}'>
  </div>
  
  <!-- Cthulhu the Scholar (hidden in stacks) -->
  <div class="npc-cthulhu"
       data-geode-sprite="/sprites/cthulhu.png"
       data-geode-preset="seated">
  </div>
  
  <!-- Glimmer the dragon kitten (sleeps on shelf) -->
  <div class="critter-dragon-kitten"
       data-geode-sprite="/sprites/dragon_kitten_glimmer.png"
       data-geode-preset="dragonKitten">
  </div>
  
  <!-- Floating books -->
  <div class="floating-book geode-float" style="left: 200px; top: 150px;"></div>
  <div class="floating-book geode-float geode-var-3" style="left: 350px; top: 200px;"></div>
  
  <!-- Ink sprites -->
  <div class="ink-sprite geode-hover"></div>
  
  <!-- Bookworm on reading table -->
  <div class="critter-bookworm"
       data-geode-sprite="/sprites/bookworm.png"
       data-geode-preset="small"
       data-geode-wander
       data-wander-speed="0.1"
       data-wander-bounds='{"x":300,"y":300,"width":200,"height":50}'>
  </div>
  
  <!-- Library candles -->
  <div class="candle geode-candle-flicker"></div>
  <div class="candle geode-candle-flicker geode-var-2"></div>
  <div class="candle geode-candle-flicker geode-var-4"></div>
  
  <!-- Dust motes in light shafts -->
  <canvas data-geode-particles="dust" 
          data-emitter-x="100" data-emitter-y="0"
          width="200" height="400"></canvas>
</div>
```

### Market Stalls

```html
<!-- Market Stalls -->
<div class="geode-market">
  <!-- The Artisan Thief -->
  <div class="npc-artisan-thief"
       data-geode-sprite="/sprites/artisan_thief.png"
       data-geode-preset="standing"
       data-geode-wander
       data-wander-speed="0.4"
       data-wander-bounds='{"x":0,"y":100,"width":400,"height":200}'>
  </div>
  
  <!-- Pip the dragon kitten (steals shiny things) -->
  <div class="critter-dragon-kitten"
       data-geode-sprite="/sprites/dragon_kitten_pip.png"
       data-geode-preset="dragonKitten"
       data-geode-wander
       data-wander-speed="0.8"
       data-wander-bounds='{"x":0,"y":50,"width":500,"height":100}'
       data-avoid-player="false">
  </div>
  
  <!-- Market lanterns -->
  <div class="lantern geode-lantern-sway" style="left: 100px;"></div>
  <div class="lantern geode-lantern-sway geode-var-3" style="left: 300px;"></div>
  <div class="lantern geode-lantern-sway geode-var-5" style="left: 500px;"></div>
  
  <!-- Fountain -->
  <div class="fountain">
    <div class="fountain-water geode-wave-surface"></div>
  </div>
</div>
```

### Workshop

```html
<!-- Workshop -->
<div class="geode-workshop">
  <!-- The Fixer -->
  <div class="npc-fixer"
       data-geode-sprite="/sprites/fixer.png"
       data-geode-preset="standing">
  </div>
  
  <!-- Joe the Miniature Maker -->
  <div class="npc-joe"
       data-geode-sprite="/sprites/joe.png"
       data-geode-preset="seated">
  </div>
  
  <!-- Soot the dragon kitten (helper, soot-covered) -->
  <div class="critter-dragon-kitten geode-breathe"
       data-geode-sprite="/sprites/dragon_kitten_soot.png"
       data-geode-preset="dragonKitten">
  </div>
  
  <!-- Fizgig working on pipes -->
  <div class="critter-fizgig"
       data-geode-sprite="/sprites/fizgig_wrench.png"
       data-geode-preset="fizgig">
  </div>
  
  <!-- Workshop pipe system with steam -->
  <div class="pipe-system">
    <div class="pipe-steam geode-smoke-rise"></div>
    <div class="pipe-steam geode-smoke-rise geode-var-3"></div>
  </div>
  
  <!-- Bellows -->
  <div class="bellows geode-bellows-pump"></div>
</div>
```

### Common Room

```html
<!-- Common Room -->
<div class="geode-common-room">
  <!-- The Bard Blowhard -->
  <div class="npc-bard"
       data-geode-sprite="/sprites/bard.png"
       data-geode-preset="standing">
  </div>
  
  <!-- Odin the Wanderer (roaming) -->
  <div class="npc-odin-wanderer"
       data-geode-sprite="/sprites/odin_wanderer.png"
       data-geode-preset="standing"
       data-geode-wander
       data-wander-speed="0.2"
       data-wander-bounds='{"x":0,"y":0,"width":800,"height":400}'>
  </div>
  
  <!-- Huginn and Muninn (chibi ravens, steal things) -->
  <div class="raven-chibi geode-hover"
       data-geode-wander
       data-wander-speed="1.2"
       data-wander-bounds='{"x":0,"y":0,"width":800,"height":200}'>
  </div>
  <div class="raven-chibi geode-hover geode-var-4"
       data-geode-wander
       data-wander-speed="1.0"
       data-wander-bounds='{"x":0,"y":0,"width":800,"height":200}'>
  </div>
  
  <!-- Brownies (working by candlelight, vanish if watched) -->
  <div class="critter-brownie"
       data-geode-sprite="/sprites/brownie_sweep.png"
       data-geode-preset="brownie"
       data-geode-wander
       data-wander-speed="0.3"
       data-avoid-player="true"
       data-wander-bounds='{"x":100,"y":200,"width":400,"height":200}'>
  </div>
  <div class="critter-brownie"
       data-geode-sprite="/sprites/brownie_polish.png"
       data-geode-preset="brownie"
       data-geode-wander
       data-wander-speed="0.2"
       data-avoid-player="true"
       data-wander-bounds='{"x":100,"y":200,"width":400,"height":200}'>
  </div>
  
  <!-- Sconce flames on walls -->
  <div class="sconce-flame geode-flame-flicker" style="left: 50px; top: 100px;"></div>
  <div class="sconce-flame geode-flame-flicker geode-var-2" style="left: 250px; top: 100px;"></div>
  <div class="sconce-flame geode-flame-flicker geode-var-4" style="left: 450px; top: 100px;"></div>
  <div class="sconce-flame geode-flame-flicker geode-var-6" style="left: 650px; top: 100px;"></div>
</div>
```

### Forge

```html
<!-- Forge -->
<div class="geode-forge">
  <!-- The Smiths (two hammering in sync) -->
  <div class="npc-smith-1"
       data-geode-sprite="/sprites/smith1.png"
       data-geode-preset="standing">
  </div>
  <div class="npc-smith-2"
       data-geode-sprite="/sprites/smith2.png"
       data-geode-preset="standing">
  </div>
  
  <!-- Forge fire -->
  <div class="forge-fire geode-flame-flicker"></div>
  <canvas data-geode-particles="embers" 
          data-emitter-x="200" data-emitter-y="150"
          width="400" height="300"></canvas>
  
  <!-- Forge salamanders -->
  <div class="critter-salamander geode-walk-bounce"
       data-geode-sprite="/sprites/forge_salamander.png"
       data-geode-preset="waterCritter"
       data-geode-wander
       data-wander-speed="0.5"
       data-wander-bounds='{"x":100,"y":100,"width":300,"height":150}'>
  </div>
  
  <!-- Bellows -->
  <div class="forge-bellows geode-bellows-pump"></div>
</div>
```

### Ceiling (Throughout the Inn)

```html
<!-- Ceiling Gnome — appears in every zone, always on ceiling -->
<div class="ceiling-gnome geode-breathe"
     data-geode-sprite="/sprites/ceiling_gnome.png"
     data-geode-preset="small"
     style="position: absolute; top: 20px; left: 50%; transform: translateX(-50%) rotate(180deg);">
</div>
```

### Staircase (Between Floors)

```html
<!-- Staircase / Alchemy Level -->
<div class="geode-staircase">
  <!-- Council of Thinkers -->
  <div class="npc-tesla"
       data-geode-sprite="/sprites/tesla.png"
       data-geode-preset="standing">
  </div>
  <div class="npc-davinci"
       data-geode-sprite="/sprites/davinci.png"
       data-geode-preset="standing">
  </div>
  <div class="npc-newton"
       data-geode-sprite="/sprites/newton.png"
       data-geode-preset="standing">
  </div>
  <div class="npc-einstein"
       data-geode-sprite="/sprites/einstein.png"
       data-geode-preset="seated">
  </div>
  
  <!-- Stair mouse (runs up and down stairs, never tires) -->
  <div class="critter-stone-mouse"
       data-geode-sprite="/sprites/stair_mouse.png"
       data-geode-preset="small"
       data-geode-wander
       data-wander-speed="1.5"
       data-wander-bounds='{"x":0,"y":0,"width":200,"height":400}'>
  </div>
  
  <!-- Sage gargoyle puppy (pretends to read, holds book upside down) -->
  <div class="critter-gargoyle-puppy geode-idle-sway"
       data-geode-sprite="/sprites/gargoyle_sage_pup.png"
       data-geode-preset="gargoylePuppy">
  </div>
  
  <!-- Alchemical apparatus with bubbles -->
  <div class="alchemy-vessel">
    <div class="potion-bubble geode-bubble-rise"></div>
    <div class="potion-bubble geode-bubble-rise geode-var-2"></div>
    <div class="potion-bubble geode-bubble-rise geode-var-4"></div>
  </div>
</div>
```

### Cosmology Level (Upstairs)

```html
<!-- Cosmology Level -->
<div class="geode-cosmology">
  <!-- Odin the Allfather (on throne, never moves) -->
  <div class="npc-allfather"
       data-geode-sprite="/sprites/allfather.png"
       data-geode-preset="seated">
  </div>
  
  <!-- The Astronomer -->
  <div class="npc-astronomer"
       data-geode-sprite="/sprites/astronomer.png"
       data-geode-preset="standing">
  </div>
  
  <!-- The Keeper (Aughra) -->
  <div class="npc-keeper"
       data-geode-sprite="/sprites/keeper.png"
       data-geode-preset="standing">
  </div>
  
  <!-- Star field with twinkling -->
  <div class="star-field">
    <div class="star geode-star-twinkle" style="top: 10%; left: 15%;"></div>
    <div class="star geode-star-twinkle geode-var-2" style="top: 20%; left: 30%;"></div>
    <div class="star geode-star-twinkle geode-var-3" style="top: 15%; left: 50%;"></div>
    <div class="star geode-star-twinkle geode-var-4" style="top: 25%; left: 70%;"></div>
    <div class="star geode-star-twinkle geode-var-5" style="top: 5%; left: 85%;"></div>
    <!-- ... more stars ... -->
  </div>
  
  <!-- Aurora -->
  <div class="aurora geode-aurora-shift"></div>
  
  <!-- Glow the dragon kitten (chases stars) -->
  <div class="critter-dragon-kitten geode-wing-flap"
       data-geode-sprite="/sprites/dragon_kitten_glow.png"
       data-geode-preset="dragonKitten"
       data-geode-wander
       data-wander-speed="1.0"
       data-wander-bounds='{"x":0,"y":0,"width":800,"height":300}'>
  </div>
  
  <!-- Antikythera mechanism -->
  <div class="antikythera">
    <div class="gear-layer geode-gear-rotate"></div>
    <div class="gear-layer geode-gear-rotate-reverse"></div>
    <div class="gear-layer geode-gear-rotate geode-var-2"></div>
  </div>
</div>
```

### Catacombs (Downstairs)

```html
<!-- Catacombs -->
<div class="geode-catacombs">
  <!-- The Examiner -->
  <div class="npc-examiner"
       data-geode-sprite="/sprites/examiner.png"
       data-geode-preset="seated">
  </div>
  
  <!-- The Crone -->
  <div class="npc-crone"
       data-geode-sprite="/sprites/crone.png"
       data-geode-preset="seated">
  </div>
  
  <!-- Charon (on underground river) -->
  <div class="npc-charon"
       data-geode-sprite="/sprites/charon.png"
       data-geode-preset="standing">
  </div>
  
  <!-- Underground river -->
  <div class="underground-river geode-water-flow"></div>
  
  <!-- Glow fish in the river -->
  <div class="critter-glow-fish"
       data-geode-sprite="/sprites/glow_fish.png"
       data-geode-preset="waterCritter"
       data-geode-wander
       data-wander-speed="0.8"
       data-wander-bounds='{"x":0,"y":300,"width":800,"height":80}'>
  </div>
  
  <!-- Bats hanging from ceiling -->
  <div class="bat geode-idle-sway" style="top: 20px; left: 100px;"></div>
  <div class="bat geode-idle-sway geode-var-3" style="top: 15px; left: 250px;"></div>
  <div class="bat geode-idle-sway geode-var-5" style="top: 25px; left: 400px;"></div>
  
  <!-- Glowworms on ceiling -->
  <div class="glowworm geode-glowworm-wave" style="top: 10px; left: 150px;"></div>
  <div class="glowworm geode-glowworm-wave geode-var-2" style="top: 12px; left: 300px;"></div>
  <div class="glowworm geode-glowworm-wave geode-var-4" style="top: 8px; left: 450px;"></div>
  <div class="glowworm geode-glowworm-wave geode-var-6" style="top: 15px; left: 600px;"></div>
  
  <!-- Ash the dragon kitten (guards catacomb entrance, eyes glow) -->
  <div class="critter-dragon-kitten"
       data-geode-sprite="/sprites/dragon_kitten_ash.png"
       data-geode-preset="dragonKitten">
  </div>
  
  <!-- Catacomb mouse -->
  <div class="critter-catacomb-mouse"
       data-geode-sprite="/sprites/catacomb_mouse.png"
       data-geode-preset="small"
       data-geode-wander
       data-wander-speed="1.0"
       data-wander-bounds='{"x":0,"y":100,"width":800,"height":300}'>
  </div>
  
  <!-- Fog -->
  <div class="catacomb-fog geode-fog-drift"></div>
  <div class="catacomb-fog geode-fog-drift geode-var-4"></div>
  
  <!-- Sconce flames (fewer, darker) -->
  <div class="sconce-flame geode-flame-flicker" style="left: 100px; top: 150px; filter: brightness(0.7);"></div>
  <div class="sconce-flame geode-flame-flicker geode-var-3" style="left: 400px; top: 150px; filter: brightness(0.7);"></div>
</div>
```

---

## ZONE-SPECIFIC ELEMENTS

### Campgrounds

```html
<div class="geode-campgrounds">
  <!-- The Gardener NPC -->
  <div class="npc-gardener"
       data-geode-sprite="/sprites/gardener.png"
       data-geode-preset="standing"
       data-geode-wander
       data-wander-speed="0.3"
       data-wander-bounds='{"x":0,"y":0,"width":800,"height":400}'>
  </div>
  
  <!-- Charles the Chameleon Druid (blends with environment) -->
  <div class="npc-charles"
       data-geode-sprite="/sprites/charles.png"
       data-geode-preset="standing"
       data-geode-wander
       data-wander-speed="0.4"
       data-wander-bounds='{"x":0,"y":0,"width":800,"height":400}'>
  </div>
  
  <!-- Ents -->
  <div class="ent geode-breathe" style="left: 100px; top: 50px;"></div>
  <div class="ent geode-breathe geode-var-3" style="left: 500px; top: 100px;"></div>
  
  <!-- Hedgehogs -->
  <div class="critter-hedgehog"
       data-geode-sprite="/sprites/hedgehog.png"
       data-geode-preset="small"
       data-geode-wander
       data-wander-speed="0.2"
       data-avoid-player="true"
       data-wander-bounds='{"x":0,"y":200,"width":800,"height":200}'>
  </div>
  
  <!-- Dragonflies -->
  <div class="critter-dragonfly geode-wing-flap"
       data-geode-wander
       data-wander-speed="2.0"
       data-wander-bounds='{"x":0,"y":0,"width":800,"height":300}'>
  </div>
  
  <!-- Floating pollen -->
  <canvas data-geode-particles="pollen" 
          data-emitter-x="400" data-emitter-y="200"
          width="800" height="400"></canvas>
  
  <!-- Falling leaves -->
  <div class="leaf geode-leaf-fall" style="left: 200px;"></div>
  <div class="leaf geode-leaf-fall geode-var-2" style="left: 400px;"></div>
  <div class="leaf geode-leaf-fall geode-var-4" style="left: 600px;"></div>
  
  <!-- Dew sprites on leaves -->
  <div class="dew-sprite geode-float"></div>
  <div class="dew-sprite geode-float geode-var-3"></div>
  
  <!-- Windmill in background -->
  <div class="windmill-blade geode-gear-rotate"></div>
</div>
```

### Fae Kingdom

```html
<div class="geode-fae-kingdom">
  <!-- Seelie King -->
  <div class="npc-seelie-king"
       data-geode-sprite="/sprites/seelie_king.png"
       data-geode-preset="seated">
  </div>
  
  <!-- Seelie Queen (walks among flowers) -->
  <div class="npc-seelie-queen"
       data-geode-sprite="/sprites/seelie_queen.png"
       data-geode-preset="standing"
       data-geode-wander
       data-wander-speed="0.3"
       data-wander-bounds='{"x":0,"y":0,"width":800,"height":400}'>
  </div>
  
  <!-- Unseelie King -->
  <div class="npc-unseelie-king"
       data-geode-sprite="/sprites/unseelie_king.png"
       data-geode-preset="seated">
  </div>
  
  <!-- Queen of Roots -->
  <div class="npc-queen-roots geode-root-pulse"
       data-geode-sprite="/sprites/queen_roots.png"
       data-geode-preset="standing">
  </div>
  
  <!-- Pixies -->
  <div class="critter-pixie geode-hover"
       data-geode-sprite="/sprites/pixie.png"
       data-geode-preset="pixie"
       data-geode-wander
       data-wander-speed="1.5"
       data-wander-bounds='{"x":0,"y":0,"width":800,"height":400}'>
  </div>
  
  <!-- Root sprites -->
  <div class="root-sprite geode-root-pulse"></div>
  <div class="root-sprite geode-root-pulse geode-var-3"></div>
  
  <!-- Mushroom glow -->
  <div class="mushroom-glow geode-glowworm-wave" style="left: 100px; top: 300px;"></div>
  <div class="mushroom-glow geode-glowworm-wave geode-var-2" style="left: 200px; top: 320px;"></div>
  
  <!-- Crystal spider -->
  <div class="critter-crystal-spider"
       data-geode-sprite="/sprites/crystal_spider.png"
       data-geode-preset="small"
       data-geode-wander
       data-wander-speed="0.2"
       data-wander-bounds='{"x":100,"y":100,"width":300,"height":200}'>
  </div>
  
  <!-- Sparkles near magical NPCs -->
  <canvas data-geode-particles="sparkles" 
          data-emitter-x="200" data-emitter-y="200"
          width="400" height="400"></canvas>
</div>
```

### Water Zone

```html
<div class="geode-water-zone">
  <!-- The Siren -->
  <div class="npc-siren"
       data-geode-sprite="/sprites/siren.png"
       data-geode-preset="standing">
  </div>
  
  <!-- Water surface -->
  <div class="water-surface geode-wave-surface"></div>
  
  <!-- Lantern jellyfish -->
  <div class="jellyfish geode-float" style="left: 200px; top: 200px;"></div>
  <div class="jellyfish geode-float geode-var-2" style="left: 400px; top: 250px;"></div>
  <div class="jellyfish geode-float geode-var-4" style="left: 600px; top: 180px;"></div>
  
  <!-- Water striders -->
  <div class="water-strider geode-walk-bounce"
       data-geode-wander
       data-wander-speed="0.6"
       data-wander-bounds='{"x":0,"y":100,"width":800,"height":50}'>
  </div>
  
  <!-- Pearl crabs -->
  <div class="pearl-crab"
       data-geode-sprite="/sprites/pearl_crab.png"
       data-geode-preset="small"
       data-geode-wander
       data-wander-speed="0.4"
       data-avoid-player="true"
       data-wander-bounds='{"x":0,"y":300,"width":800,"height":100}'>
  </div>
  
  <!-- Reed frogs (croak at 42Hz) -->
  <div class="reed-frog geode-breathe" style="left: 50px; top: 180px;"></div>
  <div class="reed-frog geode-breathe geode-var-3" style="left: 300px; top: 170px;"></div>
  
  <!-- Water ripples -->
  <div class="water-ripple geode-water-ripple"></div>
  <div class="water-ripple geode-water-ripple geode-var-4"></div>
  
  <!-- Bioluminescence -->
  <div class="bioluminescence geode-pulse-42hz"></div>
</div>
```

### Norse Zone

```html
<div class="geode-norse">
  <!-- Hel on frozen-root throne -->
  <div class="npc-hel"
       data-geode-sprite="/sprites/hel.png"
       data-geode-preset="seated">
  </div>
  
  <!-- The Vanir (Freyr and Freyja) -->
  <div class="npc-vanir"
       data-geode-sprite="/sprites/vanir.png"
       data-geode-preset="standing">
  </div>
  
  <!-- The Shifting Man at the crossroads -->
  <div class="npc-shifting-man"
       data-geode-sprite="/sprites/shifting_man.png"
       data-geode-preset="standing">
  </div>
  
  <!-- Snow -->
  <canvas data-geode-particles="snow" 
          data-emitter-x="400" data-emitter-y="0"
          width="800" height="600"></canvas>
  
  <!-- Frost spreading from Hel's throne -->
  <div class="frost-pattern geode-frost-spread" style="left: 200px; top: 200px;"></div>
  
  <!-- Bats / ravens in rafters -->
  <div class="raven geode-hover" style="left: 100px; top: 50px;"></div>
  <div class="raven geode-hover geode-var-4" style="left: 600px; top: 30px;"></div>
</div>
```

### Camelot Zone

```html
<div class="geode-camelot">
  <!-- Madame Mim (mid-transformation) -->
  <div class="npc-madame-mim"
       data-geode-sprite="/sprites/madame_mim.png"
       data-geode-preset="standing">
  </div>
  
  <!-- Merlin -->
  <div class="npc-merlin"
       data-geode-sprite="/sprites/merlin.png"
       data-geode-preset="seated">
  </div>
  
  <!-- Archimedes the owl -->
  <div class="npc-archimedes geode-hover"
       data-geode-sprite="/sprites/archimedes.png"
       data-geode-preset="small"
       data-geode-wander
       data-wander-speed="0.8"
       data-wander-bounds='{"x":100,"y":50,"width":400,"height":200}'>
  </div>
  
  <!-- Cauldron smoke (shapes shift) -->
  <canvas data-geode-particles="smoke" 
          data-emitter-x="300" data-emitter-y="200"
          width="600" height="400"></canvas>
  
  <!-- Candle flames -->
  <div class="candle geode-candle-flicker"></div>
  <div class="candle geode-candle-flicker geode-var-3"></div>
</div>
```

### Meadery (Canopy City)

```html
<div class="geode-meadery">
  <!-- Thorin -->
  <div class="npc-thorin"
       data-geode-sprite="/sprites/thorin.png"
       data-geode-preset="standing">
  </div>
  
  <!-- Marijke -->
  <div class="npc-marijke"
       data-geode-sprite="/sprites/marijke.png"
       data-geode-preset="standing"
       data-geode-wander
       data-wander-speed="0.3"
       data-wander-bounds='{"x":0,"y":100,"width":600,"height":200}'>
  </div>
  
  <!-- Mead pouring effect -->
  <div class="mead-pour geode-wave-surface"></div>
  
  <!-- Cinder the dragon kitten (climbs everything) -->
  <div class="critter-dragon-kitten geode-wing-flap"
       data-geode-sprite="/sprites/dragon_kitten_cinder.png"
       data-geode-preset="dragonKitten"
       data-geode-wander
       data-wander-speed="1.0"
       data-wander-bounds='{"x":0,"y":0,"width":600,"height":400}'>
  </div>
  
  <!-- Leaves falling from canopy -->
  <div class="leaf geode-leaf-fall" style="left: 100px;"></div>
  <div class="leaf geode-leaf-fall geode-var-3" style="left: 300px;"></div>
  <div class="leaf geode-leaf-fall geode-var-6" style="left: 500px;"></div>
</div>
```

### Coastal Zone

```html
<div class="geode-coast">
  <!-- The Pirate (Inigo, post-quest) -->
  <div class="npc-pirate"
       data-geode-sprite="/sprites/pirate.png"
       data-geode-preset="seated">
  </div>
  
  <!-- Water surface -->
  <div class="ocean-surface geode-wave-surface"></div>
  
  <!-- Water ripples -->
  <div class="water-ripple geode-water-ripple"></div>
  
  <!-- Moths near lantern -->
  <div class="moth geode-hover" style="left: 200px; top: 100px;"></div>
  <div class="moth geode-hover geode-var-2" style="left: 220px; top: 110px;"></div>
</div>
```

### Gorgon's Garden

```html
<div class="geode-gorgon-garden">
  <!-- Medusa -->
  <div class="npc-medusa"
       data-geode-sprite="/sprites/medusa.png"
       data-geode-preset="standing"
       data-geode-wander
       data-wander-speed="0.3"
       data-wander-bounds='{"x":0,"y":0,"width":800,"height":400}'>
  </div>
  
  <!-- Garden beetles -->
  <div class="critter-beetle"
       data-geode-sprite="/sprites/garden_beetle.png"
       data-geode-preset="small"
       data-geode-wander
       data-wander-speed="0.3"
       data-wander-bounds='{"x":0,"y":100,"width":800,"height":300}'>
  </div>
  
  <!-- Pollen -->
  <canvas data-geode-particles="pollen" 
          data-emitter-x="400" data-emitter-y="300"
          width="800" height="400"></canvas>
  
  <!-- Stone snails -->
  <div class="critter-stone-snail geode-breathe"
       data-geode-sprite="/sprites/stone_snail.png"
       data-geode-preset="small"
       data-geode-wander
       data-wander-speed="0.05"
       data-wander-bounds='{"x":0,"y":200,"width":800,"height":200}'>
  </div>
</div>
```

### Greek Underworld

```html
<div class="geode-greek-underworld">
  <!-- Persephone -->
  <div class="npc-persephone"
       data-geode-sprite="/sprites/persephone.png"
       data-geode-preset="standing"
       data-geode-wander
       data-wander-speed="0.3"
       data-wander-bounds='{"x":0,"y":0,"width":800,"height":400}'>
  </div>
  
  <!-- Hades on throne -->
  <div class="npc-hades"
       data-geode-sprite="/sprites/hades.png"
       data-geode-preset="seated">
  </div>
  
  <!-- Cerberus (three heads, one always awake) -->
  <div class="cerberus"
       data-geode-sprite="/sprites/cerberus.png"
       data-geode-preset="standing">
  </div>
</div>
```

---

## THE PULSE LINE (All Zones)

The Pulse Line is always at the bottom of the screen, across all zones. It shifts between three modes:

```html
<!-- Pulse Line — included on every page -->
<div class="geode-pulse-line"></div>
```

Mode switching via JavaScript:
```javascript
// Living mode (default, 42Hz)
setGeodeMode('living');

// Shadow Inn mode (84Hz)
setGeodeMode('shadow');

// In-Between mode (shifting)
setGeodeMode('in-between');
```

---

## SPRITE SHEET REQUIREMENTS

Each sprite sheet needs the following dimensions (per the presets in the animation engine):

| Character Type | Frame Size | Total Frames | Sheet Size |
|----------------|-----------|---------------|------------|
| Seated NPC | 96×96px | ~24 (4 animations × 6 avg) | 576×384px |
| Standing NPC | 96×96px | ~22 (4 animations × 5.5 avg) | 528×384px |
| Small NPC | 64×64px | ~16 (4 animations × 4) | 256×256px |
| Dragon Kitten | 48×48px | ~15 (4 animations × 3.75) | 225×192px |
| Gargoyle Puppy | 48×48px | ~11 (4 animations × 2.75) | 192×192px |
| Fizgig | 32×32px | ~14 (4 animations × 3.5) | 128×128px |
| Brownie | 32×32px | ~14 (4 animations × 3.5) | 128×128px |
| Pixie | 24×24px | ~12 (3 animations × 4) | 96×72px |
| Water Critter | 24×24px | ~12 (3 animations × 4) | 96×72px |

All sprite sheets should use transparent PNG format.

---

## IMPLEMENTATION PRIORITY

The builder should implement in this order:

1. **Main floor page** with hearth, bar, library, market, workshop, common room — all Tier 1 elements
2. **CSS animations** for fire, light, smoke, dust, fog
3. **Sprite placeholders** for all NPCs and critters (use colored rectangles initially)
4. **Wander AI** for critters that roam
5. **Pulse Line** at bottom of screen
6. **Navigation** between zones (clicking on doors/stairs/portals)
7. **Zone pages** — catacombs, cosmology, Fae Kingdom, etc.
8. **Particle systems** on canvas elements
9. **Mode switching** (Living/Shadow/In-Between)
10. **Replace placeholders** with actual sprite sheets as they arrive

---

## NOTES FOR THE BUILDER

- The Inn's visual frame is Celtic knotwork gold-on-dark-stone for ALL screens, menus, and portraits
- Loading screen: fizgigs in overalls wiring the world
- Background music: low-dub classical at 50 BPM
- All NPC dialogue should use the tabletop questline narrative voice (clever, direct, foreshadowing)
- The Pulse Line is the unifying UI element across all three game modes
- Refer to characters by name/title only — avoid gendered pronouns in any text
- Celebrity features are softened — evoke presence through posture and costume
