static func dict_to_array(inputDict: Dictionary):
	var to_rtn = []
	var keys = inputDict.keys()
	keys.sort()
	var first = keys[0]
	var last = keys[-1]
	var width = last.x - first.x + 1
	var height = last.y - first.y + 1
	for y in range(height):
		var row = []
		for x in range(width):
			row.append(-1)
		to_rtn.append(row)
	for k in keys:
		to_rtn[int(k.y)][int(k.x)] = inputDict[k]
	return to_rtn


static func array_to_dict(arr: Array):
	var to_rtn = {}
	var width = len(arr[0])
	var height = len(arr)
	for y in range(height):
		for x in range(width):
			to_rtn[Vector2(x,y)] = arr[y][x]
	return to_rtn

static func array_to_tilemap(arr: Array):
	var to_rtn = TileMap.new()
	for y in range(len(arr)):
		for x in range(len(arr[0])):
			to_rtn.set_cell(x, y, arr[y][x])
	return to_rtn

static func tilemap_to_array(tile_map: TileMap):
	var to_rtn = []
	var keys = tile_map.get_used_cells()
	var first = keys[0]
	var last = keys[-1]
	var width = last.x - first.x + 1
	var height = last.y - first.y + 1
	for y in range(height):
		var row = []
		for x in range(width):
			row.append(-1)
		to_rtn.append(row)
	for k in keys:
		to_rtn[int(k.y)][int(k.x)] = tile_map.get_cell(k.x, k.y)
	return to_rtn
