extends Node2D


func _on_timer_timeout():
	$AnimationPlayer.play("Start")
