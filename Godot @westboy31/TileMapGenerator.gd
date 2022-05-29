extends TileMap
class_name TileMapGenerator,"tmg_icon.png"

var tmg_File = File.new()
var tmg_Json
var items = {}

export var tmg_jsonPath = ""
export var tmg_itemFolder = ""


func tmg_GetJson(jsonPath) :
	tmg_File.open(jsonPath, tmg_File.READ)
	tmg_Json = tmg_File.get_as_text()
	tmg_Json = JSON.parse(tmg_Json).result
	tmg_File.close()
	pass


func _ready():
	
	tmg_GetJson(tmg_jsonPath)
	
	for i in tile_set.get_tiles_ids():
		tile_set.tile_set_name(i, tile_set.tile_get_name(i).split(".",true,1)[0])
		pass
	
	for i in tmg_Json.ItemsList :
		items[i.split(".",true,1)[0]] = load(tmg_itemFolder + "/" + i.split(".",true,1)[0]+".tscn")
		pass

	for tile in tmg_Json.Tiles :
		set_cell(tile.X ,tile.Y ,tile_set.find_tile_by_name(tile.Tile),tile.FlipHorizontally,tile.FlipVertically)
	
	for i in tmg_Json.Items :
		var item = items[i.Item.split(".",true,1)[0]].instance()
		item.position = Vector2(i.X,i.Y)
		add_child(item)
		pass 
pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
