extends Area2D

export var speed = 100

func _process(delta):
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	 
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	position += velocity * delta
