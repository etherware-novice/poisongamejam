extends Node

# first entry is which entry this will become when red is addded, then green, blue
var colorsMixIndex = [
	[1, 4, 6], 	# white -> 	red, green, blue
	[2, 8, 7],	# red ->	orange, brown, violet
	[1, 3, 8],	# orange ->	red, yellow, brown
	[2, 4, 4],	# yellow -> orange, green, green
	[8, 4, 5],	# green -> 	brown, green, greenblue
	[8, 4, 6],	# grblue ->	brown, green, blue
	[7, 4, 6],	# blue ->	violet, green, greenblue
	[1, 8, 6],	# violet ->	red, brown, blue
	[1, 4, 6]	# brown ->	red, green, blue
]

func colorMixIndex(current, rgbindex):
	if rgbindex > 2:
		return 0
	return colorsMixIndex[current][rgbindex]
	
var colorID = [
	"White", "Red", "Orange", "Yellow", "Green", "GreenBlue", "Blue", "Violet",
	"Brown"
]

var renderColor = [
	Color(1, 1, 1), Color.RED, Color.ORANGE, Color.YELLOW, Color.GREEN, Color.LIGHT_SEA_GREEN, 
	Color.BLUE, Color.DARK_VIOLET, Color.BROWN
]
