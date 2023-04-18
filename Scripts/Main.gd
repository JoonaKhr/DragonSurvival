extends Node

@export var enemyScene : PackedScene
@export var knightEnemyScene : PackedScene
@export var enemySpawnDistance = 400
var enemies : Array[PackedScene]


# Called when the node enters the scene tree for the first time.
func _ready():
	enemies.append(enemyScene)
	enemies.append(knightEnemyScene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_enemy_timer_timeout():
	var enemy = enemies.pick_random().instantiate()
	# Randomise direction of the enemy spawn
	enemy.position = get_node("Player").position + Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized() * enemySpawnDistance
	add_child(enemy)
