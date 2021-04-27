extends Node2D
const Converter = preload("res://util/VectorConverter.gd")
var AgentClass = preload("res://ai/BotAgent.gd")

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
	current_path = test_agent.consume_and_get_next_path().duplicate()
	_set_position(origin)
	_set_direction()

func _on_Maze_continue_signal():
	_follow_path()

func _process(delta):
	_follow_path()

func _set_position(pos = Converter.array_to_vector2(current_path[0])):
	print("test")
	position = tile_map.map_to_world(pos) + cell_size /2

func _get_position():
	return tile_map.world_to_map(position)


func _follow_path():
	if !current_path:
		current_path = test_agent.consume_and_get_next_path().duplicate() # TODO REMOVE		
		if !current_path:
			return
	_set_direction()
	_set_position()
	current_path.pop_front()

func _set_direction():
	print(_get_position())
	var dir = _get_position().direction_to(Converter.array_to_vector2(current_path[0]))
	print(dir)
	match dir:
		Vector2.UP:
			rotation_degrees = 270
		Vector2.DOWN:
			rotation_degrees = 90
		Vector2.LEFT:
			rotation_degrees = 180
		Vector2.RIGHT:
			rotation_degrees = 0
