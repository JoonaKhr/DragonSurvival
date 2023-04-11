extends "res://Scripts/BaseProjectile.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	var enemies = get_tree().get_nodes_in_group("Enemies")
	var player = get_parent().get_node("Player")
	var nearestEnemy
	if !enemies.is_empty():
		nearestEnemy = enemies[0]
	for enemy in enemies:
		if enemy.global_position.distance_to(player.global_position) < nearestEnemy.global_position.distance_to(player.global_position):
			nearestEnemy = enemy
	look_at(nearestEnemy.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = transform.x * 1 * projectileSpeed
	position += velocity * delta

