extends Node

onready var current_level = load("res://scenes/BASE_Level.tscn").instance()

func _ready():
	current_level.connect("level_changed", self, "handle_level_changed")
	add_child(current_level)
	print(current_level)


func handle_level_changed(current_level_name: String):
	print("Run handle_level_changed")
	var next_level 
	var next_level_name: String
	
	match current_level_name:
		"start_screen":
			next_level_name = "test"
			print("startscreen match")
		"second_level":
			next_level_name = "BASE_Level2"
			print("sec")
		"end":
			next_level_name = "EndGame"
		_:
			return
			
	print("res://levels/" + next_level_name)
	next_level = load("res://scenes/" + next_level_name + ".tscn").instance()
	add_child(next_level)
	next_level.connect("level_changed", self, "handle_level_changed")
	current_level.queue_free()
	current_level = next_level
