/* ============================================================
   GEODE INN — ANIMATION ENGINE
   Complete CSS + JS movement system for all 207 animated elements
   
   Tier 1: Main floor life (dragon kittens, gargoyles, fizgigs, fire, smoke)
   Tier 2: Zone-specific creatures and environmental effects
   Tier 3: Polish (weather, advanced particles, seasonal)
   ============================================================ */

/* ============================================================
   PART 1: CSS KEYFRAME ANIMATIONS
   ============================================================ */

/* --- FIRE & LIGHT --- */

@keyframes geode-flame-flicker {
  0%, 100% { transform: scaleY(1) scaleX(1); opacity: 0.9; filter: brightness(1); }
  25% { transform: scaleY(1.15) scaleX(0.95); opacity: 1; filter: brightness(1.2); }
  50% { transform: scaleY(0.95) scaleX(1.05); opacity: 0.85; filter: brightness(0.95); }
  75% { transform: scaleY(1.1) scaleX(0.98); opacity: 1; filter: brightness(1.15); }
}

@keyframes geode-flame-sway {
  0%, 100% { transform: rotate(-2deg) scaleY(1); }
  33% { transform: rotate(1deg) scaleY(1.05); }
  66% { transform: rotate(-1deg) scaleY(0.98); }
}

@keyframes geode-candle-flicker {
  0%, 100% { opacity: 0.9; transform: scale(1); box-shadow: 0 0 8px 2px rgba(255,180,80,0.6); }
  20% { opacity: 1; transform: scale(1.08); box-shadow: 0 0 12px 4px rgba(255,200,100,0.8); }
  40% { opacity: 0.85; transform: scale(0.96); box-shadow: 0 0 6px 1px rgba(255,160,60,0.5); }
  60% { opacity: 1; transform: scale(1.04); box-shadow: 0 0 10px 3px rgba(255,190,90,0.7); }
  80% { opacity: 0.92; transform: scale(0.99); box-shadow: 0 0 7px 2px rgba(255,170,70,0.55); }
}

@keyframes geode-lantern-sway {
  0%, 100% { transform: rotate(-3deg); }
  50% { transform: rotate(3deg); }
}

@keyframes geode-star-twinkle {
  0%, 100% { opacity: 0.3; transform: scale(0.8); }
  50% { opacity: 1; transform: scale(1.2); }
}

@keyframes geode-glowworm-wave {
  0%, 100% { opacity: 0.2; }
  50% { opacity: 0.9; }
}

/* --- WATER & LIQUID --- */

@keyframes geode-water-ripple {
  0% { transform: scale(0); opacity: 0.8; }
  100% { transform: scale(3); opacity: 0; }
}

@keyframes geode-water-flow {
  0% { background-position: 0 0; }
  100% { background-position: -200px 0; }
}

@keyframes geode-wave-surface {
  0%, 100% { transform: translateY(0) skewX(0deg); }
  25% { transform: translateY(-2px) skewX(1deg); }
  50% { transform: translateY(1px) skewX(-1deg); }
  75% { transform: translateY(-1px) skewX(0.5deg); }
}

@keyframes geode-bubble-rise {
  0% { transform: translateY(0) scale(0.5); opacity: 0; }
  10% { opacity: 0.8; }
  90% { opacity: 0.8; }
  100% { transform: translateY(-80px) scale(1); opacity: 0; }
}

/* --- ORGANIC GROWTH --- */

@keyframes geode-vine-grow {
  0% { transform: scaleY(0); transform-origin: top; }
  100% { transform: scaleY(1); transform-origin: top; }
}

@keyframes geode-leaf-unfurl {
  0% { transform: scale(0) rotate(0deg); opacity: 0; }
  60% { opacity: 0.8; }
  100% { transform: scale(1) rotate(5deg); opacity: 1; }
}

@keyframes geode-flower-bloom {
  0% { transform: scale(0); }
  60% { transform: scale(1.1); }
  100% { transform: scale(1); }
}

@keyframes geode-petal-close {
  0% { transform: scale(1); }
  100% { transform: scale(0.3); }
}

@keyframes geode-leaf-fall {
  0% { transform: translate(0, 0) rotate(0deg); opacity: 1; }
  50% { transform: translate(15px, 50vh) rotate(180deg); opacity: 0.8; }
  100% { transform: translate(-10px, 100vh) rotate(360deg); opacity: 0; }
}

@keyframes geode-root-pulse {
  0%, 100% { filter: brightness(0.8) drop-shadow(0 0 4px rgba(255,180,60,0.3)); }
  50% { filter: brightness(1.3) drop-shadow(0 0 12px rgba(255,180,60,0.7)); }
}

/* --- MECHANICAL --- */

@keyframes geode-gear-rotate {
  from { transform: rotate(0deg); }
  to { transform: rotate(360deg); }
}

@keyframes geode-gear-rotate-reverse {
  from { transform: rotate(0deg); }
  to { transform: rotate(-360deg); }
}

@keyframes geode-pulley-move {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(20px); }
}

@keyframes geode-bellows-pump {
  0%, 100% { transform: scaleX(1); }
  50% { transform: scaleX(0.7); }
}

@keyframes geode-press-stamp {
  0%, 80%, 100% { transform: translateY(0); }
  85% { transform: translateY(-5px); }
  90% { transform: translateY(0); }
}

/* --- ATMOSPHERIC --- */

@keyframes geode-fog-drift {
  0% { transform: translateX(-20%); opacity: 0; }
  20% { opacity: 0.5; }
  80% { opacity: 0.5; }
  100% { transform: translateX(120%); opacity: 0; }
}

@keyframes geode-dust-mote {
  0% { transform: translate(0, 0) scale(0.5); opacity: 0; }
  20% { opacity: 0.6; }
  80% { opacity: 0.6; }
  100% { transform: translate(30px, -40px) scale(1); opacity: 0; }
}

@keyframes geode-smoke-rise {
  0% { transform: translateY(0) scale(0.8); opacity: 0.7; }
  100% { transform: translateY(-60px) scale(1.5); opacity: 0; }
}

@keyframes geode-smoke-shape {
  0% { border-radius: 50%; transform: scale(1) rotate(0deg); }
  33% { border-radius: 40% 60% 50% 50%; transform: scale(1.2) rotate(120deg); }
  66% { border-radius: 60% 40% 50% 50%; transform: scale(1.4) rotate(240deg); }
  100% { border-radius: 50%; transform: scale(1.6) rotate(360deg); opacity: 0; }
}

@keyframes geode-snow-fall {
  0% { transform: translate(0, -10px) rotate(0deg); opacity: 0.8; }
  100% { transform: translate(20px, 100vh) rotate(360deg); opacity: 0.4; }
}

@keyframes geode-frost-spread {
  0% { transform: scale(0); opacity: 0; }
  100% { transform: scale(1); opacity: 0.7; }
}

@keyframes geode-aurora-shift {
  0%, 100% { transform: translateX(0) skewX(0deg); opacity: 0.3; }
  50% { transform: translateX(30px) skewX(5deg); opacity: 0.6; }
}

/* --- LIVING CREATURES --- */

@keyframes geode-breathe {
  0%, 100% { transform: scale(1); }
  50% { transform: scale(1.03); }
}

@keyframes geode-idle-sway {
  0%, 100% { transform: rotate(-1deg); }
  50% { transform: rotate(1deg); }
}

@keyframes geode-float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-8px); }
}

@keyframes geode-hover {
  0%, 100% { transform: translateY(0) rotate(-2deg); }
  33% { transform: translateY(-5px) rotate(1deg); }
  66% { transform: translateY(-3px) rotate(-1deg); }
}

@keyframes geode-walk-bounce {
  0%, 100% { transform: translateY(0) rotate(-1deg); }
  25% { transform: translateY(-3px) rotate(1deg); }
  50% { transform: translateY(0) rotate(-1deg); }
  75% { transform: translateY(-2px) rotate(1deg); }
}

@keyframes geode-tail-wag {
  0%, 100% { transform: rotate(-15deg); }
  50% { transform: rotate(15deg); }
}

@keyframes geode-wing-flap {
  0%, 100% { transform: scaleY(1) scaleX(1); }
  50% { transform: scaleY(0.6) scaleX(1.1); }
}

@keyframes geode-ear-flick {
  0%, 90%, 100% { transform: rotate(0deg); }
  93% { transform: rotate(15deg); }
  96% { transform: rotate(-10deg); }
}

@keyframes geode-head-tilt {
  0%, 85%, 100% { transform: rotate(0deg); }
  90% { transform: rotate(8deg); }
  95% { transform: rotate(-5deg); }
}

@keyframes geode-eye-blink {
  0%, 90%, 100% { transform: scaleY(1); }
  93% { transform: scaleY(0.1); }
}

/* --- THE PULSE LINE --- */

@keyframes geode-pulse-42hz {
  0%, 100% { transform: scaleY(0.3); }
  50% { transform: scaleY(1); }
  /* 42Hz visual: 42BPM = 1.43s per cycle */
}

@keyframes geode-pulse-84hz {
  0%, 100% { transform: scaleY(0.3); }
  50% { transform: scaleY(1); }
  /* 84Hz visual: 84BPM = 0.71s per cycle — double speed */
}

@keyframes geode-pulse-shift {
  /* In-Between mode: shifts between 42Hz and 84Hz */
  0% { animation-duration: 1.43s; }
  50% { animation-duration: 0.71s; }
  100% { animation-duration: 1.43s; }
}

/* --- SHADOW INN STATE TRANSITIONS --- */

@keyframes geode-shadow-shift {
  0% { filter: brightness(1) hue-rotate(0deg); }
  50% { filter: brightness(0.6) hue-rotate(-20deg) contrast(1.3); }
  100% { filter: brightness(0.5) hue-rotate(-30deg) contrast(1.5) saturate(0.7); }
}

@keyframes geode-petrify {
  0% { filter: brightness(1) saturate(1); transform: scale(1); }
  100% { filter: brightness(0.6) saturate(0.3) sepia(0.4); transform: scale(0.98); }
}

/* ============================================================
   PART 2: CSS UTILITY CLASSES
   ============================================================ */

.geode-flame-flicker {
  animation: geode-flame-flicker 0.3s ease-in-out infinite, geode-flame-sway 2s ease-in-out infinite;
  transform-origin: bottom center;
}

.geode-candle-flicker {
  animation: geode-candle-flicker 0.15s ease-in-out infinite;
  transform-origin: bottom center;
}

.geode-lantern-sway {
  animation: geode-lantern-sway 3s ease-in-out infinite;
  transform-origin: top center;
}

.geode-star-twinkle {
  animation: geode-star-twinkle 3s ease-in-out infinite;
}

.geode-glowworm-wave {
  animation: geode-glowworm-wave 4s ease-in-out infinite;
}

.geode-gear-rotate {
  animation: geode-gear-rotate 10s linear infinite;
}

.geode-gear-rotate-reverse {
  animation: geode-gear-rotate-reverse 8s linear infinite;
}

.geode-bellows-pump {
  animation: geode-bellows-pump 1.5s ease-in-out infinite;
}

.geode-press-stamp {
  animation: geode-press-stamp 4s ease-in-out infinite;
}

.geode-fog-drift {
  animation: geode-fog-drift 20s linear infinite;
  opacity: 0;
}

.geode-breathe {
  animation: geode-breathe 3s ease-in-out infinite;
}

.geode-idle-sway {
  animation: geode-idle-sway 4s ease-in-out infinite;
}

.geode-float {
  animation: geode-float 3s ease-in-out infinite;
}

.geode-hover {
  animation: geode-hover 2s ease-in-out infinite;
}

.geode-walk-bounce {
  animation: geode-walk-bounce 0.5s ease-in-out infinite;
}

.geode-tail-wag {
  animation: geode-tail-wag 0.5s ease-in-out infinite;
  transform-origin: top center;
}

.geode-wing-flap {
  animation: geode-wing-flap 0.15s ease-in-out infinite;
  transform-origin: center top;
}

.geode-ear-flick {
  animation: geode-ear-flick 4s ease-in-out infinite;
}

.geode-head-tilt {
  animation: geode-head-tilt 5s ease-in-out infinite;
}

.geode-eye-blink {
  animation: geode-eye-blink 4s ease-in-out infinite;
  transform-origin: center;
}

.geode-root-pulse {
  animation: geode-root-pulse 1.43s ease-in-out infinite;
}

.geode-vine-grow {
  animation: geode-vine-grow 10s ease-out forwards;
}

.geode-leaf-fall {
  animation: geode-leaf-fall 8s linear infinite;
}

.geode-snow-fall {
  animation: geode-snow-fall 6s linear infinite;
}

.geode-aurora-shift {
  animation: geode-aurora-shift 15s ease-in-out infinite;
}

.geode-frost-spread {
  animation: geode-frost-spread 5s ease-out forwards;
}

.geode-petrify {
  animation: geode-petrify 2s ease-out forwards;
}

.geode-shadow-shift {
  animation: geode-shadow-shift 3s ease-in-out forwards;
}

/* The Pulse Line — always present at bottom of screen */
.geode-pulse-line {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  height: 3px;
  background: linear-gradient(90deg, transparent, rgba(255,180,60,0.8), transparent);
  animation: geode-pulse-42hz 1.43s ease-in-out infinite;
  z-index: 9999;
  pointer-events: none;
}

.geode-pulse-line.shadow-mode {
  animation: geode-pulse-84hz 0.71s ease-in-out infinite;
  background: linear-gradient(90deg, transparent, rgba(140,140,160,0.9), transparent);
}

.geode-pulse-line.in-between {
  animation: geode-pulse-42hz 1.43s ease-in-out infinite, geode-pulse-shift 10s ease-in-out infinite;
}

/* Natural variation helper — apply to multiple instances of same animation */
.geode-var-1 { animation-delay: -0.3s; }
.geode-var-2 { animation-delay: -0.7s; }
.geode-var-3 { animation-delay: -1.1s; }
.geode-var-4 { animation-delay: -1.5s; }
.geode-var-5 { animation-delay: -2.0s; }
.geode-var-6 { animation-delay: -2.5s; }
.geode-var-7 { animation-delay: -3.1s; }
.geode-var-8 { animation-delay: -3.7s; }

/* Speed variations */
.geode-speed-slow { animation-duration: calc(var(--geode-speed, 1s) * 1.5); }
.geode-speed-fast { animation-duration: calc(var(--geode-speed, 1s) * 0.7); }

/* ============================================================
   PART 3: JAVASCRIPT PARTICLE SYSTEM
   ============================================================ */

class GeodeParticleSystem {
  constructor(canvas, options = {}) {
    this.canvas = canvas;
    this.ctx = canvas.getContext('2d');
    this.particles = [];
    this.config = {
      maxParticles: options.maxParticles || 50,
      emissionRate: options.emissionRate || 2,
      particleLife: options.particleLife || 60,
      gravity: options.gravity || 0,
      drift: options.drift || 0,
      colors: options.colors || ['rgba(255, 180, 80, 0.6)'],
      minSize: options.minSize || 1,
      maxSize: options.maxSize || 3,
      minSpeed: options.minSpeed || 0.2,
      maxSpeed: options.maxSpeed || 0.8,
      spread: options.spread || Math.PI / 4,
      direction: options.direction || -Math.PI / 2, // upward by default
      ...options
    };
    this.running = false;
    this.frameId = null;
  }

  emit(x, y) {
    if (this.particles.length >= this.config.maxParticles) return;
    
    const angle = this.config.direction + (Math.random() - 0.5) * this.config.spread;
    const speed = this.config.minSpeed + Math.random() * (this.config.maxSpeed - this.config.minSpeed);
    
    this.particles.push({
      x, y,
      vx: Math.cos(angle) * speed,
      vy: Math.sin(angle) * speed,
      life: this.config.particleLife,
      maxLife: this.config.particleLife,
      size: this.config.minSize + Math.random() * (this.config.maxSize - this.config.minSize),
      color: this.config.colors[Math.floor(Math.random() * this.config.colors.length)],
      rotation: Math.random() * Math.PI * 2,
      rotationSpeed: (Math.random() - 0.5) * 0.1
    });
  }

  update() {
    for (let i = this.particles.length - 1; i >= 0; i--) {
      const p = this.particles[i];
      p.x += p.vx + this.config.drift * Math.sin(p.life * 0.05);
      p.y += p.vy;
      p.vy += this.config.gravity;
      p.life--;
      p.rotation += p.rotationSpeed;
      
      if (p.life <= 0) {
        this.particles.splice(i, 1);
      }
    }
  }

  render() {
    this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
    
    for (const p of this.particles) {
      const alpha = p.life / p.maxLife;
      this.ctx.save();
      this.ctx.globalAlpha = alpha;
      this.ctx.fillStyle = p.color;
      this.ctx.translate(p.x, p.y);
      this.ctx.rotate(p.rotation);
      
      if (p.size < 2) {
        this.ctx.fillRect(-p.size/2, -p.size/2, p.size, p.size);
      } else {
        this.ctx.beginPath();
        this.ctx.arc(0, 0, p.size, 0, Math.PI * 2);
        this.ctx.fill();
      }
      
      this.ctx.restore();
    }
  }

  start(emitterX, emitterY) {
    if (this.running) return;
    this.running = true;
    
    const loop = () => {
      if (!this.running) return;
      
      for (let i = 0; i < this.config.emissionRate; i++) {
        this.emit(emitterX, emitterY);
      }
      
      this.update();
      this.render();
      this.frameId = requestAnimationFrame(loop);
    };
    
    loop();
  }

  stop() {
    this.running = false;
    if (this.frameId) cancelAnimationFrame(this.frameId);
  }
}

/* ============================================================
   PARTICLE SYSTEM PRESETS
   ============================================================ */

// Ember particles — rising from fire sources
const GeodeEmbers = (canvas, x, y) => new GeodeParticleSystem(canvas, {
  maxParticles: 30,
  emissionRate: 1,
  particleLife: 80,
  gravity: -0.02, // rise
  drift: 0.3,
  colors: ['rgba(255, 140, 40, 0.8)', 'rgba(255, 100, 20, 0.6)', 'rgba(255, 200, 80, 0.7)'],
  minSize: 1,
  maxSize: 2.5,
  minSpeed: 0.5,
  maxSpeed: 1.2,
  spread: Math.PI / 3,
  direction: -Math.PI / 2
});

// Dust motes — drifting in light shafts
const GeodeDustMotes = (canvas, x, y) => new GeodeParticleSystem(canvas, {
  maxParticles: 40,
  emissionRate: 0.5,
  particleLife: 120,
  gravity: 0,
  drift: 0.5,
  colors: ['rgba(255, 230, 180, 0.4)', 'rgba(255, 210, 160, 0.3)'],
  minSize: 0.5,
  maxSize: 1.5,
  minSpeed: 0.1,
  maxSpeed: 0.4,
  spread: Math.PI,
  direction: 0
});

// Pipe smoke — rising, shape-shifting
const GeodePipeSmoke = (canvas, x, y) => new GeodeParticleSystem(canvas, {
  maxParticles: 20,
  emissionRate: 0.3,
  particleLife: 100,
  gravity: -0.01,
  drift: 0.2,
  colors: ['rgba(200, 200, 210, 0.4)', 'rgba(180, 180, 200, 0.3)'],
  minSize: 3,
  maxSize: 8,
  minSpeed: 0.2,
  maxSpeed: 0.5,
  spread: Math.PI / 6,
  direction: -Math.PI / 2
});

// Sparkles — magical ambient
const GeodeSparkles = (canvas, x, y) => new GeodeParticleSystem(canvas, {
  maxParticles: 15,
  emissionRate: 0.2,
  particleLife: 40,
  gravity: 0,
  drift: 0,
  colors: ['rgba(255, 255, 200, 0.8)', 'rgba(200, 200, 255, 0.6)', 'rgba(255, 220, 180, 0.7)'],
  minSize: 0.5,
  maxSize: 1.5,
  minSpeed: 0.05,
  maxSpeed: 0.2,
  spread: Math.PI * 2,
  direction: 0
});

// Snow particles
const GeodeSnow = (canvas, x, y) => new GeodeParticleSystem(canvas, {
  maxParticles: 60,
  emissionRate: 2,
  particleLife: 150,
  gravity: 0.03,
  drift: 0.5,
  colors: ['rgba(220, 230, 245, 0.7)', 'rgba(200, 210, 230, 0.5)'],
  minSize: 1,
  maxSize: 3,
  minSpeed: 0.3,
  maxSpeed: 0.8,
  spread: Math.PI / 4,
  direction: Math.PI / 2
});

// Rain particles
const GeodeRain = (canvas, x, y) => new GeodeParticleSystem(canvas, {
  maxParticles: 80,
  emissionRate: 4,
  particleLife: 40,
  gravity: 0.15,
  drift: 0.1,
  colors: ['rgba(150, 170, 200, 0.4)'],
  minSize: 0.5,
  maxSize: 1,
  minSpeed: 3,
  maxSpeed: 5,
  spread: 0.1,
  direction: Math.PI / 2
});

// Pollen/seeds — floating
const GeodePollen = (canvas, x, y) => new GeodeParticleSystem(canvas, {
  maxParticles: 25,
  emissionRate: 0.3,
  particleLife: 200,
  gravity: -0.005,
  drift: 1,
  colors: ['rgba(255, 220, 100, 0.5)', 'rgba(255, 240, 180, 0.4)'],
  minSize: 1,
  maxSize: 2.5,
  minSpeed: 0.1,
  maxSpeed: 0.3,
  spread: Math.PI,
  direction: -Math.PI / 4
});

// Sand particles
const GeodeSand = (canvas, x, y) => new GeodeParticleSystem(canvas, {
  maxParticles: 30,
  emissionRate: 1,
  particleLife: 60,
  gravity: 0.05,
  drift: 0.8,
  colors: ['rgba(210, 180, 140, 0.5)', 'rgba(190, 160, 120, 0.4)'],
  minSize: 0.5,
  maxSize: 1.5,
  minSpeed: 0.2,
  maxSpeed: 0.5,
  spread: Math.PI / 6,
  direction: 0
});

/* ============================================================
   PART 4: SPRITE ANIMATION FRAMEWORK
   ============================================================ */

class GeodeSpriteAnimator {
  constructor(element, spriteSheet, config) {
    this.element = element;
    this.spriteSheet = spriteSheet; // URL of sprite sheet image
    this.config = {
      frameWidth: config.frameWidth || 64,
      frameHeight: config.frameHeight || 64,
      animations: config.animations || {},
      defaultAnimation: config.defaultAnimation || 'idle',
      fps: config.fps || 10,
      ...config
    };
    this.currentAnimation = this.config.defaultAnimation;
    this.currentFrame = 0;
    this.frameTimer = 0;
    this.lastTime = 0;
    this.running = false;
    this.frameId = null;
    
    this.element.style.backgroundImage = `url(${spriteSheet})`;
    this.element.style.width = `${this.config.frameWidth}px`;
    this.element.style.height = `${this.config.frameHeight}px`;
    this.element.style.imageRendering = 'pixelated'; // crisp pixels
  }

  play(animationName, options = {}) {
    if (!this.config.animations[animationName]) return;
    this.currentAnimation = animationName;
    this.currentFrame = options.startFrame || 0;
    this.frameTimer = 0;
    this.config.loop = options.loop !== false;
    this.config.onComplete = options.onComplete || null;
  }

  update(deltaTime) {
    const anim = this.config.animations[this.currentAnimation];
    if (!anim) return;
    
    this.frameTimer += deltaTime;
    const frameDuration = 1000 / (anim.fps || this.config.fps);
    
    if (this.frameTimer >= frameDuration) {
      this.frameTimer = 0;
      this.currentFrame++;
      
      if (this.currentFrame >= anim.frames) {
        if (this.config.loop) {
          this.currentFrame = 0;
        } else {
          this.currentFrame = anim.frames - 1;
          if (this.config.onComplete) this.config.onComplete();
          return;
        }
      }
    }
    
    // Update background position
    const row = anim.row || 0;
    this.element.style.backgroundPosition = `-${this.currentFrame * this.config.frameWidth}px -${row * this.config.frameHeight}px`;
  }

  start() {
    if (this.running) return;
    this.running = true;
    this.lastTime = performance.now();
    
    const loop = (time) => {
      if (!this.running) return;
      const deltaTime = time - this.lastTime;
      this.lastTime = time;
      this.update(deltaTime);
      this.frameId = requestAnimationFrame(loop);
    };
    
    this.frameId = requestAnimationFrame(loop);
  }

  stop() {
    this.running = false;
    if (this.frameId) cancelAnimationFrame(this.frameId);
  }
}

/* ============================================================
   SPRITE CONFIGURATION PRESETS
   ============================================================ */

// NPC sprite configurations — each NPC has 4 animation states
const GeodeNPCPresets = {
  // Seated NPCs (Storyteller, Cthulhu, etc.)
  seated: {
    frameWidth: 96,
    frameHeight: 96,
    defaultAnimation: 'idle',
    fps: 8,
    animations: {
      idle: { frames: 6, row: 0, fps: 6, loop: true },      // breathing, slight movement
      gesture: { frames: 8, row: 1, fps: 10, loop: true },   // talking, gesturing
      interact: { frames: 6, row: 2, fps: 10, loop: false }, // specific action
      react: { frames: 4, row: 3, fps: 8, loop: false }      // surprised/engaged
    }
  },
  // Standing NPCs (Odin Wanderer, Gardener, etc.)
  standing: {
    frameWidth: 96,
    frameHeight: 96,
    defaultAnimation: 'idle',
    fps: 8,
    animations: {
      idle: { frames: 4, row: 0, fps: 6, loop: true },
      walk: { frames: 8, row: 1, fps: 10, loop: true },
      interact: { frames: 6, row: 2, fps: 10, loop: false },
      dialogue: { frames: 4, row: 3, fps: 6, loop: true }
    }
  },
  // Small NPCs (Beverley, Ceiling Gnome, etc.)
  small: {
    frameWidth: 64,
    frameHeight: 64,
    defaultAnimation: 'idle',
    fps: 8,
    animations: {
      idle: { frames: 4, row: 0, fps: 6, loop: true },
      walk: { frames: 6, row: 1, fps: 12, loop: true },
      interact: { frames: 4, row: 2, fps: 10, loop: false },
      react: { frames: 2, row: 3, fps: 8, loop: false }
    }
  }
};

// Filler critter configurations
const GeodeCritterPresets = {
  // Dragon kittens (cat-sized dragons)
  dragonKitten: {
    frameWidth: 48,
    frameHeight: 48,
    defaultAnimation: 'idle',
    fps: 10,
    animations: {
      idle: { frames: 4, row: 0, fps: 8, loop: true },      // sitting, breathing
      wander: { frames: 6, row: 1, fps: 10, loop: true },     // walking
      react: { frames: 3, row: 2, fps: 10, loop: false },     // yawn, stretch
      sleep: { frames: 2, row: 3, fps: 4, loop: true }        // curled up
    }
  },
  // Gargoyle puppies (stone creatures)
  gargoylePuppy: {
    frameWidth: 48,
    frameHeight: 48,
    defaultAnimation: 'idle',
    fps: 8,
    animations: {
      idle: { frames: 3, row: 0, fps: 6, loop: true },       // standing, watching
      wander: { frames: 4, row: 1, fps: 8, loop: true },      // waddling
      react: { frames: 2, row: 2, fps: 8, loop: false },      // startled
      sleep: { frames: 2, row: 3, fps: 3, loop: true }        // asleep standing
    }
  },
  // Fizgigs (small workers)
  fizgig: {
    frameWidth: 32,
    frameHeight: 32,
    defaultAnimation: 'idle',
    fps: 12,
    animations: {
      idle: { frames: 2, row: 0, fps: 6, loop: true },
      work: { frames: 6, row: 1, fps: 12, loop: true },       // hammering/wrenching
      run: { frames: 4, row: 2, fps: 14, loop: true },        // scurrying
      react: { frames: 2, row: 3, fps: 8, loop: false }
    }
  },
  // Brownies
  brownie: {
    frameWidth: 32,
    frameHeight: 32,
    defaultAnimation: 'idle',
    fps: 8,
    animations: {
      idle: { frames: 2, row: 0, fps: 4, loop: true },
      work: { frames: 6, row: 1, fps: 10, loop: true },
      walk: { frames: 4, row: 2, fps: 8, loop: true },
      hide: { frames: 2, row: 3, fps: 6, loop: false }        // vanishing
    }
  },
  // Pixies (tiny sprites)
  pixie: {
    frameWidth: 24,
    frameHeight: 24,
    defaultAnimation: 'idle',
    fps: 12,
    animations: {
      idle: { frames: 4, row: 0, fps: 12, loop: true },       // hovering, wing flap
      wander: { frames: 6, row: 1, fps: 12, loop: true },      // flying
      react: { frames: 2, row: 2, fps: 10, loop: false }      // scatter
    }
  },
  // Small water creatures
  waterCritter: {
    frameWidth: 24,
    frameHeight: 24,
    defaultAnimation: 'idle',
    fps: 8,
    animations: {
      idle: { frames: 4, row: 0, fps: 6, loop: true },
      swim: { frames: 6, row: 1, fps: 8, loop: true },
      react: { frames: 2, row: 2, fps: 8, loop: false }
    }
  }
};

/* ============================================================
   PART 5: CREATURE AI / WANDER BEHAVIOR
   ============================================================ */

class GeodeWanderAI {
  constructor(element, config = {}) {
    this.element = element;
    this.config = {
      speed: config.speed || 0.5,
      changeDirection: config.changeDirection || 3000, // ms between direction changes
      bounds: config.bounds || { x: 0, y: 0, width: 800, height: 600 },
      avoidPlayer: config.avoidPlayer || false,
      playerElement: config.playerElement || null,
      reactDistance: config.reactDistance || 80,
      ...config
    };
    
    this.x = parseFloat(element.style.left) || 0;
    this.y = parseFloat(element.style.top) || 0;
    this.direction = Math.random() * Math.PI * 2;
    this.isMoving = true;
    this.lastDirectionChange = 0;
    this.isReacting = false;
    
    this.frameId = null;
    this.running = false;
  }

  start() {
    if (this.running) return;
    this.running = true;
    this.lastTime = performance.now();
    this.lastDirectionChange = performance.now();
    
    const loop = (time) => {
      if (!this.running) return;
      const dt = time - this.lastTime;
      this.lastTime = time;
      this.update(dt, time);
      this.frameId = requestAnimationFrame(loop);
    };
    
    this.frameId = requestAnimationFrame(loop);
  }

  stop() {
    this.running = false;
    if (this.frameId) cancelAnimationFrame(this.frameId);
  }

  update(dt, currentTime) {
    // Check player proximity
    if (this.config.avoidPlayer && this.config.playerElement) {
      const playerRect = this.config.playerElement.getBoundingClientRect();
      const myRect = this.element.getBoundingClientRect();
      const distX = (playerRect.left + playerRect.width/2) - (myRect.left + myRect.width/2);
      const distY = (playerRect.top + playerRect.height/2) - (myRect.top + myRect.height/2);
      const distance = Math.sqrt(distX * distX + distY * distY);
      
      if (distance < this.config.reactDistance) {
        // React: flee or freeze
        this.isReacting = true;
        const fleeAngle = Math.atan2(-distY, -distX);
        this.direction = fleeAngle;
        this.x += Math.cos(fleeAngle) * this.config.speed * 2;
        this.y += Math.sin(fleeAngle) * this.config.speed * 2;
      } else {
        this.isReacting = false;
      }
    }
    
    // Change direction periodically
    if (currentTime - this.lastDirectionChange > this.config.changeDirection && !this.isReacting) {
      this.direction = Math.random() * Math.PI * 2;
      this.lastDirectionChange = currentTime;
      // Occasionally pause
      this.isMoving = Math.random() > 0.3;
    }
    
    // Move
    if (this.isMoving && !this.isReacting) {
      this.x += Math.cos(this.direction) * this.config.speed;
      this.y += Math.sin(this.direction) * this.config.speed;
      
      // Keep in bounds
      this.x = Math.max(this.config.bounds.x, Math.min(this.config.bounds.x + this.config.bounds.width, this.x));
      this.y = Math.max(this.config.bounds.y, Math.min(this.config.bounds.y + this.config.bounds.height, this.y));
    }
    
    // Apply position
    this.element.style.left = `${this.x}px`;
    this.element.style.top = `${this.y}px`;
    
    // Flip sprite based on direction
    if (Math.cos(this.direction) < 0) {
      this.element.style.transform = 'scaleX(-1)';
    } else {
      this.element.style.transform = 'scaleX(1)';
    }
  }
}

/* ============================================================
   PART 6: INITIALIZATION — SET UP ALL ANIMATIONS
   ============================================================ */

function initGeodeAnimations() {
  // --- Initialize particle systems ---
  const particleCanvases = document.querySelectorAll('[data-geode-particles]');
  particleCanvases.forEach(canvas => {
    const type = canvas.dataset.geodeParticles;
    const x = parseInt(canvas.dataset.emitterX) || canvas.width / 2;
    const y = parseInt(canvas.dataset.emitterY) || canvas.height;
    
    let system;
    switch(type) {
      case 'embers': system = GeodeEmbers(canvas, x, y); break;
      case 'dust': system = GeodeDustMotes(canvas, x, y); break;
      case 'smoke': system = GeodePipeSmoke(canvas, x, y); break;
      case 'sparkles': system = GeodeSparkles(canvas, x, y); break;
      case 'snow': system = GeodeSnow(canvas, x, y); break;
      case 'rain': system = GeodeRain(canvas, x, y); break;
      case 'pollen': system = GeodePollen(canvas, x, y); break;
      case 'sand': system = GeodeSand(canvas, x, y); break;
      default: return;
    }
    
    system.start(x, y);
  });
  
  // --- Initialize sprite animations ---
  const sprites = document.querySelectorAll('[data-geode-sprite]');
  sprites.forEach(sprite => {
    const sheet = sprite.dataset.geodeSprite;
    const preset = sprite.dataset.geodePreset;
    const config = GeodeNPCPresets[preset] || GeodeCritterPresets[preset];
    if (!config) return;
    
    const animator = new GeodeSpriteAnimator(sprite, sheet, config);
    animator.start();
    sprite._geodeAnimator = animator; // store reference
  });
  
  // --- Initialize wander AI ---
  const wanderers = document.querySelectorAll('[data-geode-wander]');
  wanderers.forEach(wanderer => {
    const speed = parseFloat(wanderer.dataset.wanderSpeed) || 0.5;
    const bounds = JSON.parse(wanderer.dataset.wanderBounds || '{}');
    const avoidPlayer = wanderer.dataset.avoidPlayer === 'true';
    const playerEl = document.querySelector('[data-player]') || null;
    
    const ai = new GeodeWanderAI(wanderer, {
      speed, bounds, avoidPlayer, playerElement: playerEl
    });
    ai.start();
    wanderer._geodeAI = ai;
  });
  
  // --- Add pulse line to screen ---
  if (!document.querySelector('.geode-pulse-line')) {
    const pulseLine = document.createElement('div');
    pulseLine.className = 'geode-pulse-line';
    document.body.appendChild(pulseLine);
  }
  
  // --- Apply random variation to repeated animations ---
  document.querySelectorAll('.geode-flame-flicker, .geode-candle-flicker, .geode-star-twinkle').forEach((el, i) => {
    el.classList.add(`geode-var-${(i % 8) + 1}`);
  });
}

// Auto-initialize on DOM ready
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initGeodeAnimations);
} else {
  initGeodeAnimations();
}

/* ============================================================
   PART 7: MODE SWITCHING (Living / Shadow / In-Between)
   ============================================================ */

function setGeodeMode(mode) {
  const pulseLine = document.querySelector('.geode-pulse-line');
  document.body.classList.remove('geode-mode-living', 'geode-mode-shadow', 'geode-mode-in-between');
  
  switch(mode) {
    case 'living':
      document.body.classList.add('geode-mode-living');
      if (pulseLine) pulseLine.className = 'geode-pulse-line';
      break;
    case 'shadow':
      document.body.classList.add('geode-mode-shadow');
      if (pulseLine) pulseLine.className = 'geode-pulse-line shadow-mode';
      // Apply petrify/shift to environmental elements
      document.querySelectorAll('[data-geode-element]').forEach(el => {
        el.classList.add('geode-shadow-shift');
      });
      break;
    case 'in-between':
      document.body.classList.add('geode-mode-in-between');
      if (pulseLine) pulseLine.className = 'geode-pulse-line in-between';
      break;
  }
}

// Export for game engine integration
if (typeof module !== 'undefined' && module.exports) {
  module.exports = {
    GeodeParticleSystem,
    GeodeSpriteAnimator,
    GeodeWanderAI,
    GeodeNPCPresets,
    GeodeCritterPresets,
    setGeodeMode,
    initGeodeAnimations
  };
}
