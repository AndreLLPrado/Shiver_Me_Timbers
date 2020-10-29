extends Area2D

func changeSprite(var coins):
	if(coins == 0):
		$AnimatedSprite.play("0")
	elif(coins == 1):
		$AnimatedSprite.play("1")
	elif(coins == 2):
		$AnimatedSprite.play("2")
	elif(coins == 3):
		$AnimatedSprite.play("3")
	elif(coins == 4):
		$AnimatedSprite.play("4")
