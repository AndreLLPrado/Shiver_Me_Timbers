extends Area2D

const speed = -200
var velocity = Vector2()

func _ready():
	pass

func _physics_process(delta):
	#velocity.y = speed * delta
	velocity.x = (-1 * speed) * delta
	translate(velocity)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_area_entered(area):
	queue_free()
