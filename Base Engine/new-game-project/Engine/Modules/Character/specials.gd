extends Node

enum movement {
	QCF, QCB, charged_back, charged_down, DP, RDP, HCF, HCB, QCF_2, QCB_2, dash, backdash
}

enum button {
	A, B, C, D, E, F, none
}

@export var Moves : Array[movement]
@export var Buttons : Array[button]
