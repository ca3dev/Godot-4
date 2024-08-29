extends "res://Engine/Modules/Character/FSM/State_Base.gd"

@onready var FSM = $"../../"

func Start(type):
	if type == "normal":
		FSM.Anim.set("parameters/HURT/blend_position", 1)
	if type == "areal":
		FSM.Anim.set("parameters/HURT/blend_position", 2)
	FSM.Anim.set("parameters/conditions/Hurt", true)
	FSM.state_machine.travel("HURT")
	FSM.Anim.call_deferred("advance", -2)
	FSM.anim_end = false

func Transition():
	if FSM.anim_end:
		Variables.GUI.ResetCombo(FSM.P1)
		FSM.Anim.set("parameters/conditions/Hurt", false)
		FSM.state_machine.travel("MOVE")
		FSM.anim_end = false
		if FSM.is_on_air:
			FSM.current = FSM.get_node("Movement/FALL")
			FSM.current.Start(FSM.air_x * -1)
		else:
			FSM.current = FSM.get_node("Movement/IDLE")
			FSM.current.Start()

func Physics(delta):
	var speed = FSM.SpriteParent.move * delta * FSM.air_x
	FSM.Character.move_and_collide(speed)
