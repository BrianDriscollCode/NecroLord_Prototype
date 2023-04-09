extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var health = get_node("TextureProgress");

# Called when the node enters the scene tree for the first time.
func _ready():
	health.value = 100;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
