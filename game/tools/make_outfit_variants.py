"""Makes dyed copies of the outfit textures so the cast doesn't all wear the
same two colors. Writes assets/characters/outfits/variants/T_<Outfit>_<name>.jpg.

Usage: python -I tools/make_outfit_variants.py   (from the game folder)

Ranger: the green cloth turns another hue. Peasant: the cream shirt is dyed.
Leather, metal and stitching keep their colors. 1024 px JPEG, since the
import caps character textures at 1024 anyway.
"""
import pathlib

import numpy as np
from PIL import Image

GAME = pathlib.Path(__file__).resolve().parent.parent
OUTFITS = GAME / "assets" / "characters" / "outfits"
OUT = OUTFITS / "variants"
SIZE = 1024

# name: (hue in degrees, saturation, brightness)
RANGER = {
    "slate": (212, 0.30, 0.95),
    "indigo": (238, 0.42, 0.70),
    "plum": (292, 0.48, 0.80),
    "teal": (186, 0.55, 0.85),
    "crimson": (356, 0.62, 0.78),
}
PEASANT = {
    "wine": (346, 0.55, 0.60),
    "saffron": (38, 0.62, 0.92),
    "lavender": (268, 0.30, 0.86),
    "indigo": (226, 0.45, 0.58),
    "crimson": (2, 0.62, 0.62),
    "moss": (88, 0.32, 0.66),
}


def smoothstep(e0, e1, x):
    t = np.clip((x - e0) / (e1 - e0), 0.0, 1.0)
    return t * t * (3.0 - 2.0 * t)


def load_hsv(name):
    img = Image.open(OUTFITS / name).convert("RGB").resize((SIZE, SIZE), Image.LANCZOS)
    hsv = np.asarray(img.convert("HSV"), dtype=np.float32) / 255.0
    return hsv[..., 0], hsv[..., 1], hsv[..., 2]


def save(h, s, v, name):
    hsv = np.stack([h, s, v], axis=-1)
    img = Image.fromarray(np.clip(hsv * 255.0 + 0.5, 0, 255).astype(np.uint8), "HSV").convert("RGB")
    OUT.mkdir(parents=True, exist_ok=True)
    img.save(OUT / name, quality=92, subsampling=0)


def hue_distance(h, center):
    d = np.abs(h - center)
    return np.minimum(d, 1.0 - d)


def ranger():
    h, s, v = load_hsv("T_Ranger_BaseColor.png")
    # The green cloth: hue around 95 degrees, clearly saturated.
    mask = (1.0 - smoothstep(0.10, 0.17, hue_distance(h, 95 / 360))) * smoothstep(0.10, 0.22, s)
    for name, (hue, sat, val) in RANGER.items():
        nh = np.where(mask > 0.0, hue / 360.0, h)
        ns = s * (1.0 - mask) + np.clip(s * sat * 1.6, 0.0, 1.0) * mask
        nv = v * (1.0 - mask) + v * val * mask
        save(nh, ns, nv, f"T_Ranger_{name}.jpg")


def peasant():
    h, s, v = load_hsv("T_Peasant_BaseColor.png")
    # The cream shirt: bright and nearly grey.
    mask = smoothstep(0.42, 0.55, v) * (1.0 - smoothstep(0.22, 0.38, s))
    for name, (hue, sat, val) in PEASANT.items():
        nh = np.where(mask > 0.0, hue / 360.0, h)
        ns = s * (1.0 - mask) + sat * mask
        nv = v * (1.0 - mask) + v * val * mask
        save(nh, ns, nv, f"T_Peasant_{name}.jpg")


if __name__ == "__main__":
    ranger()
    peasant()
    print("variants written to", OUT)
