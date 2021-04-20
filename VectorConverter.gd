extends Node


var test_dictonary = {
	Vector2(0,0) : 11, Vector2(1,0) : 15, Vector2(2,0) : 11,
	Vector2(0,1) : 8, Vector2(1,1) : 5, Vector2(2,1) : 2,
	Vector2(0,2) : 14, Vector2(1,2) : 13, Vector2(2,2) : 6
}

var test_array = [[11, 15, 11], [8, 5, 2], [14, 13, 6]]


func dict_to_array(dict: Dictionary):
	var to_rtn = []
	dict.keys().sort()
	var first = dict.keys()[0]
	var last = dict.keys()[-1]
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
