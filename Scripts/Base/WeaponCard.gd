extends Control
var random_weapon

# Called when the node enters the scene tree for the first time.
func _ready():
	random_weapon = Globals.weapons.values()[randi_range(0, Globals.weapons.keys().size()-1)]
	var weapon_instance = random_weapon.instantiate()
	$Name.text = weapon_instance.name
	$Description.text = weapon_instance.description

func randomise():
	random_weapon = Globals.weapons.values()[randi_range(0, Globals.weapons.keys().size()-1)]
	var weapon_instance = random_weapon.instantiate()
	$Name.text = weapon_instance.name
	$Description.text = weapon_instance.description

func _on_gui_input(event:InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			Globals.get_weapon(get_tree().get_nodes_in_group("Player")[0], random_weapon)
			get_tree().paused = false
			get_parent().visible = false
