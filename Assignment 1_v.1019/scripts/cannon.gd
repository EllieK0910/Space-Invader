extends Area2D

@export var speed = 200

var screen_size
var direction = Vector2.ZERO

#var shootSfx = preload("")
#var healSfx = preload("")
#var shieldSfx = preload("")
#var eletricSfx = preload("")

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
	if Global.ending_game:
		return
	if area.collision_layer == 1:
		print("You are hit!")
		var hit_tween = create_tween()
		hit_tween.tween_property($Sprite2D, "modulate", Color.RED, 0.3)
		hit_tween.tween_property($Sprite2D, "modulate", Color.WHITE, 0.3)
		Global.hp -= 1
		if Global.hp <= 0:
			Global.hp = 0
			Global.end_game()
		print("HP: ", Global.hp)
	else:
		if Global.item_type == 1:
			get_tree().root.get_node("Main").fix_shield(position.x)
		elif Global.item_type == 2:
			print("Shoot boosted")
			get_tree().root.get_node("Main").boost_shoot()
		elif Global.item_type == 3:
			print("HP gained")
			get_tree().root.get_node("Main").hp_get()
	area.queue_free()
