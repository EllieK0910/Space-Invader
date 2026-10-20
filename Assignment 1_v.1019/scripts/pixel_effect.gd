extends Node2D
## Short-lived, collision-free pixel particles shared by gameplay effects.

var tint := Color.WHITE
var lifetime := 0.65
var elapsed := 0.0
var velocities: Array[Vector2] = []
var kind := "burst"

static func spawn(source: Node2D, at: Vector2, color: Color, style := "burst") -> void:
	var scene := source.get_tree().current_scene
	if scene == null:
		return
	var effect = load("res://scripts/pixel_effect.gd").new()
	effect.tint = color
	effect.kind = style
	if style == "muzzle":
		effect.lifetime = 0.16
	scene.add_child(effect)
	effect.global_position = at

func _ready() -> void:
	z_index = 20
	for i in range(14):
		velocities.append(Vector2.from_angle(TAU * i / 14.0 + randf_range(-0.12, 0.12)) * randf_range(30.0, 95.0))

func _process(delta: float) -> void:
	elapsed += delta
	modulate.a = 1.0 - elapsed / lifetime
	queue_redraw()
	if elapsed >= lifetime:
		queue_free()

func _draw() -> void:
	if kind == "muzzle":
		draw_rect(Rect2(-3, -13, 6, 18), tint)
		draw_rect(Rect2(-8, -5, 16, 4), Color.WHITE)
		return
	for i in range(velocities.size()):
		var point := (velocities[i] * elapsed).snapped(Vector2(2, 2))
		var side := 4.0 if i % 3 else 6.0
		draw_rect(Rect2(point - Vector2.ONE * side / 2, Vector2.ONE * side), tint if i % 3 else Color.WHITE)
	if kind == "heal":
		var y := -elapsed * 35
		draw_rect(Rect2(-3, y - 9, 6, 18), tint)
		draw_rect(Rect2(-9, y - 3, 18, 6), tint)
	elif kind == "repair":
		var width := 22.0 + elapsed * 60
		draw_rect(Rect2(-width / 2, -12, width, 24), tint, false, 2)
