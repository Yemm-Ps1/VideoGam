extends "res://addons/gut/test.gd"

var tile_util = preload("res://util/TileUtil.gd").new()
var small_grid = []

func before_all():
	small_grid = [[11, 15, 11], [8, 5, 2], [14, 13, 6]]
	
	
# ------------------------------------------------------------------------------
# DIRECTION FUNCTIONS TESTS
# ------------------------------------------------------------------------------	

func test_hasLeft_numberEight_shouldBeTrue():
	assert_true(tile_util.has_left(8))
	
func test_hasLeft_numberThree_shouldBeFalse():
	assert_false(tile_util.has_left(3))
	
	
func test_hasBottom_numberFour_shouldBeTrue():
	assert_true(tile_util.has_bottom(4))

func test_hasBottom_numberTwelve_shouldBeTrue():
	assert_true(tile_util.has_bottom(12))
	
func test_hasBottom_numberEight_shouldBeFalse():
	assert_false(tile_util.has_bottom(8))
	

func test_hasRigth_numberTwo_shouldBeTrue():
	assert_true(tile_util.has_right(2))

func test_hasRight_numberSix_shouldBeTrue():
	assert_true(tile_util.has_right(6))
	
func test_hasRight_numberNine_shouldBeFalse():
	assert_false(tile_util.has_right(9))
	
	
func test_hasTop_numberOne_shouldBeTrue():
	assert_true(tile_util.has_top(1))

func test_hasTop_numberEleven_shouldBeTrue():
	assert_true(tile_util.has_top(11))
	
func test_hasTop_numberZero_shouldBeFalse():
	assert_false(tile_util.has_top(0))
	
# ------------------------------------------------------------------------------
# tile INDENTIFIER TESTS
# ------------------------------------------------------------------------------
	
func test_isTerminal_allTerminalCases_shouldBeTrueForAll():
	var all_terminal_tiles = [14, 13, 11, 7] # all tiles with one hole
	for terminal_tile in all_terminal_tiles:
		assert_true(tile_util.is_terminal(terminal_tile), "The number " + str(terminal_tile) + " was mis-identified as non-terminal")
	
func test_isTerminal_allNonTerminalCases_shouldBeFalseForAll():
	var all_terminal_tiles = [14, 13, 11, 7] # all tiles with one hole
	var all_non_terminal_tiles = [0, 1, 2, 3, 4, 5, 8, 9, 10, 12, 15] # all tiles without exactly one hole
	for non_terminal_tile in all_non_terminal_tiles:
		assert_false(tile_util.is_terminal(non_terminal_tile), "The number " + str(non_terminal_tile) + " was mis-identified as terminal")
	
	
func test_isChoice_allChoiceCases_shouldBeTrueForAll():
	var all_choice_tiles = [0, 1, 2, 4, 8] # all tiles with one or less walls
	for choice_tile in all_choice_tiles:
		assert_true(tile_util.is_choice(choice_tile), "The number " + str(choice_tile) + " was mis-identified as non-choice tile.")
	
func test_isChoice_allNonChoiceCases_shouldBeFalseForAll():
	var all_non_choice_tiles = [3, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15] # all tiles with two or more walls
	for non_choice_tile in all_non_choice_tiles:
		assert_false(tile_util.is_choice(non_choice_tile), "The number " + str(non_choice_tile) + " was mis-identified as a choice tile.")
# ------------------------------------------------------------------------------
# VALIDATION FUNCTION TESTS
# ------------------------------------------------------------------------------
	
func test_isValidAdjHorizontal_mutualWall_shouldReturnTrue():
	assert_true(tile_util.is_valid_adj_horizontal(2, 8))
	
func test_isValidAdjHorizontal_mutualNoWall_shouldReturnTrue():
	assert_true(tile_util.is_valid_adj_horizontal(1, 3))
	
func test_isValidAdjHorizontal_wallWithNoWall_shouldReturnFalse():
	assert_false(tile_util.is_valid_adj_horizontal(2, 3))
	

func test_isValidAdjVertical_mutualWall_shouldReturnTrue():
	assert_true(tile_util.is_valid_adj_vertical(4, 1))
	
func test_isValidAdjVertical_mutualNoWall_shouldReturnTrue():
	assert_true(tile_util.is_valid_adj_vertical(10, 6))
	
func test_isValidAdjVertical_wallWithNoWall_shouldReturnFalse():
	assert_false(tile_util.is_valid_adj_vertical(4, 6))

func test_isValidAdjVertical_wallWithNoWallCaseTwo_shouldReturnFalse():
	assert_false(tile_util.is_valid_adj_vertical(13, 12))
