extends Button


func _return():
	Variables.HP = 100
	get_tree().change_scene_to_file("res://Menues/Title/title.tscn")
