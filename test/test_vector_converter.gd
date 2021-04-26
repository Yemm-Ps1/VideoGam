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

const VECTOR_ARRAY = [4, 5]
const ARRAY_VECTOR = Vector2(4, 5)

var tile_map
var mixed_tile_map
var rect_tile_map

func before_all():
	tile_map = Converter.array_to_tilemap(ARRAY)
	mixed_tile_map = Converter.array_to_tilemap(ARRAY_MIXED)
	rect_tile_map = Converter.array_to_tilemap(ARRAY_RECT)


###				###
###  STANDARD 	###
### 			###
func test_dictToArray_inputDict_shouldMatchArray():
	assert_eq(Converter.dict_to_array(DICT), ARRAY)

func test_arrayToDict_inputArray_shouldMatchDict():
	assert_eq_shallow(Converter.array_to_dict(ARRAY), DICT)


###			###
###  MIXED 	###
### 		###
func test_dictToArray_mixedDict_shouldMatchMixedArray():
	assert_eq(Converter.dict_to_array(DICT_MIXED), ARRAY_MIXED)

func test_arrayToDict_mixedArray_shouldMatchMixedDict():
	assert_eq_shallow(Converter.array_to_dict(ARRAY_MIXED), DICT_MIXED)


###			###
###   RECT  ###
### 		###
func test_dictToArray_rectDict_shouldMatchRectArray():
	assert_eq(Converter.dict_to_array(DICT_RECT), ARRAY_RECT)

func test_arrayToDict_rectArray_shouldMatchRectDict():
	assert_eq_shallow(Converter.array_to_dict(ARRAY_RECT), DICT_RECT)


###				###
###  TILE MAP 	###
### 			###
func test_tileMapToArray_tileMap_shouldMatchArray():
	assert_eq(Converter.tilemap_to_array(tile_map), ARRAY)

func test_tileMapToArray_tileMap_shouldMatchMixedArray():
	assert_eq(Converter.tilemap_to_array(mixed_tile_map), ARRAY_MIXED)

func test_tileMapToArray_tileMap_shouldMatchRectArray():
	assert_eq(Converter.tilemap_to_array(rect_tile_map), ARRAY_RECT)


###					###
### ARRAY TO VECTOR ###
### 				###
func test_arrayToVector2_vectorArray_shouldMatchVector2():
	assert_eq(Converter.array_to_vector2(VECTOR_ARRAY), ARRAY_VECTOR)

func test_vector2ToArray_arrayVector_shouldMatchArray():
	assert_eq(Converter.vector2_to_array(ARRAY_VECTOR), VECTOR_ARRAY)
