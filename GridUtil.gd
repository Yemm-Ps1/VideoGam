extends Node

func get_terminals():
	pass
	
func is_terminal(grid:Array, x, y):
	var v:int = grid[y][x]
	return _is_terminal_val(v)
	
func _is_terminal_val(v):
	var based = log(15-v)/log(2)
	return (int(based) - based) == 0

