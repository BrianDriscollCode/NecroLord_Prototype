extends Node2D

var allTiles = [];
var allTilePositions = [];
onready var tileMap = get_node("../WalkableTileMap");

func _ready():
	aggregateTiles();
	
func aggregateTiles() -> void:
	for tile in self.get_children():
		allTiles.append(tile)
	var counter = 1;
	for tile in allTiles:
		print(counter, ": ", tile, tileMap.world_to_map(tile.get_global_position()));
		counter += 1;
	aggregateTilePositions();
		
func aggregateTilePositions():
	for tilePos in allTiles:
		allTilePositions.append(tileMap.world_to_map(tilePos.get_global_position()));
	
#Exports
func exportTilePositions():
	return allTilePositions;
