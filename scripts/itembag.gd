extends ItemList

var itemNames = ["Red Dye", "Green Dye", "Blue Dye", "Bleach"]

func _ready():
	for x in range(player.inventory.size()):
		add_item(itemNames[x] + " (" + str(player.inventory[x]) + ")")

func _on_item_clicked(index, at_position, mouse_button_index):
	$"../patient".layerColor(index)
