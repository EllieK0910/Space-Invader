extends Node

var number_of_invaders = -1
var item_type: int = 0 
var cannon_life: int = 5
const MAX_CANNON_LIFE: int = 5

func gameOver():
	print("Game Over!!!")
	get_tree().reload_current_scene()
	cannon_life = 5
