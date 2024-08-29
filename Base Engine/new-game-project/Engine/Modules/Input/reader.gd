extends Node

func ReadP1():
	%Buffer.AddKey(GetKey())

func GetKey():
	var key = Vector2i.ZERO
	if Input.is_action_pressed("LEFTP1"):
		key.x = -1
	if Input.is_action_pressed("RIGHTP1"):
		key.x = 1
	if Input.is_action_pressed("LEFTP1") and Input.is_action_pressed("RIGHTP1"):
		key.x = 0
	if Input.is_action_pressed("UPP1"):
		key.y = -1
	if Input.is_action_pressed("DOWNP1"):
		key.y = 1
	if Input.is_action_pressed("UPP1") and Input.is_action_pressed("DOWNP1"):
		key.y = 0
	
	return key

func GetKey2():
	var key = Vector2i.ZERO
	if Input.is_action_pressed("LEFTP2"):
		key.x = -1
	if Input.is_action_pressed("RIGHTP2"):
		key.x = 1
	if Input.is_action_pressed("LEFTP2") and Input.is_action_pressed("RIGHTP2"):
		key.x = 0
	if Input.is_action_pressed("UPP2"):
		key.y = -1
	if Input.is_action_pressed("DOWNP2"):
		key.y = 1
	if Input.is_action_pressed("UPP2") and Input.is_action_pressed("DOWNP2"):
		key.y = 0
	
	return key

func ReadP2():
	%Buffer2.AddKey(GetKey2())

func ReadP1Buttons():
	
	var button = GetP1Buttons()
	if button != "none":
		%Buffer.AddButton(button)

func GetP1Buttons():
	var button = "none"
	
	if Input.is_action_pressed("AP1"):
		button = "A"
	if Input.is_action_pressed("BP1"):
		button = "B"
	if Input.is_action_pressed("CP1"):
		button = "C"
	if Input.is_action_pressed("DP1"):
		button = "D"
	
	return button
