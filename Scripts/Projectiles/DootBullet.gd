extends "res://Scripts/BaseProjectile.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	#var enemies = get_tree().get_nodes_in_group("Enemies")
	var player = get_parent().get_node("Player")
	look_at(player.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = transform.x * 1 * projectileSpeed
	position += velocity * delta

func _on_area_entered(area):
	if area in get_tree().get_nodes_in_group("player"):
		area.takeDamage(damage)
		queue_free()
