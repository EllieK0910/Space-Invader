extends Control

@onready var prompt: TextureRect = $Prompt
var pulse: Tween
var starting := false

func _ready() -> void:
	prompt.resized.connect(_center_prompt_pivot)
	_center_prompt_pivot()
	pulse = create_tween().set_loops()
	pulse.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	pulse.tween_property(prompt, "scale", Vector2(1.08, 1.08), 0.85)
	pulse.tween_property(prompt, "scale", Vector2.ONE, 0.85)

func _center_prompt_pivot() -> void:
	prompt.pivot_offset = prompt.size / 2.0

func _input(event: InputEvent) -> void:
	if starting or not event.is_action_pressed("shoot") or event.is_echo():
		return
	starting = true
	get_viewport().set_input_as_handled()
	# Defer the scene swap so the starting key event cannot fire a game shot.
	_start_game.call_deferred()

func _start_game() -> void:
	var error := get_tree().change_scene_to_file("res://scenes/main.tscn")
	if error != OK:
		starting = false
		push_error("Unable to open the game scene: %s" % error_string(error))
