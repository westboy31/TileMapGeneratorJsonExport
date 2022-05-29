## [Download]([DownGit](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/westboy31/TileMapGeneratorJsonExport/tree/main/Godot%20%40westboy31))

# Installation

- First import your images tiles and your items as they have been exported from Tile Map Generator (don't change the name) in Godot file system

- In Godot you need to turn items images to individual tscn file, for example : item.png &rarr; item.tscn   (don't change base name)
  inside your tscn you are free to add or do anything you want.

- Now you need to import **TileMapGenerator.gd** and **TileMapGenerator.tscn** and **tmg_icon.png** in your file system.

- Then create the node TileMapGenerator (as you create any other nodes).

- In the ispector panel of the node you have to fill two field :
  
  - **Tmg Json Path :** the path to the json file which have been exported with Tile Map Generator.
  
  - **Tmg Item Folder :** the path of the folder which contain all your tscn items 

- Finally in the inspector panel edit your tileset and fill it with the exported tiles images, or add your own tileset .tree file if images have the same name in exported folder of Tile Map Generator 
