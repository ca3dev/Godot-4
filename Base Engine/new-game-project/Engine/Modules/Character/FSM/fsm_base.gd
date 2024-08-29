extends Node

@export var P1 : bool
@export var walk_speed : float
@export var Character : CharacterBody2D

@export var current : Node
@export var move : Vector2
@onready var dir = Vector2i.ZERO
var air_x = 0
@export var SpriteParent : Node2D
@export var Anim : AnimationTree
@export var AnimPlayer : AnimationPlayer
@export var anim_end : bool
var state_machine
var is_on_air = false
var just_hit = false

func _process(delta):
	if current == null:
		return
	if $"../".is_in_group("Player"):
		current.Transition()
		current.Update(delta)
		
func _physics_process(delta):
	if current == null:
		return
	if $"../".is_in_group("Player"):
		current.Physics(delta)
		
func CheckAttacks():
	$NORMALS.CheckAttacks()

func CheckAerealAttacks():
	$NORMALS.CheckAerealAttacks()


func _on_anim_animation_finished(anim_name):
	anim_end = true

func _on_ready():
	state_machine = $"../Anim"["parameters/playback"]

func HIT():
	if is_on_air:
		$HURT.HIT("aereal")
	else:
		$HURT.HIT("normal")
