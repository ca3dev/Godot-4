extends "res://Engine/Modules/Character/FSM/State_Base.gd"

var dirx = 0
@export var gravity_fall : float
@onready var FSM = $"../../"
var gravity = 0
@export var max_gravity : float

func Update(delta):
	gravity += delta * gravity_fall
	
	if gravity > max_gravity:
		gravity = max_gravity

func Start(g, x):
	FSM.Anim.set("parameters/MOVE/blend_position", Vector2(0, 1))
	gravity = gravity_fall * 0.5

func Transition():
	FSM.CheckAerealAttacks()

func Physics(delta):
	var speed = Vector2(0, delta * gravity * 0.5)
	
	FSM.Character.velocity = speed
	FSM.Character.move_and_slide()
	
	var collision = FSM.Character.move_and_collide(Vector2(speed.x, speed.y / 2))
	
	if collision:
		if collision.get_collider().is_in_group("GROUND"):
			FSM.current = FSM.get_node("Movement/IDLE")
			FSM.current.Start()
