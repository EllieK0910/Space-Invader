extends Node2D

var elapsed := 0.0

func _ready() -> void:
	z_index = 10

func _process(delta: float) -> void:
	if not Global.power_mode:
		queue_free()
		return
	elapsed += delta
	queue_redraw()

func _draw() -> void:
	var phase := int(elapsed * 8) % 3
	var color := Color(1.0, 0.86, 0.25, 0.8)
	for side in [-1, 1]:
		var x := float(side * (22 + phase * 2))
		draw_polyline(PackedVector2Array([Vector2(x, -14), Vector2(x - side * 5, -5), Vector2(x + side * 2, -5), Vector2(x - side * 4, 8)]), color, 2.0)
