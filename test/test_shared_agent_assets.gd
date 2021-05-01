extends "res://addons/gut/test.gd"

var SharedAgentAssets = preload("res://ai/SharedAgentAssets.gd")

var big_grid = [[11,9,5,3],
				[10,12,7,10],
				[12,5,5,2],
				[13,5,5,6]]


func test_getPathValueTable_bigGridUpFromChoice_shouldReturnRemainingPathLength():
	var agent_assets = SharedAgentAssets.new(big_grid)
	var expected_path_value_table = [
		[11, 2, 3, 4],
		[10, 1, 0, 5],
		[9, 8, 7, 6],
		[0, 1, 2, 3],
		]
	var found_table = agent_assets.get_path_value_table()
	assert_eq(found_table, expected_path_value_table)
