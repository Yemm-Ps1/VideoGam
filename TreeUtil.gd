extends Node

const WEST_DIVISOR = 8
const SOUTH_DIVISOR = 4
const EAST_DIVISOR = 2
const NORTH_DIVISOR = 1


func get_successor_map(input_matrix):
	pass
	
func get_successors(input_matrix, x, y):
	var val = input_matrix[y][x]
	var to_rtn = []
	if val % WEST_DIVISOR == 0 and x >= 0:
			to_rtn.append([x-1, y])
	if val % SOUTH_DIVISOR == 0 and y < input_matrix.length:
		to_rtn.append([x, y+1])
	if val % EAST_DIVISOR == 0 and y < input_matrix[x].length:
		to_rtn.append([x+1, y])
	if val % NORTH_DIVISOR == 0 and x >= 0:
		to_rtn.append([x, y-1])
	return to_rtn
