extends "../Base/BaseWeapon.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	soundEmitter = $shootSoundEmitter
	player = get_tree().get_nodes_in_group("Player")[0]

func get_closest_enemies():
	enemies = get_tree().get_nodes_in_group("Enemies")
	if !enemies.is_empty():
		enemies.sort_custom(func(x, y): return player.global_position.distance_to(x.global_position) < player.global_position.distance_to(y.global_position))
	return enemies

func spawn_projectiles(enemy_list, i):
	var instanced_projectile = projectile.instantiate()
	instanced_projectile.position = player.position
	instanced_projectile.get_child(0).play()
	instanced_projectile.rotate(player.get_angle_to(enemy_list[i].global_position))
	get_tree().get_root().add_child(instanced_projectile)
	soundEmitter.pitch_scale = randf_range(0.7, 1.3)
	soundEmitter.play()

func _on_attack_timer_timeout():
	for i in range(multishot):
		spawn_projectiles(get_closest_enemies(), i)
