extends Node


@export var walk_speed : float

func Transition():
	if Input.is_action_pressed("DOWN") or Input.is_action_pressed("LEFT") or Input.is_action_pressed("UP") or Input.is_action_pressed("RIGHT"):
		pass
	else:
		%FSM.current = %FSM.get_node("IDLE")
	
	if Input.is_action_just_released("SHOOT"):
		%FSM.current = %FSM.get_node("SHOOT")
		%FSM.current.ShootBullet()
	
func Update(delta):
	
	$"../../".dash = true
	
	if Input.is_action_pressed("SHOOT"):
		DataPaths.GUI.ChargeShoot(delta)

	var dir = Vector2i.ZERO
	
	if Input.is_action_pressed("LEFT"):
		dir = Vector2i.LEFT
	if Input.is_action_pressed("RIGHT"):
		dir = Vector2i.RIGHT
	if Input.is_action_pressed("DOWN"):
		dir = Vector2i.DOWN
	if Input.is_action_pressed("UP"):
		dir = Vector2i.UP

	
	if dir != Vector2i.ZERO:
		%FSM.dir = dir
	
	DataPaths.GUI.Dash(delta)
	
	var angle = %AnimTree.get("parameters/MOVE/blend_position")
	angle = lerp(angle, 1.0, delta * 10)
	%AnimTree.set("parameters/MOVE/blend_position", angle)
	
	if DataPaths.GUI.GetDash() <= 0 :
		%FSM.current = %FSM.get_node("IDLE")
	
func Physics(delta):
	var speed = %FSM.dir * walk_speed * delta
	var colision = %FSM.root.move_and_collide(Vector3(speed.x, 0, speed.y))
