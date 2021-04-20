extends "res://addons/gut/test.gd"

var AgentClass = preload("res://ai/Agent.gd")
const GridUtil = preload("res://util/GridUtil.gd")

var small_grid = []
var big_grid = []

func before_each():
	small_grid = [[11, 15, 11], [8, 5, 2], [14, 13, 6]]
	big_grid = [[11,9,5,3],
				[10,12,7,10],
				[12,5,5,2],
				[13,5,5,6]]
	

func test_nextPath_smallGridfromTopLeftCorner_shouldBeExpectedPath():
	var agent = AgentClass.new(small_grid)
	agent.set_origin(0, 0)
	var expected_path = [[0, 1]]
	var found_path = agent.consume_and_get_next_path()
	assert_eq(found_path, expected_path)

func test_nextPath_bigGridfromTopLeftCornerFirstPath_shouldBeExpectedPath():
	var agent = AgentClass.new(big_grid)
	agent.set_origin(0, 0)
	var expected_path = [[0, 1], [0, 2], [1, 2], [2, 2], [3, 2]]
	var found_path = agent.consume_and_get_next_path()
	assert_eq(found_path, expected_path, "Paths were not equal")
	
func test_nextPath_bigGridfromTopLeftCornerSecondPath_shouldBeOneOfExpectedPaths():
	var agent = AgentClass.new(big_grid)
	agent.set_origin(0, 0)
	var valid_paths = [
		[[3,1], [3, 0], [2, 0], [1, 0], [1, 1], [2, 1]],
		[[3, 3], [2, 3], [1, 3], [0, 3]]
		]
	agent.consume_and_get_next_path() # no return call
	var found_path = agent.consume_and_get_next_path()
	assert_has(valid_paths, found_path, "Found path was not one of the valid paths.")
