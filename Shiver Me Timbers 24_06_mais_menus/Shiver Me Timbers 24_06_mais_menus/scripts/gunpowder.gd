extends Area2D

func canBuy(coins):
	if(coins > 1):
		$gunpowderSprite.play("2")
	else:
		$gunpowderSprite.play("1")
