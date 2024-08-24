extends RigidBody3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	
	if body.is_in_group("Enemy"):
		body.queue_free()
	
	self.queue_free()
