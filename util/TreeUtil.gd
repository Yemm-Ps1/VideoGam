extends Node


static func get_longest_branch(tree: Array, origin_x, origin_y):
	var stack = [[origin_x, origin_y]]
	var current_depth = 0
	var longest_depth = 0
	while not stack.empty():
		var next_node = stack.pop_back()
		var children = tree[next_node]
		stack += children
		
