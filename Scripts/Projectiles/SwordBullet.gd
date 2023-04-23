extends "res://Scripts/BaseProjectile.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	if elementType == 2:
		modulate = Color(0, 1, 1)
	if elementType == 8:
		$AnimatedSprite2D.modulate = Color(0.9, 0.4, 0.1)
	$AnimatedSprite2D.play()
	var enemies = get_tree().get_nodes_in_group("Enemies")
	if enemies:
		look_at(enemies.pick_random().position)
	else:
		look_at(get_global_mouse_position())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = transform.x * 1 * projectileSpeed
	position += velocity * delta

