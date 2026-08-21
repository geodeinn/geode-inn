## fae_portal.gd
## Fae Kingdom entrance portal script for Geode Inn.
## Features an arched stone doorway with Celtic knot carvings, gradient animated portal shader,
## circle of glowing mushrooms, warm torch, vine growth animation, continuous 432Hz hum audio,
## and transition Area2D trigger.
extends Node2D

# Designer-tweakable parameters
@export var target_scene_path: String = "res://scenes/fae_kingdom.tscn"
@export var portal_position: Vector2 = Vector2(640, 320)
@export var portal_size: Vector2 = Vector2(240, 360)

@export var torch_position: Vector2 = Vector2(360, 340)
@export var torch_color: Color = Color("#FF8C00") # Warm orange torch
@export var torch_energy: float = 0.6

@export var mushroom_circle_center: Vector2 = Vector2(640, 500)
@export var mushroom_count: int = 7
@export var mushroom_radius: float = 80.0
@export var mushroom_color: Color = CatacombLighting.COLOR_MUSHROOM_CREAM # #FDFDE0
@export var mushroom_energy: float = 0.4
@export var mushroom_pulse_hz: float = 0.2

@export var portal_hum_frequency: float = 432.0 # Gatekeeper gargoyle frequency

# Signals
signal portal_entered(destination_scene: String)

# Node references
var _portal_sprite: ColorRect
var _portal_shader_mat: ShaderMaterial
var _mushroom_lights: Array[PointLight2D] = []
var _vines_sprite: Sprite2D
var _vine_growth_tween: Tween
var _hum_audio_player: AudioStreamPlayer
var _trigger_area: Area2D
var _canvas_modulate: CanvasModulate


func _ready() -> void:
	_setup_atmosphere()
	_setup_stone_archway()
	_setup_portal_shader()
	_setup_mushroom_circle()
	_setup_torch()
	_setup_vines_growth()
	_setup_portal_trigger()
	_setup_portal_hum_audio()


func _process(_delta: float) -> void:
	# Keep runtime loop ready for dynamic portal interactions
	pass


func _setup_atmosphere() -> void:
	_canvas_modulate = CanvasModulate.new()
	_canvas_modulate.name = "CanvasModulate"
	add_child(_canvas_modulate)
	CatacombLighting.apply_zone_atmosphere("fae_portal", _canvas_modulate)
	
	var mist := CatacombLighting.create_mist_particles()
	mist.position = portal_position
	add_child(mist)


func _setup_stone_archway() -> void:
	var arch_sprite := Sprite2D.new()
	arch_sprite.name = "CelticStoneArchway"
	arch_sprite.position = portal_position
	arch_sprite.modulate = CatacombLighting.COLOR_STONE_BEIGE
	add_child(arch_sprite)


func _setup_portal_shader() -> void:
	# Custom shader for portal: gradient #80FF80 (left) to #80FFFF (right), animated UV scroll
	var shader := Shader.new()
	shader.code = """
shader_type canvas_item;

uniform vec4 color_left : source_color = vec4(0.502, 1.0, 0.502, 1.0);  // #80FF80
uniform vec4 color_right : source_color = vec4(0.502, 1.0, 1.0, 1.0); // #80FFFF
uniform float scroll_speed : hint_range(0.01, 1.0) = 0.15;
uniform float wave_freq : hint_range(0.5, 10.0) = 3.0;

void fragment() {
	vec2 uv = UV;
	// Animated vertical UV scroll with gentle horizontal wave
	float wave = sin(uv.y * wave_freq + TIME * 2.0) * 0.04;
	vec2 scrolled_uv = vec2(clamp(uv.x + wave, 0.0, 1.0), fract(uv.y - TIME * scroll_speed));
	
	// Gradient interpolation from #80FF80 (left) to #80FFFF (right)
	vec4 base_color = mix(color_left, color_right, scrolled_uv.x);
	
	// Archway alpha boundary mask (soft arch shape fade)
	float arch_mask = sin(UV.x * 3.14159) * sin(UV.y * 3.14159);
	COLOR = vec4(base_color.rgb, base_color.a * arch_mask * 0.85);
}
"""
	_portal_shader_mat = ShaderMaterial.new()
	_portal_shader_mat.shader = shader
	
	_portal_sprite = ColorRect.new()
	_portal_sprite.name = "PortalEffectRect"
	_portal_sprite.position = portal_position - (portal_size / 2.0)
	_portal_sprite.size = portal_size
	_portal_sprite.material = _portal_shader_mat
	add_child(_portal_sprite)


func _setup_mushroom_circle() -> void:
	# Circle of glowing mushrooms (#FDFDE0, energy 0.4) on floor before archway
	# Pulse frequency 0.2Hz for epilepsy safety
	for i in range(mushroom_count):
		var angle := (float(i) / float(mushroom_count)) * TAU
		var pos := mushroom_circle_center + Vector2(cos(angle), sin(angle) * 0.4) * mushroom_radius
		
		var mushroom_light := CatacombLighting.create_crystal_light(
			mushroom_color,
			mushroom_energy,
			pos,
			mushroom_pulse_hz
		)
		mushroom_light.name = "GlowingMushroom_%d" % i
		add_child(mushroom_light)
		_mushroom_lights.append(mushroom_light)


func _setup_torch() -> void:
	# Warm torch on left side (#FF8C00)
	var torch := CatacombLighting.create_torch_light(
		torch_color,
		torch_energy,
		torch_position
	)
	torch.name = "LeftSideWarmTorch"
	add_child(torch)


func _setup_vines_growth() -> void:
	# Thin vines growing up sides of archway with alpha mask animation
	_vines_sprite = Sprite2D.new()
	_vines_sprite.name = "ArchwayVinesSprite"
	_vines_sprite.position = portal_position
	_vines_sprite.modulate = Color(1.0, 1.0, 1.0, 0.0) # Start invisible for growth tween
	add_child(_vines_sprite)
	
	# Animate vine growth over 3 seconds
	_vine_growth_tween = create_tween()
	_vine_growth_tween.tween_property(_vines_sprite, "modulate:a", 0.9, 3.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)


func _setup_portal_trigger() -> void:
	# Area2D trigger at archway that transitions to Fae Kingdom scene
	_trigger_area = Area2D.new()
	_trigger_area.name = "FaePortalTriggerArea"
	_trigger_area.position = portal_position
	
	var col := CollisionShape2D.new()
	var rect := RectangleShape2D.new()
	rect.size = Vector2(100, 200)
	col.shape = rect
	_trigger_area.add_child(col)
	
	_trigger_area.body_entered.connect(_on_portal_body_entered)
	_trigger_area.area_entered.connect(_on_portal_area_entered)
	add_child(_trigger_area)


func _setup_portal_hum_audio() -> void:
	# Portal hum audio synthesized at 432Hz (Gatekeeper gargoyle frequency)
	var sample_rate := 44100
	var duration := 2.0 # 2-second looping stream buffer
	var num_samples := int(sample_rate * duration)
	var pcm_data := PackedByteArray()
	pcm_data.resize(num_samples * 2)
	
	for i in range(num_samples):
		var t := float(i) / float(sample_rate)
		# Smooth continuous 432Hz sine wave with soft 2nd harmonic
		var wave := sin(TAU * portal_hum_frequency * t) * 0.4 + sin(TAU * portal_hum_frequency * 0.5 * t) * 0.1
		var sample_int := int(clampf(wave, -1.0, 1.0) * 32767.0)
		pcm_data.encode_s16(i * 2, sample_int)
		
	var wav := AudioStreamWav.new()
	wav.format = AudioStreamWav.FORMAT_16_BITS
	wav.mix_rate = sample_rate
	wav.loop_mode = AudioStreamWav.LOOP_FORWARD
	wav.loop_begin = 0
	wav.loop_end = num_samples
	wav.data = pcm_data
	
	_hum_audio_player = AudioStreamPlayer.new()
	_hum_audio_player.name = "PortalHumAudioPlayer"
	_hum_audio_player.stream = wav
	_hum_audio_player.volume_db = -10.0
	add_child(_hum_audio_player)
	_hum_audio_player.play()


func _on_portal_body_entered(body: Node) -> void:
	_trigger_scene_transition(body.name)


func _on_portal_area_entered(area: Area2D) -> void:
	_trigger_scene_transition(area.name)


func _trigger_scene_transition(entered_by: String) -> void:
	print("[FaePortal] Portal trigger activated by %s -> Transitioning to %s" % [entered_by, target_scene_path])
	portal_entered.emit(target_scene_path)
	
	if target_scene_path != "" and ResourceLoader.exists(target_scene_path):
		get_tree().change_scene_to_file(target_scene_path)
