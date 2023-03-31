extends AnimatedSprite2D

var currentColor = Color(1, 1, 1)
var layers = 0

func layerColor(mColor):
	layers += 1
	currentColor += mColor
	modulate = ( currentColor / layers) * 1.5
	print(modulate)

func reset():
	layers = 0
	currentColor = Color(1, 1, 1)
	modulate = currentColor
