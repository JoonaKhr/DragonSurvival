extends Node
@export_flags("Fire", "Water", "Lightning", "Earth") var elementTypes
const ELEMENT_FIRE = 1
const ELEMENT_WATER = 2
const ELEMENT_LIGHTNING = 4
const ELEMENT_EARTH = 8
var weaknesses = {}
var resistances = {}
var superResistances = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	weaknesses[ELEMENT_FIRE] = ELEMENT_WATER
	weaknesses[ELEMENT_WATER] = ELEMENT_LIGHTNING
	weaknesses[ELEMENT_LIGHTNING] = ELEMENT_EARTH
	weaknesses[ELEMENT_EARTH] = ELEMENT_FIRE
	resistances[ELEMENT_FIRE] = ELEMENT_LIGHTNING
	resistances[ELEMENT_WATER] = ELEMENT_EARTH
	resistances[ELEMENT_LIGHTNING] = ELEMENT_FIRE
	resistances[ELEMENT_EARTH] = ELEMENT_WATER
	superResistances[ELEMENT_FIRE] = ELEMENT_EARTH
	superResistances[ELEMENT_WATER] = ELEMENT_FIRE
	superResistances[ELEMENT_LIGHTNING] = ELEMENT_WATER
	superResistances[ELEMENT_EARTH] = ELEMENT_LIGHTNING

func setElementType(element):
	elementTypes = element

func getElementWeakness(element):
	return weaknesses[element]

func getElementResistance(element):
	return resistances[element]

func getElementSuperResistance(element):
	return superResistances[element]



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
