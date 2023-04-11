extends Area2D

@export var health : int;
@export var speed : int;
@export var damage : int;
var weaponList : Dictionary;
var velocity


func takeDamage(DamageSource):
	health -= DamageSource
	if health <= 0:
		if self in get_tree().get_nodes_in_group("Enemies"):
			queue_free()
		else:
			hide()
