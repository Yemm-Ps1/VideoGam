extends "Agent.gd"

class_name BotAgent

var rng : RandomNumberGenerator = RandomNumberGenerator.new()

func _init(grid).(grid):
	pass
	
func set_seed(rng_seed):
	rng.set_seed(rng_seed)
	
func choice(node_list : Array):
	return node_list[rng.randi() % len(node_list)]
