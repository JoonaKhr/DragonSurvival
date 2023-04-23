extends Area2D

@export var damage : float;
@export var projectileSpeed : float;
@export var attackTimer : float;
@export var multishot : int;
var velocity
@export_flags("Fire", "Water", "Lightning", "Earth") var elementType = 0

func getDamage():
    return damage

func getProjectileSpeed():
    return projectileSpeed

func getAttackSpeed():
    return attackTimer

func getElementType():
    return elementType

func _on_body_entered(body):
    if body in get_tree().get_nodes_in_group("Enemies"):
        body.takeDamage(self)
        queue_free()
    
#set up bonus damage from player