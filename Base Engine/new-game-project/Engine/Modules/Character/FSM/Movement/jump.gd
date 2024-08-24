extends "res://Engine/Modules/Character/FSM/State_Base.gd"

@onready var FSM = $"../../"

var jumpspeed = 0
var xdir = 0
var yaccel = 0
var gravity = 10

func Start(dirx):
	xdir = dirx
	yaccel = jumpspeed

func Update(delta):
	yaccel -= delta * gravity
	
	if yaccel < 0:
		FSM.current = FSM.get_node("Movement/FALL")
		FSM.current.Start(xdir)

func Physics(delta):
	var speed = Vector2(xdir * FSM.walk_speed * delta * 100, yaccel * -1)
	FSM.Character.velocity = speed
	FSM.Character.move_and_slide()
