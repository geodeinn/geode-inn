class_name SpiralStaircase
extends Node2D

## Script for the level transition and alchemy staircase ('The Spiral Staircase').
## Features a curved ascending staircase from bottom-right (1600, 900) to upper-center (960, 200),
## glowing ember-orange wall crystals (#FF9900, 0.2Hz pulse), light beige stone materials,
## a runic handrail shader with emissive glyph overlay, smooth tween camera pan upward during climb,
## and dynamic ascending audio pitch shifting.

signal climb_completed
signal climb_progress_changed(progress: float)

@export_group("Crystal Lighting")
## Color for glowing ember-orange crystals embedded in wall (#FF9900)
@export var crystal_color: Color = Color("ff9900")
@export var crystal_energy: float = 0.7
@export var crystal_pulse_hz: float = 0.2
@export var crystal_count: int = 8

@export_group("Staircase Colors & Material")
## Base color for light beige stone structure (#B9A89A)
@export var stone_base_color: Color = Color("b9a89a")
## Highlight color for stair steps and carved rails (#D1C5B6)
@export var stone_highlight_color: Color = Color("d1c5b6")

@export_group("Climb & Audio Settings")
## Total duration in seconds for player auto-climb camera pan sequence
@export var climb_duration: float = 8.0
## Minimum pitch scale at start of climb
@export var min_audio_pitch: float = 1.0
## Maximum pitch scale at top of climb (matches musical pitch shift upward)
@export var max_audio_pitch: float = 1.5

# Progression state (0.0 = bottom right, 1.0 = top center)
var climb_progress: float = 0.0:
	set(value):
		climb_progress = clamp(value, 0.0, 1.0)
		_on_climb_progress_updated(climb_progress)

# Nodes
var _camera: Camera2D
var _audio_player: AudioStreamPlayer
var _handrail_mesh: Line2D
var _crystal_lights: Array[Node2D] = []
var _climb_tween: Tween


func _ready() -> void:
	# 1. Apply global zone atmosphere via CatacombLighting autoload if available
	if Engine.has_singleton("CatacombLighting") or get_node_or_null("/root/CatacombLighting"):
		CatacombLighting.apply_zone_atmosphere("spiral_staircase")

	# 2. Build spiral staircase geometry and light beige stone visual layers
	_setup_staircase_geometry()

	# 3. Create runic handrail with custom emissive glyph shader
	_setup_runic_handrail()

	# 4. Embed ember-orange crystals in wall along staircase arc
	_setup_wall_crystals()

	# 5. Initialize camera for upward pan tracking
	_setup_camera()

	# 6. Initialize AudioStreamPlayer with pitch bending support
	_setup_staircase_audio()


func _process(_delta: float) -> void:
	# Allow manual climb simulation with Up/Down arrows for testing/gameplay
	if Input.is_action_pressed("ui_up"):
		climb_progress += _delta / climb_duration
	elif Input.is_action_pressed("ui_down"):
		climb_progress -= _delta / climb_duration


## Starts an automated tween-based camera pan upward as player climbs
func start_automated_climb() -> void:
	if _climb_tween and _climb_tween.is_running():
		_climb_tween.kill()

	climb_progress = 0.0
	_climb_tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	_climb_tween.tween_property(self, "climb_progress", 1.0, climb_duration)
	_climb_tween.finished.connect(func(): climb_completed.emit())


## Generates staircase curve geometry from bottom right to upper center
func _setup_staircase_geometry() -> void:
	var stairs_container := Node2D.new()
	stairs_container.name = "StaircaseGeometry"
	add_child(stairs_container)

	var step_count := 30
	for i in range(step_count):
		var t := float(i) / float(step_count - 1)
		var pos := _evaluate_staircase_path(t)

		# Draw light beige stone step
		var step := ColorRect.new()
		step.name = "Step_%d" % i
		step.size = Vector2(120.0 * (1.0 - t * 0.3), 16.0)
		step.position = pos - step.size * 0.5
		step.color = stone_base_color.lerp(stone_highlight_color, t)
		stairs_container.add_child(step)


## Calculates parabolic/curved staircase position at normalized t (0.0 to 1.0)
## Ascends from bottom right Vector2(1600, 900) to upper center Vector2(960, 200)
func _evaluate_staircase_path(t: float) -> Vector2:
	var start_pos := Vector2(1600.0, 900.0)
	var control_pos := Vector2(1400.0, 450.0)
	var end_pos := Vector2(960.0, 200.0)

	# Quadratic Bezier curve
	var q0 := start_pos.lerp(control_pos, t)
	var q1 := control_pos.lerp(end_pos, t)
	return q0.lerp(q1, t)


## Creates the carved runic handrail with emissive glyph shader overlay
func _setup_runic_handrail() -> void:
	_handrail_mesh = Line2D.new()
	_handrail_mesh.name = "RunicHandrail"
	_handrail_mesh.width = 18.0
	_handrail_mesh.default_color = stone_highlight_color

	var points_count := 40
	for i in range(points_count):
		var t := float(i) / float(points_count - 1)
		var stair_pos := _evaluate_staircase_path(t)
		# Offset slightly to form rail above steps
		_handrail_mesh.add_point(stair_pos + Vector2(-20.0, -35.0))

	# Apply custom emissive runic glyph shader
	var shader := Shader.new()
	shader.code = """
	shader_type canvas_item;

	uniform vec4 glyph_glow_color : source_color = vec4(1.0, 0.6, 0.0, 1.0);
	uniform float glow_intensity : hint_range(0.0, 3.0) = 1.4;
	uniform float pulse_speed : hint_range(0.1, 2.0) = 0.8;

	void fragment() {
		vec4 base_color = COLOR;
		// Generate runic pattern ticks via trig functions
		float rune_pattern = step(0.65, sin(UV.x * 120.0) * cos(UV.y * 10.0));
		float pulse = 0.85 + 0.15 * sin(TIME * pulse_speed * 6.28318);
		
		vec3 emissive = glyph_glow_color.rgb * rune_pattern * glow_intensity * pulse;
		COLOR = vec4(base_color.rgb + emissive, base_color.a);
	}
	"""

	var mat := ShaderMaterial.new()
	mat.shader = shader
	mat.set_shader_parameter("glyph_glow_color", crystal_color)
	mat.set_shader_parameter("glow_intensity", 1.5)
	mat.set_shader_parameter("pulse_speed", crystal_pulse_hz)
	_handrail_mesh.material = mat

	add_child(_handrail_mesh)


## Embeds ember-orange wall crystals along curved wall with gentle 0.2Hz pulse
func _setup_wall_crystals() -> void:
	var crystal_container := Node2D.new()
	crystal_container.name = "WallCrystals"
	add_child(crystal_container)

	for i in range(crystal_count):
		var t := float(i) / float(crystal_count - 1)
		var pos := _evaluate_staircase_path(t) + Vector2(40.0, -50.0)

		var light: Node2D
		if get_node_or_null("/root/CatacombLighting"):
			light = CatacombLighting.create_crystal_light(crystal_color, crystal_energy, pos, crystal_pulse_hz)
		else:
			var pl := PointLight2D.new()
			pl.color = crystal_color
			pl.energy = crystal_energy
			pl.position = pos
			pl.enabled = true
			light = pl
			# Gentle 0.2Hz pulse (period = 5 seconds)
			var tw := create_tween().set_loops()
			tw.tween_property(pl, "energy", crystal_energy * 1.25, 2.5)
			tw.tween_property(pl, "energy", crystal_energy * 0.75, 2.5)

		crystal_container.add_child(light)
		_crystal_lights.append(light)


## Camera for smooth upward tracking during climb
func _setup_camera() -> void:
	_camera = Camera2D.new()
	_camera.name = "StaircaseCamera"
	_camera.position = _evaluate_staircase_path(0.0)
	add_child(_camera)
	_camera.make_current()


## Audio player for staircase ascending key music
func _setup_staircase_audio() -> void:
	_audio_player = AudioStreamPlayer.new()
	_audio_player.name = "StaircaseAudioPlayer"
	_audio_player.autoplay = true
	_audio_player.pitch_scale = min_audio_pitch
	add_child(_audio_player)


## Called whenever climb progress updates to adjust camera pan and audio pitch
func _on_climb_progress_updated(progress: float) -> void:
	climb_progress_changed.emit(progress)

	# Pan camera along curve
	if _camera != null:
		_camera.position = _evaluate_staircase_path(progress)

	# Pitch shift audio upwards matching ascending key direction
	if _audio_player != null:
		_audio_player.pitch_scale = lerp(min_audio_pitch, max_audio_pitch, progress)
