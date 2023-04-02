extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("start")
	await $AnimationPlayer.animation_finished
	$startButton.pressed.connect(_on_start_button_pressed)


func _on_start_button_pressed():
	var wipe = constants.fade.instantiate()
	wipe.loadScene(self, "res://scenes/main_game_loop.tscn")
