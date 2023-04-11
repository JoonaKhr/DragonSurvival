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

func getVelocity():
    return velocity

func getElementType():
    return elementType

func _on_area_entered(area):
    if area in get_tree().get_nodes_in_group("Enemies"):
        area.takeDamage(damage)
        queue_free()