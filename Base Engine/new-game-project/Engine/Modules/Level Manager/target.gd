extends Marker2D

func _process(delta):
	var pos = (Variables.P2.global_position - Variables.P1.global_position) / 2
	self.global_position = Variables.P1.global_position + pos
