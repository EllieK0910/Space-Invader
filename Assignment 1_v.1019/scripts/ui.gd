extends Control

func _process(delta: float) -> void:
	$HP.text = "HP: " + str(Global.hp)
	$Level.text = "Level: " + str(Global.current_level)
	$Score.text = "Score: " + str(Global.score)
	$HighScore.text = "HighScore: " + str(Global.highscore)
