extends "res://addons/gut/test.gd"

var grid_util = preload("res://GridUtil.gd").new()
var input_grid = []

func before_all():
	pass

func before_each():
	input_grid = [[11, 15, 11], [8, 5, 2], [14, 13, 6]]
	
func test_isTerminalVal_numberSeven_shouldReturnTrue():
	assert_true(grid_util._is_terminal_val(7), "7 was not recognized as terminal.")

func test_isTerminalVal_numberEleven_shouldReturnTrue():
	assert_true(grid_util._is_terminal_val(11), "11 was not recognized as terminal.")
	
func test_isTerminalVal_numberThirteen_shouldReturnTrue():
	assert_true(grid_util._is_terminal_val(13), "13 was not recognized as terminal.")
	
func test_isTerminalVal_numberFourteen_shouldReturnTrue():
	assert_true(grid_util._is_terminal_val(14), "14 was not recognized as terminal.")

func test_isTerminalVal_numberSix_shouldReturnFalse():
	assert_false(grid_util._is_terminal_val(6), "6 was incorrectly recognized as terminal.")
	
func test_isTerminalVal_numberTen_shouldReturnFalse():
	assert_false(grid_util._is_terminal_val(10), "10 was incorrectly recognized as terminal.")
	
func test_isTerminal_topRightCorner_shouldBeTrue():
	assert_true(grid_util.is_terminal(input_grid, 0, 0), "The top right corner was not terminal.")
	
func test_isTerminal_middleTile_shouldBeFalse():
	assert_false(grid_util.is_terminal(input_grid, 1, 1), "The middle title was incorrectly terminal.")
	


	
