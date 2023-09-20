extends CharacterBody2D

@export var health : int;
@export var speed : int;
@export var damage : int;
@export var currExp : int;
@export var expToLevel : float;
@export var level : int;
var weaponList : Dictionary;
var instancedWeapon
var elementType

signal hit
signal dead

enum states {ALIVE = 0, DEAD = 1, DAMAGED = 2, INVULNERABLE = 3}

enum movementStates {Idle, Walk}
var movementState = movementStates.Idle
var last_state = movementState
var currentState = states.ALIVE

func _ready():
	elementType = $Elements.elementTypes

func shoot(weapon, instance, element):
	if instance not in get_children():
		instance = weapon.instantiate()
		instance.position = position
		instance.elementType = element
		get_parent().add_child(instance)
		instance.get_node("AudioStreamPlayer2D").pitch_scale = randf_range(0.7, 1.5)

func giveExp(target):
	target.gainExp(self)

func gainExp(source):
	currExp += source.currExp
	if currExp >= expToLevel:
		gainLevelUp()
	print(currExp)

func gainLevelUp():
	currExp = 0
	level += 1
	expToLevel *= 1.5
	print("You got a level!, you are now level " + str(self.level))
	roundf(expToLevel)

func getWeapon(weapon, element):
	var timer = Timer.new()
	instancedWeapon = weapon.instantiate()
	timer.timeout.connect(shoot.bind(weapon, instancedWeapon, element))
	timer.wait_time = instancedWeapon.getAttackSpeed()
	add_child(timer)
	timer.start()

func _on_hit(source):
	health -= source.getDamage()
	if health <= 0:
		dead.emit()
