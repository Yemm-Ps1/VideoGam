extends Node

func get_successor_map(input_matrix):
	pass
	
func get_successors(input_matrix, x, y):
	var val = input_matrix[y][x]
	var to_rtn = []
	# WEST
	if val % 8 == 0 and x >= 0:
		to_rtn.append([x-1, y])
	# SOUTH
	if val % 4 == 0 and y < input_matrix.length:
		to_rtn.append([x, y+1])
	# EAST
	if val % 2 == 0 and y < input_matrix[x].length:
		to_rtn.append([x+1, y])
	# NORTH
	if val % 1 == 0 and x >= 0:
		to_rtn.append([x, y-1])
	return to_rtn
