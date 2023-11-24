extends CharacterBody2D

@export var maxHealth : int;
@export var health : int;
@export var speed : int;
@export var damage : int;
@export var currXp : int;
@export var xpToLevel : float;
@export var level : int;
var weaponDict : Dictionary;

signal hit
signal dead
signal levelUp
signal healthChanged
signal xpChanged

enum states {ALIVE = 0, DEAD = 1, DAMAGED = 2, INVULNERABLE = 3}
enum movementStates {Idle, Walk}
var movementState = movementStates.Idle
var last_state = movementState
var currentState = states.ALIVE

#Gain XP from a source
func gainExp(source):
	currXp += source.currXp
	xpChanged.emit(currXp)
	if currXp >= xpToLevel:
		gainLevelUp()
		
func getDamage():
	return damage		

#When full of XP gain a level and raise the next level's required XP
func gainLevelUp():
	currXp = 0
	xpChanged.emit(currXp)
	level += 1
	levelUp.emit(self, level)
	xpToLevel *= 1.5
	print("You got a level!, you are now level " + str(level))
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
