extends Node
@export var enemySpawnDistance = 100
var player 
enum gameStates {PAUSED, PLAYING, GAMEOVER}
var currentGameState

# Called when the node enters the scene tree for the first time.
func _ready():
	player = $Player
	randomize()


func get_closest_enemies():
	var enemies = get_tree().get_nodes_in_group("Enemies")
	if !enemies.is_empty():
		enemies.sort_custom(func(x, y): return player.global_position.distance_to(x.global_position) < player.global_position.distance_to(y.global_position))
	return enemies
	
func draw_lines(enemies, i):
	var line = Line2D.new()
	line.add_point(player.position)
	line.add_point(enemies[i].global_position)
	add_child(line)
	enemies[i].queue_free()

func _on_line_timer_timeout():
	for i in range(3):
		draw_lines(get_closest_enemies(), i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if player.states.DEAD:
		currentGameState = gameStates.GAMEOVER


func _on_enemy_timer_timeout():
	var enemy = Globals.enemies.values().pick_random().instantiate()
	# Randomise direction of the enemy spawn
	enemy.position = player.position + Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized() * enemySpawnDistance
	add_child(enemy)



