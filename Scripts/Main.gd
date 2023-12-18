extends Node
@export var enemySpawnDistance = 100
var player 
enum gameStates {PAUSED, PLAYING, GAMEOVER}
var currentGameState

# Called when the node enters the scene tree for the first time.
func _ready():
	player = $Player
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if player.states.DEAD:
		currentGameState = gameStates.GAMEOVER


func _on_enemy_timer_timeout():
	var enemy = Globals.enemies.values().pick_random().instantiate()
	# Randomise direction of the enemy spawn
	enemy.position = player.position + Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized() * enemySpawnDistance
	add_child(enemy)



