extends CharacterBody2D

@export var P1 : bool
@export var walk_speed : float
@export var jump_strenght : float
@export var jump_gravity : float
@export var gravity_fall : float
@export var max_gravity : float

func _ready():
	if P1:
		Variables.P1 = self
		$"FSM Base".P1 = true
	else:
		Variables.P2 = self
		$"FSM Base".P1 = false
	
	$"FSM Base/Movement/JUMP".jumpspeed = jump_strenght
	$"FSM Base/Movement/JUMP".gravity = jump_gravity
	$"FSM Base/Movement/FALL".max_gravity = max_gravity
	$"FSM Base/Movement/FALL_V".max_gravity = max_gravity
	$"FSM Base/Movement/FALL".gravity_fall = gravity_fall
	$"FSM Base/Movement/FALL_V".gravity_fall = gravity_fall
	$"FSM Base".walk_speed = walk_speed
