extends TileMap
class_name TileMapGenerator,"tmg_icon.png"

var tmg_File = File.new()
var tmg_Json
var items = {}
var tmg_collider = null


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

	if tmg_Json.Map == "PlatformerHorizontal" or tmg_Json.Map == "PlatformerMultidirectional" :
		tmg_collider = load("TileMapGeneratorCollider.tscn")
		pass

	for tile in tmg_Json.Tiles :
		set_cell(tile.X ,tile.Y ,tile_set.find_tile_by_name(tile.Tile),tile.FlipHorizontally,tile.FlipVertically)

	for i in tmg_Json.Items :
		var item = items[i.Item.split(".",true,1)[0]].instance()
		item.position = Vector2(i.X,i.Y)
		item.centered = false
		add_child(item)
		pass

	if tmg_collider != null :
		for collider in tmg_Json.Collisions :
			var collision = tmg_collider.instance()
			collision.scale.x *= collider.Width
			collision.scale.y *= collider.Height
			collision.position.x = collider.X + collider.Width/2
			collision.position.y = collider.Y + collider.Height/2
			add_child(collision)
			pass
		pass
pass

