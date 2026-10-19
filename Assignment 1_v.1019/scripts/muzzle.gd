extends Node2D

@export var laser_scene : PackedScene
var can_shoot = true
var las_timer

func _ready() -> void:
	las_timer = get_tree().root.get_node("Main").get_node("laser_timer")

func _input(event):
	if Input.is_action_just_pressed("shoot") && can_shoot:
		var laser = laser_scene.instantiate()
		laser.global_position = get_parent().global_position + Vector2(0, -20)
		get_tree().root.get_node("Main").add_child(laser)
		can_shoot = false
		laser.tree_exited.connect(on_laser_destroyed)
		if Global.power_mode == true:
			var laser1 = laser_scene.instantiate()
			laser1.global_position = get_parent().global_position + Vector2(0, -10)
			las_timer.start()
			await las_timer.timeout
			get_tree().root.get_node("Main").add_child(laser1)
			

func on_laser_destroyed():
	can_shoot = true
