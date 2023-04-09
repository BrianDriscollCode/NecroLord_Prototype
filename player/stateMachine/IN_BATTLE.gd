extends Node

onready var timer = get_node("Timer");


var BATTLE_STATES = {
	can_attack = false,
	can_move = false
}

func _ready():
	print("IN_BATTLE");

func state_logic(delta, player):
	if BATTLE_STATES.can_move:
		player.controller();
		manage_input();

func manage_input():
	if Input.is_action_just_pressed("ui_right") && BATTLE_STATES.can_move:
		BATTLE_STATES.can_move = false;
		timer.start();
	elif Input.is_action_just_pressed("ui_left") && BATTLE_STATES.can_move:
		BATTLE_STATES.can_move = false;
		timer.start();
	elif Input.is_action_just_pressed("ui_up") && BATTLE_STATES.can_move:
		BATTLE_STATES.can_move = false;
		timer.start();
	elif Input.is_action_just_pressed("ui_down") && BATTLE_STATES.can_move:
		BATTLE_STATES.can_move = false;
		timer.start();

func transition_logic():
	timer.start();
	
func _on_Timer_timeout():
	BATTLE_STATES.can_move = true;
	
