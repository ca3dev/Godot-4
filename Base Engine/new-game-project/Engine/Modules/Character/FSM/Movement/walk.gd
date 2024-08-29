extends "res://Engine/Modules/Character/FSM/fsm_base.gd"

@onready var FSM = $"../../"

func Start():
	FSM.Anim.set("parameters/MOVE/blend_position", Vector2(1, 0))
	FSM.is_on_air = false

func Transition():
	if FSM.P1 and Variables.Mode != Variables.mode.Online:
		TransitionP1()
	if not FSM.P1 and Variables.Mode == Variables.mode.Versus:
		TransitionP2()
	
	FSM.CheckAttacks()

func TransitionP1():
	if MyInput.IsIdleP1():
		FSM.current = FSM.get_node("Movement/IDLE")
		FSM.current.Start()
	if MyInput.GetXP1() != 0 and MyInput.GetYP1() == -1:
		FSM.current = FSM.get_node("Movement/JUMP")
		FSM.current.Start(MyInput.GetXP1())

func TransitionP2():
	if MyInput.IsIdleP2():
		FSM.current = FSM.get_node("Movement/IDLE")
		FSM.current.Start()
	if MyInput.GetXP2() != 0 and MyInput.GetYP2() == -1:
		FSM.current = FSM.get_node("Movement/JUMP")
		FSM.current.Start(MyInput.GetXP2())

func Update(delta):
	if FSM.P1 and Variables.Mode != Variables.mode.Online:
		UpdateP1(delta)

func UpdateP1(delta):
	FSM.air_x = MyInput.GetXP1()

func Physics(delta):
	if FSM.P1 and Variables.Mode != Variables.mode.Online:
		PhysicsP1(delta)
	if not FSM.P1 and Variables.Mode == Variables.mode.Versus:
		PhysicsP2(delta)
	
func PhysicsP1(delta):
	var speed = delta * MyInput.GetXP1() * FSM.walk_speed
	FSM.Character.move_and_collide(Vector2(speed, 0))

func PhysicsP2(delta):
	var speed = delta * MyInput.GetXP2() * FSM.walk_speed
	FSM.Character.move_and_collide(Vector2(speed, 0))
