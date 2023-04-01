class_name baseItem extends Node

var displayName
var icon
var id

func _init(name, icon):
	self.displayName = name
	self.icon = icon
	self.id = 0

func _onUse(target):
	pass
