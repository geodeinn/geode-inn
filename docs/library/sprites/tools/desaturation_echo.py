#!/usr/bin/env python3
"""
desaturation_echo.py — the Inn's canonical Echo-state tool (the In-Between).

Converts LIVING (42Hz) art to ECHO (In-Between) by the desaturation protocol:
the color drained but the form intact — "grey Rackham, the canopy without its
color." Not a shadow (no darkening, no cold cast): the Echo is the zone held
in the grey between states, presence without frequency.

Proven on: Silk Road route/platform Echo states (2026-09-10, same protocol),
now formalized as the zone-wide tool.

Usage:
  python3 desaturation_echo.py input.png output.png [strength]

strength: 0.0-1.0, default 0.9 (full echo drain)
"""
import sys
from PIL import Image, ImageEnhance


def echo_drain(img, strength=0.9):
    img = img.convert('RGB')
    # Saturation pulled toward zero, not all the way — the ghost of the color stays
    img = ImageEnhance.Color(img).enhance(1.0 - strength)
    # Slight midtone lift: the grey is present, not dead
    img = ImageEnhance.Brightness(img).enhance(1.0 + 0.04 * strength)
    img = ImageEnhance.Contrast(img).enhance(1.0 - 0.05 * strength)
    return img


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print(__doc__); sys.exit(1)
    src, dst = sys.argv[1], sys.argv[2]
    s = float(sys.argv[3]) if len(sys.argv) > 3 else 0.9
    echo_drain(Image.open(src), s).save(dst, optimize=True)
    print(f"echo: {dst}")
