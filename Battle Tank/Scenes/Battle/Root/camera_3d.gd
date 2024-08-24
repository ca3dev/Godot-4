extends Camera3D

@export var player : CharacterBody3D
@export var distance_max_x : float
@export var distance_max_y : float

func _process(delta: float) -> void:
	
	var x_distance = player.global_position.x - get_parent().global_position.x
	var y_distance = player.global_position.z - get_parent().global_position.z
	
	if distance_max_x < abs(x_distance) or distance_max_y < abs(y_distance):
		%Follower.global_position = %Follower.global_position.slerp(player.global_position, 0.2)
