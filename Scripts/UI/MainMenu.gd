extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_exit_game_button_pressed():
	get_tree().quit()

func _on_start_game_button_pressed():
	print(get_tree().get_root().get_children()[1])
	get_tree().get_root().get_children()[1].start_game()
