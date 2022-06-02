### [Download](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/westboy31/TileMapGeneratorJsonExport/tree/main/Pygame%20%40westboy31)
# INSTALLATION

Add **TileMapGenerator.py** file to your source code and the exported files from Tile Map Generator.

In your main game file import the module :

```python
import TileMapGenerator as tmg #or as you want
```

To load images use **loadFiles()** function, it takes only one parameter it the path to the exported json file form Tile Map Generator, and the function returns **dict** containing **pygame.Surface** referenced by the base name of the file as key :

```python
images = tmg.loadFiles("assets/map.json") 
print(images["Base name of file"]) # <Surface(80x32x32 SW)>
```

Now you can create your map with the function **drawMap()** , it takes the pygame.Surface of your game as parameter, and the function returns :

- **images :** the same as previous.
  
- **tiles :** **dict** containing pygame.Rect of every tile referenced by the key "ix" + "X index" + "iy" + "Y index"
  
- **items:** **dict** containing pygame.Rect of every item referenced by the key "x" + "X coordinate" + "y" + "Y coordinate"
  
- collisions: **list** containing pygame.Rect of every collision
  

```python
images = tmg.loadFiles("assets/map.json") 
screen = pygame.display.set_mode(size)

while Game :
    map = tmg.drawMap(screen)

print(map["tiles"]["ix2iy80"]) 
# print Rect of the tile that has 2 in x coordinate and 80 in y coordinate

print(map["items"]["x200y500"]) 
# print rect of the item situated in (200,500) coordinate of the map

print(map["collisions"][0]) 
# print the first rect collisio of your game
```
