extends Node


static func get_longest_branch(tree: Dictionary, origin_x, origin_y):
	var stack = [[origin_x, origin_y]]
	var current_depth = 0
	var longest_depth = 0
	while not stack.empty():
		var next_node = stack.pop_back()
		var children = tree[next_node]
		stack += children
		
static func get_forced_path(tree: Dictionary, origin_x, origin_y):
	var current_node = [origin_x, origin_y]
	var forced_path = []
	var children = tree[current_node]
	while len(children) == 1:
		current_node = children[0]
		forced_path.append(current_node)
		children = tree[current_node]
	return forced_path
