extends "res://addons/gut/test.gd"

const GridUtil = preload("res://util/GridUtil.gd")
var small_grid = []
var tiny_empty_grid = []

func before_all():
	small_grid = [[11, 15, 11], [8, 5, 2], [14, 13, 6]]
	tiny_empty_grid = [[9, 3], [12, 6]]
	
	
func test_isTerminal_smallGridtopRightCorner_shouldBeTrue():
	assert_true(GridUtil.is_terminal(small_grid, 0, 0), "The top right corner was not terminal.")
	
func test_isTerminal_smallGridmiddleTile_shouldBeFalse():
	assert_false(GridUtil.is_terminal(small_grid, 1, 1), "The middle title was incorrectly terminal.")
	
func test_getTerminals_smallGrid_shouldContainAllTerminals():
	var expected_terminals = [[0, 0], [0, 2], [1, 2], [2, 0]]
	var found_terminals = GridUtil.get_terminals(small_grid)
	for t in expected_terminals:
		assert_has(found_terminals, t)

func test_validate_validTinyEmptyGrid_shouldReturnTrue():
	assert_true(GridUtil.validate(tiny_empty_grid))

func test_validate_validSmallGrid_shouldReturnTrue():
	assert_true(GridUtil.validate(small_grid))

func test_validate_invalidHorizontalBorderGrid_shouldReturnFalse():
	var invalid_horizontal_border_grid = [[1, 3], [12, 6]]
	assert_false(GridUtil.validate(invalid_horizontal_border_grid))
	
func test_validate_invalidVerticalBorderGrid_shouldReturnFalse():
	var invalid_vertical_border_grid = [[9, 3], [12, 2]]
	assert_false(GridUtil.validate(invalid_vertical_border_grid))

func test_validate_invalidHorizontalPair_shouldReturnFalse():
	var invalid_horizontal_pair_grid = [[11, 3], [12, 6]]
	assert_false(GridUtil.validate(invalid_horizontal_pair_grid))

func test_validate_invalidVerticalPair_shouldReturnFalse():
	var invalid_vertical_pair_grid = [[13, 3], [12, 6]]
	assert_false(GridUtil.validate(invalid_vertical_pair_grid))

	
