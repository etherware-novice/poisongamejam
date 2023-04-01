extends Node

var colors = {
		"Red" = Color(2, 0, 0),
		"Orange" = Color(2, 1, 0),
		"Yellow" = Color(2, 2, 0),
		"Green" = Color(0, 2, 0),
		"Blue" = Color(0, 0, 2),
		"Purple" = Color(2, 0, 2),
		"Reset" = -1
	}

var itemId = [
	["Bleach", null, null, true],
	["Red Dye", null, colors["Red"], false],
	["Red Paint", null, colors["Red"], true],
	["Orange Dye", null, colors["Orange"], false],
	["Orange Paint", null, colors["Orange"], true],
	["Yellow Dye", null, colors["Yellow"], false],
	["Yellow Paint", null, colors["Yellow"], true],
	["Green Dye", null, colors["Green"], false],
	["Green Paint", null, colors["Green"], true],
	["Blue Dye", null, colors["Blue"], false],
	["Blue Paint", null, colors["Blue"], true],
	["Purple Dye", null, colors["Purple"], false],
	["Purple Paint", null, colors["Purple"], true],
]

func getItem(id):
	if id > itemId.size() - 1:
		id = 0
	var itemInfo = itemId[id]
	var retr = colorItem.new(itemInfo[0], itemInfo[1], itemInfo[2], itemInfo[3])
	retr.id = id
	return retr
