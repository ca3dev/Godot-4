extends Node

func _process(delta):
	
	var enemies = get_tree().get_nodes_in_group("Enemy").size()
	DataPaths.GUI.UpdateEnemiesLeft(enemies)
	
	if enemies < 1 :
		get_tree().change_scene_to_file("res://Menues/Victory/victory.tscn")
