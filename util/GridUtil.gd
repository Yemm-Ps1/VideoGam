################################################################################
# A utility class which provides static functionality associated with Tile Grids i.e.
# 2-dimensional arrays containing numbers of 0-15 describing the "walls" that 
# contain it.
################################################################################

extends Node

const TileUtil = preload("res://util/TileUtil.gd")

# ------------------------------------------------------------------------------
# Gets all nodes which have exactly one entrance/exit i.e. has 3 walls.
# :returns An array of coordinates of terminal nodes.
# ------------------------------------------------------------------------------	
static func get_terminals(grid):
	var to_rtn = []
	for y in range(len(grid)):
		for x in range(len(grid[0])):
			if is_terminal(grid, x, y):
				to_rtn.append([x, y])
	return to_rtn

# TODO node identifiers may be reduntant since TileUtil does same thing

# ------------------------------------------------------------------------------
# NODE IDENTIFIERS 
# ------------------------------------------------------------------------------	
static func is_terminal(grid:Array, x:int, y:int):
	return TileUtil.is_terminal(grid[y][x])

static func is_choice(grid:Array, x:int, y:int):
	return TileUtil.is_choice(grid[y][x])

# ------------------------------------------------------------------------------
# MISC
# ------------------------------------------------------------------------------	

static func validate(grid):
	return _validate_borders(grid) and _validate_adj_pairs(grid)
	
static func _validate_borders(grid):
	var width = len(grid[0])
	var height = len(grid)
	for row in range(height):
		if not TileUtil.has_left(grid[row][0]) or not TileUtil.has_right(grid[row][width-1]):
			printerr("WARNING: Invalid border tile found on row %d" % row)
			return false
	for column in range(width):
		if not TileUtil.has_top(grid[0][column]) or not TileUtil.has_bottom(grid[height-1][column]):
			printerr("WARNING: Invalid border found on column %d" % column)
			return false
	return true
	
static func _validate_adj_pairs(grid):
	var width = len(grid[0])
	var height = len(grid)
	for row in range(height-1):
		for column in range(width-1):
			var is_valid_horizontal = TileUtil.is_valid_adj_horizontal(grid[row][column], grid[row][column+1])
			var is_valid_vertical = TileUtil.is_valid_adj_vertical(grid[row][column], grid[row+1][column])
			
			if not is_valid_horizontal or not is_valid_vertical:
				printerr("WARNING: Invalid adjacent tiles at index %d, %d" % [row, column])
				return false
	return true

