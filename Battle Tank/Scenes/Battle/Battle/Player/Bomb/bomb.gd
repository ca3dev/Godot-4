extends Area3D

var dissolve = 0

func _process(delta):
	dissolve += delta
	$mesh.get_active_material(0).set("shader_parameter/dissolve_amount", dissolve)
	
	$mesh.rotate_y(delta * 10)

func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	
	if body.is_in_group("Enemy"):
		body.queue_free()
	
	if body.is_in_group("EnemyBullets"):
		body.queue_free()
