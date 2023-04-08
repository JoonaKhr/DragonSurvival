extends Area2D

@export var health : int;
@export var speed : int;
@export var damage : int;
var weaponList : Dictionary;
var velocity


func takeDamage(DamageSource):
	health -= DamageSource

func shoot(WeaponList : Dictionary):
	if WeaponList.is_empty():
		pass
	else:
		for weapon in WeaponList.keys():
			var weaponAmount = WeaponList[weapon]