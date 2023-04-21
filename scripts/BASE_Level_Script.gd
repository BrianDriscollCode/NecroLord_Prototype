extends Node2D

var gameEnded = false;
signal level_changed(level_name)	
		
func _process(delta):
	if Input.is_action_just_pressed("ui_end"):
		endGame();
		
func endGame():
	emit_signal("level_changed", "second_level")
	print("test")
	print("press end level")
	

func _on_NorthExit_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("LeveL")
	endGame(); # Replace with function body.

