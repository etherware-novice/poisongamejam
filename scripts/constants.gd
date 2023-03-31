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
	colorItem.new("Bleach", null, null, true),
	colorItem.new("Red Dye", null, colors["Red"], false),
	colorItem.new("Red Paint", null, colors["Red"], true),
	colorItem.new("Orange Dye", null, colors["Orange"], false),
	colorItem.new("Orange Paint", null, colors["Orange"], true),
	colorItem.new("Yellow Dye", null, colors["Yellow"], false),
	colorItem.new("Yellow Paint", null, colors["Yellow"], true),
	colorItem.new("Green Dye", null, colors["Green"], false),
	colorItem.new("Green Paint", null, colors["Green"], true),
	colorItem.new("Blue Dye", null, colors["Blue"], false),
	colorItem.new("Blue Paint", null, colors["Blue"], true),
	colorItem.new("Purple Dye", null, colors["Purple"], false),
	colorItem.new("Purple Paint", null, colors["Purple"], true),
]

func getItem(id):
	if id > itemId.size() - 1:
		id = 0
	return itemId[id].duplicate()
