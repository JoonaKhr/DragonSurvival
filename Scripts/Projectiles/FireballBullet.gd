extends "../Base/BaseProjectile.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = transform.x * 1 * projectileSpeed
	position += velocity * delta

func _on_death_timer_timeout():
	queue_free()
