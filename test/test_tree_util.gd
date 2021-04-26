extends "res://addons/gut/test.gd"

const TreeUtil = preload("res://util/TreeUtil.gd")
var small_tree = {}
var medium_tree = {}

func before_all():
	small_tree = {
		[0, 0]:[[0, 1]],
		[0, 1]:[[0, 2], [1, 1]],
		[0, 2]:[],
		[1, 0]:[],
		[1, 1]:[[2, 1]],
		[1, 2]:[],
		[2, 0]:[],
		[2, 1]:[[2, 2], [2, 0]],
		[2, 2]:[[1, 2]]
	}
	
	medium_tree = {
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
		[1,3]:[[0,3]],
		[2,3]:[[1,3]],
		[3,3]:[[2,3]],
	}

func test_getForcedPath_mediumTreeStartingNode_shouldBePathToChoice():
	var expected_path = [[0, 1], [0, 2], [1, 2], [2, 2], [3, 2]]
	var found_path = TreeUtil.get_forced_path(medium_tree, 0, 0)
	assert_eq(found_path, expected_path, "Paths were not equal")
	
func test_getForcedPath_mediumTreeUpFromChoiceNode_shouldBePathToTerminal():
	var expected_path = [[3, 0], [2, 0], [1, 0], [1, 1], [2, 1]]
	var found_path = TreeUtil.get_forced_path(medium_tree, 3, 1)
	assert_eq(found_path, expected_path, "Paths were not equal")
	
func test_getForcedPath_mediumTreeFromChoice_shouldBeEmpty():
	var expected_path = []
	var found_path = TreeUtil.get_forced_path(medium_tree, 3, 2)
	assert_eq(found_path, expected_path, "Paths were not equal")
	
func test_getForcedPath_mediumTreeFromTerminalOne_shouldBeEmpty():
	var expected_path = []
	var found_path = TreeUtil.get_forced_path(medium_tree, 2, 1)
	assert_eq(found_path, expected_path, "Paths were not equal")
	
func test_getForcedPath_mediumTreeFromTerminalTwo_shouldBeEmpty():
	var expected_path = []
	var found_path = TreeUtil.get_forced_path(medium_tree, 0, 3)
	assert_eq(found_path, expected_path, "Paths were not equal")
	
func test_getLongestBranchLength_mediumTreeFromTopLeft_shouldBeLongest():
	var expected_path_len = 11
	var found_path_len = TreeUtil.get_longest_branch_length(medium_tree, 0, 0)
	assert_eq(found_path_len, expected_path_len, "Paths were not equal")

func test_getLongestBranchLength_mediumTreeFromChoice_shouldBeLongest():
	var expected_path_len = 6
	var found_path_len = TreeUtil.get_longest_branch_length(medium_tree, 3, 2)
	assert_eq(found_path_len, expected_path_len, "Paths were not equal")
	
func test_getLongestBranchLength_mediumTreeFromBelowChoice_shouldBeLongest():
	var expected_path_len = 3
	var found_path_len = TreeUtil.get_longest_branch_length(medium_tree, 3, 3)
	assert_eq(found_path_len, expected_path_len, "Paths were not equal")
	
func test_getInvertedTree_smallTree_shouldFlipEdges():
	var found_inverted_tree = TreeUtil.get_inverted_tree(small_tree)
	var inverted_small_tree = {
		[0, 0]:[],
		[0, 1]:[[0, 0]],
		[0, 2]:[[0, 1]],
		[1, 0]:[],
		[1, 1]:[[0, 1]],
		[1, 2]:[[2, 2]],
		[2, 0]:[[2, 1]],
		[2, 1]:[[1, 1]],
		[2, 2]:[[2, 1]]
	}
	assert_eq_shallow(found_inverted_tree, inverted_small_tree)
	
