extends "res://scripts/start_screen.gd"

func _ready() -> void:
	super._ready()
	$FinalScore.text = "FINAL SCORE\n%d" % Global.final_score

func _start_game() -> void:
	Global.newGame()
	super._start_game()
