extends Node2D


func _ready():
	player.usedItem.connect(checkEmptyInventory)
	startRound()

func startRound():
	player.cutsceneLock = false
	randomize()
	var startingColor = randi() % constants.colorID.size()
	var goalColor = startingColor
	while goalColor == startingColor:
		goalColor = randi() % constants.colorID.size()
	
	$patient.curColor = startingColor
	$patient.goalColor = goalColor
	$patient.checkComplete()
	
	$status.text = "Get " + constants.colorID[goalColor]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_patient_complete():
	player.cutsceneLock = true
	print("you did it")
	$status.text = "Good Job!"
	await get_tree().create_timer(3).timeout
	startRound()


func _on_patient_skipped():
	player.cutsceneLock = true
	$status.text = "Skipping.."
	await get_tree().create_timer(3).timeout
	startRound()

func checkEmptyInventory(_x):
	if player.inventory.slice(0, 3).max() < 1:
		$status.text = "Out of items!"
		endDay()

func endDay():
	player.cutsceneLock = true
	get_tree().change_scene_to_file("res://scenes/shop.tscn")
