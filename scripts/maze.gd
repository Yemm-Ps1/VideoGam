extends Node2D


onready var Map = $TileMap
const TreeGen = preload("res://util/TreeGen.gd")
const GridUtil = preload("res://util/GridUtil.gd")


signal ready_signal()
signal continue_signal()


var width = 20
var height = 12
var origin = Vector2(0,0)

# MAIN


func _ready():
	var Maze = preload("res://util/MazeBuilder.gd").new(Map)
	var grid = Maze.make_grid(width, height).make_walls(420, origin).build()
	$TestAgent.tile_map = Map
	$TestAgent.grid = grid
	$TestAgent.origin = origin
	emit_signal("ready_signal")
	
func _process(delta):
	pass


# INPUT

func _input(event):
	if event.is_action_pressed("ui_accept"):
		print(Map.world_to_map(event.position))
		emit_signal("continue_signal")
