extends "res://Scripts/BaseCharacter.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	var enemies = get_tree().get_nodes_in_group("Enemies")
	if enemies:
		look_at(enemies.pick_random().position)
	else:
		look_at(get_global_mouse_position())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = transform.x * 1 * speed
	position += velocity * delta

func _on_area_entered(area):
	if area in get_tree().get_nodes_in_group("Enemies"):
		area.queue_free()
		queue_free()
