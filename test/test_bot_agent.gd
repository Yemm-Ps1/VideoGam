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

func test_nextPath_bigGridfromTopLeftCornerSecondPathWithSeed_shouldBeSeededPath():
	var agent = BotAgent.new(big_grid)
	agent.set_origin(0, 0)
	agent.set_seed(69)
	var expected_path = [[3, 3], [2, 3], [1, 3], [0, 3]]
	agent.consume_and_get_next_path() # no return call
	var found_path = agent.consume_and_get_next_path()
	assert_eq(found_path, expected_path, "Found path was not one of the valid paths.")