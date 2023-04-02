extends AnimatedSprite2D

var hoursLeft = 12  # 120 seconds (2 mins)

signal timeUp

# Called when the node enters the scene tree for the first time.
func _ready():
	play(str(hoursLeft))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hour_tick_timeout():
	hoursLeft -= 1
	animation = str(hoursLeft)
	if hoursLeft < 1:
		timeUp.emit()
