extends Node2D

const TreeGen = preload("res://util/TreeGen.gd")
const GridUtil = preload("res://util/GridUtil.gd")
const Converter = preload("res://util/VectorConverter.gd")
var AgentClass = preload("res://ai/Agent.gd")

# MAP
const N = 1
const E = 2
const S = 4
const W = 8

onready var Map = $TileMap

var map_x = 5
var map_y = 5
var map_start = Vector2(map_x,map_y)
var width = 20
var height = 12

var cell_walls = {
	Vector2.UP : N, Vector2.RIGHT : E,
	Vector2.DOWN : S, Vector2.LEFT : W
}

# MAIN

func _ready():
	var grid = make_maze()
	var agent = AgentClass.new(grid)
	agent.set_origin(map_x, map_y)
	var path = agent.consume_and_get_next_path()
	print(path)
	
func _process(delta):
	pass



# MAZE

# Creates a Maze and outputs a grid dictonary
func make_maze():
	var maze = {}
	var unvisited = []
	var stack = []
	Map.clear()
	for y in range(height):
		for x in range (width):
			unvisited.append(Vector2(x,y))
			Map.set_cellv(Vector2(x,y), N|E|S|W) # Makes all the Cells blank, equal to tile 15
	var current = map_start
	
	unvisited.erase(current)
	while unvisited:
		var neighbors = check_neighbors(current, unvisited) # Gets all unvisited neighbors.
		if neighbors.size() > 0: # If there is an unvisited neighbour.
			var next = neighbors[randi() % neighbors.size()] # Randomly choose one of the potential neighbours.
			stack.append(current) # Add the current cell to the stack.
			var dir = next - current # Finds the direction of the selected neighbour.
			var current_walls = Map.get_cellv(current) - cell_walls[dir] # Makes current_walls equal to the current cell minus the direction AKA the new cell.
			var next_walls = Map.get_cellv(next) - cell_walls[-dir]
			Map.set_cellv(current, current_walls)
			Map.set_cellv(next, next_walls)
			maze[current] = current_walls
			maze[next] = next_walls
			current = next
			unvisited.erase(current)
		elif stack:
			current = stack.pop_back()
	return Converter.dict_to_array(maze)
	
func check_neighbors(cell, unvisited): # Cell is the current cell, unvisited is a list of all unvisited cells.
	var list = []
	for n in cell_walls.keys():
		if cell + n in unvisited: # If the current cell + a vector in any cardinal direction is unvisited.
			list.append(cell + n) # Add the unvisited, adjacent cell to the list.
	return list	

# INPUT

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		print(Map.world_to_map(event.position))
	
