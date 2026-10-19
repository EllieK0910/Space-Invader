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

func reset_game() -> void:
	number_of_invaders = -1
	hp = 3
	gameOn = true
	item_type = 0
	s1 = true
	s2 = true
	s3 = true
	s4 = true
	power_mode = false

func end_game() -> void:
	if not gameOn:
		return
	gameOn = false
	# Stop gameplay immediately; change scenes outside the collision callback.
	get_tree().paused = true
	_show_game_over.call_deferred()

func _show_game_over() -> void:
	var error := get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	get_tree().paused = false
	if error != OK:
		push_error("Unable to open game over screen: %s" % error_string(error))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.gameOn = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
