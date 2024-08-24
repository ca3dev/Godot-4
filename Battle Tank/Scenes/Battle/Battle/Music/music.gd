extends Node

func PlayShoot():
	var rand = randi_range(1, 4)
	get_node("Shoot/" + str(rand)).play()
	
