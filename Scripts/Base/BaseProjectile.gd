extends Area2D

@export var damage : float;
@export var projectileSpeed : float;
@export var attackTimer : float;
@export var multishot : int;
var velocity
var elementType

func getDamage():
	return damage

func getProjectileSpeed():
	return projectileSpeed

func getAttackSpeed():
	return attackTimer

func getElementType():
	return elementType

func getWeapon():
	pass

func _on_body_entered(body):
	body.hit.emit(self)
	queue_free()
#set up bonus damage from player
