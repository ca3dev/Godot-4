extends Node

func _process(delta):
	if Variables.Mode != Variables.mode.Online:
		%Reader.ReadP1()
		%Reader.ReadP2()
