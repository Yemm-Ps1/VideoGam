extends Node2D
const Converter = preload("res://util/VectorConverter.gd")
var AgentClass = preload("res://ai/Agent.gd")
var test_agent
var tile_map
var grid
var origin
var cell_size = Vector2(64,64)

var current_path = []
var loaded = false


func _ready():
	pass


func _on_Maze_ready_signal():
	test_agent = AgentClass.new(grid)
	test_agent.set_origin(origin.x, origin.y)
	current_path = test_agent.consume_and_get_next_path()
	_set_position(origin)

func _on_Maze_continue_signal():
	_follow_path()

func _process(delta):
	pass

func _set_position(pos):
	position = tile_map.map_to_world(pos) + cell_size /2


func _follow_path():
	if(current_path):
		_set_position(Converter.array_to_vector2(current_path[0]))
		current_path.remove(0)
	else:
		current_path = test_agent.consume_and_get_next_path()
		print(current_path)

func _set_direction(dir):
	match dir:
		Vector2.UP:
			rotation_degrees = 180
		Vector2.DOWN:
			rotation_degrees = 0
		Vector2.LEFT:
			rotation_degrees = 90
		Vector2.RIGHT:
			rotation_degrees = 270
