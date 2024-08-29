extends Node

func GetXP1():
	return $Checker.P1X()

func GetYP1():
	return $Checker.P1Y()

func IsIdleP1():
	if $Checker.P1X() == 0 and $Checker.P1Y() == 0:
		return true
	return false

func GetXP2():
	return $Checker.P2X()

func GetYP2():
	return $Checker.P2Y()

func IsIdleP2():
	if $Checker.P2X() == 0 and $Checker.P2Y() == 0:
		return true
	return false

func GetP1Button():
	return $Checker.GetP1Button()
