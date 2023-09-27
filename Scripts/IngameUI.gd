extends Control

@onready var healthbar = $HPBar/TextureProgressBar
@onready var xpbar = $XPBar/TextureProgressBar
var playerMaxHealth

# Called when the node enters the scene tree for the first time.
func _ready():
	playerMaxHealth = get_parent().maxHealth
	print("plr hlth: ", playerMaxHealth)
	healthbar.value = 100

func _on_player_health_changed(plrHealth):
	updateHealth(plrHealth)

func updateHealth(newValue: float):
	var newValuePct : float = newValue / playerMaxHealth * 100
	healthbar.value = newValuePct

func updateXP(newValue: float):
	var newValuePct: float = newValue / get_parent().xpToLevel * 100
	xpbar.value = newValuePct

func _on_player_xp_changed(plrXP):
	updateXP(plrXP)

