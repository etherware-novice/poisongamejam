extends CenterContainer


func clear():
	$MarginContainer/VSplit/name.text = ""
	$MarginContainer/VSplit/amt.text = ""

func setItemIndex(index):
	$MarginContainer/VSplit/name.text = constants.itemNames[index]
	$MarginContainer/VSplit/amt.text = str(player.inventory[index])
