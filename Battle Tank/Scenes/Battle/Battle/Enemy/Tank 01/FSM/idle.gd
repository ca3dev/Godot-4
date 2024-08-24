extends Node

func _ready() -> void:
	%ChangeState.start(3)

func Update(delta):
	pass

func Physics(delta):
	pass
	
func Transition():
	var dir = Vector2.ZERO
	match(randi_range(1, 4)):
		1 : dir = Vector2i.DOWN
		2 : dir = Vector2i.UP
		3 : dir = Vector2i.RIGHT
		4 : dir = Vector2i.LEFT
	
	%FSM.dir = dir
	
	%FSM.idle = ! %FSM.idle
	if %FSM.idle:
		%FSM.current = %FSM.get_node("IDLE")
	else:
		%FSM.current = %FSM.get_node("WALK")
	
	%ChangeState.start(randf_range(0.3, 1.5))


func _on_change_state_timeout() -> void:
	Transition()
