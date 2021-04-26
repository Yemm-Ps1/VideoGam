extends "Agent.gd"

class_name PlayerAgent

func _init(grid).(grid):
	pass
	
func choice(node_list : Array):
	return node_list[randi() % len(node_list)]
	
func update_direction(update_direction):
	pass
