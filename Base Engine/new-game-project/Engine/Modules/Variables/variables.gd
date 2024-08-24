extends Node

enum mode {
	Arcade, Practice, Versus, Online
}

@export var Mode : mode

@export var P1 : CharacterBody2D
@export var P2 : CharacterBody2D

@export var P1Left : bool
