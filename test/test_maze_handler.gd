extends "res://addons/gut/test.gd"

var Map = TileMap.new()

var Maze = preload("res://MazeBuilder.gd").new(Map)

func test_makeGrid_smallMap_shouldReturnEmptyGrid():
	pass
