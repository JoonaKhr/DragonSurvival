extends "res://Scripts/Base/BaseCharacter.gd"

var swordWeapon = load("res://Scenes/WeaponScenes/SwordWeapon.tscn")
var list
# Called when the node enters the scene tree for the first time.
func _ready():
	list = []
	getWeapon(swordWeapon, list)

func get_pos():
	print(position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.flip_h = false
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.flip_h = true
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		movementState = movementStates.Walk
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.speed_scale = 2
		$AnimatedSprite2D.play()
	else:
		movementState = movementStates.Idle
		# $ is same as get_node()
		$AnimatedSprite2D.animation = "idle"
		$AnimatedSprite2D.stop()
	move_and_collide(velocity * delta)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

# when you gain a weapon for the first time load the scene into memory and add an object to the weaponlist

# put the variable of an instanced scene into the dictionary and the amount of them as the value

# find a way to keep possible enemy bullets and sprites always on top

func _on_dead():
	hide()
	get_tree().paused = true
