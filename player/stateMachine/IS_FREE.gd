extends Node

func _ready():
	print("IS_FREE");

func state_logic(delta, player):
	player.controller();
	
func manage_input():
	pass;	
	
func transition_logic():
	pass;
	
