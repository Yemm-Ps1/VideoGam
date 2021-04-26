extends "res://addons/gut/test.gd"
const GridUtil = preload("res://util/GridUtil.gd")

var Map = TileMap.new()
var Maze = preload("res://util/MazeBuilder.gd").new(Map)

const SMALL_GRID = Vector2(3, 3)
const SMALL_ARRAY = [[15, 15, 15], [15, 15, 15], [15, 15, 15]]
const RANDOM_ARRAY = [[11, 9, 3], [10, 14, 10], [12, 5, 6]]
const ALTERNATIVE_RANDOM_ARRAY = [[13, 5, 3], [9, 5, 6], [12, 5, 7]]
const ORIGIN_ARRAY = [[13, 5, 3], [9, 7, 10], [12, 5, 6]]

const RECT_GRID = Vector2(5, 3)
const SMALL_RECT_ARRAY = [[15, 15, 15, 15, 15], [15, 15, 15, 15, 15], [15, 15, 15, 15, 15]]
const RANDOM_RECT_ARRAY = [[11, 11, 9, 1, 3], [10, 12, 6, 10, 10], [12, 5, 5, 6, 14]]
const ALTERNATIVE_RANDOM_RECT_ARRAY = [[13, 5, 3, 13, 3], [9, 7, 12, 5, 2], [12, 5, 5, 5, 6]]
const ORIGIN_RECT_ARRAY = [[13, 5, 1, 3, 11], [9, 5, 6, 12, 2], [12, 5, 7, 13, 6]]



func before_each():
	Maze.free()
	Maze = preload("res://util/MazeBuilder.gd").new(Map)
	Maze.set_seed(420)

func test_makeGrid_smallGrid_shouldMatchSmallArray():
	var result = Maze.make_grid(SMALL_GRID.x, SMALL_GRID.y).build()
	assert_eq(result, SMALL_ARRAY)

func test_makeMaze_smallGrid_shouldMatchRandomArray():
	var result = Maze.make_grid(SMALL_GRID.x, SMALL_GRID.y).make_walls().build()
	assert_eq(result, RANDOM_ARRAY)

func test_makeMazeSeed_smallGrid_shouldMatchAlternativeRandomArray():
	Maze.set_seed(69)
	var result = Maze.make_grid(SMALL_GRID.x, SMALL_GRID.y).make_walls().build()
	assert_eq(result, ALTERNATIVE_RANDOM_ARRAY)

func test_makeMazeCustomOrigin_smallGrid_shouldMatchOriginArray():
	var result = Maze.make_grid(SMALL_GRID.x, SMALL_GRID.y).make_walls(Vector2(1,1)).build()
	assert_eq(result, ORIGIN_ARRAY)

func test_makeGrid_rectGrid_shouldMatchSmallRectArray():
	var result = Maze.make_grid(RECT_GRID.x, RECT_GRID.y).build()
	assert_eq(result, SMALL_RECT_ARRAY)

func test_makeMaze_rectGrid_shouldMatchRandomRectArray():
	var result = Maze.make_grid(RECT_GRID.x, RECT_GRID.y).make_walls().build()
	assert_eq(result, RANDOM_RECT_ARRAY)

func test_makeMazeSeed_rectGrid_shouldMatchAlternativeRandomRectArray():
	Maze.set_seed(69)
	var result = Maze.make_grid(RECT_GRID.x, RECT_GRID.y).make_walls().build()
	assert_eq(result, ALTERNATIVE_RANDOM_RECT_ARRAY)

func test_makeMazeCustomOrigin_rectGrid_shouldMatchOriginRectArray():
	var result = Maze.make_grid(RECT_GRID.x, RECT_GRID.y).make_walls(Vector2(2,2)).build()
	assert_eq(result, ORIGIN_RECT_ARRAY)

