extends Node

const TileUtil = preload("res://util/TileUtil.gd")

enum UnitDirection {
	NORTH, SOUTH, EAST, WEST
}

static func get_abs_direction(x, y):
	if x == 0:
		if y == 1:
			return UnitDirection.SOUTH
		elif y == -1:
			return  UnitDirection.NORTH
	elif y == 0:
		if x == 1:
			return UnitDirection.EAST
		elif x == -1:
			return  UnitDirection.WEST
	return null
		
static func get_unit_array(unit_direction):
	match(unit_direction):
		UnitDirection.NORTH:
			return [0, -1]
		UnitDirection.SOUTH:
			return [0, 1]
		UnitDirection.EAST:
			return [1, 0]
		UnitDirection.WEST:
			return [-1, 0]
	return null		

static func get_unit_vector(unit_direction):
	match(unit_direction):
		UnitDirection.NORTH:
			return Vector2.UP
		UnitDirection.SOUTH:
			return Vector2.DOWN
		UnitDirection.EAST:
			return Vector2.RIGHT
		UnitDirection.WEST:
			return Vector2.LEFT
	return null
	
static func get_unit_direction_weight(unit_direction):
	match(unit_direction):
		UnitDirection.NORTH:
			return 1
		UnitDirection.SOUTH:
			return 4
		UnitDirection.EAST:
			return 2
		UnitDirection.WEST:
			return 8
	return null		
	
static func opposite(unit_direction):
	match(unit_direction):
		UnitDirection.NORTH:
			return UnitDirection.SOUTH
		UnitDirection.SOUTH:
			return UnitDirection.NORTH
		UnitDirection.EAST:
			return UnitDirection.WEST
		UnitDirection.WEST:
			return UnitDirection.EAST
	return null
	
static func convert_to_string(unit_direction):
	match(unit_direction):
		UnitDirection.NORTH:
			return "North"
		UnitDirection.SOUTH:
			return "South"
		UnitDirection.EAST:
			return "East"
		UnitDirection.WEST:
			return "West"
	return null
	
static func get_absolute_from_relative(unit_dir_one, unit_dir_two):
	var as_num_one = _get_relative_north_value(unit_dir_one)
	var as_num_two = _get_relative_north_value(unit_dir_two)
	var result_rel_north = (as_num_one + as_num_two) % 4
	return _get_from_relative_north_values(result_rel_north)

static func _get_relative_north_value(unit_direction):
	match(unit_direction):
		UnitDirection.NORTH:
			return 0
		UnitDirection.EAST:
			return 1
		UnitDirection.SOUTH:
			return 2
		UnitDirection.WEST:
			return 3
	return null	
	
static func _get_from_relative_north_values(rel_north_num : int):
	match(rel_north_num):
		0:
			return UnitDirection.NORTH
		1:
			return UnitDirection.EAST
		2:
			return UnitDirection.SOUTH
		3:
			return UnitDirection.WEST
	return null	
