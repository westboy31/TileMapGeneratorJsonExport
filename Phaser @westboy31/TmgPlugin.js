/*
  tile map generator : https://westboy.itch.io/tilemapgenerator
  Author : westboy31
*/

let tmg_References = {}
function tmg_changeName(gameName , tmgName ){
  tmg_References[tmgName] = gameName
}

function tmg_init(g,jsonName){
  let tmg = g.game.cache.json.get(jsonName)
  let TMG = {Tiles : {} , Items : {} }
  for (var T of tmg.Tiles) {
    if (tmg_References.hasOwnProperty(T.Tile)) { T.Tile = tmg_References[T.Tile] }
    let tile = g.add.image(T.X*tmg.TileSize , T.Y*tmg.TileSize , T.Tile )
    tile.flipX = T.FlipHorizontally
    tile.flipY = T.FlipVertically
    TMG.Tiles["ix"+String(T.X)+"iy"+String(T.Y)] = tile
  }

  for (var I of tmg.Items) {
   if (tmg_References.hasOwnProperty(I.Item)) { I.Item = tmg_References[I.Item] }
   let item = g.add.image(I.X, I.Y , I.Item.split(".")[0] )
   TMG.Items["x"+String(I.X)+"y"+String(I.Y)] = item
  }
  
  console.log(TMG);
  return TMG
}
