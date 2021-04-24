extends Node2D


onready var Map = $TileMap
const TreeGen = preload("res://util/TreeGen.gd")
const GridUtil = preload("res://util/GridUtil.gd")


var AgentClass = preload("res://ai/Agent.gd")



var width = 20
var height = 12


# MAIN


func _ready():
	var Maze = preload("res://MazeBuilder.gd").new(Map)
	var grid = Maze.make_grid(width, height).make_maze().build()
	var agent = AgentClass.new(grid)
	agent.set_origin(2, 4)
	var path = agent.consume_and_get_next_path()
	print(path)
	
func _process(delta):
	pass


# INPUT

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		print(Map.world_to_map(event.position))
	
