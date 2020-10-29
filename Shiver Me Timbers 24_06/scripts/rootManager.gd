extends Node

var chestCoins = 0
var health = 10
var weaponUpgrades = 40
var cannonUpgrades = 20

func _ready():
	updateCoins()

func _on_Chest_area_entered(area):
	if($Pirate.coins == 2):
		if(chestCoins < 4):
			chestCoins = chestCoins + 1
		$Pirate.depositCoins()
		updateCoins()

func _on_Coliso_Palhao_area_entered(area):
	health = health - 1
	$BandeiraHP.updateHealth(health)
	get_node("AudioStreamPlayer").play()
	if(health == 0):
		get_tree().quit()

func testUpgradeWeapon():
	if(weaponUpgrades > 0):
		upgradeWeapon()
	chestCoins = 0
	$Bau.changeSprite(chestCoins)

func upgradeWeapon():
	$Pirate.upgradeWeapon()
	weaponUpgrades = weaponUpgrades - 1

func updateCoins():
	$Bau.changeSprite(chestCoins)
	$ToolBox.canBuy(chestCoins)
	$Gunpowder.canBuy(chestCoins)
	$speedUpgrade.canBuy(chestCoins)
	$cannonUpgrade.canBuy(chestCoins)

func _on_ToolBox_area_entered(area):
	if(chestCoins > 0 && health < 10):
		health = 10
		chestCoins = chestCoins - 1
		updateCoins()
		$BandeiraHP.fixHealth()

func _on_Gunpowder_area_entered(area):
	if(chestCoins > 1 && weaponUpgrades > 1):
		weaponUpgrades = weaponUpgrades - 1
		$Pirate.upgradeWeapon()
		chestCoins = chestCoins - 2
		updateCoins()

func _on_speedUpgrade_area_entered(area):
	if(chestCoins > 2):
		$Pirate.speedUpgrade()
		chestCoins = chestCoins - 3
		updateCoins()


func _on_cannonUpgrade_area_entered(area):
	if(chestCoins > 3):
		$cannonLeft.upgrade()
		$cannonMiddle.upgrade()
		$cannonRight.upgrade()
		chestCoins = chestCoins - 4
		cannonUpgrades = cannonUpgrades -1
		updateCoins()
