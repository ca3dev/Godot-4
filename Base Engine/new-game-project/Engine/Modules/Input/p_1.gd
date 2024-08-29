extends Node

func _process(delta):
	if Variables.Mode == Variables.mode.Versus:
		%Reader.ReadP1()
		%Reader.ReadP2()
		%Reader.ReadP1Buttons()
