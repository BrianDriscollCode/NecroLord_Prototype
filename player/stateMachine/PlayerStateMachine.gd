extends Node
class_name PlayerStateMachine

onready var player = get_parent();

onready var STATES = {
	free = $IS_FREE,
	battle = $IN_BATTLE
}
var current_state;

func _ready():
	current_state = STATES.free;

func _change_state(oldState, newState):
	current_state = newState;
	current_state.transition_logic();

func _exit_state(newState, oldState):
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("temp_state_change") && current_state == STATES.free:
		_change_state(current_state, STATES.battle)
	elif Input.is_action_just_pressed("temp_state_change") && current_state == STATES.battle:
		_change_state(current_state, STATES.free)
		
func _physics_process(delta):
	current_state.state_logic(delta, player);
