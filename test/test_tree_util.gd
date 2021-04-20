extends "res://addons/gut/test.gd"

const TreeUtil = preload("res://util/TreeUtil.gd")

var test_tree = []

func before_all():
	test_tree = {
		[0,0]:[[0,1]],
		[1,0]:[[1,1]],
		[2,0]:[[1,0]],
		[3,0]:[[2,0]],
		[0,1]:[[0,2]],
		[1,1]:[[2,1]],
		[2,1]:[],
		[3,1]:[[3,0]],
		[0,2]:[[1,2]],
		[1,2]:[[2, 2]],
		[2,2]:[[3,2]],
		[3,2]:[[3,1], [3,3]],
		[0,3]:[],
		[1,3]:[0,3],
		[2,3]:[[1,3]],
		[3,3]:[[2,3]],
	}

func test_getForcedPath_startingNode_shouldBePathToChoice():
	var expected_path = [[0, 1], [0, 2], [1, 2], [2, 2], [3, 2]]
	var found_path = TreeUtil.get_forced_path(test_tree, 0, 0)
	assert_eq(found_path, expected_path, "Paths were not equal")
	
func test_getForcedPath_upFromChoiceNode_shouldBePathToTerminal():
	var expected_path = [[3, 0], [2, 0], [1, 0], [1, 1], [2, 1]]
	var found_path = TreeUtil.get_forced_path(test_tree, 3, 1)
	assert_eq(found_path, expected_path, "Paths were not equal")
	
func test_getForcedPath_fromChoice_shouldBeEmpty():
	var expected_path = []
	var found_path = TreeUtil.get_forced_path(test_tree, 3, 2)
	assert_eq(found_path, expected_path, "Paths were not equal")
	
func test_getForcedPath_fromTerminalOne_shouldBeEmpty():
	var expected_path = []
	var found_path = TreeUtil.get_forced_path(test_tree, 2, 1)
	assert_eq(found_path, expected_path, "Paths were not equal")
	
func test_getForcedPath_fromTerminalTwo_shouldBeEmpty():
	var expected_path = []
	var found_path = TreeUtil.get_forced_path(test_tree, 0, 3)
	assert_eq(found_path, expected_path, "Paths were not equal")
