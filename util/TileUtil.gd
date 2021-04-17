################################################################################
# A utility class which provides functionality associated with Tiles which are
# numbered from 0-15 indicating the walls that surround it. Each bit indicates
# if there is a wall in order. In order of decreasing significance the order is
# West, South, East, North.
################################################################################
extends Node

const WEST_DIVISOR = 8
const SOUTH_DIVISOR = 4
const EAST_DIVISOR = 2
const NORTH_DIVISOR = 1


# ------------------------------------------------------------------------------
# DIRECTION FUNCTIONS
# Checks if an adjacent square is accessible i.e. no wall in that direction.
# ------------------------------------------------------------------------------	

func has_left(tile_num):
	return tile_num >= WEST_DIVISOR
	
func has_bottom(tile_num):
	return _check_against_greater_divisors(tile_num, SOUTH_DIVISOR)
		
func has_right(tile_num):
	return _check_against_greater_divisors(tile_num, EAST_DIVISOR)
	
func has_top(tile_num):
	return _check_against_greater_divisors(tile_num, NORTH_DIVISOR)


# ------------------------------------------------------------------------------
# NODE IDENTIFIERS
# ------------------------------------------------------------------------------	
func is_terminal(tile_num):
	var based = log(15-tile_num)/log(2)
	return (int(based) - based) == 0


func is_choice(tile_num):
	var based = log(tile_num)/log(2)
	return tile_num == 0 or ((int(based) - based) == 0)
	
	
# ------------------------------------------------------------------------------
# VALIDATION FUNCTIONS
# ------------------------------------------------------------------------------	
func is_valid_adj_horizontal(left_tile, right_tile):
	return has_right(left_tile) == has_left(right_tile)

func is_valid_adj_vertical(top_tile, bottom_tile):
	return has_bottom(top_tile) == has_top(bottom_tile)
	
# ------------------------------------------------------------------------------
# PRIVATE FUNCTIONS
# ------------------------------------------------------------------------------
func _check_against_greater_divisors(tile_num, divisor):
	var next_order_divisor = 2 * divisor
	return fposmod(tile_num - next_order_divisor, next_order_divisor) >= divisor
	
