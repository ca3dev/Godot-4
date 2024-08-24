extends Timer

@export var Bullet : PackedScene

func _ready():
	self.start(randf_range(3, 5))


func _on_timeout():
	self.start(randf_range(3, 5))
	
	var tmp = Bullet.instantiate()
	tmp.target = (DataPaths.Player.global_position - $"../../".global_position).normalized()
	DataPaths.EnemyBullets.add_child(tmp)
	tmp.global_position = $"../../".global_position
	tmp.global_position.y += 0.5
