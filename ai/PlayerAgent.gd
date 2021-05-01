extends "Agent.gd"

class_name PlayerAgent
var next_direction = null


func _init(grid).(grid):
	pass	
	
func choice(node_list : Array):
	var start_coordinates = last_path.back()
	printerr("PLAYER DIRECTION: " + UnitUtil.convert_to_string(next_direction))
	for n in node_list:
		printerr("CHECKING: " + str(n))
		var unit_direction = UnitUtil.get_abs_direction(n[0] - start_coordinates[0], n[1] - start_coordinates[1])
		printerr("RELATIVE DIRECTION: " + UnitUtil.convert_to_string(unit_direction))
		if unit_direction == next_direction:
			return n
	return _get_undirected_choice(node_list)
	
func _get_undirected_choice(node_list: Array):
	return node_list[randi() % len(node_list)]
	
func update_next_direction(next_direction):
	self.next_direction = next_direction
