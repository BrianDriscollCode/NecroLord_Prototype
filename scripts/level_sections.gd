extends Node2D


var allTilePositions = [];
var number = 0;
onready var tileMap = get_node("../TileMap");
var fourWaySectionOne = preload("res://levelSections/section-4-way.tscn");
var fourWaySectionTwo = preload("res://levelSections/section-4-way-2.tscn");
var twoWaySectionNorthSouth = preload("res://levelSections/section-2-way-N-S.tscn");

func _ready():
	var section1 = fourWaySectionOne.instance();
	add_child(section1);
	var section2 = fourWaySectionTwo.instance();
#	section2.position.y -= 192
	var section3 = twoWaySectionNorthSouth.instance();
#	section3.position.y -= 384
	var counter = 2;
	var currentPositionAdder = -192;
	for n in 2:
		print("test")
		print(currentPositionAdder)
		if counter % 2 == 0:
			section2.position.y = currentPositionAdder;
			add_child(section2);
		else:
			section3.position.y = currentPositionAdder;
			add_child(section3);
		currentPositionAdder -= 192;
		counter += 1;
		
	
	
	
	for item in self.get_children():
		for tile in item.get_node("MovementTiles").get_children():
			allTilePositions.append(tileMap.world_to_map(tile.get_global_position()))
#			print(tileMap.world_to_map(tile.get_global_position()), " -", number)
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

