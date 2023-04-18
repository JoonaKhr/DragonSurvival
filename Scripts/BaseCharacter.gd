extends CharacterBody2D

@export var health : int;
@export var speed : int;
@export var damage : int;
@export var currExp : int;
@export var expToLevel : float;
@export var level : int;
var weaponList : Dictionary;
var instancedWeapon

func takeDamage(DamageSource):
	health -= DamageSource
	if health <= 0:
		if self in get_tree().get_nodes_in_group("Enemies"):
			get_tree().get_nodes_in_group("player")[0].gainExp(self)
			queue_free()
		else:
			hide()

func shoot(weapon, instance):
	if instance not in get_children():
		instance = weapon.instantiate()
		instance.position = position
		get_parent().add_child(instance)

func gainExp(source):
	currExp += source.currExp
	if currExp >= expToLevel:
		gainLevelUp()
	print(currExp)

func gainLevelUp():
	currExp = 0
	level += 1
	expToLevel *= 1.5
	print("You got level!")
	roundf(expToLevel)

func getWeapon(weapon):
	var timer = Timer.new()
	instancedWeapon = weapon.instantiate()
	timer.timeout.connect(shoot.bind(weapon, instancedWeapon))
	timer.wait_time = instancedWeapon.getAttackSpeed()
	add_child(timer)
	timer.start()
