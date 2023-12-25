extends Control

signal pause

func _on_game_pause():
	print("pausing")
	self.visible = true
	get_tree().paused = true

func _on_continue_button_pressed():
	self.visible = false
	get_tree().paused = false


func _on_main_menu_button_pressed():
	self.visible = false
	get_tree().get_root().get_children()[1].stop_game()
