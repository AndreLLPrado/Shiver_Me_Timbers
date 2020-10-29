extends KinematicBody2D

const clown = preload("res://Clown.tscn")
const SPclown = preload("res://SPClown.tscn")
var spawnTick = 0
var spawnCooldown = 600
var spawns = 0
var rounds = 0
var movX = 1
var mov = 1
var sp = 0

func _physics_process(delta):
	
	if(mov == 1):
		move_and_collide(Vector2(-2.5, 0))
		movX = movX - 1
	else:
		move_and_collide(Vector2(2.5, 0))
		movX = movX + 1
	
	if(movX < 1):
		mov = 2
	elif(movX > 329):
		mov = 1
	
	if(spawnTick > spawnCooldown):
		sp = randi()%10+1
		get_node("AudioStreamPlayer2D").play()
		if(sp  == 10):
			var enemy = SPclown.instance()
			get_parent().add_child(enemy)
			enemy.position = $Inimigo2D.global_position
			spawnTick = 0
			spawns = spawns + 1
		else:
			var enemy = clown.instance()
			get_parent().add_child(enemy)
			enemy.position = $Inimigo2D.global_position
			spawnTick = 0
			spawns = spawns + 1
	else:
		spawnTick = spawnTick + 2
	
	if(spawns == 5):
		spawns = 0
		rounds = rounds + 1
	
	if(rounds > 100):
		spawnCooldown = spawnCooldown - 0.10
	elif(rounds > 90):
		spawnCooldown = spawnCooldown - 0.25
	elif(rounds > 80):
		spawnCooldown = spawnCooldown - 0.75
	elif(rounds > 70):
		spawnCooldown = spawnCooldown - 1.5
	elif(rounds > 50):
		spawnCooldown = spawnCooldown - 2
	elif(rounds > 40):
		spawnCooldown = spawnCooldown - 1.5
	elif(rounds > 30):
		spawnCooldown = spawnCooldown - 0.75
	elif(rounds > 20):
		spawnCooldown = spawnCooldown - 0.25
