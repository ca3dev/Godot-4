extends "res://Engine/Modules/Character/FSM/State_Base.gd"

@onready var FSM = $"../../"

var jumpspeed = 0
var xdir = 0
var yaccel = 0
var gravity = 10
var initial_gravity = 500
var modifier = 0
var gravity_modifier = 100

func Start(dirx):
	xdir = dirx
	yaccel = jumpspeed
	FSM.Anim.set("parameters/MOVE/blend_position", Vector2(0, 1))
	modifier = 0
	

func Transition():
	FSM.CheckAerealAttacks()

func Update(delta):
	var tmp = delta * gravity
	modifier += gravity_modifier * delta
	yaccel -= (tmp + modifier)
	
	if yaccel < 0:
		FSM.current = FSM.get_node("Movement/FALL")
		FSM.current.Start(xdir)

func Physics(delta):
	var speed = Vector2(xdir * FSM.walk_speed * delta * 100, yaccel * -1)
	FSM.Character.velocity = speed
	FSM.Character.move_and_slide()
