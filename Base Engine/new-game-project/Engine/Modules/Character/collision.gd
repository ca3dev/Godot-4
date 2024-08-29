extends Node

@onready var Root = $"../.."

@export var damage_normal : int

func _on_attack_box_area_entered(area):
	if area.is_in_group("HITBOX") and Root.P1 != area.get_node("../../../").P1:
		area.get_node("../../../").HIT()
		$"../../FSM Base".just_hit = true
		$CancelTime.start(0.2)
		if Root.P1:
			Variables.GUI.HITP2(damage_normal)
		else:
			Variables.GUI.HITP1(damage_normal)


func _on_cancel_time_timeout():
	$"../../FSM Base".just_hit = false
