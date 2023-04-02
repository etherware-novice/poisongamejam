extends ItemList


func _ready():
	for x in range(player.inventory.size()):
		add_item(constants.itemNames[x] + " (" + str(player.inventory[x]) + ")")
	player.usedItem.connect(updateText)

func _on_item_clicked(index, at_position, mouse_button_index):
	if player.cutsceneLock or is_item_disabled(index):
		return
	if index == 4:
		$"../patient".skip()
	else:
		$"../patient".layerColor(index)
	player.useItem(index)

func updateText(index):
	if player.inventory[index] <= 0:
		set_item_text(index, constants.itemNames[index])
		set_item_disabled(index, true)
		return
	set_item_text(index, constants.itemNames[index] + " (" + str(player.inventory[index]) + ")")
