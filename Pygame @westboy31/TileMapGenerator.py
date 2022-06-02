#Autor : westboy31
#Tile Map Generator : https://westboy.itch.io/tilemapgenerator
import os, json, pygame

Map = {}
Map["images"] = {}
Map["tiles"] = {}
Map["items"] = {}
Map["collisions"] = []
tmg_json = {}

def loadFiles(jsonPath) :
    global Map
    tmg_jsonFile = open(jsonPath)
    tmg_folder = os.path.dirname(jsonPath) + "/"

    global tmg_json
    tmg_json = json.load(tmg_jsonFile)
    tmg_TilesList = list(dict.fromkeys(tmg_json["TilesList"]))

    for img in tmg_TilesList :
        tile = pygame.image.load(tmg_folder + img)
        Map["images"][img.split(".")[0]] = tile

    for img in tmg_json["ItemsList"] :
        item =  pygame.image.load(tmg_folder + img)
        Map["images"][img.split(".")[0]] = item

    return Map["images"]


def drawMap(screen) :

    for T in list(tmg_json["Tiles"]) :
        tile = Map["images"][T["Tile"]]
        tile = pygame.transform.flip(tile, T["FlipHorizontally"] , T["FlipVertically"] )
        tile = screen.blit(tile , ( T["X"] * tmg_json["TileSize"] , T["Y"] * tmg_json["TileSize"] ) )
        Map["tiles"][  "ix"+ str(T["X"]) + "iy" + str(T["Y"]) ] = tile

    for I in list(tmg_json["Items"]) :
        item = screen.blit(Map["images"][I["Item"].split(".")[0]], ( I["X"]  , I["Y"] ) )
        Map["items"][  "x"+ str(I["X"]) + "y" + str(I["Y"]) ] = item

    if tmg_json["Map"] == "PlatformerHorizontal" or tmg_json["Map"] == "PlatformerMultidirectional" :
        for C in list(tmg_json["Collisions"]) :
            collision = pygame.Rect( C["X"], C["Y"], C["Width"], C["Height"] )
            Map["collisions"].append(collision)

    return Map
