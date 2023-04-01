extends Node

var inventory = {}
var defaultInventorty = {
	0: 1,
	1: 5,
	3: 5,
	5: 5,
	7: 5,
	9: 5,
	11: 5,
	12: 1
}

# Called when the node enters the scene tree for the first time.
func _ready():
	resetInventory()

func resetInventory():
	inventory = {}
	for x in defaultInventorty.keys():
		inventory[constants.getItem(x)] = defaultInventorty[x]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
