extends Area2D

func canBuy(coins):
	if(coins > 3):
		$cannonSprite.play("2")
	else:
		$cannonSprite.play("1")
