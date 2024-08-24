extends Camera2D

@export var camera_walk : float

func _process(delta):
	var dist_l_p1 = $LEFT.global_position.distance_to(Variables.P1.global_position)
	var dist_r_p1 = $RIGHT.global_position.distance_to(Variables.P1.global_position)
	var dist_l_p2 = $LEFT.global_position.distance_to(Variables.P2.global_position)
	var dist_r_p2 = $RIGHT.global_position.distance_to(Variables.P2.global_position)
	
	var speed = 0
	
	if dist_l_p1 < 300:
		speed -= delta * camera_walk
	if dist_r_p1 < 300:
		speed += delta * camera_walk
	if dist_l_p2 < 300:
		speed -= delta * camera_walk
	if dist_r_p2 < 300:
		speed += delta * camera_walk
	
	self.global_position.x += speed
