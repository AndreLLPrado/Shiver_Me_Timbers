extends KinematicBody2D

const clown = preload("res://Clown.tscn")
const cannonBall = preload("res://pirateCannonBall.tscn")
var reload = 0
var reloadTime = 100
var coins = 0
var speedUpgrades = 0
var Speed = 2.5
var direita = 1

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_action"):
		if(reload > reloadTime):
			var projectile = cannonBall.instance()
			get_parent().add_child(projectile)
			projectile.position = $Pirata2D.global_position
			reload = 0
	reload = reload + 1
	
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-Speed, 0))
		$AnimatedSprite.play("esquerda")
	elif Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(Speed, 0))
		$AnimatedSprite.play("direita")
	else:
		$AnimatedSprite.play("parado")
	
	if Input.is_action_pressed("ui_up"):
		move_and_collide(Vector2(0, -Speed/2))
		$AnimatedSprite.play("direita")
	elif Input.is_action_pressed("ui_down"):
		move_and_collide(Vector2(0, Speed/2))
		$AnimatedSprite.play("esquerda")


func _on_Area2D_2_area_entered(area):
	get_tree().quit()


func _on_Satchel_area_entered(area):
	if(coins < 2):
		coins = coins + 1
		$Satchel.changeSprite(coins)

func getCoins():
	return coins

func depositCoins():
	coins = 0
	$Satchel.changeSprite(coins)

func upgradeWeapon():
		reloadTime = reloadTime - 1.5

func die():
	get_tree().quit()

func speedUpgrade():
	if(speedUpgrades < 10):
		Speed = Speed + 0.035
		speedUpgrades = speedUpgrades + 1
	elif(speedUpgrades < 20):
		Speed = Speed + 0.030
		speedUpgrades = speedUpgrades + 1
	elif(speedUpgrades < 30):
		Speed = Speed + 0.025
		speedUpgrades = speedUpgrades + 1
	elif(speedUpgrades < 40):
		Speed = Speed + 0.020
		speedUpgrades = speedUpgrades + 1
	elif(speedUpgrades < 50):
		Speed = Speed + 0.015
		speedUpgrades = speedUpgrades + 1
	elif(speedUpgrades < 60):
		Speed = Speed + 0.010
		speedUpgrades = speedUpgrades + 1
	elif(speedUpgrades < 70):
		Speed = Speed + 0.005
		speedUpgrades = speedUpgrades + 1
