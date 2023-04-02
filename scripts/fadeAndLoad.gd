extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func loadScene(root, scene):
	print("loading " + scene)
	
	root.add_child(self)
	$AnimationPlayer.play("up")
	await $AnimationPlayer.animation_finished
	var tree = get_tree()
	tree.change_scene_to_file(scene)
	$AnimationPlayer.play("up", -1, 1.0, true)
	print("selfdel")
	queue_free()
