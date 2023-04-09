extends Area2D

signal level_changed(level_name)	
		
func endGame():
	emit_signal("level_changed", "end")
	print("press end level")
