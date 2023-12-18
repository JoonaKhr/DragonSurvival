extends Control

@onready var healthbar = $HPBar/TextureProgressBar
@onready var xpbar = $XPBar/TextureProgressBar
@onready var levelCounter = $LevelCounter/Label
@onready var levelupSprite = $Levelup
var playerMaxHealth
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	playerMaxHealth = player.maxHealth
	print("plr hlth: ", playerMaxHealth)
	healthbar.value = 100
	levelCounter.text = str(player.level)

func _on_player_health_changed(plrHealth):
	update_health(plrHealth)

func _on_player_xp_changed(plrXP):
	update_xp(plrXP)

func _on_player_level_up(_plr, plrLevel):
	levelupSprite.show()
	levelupSprite.get_child(0).start()
	get_tree().paused = true
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
