extends Area2D

func canBuy(coins):
	if(coins > 0):
		$toolboxSprite.play("1")
	else:
		$toolboxSprite.play("2")
