extends "Agent.gd"

class_name BotAgent

var rng : RandomNumberGenerator = RandomNumberGenerator.new()

func _init(grid).(grid):
	pass
	
func set_seed(rng_seed):
	rng.set_seed(rng_seed)
	
func choice(node_list : Array):
	var max_length = -1
	var best_index = -1
	for i in range(len(node_list)):
		var current_node = node_list[i]
		var current_length = TreeUtil.get_longest_branch_length(spanning_tree, current_node[0], current_node[1])	
		if current_length > max_length:
			max_length = current_length
			best_index = i
#	return node_list[rng.randi() % len(node_list)]
	return node_list[best_index]
