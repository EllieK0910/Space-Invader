extends Node

var number_of_invaders = -1
var hp = 3
var item_type = 0
var s1 = true
var s2 = true
var s3 = true
var s4 = true
var power_mode = false
var current_level = 1
var score = 0
var highscore = 0
var final_score = 0
var ending_game = false

func end_game() -> void:
	if ending_game:
		return
	ending_game = true
	final_score = score
	highscore = maxi(highscore, final_score)
	get_tree().paused = true
	_show_game_over.call_deferred()

func _show_game_over() -> void:
	var error := get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	get_tree().paused = false
	if error != OK:
		ending_game = false
		push_error("Unable to open game over screen: %s" % error_string(error))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if score > highscore:
		highscore = score

func newGame():
	ending_game = false
	final_score = 0
	current_level = 1
	score = 0
	hp = 3
	item_type = 0
	power_mode = false
	s1 = true
	s2 = true
	s3 = true
	s4 = true
