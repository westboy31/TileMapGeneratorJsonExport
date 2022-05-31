### [DOWNLOAD](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/westboy31/TileMapGeneratorJsonExport/tree/main/Phaser%20%40westboy31)

> *Note : This is not a plugin phaser like the others, this a javascript file that will facilitate for you usage of the exported json file.*

#

# INSTALLATION

Add **TmgPlugin.js** file to your source code and the exported files from Tile Map Generator.

In your index html load **TmgPlugin.js** <u>after phaser.js</u> (or phaser.min.js) and <u>before</u> the script of your <u>scenes</u>game :

```html
  <script type="text/javascript" src="phaser.js"></script>
  <script type="text/javascript" src="TmgPlugin.js"></script>
  <script type="text/javascript" src="main.js"></script>
```

When you preload the json file and tile images you have to respect the naming file, example :

```js
function preload(){
    this.load.image("tile","assets/tile.png")
   
    //...... 
    this.load.json("map","assets/map.json")
}
```

Now you can create your map with the function **tmg_init()** , ti takes 2 parameters :

1. **The game :** you pass it with **this** .
  
2. **The Name of the json file :** it a string that represent the name that you gave to the json file in the preload function (previous step).
  

Example :

```js
function create(){
    let map = tmg_init(this, "map")
}
```

The function **tmg_init()** return an object containing your images that are created in your scene, the object contain two other objects **Tiles** and **Items** .
The key of every tiles is represented with syntax "ix" + "index X of the tile" + "iy" + "index Y of the tile"
The key of every items is represented with syntax "x" + "relative x coordinate of item" + "y" + "irelative y coordinate of item""

Example :

```js
let Tile = map.Tiles["ix5iy80"] 
//Tile is the reference for the image which has the index 5 for horizontallly and index 80 vertically

let Item = map.Items["x123y256"]  
//item is reference for the item which has 123 in x coordinate and 256 in y coordinate  
```

If you want to use custom names when you preload your tiles and items you can do by changing how json file refer to these images with the function **tmg_changeName() Before the tmg_init() function**.
It takes two parameters :

1. String of the image name in your game
  
2. String of the name that is in your json file
  

Example :

```js
function preload{
    this.load.image("MyName","assets/tmg_name.png")
}
function create(){
    tmg_changeName("MyName" , "tmg_name")
    tmg_init(this, "map") //should work properly
}
```

> *Note : collisions still not implemented*
