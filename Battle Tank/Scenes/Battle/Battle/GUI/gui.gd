extends Node2D

func _ready() -> void:
	DataPaths.GUI = self
	$CanvasLayer/Gas.value = 0

func ChargeShoot(delta):
	$CanvasLayer/Strenght.value += delta * 100

func ReleaseShoot():
	$CanvasLayer/Strenght.value = 0

func GetStrenght():
	return $CanvasLayer/Strenght.value

func Dash(delta):
	$CanvasLayer/Gas.value -= delta * 10

func GetDash():
	return $CanvasLayer/Gas.value

func Barrel(delta):
	$CanvasLayer/Gas.value += delta
	
func UpdateEnemiesLeft(enemies):
	$CanvasLayer/EnemiesLeft.text = str(enemies)

func _process(delta):
	$CanvasLayer/HP.text = str(Variables.HP)
