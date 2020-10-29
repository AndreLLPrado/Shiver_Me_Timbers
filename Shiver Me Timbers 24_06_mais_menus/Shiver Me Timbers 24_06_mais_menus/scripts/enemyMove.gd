extends KinematicBody2D

const coin = preload("res://coin.tscn")
var zigzag = 0
var zigzagBool = true
var vector = Vector2(.25,.25)

func _physics_process(delta):

	move_and_collide(Vector2(0, 0.50))
	vector = vector + Vector2(0.0025,0.0025)
	get_node(".").scale = vector
	
	if(zigzag < 25):
		if(zigzagBool == true):
			zigzag = zigzag + 1
			move_and_collide(Vector2(zigzag/10, 0))
	if(zigzag > -25):
		if(zigzagBool == false):
			zigzag = zigzag - 1
			move_and_collide(Vector2(zigzag/10, 0))
	
	if(zigzag == 25):
		zigzagBool = false
	
	if(zigzag == -25):
		zigzagBool = true

func _on_Area2D_area_entered(area):
	var drop = coin.instance()
	get_parent().add_child(drop)
	drop.position = $Position2D.global_position
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	#tira vida e destroi palhaço
	queue_free()


func _on_Area2D_2_area_entered(area):
	queue_free()


func _on_Area2D_3_area_entered(area):
	queue_free()
