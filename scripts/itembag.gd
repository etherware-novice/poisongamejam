extends ItemList

var constants = preload("res://scripts/constants.gd").new()

func _ready():
	for x in constants.colorids.keys():
		add_item(x)

func _on_item_clicked(index, at_position, mouse_button_index):
	var resolved = constants.colorids[constants.colorids.keys()[index]]
	if resolved is Color:
		$"../patient".layerColor(resolved)
	else:
		$"../patient".reset()
