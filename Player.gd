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


var speed = 8
var update = true
var velocity
var direction

var dir_enum =  {
	"N" : Vector2.UP,
	"S" : Vector2.DOWN,
	"E" : Vector2.RIGHT,
	"W" : Vector2.LEFT 
	
}


#func _on_Maze_continue_signal():
func _process(delta):
	var grid_pos = (position / tile_size) - Vector2(0.5, 0.5)
	var current_tree = tree[i]#
	var direction = grid_pos.direction_to(current_tree)
	var velocity = direction*speed
	
	if i+1 <= tree.size():
		if grid_pos == current_tree:
			i += 1
		position += velocity


#func _process(delta):
##func _on_Maze_continue_signal():
#	if i+1 < tree.size():
#		var grid_pos = (position / tile_size) - Vector2(0.5, 0.5)
#		var current_tree = tree[i]
#
##		if grid_pos == current_tree:
##			i += 1
#
#		if update == true:
#			direction = grid_pos.direction_to(current_tree)
#			update = false
#
#			velocity = direction * speed * delta
#		print(velocity)
#		position += velocity
#
#
#		for dir in dir_enum.keys():
#			if direction == dir_enum[dir]:
#				match dir:
#					"N":
#						if grid_pos.y <= current_tree.y:
#							position = (current_tree + Vector2(0.5, 0.5)) * tile_size
#							update = true
#							i += 1
#					"S":
#						if grid_pos.y > current_tree.y:
#							position = (current_tree + Vector2(0.5, 0.5)) * tile_size
#							update = true
#							i += 1
#					"E":
#						if grid_pos.x >= current_tree.x:
#							position = (current_tree + Vector2(0.5, 0.5)) * tile_size
#							update = true
#							i += 1
#					"W":
#						if grid_pos.x <= current_tree.x:
#							position = (current_tree + Vector2(0.5, 0.5)) * tile_size
#							update = true
#							i += 1
#					_:
#						return
#
#
#


