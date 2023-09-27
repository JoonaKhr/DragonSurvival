extends CharacterBody2D

@export var maxHealth : int;
@export var health : int;
@export var speed : int;
@export var damage : int;
@export var currXp : int;
@export var xpToLevel : float;
@export var level : int;
var weaponList : Array;
var elementType

signal hit
signal dead
signal healthChanged
signal xpChanged

enum states {ALIVE = 0, DEAD = 1, DAMAGED = 2, INVULNERABLE = 3}
enum movementStates {Idle, Walk}
var movementState = movementStates.Idle
var last_state = movementState
var currentState = states.ALIVE

func getWeapon(weapon, weapons):
	var instancedWeapon = weapon.instantiate()
	weapons.append(weapon)
	add_child(instancedWeapon)

func gainExp(source):
	currXp += source.currXp
	xpChanged.emit(currXp)
	if currXp >= xpToLevel:
		gainLevelUp()

func gainLevelUp():
	currXp = 0
	xpChanged.emit(currXp)
	level += 1
	xpToLevel *= 1.5
	print("You got a level!, you are now level " + str(self.level))
	roundf(xpToLevel)

#Send a signal when the character is hit and deduct health
func _on_hit(source):
	health -= source.getDamage()
	healthChanged.emit(health)
	if health <= 0:
		dead.emit()

func _on_xp_changed(currentXp):
	return currentXp

func _on_health_changed(currentHealth):
	return currentHealth