extends "res://Engine/Modules/Character/FSM/State_Base.gd"

@onready var FSM = $"../../"

func Start(id):
	FSM.Anim.set("parameters/ATTACK/blend_position", id)
	FSM.Anim.set("parameters/conditions/Attack", true)
	FSM.state_machine.travel("ATTACK")
	FSM.anim_end = false

func Transition():
	if FSM.anim_end:
		FSM.Anim.set("parameters/conditions/Attack", false)
		FSM.state_machine.travel("MOVE")
		FSM.anim_end = false
		FSM.current = FSM.get_node("Movement/IDLE")
	if FSM.just_hit:
		if FSM.P1 and MyInput.GetXP1() != 0 :
			FSM.just_hit = false
			FSM.Anim.set("parameters/conditions/Attack", false)
			FSM.state_machine.travel("MOVE")
			FSM.anim_end = false
			FSM.current = FSM.get_node("Movement/IDLE")
		if not FSM.P1 and MyInput.GetXP2() != 0 :
			FSM.just_hit = false
			FSM.Anim.set("parameters/conditions/Attack", false)
			FSM.state_machine.travel("MOVE")
			FSM.anim_end = false
			FSM.current = FSM.get_node("Movement/IDLE")
