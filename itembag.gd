extends ItemList

func _on_item_clicked(index, at_position, mouse_button_index):
	$"../patient".layerColor(1, 0, 0)
