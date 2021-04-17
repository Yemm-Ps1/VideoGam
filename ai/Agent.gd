extends Node

const UnitUtil = preload("res://util/UnitVectorUtil.gd")
var tree_gen = preload("res://util/TreeGen.gd").new()
var spanning_tree = null

var tile_grid = null

func _init(grid: Array):
	tile_grid = grid

func set_origin(x, y, unit_direction):
	spanning_tree = tree_gen.get_spanning_tree_with_direction(x, y, unit_direction)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
