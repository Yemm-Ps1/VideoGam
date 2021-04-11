extends Area2D

var tree = []
var tile_size = 64

var i = 0
var dir_enum = {
	"N": Vector2.UP,
	"S": Vector2.DOWN,
	"E": Vector2.RIGHT,
	"W": Vector2.LEFT
}



func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2



func move(dir):
	position += dir_enum[dir] * tile_size


var speed = 64
var update = true
var direction
func _process(delta):
#func _on_Maze_continue_signal():
	if i+1 < tree.size():
		var grid_pos = (position / tile_size) - Vector2(0.5, 0.5)
		var current_tree = tree[i]
		
		if grid_pos == current_tree:
			i += 1
			
		if update == true:
			print("HELLO?")
			direction = grid_pos.direction_to(current_tree)
			update = false

		if grid_pos == current_tree:
			i += 1
		
		var switch
		var velocity = direction * speed * delta
		position += velocity
		print("GRID: ",grid_pos.y)
		print("TREE:" ,current_tree.y)
		
		for dir in dir_enum.keys():
			if direction == dir_enum[dir]:

				match dir:
					"N":
						if position.y <= current_tree.y:
							position.y = current_tree.y
							update = true
					"S":
						if grid_pos.y >= current_tree.y:
							grid_pos.y = current_tree.y
							update = true
					"E":
						if grid_pos.x >= current_tree.x:
							grid_pos.x = current_tree.x
							update = true
					"W":
						if grid_pos.x <= current_tree.x:
							grid_pos.x = current_tree.x
							update = true
					_:
						print("what")
				
		
		


