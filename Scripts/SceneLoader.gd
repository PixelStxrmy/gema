extends Node




func load_scene(new_scene_path: String, old_scene: Node) -> void:
	var new_scene = load(new_scene_path).instantiate()

	# Ensure the old scene is a child of Global.main before removing it
	if  old_scene.get_parent() == Global.main:
		Global.main.remove_child(old_scene)
		old_scene.queue_free()  # Properly frees the old scene

	# Add the new scene to Global.main
	Global.main.add_child(new_scene)
