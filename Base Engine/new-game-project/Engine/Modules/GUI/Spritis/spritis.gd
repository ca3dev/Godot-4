extends Node2D

func _ready():
	Variables.Spirits = self

func GameOverBattle():
	Variables.P1.process_mode = Node.PROCESS_MODE_DISABLED
	Variables.P2.process_mode = Node.PROCESS_MODE_DISABLED
	$CanvasLayer/AnimationPlayer.play("GameEnd")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "GameEnd":
		Variables.ResetBattle()
	if anim_name == "Start":
		$"../".GameStart()
