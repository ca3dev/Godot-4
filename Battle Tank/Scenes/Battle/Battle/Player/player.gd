extends CharacterBody3D

@onready var dash = false


func _ready():
	
	DataPaths.Player = self

func HIT():
	$FSM.current = $FSM/HIT
	$FSM.current.Start()
