extends ItemList

var itemCost = [10, 10, 10, 50, 200]
var dyeStack = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	player.cutsceneLock = false
	for x in range(player.inventory.size()):
		add_item(constants.itemNames[x] + " (" + str(itemCost[x]) + ")")
	updateGold()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseMotion:
		var mousepos = get_viewport().get_mouse_position() - position
		var index = get_item_at_position(mousepos, true)
		if index == -1:
			$"../listCurItemAmt".clear()
			return
		$"../listCurItemAmt".setItemIndex(index)

func _on_item_clicked(index, at_position, mouse_button_index):
	var multiple = 1
	updateGold()
	if player.cutsceneLock or is_item_disabled(index):
		return
	if index < 3:
		multiple = dyeStack
	
	player.bank -= itemCost[index]
	
	player.inventory[index] = player.inventory[index] + multiple
	$"../listCurItemAmt".setItemIndex(index)

func updateGold():
	$"../bank".text = str(player.bank) + " gold"
	for x in range(player.inventory.size()):
		set_item_disabled(x, player.bank < itemCost[x])  # the comp returns a bool


func _on_stopshop_pressed():
	get_tree().change_scene_to_file("res://scenes/main_game_loop.tscn")