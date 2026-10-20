extends Control

const HEART_FULL = preload("res://assets/ui/heart_full.svg")
const HEART_EMPTY = preload("res://assets/ui/heart_empty.svg")

@onready var level_label: Label = $Margin/Row/Level
@onready var score_label: Label = $Margin/Row/Score
@onready var high_score_label: Label = $Margin/Row/HighScore
@onready var hearts: HBoxContainer = $Margin/Row/Hearts

func _ready() -> void:
	get_viewport().size_changed.connect(_fit_viewport)
	_fit_viewport()
	update_hud()

func _fit_viewport() -> void:
	size = get_viewport_rect().size

func _process(_delta: float) -> void:
	update_hud()

func update_hud() -> void:
	level_label.text = "LEVEL: %d" % Global.current_level
	score_label.text = "SCORE: %d" % Global.score
	high_score_label.text = "HIGHSCORE: %d" % Global.highscore
	for i in range(hearts.get_child_count()):
		hearts.get_child(i).texture = HEART_FULL if i < Global.hp else HEART_EMPTY
