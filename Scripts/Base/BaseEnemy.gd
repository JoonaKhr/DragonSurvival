extends "res://Scripts/Base/BaseCharacter.gd"

func _on_dead():
	get_parent().get_node("Player").gainExp(self)
	queue_free()
