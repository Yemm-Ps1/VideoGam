extends Node2D


onready var Map = $TileMap
const TreeGen = preload("res://util/TreeGen.gd")
const GridUtil = preload("res://util/GridUtil.gd")
var AgentPool = preload("res://ai/AgentPool.gd")

signal ready_signal()
signal continue_signal()


var width = 20
var height = 12
var origin = Vector2(0,0)

# MAIN
var current_paths

func _ready():
	var Maze = preload("res://util/MazeBuilder.gd").new(Map)
	var grid = Maze.make_grid(width, height).make_walls(origin).build()
	var agent_pool = AgentPool.new(grid)
	agent_pool.add_bots(2)
	current_paths = agent_pool.update_locale_and_get_paths(0,0)



func _process(delta):
	pass


# INPUT

func _input(event):
	if event.is_action_pressed("ui_accept"):
		#print(Map.world_to_map(event.position))
		emit_signal("continue_signal")
