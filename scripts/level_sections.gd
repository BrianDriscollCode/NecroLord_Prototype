extends Node2D


var allTilePositions = [];
onready var tileMap = get_node("../TileMap");

func _ready():
	for item in self.get_children():
		for tile in item.get_node("MovementTiles").get_children():
			allTilePositions.append(tileMap.world_to_map(tile.get_global_position()))
			
func exportTilePositions():
	print (allTilePositions)
	return allTilePositions;
