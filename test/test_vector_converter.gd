extends "res://addons/gut/test.gd"

const Converter = preload("res://util/VectorConverter.gd")

const TEST_DICT = {
	Vector2(0,0) : 11, Vector2(1,0) : 15, Vector2(2,0) : 11,
	Vector2(0,1) : 8, Vector2(1,1) : 5, Vector2(2,1) : 2,
	Vector2(0,2) : 14, Vector2(1,2) : 13, Vector2(2,2) : 6
}

const TEST_ARRAY = [[11, 15, 11], [8, 5, 2], [14, 13, 6]]

const TEST_DICTONARY_MIXED = {
	Vector2(0,1) : 11, Vector2(1,1) : 15,
	Vector2(0,0) : 8, Vector2(1,0) : 5
}

const TEST_ARRAY_MIXED = [[8, 5], [11, 15]]

const TEST_DICT_RECT = {
	Vector2(0,0) : 8, Vector2(1,0) : 5, Vector2(2, 0) : 2,
	Vector2(0, 1) : 11, Vector2(1,1) : 15, Vector2(2,1) : 9
}

const TEST_ARRAY_RECT = [[8, 5, 2], [11, 15, 9]]

func test_dictToArray_inputDict_shouldMatchTestArray():
	var expected = Converter.dict_to_array(TEST_DICT)
	assert_eq(expected, TEST_ARRAY)

func test_arrayToDict_inputArray_shouldMatchTestDict():
	var expected = Converter.array_to_dict(TEST_ARRAY)
	assert_eq_shallow(expected, TEST_DICT)

func test_dictToArray_mixedDict_shouldMatchTestArray():
	var expected = Converter.dict_to_array(TEST_DICTONARY_MIXED)
	assert_eq(expected, TEST_ARRAY_MIXED)

func test_arrayToDict_mixedArray_shouldMatchMixedDict():
	var expected = Converter.array_to_dict(TEST_ARRAY_MIXED)
	assert_eq_shallow(expected, TEST_DICTONARY_MIXED)
	
func test_arrayToDict_rectArray_shouldMatchRectDict():
	var expected = Converter.array_to_dict(TEST_ARRAY_RECT)
	assert_eq_shallow(expected, TEST_DICT_RECT)
	
func test_dictToArray_rectDict_shouldMatchRectArray():
	var expected = Converter.dict_to_array(TEST_DICT_RECT)
	assert_eq_shallow(expected, TEST_ARRAY_RECT)
