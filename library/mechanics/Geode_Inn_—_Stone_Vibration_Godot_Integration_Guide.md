# GEODE INN — STONE VIBRATION TOUCH SYSTEM
## Godot 4.x Integration Guide

### Overview

This document describes how to integrate the Stone Vibration Touch System into the Geode Inn Godot game engine. The system provides:
1. Per-stone colored SVG rendering (160 stones, 27 crystal habits)
2. Touch/click to play the stone's Mohs vibration frequency
3. Visual vibration animation synced to the frequency
4. Haptic feedback (touch sensory) for mobile devices
5. IEM driver-type differentiation (4 driver types with distinct feedback patterns)

---

### Architecture

```
StoneVibrationSystem (Node)
├── StoneRenderer (Node2D) — renders stone shapes
├── VibrationAudio (Node) — Web Audio / Godot AudioStreamPlayer
├── HapticController (Node) — platform-specific haptic feedback
├── StoneDatabase (Resource) — loaded from manifest.json
└── TouchHandler (Area2D) — input detection per stone
```

---

### 1. Stone Data (manifest.json)

Each stone has:
```json
{
  "file": "Diamond.svg",
  "shape": "octahedron",
  "family": "Diamond",
  "freq": 124.2,
  "mohs": 10,
  "sg": 3.52,
  "iem": "dynamic_driver",
  "cut": "brilliant_round",
  "colors": {
    "p": "#FFFFFF",    // primary color
    "s": "#E0E0E0",    // secondary (shadows/edges)
    "a": "#B0C4DE",    // accent (highlights)
    "gemmy": true,     // transparent/gemmy rendering
    "metallic": false, // metallic sheen
    "iridescent": false // iridescent gradient
  }
}
```

### 2. Visual Vibration (Godot AnimationPlayer)

Each stone's vibration is driven by its frequency:
- Vibration rate = `max(0.05, min(0.5, 1.0 / (freq / 100.0)))` seconds per cycle
- Vibration amplitude = `min(4, max(1, freq / 500.0))` pixels
- Vibration pattern: 4-keyframe translate+rotate loop (non-uniform for organic feel)

Implementation:
```gdscript
func _start_vibration(stone_data):
    var freq = stone_data["freq"]
    var rate = clamp(1.0 / (freq / 100.0), 0.05, 0.5)
    var amp = clamp(freq / 500.0, 1.0, 4.0)
    
    var anim = Animation.new()
    var track_idx = anim.add_track(Animation.TYPE_VALUE)
    anim.track_set_path(track_idx, ":position")
    anim.length = rate
    anim.loop_mode = Animation.LOOP_LINEAR
    
    # 4 keyframes for organic vibration
    anim.track_insert_key(track_idx, 0.0, Vector2.ZERO)
    anim.track_insert_key(track_idx, rate * 0.25, Vector2(amp * 0.3, -amp * 0.5))
    anim.track_insert_key(track_idx, rate * 0.5, Vector2(-amp * 0.2, amp * 0.3))
    anim.track_insert_key(track_idx, rate * 0.75, Vector2(amp * 0.4, amp * 0.2))
    anim.track_insert_key(track_idx, rate, Vector2.ZERO)
    
    $AnimationPlayer.play("vibrate")
```

### 3. Audio Engine (Godot AudioStreamGenerator)

The audio system uses 3 oscillators:
- **Main oscillator** — the stone's frequency (sine wave)
- **42Hz drone** — the Song underneath all stones
- **Sub-harmonic** — for freq > 800Hz, plays freq/4 to ground high tones

Volume scaling by frequency:
- Bone conduction (< 100 Hz): 0.3 gain
- Dynamic driver (100-500 Hz): 0.15 gain
- Balanced armature (500-1000 Hz): 0.08 gain
- Electrostatic (> 1000 Hz): 0.04 gain

Lowpass filter at `max(200, freq * 2)` for warmth.

```gdscript
func _play_stone_tone(stone_data):
    var freq = stone_data["freq"]
    var iem = stone_data["iem"]
    
    # Volume by IEM driver type
    var vol = 0.15
    match iem:
        "bone_conduction": vol = 0.3
        "dynamic_driver": vol = 0.15
        "balanced_armature": vol = 0.08
        "electrostatic": vol = 0.04
    
    # Main tone
    var osc = AudioStreamGenerator.new()
    osc.frequency = freq
    osc.set_volume_db(linear_to_db(vol))
    
    # 42Hz drone
    var drone = AudioStreamGenerator.new()
    drone.frequency = 42.0
    drone.set_volume_db(linear_to_db(0.04))
    
    # Sub-harmonic for high freqs
    if freq > 800:
        var sub = AudioStreamGenerator.new()
        sub.frequency = freq / 4.0
        sub.set_volume_db(linear_to_db(vol * 0.5))
```

### 4. Haptic Feedback (Touch Sensory)

Haptic patterns differ by IEM driver type:

| IEM Driver | Pattern | Feel |
|-----------|---------|------|
| Bone Conduction | `[100,50,100,50,100]` | Deep, slow, strong pulses |
| Dynamic Driver | `[50,30,50,30,50,30,50]` | Medium rhythmic pulses |
| Balanced Armature | `[20,20,20,20,20,20,20,20]` | Quick precise pulses |
| Electrostatic | `[10,10,10,10,10,10,10,10,10,10]` | Very fast, subtle pulses |

**Android (Godot):**
```gdscript
func _trigger_haptic(stone_data):
    var iem = stone_data["iem"]
    var pattern = HAPTIC_PATTERNS[iem]
    
    # Godot 4.x Android haptic via Engine singleton
    if OS.has_feature("android"):
        for pulse in pattern:
            Input.vibrate_handheld(pulse)
            await get_tree().create_timer(pulse / 1000.0 + 0.02).timeout
```

**iOS (Godot):**
```gdscript
# iOS uses UIImpactFeedbackGenerator via plugin
# Light = balanced_armature, Medium = dynamic_driver, Heavy = bone_conduction
func _trigger_haptic_ios(stone_data):
    var iem = stone_data["iem"]
    var style = "medium"
    match iem:
        "bone_conduction": style = "heavy"
        "dynamic_driver": style = "medium"
        "balanced_armature": style = "light"
        "electrostatic": style = "light"
    _ios_haptic.call(style)  # via GDNative plugin
```

### 5. Touch Handler

```gdscript
extends Area2D

signal stone_touched(stone_data)
signal stone_released()

var stone_data: Dictionary
var is_pressed: bool = false

func _input_event(viewport, event, shape_idx):
    if event is InputEventScreenTouch:
        if event.pressed:
            is_pressed = true
            stone_touched.emit(stone_data)
            _start_vibration(stone_data)
            _play_stone_tone(stone_data)
            _trigger_haptic(stone_data)
        elif not event.pressed and is_pressed:
            is_pressed = false
            stone_released.emit()
            _stop_vibration()
            _stop_tone()
            _stop_haptic()
```

### 6. Integration Points

The stone vibration system connects to multiple Geode Inn systems:

- **Mohs Vibration Game** — stones in the Blind Cave mode use this system for identification
- **Sonic Mineral Codex** — each stone in the codex vibrates on touch
- **Market Items** — Soulstice Jewelry items show their stone composition vibrating
- **Player Inventory** — collected stones vibrate when touched in the inventory grid
- **Building System** — crafting materials vibrate in the crafting UI
- **Fae Kingdom rewards** — rare stones vibrate with special effects when earned

### 7. Web App Integration (Base44)

For the Base44 web app, the `stone_vibration_touch_system.html` file is self-contained:
- All 160 stones with per-stone colors
- Web Audio API for tone generation
- CSS keyframe animations for vibration
- navigator.vibrate() for haptic on Android Chrome
- IEM driver-type filtering
- Touch and mouse support

To embed in the Base44 app:
1. Upload `stone_vibration_touch_system.html` to the app's file storage
2. Load in an iframe on the game page
3. Pass stone selection via postMessage API
4. Receive vibration events back via postMessage for game state tracking
