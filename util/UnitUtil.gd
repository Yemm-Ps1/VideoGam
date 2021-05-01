extends Node

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
