from es3 import nif
from pathlib import Path

path = Path("H:/Python/Input")

textures = {"": True}

for file in path.rglob("*.nif"):

    textures_replaced = 0

    data = nif.NiStream()
    data.load(file)

    for tex in data.objects_of_type(nif.NiSourceTexture):
        tex.sanitize_filename()

        textures[tex.filename] = True

    data.save(file)


for texture in textures:
    print(f'"{texture}" : "",')