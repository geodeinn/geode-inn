## catacomb_lighting.gd
## Autoload Singleton (CatacombLighting) for Geode Inn catacomb lighting and atmosphere presets.
## Defines master color palette, epilepsy-safe light generators, CPUParticles2D mist,
## water reflection ShaderMaterial, and zone atmosphere configuration.
extends Node

# ==============================================================================
# MASTER COLOR PALETTE (Extracted from Video Analysis)
# ==============================================================================

# Warm Tones (lanterns, torches, sconces, oil lamps)
const COLOR_WARM_LANTERN_AMBER: Color = Color("#F5B041")
const COLOR_WARM_LANTERN_SOFT: Color = Color("#F8D59A")
const COLOR_WARM_TORCH_ORANGE: Color = Color("#FF9900")
const COLOR_WARM_SCONCE_GOLD: Color = Color("#FFB347")
const COLOR_WARM_OIL_LAMP: Color = Color("#F4A460")
const COLOR_WARM_TORCH_BRIGHT: Color = Color("#FFC56E")

# Cool Tones (ambient darkness, teals, runes, crystals, geode blue)
const COLOR_COOL_AMBIENT_DARK: Color = Color("#0F1A1A")
const COLOR_COOL_TEAL_SHADOW: Color = Color("#3B5B65")
const COLOR_COOL_TURQUOISE: Color = Color("#00E6FF")
const COLOR_COOL_CYAN_RUNE: Color = Color("#00FFFF")
const COLOR_COOL_RUNE_LIGHT: Color = Color("#64FDFD")
const COLOR_COOL_GEODE_BLUE: Color = Color("#AACCFF")

# Stone / Neutral Tones
const COLOR_STONE_BEIGE: Color = Color("#B9A89A")
const COLOR_STONE_SANDSTONE: Color = Color("#C2A88D")
const COLOR_STONE_MAP_TABLE: Color = Color("#D6CDB8")
const COLOR_STONE_DARK_ACCENT: Color = Color("#4A4D46")

# Special Tones (fae portal gradients, glowing flora)
const COLOR_PORTAL_LIME: Color = Color("#80FF80")
const COLOR_PORTAL_CYAN: Color = Color("#80FFFF")
const COLOR_MUSHROOM_CREAM: Color = Color("#FDFDE0")


# ==============================================================================
# LIGHT FACTORY FUNCTIONS (Epilepsy-Safe Design)
# ==============================================================================

## Creates a standard torch or lantern PointLight2D with texture flicker disabled
## or set to minimal, non-strobing values for epilepsy safety.
func create_torch_light(
	color: Color = COLOR_WARM_TORCH_ORANGE,
	energy: float = 1.0,
	position: Vector2 = Vector2.ZERO
) -> PointLight2D:
	var light := PointLight2D.new()
	light.color = color
	light.energy = energy
	light.position = position
	light.texture = _generate_radial_light_texture(256)
	light.texture_scale = 1.5
	# Epilepsy Safety: flicker/noise is disabled to maintain steady luminance
	light.enabled = true
	return light


## Creates a crystal or rune PointLight2D with very gentle, slow sine-wave pulsing.
## Frequency pulse_hz defaults to 0.3Hz (safe, calm ambient pulse).
func create_crystal_light(
	color: Color = COLOR_COOL_TURQUOISE,
	energy: float = 1.0,
	position: Vector2 = Vector2.ZERO,
	pulse_hz: float = 0.3
) -> PointLight2D:
	var light := PointLight2D.new()
	light.color = color
	light.energy = energy
	light.position = position
	light.texture = _generate_radial_light_texture(256)
	light.texture_scale = 1.8
	
	# Attach embedded GDScript for gentle pulsing without strobing
	var script := GDScript.new()
	script.source_code = """
extends PointLight2D

var base_energy: float = 1.0
var pulse_hz: float = 0.3
var _time: float = 0.0

func _ready() -> void:
	base_energy = energy

func _process(delta: float) -> void:
	_time += delta
	# Subtle sine modulation (±8% energy) safe for sensitive viewers
	energy = base_energy + sin(_time * pulse_hz * TAU) * (base_energy * 0.08)
"""
	script.reload()
	light.set_script(script)
	light.set("pulse_hz", pulse_hz)
	light.set("base_energy", energy)
	return light


## Creates a CPUParticles2D node configured for slow atmospheric catacomb mist.
func create_mist_particles() -> CPUParticles2D:
	var mist := CPUParticles2D.new()
	mist.amount = 40
	mist.lifetime = 8.0
	mist.preprocess = 4.0
	mist.speed_scale = 0.5
	mist.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	mist.emission_rect_extents = Vector2(600, 200)
	mist.direction = Vector2(0, -1)
	mist.spread = 45.0
	mist.gravity = Vector2(0, -2)
	mist.initial_velocity_min = 5.0
	mist.initial_velocity_max = 15.0
	mist.scale_amount_min = 12.0
	mist.scale_amount_max = 30.0
	mist.color = Color(0.7, 0.85, 0.9, 0.12) # Low-alpha hazy atmospheric tint
	return mist


## Generates a water reflection ShaderMaterial for shallow pools and damp floors.
func create_water_reflection() -> ShaderMaterial:
	var mat := ShaderMaterial.new()
	var shader := Shader.new()
	shader.code = """
shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform vec4 water_tint : source_color = vec4(0.0, 0.35, 0.45, 0.35);
uniform float wave_speed : hint_range(0.1, 3.0) = 0.6;
uniform float wave_frequency : hint_range(1.0, 50.0) = 12.0;
uniform float wave_amplitude : hint_range(0.001, 0.05) = 0.004;

void fragment() {
	vec2 uv = SCREEN_UV;
	// Gentle wave distortion along vertical axis
	float wave = sin(uv.y * wave_frequency + TIME * wave_speed) * wave_amplitude;
	uv.x += wave;
	
	vec4 screen_color = texture(SCREEN_TEXTURE, uv);
	COLOR = mix(screen_color, water_tint, water_tint.a);
}
"""
	mat.shader = shader
	return mat


# ==============================================================================
# ATMOSPHERE & ZONE CONFIGURATION
# ==============================================================================

## Applies environmental lighting and fog parameters based on zone name.
## Modifies target_canvas_modulate if provided, and returns settings dictionary.
func apply_zone_atmosphere(zone_name: String, target_canvas_modulate: CanvasModulate = null) -> Dictionary:
	var settings := {
		"canvas_color": COLOR_COOL_TEAL_SHADOW,
		"fog_color": COLOR_COOL_AMBIENT_DARK,
		"fog_density": 0.02,
		"ambient_energy": 0.8
	}
	
	match zone_name.to_lower():
		"map_chamber":
			settings["canvas_color"] = Color("#182026") # Moody dark slate
			settings["fog_color"] = COLOR_COOL_AMBIENT_DARK
			settings["fog_density"] = 0.01
			settings["ambient_energy"] = 0.9
			
		"geode_cave":
			settings["canvas_color"] = Color("#0D141F") # Deep sapphire darkness
			settings["fog_color"] = COLOR_COOL_AMBIENT_DARK
			settings["fog_density"] = 0.025
			settings["ambient_energy"] = 0.7
			
		"fae_portal":
			settings["canvas_color"] = Color("#122018") # Ethereal forest shadows
			settings["fog_color"] = Color("#1A2E20")
			settings["fog_density"] = 0.03
			settings["ambient_energy"] = 0.85
			
		"serpent_hall":
			settings["canvas_color"] = Color("#0A1E24") # Underwater cyan ambiance
			settings["fog_color"] = COLOR_COOL_CYAN_RUNE
			settings["fog_density"] = 0.04
			settings["ambient_energy"] = 0.75
			
		"egyptian_vault":
			settings["canvas_color"] = Color("#241B14") # Warm sandstone shadows
			settings["fog_color"] = COLOR_STONE_DARK_ACCENT
			settings["fog_density"] = 0.015
			settings["ambient_energy"] = 0.85
			
		"tunnel_approach", "catacombs_default", _:
			settings["canvas_color"] = Color("#1A2A2A") # Standard teal darkness
			settings["fog_color"] = COLOR_COOL_AMBIENT_DARK
			settings["fog_density"] = 0.02
			settings["ambient_energy"] = 0.8
			
	if target_canvas_modulate and is_instance_valid(target_canvas_modulate):
		target_canvas_modulate.color = settings["canvas_color"]
		
	return settings


# ==============================================================================
# INTERNAL HELPER METHODS
# ==============================================================================

func _generate_radial_light_texture(size: int = 256) -> GradientTexture2D:
	var grad := Gradient.new()
	grad.set_color(0, Color(1, 1, 1, 1))
	grad.set_color(1, Color(1, 1, 1, 0))
	
	var tex := GradientTexture2D.new()
	tex.gradient = grad
	tex.fill = GradientTexture2D.FILL_RADIAL
	tex.fill_from = Vector2(0.5, 0.5)
	tex.fill_to = Vector2(1.0, 0.5)
	tex.width = size
	tex.height = size
	return tex
