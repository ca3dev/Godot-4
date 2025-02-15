extends "res://Engine/Modules/Character/FSM/fsm_base.gd"

@onready var FSM = $"../../"

func Start():
	FSM.Anim.set("parameters/MOVE/blend_position", Vector2.ZERO)
	FSM.is_on_air = false


func Transition():
	if FSM.P1 and Variables.Mode != Variables.mode.Online:
		TransitionP1()
	if not FSM.P1 and Variables.Mode == Variables.mode.Versus:
		TransitionP2()
	
	FSM.CheckAttacks()

func TransitionP1():
	if MyInput.GetXP1() != 0 and MyInput.GetYP1() == 0:
		FSM.current = FSM.get_node("Movement/WALK")
		FSM.current.Start()
	if MyInput.GetXP1() == 0 and MyInput.GetYP1() == 1:
		FSM.current = FSM.get_node("Movement/CROUCHED")
		FSM.current.Start()
	if MyInput.GetYP1() == -1:
		FSM.current = FSM.get_node("Movement/JUMP")
		FSM.current.Start(MyInput.GetXP1())

func TransitionP2():
	if MyInput.GetXP2() != 0 and MyInput.GetYP2() == 0:
		FSM.current = FSM.get_node("Movement/WALK")
		FSM.current.Start()
	if MyInput.GetXP2() == 0 and MyInput.GetYP2() == 1:
		FSM.current = FSM.get_node("Movement/CROUCHED")
		FSM.current.Start()
	if MyInput.GetYP2() == -1:
		FSM.current = FSM.get_node("Movement/JUMP")
		FSM.current.Start(MyInput.GetXP2())

func Update(delta):
	if self.name != "IDLE":
		return
	if Variables.P1.global_position.x < Variables.P2.global_position.x :
		Variables.P1Left = true
	else:
		Variables.P1Left = false
		
	if FSM.P1:
		if Variables.P1Left:
			FSM.SpriteParent.scale.x = 1
			FSM.air_x = 1
		else:
			FSM.SpriteParent.scale.x = -1
			FSM.air_x = -1
	else:
		if Variables.P1Left:
			FSM.SpriteParent.scale.x = -1
			FSM.air_x = -1
		else:
			FSM.SpriteParent.scale.x = 1
			FSM.air_x = 1
	

func Physics(delta):
	pass
