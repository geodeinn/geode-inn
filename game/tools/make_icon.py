"""Draws the game's icon: a geode broken open, amethyst inside, the hearth's
amber glow at its heart, ringed in the boot logo's gold.

Usage: python -I tools/make_icon.py   (from the game folder)
Writes icon.png (512 px, the window icon) and icon.ico (16 to 256 px, the .exe).
"""
import math
import pathlib
import random

from PIL import Image, ImageDraw, ImageFilter

GAME = pathlib.Path(__file__).resolve().parent.parent
S = 512          # drawn at 2x, then scaled down for clean edges
C = S * 2


def main():
    rnd = random.Random(42)
    img = Image.new("RGBA", (C, C), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    cx = cy = C // 2
    r_out = C * 0.46
    # The rock: a rough dark shell.
    pts = []
    for i in range(48):
        a = i / 48 * math.tau
        rr = r_out * (0.94 + 0.06 * rnd.random())
        pts.append((cx + math.cos(a) * rr, cy + math.sin(a) * rr))
    d.polygon(pts, fill=(58, 44, 40, 255))
    # The band of agate inside the shell.
    for k, col in enumerate([(92, 72, 66), (128, 104, 112), (176, 160, 182), (96, 70, 120)]):
        rr = r_out * (0.86 - k * 0.06)
        d.ellipse([cx - rr, cy - rr, cx + rr, cy + rr], fill=col + (255,))
    # Amethyst crystals pointing inward.
    r_in = r_out * 0.62
    d.ellipse([cx - r_in, cy - r_in, cx + r_in, cy + r_in], fill=(70, 40, 100, 255))
    for i in range(60):
        a = i / 60 * math.tau + rnd.random() * 0.05
        base = r_in * (0.98 + 0.03 * rnd.random())
        tip = r_in * (0.34 + 0.32 * rnd.random())
        w = 0.07 + 0.04 * rnd.random()
        p0 = (cx + math.cos(a - w) * base, cy + math.sin(a - w) * base)
        p1 = (cx + math.cos(a + w) * base, cy + math.sin(a + w) * base)
        pt = (cx + math.cos(a) * tip, cy + math.sin(a) * tip)
        shade = 0.6 + 0.4 * (0.5 + 0.5 * math.cos(a - 2.3))   # light from the upper left
        col = (int(150 * shade + 40), int(90 * shade + 20), int(200 * shade + 30), 255)
        d.polygon([p0, p1, pt], fill=col)
        d.line([p0, pt], fill=(230, 200, 255, 90), width=2)
    # The glow at the heart: the fire kept lit.
    glow = Image.new("RGBA", (C, C), (0, 0, 0, 0))
    gd = ImageDraw.Draw(glow)
    for k in range(40, 0, -1):
        rr = r_in * 0.5 * k / 40
        t = 1 - k / 40
        gd.ellipse([cx - rr, cy - rr, cx + rr, cy + rr], fill=(255, int(140 + 100 * t), int(40 + 140 * t), int(20 + 225 * t)))
    glow = glow.filter(ImageFilter.GaussianBlur(C * 0.02))
    img = Image.alpha_composite(img, glow)
    # The gold ring of the boot logo.
    d = ImageDraw.Draw(img)
    rr = r_out * 1.02
    d.ellipse([cx - rr, cy - rr, cx + rr, cy + rr], outline=(217, 168, 77, 255), width=int(C * 0.018))
    img = img.resize((S, S), Image.LANCZOS)
    img.save(GAME / "icon.png")
    img.save(GAME / "icon.ico", sizes=[(16, 16), (24, 24), (32, 32), (48, 48), (64, 64), (128, 128), (256, 256)])
    print("icon.png and icon.ico written")


if __name__ == "__main__":
    main()
