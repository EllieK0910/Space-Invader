extends Area2D

@export var speed = 200

var screen_size
var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input = Input.get_axis("left", "right")
	if input > 0:
		direction = Vector2.RIGHT
	elif input < 0:
		direction = Vector2.LEFT
	else:
		direction = Vector2.ZERO
	position.x += delta * speed * direction.x
	position = position.clamp(Vector2.ZERO, screen_size)

func _on_area_entered(area: Area2D) -> void:
	print("you are hit")
	area.queue_free()
	Global.hp -= 1
	print(Global.hp)
	if Global.hp == 0:
		Global.hp = 0
		Global.gameOn = false
