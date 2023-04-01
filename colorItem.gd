class_name colorItem extends baseItem

var color
var force

# color: a Color object that determines what is added
# force: bool that overrides the color instead of multiplying
func _init(name, icon, color, force):
	self.color = color
	self.force = force
	self.displayName = name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _onUse(target):
	if self.force:
		target.reset()
	if self.color:
		target.layerColor(self.color)
