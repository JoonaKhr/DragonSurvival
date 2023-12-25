extends Node
@export var enemySpawnDistance = 100
var player 
var playerUI
enum gameStates {PAUSED, PLAYING, GAMEOVER}
var currentGameState

# Called when the node enters the scene tree for the first time.
func _ready():
	player = $Player
	playerUI = $Player/UILayer/IngameUI
	randomize()
	$TileMap.generate_chunk(player.position)
	player.visible = false
	playerUI.get_node("Stats").visible = false
	get_tree().paused = true

func start_game():
	player.visible = true
	playerUI.get_node("Stats").visible = true
	playerUI.get_node("MainMenu").visible = false
	get_tree().paused = false
	
func stop_game():
	player.visible = false
	for child in get_tree().get_nodes_in_group("Enemies"):
		child.queue_free()
	playerUI.get_node("Stats").visible = false
	playerUI.get_node("MainMenu").visible = true
	get_tree().paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if player.states.DEAD:
		currentGameState = gameStates.GAMEOVER


func _on_enemy_timer_timeout():
	var enemy = Globals.enemies.values().pick_random().instantiate()
	# Randomise direction of the enemy spawn
	enemy.position = player.position + Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized() * enemySpawnDistance
	add_child(enemy)



