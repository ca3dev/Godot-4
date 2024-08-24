extends Node

@export var Bullet : PackedScene

func Transition():
	pass

func Update(delta):
	pass
	
func Physics(delta):
	pass

func ShootBullet():
	$Timer.start(0.5)
	var impulse = DataPaths.GUI.GetStrenght() * get_physics_process_delta_time() * %FSM.dir
	impulse *= 5
	var tmp = Bullet.instantiate()
	tmp.global_position = %FSM.root.global_position
	DataPaths.BulletManager.add_child(tmp)
	tmp.apply_impulse(Vector3(impulse.x, 3, impulse.y), Vector3.ZERO)
	DataPaths.GUI.ReleaseShoot()
	Music.PlayShoot()


func _on_timer_timeout() -> void:
	%FSM.current = %FSM.get_node("IDLE")
