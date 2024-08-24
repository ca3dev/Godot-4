extends Node

@export var current : Node

@export var dir : Vector2i
@export var root : CharacterBody3D

@onready var statemachine = %AnimTree["parameters/playback"]

func _ready():
	%AnimTree.active = true

func _process(delta: float) -> void:
	current.Transition()
	current.Update(delta)
	
	root.global_rotation.y = lerp_angle(root.global_rotation.y, atan2(dir.x, dir.y), 0.2)

func _physics_process(delta: float) -> void:
	current.Physics(delta)
