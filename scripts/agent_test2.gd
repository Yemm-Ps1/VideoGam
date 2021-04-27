extends Node2D
const Converter = preload("res://util/VectorConverter.gd")
var AgentClass = preload("res://ai/BotAgent.gd")

var test_agent
var tile_map
var grid
var origin
var cell_size = Vector2(64,64)
var direction
var current_path = []
var loaded = false
var velocity = Vector2()
var target_pos = Vector2()
export(String, "0.25", "0.5", "1", "2", "4", "8", "16", "32", "64") var speed

func _ready():
	pass


func _on_Maze_ready_signal():

	test_agent = AgentClass.new(grid)
	test_agent.set_origin(origin.x, origin.y)
	current_path = test_agent.consume_and_get_next_path()
	_update_target_pos()
	_set_position(origin)
	_update_direction()



func _on_Maze_continue_signal():
	pass

func _translated_pos():
	var translated_pos = (position / cell_size) - Vector2(0.5, 0.5)
	return translated_pos

var old_distance_to_target = 1
func _process(delta):
	velocity = float(speed) * direction
	position += velocity
	var pos = _translated_pos()
	if pos == target_pos:
		print("Following Path")
		_follow_path()
	var distance_to_target = pos.distance_to(target_pos)

func _set_position(pos = target_pos):
	position = tile_map.map_to_world(pos) + cell_size / 2
	
func _update_target_pos():
	target_pos = Converter.array_to_vector2(current_path[0])

func _get_position():
	return tile_map.world_to_map(position)
	


func _follow_path():
	if !current_path:
		current_path = test_agent.consume_and_get_next_path() 
		if !current_path:
			velocity = Vector2.ZERO
			return
	_update_target_pos()
	_update_direction()
	current_path.pop_front()
	

	

# Updates direction to target_pos, both physically and in the variable
func _update_direction():
	direction = _get_position().direction_to(target_pos)
	match direction:
		Vector2.UP:
			rotation_degrees = 270
		Vector2.DOWN:
			rotation_degrees = 90
		Vector2.LEFT:
			rotation_degrees = 180
		Vector2.RIGHT:
			rotation_degrees = 0
