extends Node

var BotAgent = preload("res://ai/BotAgent.gd")


var grid = null
var bot_pool : Array = []
var locale_pool : Dictionary = {}
var path_pool = {}
var origin_x
var origin_y

func _init(grid: Array, origin_x=0, origin_y=0):
	self.grid = grid
	self.origin_x = origin_y
	self.origin_y = origin_y
	locale_pool = {[origin_x, origin_y]: []}

func add_player_pool(num_of_humans):
	# TODO
	pass
	
func add_bots(num_of_bots):
	for i in range(num_of_bots):
		var new_instance = BotAgent.new(grid)
		new_instance.set_origin(origin_x, origin_y)
		bot_pool.append(new_instance)
		locale_pool[[origin_x, origin_y]].append(new_instance)
		
func update_locale_and_get_paths(x, y):
	var to_rtn = {}
	var last_end_node = [x, y]
	var agents_at_locale = locale_pool[[x, y]]
	locale_pool.erase([x, y])
	printerr("AGENTS AT LOCALE: " + str(agents_at_locale))
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
	
func get_total_pool():
	return bot_pool # TODO add additionals
