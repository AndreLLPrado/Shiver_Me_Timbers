extends Area2D

func canBuy(coins):
	if(coins > 2):
		$speedSprite.play("2")
	else:
		$speedSprite.play("1")
