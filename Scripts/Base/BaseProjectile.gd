extends Area2D

@export var damage : float;
@export var projectileSpeed : float;
var velocity

func getDamage():
	return damage

func getProjectileSpeed():
	return projectileSpeed

func getWeapon():
	pass

func _on_body_entered(body):
	body.hit.emit(self)
	queue_free()
#set up bonus damage from player
