extends "Agent.gd"

class_name BotAgent

var rng : RandomNumberGenerator = RandomNumberGenerator.new()
var prob_of_correct = -1


func _init(grid, prob_of_correct=1).(grid):
	self.prob_of_correct = prob_of_correct
	
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
	var random_num = rng.randf()
	var prob_of_incorrect_node = (1 - prob_of_correct) / (len(node_list) - 1)
	var total = 0
	for i in range(len(node_list) - 1):
		if i == best_index:
			total += prob_of_correct
		else:
			total += prob_of_incorrect_node
		if random_num < total:
			return node_list[i]
			
	return node_list.back()
#	return node_list[rng.randi() % len(node_list)]
