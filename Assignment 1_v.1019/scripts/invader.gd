class_name Invader
extends Area2D

const PixelEffect = preload("res://scripts/pixel_effect.gd")

var getScore = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	print("Hit Invaders")
	PixelEffect.spawn(self, global_position, Color("74f7dc"))
	# remove laser node & remove invader node***
	Global.score += getScore
	Global.number_of_invaders -= 1
	area.queue_free()
	call_deferred("queue_free")
	if Global.number_of_invaders == 0:
		print("All invaders dies")
		Global.current_level += 1
		get_tree().reload_current_scene()
		Global.s1 = true
		Global.s2 = true
		Global.s3 = true
		Global.s4 = true
		Global.power_mode = false
