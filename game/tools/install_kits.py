"""Copies the CC0 environment kits into assets/ (models as glTF, textures
scaled down to 1024 px, since the import caps textures there anyway).

Usage: python -I tools/install_kits.py <kits dir>
<kits dir> holds the unzipped packs:
  props/   Quaternius Fantasy Props MegaKit [Standard]
  nature/  Quaternius Stylized Nature MegaKit [Standard]
  village/ Quaternius Medieval Village MegaKit [Standard]
  ph_tex/  Poly Haven textures (<id>/<id>_diff|nor_gl|rough_1k.jpg) and the sky .hdr
Only model and image files are copied; nothing in the packs is run.
"""
import pathlib
import shutil
import sys

from PIL import Image

GAME = pathlib.Path(__file__).resolve().parent.parent
ASSETS = GAME / "assets"
MAX = 1024

VILLAGE_MODELS = [
    "Prop_Wagon", "Prop_WoodenFence_Single", "Prop_WoodenFence_Extension1", "Prop_WoodenFence_Extension2",
    "Prop_Crate", "Prop_Chimney", "Prop_Vine1", "Prop_Vine2", "Prop_Vine4", "Prop_Support",
]
VILLAGE_TEXTURES = ["T_Plaster", "T_UnevenBrick", "T_Brick", "T_RedBrick", "T_RoundTiles", "T_WoodTrim", "T_RockTrim"]


def image(src: pathlib.Path, dst: pathlib.Path) -> None:
    dst.parent.mkdir(parents=True, exist_ok=True)
    im = Image.open(src)
    if max(im.size) > MAX:
        im = im.resize((MAX, MAX * im.size[1] // im.size[0]), Image.LANCZOS)
    im.save(dst)


def copy_models(src_dir: pathlib.Path, tex_dirs, dst: pathlib.Path, names=None) -> int:
    dst.mkdir(parents=True, exist_ok=True)
    count = 0
    needed = set()
    for gltf in sorted(src_dir.glob("*.gltf")):
        if names is not None and gltf.stem not in names:
            continue
        shutil.copy2(gltf, dst / gltf.name)
        shutil.copy2(gltf.with_suffix(".bin"), dst / (gltf.stem + ".bin"))
        text = gltf.read_text(encoding="utf-8")
        for part in text.split('"uri"')[1:]:
            uri = part.split('"')[1]
            if uri.lower().endswith((".png", ".jpg")):
                needed.add(uri)
        count += 1
    for uri in sorted(needed):
        for d in tex_dirs:
            if (d / uri).exists():
                image(d / uri, dst / uri)
                break
        else:
            print("  texture not found:", uri)
    return count


def main(kits: str) -> None:
    k = pathlib.Path(kits)
    props = k / "props" / "x"
    n = copy_models(props / "Exports" / "glTF", [props / "Exports" / "glTF", props / "Textures"], ASSETS / "props")
    print("props:", n)
    nature = k / "nature" / "x"
    n = copy_models(nature / "glTF", [nature / "glTF", nature / "Textures"], ASSETS / "nature")
    print("nature:", n)
    village = k / "village" / "x" / "Medieval Village MegaKit[Standard]"
    vt = village / "Textures"
    n = copy_models(village / "glTF", [village / "glTF", vt / "Normals Godot-Unity", vt], ASSETS / "village", set(VILLAGE_MODELS))
    print("village:", n)
    for t in VILLAGE_TEXTURES:
        for kind in ["BaseColor", "Normal", "Roughness", "ORM"]:
            name = f"{t}_{kind}.png"
            src = vt / "Normals Godot-Unity" / name if kind == "Normal" and (vt / "Normals Godot-Unity" / name).exists() else vt / name
            if src.exists():
                image(src, ASSETS / "textures" / "village" / name)
    ph = k / "ph_tex"
    for d in sorted(p for p in ph.iterdir() if p.is_dir()):
        for f in d.glob("*.jpg"):
            dst = ASSETS / "textures" / "surfaces" / d.name / f.name
            dst.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(f, dst)
    for hdr in ph.glob("*.hdr"):
        (ASSETS / "sky").mkdir(parents=True, exist_ok=True)
        shutil.copy2(hdr, ASSETS / "sky" / hdr.name)
    print("textures and sky copied")


if __name__ == "__main__":
    main(sys.argv[1])
