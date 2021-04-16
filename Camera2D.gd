extends Camera2D

var movement_modifier = 64

var window_size = OS.window_size
var min_x = 0
var min_y = 0
var max_x = window_size.x
var max_y = window_size.y


#func _ready():
#	set_process_input(true)
#	limit_top = 0
#	limit_bottom = max_y
#	limit_left = 0
#	limit_right = max_x


var _moveCamera = false

func _unhandled_input(event):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			_moveCamera = true
		else:
			_moveCamera = false
	elif event is InputEventMouseMotion && _moveCamera:
		var next_pos = position + event.relative * zoom.x * -1
		position = next_pos
		print(global_position)
		#print(position)

