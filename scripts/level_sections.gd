extends Node2D


var allTilePositions = [];
var number = 0;
onready var tileMap = get_node("../TileMap");

func _ready():
	for item in self.get_children():
		for tile in item.get_node("MovementTiles").get_children():
			allTilePositions.append(tileMap.world_to_map(tile.get_global_position()))
			print(tileMap.world_to_map(tile.get_global_position()), " -", number)
			number += 1
			
func exportTilePositions():
	return allTilePositions;
	
#S1 Y: 0
#diff 190
#S2 Y: -190
#diff 194
#S3 Y: -384
#diff 192
#S4 Y: -576
#diff 192
#S5 Y: -768

