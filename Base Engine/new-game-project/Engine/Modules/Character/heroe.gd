extends CharacterBody2D

@export var P1 : bool
@export var HP : int
@export var walk_speed : float
@export var jump_strenght : float
@export var jump_gravity : float
@export var gravity_fall : float
@export var max_gravity : float
@export var gravity_modifier : float
@export var A_allow : bool
@export var B_allow : bool
@export var C_allow : bool
@export var D_allow : bool
@export var A_aereal : bool
@export var B_aereal : bool
@export var C_aereal : bool
@export var D_aereal : bool

func _ready():
	if P1:
		Variables.P1 = self
		$"FSM Base".P1 = true
	else:
		Variables.P2 = self
		$"FSM Base".P1 = false
	
	$"FSM Base/Movement/JUMP".jumpspeed = jump_strenght
	$"FSM Base/Movement/JUMP".gravity = jump_gravity
	$"FSM Base/Movement/JUMP".gravity_modifier = gravity_modifier
	$"FSM Base/Movement/FALL".max_gravity = max_gravity
	$"FSM Base/Movement/FALL_V".max_gravity = max_gravity
	$"FSM Base/Movement/FALL".gravity_fall = gravity_fall
	$"FSM Base/Movement/FALL_V".gravity_fall = gravity_fall
	$"FSM Base".walk_speed = walk_speed
	
	$Anim.active = true

func HIT():
	$"FSM Base".HIT()
	$HitStunt.start(Variables.Hitstun)
	self.process_mode = Node.PROCESS_MODE_DISABLED


func _on_hit_stunt_timeout():
	self.process_mode = Node.PROCESS_MODE_INHERIT
