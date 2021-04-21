extends Node2D

const N = 1
const E = 2
const S = 4
const W = 8

onready var Map = $TileMap


var tile_size = 64
var width = 20
var height = 12

export var map_seed = 420
export var zoom = 0.1
export var DEBUG_CLICK = false

const TreeGen = preload("res://util/TreeGen.gd")
const GridUtil = preload("res://util/GridUtil.gd")
const Converter = preload("res://util/VectorConverter.gd")

signal continue_signal(mouse_event)

var cell_walls = {
	Vector2.UP : N, Vector2.RIGHT : E,
	Vector2.DOWN : S, Vector2.LEFT : W
}




#func _process(delta):
	#$Camera2D.position = $Player.position
 

func _ready():
	
	$Camera2D.zoom = Vector2(1,1)
	$Camera2D.position = Map.map_to_world(Vector2(width/2, height/2))
	#OS.set_window_size(Vector2((width * tile_size), (height * tile_size)))
	randomize()
	if !map_seed:
		map_seed = randi()
	seed(map_seed)
	print("Seed: ", map_seed)
	tile_size = Map.cell_size
	make_maze()


var span_tree


var scroll_dir = {
	'scroll_up' : Vector2(-zoom, -zoom),
	'scroll_down' : Vector2(zoom, zoom)
}

var modifier = 1


func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("continue_signal", event)
		print(Map.world_to_map(event.position))
	
	if event.is_action_pressed("modifier"):
		modifier = 5
	elif event.is_action_released("modifier"):
		modifier = 1
		
		
	for dir in scroll_dir.keys():
		if event.is_action_pressed(dir):
			zoom(scroll_dir[dir] * modifier)




func zoom(dir):
	$Camera2D.zoom += dir


func check_neighbors(cell, unvisited): # Cell is the current cell, unvisited is a list of all unvisited cells.
	var list = []
	for n in cell_walls.keys():
		if cell + n in unvisited: # If the current cell + a vector in any cardinal direction is unvisited.
			list.append(cell + n) # Add the unvisited, adjacent cell to the list.
	return list



var testDict = {}

func make_maze():
	var unvisited = []
	var stack = []
	# Fill the map with solid tiles
	Map.clear()
	for y in range(height):
		for x in range (width):
			unvisited.append(Vector2(x,y))
			Map.set_cellv(Vector2(x,y), N|E|S|W) # Makes all the Cells blank, equal to tile 15
	var current = Vector2.ZERO
	
	unvisited.erase(current)
	
	
	# Al gore rythm (Recursive backtracker)
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
			testDict[current] = current_walls
			testDict[next] = next_walls
			current = next
			unvisited.erase(current)
			#yield(get_tree(), 'idle_frame')
			
		elif stack:
			current = stack.pop_back()
		$OldPlayer.tree.append(current)
		if(DEBUG_CLICK):
			yield(self, "continue_signal")
	#print(tiles)
	

	#$Player.span_tree = TreeGen.get_spanning_tree(tiles, 0, 0)
	var testArray = Converter.dict_to_array(testDict)
	$OldPlayer.span_tree = TreeGen.get_spanning_tree(testArray, 0, 0)
	#print(tiles)
	print(GridUtil.validate(testArray))
	#print(GridUtil.is_choice(tiles, 1, 1))
	#print(span_tree)

