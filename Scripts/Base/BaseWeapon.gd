extends Node

@export var projectile : PackedScene
@export var shootSound : AudioStream
@export var attackTime : float;
var position
var soundEmitter

func _ready():
	$AttackTimer.wait_time = attackTime

#Instantiate a projectile scene to be spawned with a randomised pitch of the weapon's sound effect
func spawnProjectiles():
	position = get_parent().position
	var instanceProj = projectile.instantiate()
	instanceProj.position = position
	get_parent().get_parent().add_child(instanceProj)
	soundEmitter.pitch_scale = randf_range(0.7, 1.3)
	soundEmitter.play()


func _on_attack_timer_timeout():
	spawnProjectiles()
