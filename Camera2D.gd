extends Camera2D


var dir_enum =  {
	"ui_up" : Vector2.UP,
	"ui_down" : Vector2.DOWN,
	"ui_left" : Vector2.LEFT,
	"ui_right" : Vector2.RIGHT 
}

var movement_modifier = 64

func _ready():
	set_process_input(true)


var _previousPosition = Vector2.ZERO
var _moveCamera = false

func _unhandled_input(event):
	for dir in dir_enum.keys():
		if event.is_action_pressed(dir):
			move(dir_enum[dir])
		
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
		get_tree().set_input_as_handled()
		if event.is_pressed():
			_previousPosition = event.position
			_moveCamera = true
		else:
			_moveCamera = false
	elif event is InputEventMouseMotion && _moveCamera:
		get_tree().set_input_as_handled()
		position += (_previousPosition - event.position)
		_previousPosition = event.position


#var dragging = false
#func _input(event):
#	if event is InputEventMouseButton:
#		if event.is_pressed():
#			dragging = true
#		else:
#			dragging = false
#	elif event is InputEventMouseMotion and dragging:
#		position = get_global_mouse_position()


func move(dir):
	position += dir * movement_modifier

