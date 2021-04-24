extends "res://addons/gut/test.gd"
const GridUtil = preload("res://util/GridUtil.gd")

var Map = TileMap.new()
var Maze = preload("res://MazeBuilder.gd").new(Map)

const SMALL_GRID = Vector2(3, 3)

const SMALL_ARRAY = [[15, 15, 15], [15, 15, 15], [15, 15, 15]]

const RANDOM_ARRAY = [[11, 9, 3], [10, 14, 10], [12, 5, 6]]

const ALTERNATIVE_RANDOM_ARRAY = [[13, 5, 3], [9, 5, 6], [12, 5, 7]]

func before_each():
	Maze.free()
	Maze = preload("res://MazeBuilder.gd").new(Map)

func test_makeGrid_smallGrid_shouldReturnEmptyGrid():
	var result = Maze.make_grid(SMALL_GRID.x, SMALL_GRID.y).build()
	assert_eq(result, SMALL_ARRAY)

func test_makeMaze_smallGrid_shouldReturnSeededGrid():
	var result = Maze.make_grid(SMALL_GRID.x, SMALL_GRID.y).make_maze().build()
	assert_eq(result, RANDOM_ARRAY)

func test_makeMazeSeed_smallGrid_shouldReturnAlternativeSeededGrid():
	var result = Maze.make_grid(SMALL_GRID.x, SMALL_GRID.y).make_maze(69).build()
	assert_eq(result, ALTERNATIVE_RANDOM_ARRAY)
