extends CanvasLayer

var lastSpeaker
var f

signal click

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("open")
	await $AnimationPlayer.animation_finished
	f = FileAccess.open("res://opening.txt", FileAccess.READ)
	
	while not f.eof_reached():
		var line = f.get_line().split(":", false, 1)
		print(line)
		if line.size() < 2:
			continue # invalid line, skip
		await writeText(line[0], line[1]).finished
		await self.click
	close()

func writeText(speaker, line):
	var tweener := create_tween()
	$box/Label.text = line
	$box/Label.visible_ratio = 0
	tweener.tween_property($box/Label, "visible_ratio", 1, 3)

	if lastSpeaker != speaker:
		var speakerTweener := create_tween()
		$box/speaker.visible_ratio = 0
		$box/speaker.text = speaker
		speakerTweener.tween_property($box/speaker, "visible_ratio", 1, 1)
	
	lastSpeaker = speaker
	
	return tweener

func close():
	f.close()
	$AnimationPlayer.play_backwards("open")
	$box/speaker.visible = false
	$box/Label.visible = false
	await $AnimationPlayer.animation_finished
	var wipe = constants.fade.instantiate()
	wipe.loadScene(self, "res://scenes/shop.tscn")
	

func _input(event):
	#fancy way of testing for a mouse click
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
		emit_signal("click")
		


func _on_skip_pressed():
	close()
