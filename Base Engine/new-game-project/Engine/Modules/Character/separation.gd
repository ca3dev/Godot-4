extends Node

@onready var Root = $"../.."
var separation = false

func _physics_process(delta):
	if not separation:
		return
	if Root.P1:
		if not Variables.P1Left:
			Root.move_and_collide(Vector2(Root.walk_speed * delta, 0))
		else:
			Root.move_and_collide(Vector2(-Root.walk_speed * delta, 0))
	else:
		if not Variables.P1Left:
			Root.move_and_collide(Vector2(-Root.walk_speed * delta, 0))
		else:
			Root.move_and_collide(Vector2(Root.walk_speed * delta, 0))

func _on_hitbox_area_entered(area):
	if area.is_in_group("HITBOX"):
		separation = true
		


func _on_hitbox_area_exited(area):
	if area.is_in_group("HITBOX"):
		separation = false
