extends KinematicBody2D

const coin = preload("res://coin.tscn")
var goUpTimer = 0
var vector = Vector2(.25,.25)
var life = 3

func _physics_process(delta):	
	if(goUpTimer > 0):
		move_and_collide(Vector2(0, -1))
		goUpTimer = goUpTimer - 1
	else:
		move_and_collide(Vector2(0, 0.50))

func _on_Area2D_area_entered(area):
	var drop = coin.instance()
	get_parent().add_child(drop)
	drop.position = $Position2D.global_position
	decreaseLife()


func _on_VisibilityNotifier2D_screen_exited():
	#tira vida e destroi palhaço
	queue_free()


func _on_Area2D_2_area_entered(area):
	decreaseLife()


func _on_Area2D_3_area_entered(area):
	decreaseLife()

func decreaseLife():
	life = life - 1
	if(life == 0):
		queue_free()
	else:
		goUpTimer = 75
