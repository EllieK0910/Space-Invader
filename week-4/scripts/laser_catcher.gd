extends Area2D

func _on_area_entered(area: Area2D) -> void:
	print("Catch!")
	area.queue_free()
