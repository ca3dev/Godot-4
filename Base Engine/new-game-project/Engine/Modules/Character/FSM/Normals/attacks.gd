extends Node

@onready var FSM = $"../../"

func CheckAttacksP1():
	
	if MyInput.GetP1Button() == "A" and FSM.Character.A_allow:
		FSM.current = FSM.get_node("NORMALS/ATTACK")
		FSM.current.Start(1)
	if MyInput.GetP1Button() == "B" and FSM.Character.B_allow:
		FSM.current = FSM.get_node("NORMALS/ATTACK")
		FSM.current.Start(2)
	if MyInput.GetP1Button() == "C" and FSM.Character.C_allow:
		FSM.current = FSM.get_node("NORMALS/ATTACK")
		FSM.current.Start(3)
	if MyInput.GetP1Button() == "D" and FSM.Character.D_allow:
		FSM.current = FSM.get_node("NORMALS/ATTACK")
		FSM.current.Start(4)
	
func CheckAerealAttacksP1():
	if MyInput.GetP1Button() == "A" and FSM.Character.A_allow:
		FSM.current = FSM.get_node("NORMALS/AIRNORMALS")
		FSM.current.Start(5)
