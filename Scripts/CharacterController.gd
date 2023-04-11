extends "res://Scripts/BaseCharacter.gd"

enum STATES {Idle, Walk}
var state = STATES.Idle
var last_state = state
var bullet = load("res://Scenes/Bullet.tscn")
var sword = load("res://Scenes/SwordBullet.tscn")
var bullets
signal hit


# Called when the node enters the scene tree for the first time.
func _ready():
	getWeapon(sword)
	getWeapon(sword)
	getWeapon(sword)
	getWeapon(sword)
	getWeapon(bullet)

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
		state = STATES.Walk
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.speed_scale = 2
		$AnimatedSprite2D.play()
	else:
		state = STATES.Idle
		# $ is same as get_node()
		$AnimatedSprite2D.animation = "idle"
		$AnimatedSprite2D.stop()
	position += velocity * delta

func _on_area_entered(area):
	if area in get_tree().get_nodes_in_group("Enemies"):
		takeDamage(area.damage)
		print("got hit ", health)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func shoot(weapon, instance):
	if instance not in get_children():
		instance = weapon.instantiate()
		instance.position = position
		get_parent().add_child(instance)

func getWeapon(weapon):
	var timer = Timer.new()
	var instancedWeapon = weapon.instantiate()
	timer.timeout.connect(shoot.bind(weapon, instancedWeapon))
	timer.wait_time = instancedWeapon.getAttackSpeed()
	add_child(timer)
	timer.start()
	# if weapon not in weaponList.keys():
	# 	weaponList[weapon] = 1
	# else:
	# 	weaponList[weapon] += 1

# when you gain a weapon for the first time load the scene into memory and add an object to the weaponlist

# put the variable of an instanced scene into the dictionary and the amount of them as the value

# put the timer onto the bullet scene maybe it works ?

# find a way to keep possible enemy bullets and sprites always on top

#Create child timer onto player when receiving weapon

#BaseProjectile
