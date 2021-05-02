extends "res://addons/gut/test.gd"

const UnitUtil = preload("res://util/UnitUtil.gd")

func test_getAbsDirection_westCoordinates_shouldBeWestUnitDirection():
	assert_eq(UnitUtil.get_abs_direction(-1, 0), UnitUtil.UnitDirection.WEST)

func test_getAbsDirection_southCoordinates_shouldBeSouthUnitDirection():
	assert_eq(UnitUtil.get_abs_direction(0, 1), UnitUtil.UnitDirection.SOUTH)
		
func test_getAbsDirection_eastCoordinates_shouldBeEastUnitDirection():
	assert_eq(UnitUtil.get_abs_direction(1, 0), UnitUtil.UnitDirection.EAST)
	
func test_getAbsDirection_northCoordinates_shouldBeNorthUnitDirection():
	assert_eq(UnitUtil.get_abs_direction(0, -1), UnitUtil.UnitDirection.NORTH)
	
func test_getAbsDirection_zeroCooridinate_shouldBeNull():
	assert_eq(UnitUtil.get_abs_direction(0, 0), null)
	

func test_getUnitArray_westUnit_shouldBeExpectArray():
	assert_eq(UnitUtil.get_unit_array(UnitUtil.UnitDirection.WEST), [-1, 0])
	
func test_getUnitArray_southUnit_shouldBeExpectArray():
	assert_eq(UnitUtil.get_unit_array(UnitUtil.UnitDirection.SOUTH), [0, 1])
	
func test_getUnitArray_eastUnit_shouldBeExpectArray():
	assert_eq(UnitUtil.get_unit_array(UnitUtil.UnitDirection.EAST), [1, 0])
	
func test_getUnitArray_northUnit_shouldBeExpectArray():
	assert_eq(UnitUtil.get_unit_array(UnitUtil.UnitDirection.NORTH), [0, -1])


func test_getUnitVector_westUnit_shouldBeExpectedVector():
	assert_eq(UnitUtil.get_unit_vector(UnitUtil.UnitDirection.WEST), Vector2.LEFT)
	
func test_getUnitVector_southUnit_shouldBeExpectedVector():
	assert_eq(UnitUtil.get_unit_vector(UnitUtil.UnitDirection.SOUTH), Vector2.DOWN)
	
func test_getUnitVector_eastUnit_shouldBeExpectedVector():
	assert_eq(UnitUtil.get_unit_vector(UnitUtil.UnitDirection.EAST), Vector2.RIGHT)
	
func test_getUnitVector_northUnit_shouldBeExpectedVector():
	assert_eq(UnitUtil.get_unit_vector(UnitUtil.UnitDirection.NORTH), Vector2.UP)
	
	
func test_getUnitDirectionWeight_northUnit_shouldBeEight():
	assert_eq(UnitUtil.get_unit_direction_weight(UnitUtil.UnitDirection.WEST), 8)

func test_getUnitDirectionWeight_southUnit_shouldBeFour():
	assert_eq(UnitUtil.get_unit_direction_weight(UnitUtil.UnitDirection.SOUTH), 4)	

func test_getUnitDirectionWeight_eastUnit_shouldBeTwo():
	assert_eq(UnitUtil.get_unit_direction_weight(UnitUtil.UnitDirection.EAST), 2)	

func test_getUnitDirectionWeight_westUnit_shouldBeOne():
	assert_eq(UnitUtil.get_unit_direction_weight(UnitUtil.UnitDirection.NORTH), 1)	
	
	
func test_opposite_westUnit_shouldReturnEast():
	assert_eq(UnitUtil.opposite(UnitUtil.UnitDirection.WEST), UnitUtil.UnitDirection.EAST)

func test_opposite_southUnit_shouldReturnNorth():
	assert_eq(UnitUtil.opposite(UnitUtil.UnitDirection.SOUTH), UnitUtil.UnitDirection.NORTH)
	
func test_opposite_eastUnit_shouldReturnWest():
	assert_eq(UnitUtil.opposite(UnitUtil.UnitDirection.EAST), UnitUtil.UnitDirection.WEST)
	
func test_opposite_northUnit_shouldReturnSouth():
	assert_eq(UnitUtil.opposite(UnitUtil.UnitDirection.NORTH), UnitUtil.UnitDirection.SOUTH)


func test_getAbsoluteFromRelative_allDirectionsWithNorth_shouldReturnSameValue():
	var north = UnitUtil.UnitDirection.NORTH
	var others = 	[UnitUtil.UnitDirection.NORTH, 
					UnitUtil.UnitDirection.EAST, 
					UnitUtil.UnitDirection.SOUTH, 
					UnitUtil.UnitDirection.WEST]
	for other in others:
		var found = UnitUtil.get_absolute_from_relative(north, other)
		assert_eq(found, other)
		
func test_getAbsoluteFromRelative_allDirectionsWithEast_shouldReturnClockwiseByNinety():
	var east = UnitUtil.UnitDirection.EAST
	var others = 	[UnitUtil.UnitDirection.NORTH, 
					UnitUtil.UnitDirection.EAST, 
					UnitUtil.UnitDirection.SOUTH, 
					UnitUtil.UnitDirection.WEST]
	var expected = [UnitUtil.UnitDirection.EAST, 
					UnitUtil.UnitDirection.SOUTH, 
					UnitUtil.UnitDirection.WEST, 
					UnitUtil.UnitDirection.NORTH]
	for i in range(4):
		var other = others[i]
		var found = UnitUtil.get_absolute_from_relative(east, other)
		assert_eq(found, expected[i])
		
func test_getAbsoluteFromRelative_allDirectionsWithSouth_shouldReturnByOneEighty():
	var south = UnitUtil.UnitDirection.SOUTH
	var others = 	[UnitUtil.UnitDirection.NORTH, 
					UnitUtil.UnitDirection.EAST, 
					UnitUtil.UnitDirection.SOUTH, 
					UnitUtil.UnitDirection.WEST]
	var expected = [UnitUtil.UnitDirection.SOUTH, 
					UnitUtil.UnitDirection.WEST, 
					UnitUtil.UnitDirection.NORTH, 
					UnitUtil.UnitDirection.EAST]
	for i in range(4):
		var other = others[i]
		var found = UnitUtil.get_absolute_from_relative(south, other)
		assert_eq(found, expected[i])
		
func test_getAbsoluteFromRelative_allDirectionsWithWest_shouldReturnAntiClockwiseByNinety():
	var east = UnitUtil.UnitDirection.WEST
	var others = 	[UnitUtil.UnitDirection.NORTH, 
					UnitUtil.UnitDirection.EAST, 
					UnitUtil.UnitDirection.SOUTH, 
					UnitUtil.UnitDirection.WEST]
	var expected = [UnitUtil.UnitDirection.WEST, 
					UnitUtil.UnitDirection.NORTH, 
					UnitUtil.UnitDirection.EAST, 
					UnitUtil.UnitDirection.SOUTH]
	for i in range(4):
		var other = others[i]
		var found = UnitUtil.get_absolute_from_relative(east, other)
		assert_eq(found, expected[i])
