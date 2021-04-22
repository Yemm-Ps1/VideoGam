extends "res://addons/gut/test.gd"

const Converter = preload("res://util/VectorConverter.gd")

const DICT = {
	Vector2(0,0) : 11, Vector2(1,0) : 15, Vector2(2,0) : 11,
	Vector2(0,1) : 8, Vector2(1,1) : 5, Vector2(2,1) : 2,
	Vector2(0,2) : 14, Vector2(1,2) : 13, Vector2(2,2) : 6
}

const ARRAY = [[11, 15, 11], [8, 5, 2], [14, 13, 6]]

const DICT_MIXED = {
	Vector2(0,1) : 11, Vector2(1,1) : 15,
	Vector2(0,0) : 8, Vector2(1,0) : 5
}

const ARRAY_MIXED = [[8, 5], [11, 15]]

const DICT_RECT = {
	Vector2(0,0) : 8, Vector2(1,0) : 5, Vector2(2, 0) : 2,
	Vector2(0, 1) : 11, Vector2(1,1) : 15, Vector2(2,1) : 9
}

const ARRAY_RECT = [[8, 5, 2], [11, 15, 9]]

func test_dictToArray_inputDict_shouldMatchTestArray():
	assert_eq(Converter.dict_to_array(DICT), ARRAY)

func test_arrayToDict_inputArray_shouldMatchTestDict():
	assert_eq_shallow(Converter.array_to_dict(ARRAY), DICT)

func test_dictToArray_mixedDict_shouldMatchTestArray():
	assert_eq(Converter.dict_to_array(DICT_MIXED), ARRAY_MIXED)

func test_arrayToDict_mixedArray_shouldMatchMixedDict():
	assert_eq_shallow(Converter.array_to_dict(ARRAY_MIXED), DICT_MIXED)
	
func test_dictToArray_rectDict_shouldMatchRectArray():
	assert_eq(Converter.dict_to_array(DICT_RECT), ARRAY_RECT)

func test_arrayToDict_rectArray_shouldMatchRectDict():
	assert_eq_shallow(Converter.array_to_dict(ARRAY_RECT), DICT_RECT)
