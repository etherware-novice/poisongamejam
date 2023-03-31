extends AnimatedSprite2D

# 0 - 255
var red = 1
var green = 1
var blue = 1

func layerColor(r, g, b):
	red += r
	green += g
	blue += b
	
	modulate = Color(red, green, blue)
