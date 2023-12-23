extends Node


signal pause
var weapons: Dictionary
var enemies: Dictionary
var enemyWeapons: Dictionary
# Called when the node enters the scene tree for the first time.
func _ready():
	dir_contents("Scenes/EnemyWeaponScenes", enemyWeapons)
	dir_contents("Scenes/WeaponScenes", weapons)
	dir_contents("Scenes/EnemyScenes", enemies)

#Gives the given user the given weapon and puts the object into the given users list of weapons
func get_weapon(user, weapon):
	var instance = weapon.instantiate()
	if user.weaponDict.keys().has(weapon):
		user.weaponDict[weapon].multishot += 1
	else:
		user.weaponDict[weapon] = instance
		user.add_child(instance)

#Goes through the given folder and puts every found scene into given array
func dir_contents(path, dict):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				var scene = load(path + "/" + file_name)
				dict[file_name] = scene
				print("Found file: " + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path")
