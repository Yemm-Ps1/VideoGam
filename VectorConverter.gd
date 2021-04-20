extends Node


var test_dictonary = {
	Vector2(0,0) : 11, Vector2(1,0) : 15, Vector2(2,0) : 11,
	Vector2(0,1) : 8, Vector2(1,1) : 5, Vector2(2,1) : 2,
	Vector2(0,2) : 14, Vector2(1,2) : 13, Vector2(2,2) : 6
}



var test_dictonary_big_mixed = {
	Vector2(0, 0):11, Vector2(0, 1):10, Vector2(0, 10):10, Vector2(0, 11):12, Vector2(0, 2):10, Vector2(0, 3):10, Vector2(0, 4):10, Vector2(0, 5):12, Vector2(0, 7):10, Vector2(0, 8):8, Vector2(0, 9):10, Vector2(1, 1):8, Vector2(1, 11):5, Vector2(1, 2):12, Vector2(1, 3):9, Vector2(1, 4):10, Vector2(1, 5):6, Vector2(1, 6):9, Vector2(1, 7):10, Vector2(1, 8):6, Vector2(1, 9):9, Vector2(10, 0):5, Vector2(10, 1):9, Vector2(10, 10):5, Vector2(10, 2):12, Vector2(10, 3):5, Vector2(10, 4):9, Vector2(10, 5):6, Vector2(10, 7):9, Vector2(10, 8):12, Vector2(10, 9):5, Vector2(11, 0):5, Vector2(11, 1):5, Vector2(11, 10):3, Vector2(11, 11):12, Vector2(11, 2):1, Vector2(11, 3):6, Vector2(11, 4):5, Vector2(11, 5):9, Vector2(11, 6):6, Vector2(11, 7):5, Vector2(11, 8):5, Vector2(11, 9):5, Vector2(12, 0):5, Vector2(12, 1):5, Vector2(12, 10):9, Vector2(12, 11):4, Vector2(12, 3):9, Vector2(12, 4):6, Vector2(12, 5):1, Vector2(12, 6):10, Vector2(12, 7):6, Vector2(12, 8):5, Vector2(12, 9):5, Vector2(13, 1):5, Vector2(13, 10):5, Vector2(13, 11):5, Vector2(13, 2):9, Vector2(13, 3):6, Vector2(13, 4):9, Vector2(13, 5):6, Vector2(13, 6):9, Vector2(13, 7):12, Vector2(13, 8):3, Vector2(13, 9):6, Vector2(14, 0):9, Vector2(14, 1):6, Vector2(14, 10):6, Vector2(14, 2):5, Vector2(14, 4):5, Vector2(14, 5):9, Vector2(14, 6):6, Vector2(14, 7):3, Vector2(14, 8):12, Vector2(14, 9):9, Vector2(15, 0):1, Vector2(15, 1):10, Vector2(15, 10):10, Vector2(15, 11):12, Vector2(15, 2):6, Vector2(15, 3):3, Vector2(15, 4):6, Vector2(15, 5):1, Vector2(15, 6):10, Vector2(15, 7):12, Vector2(15, 8):5, Vector2(15, 9):3, Vector2(16, 0):3, Vector2(16, 1):10, Vector2(16, 10):10, Vector2(16, 11):4, Vector2(16, 2):10, Vector2(16, 3):10, Vector2(16, 4):12, Vector2(16, 5):5, Vector2(16, 6):9, Vector2(16, 7):6, Vector2(16, 8):3, Vector2(16, 9):10, Vector2(17, 0):9, Vector2(17, 1):10, Vector2(17, 11):5, Vector2(17, 2):10, Vector2(17, 4):5, Vector2(17, 6):5, Vector2(17, 7):9, Vector2(17, 8):10, Vector2(17, 9):10, Vector2(18, 0):1, Vector2(18, 1):10, Vector2(18, 10):12, Vector2(18, 11):5, Vector2(18, 2):12, Vector2(18, 3):9, Vector2(18, 4):6, Vector2(18, 5):9, Vector2(18, 6):6, Vector2(18, 7):5, Vector2(18, 8):9, Vector2(18, 9):10, Vector2(19, 0):3, Vector2(19, 10):3, Vector2(19, 11):6, Vector2(19, 2):3, Vector2(19, 3):2, Vector2(19, 4):10, Vector2(19, 5):6, Vector2(19, 7):2, Vector2(19, 8):2, Vector2(2, 0):9, Vector2(2, 1):6, Vector2(2, 10):10, Vector2(2, 11):6, Vector2(2, 3):5, Vector2(2, 5):10, Vector2(2, 6):0, Vector2(2, 7):12, Vector2(2, 9):1, Vector2(3, 0):1, Vector2(3, 1):10, Vector2(3, 10):9, Vector2(3, 11):12, Vector2(3, 2):12, Vector2(3, 3):3, Vector2(3, 4):10, Vector2(3, 5):12, Vector2(3, 6):5, Vector2(3, 7):5, Vector2(3, 8):3, Vector2(3, 9):6, Vector2(4, 0):1, Vector2(4, 10):6, Vector2(4, 11):5, Vector2(4, 2):1, Vector2(4, 3):12, Vector2(4, 5):5, Vector2(4, 6):5, Vector2(4, 7):3, Vector2(4, 8):12, Vector2(4, 9):9, Vector2(5, 1):9, Vector2(5, 11):5, Vector2(5, 2):6, Vector2(5, 3):3, Vector2(5, 4):6, Vector2(5, 5):5, Vector2(5, 7):9, Vector2(5, 8):6, Vector2(5, 9):5, Vector2(6, 0):9, Vector2(6, 1):6, Vector2(6, 10):5, Vector2(6, 11):5, Vector2(6, 2):9, Vector2(6, 3):10, Vector2(6, 4):12, Vector2(6, 5):3, Vector2(6, 6):12, Vector2(6, 7):1, Vector2(6, 8):10, Vector2(6, 9):6, Vector2(7, 0):1, Vector2(7, 1):10, Vector2(7, 10):4, Vector2(7, 11):5, Vector2(7, 2):6, Vector2(7, 3):9, Vector2(7, 4):4, Vector2(7, 6):5, Vector2(7, 7):3, Vector2(7, 8):12, Vector2(7, 9):9, Vector2(8, 0):5, Vector2(8, 11):5, Vector2(8, 2):12, Vector2(8, 3):5, Vector2(8, 4):1, Vector2(8, 5):6, Vector2(8, 6):3, Vector2(8, 7):12, Vector2(8, 8):5, Vector2(8, 9):5, Vector2(9, 0):1, Vector2(9, 1):10, Vector2(9, 10):9, Vector2(9, 11):4, Vector2(9, 2):6, Vector2(9, 3):5, Vector2(9, 5):9, Vector2(9, 6):10, Vector2(9, 7):6, Vector2(9, 8):3, Vector2(9, 9):4
}



func dict_to_array(dict: Dictionary):
	var to_rtn = []
	var sorted = dict.keys().sort_custom(self, "sort_clockwise")
	var first = sorted[0]
	var last = sorted[-1]
	var width = abs(first.x - last.x)+1
	var height = abs(first.y - last.y)+1
	for x in range(width):
		to_rtn.append([])
		for y in range(height):
			to_rtn[x].append(0)
			
	for i in dict.keys():
		to_rtn[i.y][i.x] = dict[i]
	return to_rtn
	
func array_to_dict(arr: Array):
	var to_rtn = {}
	var width = len(arr[0])
	var height = len(arr)
	for y in range(height):
		for x in range(width):
			to_rtn[Vector2(x,y)] = arr[y][x]
	return to_rtn


func _ready():
	print(array_to_dict(test_array))
	print(test_dictonary)
	print(dict_to_array(test_dictonary))
	print(test_array)
	
	#print(array_to_dict(test_array))
