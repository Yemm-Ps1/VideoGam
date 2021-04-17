extends Area2D

var tree_gen = preload("res://util/TreeGen.gd").new()
var grid_util = preload("res://util/GridUtil.gd").new()

export var speed = 2

var tree = [Vector2.ZERO]
var next = Vector2.ZERO
var grid = []

var tile_size = 64



var update = true
var velocity = Vector2.ZERO
var direction
var i = 0


	#print(grid_util.validate(tiles))
	#print(grid_util.is_choice(tiles, 0, 0))
	#var span_tree = tree_gen.get_spanning_tree(tiles, 0, 0)
	#print(span_tree[[1,1]])

func _unhandled_input(event):
	if event.is_action_pressed("move_left"):
		move = 0
		print(move)
	if event.is_action_pressed("move_right"):
		move = 1
		print(move)
	if event.is_action_pressed("move_up"):
		move = 1
		print(move)
	if event.is_action_pressed("move_down"):
		move = 0
		print(move)

var span_tree

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2

#func _on_Maze_continue_signal():
func _process(delta):
	span_tree = tree_gen.get_spanning_tree(grid, 0, 0)
	var pos = _translated_pos()
	#print(span_tree[[pos.y, pos.x]])
	
	if _moved_to(pos, next):
		print("Currently at: ", pos)
		next = _translated_tree(span_tree[[int(pos.x), int(pos.y)]])
		direction = pos.direction_to(next)
		velocity = direction * speed
		_set_direction(direction)
	position += velocity

var move = 0

func _translated_tree(tree):
	print("Heading Towards: ", tree)
	if tree.size() == 1:
		return Vector2(tree[0][0], tree[0][1])
	else:
		print("Choice time")
		#return Vector2.ZERO
		randomize()
		print(move)
		return Vector2(tree[move][0], tree[move][1])



	#print(Vector2(span_tree[[0,0]][0][0]))
#func _process(delta):
#	var player_pos = _translated_pos(position)
#	if _moved_to(player_pos, tree[i]):
#		i+= 1
#		direction = player_pos.direction_to(tree[i])
#		velocity = direction*speed
#		_set_direction(direction)
#		return
#	elif i+1 == tree.size():
#		print("END")
#		return
#	position += velocity



func _translated_pos():
	var translated_pos = (position / tile_size) - Vector2(0.5, 0.5)
	return translated_pos


func _moved_to(current_pos, desired_pos):
	if current_pos == desired_pos:
		return true
	else: return false

func _set_direction(dir):
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





