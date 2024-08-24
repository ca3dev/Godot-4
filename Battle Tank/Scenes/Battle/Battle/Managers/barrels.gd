extends Node3D

@export var Barrel : PackedScene

func _process(delta: float) -> void:
	pass


func Spawn():
	var tmp = Barrel.instantiate()
	var x = randf_range($TopLeft.global_position.x, $BottomRight.global_position.x)
	var y = randf_range($TopLeft.global_position.z, $BottomRight.global_position.z)
	tmp.global_position = Vector3(x, $TopLeft.global_position.y, y)
	add_child(tmp)
