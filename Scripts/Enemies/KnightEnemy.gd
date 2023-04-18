extends "res://Scripts/BaseCharacter.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	add_to_group("Enemies")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var plrPosition = get_parent().get_node("Player").position
	look_at(plrPosition)
	velocity = transform.x * 1 * speed
	position += velocity * delta
