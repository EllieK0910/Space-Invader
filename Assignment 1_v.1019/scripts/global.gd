extends Node

var number_of_invaders = -1
var hp = 3
var gameOn = false
var item_type = 0
var s1 = true
var s2 = true
var s3 = true
var s4 = true
var power_mode = false
var current_level = 1
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.gameOn = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func newGame():
	current_level = 1
	score = 0
