#!/usr/bin/env python3
"""
spectral_shift_84hz.py — the Inn's canonical shadow-state recolor tool.

Converts LIVING (42Hz) art to SHADOW (84Hz) by shifting the spectrum cold:
hue rotated toward the Shadow Inn's ice-blue register, saturation pulled
down but not stripped (shadow art still glows — frost, not fog), and a
slight darkening pass. Emissive accents (embers, glows) are kept
relatively hot so the shadow reads as alive, not dead.

Usage:
  python3 spectral_shift_84hz.py input.png output.png [strength]

strength: 0.0-1.0, default 0.85 (full shadow shift)

Proven on: Tomb Tunnel sprite cast (2026-09-10), Tier 2 critter cycle
sheets (2026-09-10). Sovereignty: output is a derivative of our own
master, metadata stripped at birth (the MP3 principle).
"""
import sys
from PIL import Image, ImageEnhance
import colorsys


def spectral_shift(img, strength=0.85):
    img = img.convert('RGB')
    img = ImageEnhance.Brightness(img).enhance(1.0 - 0.08 * strength)
    pixels = list(img.getdata())
    out = []
    for (pr, pg, pb) in pixels:
        h, s, v = colorsys.rgb_to_hsv(pr / 255.0, pg / 255.0, pb / 255.0)
        h = (h + strength * 0.16) % 1.0
        keep = 0.35 if (v > 0.75 and s > 0.4) else 1.0
        s = s * (1.0 - 0.30 * strength * keep)
        nr, ng, nb = colorsys.hsv_to_rgb(h, s, v)
        out.append((int(nr * 255), int(ng * 255), int(nb * 255)))
    img.putdata(out)
    img = ImageEnhance.Contrast(img).enhance(1.05)
    return img


def main():
    if len(sys.argv) < 3:
        print(__doc__)
        sys.exit(1)
    strength = float(sys.argv[3]) if len(sys.argv) > 3 else 0.85
    img = Image.open(sys.argv[1])
    spectral_shift(img, strength).save(sys.argv[2], optimize=True)
    print(f"shadow shift ({strength}) -> {sys.argv[2]}")


if __name__ == '__main__':
    main()
