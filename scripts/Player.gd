class_name Player
extends Node2D

#Get viable positions
onready var movementTiles = get_node("../MovementTiles");
var viablePositions;

#Character position
onready var tileMap = get_node("../WalkableTileMap"); 
var currentPosition;

func _ready():
	viablePositions = movementTiles.exportTilePositions();
	currentPosition = tileMap.world_to_map(self.get_global_position()); 
			
func controller():
	var isViablePosition = false;
	var orientPosition = Vector2(-8, -7);
	
	if Input.is_action_just_pressed("ui_left"):
		var nextPos = currentPosition - Vector2(1, 0);
		isViablePosition = checkPositionViability(nextPos);
		if isViablePosition:
			moveCharacter(nextPos, orientPosition);
	elif Input.is_action_just_pressed("ui_right"):
		var nextPos = currentPosition - Vector2(-1, 0);
		isViablePosition = checkPositionViability(nextPos);
		if isViablePosition:
			moveCharacter(nextPos, orientPosition);
	elif Input.is_action_just_pressed("ui_up"):
		var nextPos = currentPosition - Vector2(0, 1);
		isViablePosition = checkPositionViability(nextPos);
		if isViablePosition:
			moveCharacter(nextPos, orientPosition);
	elif Input.is_action_just_pressed("ui_down"):
		var nextPos = currentPosition - Vector2(0, -1);
		isViablePosition = checkPositionViability(nextPos);
		if isViablePosition:
			moveCharacter(nextPos, orientPosition);

func checkPositionViability(nextPos: Vector2) -> bool:
	viablePositions = movementTiles.exportTilePositions();
	for tilePos in viablePositions:
			if tilePos == nextPos:
				return true;
	return false;

func moveCharacter(nextPos: Vector2, orientPosition: Vector2):
	var convertToGlobal = tileMap.map_to_world(nextPos);
	self.global_position = convertToGlobal - orientPosition;
	currentPosition = nextPos;
	

