"""Sets up Godot import settings for the CC0 art in assets/.

Usage: python -I tools/setup_imports.py   (from the game folder)
Then run Godot's import (godot --headless --path . --import).

- Writes two BoneMaps onto Godot's humanoid profile: one for the Universal Base
  Characters / outfits / hair skeleton (Unreal-style names), one for the
  Universal Animation Library rig (Rigify DEF- names).
- Turns on Godot's retargeting for every skeleton, so all of them end up as
  %GeneralSkeleton with humanoid bone names and the library's animations play
  on any character.
- Textures (characters, surfaces, props, plants): VRAM compressed with mipmaps,
  capped at 1024 px, normal maps marked. Surface textures are loaded from code,
  so Godot can't detect their 3D use by itself; this sets it.
"""
import pathlib
import re

GAME = pathlib.Path(__file__).resolve().parent.parent
CHARS = GAME / "assets" / "characters"
TEXTURE_DIRS = [GAME / "assets" / d for d in ("characters", "textures", "props", "nature", "village")]

SIDES = [("Left", "l", "L"), ("Right", "r", "R")]
FINGERS = [("Thumb", "thumb", "thumb"), ("Index", "index", "f_index"), ("Middle", "middle", "f_middle"),
           ("Ring", "ring", "f_ring"), ("Little", "pinky", "f_pinky")]


def ue_map():
    m = {"Root": "root", "Hips": "pelvis", "Spine": "spine_01", "Chest": "spine_02", "UpperChest": "spine_03",
         "Neck": "neck_01", "Head": "Head"}
    for side, s, _ in SIDES:
        m[f"{side}Shoulder"] = f"clavicle_{s}"
        m[f"{side}UpperArm"] = f"upperarm_{s}"
        m[f"{side}LowerArm"] = f"lowerarm_{s}"
        m[f"{side}Hand"] = f"hand_{s}"
        for prof, ue, _ in FINGERS:
            parts = ["Metacarpal", "Proximal", "Distal"] if prof == "Thumb" else ["Proximal", "Intermediate", "Distal"]
            for i, p in enumerate(parts):
                m[f"{side}{prof}{p}"] = f"{ue}_0{i + 1}_{s}"
        m[f"{side}UpperLeg"] = f"thigh_{s}"
        m[f"{side}LowerLeg"] = f"calf_{s}"
        m[f"{side}Foot"] = f"foot_{s}"
        m[f"{side}Toes"] = f"ball_{s}"
    return m


def rigify_map():
    m = {"Root": "root", "Hips": "DEF-hips", "Spine": "DEF-spine.001", "Chest": "DEF-spine.002",
         "UpperChest": "DEF-spine.003", "Neck": "DEF-neck", "Head": "DEF-head"}
    for side, _, S in SIDES:
        m[f"{side}Shoulder"] = f"DEF-shoulder.{S}"
        m[f"{side}UpperArm"] = f"DEF-upper_arm.{S}"
        m[f"{side}LowerArm"] = f"DEF-forearm.{S}"
        m[f"{side}Hand"] = f"DEF-hand.{S}"
        for prof, _, rg in FINGERS:
            parts = ["Metacarpal", "Proximal", "Distal"] if prof == "Thumb" else ["Proximal", "Intermediate", "Distal"]
            for i, p in enumerate(parts):
                m[f"{side}{prof}{p}"] = f"DEF-{rg}.0{i + 1}.{S}"
        m[f"{side}UpperLeg"] = f"DEF-thigh.{S}"
        m[f"{side}LowerLeg"] = f"DEF-shin.{S}"
        m[f"{side}Foot"] = f"DEF-foot.{S}"
        m[f"{side}Toes"] = f"DEF-toe.{S}"
    return m


def write_bone_map(path, mapping):
    lines = ['[gd_resource type="BoneMap" load_steps=2 format=3]', "",
             '[sub_resource type="SkeletonProfileHumanoid" id="SkeletonProfileHumanoid_1"]', "",
             "[resource]", 'profile = SubResource("SkeletonProfileHumanoid_1")']
    for k, v in mapping.items():
        lines.append(f'bone_map/{k} = &"{v}"')
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def set_param(text, key, value):
    pat = re.compile(r"^" + re.escape(key) + r"=.*$", re.M)
    if pat.search(text):
        return pat.sub(lambda _m: f"{key}={value}", text)
    return text.rstrip("\n") + f"\n{key}={value}\n"


def retarget_subresources(skeleton_path, bone_map_res):
    return ('{\n"nodes": {\n"PATH:' + skeleton_path + '": {\n'
            f'"retarget/bone_map": Resource("{bone_map_res}"),\n'
            '"retarget/bone_renamer/rename_bones": true,\n'
            '"retarget/bone_renamer/unique_node/make_unique": true,\n'
            '"retarget/bone_renamer/unique_node/skeleton_name": "GeneralSkeleton"\n'
            "}\n}\n}")


def main():
    write_bone_map(CHARS / "bone_map_ue.tres", ue_map())
    write_bone_map(CHARS / "bone_map_rigify.tres", rigify_map())
    scenes = 0
    for imp in sorted(CHARS.rglob("*.gltf.import")) + sorted(CHARS.rglob("*.glb.import")):
        text = imp.read_text(encoding="utf-8")
        rigify = "AnimationLibrary" in imp.name
        skel = "Rig/Skeleton3D" if rigify else "Armature/Skeleton3D"
        bmap = "res://assets/characters/bone_map_rigify.tres" if rigify else "res://assets/characters/bone_map_ue.tres"
        text = re.sub(r"^_subresources=.*?(?=^\w|\Z)", "_subresources=" + retarget_subresources(skel, bmap) + "\n",
                      text, flags=re.M | re.S)
        # Distance LODs for outfits and hair; the base bodies stay whole (the head is cut from them in code).
        lods = "false" if ("/base/" in imp.as_posix() or rigify) else "true"
        text = set_param(text, "meshes/generate_lods", lods)
        imp.write_text(text, encoding="utf-8")
        scenes += 1
    textures = 0
    imports = []
    for d in TEXTURE_DIRS:
        imports += sorted(d.rglob("*.png.import")) + sorted(d.rglob("*.jpg.import"))
    for imp in imports:
        text = imp.read_text(encoding="utf-8")
        normal = "normal" in imp.name.lower() or "_nor_gl" in imp.name.lower()
        for k, v in [("compress/mode", "2"), ("mipmaps/generate", "true"), ("process/size_limit", "1024"),
                     ("compress/normal_map", "1" if normal else "0"), ("detect_3d/compress_to", "0")]:
            text = set_param(text, k, v)
        imp.write_text(text, encoding="utf-8")
        textures += 1
    print(f"bone maps written; {scenes} scenes and {textures} textures set up")


if __name__ == "__main__":
    main()
