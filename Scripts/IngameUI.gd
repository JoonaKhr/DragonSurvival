extends Control

@onready var healthbar = $HPBar/TextureProgressBar
@onready var xpbar = $XPBar/TextureProgressBar
@onready var levelCounter = $LevelCounter/Label
@onready var levelupSprite = $Levelup
var playerMaxHealth

# Called when the node enters the scene tree for the first time.
func _ready():
	playerMaxHealth = get_parent().maxHealth
	print("plr hlth: ", playerMaxHealth)
	healthbar.value = 100
	levelCounter.text = str(get_parent().level)

func _on_player_health_changed(plrHealth):
	updateHealth(plrHealth)

func _on_player_xp_changed(plrXP):
	updateXP(plrXP)

func _on_player_level_up(plr, plrLevel):
	levelupSprite.show()
	levelupSprite.get_child(0).start()
	Globals.getWeapon(plr, Globals.weapons.values().pick_random(), plr.list)
	updateLevelCounter(str(plrLevel))

func updateHealth(newValue: float):
	var newValuePct : float = newValue / playerMaxHealth * 100
	healthbar.value = newValuePct

func updateXP(newValue: float):
	var newValuePct: float = newValue / get_parent().xpToLevel * 100
	xpbar.value = newValuePct

func updateLevelCounter(newValue):
	levelCounter.text = newValue


func _on_levelup_timer_timeout():
	levelupSprite.visible = false 
