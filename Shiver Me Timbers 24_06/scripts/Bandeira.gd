extends Area2D

const Pspeed = 100
const Nspeed = -200
var velocity = Vector2()
var currentHealth = 10
var time = 0
var setting = 1

func _physics_process(delta):
	if(setting == 1):
		if(time > 0):
			velocity.y = Pspeed * delta
			time = time -1
			translate(velocity)
	
	if(setting == 2):
		if(time > 0):
			velocity.y = Nspeed * delta
			time = time -2
			translate(velocity)

func updateHealth(var health):
	currentHealth = health
	time = 20
	setting = 1

func fixHealth():
	time = 20*(10-currentHealth)
	currentHealth = 10
	setting = 2

