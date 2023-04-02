extends Node

# red dye, green dye, blue dye, bleach, skips
var inventory = [2, 2, 2, 1, 10]
var cutsceneLock
var bank = 40

signal usedItem(index)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func useItem(index):
	inventory[index] = inventory[index] - 1
	usedItem.emit(index)
