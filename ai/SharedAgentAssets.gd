extends Node

const GridUtil = preload("res://util/GridUtil.gd")
const TreeGen = preload("res://util/TreeGen.gd")

var tile_grid : Array
var spanning_tree: Dictionary
var path_value_table: Array
var origin_x 
var origin_y

func _init(tile_grid: Array, origin_x, origin_y):
	self.tile_grid = tile_grid
	self.origin_x = origin_x
	self.origin_y = origin_y
	spanning_tree = TreeGen.get_spanning_tree(tile_grid, origin_x, origin_y)
	_generate_path_value_table()

func _generate_path_value_table():
	var width = len(tile_grid[0])
	var height = len(tile_grid)
	path_value_table = []
	for y in range(height):
		var row = []
		for x in range(width):
			row.append(-1)
		path_value_table.append(row)
	var fill_sources = [[origin_x, origin_y]]
	fill_sources += GridUtil.get_choices(tile_grid)
	
	
func get_path_value(x, y):
	return path_value_table[y][x]
	
func get_path_value_table():
	return path_value_table
