extends Node

func CheckAttacks():
	
	if $"../".P1:
		if MyInput.GetP1Button() == "none":
			return
		$Attacks.CheckAttacksP1()

func CheckAerealAttacks():
	
	if $"../".P1:
		if MyInput.GetP1Button() == "none":
			return
		$Attacks.CheckAerealAttacksP1()
