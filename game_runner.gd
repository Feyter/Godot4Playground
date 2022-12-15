extends Node
class_name GameRunner

# returns the currently loaded level
func get_current_level() -> Node:
	return get_tree().current_scene
