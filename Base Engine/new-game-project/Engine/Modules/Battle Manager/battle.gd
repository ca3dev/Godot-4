extends Node2D

func _ready():
	$LevelManager.process_mode = Node.PROCESS_MODE_DISABLED
	$GUI.process_mode = Node.PROCESS_MODE_DISABLED


func GameStart():
	$LevelManager.process_mode = Node.PROCESS_MODE_INHERIT
	$GUI.process_mode = Node.PROCESS_MODE_INHERIT
