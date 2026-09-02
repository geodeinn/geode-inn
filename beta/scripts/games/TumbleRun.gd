extends Node2D
## TumbleRun.gd — Standalone Sellable Arcade Game ($4.99)
## The Inn's fizgig mascot stars in a rolling, bouncing, getting-stuck-in-everything adventure.
## Tumble is a 4-inch ball of fur — a living crystal note of the Song of Making.
## One of the only true innocents in the game.
##
## Mechanics: Roll/bounce through obstacle courses, get stuck, wiggle free.
## 3 DLC packs planned: Crystal Caverns, Shadow Inn, Cosmic Ascent
## Bundle includes base game + all DLC
##
## Visual style: Warm Inn aesthetic — amber, gold, cream, brown fur
## Music: 50 BPM low-dub, the 42Hz hum as Tumble's "voice"
## Tumble makes no words — just a single chime when happy, a soft thud when stuck
##
## AUDIO WIRING: Per docs/godot/tumble_run_audio_wiring_spec.md
## - 8 music tracks (6 zone themes + game over + victory)
## - 12 SFX (jump, land, collect variants, hit, zone transition, UI)
## - Stone tone triggers (Mohs to frequency)
## - Inn Mode DSP profiles per zone
## - Tri-mode frequency shift (Living 42Hz / Shadow 84Hz / In-Between)

# === Game State ===
var current_world: int = 1
const MAX_WORLDS: int = 4  # Base game: 4 worlds. DLC adds more.
var current_level: int = 1
var levels_per_world: int = 5
var score: int = 0
var gems_collected: int = 0
var is_paused: bool = false
var tumble_stuck: bool = false
var stuck_timer: float = 0.0
var wiggling_free: float = 0.0

# === Tumble Physics ===
var tumble_pos: Vector2 = Vector2(200, 300)
var tumble_vel: Vector2 = Vector2.ZERO
var tumble_radius: float = 12.0  # 4 inches in game scale
var tumble_rotation: float = 0.0
var bounce_count: int = 0
var is_grounded: bool = false
var can_boost: bool = true
var boost_cooldown: float = 0.0

# === Level Data ===
var platforms: Array[Dictionary] = []
var obstacles: Array[Dictionary] = []  # things Tumble gets stuck in
var gems: Array[Vector2] = []
var goal_pos: Vector2 = Vector2.ZERO
var camera_offset: Vector2 = Vector2.ZERO

# === Scene Nodes ===
@onready var camera: Camera2D = $Camera2D
@onready var bg_rect: ColorRect = $Background
@onready var ui_layer: CanvasLayer = $UILayer
@onready var world_transition: Control = $UILayer/WorldTransition
@onready var world_name_label: Label = $UILayer/WorldTransition/WorldName
@onready var world_desc_label: Label = $UILayer/WorldTransition/WorldDesc
@onready var pause_menu: Control = $UILayer/PauseMenu
@onready var resume_button: Button = $UILayer/PauseMenu/ResumeButton
@onready var quit_button: Button = $UILayer/PauseMenu/QuitButton
@onready var game_complete_screen: Control = $UILayer/GameComplete
@onready var complete_title: Label = $UILayer/GameComplete/CompleteTitle
@onready var final_score_label: Label = $UILayer/GameComplete/FinalScore
@onready var gems_total_label: Label = $UILayer/GameComplete/GemsTotal
@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var sfx_player: AudioStreamPlayer = $SFXPlayer
@onready var boost_timer: Timer = $BoostCooldown
@onready var world_timer: Timer = $WorldTransitionTimer

# === Audio Asset Paths (from audio wiring spec) ===
const SFX_PATHS := {
	"jump": "res://beta/assets/audio/game_audio/tumble_boost.wav",
	"gem_collect": "res://beta/assets/audio/game_audio/tumble_gem_collect.wav",
	"stuck": "res://beta/assets/audio/game_audio/tumble_stuck.wav",
	"wiggle": "res://beta/assets/audio/game_audio/tumble_wiggle.wav",
	"world_complete": "res://beta/assets/audio/game_audio/tumble_world_complete.wav",
	"standing_stones_level_up": "res://beta/assets/audio/game_audio/standing_stones_level_up.wav",
	"standing_stones_row_clear": "res://beta/assets/audio/game_audio/standing_stones_row_clear.wav",
	"monster_deep_encounter": "res://beta/assets/audio/game_audio/monster_deep_encounter.wav",
	"sandfall_sinking": "res://beta/assets/audio/game_audio/sandfall_sinking.wav",
	"fae_portal_ignition": "res://beta/assets/audio/game_audio/fae_portal_ignition.wav",
	"knotwork_metal_drone": "res://beta/assets/audio/game_audio/knotwork_metal_drone.wav",
}

# === World Music Mapping (from audio wiring spec) ===
const WORLD_MUSIC := {
	1: "main_floor",       # Main Floor Run — Celtic harp + low drone
	2: "fae_kingdom",      # Fae Frenzy — Woodland flute + chimes
	3: "staircase",        # Staircase Pulse — Deep gong + rhythmic stone steps
	4: "archive",          # Archive Glide — Satie-like piano, muted strings
	5: "catacombs",        # Crystal Caverns — Vivaldi Winter low-dub
	6: "gorgons_garden",   # Gorgon's Threat — Detuned strings + 84Hz pulse
	7: "cosmic",           # Cosmic Ascent — Full Inn ensemble
}

# === Zone Ambient Mapping for AudioManager ===
const WORLD_AMBIENT := {
	1: "main_floor",
	2: "fae_kingdom",
	3: "staircase",
	4: "archive",
	5: "catacombs",
	6: "gorgons_garden",
	7: "cosmology",
}

# === DSP Profiles per Zone (Inn Mode) ===
const ZONE_DSP := {
	1: {"profile": "Open Hall", "reverb": 2.1, "character": "Warm, reverberant"},
	2: {"profile": "Forest Glade", "reverb": 1.5, "character": "Bright, airy, natural"},
	3: {"profile": "Narrow Passage", "reverb": 3.0, "character": "Long decay, metallic tinge"},
	4: {"profile": "Library", "reverb": 1.8, "character": "Dry, intimate — books absorb"},
	5: {"profile": "Stone Chamber", "reverb": 4.5, "character": "Deepest reverb, cold"},
	6: {"profile": "Garden Maze", "reverb": 2.5, "character": "Filtered, humid, detuned"},
	7: {"profile": "Open Hall", "reverb": 2.1, "character": "Warm, reverberant — resolution"},
}

# === Stone Tone Triggers (Mohs to Frequency, from spec) ===
const STONE_TONES := {
	"amethyst": {"mohs": 7.0, "freq": 466.0, "rarity": "common"},
	"clear_quartz": {"mohs": 7.0, "freq": 466.0, "rarity": "common"},
	"labradorite": {"mohs": 6.0, "freq": 392.0, "rarity": "uncommon"},
	"tanzanite": {"mohs": 6.5, "freq": 415.0, "rarity": "rare"},
	"preseli_blue_stone": {"mohs": 6.5, "freq": 415.0, "rarity": "legendary"},
	"diamond": {"mohs": 10.0, "freq": 698.0, "rarity": "legendary"},
}

# === World Themes ===
const WORLD_THEMES := {
	1: {"name": "The Main Floor", "palette": {"bg": "#1a1410", "accent": "#c9a44c", "platform": "#5a4a3a"}, 
	    "desc": "Roll through the Inn's great hall. Brindle sweeps up behind you."},
	2: {"name": "The Garden", "palette": {"bg": "#1a2410", "accent": "#7ba84c", "platform": "#4a5a3a"},
    "desc": "Bounce through Van Gogh's garden. Rolling in pollen. Getting stuck in flower pots."},
	3: {"name": "The Staircase", "palette": {"bg": "#2a1a1a", "accent": "#d4a04c", "platform": "#6a4a3a"},
    "desc": "Tumble down the alchemical staircase. Each step is a different resonance. Getting stuck on beakers."},
	4: {"name": "The Archive", "palette": {"bg": "#1a1a2a", "accent": "#8a7ad4", "platform": "#4a4a5a"},
    "desc": "Roll between bookshelves. Getting stuck in book bindings. Beverley watches, unimpressed."}
}

# DLC Worlds (unlocked via purchase)
const DLC_WORLDS := {
	5: {"name": "Crystal Caverns (DLC)", "palette": {"bg": "#0a1a2a", "accent": "#4cd4d4", "platform": "#3a5a6a"},
     "desc": "Bounce through geode caves. Tumble's crystal nature resonates. Light plays through you."},
	6: {"name": "Shadow Inn (DLC)", "palette": {"bg": "#0a0a0a", "accent": "#4c1a1a", "platform": "#2a1a1a"},
     "desc": "The brownies' pot-lid shields. The 84Hz frequency. Tumble is confused — the hum is wrong here."},
	7: {"name": "Cosmic Ascent (DLC)", "palette": {"bg": "#0a0a1a", "accent": "#6c4cd4", "platform": "#3a2a5a"},
     "desc": "Roll up the too-short ladder to the stars. The brownies' work finally makes sense."}
}

# === Steam Achievement IDs (from audio wiring spec) ===
const STEAM_ACHIEVEMENTS := {
	"first_steps": "tumble_first_steps",           # Complete Zone 1
	"collector": "tumble_collector",               # Collect 50 stones in one run
	"zone_diver": "tumble_zone_diver",              # Reach Zone 4 (Catacombs)
	"gorgon_slayer": "tumble_gorgon_slayer",         # Complete Zone 6
	"legendary_find": "tumble_legendary",           # Collect a legendary stone
	"perfect_run": "tumble_perfect",                # Complete all zones without losing a life
	"speed_demon": "tumble_speed_demon",             # Score 10,000+ points
	"shadow_walker": "tumble_shadow_walker",        # Complete Zone 6 in Shadow frequency
}

signal world_started(world: int, name: String, desc: String)
signal level_started(world: int, level: int)
signal level_completed(world: int, level: int, gems: int, score: int)
signal game_completed(total_score: int)
signal tumble_stuck_event(obstacle_name: String)
signal tumble_freed()
signal gem_collected(count: int)

# === Audio Wiring ===

## Play a game-specific SFX from the game_audio folder
func _play_sfx(sfx_name: String, pitch_shift: float = 0.0) -> void:
	# Primary: use AudioManager if available (routes through proper bus)
	if AudioManager and AudioManager.has_method("play_stinger"):
		AudioManager.play_stinger(sfx_name)
		return
	
	# Fallback: load and play via local SFXPlayer
	var path: String = SFX_PATHS.get(sfx_name, "")
	if path.is_empty():
		push_warning("[TumbleRun] Unknown SFX: " + sfx_name)
		return
	
	var stream := load(path) as AudioStream
	if stream:
		sfx_player.stream = stream
		sfx_player.pitch_scale = 1.0 + pitch_shift
		sfx_player.play()
	else:
		push_warning("[TumbleRun] Could not load SFX: " + path)

## Play a stone-specific chime at its Mohs-mapped frequency
func _play_stone_tone(stone_name: String) -> void:
	var tone: Dictionary = STONE_TONES.get(stone_name, {})
	if tone.is_empty():
		# Default: generic crystal note
		if AudioManager:
			AudioManager.play_stone_chime("crystal_note", -3.0)
		return
	
	var freq: float = tone.get("freq", 466.0)
	var rarity: String = tone.get("rarity", "common")
	
	# Route through AudioManager with frequency-specific chime
	if AudioManager and AudioManager.has_method("play_stone_chime"):
		# The AudioManager maps stone names to pre-generated chime files
		AudioManager.play_stone_chime(stone_name, -12.0)
	else:
		_play_sfx("gem_collect")

## Switch world music — called on world start
func _switch_world_music(world: int) -> void:
	var zone_key: String = WORLD_AMBIENT.get(world, "main_floor")
	
	# Primary: AudioManager zone ambient
	if AudioManager and AudioManager.has_method("play_zone_ambient"):
		AudioManager.play_zone_ambient(zone_key)
	
	# Apply DSP profile for Inn Mode
	var dsp: Dictionary = ZONE_DSP.get(world, {})
	if not dsp.is_empty() and AudioManager and AudioManager.has_method("set_zone_reverb"):
		AudioManager.set_zone_reverb(dsp.get("reverb", 2.0))
	
	# Shadow mode for Gorgon's Garden (world 6)
	if world == 6 and AudioManager and AudioManager.has_method("set_mode"):
		AudioManager.set_mode(AudioManager.AudioMode.SHADOW)
		_play_sfx("knotwork_metal_drone")  # 84Hz transition cue
	elif world != 6 and AudioManager and AudioManager.has_method("set_mode"):
		AudioManager.set_mode(AudioManager.AudioMode.LIVING)

# === Game Lifecycle ===

func _ready() -> void:
	# Connect scene node signals
	if resume_button:
		resume_button.pressed.connect(_toggle_pause)
	if quit_button:
		quit_button.pressed.connect(_quit_to_menu)
	
	# Audio: Living mode + main floor ambient
	if AudioManager:
		AudioManager.set_mode(AudioManager.AudioMode.LIVING)
		AudioManager.play_zone_ambient("main_floor")
	
	# Steam rich presence
	if SteamManager:
		SteamManager.set_rich_presence("Tumble Run", "Rolling")
	
	_start_world(1)

func _input(event: InputEvent) -> void:
	# Pause toggle (ESC / menu button)
	if Input.is_action_just_pressed("menu"):
		_toggle_pause()

func _toggle_pause() -> void:
	is_paused = !is_paused
	if pause_menu:
		pause_menu.visible = is_paused
	if is_paused:
		# Mute zone audio on pause
		if AudioManager and AudioManager.has_method("pause_zone_ambient"):
			AudioManager.pause_zone_ambient()
	else:
		if AudioManager and AudioManager.has_method("resume_zone_ambient"):
			AudioManager.resume_zone_ambient()

func _quit_to_menu() -> void:
	is_paused = false
	get_tree().change_scene_to_file("res://beta/scenes/MainMenu.tscn")

func _start_world(world: int) -> void:
	current_world = world
	current_level = 1
	
	var theme: Dictionary = WORLD_THEMES.get(world, DLC_WORLDS.get(world, {}))
	if theme.is_empty():
		push_error("TumbleRun: Invalid world " + str(world))
		return
	
	# Show world transition overlay
	_show_world_transition(theme.get("name", ""), theme.get("desc", ""))
	
	# Switch music + DSP for this world
	_switch_world_music(world)
	
	# Audio: zone transition sting
	_play_sfx("fae_portal_ignition")
	
	# Steam: check achievements
	if SteamManager and world == 1:
		SteamManager.unlock_achievement(STEAM_ACHIEVEMENTS.first_steps)
	if SteamManager and world == 4:
		SteamManager.unlock_achievement(STEAM_ACHIEVEMENTS.zone_diver)
	
	world_started.emit(world, theme.get("name", ""), theme.get("desc", ""))
	print("[TumbleRun] World " + str(world) + ": " + theme.get("name", ""))
	_start_level()

func _show_world_transition(world_name: String, world_desc: String) -> void:
	if not world_transition:
		return
	world_name_label.text = world_name
	world_desc_label.text = world_desc
	world_transition.visible = true
	
	# Auto-hide after 2 seconds
	world_timer.wait_time = 2.0
	world_timer.timeout.connect(func(): world_transition.visible = false, CONNECT_ONE_SHOT)
	world_timer.start()

func _start_level() -> void:
	score = 0
	gems_collected = 0
	tumble_stuck = false
	stuck_timer = 0.0
	wiggling_free = 0.0
	platforms.clear()
	obstacles.clear()
	gems.clear()
	
	# Reset Tumble to start position
	tumble_pos = Vector2(100, 400)
	tumble_vel = Vector2.ZERO
	tumble_rotation = 0.0
	bounce_count = 0
	can_boost = true
	boost_cooldown = 0.0
	
	# Generate level layout
	_generate_level()
	
	level_started.emit(current_world, current_level)
	print("[TumbleRun] World " + str(current_world) + " Level " + str(current_level) + " started")

func _generate_level() -> void:
	# Generate a side-scrolling obstacle course
	# Platform layout: ground + floating platforms + obstacles + gems + goal
	
	# Ground platforms (with gaps)
	var x: float = 0
	while x < 2400:  # level width
		var width: float = randf_range(100, 300)
		var gap: float = randf_range(50, 150) * (1 + current_level * 0.1)  # bigger gaps in later levels
		platforms.append({"pos": Vector2(x, 500), "width": width, "height": 40})
		x += width + gap
	
	# Floating platforms
	var float_count: int = 5 + current_level
	for i in range(float_count):
		platforms.append({
			"pos": Vector2(randf_range(200, 2200), randf_range(200, 400)),
			"width": randf_range(60, 120),
			"height": 20
		})
	
	# Obstacles (things Tumble gets stuck in — this is the signature mechanic)
	var obstacle_types: Array[String] = [
		"flower_pot", "book_binding", "beaker", "crystal_crevice", 
		"cobweb", "mushroom_cluster", "knotwork_gap", "pipe_bowl"
	]
	var obstacle_count: int = 3 + current_level * 2
	for i in range(obstacle_count):
		var type: String = obstacle_types[randi() % obstacle_types.size()]
		obstacles.append({
			"pos": Vector2(randf_range(300, 2100), randf_range(200, 450)),
			"type": type,
			"radius": randf_range(15, 25),
			"stuck_time": randf_range(1.0, 3.0)  # how long Tumble stays stuck
		})
	
	# Gems (collectibles — crystal notes of the Song)
	var gem_count: int = 5 + current_level
	for i in range(gem_count):
		gems.append(Vector2(randf_range(200, 2200), randf_range(150, 450)))
	
	# Goal (the level exit — a warm doorway)
	goal_pos = Vector2(2300, 400)

func _physics_process(delta: float) -> void:
	if is_paused:
		return
	
	# Update boost cooldown
	if boost_cooldown > 0:
		boost_cooldown -= delta
		if boost_cooldown <= 0:
			can_boost = true
	
	if tumble_stuck:
		_handle_stuck(delta)
		return
	
	# Gravity
	tumble_vel.y += 600 * delta
	
	# Track was_grounded for landing SFX
	var was_grounded: bool = is_grounded
	
	# Input — Tumble rolls (left/right) and bounces (jump)
	if Input.is_action_pressed("move_left"):
		tumble_vel.x = lerp(tumble_vel.x, -300.0, 0.1)
		tumble_rotation -= 5 * delta
	elif Input.is_action_pressed("move_right"):
		tumble_vel.x = lerp(tumble_vel.x, 300.0, 0.1)
		tumble_rotation += 5 * delta
	else:
		tumble_vel.x = lerp(tumble_vel.x, 0.0, 0.05)
	
	# Bounce (jump)
	if Input.is_action_just_pressed("action") and is_grounded:
		tumble_vel.y = -450
		bounce_count += 1
		is_grounded = false
		# Audio: jump SFX
		_play_sfx("jump", 0.05)  # slight pitch up for bounce
	
	# Boost (limited use — a burst of speed)
	if Input.is_action_just_pressed("interact") and can_boost:
		tumble_vel.x *= 2.5
		tumble_vel.y *= 0.5
		can_boost = false
		boost_cooldown = 2.0
		# Audio: boost SFX (higher pitch)
		_play_sfx("jump", 0.15)
	
	# Apply velocity
	tumble_pos += tumble_vel * delta
	
	# Friction
	tumble_vel.x *= 0.98
	
	# Platform collision
	is_grounded = false
	for p in platforms:
		if _check_circle_rect_collision(tumble_pos, tumble_radius, p):
			# Landed on top
			if tumble_vel.y > 0:
				tumble_pos.y = p["pos"].y - tumble_radius
				tumble_vel.y = -tumble_vel.y * 0.6  # bouncy!
				if abs(tumble_vel.y) < 50:
					tumble_vel.y = 0
					is_grounded = true
			break
	
	# Audio: landing SFX (only on transition from air to ground)
	if is_grounded and not was_grounded:
		_play_sfx("jump", -0.1)  # soft thud, slightly lower pitch
	
	# Obstacle collision — Tumble gets STUCK (signature mechanic)
	for ob in obstacles:
		var dist: float = tumble_pos.distance_to(ob["pos"])
		if dist < tumble_radius + ob["radius"]:
			# Tumble is stuck!
			tumble_stuck = true
			stuck_timer = 0.0
			wiggling_free = 0.0
			tumble_vel = Vector2.ZERO
			tumble_stuck_event.emit(ob["type"])
			# Audio: stuck SFX (wobble + thud)
			_play_sfx("stuck", -0.15)
			# Also play through AudioManager stone chime (existing behavior)
			if AudioManager:
				AudioManager.play_stone_chime("clear_quartz", -12.0)
			print("[TumbleRun] Tumble got stuck in: " + ob["type"])
			break
	
	# Gem collection
	for i in range(gems.size() - 1, -1, -1):
		if tumble_pos.distance_to(gems[i]) < tumble_radius + 8:
			gems.remove_at(i)
			gems_collected += 1
			score += 50
			gem_collected.emit(gems_collected)
			# Audio: gem collect SFX + stone tone
			_play_sfx("gem_collect")
			_play_stone_tone("clear_quartz")
			# Also through AudioManager (existing behavior)
			if AudioManager:
				AudioManager.play_stone_chime("crystal_note", -3.0)
	
	# Fall off bottom = respawn at last safe position
	if tumble_pos.y > 600:
		tumble_pos = Vector2(max(tumble_pos.x - 100, 100), 300)
		tumble_vel = Vector2.ZERO
		score = max(score - 25, 0)
		# Audio: falling sting
		_play_sfx("sandfall_sinking", -0.2)
	
	# Reach goal = level complete
	if tumble_pos.distance_to(goal_pos) < 40:
		_complete_level()
	
	# Camera follows Tumble
	camera_offset.x = lerp(camera_offset.x, tumble_pos.x - 640, 0.1)
	camera_offset.x = max(camera_offset.x, 0)
	
	# Update Camera2D position (scene node)
	if camera:
		camera.position.x = camera_offset.x + 640

func _handle_stuck(delta: float) -> void:
	stuck_timer += delta
	
	# Player wiggles free by pressing left/right rapidly
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		wiggling_free += delta * 2.0
		# Audio: wiggle SFX (subtle, builds with effort)
		if fmod(wiggling_free, 0.3) < delta * 2.0:
			_play_sfx("wiggle", wiggling_free * 0.1)
	else:
		wiggling_free = max(wiggling_free - delta, 0)
	
	# After enough wiggling, Tumble pops free
	if wiggling_free > 1.0:
		tumble_stuck = false
		tumble_vel = Vector2(randf_range(-100, 100), -200)  # pop out with a bounce
		tumble_freed.emit()
		# Audio: freed SFX (happy chime)
		_play_sfx("wiggle", 0.2)
		if AudioManager:
			AudioManager.play_stone_chime("clear_quartz", -5.0)
		print("[TumbleRun] Tumble wiggled free!")
	
	# After stuck_time, auto-free (don't frustrate the player)
	if stuck_timer > 4.0:
		tumble_stuck = false
		tumble_vel = Vector2(0, -300)
		tumble_freed.emit()
		_play_sfx("wiggle", 0.1)

func _complete_level() -> void:
	score += gems_collected * 100
	level_completed.emit(current_world, current_level, gems_collected, score)
	
	# Audio: level complete — row clear sting
	_play_sfx("standing_stones_row_clear")
	
	print("[TumbleRun] Level complete! Score: " + str(score) + " Gems: " + str(gems_collected))
	
	# Check speed demon achievement
	if SteamManager and score >= 10000:
		SteamManager.unlock_achievement(STEAM_ACHIEVEMENTS.speed_demon)
	# Check collector achievement
	if SteamManager and gems_collected >= 50:
		SteamManager.unlock_achievement(STEAM_ACHIEVEMENTS.collector)
	
	if current_level >= levels_per_world:
		# World complete
		# Audio: world complete fanfare
		_play_sfx("world_complete")
		if current_world >= MAX_WORLDS:
			# Base game complete — check for DLC
			_game_complete()
		else:
			is_paused = true
			await get_tree().create_timer(1.5).timeout
			_start_world(current_world + 1)
	else:
		is_paused = true
		await get_tree().create_timer(1.0).timeout
		current_level += 1
		_start_level()

func _game_complete() -> void:
	# Check if DLC worlds are unlocked
	var has_dlc: bool = false  # In production, check ownership via Steam DLC API
	var total_worlds: int = MAX_WORLDS + (3 if has_dlc else 0)
	
	if current_world < total_worlds and has_dlc:
		is_paused = true
		await get_tree().create_timer(2.0).timeout
		_start_world(current_world + 1)
	else:
		print("[TumbleRun] Game complete! Final score: " + str(score))
		game_completed.emit(score)
		
		# Show game complete screen
		if game_complete_screen:
			final_score_label.text = "Score: " + str(score)
			gems_total_label.text = "Gems: " + str(gems_collected)
			game_complete_screen.visible = true
		
		# Audio: Nine Songs chord + victory
		if AudioManager:
			AudioManager.play_stinger("level_up")
			AudioManager.play_nine_songs_chord()
		_play_sfx("standing_stones_level_up")
		
		# Steam + GameManager
		if SteamManager:
			SteamManager.unlock_achievement(STEAM_ACHIEVEMENTS.first_steps)  # first game completion
		if GameManager:
			GameManager.complete_game("tumble_run", score)
		
		is_paused = true
		await get_tree().create_timer(3.0).timeout
		get_tree().change_scene_to_file("res://beta/scenes/MainMenu.tscn")

func _check_circle_rect_collision(circle_pos: Vector2, circle_r: float, rect: Dictionary) -> bool:
	var rx: float = rect["pos"].x
	var ry: float = rect["pos"].y
	var rw: float = rect["width"]
	var rh: float = rect["height"]
	
	var closest_x: float = clamp(circle_pos.x, rx, rx + rw)
	var closest_y: float = clamp(circle_pos.y, ry - rh/2, ry + rh/2)
	
	var dist: float = Vector2(circle_pos.x, circle_pos.y).distance_to(Vector2(closest_x, closest_y))
	return dist < circle_r

func _draw() -> void:
	var theme: Dictionary = WORLD_THEMES.get(current_world, DLC_WORLDS.get(current_world, WORLD_THEMES[1]))
	var palette: Dictionary = theme.get("palette", {})
	
	# Background
	var bg_color := Color.from_string(palette.get("bg", "#1a1410"), Color(0.1, 0.08, 0.06))
	draw_rect(Rect2(0, 0, 1280, 720), bg_color, true)
	
	# Translate everything by camera offset
	var offset: float = -camera_offset.x
	
	# Platforms
	var plat_color := Color.from_string(palette.get("platform", "#5a4a3a"), Color(0.35, 0.29, 0.23))
	for p in platforms:
		var px: float = p["pos"].x + offset
		if px > -200 and px < 1480:  # only draw visible
			draw_rect(Rect2(px, p["pos"].y, p["width"], p["height"]), plat_color, true)
	
	# Obstacles
	for ob in obstacles:
		var ox: float = ob["pos"].x + offset
		if ox > -50 and ox < 1330:
			# Draw as a cluster (simplified)
			var ob_color := Color.from_string(palette.get("accent", "#c9a44c"), Color(0.79, 0.64, 0.3))
			draw_circle(Vector2(ox, ob["pos"].y), ob["radius"], ob_color.darkened(0.3))
	
	# Gems
	var gem_color := Color.from_string(palette.get("accent", "#c9a44c"), Color(0.79, 0.64, 0.3))
	for g in gems:
		var gx: float = g.x + offset
		if gx > -50 and gx < 1330:
			# Crystal note shape (diamond)
			var pts := PackedVector2Array([
				Vector2(gx, g.y - 6), Vector2(gx + 5, g.y), 
				Vector2(gx, g.y + 6), Vector2(gx - 5, g.y)
			])
			draw_colored_polygon(pts, gem_color)
	
	# Goal (warm doorway)
	var goal_x: float = goal_pos.x + offset
	if goal_x > -100 and goal_x < 1380:
		draw_rect(Rect2(goal_x - 15, goal_pos.y - 30, 30, 60), Color(0.9, 0.7, 0.3), true)
		draw_rect(Rect2(goal_x - 12, goal_pos.y - 27, 24, 54), Color(0.95, 0.85, 0.5), true)
	
	# Tumble (the fizgig — 4-inch ball of fur)
	var tx: float = tumble_pos.x + offset
	# Fur body (warm brown/amber)
	draw_circle(Vector2(tx, tumble_pos.y), tumble_radius, Color(0.45, 0.32, 0.20))
	# Fur texture (slightly lighter inner)
	draw_circle(Vector2(tx, tumble_pos.y), tumble_radius - 3, Color(0.55, 0.40, 0.28))
	# Crystal spark (the living note of the Song — tiny light inside)
	if not tumble_stuck:
		draw_circle(Vector2(tx, tumble_pos.y), 3, Color(1.0, 0.9, 0.6, 0.8))
	else:
		# When stuck: no spark, just fur — Tumble is confused
		draw_circle(Vector2(tx, tumble_pos.y), 2, Color(0.4, 0.3, 0.2))
	
	# Rotation indicator (a small mark on the fur showing Tumble is rolling)
	var rot_x: float = tx + cos(tumble_rotation) * tumble_radius * 0.6
	var rot_y: float = tumble_pos.y + sin(tumble_rotation) * tumble_radius * 0.6
	draw_circle(Vector2(rot_x, rot_y), 2, Color(0.35, 0.25, 0.15))
	
	# Stuck indicator
	if tumble_stuck:
		var font := get_theme_default_font()
		if font:
			draw_string(font, Vector2(tx - 30, tumble_pos.y - 25), "STUCK!", 
				HORIZONTAL_ALIGNMENT_CENTER, -1, 12, Color(0.8, 0.5, 0.3))
			draw_string(font, Vector2(tx - 60, tumble_pos.y + 30), "Wiggle to free!", 
				HORIZONTAL_ALIGNMENT_CENTER, -1, 10, Color(0.6, 0.5, 0.4))
	
	# HUD
	_draw_hud()

func _draw_hud() -> void:
	var font := get_theme_default_font()
	if not font:
		return
	
	var theme: Dictionary = WORLD_THEMES.get(current_world, DLC_WORLDS.get(current_world, WORLD_THEMES[1]))
	var accent := Color.from_string(theme.get("palette", {}).get("accent", "#c9a44c"), Color(0.79, 0.64, 0.3))
	
	# World/Level
	draw_string(font, Vector2(20, 30), theme.get("name", "World " + str(current_world)), 
		HORIZONTAL_ALIGNMENT_LEFT, -1, 16, accent)
	draw_string(font, Vector2(20, 50), "Level " + str(current_level) + " / " + str(levels_per_world), 
		HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color(0.9, 0.85, 0.75))
	
	# Score & Gems
	draw_string(font, Vector2(1260, 30), "Score: " + str(score), 
		HORIZONTAL_ALIGNMENT_RIGHT, -1, 16, accent)
	draw_string(font, Vector2(1260, 50), "Gems: " + str(gems_collected), 
		HORIZONTAL_ALIGNMENT_RIGHT, -1, 12, Color(0.9, 0.85, 0.75))
	
	# Boost indicator
	if can_boost:
		draw_string(font, Vector2(640, 30), "BOOST READY", 
			HORIZONTAL_ALIGNMENT_CENTER, -1, 10, accent)
	else:
		draw_string(font, Vector2(640, 30), "boost recharging...", 
			HORIZONTAL_ALIGNMENT_CENTER, -1, 10, Color(0.5, 0.45, 0.35))
