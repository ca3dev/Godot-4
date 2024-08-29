extends Node

@onready var FSM = $"../"

func HIT(type):
	
	if type == "normal":
		FSM.current = FSM.get_node("HURT/Hurt")
		FSM.current.Start("normal")
	if type == "aereal":
		FSM.current = FSM.get_node("HURT/Hurt")
		FSM.current.Start("aereal")
