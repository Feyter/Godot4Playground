extends Node3D

signal button_pushed_down
signal button_released

var isPressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event.is_pressed():
		isPressed = true
		emit_signal("button_pushed_down")
		$AnimationPlayer.play("01_push")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "01_push" and isPressed:
		isPressed = false
		$AnimationPlayer.play_backwards("01_push")
	
