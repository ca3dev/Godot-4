extends Node

@export var P1 : bool
@export var walk_speed : float
@export var Character : CharacterBody2D

@export var current : Node
@onready var dir = Vector2i.ZERO
@export var SpriteParent : Node2D

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
