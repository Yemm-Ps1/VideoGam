extends Node

const Converter = preload("res://util/VectorConverter.gd")

# MAP
const N = 1
const E = 2
const S = 4
const W = 8

var cell_walls = {
	Vector2.UP : N, Vector2.RIGHT : E,
	Vector2.DOWN : S, Vector2.LEFT : W
}

var map_x = 5
var map_y = 5
var map_start = Vector2(map_x,map_y)
var width = 20
var height = 12

func make_grid(width, height):
	pass


func make_maze(tile_map):
	var maze = {}
	var unvisited = []
	var stack = []
	tile_map.clear()
	for y in range(height):
		for x in range (width):
			unvisited.append(Vector2(x,y))
			tile_map.set_cellv(Vector2(x,y), N|E|S|W) # Makes all the Cells blank, equal to tile 15
	var current = map_start
	
	unvisited.erase(current)
	while unvisited:
		var neighbors = _check_neighbors(current, unvisited) # Gets all unvisited neighbors.
		if neighbors.size() > 0: # If there is an unvisited neighbour.
			var next = neighbors[randi() % neighbors.size()] # Randomly choose one of the potential neighbours.
			stack.append(current) # Add the current cell to the stack.
			var dir = next - current # Finds the direction of the selected neighbour.
			var current_walls = tile_map.get_cellv(current) - cell_walls[dir] # Makes current_walls equal to the current cell minus the direction AKA the new cell.
			var next_walls = tile_map.get_cellv(next) - cell_walls[-dir]
			tile_map.set_cellv(current, current_walls)
			tile_map.set_cellv(next, next_walls)
			maze[current] = current_walls
			maze[next] = next_walls
			current = next
			unvisited.erase(current)
		elif stack:
			current = stack.pop_back()
	return Converter.dict_to_array(maze)
	
func _check_neighbors(cell, unvisited): # Cell is the current cell, unvisited is a list of all unvisited cells.
	var list = []
	for n in cell_walls.keys():
		if cell + n in unvisited: # If the current cell + a vector in any cardinal direction is unvisited.
			list.append(cell + n) # Add the unvisited, adjacent cell to the list.
	return list	
