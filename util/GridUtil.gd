################################################################################
# A utility class which provides functionality associated with Tile Grids i.e.
# 2-dimensional arrays containing numbers of 0-15 describing the "walls" that 
# contain it.
################################################################################

extends Node

var tile_util = preload("res://util/TileUtil.gd").new()


const WEST_DIVISOR = 8
const SOUTH_DIVISOR = 4
const EAST_DIVISOR = 2
const NORTH_DIVISOR = 1


# ------------------------------------------------------------------------------
# Gets all nodes which have exactly one entrance/exit i.e. has 3 walls.
# :returns An array of coordinates of terminal nodes.
# ------------------------------------------------------------------------------	
func get_terminals(grid):
	var to_rtn = []
	for y in range(len(grid)):
		for x in range(len(grid[0])):
			if is_terminal(grid, x, y):
				to_rtn.append([x, y])
	return to_rtn

# ------------------------------------------------------------------------------
# NODE IDENTIFIERS 
# ------------------------------------------------------------------------------	
func is_terminal(grid:Array, x:int, y:int):
	return tile_util.is_terminal(grid[y][x])

func is_choice(grid:Array, x:int, y:int):
	return tile_util.is_choice(grid[y][x])

# ------------------------------------------------------------------------------
# MISC
# ------------------------------------------------------------------------------	

func validate(grid):
	return _validate_borders(grid) and _validate_adj_pairs(grid)
	
func _validate_borders(grid):
	var width = len(grid[0])
	var height = len(grid)
	for row in range(height):
		if not tile_util.has_left(grid[row][0]) or not tile_util.has_right(grid[row][width-1]):
			printerr("WARNING: Invalid border tile found on row %d" % row)
			return false
	for column in range(width):
		if not tile_util.has_top(grid[0][column]) or not tile_util.has_bottom(grid[height-1][column]):
			printerr("WARNING: Invalid border found on column %d" % column)
			return false
	return true
	
func _validate_adj_pairs(grid):
	var width = len(grid[0])
	var height = len(grid)
	for row in range(height-1):
		for column in range(width-1):
			var is_valid_horizontal = tile_util.is_valid_adj_horizontal(grid[row][column], grid[row][column+1])
			var is_valid_vertical = tile_util.is_valid_adj_vertical(grid[row][column], grid[row+1][column])
			
			if not is_valid_horizontal or not is_valid_vertical:
				printerr("WARNING: Invalid adjacent tiles at index %d, %d" % [row, column])
				return false
	return true

