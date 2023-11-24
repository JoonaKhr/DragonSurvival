extends "BaseCharacter.gd"

func _on_dead():
	get_parent().get_node("Player").gainExp(self)
	remove_from_group("enemies")
	queue_free()
