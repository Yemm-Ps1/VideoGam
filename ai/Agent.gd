extends Node

const UnitUtil = preload("res://util/UnitVectorUtil.gd")
const TreeUtil = preload("res://util/TreeUtil.gd")
var TreeGen = preload("res://util/TreeGen.gd").new()
var spanning_tree = null
var last_path = null


var tile_grid = null

func _init(grid: Array):
	tile_grid = grid

func set_origin(x, y):
	last_path = [[x, y]]
	spanning_tree = TreeGen.get_spanning_tree(tile_grid, x, y)
	
func consume_and_get_next_path():
	if last_path.empty():
		return null
	var next_path = []
	var current_node = last_path.back()
	var children =  spanning_tree[current_node]
	if len(children) == 0:
		return []
	elif len(children) > 1:
		current_node = choice(children)
		next_path.append(current_node)
	var remaining_path = TreeUtil.get_forced_path(spanning_tree, current_node[0], current_node[1])
	next_path += remaining_path
	last_path = next_path
	return next_path
	
func choice(node_list):
	return node_list[1]
	# TODO build functionality

