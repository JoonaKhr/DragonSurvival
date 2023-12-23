extends Control

signal pause

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_game_pause():
	print("pausing")
	self.visible = true
	get_tree().paused = true
	

func _on_continue_button_pressed():
	self.visible = false
	get_tree().paused = false
