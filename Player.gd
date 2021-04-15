extends Area2D

var tree = [Vector2.ZERO]
var tile_size = 64

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2

var update = true
var velocity
var direction
var i = 0
export var speed = 4

func _process(delta):
	var player_pos = _translatedPos(position)
	if _movedTo(player_pos, tree[i]):
		i+= 1
		direction = player_pos.direction_to(tree[i])
		velocity = direction*speed
		_setDirection(direction)
		return
	elif i+1 == tree.size():
		print("END")
		return
	position += velocity


func _translatedPos(pos):
	var translatedPos = (pos / tile_size) - Vector2(0.5, 0.5)
	return translatedPos


func _movedTo(current_pos, desired_pos):
	if current_pos == desired_pos:
		return true
	else: return false

func _setDirection(dir):
	match dir:
		Vector2.UP:
			rotation_degrees = 180
		Vector2.DOWN:
			rotation_degrees = 0
		Vector2.LEFT:
			rotation_degrees = 90
		Vector2.RIGHT:
			rotation_degrees = 270
			

#func _on_Maze_continue_signal():
#func _process(delta):
#	var grid_pos = _translatedPos(position)
#	var current_tree = tree[i]
#	var direction
#	var velocity
#	if i+1 <= tree.size():
#		if grid_pos == current_tree:
#			direction = grid_pos.direction_to(current_tree)
#			velocity = direction*speed
#			print(direction)
#			print()
#		position += velocity
#


#var dir_enum =  {
#	"N" : Vector2.UP,
#	"S" : Vector2.DOWN,
#	"E" : Vector2.RIGHT,
#	"W" : Vector2.LEFT 
#
#}

#func _process(delta):
##func _on_Maze_continue_signal():
#	if i < tree.size():
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





