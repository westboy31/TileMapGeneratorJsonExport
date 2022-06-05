### [DOWNLOAD](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/westboy31/TileMapGeneratorJsonExport/tree/main/Love2D%20%40westboy31)

# Installation

Add **TileMapGenerator.lua** to your source code, and add the exported folder from Tile Map Generator to your source code.

After requiring the file you can use **LoadFiles()** in love.load() function, the function take a string representing the path to the exported json file from Tile Map Generator, and returns loaded image in a table which every image has the index of the base name file.

Now you just have to run **draw()** function to draw your map inside love.draw() function.

Example :

```lua
love.load()
    tmg = require("TileMapGenerator")
    images = tmg.loadFiles("assets/map.json")
end 

love.draw()
    tmg.draw()
end
```
> Note :  Collision still not implemented
