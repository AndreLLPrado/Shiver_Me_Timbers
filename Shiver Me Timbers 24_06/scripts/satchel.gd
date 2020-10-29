extends Area2D

var frame1 = preload("res://sprites/satchel.png")
var frame2 = preload("res://sprites/satchel1.png")
var frame3 = preload("res://sprites/satchel2.png")

func changeSprite(var coins):
	if(coins == 0):
		$AnimatedSprite.play("0")
	elif(coins == 1):
		$AnimatedSprite.play("1")
	elif(coins == 2):
		$AnimatedSprite.play("2")
