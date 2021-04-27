extends "res://addons/gut/test.gd"

var BotAgent = preload("res://ai/BotAgent.gd")
const GridUtil = preload("res://util/GridUtil.gd")

var small_grid = []
var big_grid = []

func before_each():
	small_grid = [[11, 15, 11], [8, 5, 2], [14, 13, 6]]
	big_grid = [[11,9,5,3],
				[10,12,7,10],
				[12,5,5,2],
				[13,5,5,6]]

func test_nextPath_smallGridfromTopLeftCorner_shouldBeLongestPaths():
	var agent = BotAgent.new(small_grid)
	agent.set_origin(0, 0)
	
	var expected_first_path = [[0, 1]]
	var found_first_path = agent.consume_and_get_next_path() # no return call
	assert_eq(found_first_path, expected_first_path)
	
	var expected_second_path = [[1, 1], [2, 1]]
	var found_second_path = agent.consume_and_get_next_path()
	assert_eq(found_second_path, found_second_path)
	
	var expected_third_path = [[2, 2], [1, 2]]
	var found_third_path = agent.consume_and_get_next_path()
	assert_eq(found_third_path, found_third_path)
	

func test_nextPath_bigGridfromTopLeftCornerBestBot_shouldBeLongestPath():
	var agent = BotAgent.new(big_grid, 1.0)
	agent.set_origin(0, 0)
	var expected_path = [[3, 1], [3, 0], [2, 0], [1, 0], [1, 1], [2, 1]]
	agent.consume_and_get_next_path() # no return call
	var found_path = agent.consume_and_get_next_path()
	assert_eq(found_path, expected_path)

func test_nextPath_bigGridfromTopLeftCornerWorstBot_shouldReturnOtherPath():
	var agent = BotAgent.new(big_grid, 0.0)
	agent.set_origin(0, 0)
	var expected_path = [[3, 3], [2, 3], [1, 3], [0, 3]]
	agent.consume_and_get_next_path() # no return call
	var found_path = agent.consume_and_get_next_path()
	assert_eq(found_path, expected_path)
