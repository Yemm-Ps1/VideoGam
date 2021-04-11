extends Area2D

var tree = []
var tile_size = 64

var i = 0
var inputs = {"ui_right": Vector2.RIGHT,
			"ui_left": Vector2.LEFT,
			"ui_up": Vector2.UP,
			"ui_down": Vector2.DOWN}

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2



func move(dir):
	position += inputs[dir] * tile_size


#func _on_Maze_continue_signal():
func _process(delta):
	i += 1
	if i >= tree.size(): return
	print(tree[i])
	position = tree[i] * tile_size
	position += Vector2.ONE * tile_size/2
	yield(get_tree(), 'idle_frame')
