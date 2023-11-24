extends "../Base/BaseWeapon.gd"

@onready var player = get_tree().get_nodes_in_group("Player")[0]
# Called when the node enters the scene tree for the first time.
func _ready():
	soundEmitter = $shootSoundEmitter

func get_closest_enemies():
	var enemies = get_tree().get_nodes_in_group("Enemies")
	if !enemies.is_empty():
		enemies.sort_custom(func(x, y): return player.global_position.distance_to(x.global_position) < player.global_position.distance_to(y.global_position))
	return enemies

func shoot(enemies, i):
	var line = Line2D.new()
	line.add_point(player.position)
	line.add_point(enemies[i].global_position)
	get_tree().get_root().add_child(line)

	var instanced_projectile = projectile.instantiate()
	
	instanced_projectile.position = player.position
	print("projectile ", i, " ", instanced_projectile.get_angle_to(enemies[i].global_position))
	print("player ", i, " ", player.get_angle_to(enemies[i].global_position))
	instanced_projectile.rotate(player.get_angle_to(enemies[i].global_position))
	#instanced_projectile.look_at(enemies[i].global_position)
	get_tree().get_root().add_child(instanced_projectile)

	

# func spawnProjectiles():
# 	var instanced_projectile = projectile.instantiate()
# 	instanced_projectile.position = player.position
# 	instanced_projectile.get_child(0).play()
# 	instanced_projectile.look_at(enemies[i].position)
# 	get_tree().get_root().add_child(instanced_projectile)
# 	soundEmitter.pitch_scale = randf_range(0.7, 1.3)
# 	soundEmitter.play()

func _on_attack_timer_timeout():
	for i in range(multishot):
		shoot(get_closest_enemies(), i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
