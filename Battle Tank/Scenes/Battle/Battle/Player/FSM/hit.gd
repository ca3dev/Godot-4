extends Node

func Transition():
	pass
	
func Update(delta):
	pass

func Physics(delta):
	pass

func Start():
	$Timer.start(0.8)
	%AnimTree.set("parameters/conditions/HIT", true)
	%FSM.statemachine.travel("HIT")


func _on_timer_timeout():
	%AnimTree.set("parameters/conditions/HIT", false)
	%FSM.current = %FSM.get_node("IDLE")
