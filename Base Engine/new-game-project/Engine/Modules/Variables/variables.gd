extends Node

enum mode {
	Arcade, Practice, Versus, Online
}

@export var Mode : mode

@export var P1 : CharacterBody2D
@export var P2 : CharacterBody2D

@export var P1Left : bool
@export var GUI : Node2D
@export var Hitstun : float
@export var P1victories = 0
@export var P2victories = 0
@export var Spirits : Node2D
@export var lastwinner = 0

func GameOverBattle():
	Spirits.GameOverBattle()

func ResetBattle():
	get_tree().change_scene_to_file("res://Engine/Modules/Battle Manager/battle.tscn")
