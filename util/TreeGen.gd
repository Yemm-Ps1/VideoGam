extends Node


const WEST_DIVISOR = 8
const SOUTH_DIVISOR = 4
const EAST_DIVISOR = 2
const NORTH_DIVISOR = 1

	
func get_spanning_tree(input_matrix, start_x, start_y):
	var current = null
	var exclusion_cases = {[start_x, start_y]:true}
	var to_rtn = {}
	var visiting_queue = [[start_x, start_y]]
	while !visiting_queue.empty():
		current = visiting_queue.pop_front()
		var children = _get_successors_with_exclusions(input_matrix, current[0], current[1], exclusion_cases)
		to_rtn[current] = children
		for c in children:
			exclusion_cases[c] = true
			visiting_queue.append(c)
	return to_rtn
		
		
func _get_successors(input_matrix, x, y):
	return _get_successors_with_exclusions(input_matrix, x, y, [])

func _get_successors_with_exclusions(input_matrix, x, y, exclusion_cases):
	var remaining = 15 - input_matrix[y][x]
	var to_rtn = []
	var next = []
	if remaining >= WEST_DIVISOR:
		remaining -= WEST_DIVISOR
		_check_and_add([x-1, y], to_rtn, exclusion_cases)
	if remaining >= SOUTH_DIVISOR:
		remaining -= SOUTH_DIVISOR
		_check_and_add([x, y+1], to_rtn, exclusion_cases)
	if remaining >= EAST_DIVISOR:
		remaining -= EAST_DIVISOR
		_check_and_add([x+1, y], to_rtn, exclusion_cases)
	if remaining >= NORTH_DIVISOR:
		remaining -= NORTH_DIVISOR
		_check_and_add([x, y-1], to_rtn, exclusion_cases)
	return to_rtn
	
func _check_and_add(to_add, add_to, exclusion_cases):
	if not exclusion_cases.has(to_add):
		add_to.append(to_add)
