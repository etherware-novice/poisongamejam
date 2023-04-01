extends AnimatedSprite2D

var curColor = 0
var goalColor = 1

signal complete

func _ready():
	return


func layerColor(mColor):
	curColor = constants.colorMixIndex(curColor, mColor)
	checkComplete()

func reset():
	curColor = 0
	checkComplete()


func checkComplete():
	modulate = constants.renderColor[curColor] * 1.5
	if curColor == goalColor:
		emit_signal("complete")
