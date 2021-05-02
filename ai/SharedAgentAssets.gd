extends Node

var tile_grid : Array
var spanning_tree: Dictionary
var path_value_table: Array

func _init(tile_grid: Array):
	self.tile_grid = tile_grid
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
	
func get_path_value(x, y):
	return path_value_table[y][x]
	
func get_path_value_table():
	return path_value_table
