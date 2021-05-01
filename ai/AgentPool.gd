extends Node

var BotAgent = preload("res://ai/BotAgent.gd")
var rng : RandomNumberGenerator = RandomNumberGenerator.new()

var grid = null
var bot_pool : Array = []
var player_pool: Array = []
var locale_pool : Dictionary = {}
var path_pool = {}
var origin_x
var origin_y

func _init(grid: Array, origin_x=0, origin_y=0):
	self.grid = grid
	self.origin_x = origin_y
	self.origin_y = origin_y
	locale_pool = {[origin_x, origin_y]: []}
	
func set_seed(rng_seed):
	rng.set_seed(rng_seed)

func add_players(num_of_humans, names=null):
	for i in range(num_of_humans):
		var new_instance = PlayerAgent.new(grid)
		new_instance.set_origin(origin_x, origin_y)
		player_pool.append(new_instance)
		locale_pool[[origin_x, origin_y]].append(new_instance)
		
func add_bots(num_of_bots, skill_mean=1.0, skill_deviaion=0.0):
	for i in range(num_of_bots):
		var skill_level = rng.randfn(skill_mean, skill_deviaion) # normally distributed
		var new_instance = BotAgent.new(grid, skill_mean)
		new_instance.set_origin(origin_x, origin_y)
		bot_pool.append(new_instance)
		locale_pool[[origin_x, origin_y]].append(new_instance)
		
func update_locale_and_get_paths(x, y):
	var to_rtn = {}
	var last_end_node = [x, y]
	var agents_at_locale = locale_pool[[x, y]]
	locale_pool.erase([x, y])
	for ag in agents_at_locale:
		var next_path : Array = ag.consume_and_get_next_path()
		var end_node = next_path.back()
		if not next_path in to_rtn:
			to_rtn[next_path] = 0
			locale_pool[end_node] = []
		to_rtn[next_path] += 1
		locale_pool[end_node].append(ag)
	return to_rtn
	
func get_bots_by_locale(x, y):
	return locale_pool[[x, y]]
	
func get_bot_pool():
	return bot_pool
	
func get_player_pool():
	return player_pool
	
func get_total_pool():
	return bot_pool + player_pool
