extends "../Base/BaseEnemy.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	add_to_group("Enemies")
	Globals.get_weapon(self, Globals.enemyWeapons["DootWeapon.tscn"])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var plrPosition = get_parent().get_node("Player").position
	if get_parent().get_node("Player"):
		look_at(plrPosition)
	if plrPosition.distance_to(position) > 100:
		velocity = transform.x * 1 * speed
		position += velocity * delta
	elif plrPosition.distance_to(position) < 100:
		velocity = transform.x * 1 * speed
		position -= velocity * delta
