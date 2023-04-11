extends Node

@export var bulletScene : PackedScene
@export var swordScene : PackedScene
@export var enemyScene : PackedScene
@export var enemySpawnDistance = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_enemy_timer_timeout():
	var enemy = enemyScene.instantiate()
	# Randomise direction of the enemy spawn
	enemy.position = get_node("Player").position + Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized() * enemySpawnDistance
	add_child(enemy)
