extends TileMap

var moisture = FastNoiseLite.new()
var width = 16.0
var height = 16.0
@onready var player = get_parent().get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	moisture.noise_type = 5
	moisture.frequency = 0.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	generate_chunk(player.position)


func generate_chunk(_position):
	var tilePos = local_to_map(_position)
	for x in range(width):
		for y in range(height):
			var moist = moisture.get_noise_2d(tilePos.x-width /2 + x, tilePos.y - height/ 2 + y)
			set_cell(0, Vector2i(tilePos.x-width/2 + x, tilePos.y-height/2 + y), 0, Vector2i((moist+1)*2, moist+1))
