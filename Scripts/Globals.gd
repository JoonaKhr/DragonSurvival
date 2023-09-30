extends Node

var weapons: Dictionary
var enemies: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	dir_contents("res://Scenes/WeaponScenes", weapons)
	dir_contents("res://Scenes/EnemyScenes", enemies)

#Gives the given user the given weapon and puts the object into the given users list of weapons
func getWeapon(user, weapon):
	var instance = weapon.instantiate()
	# Change collision masks to match the correct targets
	user.list.append(instance)
	user.add_child(instance)

#Goes through the given folder and puts every found scene into given array
func dir_contents(path, list):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				var scene = load(path + "/" + file_name)
				list[file_name] = scene
				print("Found file: " + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path")
