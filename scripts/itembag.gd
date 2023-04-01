extends ItemList


func _ready():
	await get_tree().create_timer(2).timeout
	for x in player.inventory.keys():
		add_item(x.displayName)

func _on_item_clicked(index, at_position, mouse_button_index):
	var itemIndex = player.inventory.keys()[index]
	itemIndex._onUse($"../patient")
