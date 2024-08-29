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

func Start(xdir):
	FSM.Anim.set("parameters/MOVE/blend_position", Vector2(0, 1))
	dirx = xdir
	gravity = 0

func Transition():
	FSM.CheckAerealAttacks()

func Physics(delta):
	var speed = Vector2(dirx * delta * FSM.walk_speed * 1.5, delta * gravity)
	FSM.Character.velocity = Vector2(speed.x, speed.y / 2)
	FSM.Character.move_and_slide()
	var collision = FSM.Character.move_and_collide(Vector2(speed.x, speed.y / 2))
	
	if collision:
		if collision.get_collider().is_in_group("GROUND"):
			FSM.current = FSM.get_node("Movement/IDLE")
			FSM.current.Start()
		if collision.get_collider().is_in_group("WALL"):
			FSM.current = FSM.get_node("Movement/FALL_V")
			FSM.current.Start(gravity, dirx)
