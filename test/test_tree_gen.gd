extends "res://addons/gut/test.gd"

const TreeGen = preload("res://util/TreeGen.gd")
const UnitUtil = preload("res://util/UnitVectorUtil.gd")
var input_grid = []

func before_all():
	pass

func before_each():
	input_grid = [
		[11, 15, 11], 
		[8, 5, 2], 
		[14, 13, 6]]
	
func test_getSuccessors_topLeft_shouldOnlyHaveBelow():
	var expected_result = [[0,1]]
	var found_succ = TreeGen._get_successors(input_grid, 0, 0)
	assert_eq(found_succ, expected_result)

func test_getSuccessors_MiddleNoExclusions_shouldHaveTwo():
	var found_succ = TreeGen._get_successors(input_grid, 1, 1)
	assert_eq(len(found_succ), 2, "Two values expected in list: " + str(found_succ))

func test_getSuccessors_MiddleNoExclusions_shouldContainLeftAndRight():
	var expected_val_one = [0,1]
	var expected_val_two = [2,1]
	var found_succ = TreeGen._get_successors(input_grid, 1, 1)
	assert_has(found_succ, expected_val_one)
	assert_has(found_succ, expected_val_two)

func test_getSuccessors_MiddleExcludeLeft_shouldContainRight():
	var not_expected_val = [0,1]
	var expected_val = [2,1]
	var found_succ = TreeGen._get_successors_with_exclusions(input_grid, 1, 1, [[0, 1]])
	assert_does_not_have(found_succ, not_expected_val)
	assert_has(found_succ, expected_val)
	
func test_getSuccessors_MiddleExcludeLeftAsDict_shouldContainRight():
	var not_expected_val = [0,1]
	var expected_val = [2,1]
	var found_succ = TreeGen._get_successors_with_exclusions(input_grid, 1, 1, {[0, 1]:null})
	assert_does_not_have(found_succ, not_expected_val)
	assert_has(found_succ, expected_val)
	
func test_getSuccessors_MiddleBottom_shouldOnlyBeRight():
	var expected_out= [[2,2]]
	var found_succ = TreeGen._get_successors(input_grid, 1, 2)
	assert_eq(found_succ, expected_out)



func test_getSpanningTree_fromTopLeft_shouldHaveNineKeys():
	var expected_key_count = 8 # one is unreachable
	var found_map = TreeGen.get_spanning_tree(input_grid, 0, 0)
	var found_keys = found_map.keys()
	found_keys.sort()
	assert_eq(len(found_keys), expected_key_count, "Incorrect key count in: " + str(found_map.keys()))


func test_getSpanningTree_fromTopLeft_shouldHaveTopKey():
	var expect_to_contain_key = [0, 0]
	var expect_to_contain_value = [[0, 1]]
	var found_map = TreeGen.get_spanning_tree(input_grid, 0, 0)
	assert_has(found_map, expect_to_contain_key, "Key was missing from return map.")

func test_getSpanningTree_fromTopLeft_shouldHaveTopLeftSuccessors():
	var expect_to_contain_key = [0, 0]
	var expect_to_eq_val = [[0, 1]]
	var found_map = TreeGen.get_spanning_tree(input_grid, 0, 0)
	assert_eq(found_map[expect_to_contain_key], expect_to_eq_val, "Values were incorrect in return map.")


func test_getSpanningTree_fromTopLeft_shouldHaveBottomRightSuccessors():
	var expect_to_contain_key = [2, 2]
	var expect_to_contain_value = [[1, 2]]
	var found_map = TreeGen.get_spanning_tree(input_grid, 0, 0)
	assert_has(found_map, expect_to_contain_key, "Key was missing from return map.")
	assert_eq(found_map[expect_to_contain_key], expect_to_contain_value, "Values were incorrect in return map.")
	

func test_getSpanningTreeWithDirection_fromMiddlePointingRight_shouldOmmitLeft():
	var should_contain_key = [2, 2]
	var should_not_contain_val = [0, 1]
	var found_map = TreeGen.get_spanning_tree_with_direction(input_grid, 1, 1, UnitUtil.UnitDirection.EAST)
	var found
	assert_has(found_map, should_contain_key, "Key was missing from return map.")
	assert_does_not_have(found_map[should_contain_key], should_not_contain_val, "The key on left of middle should not be in tree")
	#_print_map(found_map)

	
func _print_map(map_to_print):
	for k in map_to_print:
		gut.p("Key: " + str(k) + ", Values: " + str(map_to_print[k]))

	
