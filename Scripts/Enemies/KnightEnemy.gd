extends "res://Scripts/Base/BaseEnemy.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	add_to_group("Enemies")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var plrPosition = get_parent().get_node("Player").position
	if get_parent().get_node("Player"):
		look_at(plrPosition)
	velocity = transform.x * 1 * speed
	var collision := move_and_collide(velocity * delta)
	if collision != null:
		var _body := collision.get_collider()
