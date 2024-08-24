extends Node

@export var Bomb : PackedScene

func Transition():
	pass
	
func Update(delta):
	pass
	
func Physics(delta):
	pass
	
func Start():
	var tmp = Bomb.instantiate()
	tmp.global_position = $"../../".global_position
	DataPaths.BulletManager.add_child(tmp)
	$Timer.start(0.5)

func _on_timer_timeout():
	%FSM.current = %FSM.get_node("IDLE")
