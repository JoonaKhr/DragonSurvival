extends CharacterBody2D

@export var health : int;
@export var speed : int;
@export var damage : int;
@export var currExp : int;
@export var expToLevel : float;
@export var level : int;
@export_flags("Fire", "Water", "Lightning", "Earth") var elementResistance = 0
@export_flags("Fire", "Water", "Lightning", "Earth") var elementWeakness = 0
var weaponList : Dictionary;
var instancedWeapon

func takeDamage(damageSource):
	if damageSource.elementType == elementResistance:
		health -= damageSource.damage / 2
		print("Damage Halved")
	elif damageSource.elementType == elementWeakness:
		health -= damageSource.damage * 2
		print("Damage Doubled")
	if health <= 0:
		if self in get_tree().get_nodes_in_group("Enemies"):
			get_tree().get_nodes_in_group("Player")[0].gainExp(self)
			queue_free()
		else:
			hide()

func shoot(weapon, instance, element):
	if instance not in get_children():
		instance = weapon.instantiate()
		instance.position = position
		instance.elementType = element
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

func getWeapon(weapon, element):
	var timer = Timer.new()
	instancedWeapon = weapon.instantiate()
	timer.timeout.connect(shoot.bind(weapon, instancedWeapon, element))
	timer.wait_time = instancedWeapon.getAttackSpeed()
	add_child(timer)
	timer.start()
