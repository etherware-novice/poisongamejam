class_name colorItem extends "res://scripts/baseItem.gd"


# color: a Color object that determines what is added
# force: bool that overrides the color instead of multiplying
func _init(name, icon, color, force):
	self.name = name
	self.icon = icon
	self.color = color
	self.force = force

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _onUse(target):
	if self.force:
		target.reset()
	if self.color:
		target.layerColor(self.color)
