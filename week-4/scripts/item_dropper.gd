extends Node2D

var screen_x
var item
@export var build_scene: PackedScene
@export var electric_scene: PackedScene
@export var heart_scene: PackedScene
@export var pos_x:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_x = get_viewport_rect().size.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	var type:int = randf() * 3 + 1
	if type == 1:
		item = build_scene.instantiate()
		Global.item_type = 1
	elif type == 2:
		item = electric_scene.instantiate()
		Global.item_type = 2
	elif type == 3:
		item = heart_scene.instantiate()
		Global.item_type = 3
	pos_x = randf() * screen_x
	item.global_position = Vector2(pos_x, 10)
	get_tree().root.get_node("Main").add_child(item)
