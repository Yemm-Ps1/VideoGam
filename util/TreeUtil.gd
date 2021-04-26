extends Node
		
static func get_forced_path(tree: Dictionary, origin_x, origin_y):
	var current_node = [origin_x, origin_y]
	var forced_path = []
	var children = tree[current_node]
	while len(children) == 1:
		current_node = children[0]
		forced_path.append(current_node)
		children = tree[current_node]
	return forced_path

static func get_longest_branch_length(tree: Dictionary, origin_x, origin_y):
	var stack = [[0, [origin_x, origin_y]]]
	var longest_depth = 0
	var longest_terminal = null
	while not stack.empty():
		var current_vals = stack.pop_back()
		var current_depth = current_vals[0]
		var x_y = current_vals[1]
		var children = tree[x_y]
		if len(children) == 0:
			if current_depth > longest_depth:
				longest_depth = current_depth
				longest_terminal = x_y
		else:
			for c in children:
				stack.append([current_depth+1, [c[0], c[1]]])
	return longest_depth
		
static func get_inverted_tree(tree: Dictionary):
	var inverted_tree = {}
	for k in tree:
		inverted_tree[k] = []
	for k in tree:
		var values = tree[k]
		for v in values:
			inverted_tree[v].append(k)
	return inverted_tree
