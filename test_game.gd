extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$GameAnimation.play("Cam_StartPoint", 0.5)
	$CubeSpawnPoint/CubeSpawnPointMove.play("CubeSpawnPointMove")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# reset the world
func _on_main_select_go_reset():
	get_tree().change_scene_to_file("res://test_game.tscn")


func _on_main_select_go_canon():
	$GameAnimation.play("Cam_CanonPosition", 0.5)


func _on_main_select_go_start():
	$GameAnimation.play("Cam_StartPoint", 0.5)


func _on_terminal_button_button_pushed_down():
	var newCube = load("res://Objects/box.tscn").instantiate()
	newCube.position = $CubeSpawnPoint.position
	add_child(newCube)


func _on_main_select_go_click_test():
	$GameAnimation.play("Pos3", 0.5)
