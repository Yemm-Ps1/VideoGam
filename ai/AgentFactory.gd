extends Node

var BotAgent = preload("res://ai/BotAgent.gd")


var grid = null
var bot_pool = []

func _init(grid: Array):
	self.grid = grid

func add_humans(num_of_humans):
	# TODO
	pass
	
func add_bots(num_of_bots):
	for i in range(num_of_bots):
		bot_pool.append(BotAgent.new(grid))
	
func get_bot_pool():
	return bot_pool
	
func get_total_pool():
	return bot_pool # TODO add additionals
