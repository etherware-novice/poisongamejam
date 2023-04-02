extends Node

# red dye, green dye, blue dye, bleach, skips
var inventory = [5, 5, 5, 1, 3]
var cutsceneLock
var bank = 50

signal usedItem(index)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func useItem(index):
	inventory[index] = inventory[index] - 1
	usedItem.emit(index)
