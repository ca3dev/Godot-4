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
		FSM.current = FSM.get_node("Movement/FALL")
		FSM.current.Start(FSM.air_x)
