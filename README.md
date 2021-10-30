

<img src="C:\Users\user\game   dev\gdevlop\map gnerator\icon_loading.png" style="zoom:50%;" />

# Tile Map Generator 

## -Using json exports with game engines-

This repository is made to propose code samples and extensions for different game engines in order to be able to use the json export of the tool [tile map generator](https://westboy.itch.io/tilemapgenerator).

### About Tile Map Generator :

This is a tool available on itch.io, that generates maps of deferent type of game for more information check the [page](https://westboy.itch.io/tilemapgenerator)

### Structure of the json export file :

```json
{
    "Map" : "[string] the name of the map (dungeon or platformer ...)",
    "TileSize" : "[number] the size of every tile",
    "Column" : "[number] the number of columns in the map (WidthMap/TileSize)",
    "Raw" : "[number] the number of raws in the map (HeighthMap/TileSize)",
    "ReferencesList" : "[list of strings] list of strings that refer to tile (used by the tool)",
    "TilesList" : "[list of strings] list of file names used as tiles (with extensions png/jpg)"
    "ItemsList" : "[list of strings] list of file names used as tiles (with extensions png/jpg)"
    "Background" : {
    	"Source" : "[string] name of the file (without extension)",
    	"Extension" : "[string] extension (png/jpg)",
    	"Reference" : "[string] (used by the tool)"  },
    "Tiles" : [
      {"Tile" : "[string] name of the file (without extension)",
       "Extension" : "[string] extension (png/jpg)",
       "Reference" : "[string] (used by the tool)",
       "FlipHorizontally" : "[bool] if the tile need to be flipped horizontally",
       "FlipVertically" : "[bool] if the tile need to be flipped vertically",
       "X" : "[number] column position of the tile (it starts with 0)",
       "Y" : "[number] raw position of the tile (it starts with 0)"   },
        ...
             ]
    "Items" : [
      {"Item" : "[strin] file name of the item with extension",
       "Reference" : "[string] used by the tool",
       "X" : "[number] position x in pixel of the item",
       "Y" : "[number] position y in pixel of the item"   },
        ...
    ],
    "Collisions" : [
      {
       "X" : "[number] position x in pixel of the collision (rectangle)",
       "Y" : "[number] position y in pixel of the collision (rectangle)",
       "Width" : "[number] width in pixel of the collision (rectangle)",
       "Height" : "[number] height in pixel of the collision shape (rectangle)"  
        }
    ]
}
```

## How  to contribute 

### Pull request :

Fork the project then push in your branch a folder named like this "your game engine @userGithub", and this folder has to contain the extension or the sample code that allows using the json export, and a README.md file that explain how to integrate and use your extension, then pull request.
If you realy don't want to fork the project you could propose your file in issues and send your folder as zip file.
If you find your that your game engine that you use already exist and you estimate that you have another approach or a better adaptation you can pull your folder but don't delete or push over of another user.

### Issues :

If you find some issues when using one of the extensions don't hesitate so signal it 

Thank you to everyone who will contribute to this repository  :thumbsup: