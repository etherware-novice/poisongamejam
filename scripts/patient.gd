extends AnimatedSprite2D

var curColor = 0
var goalColor = 1

signal complete
signal skipped

func _ready():
	play("human")
	return


func layerColor(mColor):
	curColor = constants.colorMixIndex(curColor, mColor)
	checkComplete()

func reset():
	curColor = 0
	checkComplete()

func checkComplete():
	modulate = constants.renderColor[curColor]
	if curColor == goalColor:
		emit_signal("complete")

func skip():
	emit_signal("skipped")
