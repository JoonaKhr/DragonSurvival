extends Control

@onready var healthbar = $Stats/HPBar/TextureProgressBar
@onready var xpbar = $Stats/XPBar/TextureProgressBar
@onready var levelCounter = $Stats/LevelCounter/Label
@onready var levelupSprite = $Levelup
var playerMaxHealth
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.pause.connect(_on_game_pause)
	player = get_tree().get_nodes_in_group("Player")[0]
	playerMaxHealth = player.maxHealth
	print("plr hlth: ", playerMaxHealth)
	healthbar.value = 100
	levelCounter.text = str(player.level)

func _on_player_health_changed(plrHealth):
	update_health(plrHealth)

func _on_player_xp_changed(plrXP):
	update_xp(plrXP)

func _on_game_pause():
	get_tree().paused = true
	$PauseScreen.visible = true

func _on_player_level_up(_plr, plrLevel):
	levelupSprite.show()
	levelupSprite.get_child(0).start()
	get_tree().paused = true
	for child in $LevelupUI.get_children():
		print(child.get_class())
		if !child.is_class("ColorRect"):
			child.randomise()
	$LevelupUI.visible = true
	update_level_counter(str(plrLevel))

func update_health(newValue: float):
	var newValuePct : float = newValue / playerMaxHealth * 100
	healthbar.value = newValuePct

func update_xp(newValue: float):
	var newValuePct: float = newValue / player.xpToLevel * 100
	xpbar.value = newValuePct

func update_level_counter(newValue):
	levelCounter.text = newValue


func _on_levelup_timer_timeout():
	levelupSprite.visible = false 


func _on_gui_input(event):
	pass # Replace with function body.
