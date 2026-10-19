extends Node2D

var cannon0: Texture2D = preload("res://assets/cannon.png")
var cannon1: Texture2D = preload("res://assets/cannon1.png")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_bottom_wall_area_entered(area: Area2D) -> void:
	print("Game Over!!!")
	Global.end_game()

func fix_shield(player_x: int):
	var min_shield_life = 5
	var shield_no = 0
	if Global.s1 == true:
		if $Shield.shield_life < min_shield_life:
			min_shield_life = $Shield.shield_life
			shield_no = 1
	if Global.s2 == true:
		if $Shield2.shield_life < min_shield_life:
			min_shield_life = $Shield2.shield_life
			shield_no = 2
	if Global.s3 == true:
		if $Shield3.shield_life < min_shield_life:
			min_shield_life = $Shield3.shield_life
			shield_no = 3
	if Global.s4 == true:
		if $Shield4.shield_life < min_shield_life:
			min_shield_life = $Shield4.shield_life
			shield_no = 4
	if shield_no == 1:
		$Shield.shield_life += 1
	elif shield_no == 2:
		$Shield2.shield_life += 1
	elif shield_no == 3:
		$Shield3.shield_life += 1
	elif shield_no == 4:
		$Shield4.shield_life += 1
	else:
		print("All shields are complete!")
	if shield_no != 0:
		print("Shields are fixed!")
	
func boost_shoot():
	Global.power_mode = true 
	$Cannon.get_node("Sprite2D").texture = cannon1
	$boost_shooting_timer.start()
	await $boost_shooting_timer.timeout
	$Cannon.get_node("Sprite2D").texture = cannon0
	Global.power_mode = false
	
func hp_get():
	if Global.hp < 3:
		Global.hp += 1
	print("HP: ", Global.hp)
	
func _on_child_exiting_tree(node: Node) -> void:
	if node == $Shield:
		Global.s1 = false
	elif node == $Shield2:
		Global.s2 = false
	elif node == $Shield3:
		Global.s3 = false
	elif node == $Shield4:
		Global.s4 = false
