extends Node

var key = preload("res://Engine/Modules/Input/MyKey.gd")

var buffer = []

func _ready():
	var tmp = key.new()
	buffer.insert(0, tmp)

func AddKey(NewKey):
	if NewKey != buffer[0].key:
		var tmp = key.new()
		tmp.key = NewKey
		buffer.insert(0, tmp)
		
		if buffer.size() > 9:
			buffer.remove_at(9)
	else:
		buffer[0].timepressed += get_physics_process_delta_time()
