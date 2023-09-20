extends Area2D

@export var damage : float;
@export var projectileSpeed : float;
@export var attackTimer : float;
@export var multishot : int;
var projectileOwner
var velocity
var startAudio
var elementType

func _ready():
	startAudio = $AudioStreamPlayer2D
	elementType = $Elements.elementTypes

func setProjectileOwner():
	projectileOwner = get_parent()

func getDamage():
	return damage

func getProjectileSpeed():
	return projectileSpeed

func getAttackSpeed():
	return attackTimer

func getElementType():
	return elementType

func _on_body_entered(body):
	body.hit.emit(self)
	queue_free()
#set up bonus damage from player
