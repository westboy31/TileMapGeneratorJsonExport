--Author : westboy31
--Tile Map Generator : https://westboy.itch.io/tilemapgenerator

json = require("JSON")
print(json)

local tmg = {}

local TilesList = {}
local tmp_img = ""
local images = {}
local map 
local tiles = {}
local orientationX = 1
local orientationY = 1

function tmg.loadFiles( jsonPath )
	local j = love.filesystem.read(jsonPath)
	map = json:decode(j)
	
	for i_image,img in pairs(map["TilesList"]) do
		if  tmp_img ~= img then
			table.insert(TilesList, 1, img)
			tmp_img = img
		end
	end

	for i,img in ipairs(TilesList) do
		local stop = string.find(img,'.',1,true) 
		local imgName = string.sub(img, 1, stop-1)
		images[imgName] = love.graphics.newImage("assets/" .. img)
	end

	for i,img in ipairs(map["ItemsList"]) do
		local stop = string.find(img,'.',1,true) 
		local imgName = string.sub(img, 1, stop-1)
		images[imgName] = love.graphics.newImage("assets/" .. img)
	end


return images
end	


function tmg.draw()
	for t,T in pairs(map["Tiles"]) do
		if T.FlipHorizontally then
	    	orientationX = -1
		else 
			orientationX = 1
		end

		if T.FlipVertically then
	    	orientationY = -1
		else 
			orientationY = 1
		end
	
		love.graphics.draw(images[T.Tile], 
					   	   T.X * map["TileSize"] + map["TileSize"]/2 ,
					   	   T.Y * map["TileSize"] + map["TileSize"]/2 ,
					       0 , orientationX , orientationY ,
					       map["TileSize"]/2 , map["TileSize"]/2 )

	end


	for i,I in pairs(map["Items"]) do
		local stop = string.find(I.Item,'.',1,true) 
		local itemName = string.sub(I.Item, 1, stop-1)
	    love.graphics.draw(images[itemName], I.X , I.Y )

	end


end



return tmg
