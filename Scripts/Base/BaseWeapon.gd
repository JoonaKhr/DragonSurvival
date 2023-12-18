extends Node

@export var projectile: PackedScene
@export var multishot: int
@export var image: Image
@export var description: String
var position
var soundEmitter
var enemies
var player

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	get_enemies()

func get_enemies():
	enemies = get_tree().get_nodes_in_group("Enemies")
	if !enemies.is_empty():
		return enemies


#Instantiate a projectile scene to be spawned with a randomised pitch of the weapon's sound effect
func spawn_projectiles(_enemies, _i):
	position = get_parent().position
	var instanceProj = projectile.instantiate()
	instanceProj.position = position
	get_parent().get_parent().add_child(instanceProj)
	soundEmitter.pitch_scale = randf_range(0.7, 1.3)
	soundEmitter.play()

func _on_attack_timer_timeout():
	for i in range(multishot):
		spawn_projectiles(enemies, i)
