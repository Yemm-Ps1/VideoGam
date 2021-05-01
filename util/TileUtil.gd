################################################################################
# A utility class which provides static functionality associated with Tiles which are
# numbered from 0-15 indicating the walls that surround it. Each bit indicates
# if there is a wall in order. In order of decreasing significance the order is
# West, South, East, North.
################################################################################
extends Node

const UnitUtil = preload("res://util/UnitUtil.gd")


# TODO replace with Unit util call?
const WEST_DIVISOR = 8
const SOUTH_DIVISOR = 4
const EAST_DIVISOR = 2
const NORTH_DIVISOR = 1


# ------------------------------------------------------------------------------
# DIRECTION FUNCTIONS
# Checks if an adjacent square is accessible i.e. no wall in that direction.
# ------------------------------------------------------------------------------	

static func has_left(tile_num):
	return tile_num >= WEST_DIVISOR
	
static func has_bottom(tile_num):
	return _check_against_greater_divisors(tile_num, SOUTH_DIVISOR)
		
static func has_right(tile_num):
	return _check_against_greater_divisors(tile_num, EAST_DIVISOR)
	
static func has_top(tile_num):
	return _check_against_greater_divisors(tile_num, NORTH_DIVISOR)

static func has_wall(tile_num, unit_direction):
	match(unit_direction):
		UnitUtil.UnitDirection.WEST:
			return has_left(tile_num)
		UnitUtil.UnitDirection.SOUTH:
			return has_bottom(tile_num)	
		UnitUtil.UnitDirection.EAST:
			return has_right(tile_num)
		UnitUtil.UnitDirection.NORTH:
			return has_top(tile_num)
	return null
	

# ------------------------------------------------------------------------------
# NODE IDENTIFIERS
# ------------------------------------------------------------------------------	
static func is_terminal(tile_num):
	var based = log(15-tile_num)/log(2)
	return (int(based) - based) == 0


static func is_choice(tile_num):
	var based = log(tile_num)/log(2)
	return tile_num == 0 or ((int(based) - based) == 0)
	
	
# ------------------------------------------------------------------------------
# VALIDATION FUNCTIONS
# ------------------------------------------------------------------------------	
static func is_valid_adj_horizontal(left_tile, right_tile):
	return has_right(left_tile) == has_left(right_tile)

static func is_valid_adj_vertical(top_tile, bottom_tile):
	return has_bottom(top_tile) == has_top(bottom_tile)
	
# ------------------------------------------------------------------------------
# PRIVATE FUNCTIONS
# ------------------------------------------------------------------------------
static func _check_against_greater_divisors(tile_num, divisor):
	var next_order_divisor = 2 * divisor
	return fposmod(tile_num - next_order_divisor, next_order_divisor) >= divisor
	
