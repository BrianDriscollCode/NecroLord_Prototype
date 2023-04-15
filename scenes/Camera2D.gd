extends Camera2D

onready var player = get_node("../Player");

func _on_Area2D_area_shape_exited(_area_rid, _area, _area_shape_index, _local_shape_index):
	var direction = calculateDirection();
	moveCamera(direction)
	

func calculateDirection():
	var directionX = abs(self.global_position.x) - abs(player.global_position.x)
	var directionY = abs(self.global_position.y) - abs(player.global_position.y);
	
	if abs(directionX) > abs(directionY):
		if self.global_position.x < player.global_position.x:
			return "right"
		else:
			return "left"
	else:
		if self.global_position.y < player.global_position.y:
			return "down"
		else:
			return "up"

func moveCamera(direction):
	match direction:
		"right":
			self.global_position.x += 320;
		"left":
			self.global_position.x -= 320;
		"down":
			self.global_position.y += 180;
		"up":
			self.global_position.y -= 180;
