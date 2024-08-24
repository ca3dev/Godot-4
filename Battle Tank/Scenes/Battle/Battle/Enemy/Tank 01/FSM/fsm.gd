extends Node

@onready var current = $IDLE
@onready var dir = Vector2i.ZERO
@onready var idle = true

func _process(delta: float) -> void:
	
	current.Update(delta)

func _physics_process(delta: float) -> void:
	
	current.Physics(delta)
