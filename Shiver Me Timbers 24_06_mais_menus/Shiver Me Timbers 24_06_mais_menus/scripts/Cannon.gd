extends Area2D

const cannonBall = preload("res://CannonBall.tscn")

var angle = 0
var loaded = true
var reloadTick = 0
var reloadCD = 3000
var fireRate = 0
var shots = 0
var shotsLeft = 0
var upgrades = 0

func _process(delta):
	reloadTick = reloadTick + 2
	if(reloadTick > reloadCD):
		fire()
	aim_cannon()
	
func fire():
	if loaded == true:
		if Input.is_action_just_pressed("cannon_action"):
			shotsLeft = shots
			while(shotsLeft > 0):
				shotsLeft = shotsLeft - 1
				var bullet = cannonBall.instance()
				bullet.position = $cannon/cannon_aim.position
				add_child(bullet)
				loaded = false

func upgrade():
	if(upgrades == 0):
		upgrades = upgrades + 1
		shots = shots + 1
		reloadCD = reloadCD - 50
	elif(upgrades == 5):
		upgrades = upgrades + 1
		shots = shots + 1
		reloadCD = reloadCD - 50
	elif(upgrades == 10):
		upgrades = upgrades + 1
		shots = shots + 1
		reloadCD = reloadCD - 50
	elif(upgrades == 15):
		upgrades = upgrades + 1
		shots = shots + 1
		reloadCD = reloadCD - 50
	if(upgrades == 20):
		upgrades = upgrades + 1
		shots = shots + 1
		reloadCD = reloadCD - 50
	else:
		upgrades = upgrades + 1
		reloadCD = reloadCD - 50


func aim_cannon():
	if (rotation_degrees > -170):
		if Input.is_action_just_pressed("cannon_left"):
			rotation -= 0.5
	if (rotation_degrees < 0):
		if Input.is_action_just_pressed("cannon_ritgh"):
			rotation += 0.5
