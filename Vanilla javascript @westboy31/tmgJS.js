function tmgDraw (canvas,FolderJson,adjustCanvasDimension){
  // canvas(string) : reference of the cnavas where to draw map
  //FolderJson(string) : the folder that contains all images and json export
  //adjustCanvasDimension(bool) : to adjust canvas in order to fit the map or not
  let images;
  let context = canvas.getContext("2d");
  fetch(FolderJson + "/" + FolderJson + ".json")
              .then(res => res.json())
              .then( (json) => {

                // get list of all imagesin the folder======================
                images = json.TilesList.concat(json.ItemsList) ;

                //resize the canvas if true =================================
                if ( adjustCanvasDimension === true ){
                  canvas.width =  (json.TileSize * json.Column);
                  canvas.height = (json.TileSize * json.Raw);
                }

                let i = 0; //creat an index for every img load
                let imgs = new Object(); //create object of Image object and refer to them with their basename

                //laod src images=============================================
                images.forEach( (file) => {
                  let img = new Image();
                  img.src = (FolderJson + "/" +file);
                  img.onload = ()=>{
                    imgs[(file.slice(0,file.length-4))]= img ; //take base name only
                    i++;
                    if (i == images.length ) { //if all imgs are loaded

                      //draw tiles============================================
                      let directionH = 1;
                      let directionV = 1;
                      json.Tiles.forEach( (tile) => {
                        context.save();
                        if (tile.FlipHorizontally && !tile.FlipVertically ) {
                          directionH = -1;
                          context.scale(-1,1);
                        }
                        if (tile.FlipVertically && !tile.FlipHorizontally) {
                          directionV = -1;
                          context.scale(1,-1);
                        }
                        if (tile.FlipHorizontally && tile.FlipVertically) {
                          directionH = -1;
                          directionV = -1;
                          context.scale(-1,-1);
                        }
                        context.drawImage(
                          imgs[tile.Tile],
                          tile.X * json.TileSize * directionH,
                          tile.Y * json.TileSize * directionV,
                          json.TileSize * directionH,
                          json.TileSize * directionV )
                        context.restore();
                        directionH = 1;
                        directionV = 1;
                      });
                      //draw items============================================
                      json.Items.forEach( (item) => {
                        context.drawImage(
                          imgs[(item.Item.slice(0,item.Item.length-4))], //take the base name only
                          item.X ,
                          item.Y
                          )
                      });
                    }}
                });
              })
}
export {tmgDraw};
