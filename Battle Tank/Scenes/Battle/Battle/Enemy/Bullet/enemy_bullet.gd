extends CharacterBody3D

@export var target : Vector3
@export var speed : float

@onready var modifier = randf_range(1, 10)

func _physics_process(delta):
	
	var collision = self.move_and_collide(target * delta * modifier * 0.5)
	
	if collision:
		if collision.get_collider().is_in_group("PLAYER"):
			if not collision.get_collider().dash:
				Variables.HP -= 20
				collision.get_collider().HIT()
		
		self.queue_free()


func _on_timer_timeout():
	self.queue_free()
