extends "res://addons/gut/test.gd"

var PlayerAgent = preload("res://ai/PlayerAgent.gd")
const UnitDirection = preload("res://util/UnitUtil.gd").UnitDirection

var small_grid = [[11, 15, 11], [8, 5, 2], [14, 13, 6]]
var big_grid = [[11,9,5,3],
				[10,12,7,10],
				[12,5,5,2],
				[13,5,5,6]]
	

func test_nextPath_smallGridfromTopLeftCornerAndDown_shouldBeExpectedPath():
	var agent : PlayerAgent = PlayerAgent.new(small_grid)
	agent.set_origin(0, 0)
	agent.consume_and_get_next_path() # no return
	
	agent.update_next_direction(UnitDirection.SOUTH)
	var expected_path = [[0, 2]]
	var found_path = agent.consume_and_get_next_path()
	assert_eq(found_path, expected_path)
	
func test_nextPath_smallGridfromTopLeftCornerAndRightAndDown_shouldBeExpectedPaths():
	var agent : PlayerAgent = PlayerAgent.new(small_grid)
	agent.set_origin(0, 0)
	agent.consume_and_get_next_path() # no return
	
	agent.update_next_direction(UnitDirection.EAST)
	var expected_path_one = [[1, 1], [2, 1]]
	var found_path_one = agent.consume_and_get_next_path()
	assert_eq(found_path_one, expected_path_one, "Unexpected at choice 1.")
	
	agent.update_next_direction(UnitDirection.SOUTH)
	var expected_path_two = [[2, 2], [1, 2]]
	var found_path_two = agent.consume_and_get_next_path()
	assert_eq(found_path_two, expected_path_two, "Unexpected at choice 2.")
	
func test_nextPath_smallGridWithUpDirection_shouldBeExpectedPath():
	var agent : PlayerAgent = PlayerAgent.new(big_grid)
	agent.set_origin(0, 0)
	agent.consume_and_get_next_path() # no return
	
	agent.update_next_direction(UnitDirection.NORTH)
	var expected_path = [[3, 1], [3, 0], [2, 0], [1, 0], [1, 1], [2, 1]]
	var found_path = agent.consume_and_get_next_path()
	assert_eq(found_path, expected_path)
	
func test_nextPath_smallGridWithDownDirection_shouldBeExpectedPath():
	var agent : PlayerAgent = PlayerAgent.new(big_grid)
	agent.set_origin(0, 0)
	agent.consume_and_get_next_path() # no return
	
	agent.update_next_direction(UnitDirection.SOUTH)
	var expected_path = [[3, 3], [2, 3], [1, 3], [0, 3]]
	var found_path = agent.consume_and_get_next_path()
	assert_eq(found_path, expected_path)
	

