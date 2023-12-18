extends Area2D

@export var damage : float;
@export var projectileSpeed : float;
var velocity

func get_damage():
	return damage

func get_projectile_speed():
	return projectileSpeed

func get_weapon():
	pass

func _on_body_entered(body):
	body.hit.emit(self)
	queue_free()
#set up bonus damage from player
