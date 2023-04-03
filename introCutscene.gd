extends CanvasLayer

var lastSpeaker
var f

signal click


var dialogue = [
	[null, "BEEP"],
	["Automated Voice", "Playing back tape.."],
	["Boss", "Hello, and welcome to your new job at the poison hospital!"],
	["Boss", "We are so happy that you chose us over the thousands of other jobs."],
	["Boss", "Unfortunately, due to workplace policy, I am unable to meet in person today.."],
	["Boss", "or ever."],
	["Boss", "But, we have provided a tape player to recieve messages."],
	["Boss", "We here have been authorized to use an experimental treatment method, known as Saubitacolmical Treatment."],
	["Boss", "It involves using colored.. poisons to treat the guests."],
	["Boss", "While yes, it does have a 98% mortality rate, we do get a lot of money for it."],
	["Boss", "So get out there, and good luck!"],
	["Boss", "Also, do stop at the company shop on your way there to buy new vials. We don't provide any."],
	[null, "BEEP"],
	["Automated Voice", "Shift starts in"],
	["Automated Voice", "5 Minutes"],
	[null, "BEEP"]
]


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("open")
	await $AnimationPlayer.animation_finished
	
	for line in dialogue:
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
