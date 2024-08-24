extends Node

@export var walk_speed : float


func Update(delta):
	
	%FSM.get_parent().global_rotation.y = lerp_angle(%FSM.get_parent().global_rotation.y, atan2(%FSM.dir.x, %FSM.dir.y), 0.2)

func Physics(delta):
	var speed = delta * walk_speed * %FSM.dir
	
	%FSM.get_parent().move_and_collide(Vector3(speed.x, 0, speed.y))
