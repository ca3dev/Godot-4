extends Node

func Transition():
	if Input.is_action_pressed("DOWN") or Input.is_action_pressed("LEFT") or Input.is_action_pressed("UP") or Input.is_action_pressed("RIGHT"):
		%FSM.current = %FSM.get_node("WALK")
	
	if Input.is_action_just_released("SHOOT"):
		%FSM.current = %FSM.get_node("SHOOT")
		%FSM.current.ShootBullet()
	
	if Input.is_action_just_released("BOMB"):
		%FSM.current = %FSM.get_node("BOMB")
		%FSM.current.Start()
	
	if Input.is_action_pressed("DASH") and DataPaths.GUI.GetDash() > 1:
		%FSM.current = %FSM.get_node("DASH")
	
func Update(delta):
	
	$"../../".dash = false
	
	var angle = %AnimTree.get("parameters/MOVE/blend_position")
	angle = lerp(angle, 0.0, delta * 10)
	%AnimTree.set("parameters/MOVE/blend_position", angle)
	
	if Input.is_action_pressed("SHOOT"):
		DataPaths.GUI.ChargeShoot(delta)
	
func Physics(delta):
	pass
