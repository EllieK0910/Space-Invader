extends Area2D

var shield_life = 5

var shield1: Texture2D = preload("res://assets/shield1.png")
var shield2: Texture2D = preload("res://assets/shield2.png")
var shield3: Texture2D = preload("res://assets/shield3.png")
var shield4: Texture2D = preload("res://assets/shield4.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	print("shield lose life")
	shield_life -= 1
	$Timer.start()
	await $Timer.timeout
	area.queue_free()
	if shield_life == 4:
		$Sprite2D.texture = shield1
	elif shield_life == 3:
		$Sprite2D.texture = shield2
	elif shield_life == 2:
		$Sprite2D.texture = shield3
	elif shield_life == 1:
		$Sprite2D.texture = shield4
	else:
		print("shield disappear")
		queue_free()
	
