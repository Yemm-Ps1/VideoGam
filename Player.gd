extends Node2D

export var speed = 100

var tree = {}
var moving = false

#func _ready():


#func _process(delta):





func continue_signal():
	var velocity = Vector2()
	var i = 0
	position = Vector2.ZERO
	var distance = position.distance_to(tree[i])
	print(distance)
	if position == tree[i]:
		i+= 1
