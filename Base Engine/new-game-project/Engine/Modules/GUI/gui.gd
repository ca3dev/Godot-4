extends Node2D

var P1combo = 0
var P2combo = 0

func _ready():
	Variables.GUI = self
	$CanvasLayer/PlayerGUI/HP.max_value = Variables.P1.HP
	$CanvasLayer/PlayerGUI/HP.value = Variables.P1.HP
	
	$CanvasLayer/PlayerGUI2/HP.max_value = Variables.P2.HP
	$CanvasLayer/PlayerGUI2/HP.value = Variables.P2.HP
	
	$CanvasLayer/PlayerGUI/ComboHIT.hide()
	$CanvasLayer/PlayerGUI/Combolabel.hide()
	
	$CanvasLayer/PlayerGUI2/ComboHIT.hide()
	$CanvasLayer/PlayerGUI2/Combolabel.hide()

func HITP1(damage):
	Variables.P1.HP -= damage
	$CanvasLayer/PlayerGUI/HP.value = Variables.P1.HP
	P1combo += 1
	$CanvasLayer/PlayerGUI2/ComboHIT.text = str(P1combo)
	$CanvasLayer/PlayerGUI2/ComboHIT.show()
	$CanvasLayer/PlayerGUI2/Combolabel.show()
	
	if Variables.P1.HP < 0 and Variables.P2.HP < 0 :
		Variables.lastwinner = 0
		Variables.GameOverBattle()
	elif Variables.P1.HP < 0 :
		Variables.lastwinner = 2
		Variables.GameOverBattle()

func HITP2(damage):
	Variables.P2.HP -= damage
	$CanvasLayer/PlayerGUI2/HP.value = Variables.P2.HP
	P2combo += 1
	$CanvasLayer/PlayerGUI/ComboHIT.text = str(P2combo)
	$CanvasLayer/PlayerGUI/ComboHIT.show()
	$CanvasLayer/PlayerGUI/Combolabel.show()
	if Variables.P1.HP < 0 and Variables.P2.HP < 0 :
		Variables.lastwinner = 0
		Variables.GameOverBattle()
	elif Variables.P2.HP < 0 :
		Variables.lastwinner = 1
		Variables.GameOverBattle()

func ResetCombo(p1):
	if p1:
		P1combo = 0
		$ComboEndP2.start(1.8)
	else:
		P2combo = 0
		$ComboEndP1.start(1.6)

func _on_combo_end_p_1_timeout():
	$CanvasLayer/PlayerGUI/ComboHIT.hide()
	$CanvasLayer/PlayerGUI/Combolabel.hide()

func _on_combo_end_p_2_timeout():
	$CanvasLayer/PlayerGUI2/ComboHIT.hide()
	$CanvasLayer/PlayerGUI2/Combolabel.hide()
