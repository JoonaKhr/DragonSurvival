extends "res://Scripts/BaseCharacter.gd"

func _on_dead():
	giveExp(get_parent().get_node("Player"))
	queue_free()
