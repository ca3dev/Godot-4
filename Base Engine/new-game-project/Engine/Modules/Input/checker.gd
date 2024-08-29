extends Node

func P1X():
	return %Buffer.buffer[0].key.x

func P1Y():
	return %Buffer.buffer[0].key.y

func P2X():
	return %Buffer2.buffer[0].key.x

func P2Y():
	return %Buffer2.buffer[0].key.y

func GetP1Button():
	return %Buffer.current_key.button
