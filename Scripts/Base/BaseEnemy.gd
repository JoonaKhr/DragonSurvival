extends "BaseCharacter.gd"

func _on_dead():
	get_parent().get_node("Player").gain_exp(self)
	remove_from_group("enemies")
	queue_free()
