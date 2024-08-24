extends Node

func _process(delta):
	
	if Variables.HP < 1 :
		get_tree().change_scene_to_file("res://Menues/GameOver/game_over.tscn")
