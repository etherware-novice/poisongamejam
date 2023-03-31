extends ItemList


func _ready():
	for x in constants.colors.keys():
		add_item(x)

func _on_item_clicked(index, at_position, mouse_button_index):
	var resolved = constants.colors[constants.colors.keys()[index]]
	if resolved is Color:
		$"../patient".layerColor(resolved)
	else:
		$"../patient".reset()
