extends Node

const UnitUtil = preload("res://util/UnitVectorUtil.gd")
const TreeUtil = preload("res://util/TreeUtil.gd")
var TreeGen = preload("res://util/TreeGen.gd").new()
var spanning_tree = null
var current_node = null

var tile_grid = null

func _init(grid: Array):
	tile_grid = grid

func set_origin(x, y):
	current_node = [x, y]
	spanning_tree = TreeGen.get_spanning_tree(tile_grid, x, y)
	
func set_direction():
	pass
	
func next_path():
	var next_path = []
	var children =  spanning_tree[current_node]
	if len(children) == 0:
		return []
	elif len(children) > 1:
		current_node = choice(children)
		next_path.append(current_node)
	var remaining_path = TreeUtil.get_forced_path(spanning_tree, current_node[0], current_node[1])
	next_path += remaining_path
	current_node = next_path.back()
	return next_path
	
func choice(node_list):
	return node_list[1]
	# TODO build functionality
